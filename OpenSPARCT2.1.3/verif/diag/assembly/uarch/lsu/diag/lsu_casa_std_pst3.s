/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst3.s
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
	setx 0xd95f540efa99f83d, %g1, %r2
	setx 0x0afbcffdf033e4d4, %g1, %r3
	setx 0x0d5fcf4e2f5057a8, %g1, %r4
	setx 0x3e27f882e77274f5, %g1, %r5
	setx 0x9d913ad9ec9fa50f, %g1, %r6
	setx 0x5ce358b9e106bde0, %g1, %r7
	setx 0x7bb5319a0f3bcb6e, %g1, %r8

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
	.word 0xc7f2913f  ! 1: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xd302c01f  ! 2: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc5ba98bf  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa048  ! 5: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2901f  ! 6: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcccad01f  ! 7: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r6
	.word 0xd1bad83f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d03f  ! 10: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd2ca907f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r9
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 14: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd202e06c  ! 15: LDUW_I	lduw	[%r11 + 0x006c], %r9
TH_LABEL15:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc5baa008  ! 17: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xcfbaa078  ! 18: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xcd9aa060  ! 19: LDDFA_I	ldda	[%r10, 0x0060], %f6
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba995f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
TH_LABEL25:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcecad05f  ! 26: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r7
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa058  ! 29: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xcfbad93f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce92903f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x81, %r7
	.word 0xcbba995f  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85a801f  ! 33: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd1bad81f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd122c01f  ! 35: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba995f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xd0dae028  ! 38: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r8
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc4d2905f  ! 40: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd322801f  ! 41: STF_R	st	%f9, [%r31, %r10]
	.word 0xcad2a00c  ! 42: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r5
	.word 0xcc02a068  ! 43: LDUW_I	lduw	[%r10 + 0x0068], %r6
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc64aa049  ! 46: LDSB_I	ldsb	[%r10 + 0x0049], %r3
	.word 0xc5ba997f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcdbaa030  ! 48: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xcff2901f  ! 49: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba987f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2901f  ! 51: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc48a911f  ! 52: LDUBA_R	lduba	[%r10, %r31] 0x88, %r2
	.word 0xcf02a06c  ! 53: LDF_I	ld	[%r10, 0x006c], %f7
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2911f  ! 55: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc89aa000  ! 56: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r4
	.word 0xd122801f  ! 57: STF_R	st	%f8, [%r31, %r10]
	.word 0xd01aa068  ! 58: LDD_I	ldd	[%r10 + 0x0068], %r8
	.word 0xc3bad83f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca42801f  ! 60: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf9aa060  ! 61: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xd302801f  ! 62: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc402e02c  ! 63: LDUW_I	lduw	[%r11 + 0x002c], %r2
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xce8a903f  ! 65: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2da901f  ! 66: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xd1e2901f  ! 67: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc4ca907f  ! 68: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xd1ba981f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xcb22801f  ! 72: STF_R	st	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd3bae028  ! 75: STDFA_I	stda	%f9, [0x0028, %r11]
TH_LABEL75:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcac2d01f  ! 76: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r5
	.word 0xc79ae018  ! 77: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xcdf2d01f  ! 78: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad95f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02a05c  ! 81: LDF_I	ld	[%r10, 0x005c], %f6
	.word 0xc442c01f  ! 82: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xd1ba98bf  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902e000  ! 84: LDF_I	ld	[%r11, 0x0000], %f4
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba99bf  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca5a801f  ! 87: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcbbad91f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc0ae071  ! 89: LDUB_I	ldub	[%r11 + 0x0071], %r6
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba991f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102c01f  ! 93: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc81aa040  ! 94: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xd3ba98bf  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba987f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 97: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xc302801f  ! 98: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcb02e054  ! 99: LDF_I	ld	[%r11, 0x0054], %f5
	.word 0xcfba98bf  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc692a05c  ! 101: LDUHA_I	lduha	[%r10, + 0x005c] %asi, %r3
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc20ae07e  ! 103: LDUB_I	ldub	[%r11 + 0x007e], %r1
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc2d2913f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba981f  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba993f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc39ae038  ! 110: LDDFA_I	ldda	[%r11, 0x0038], %f1
TH_LABEL110:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca02c01f  ! 111: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xc9e2911f  ! 112: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba98bf  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd02801f  ! 115: LDF_R	ld	[%r10, %r31], %f6
TH_LABEL115:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2d13f  ! 116: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d13f  ! 118: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xccda907f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xced2917f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r7
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2903f  ! 123: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2901f  ! 125: CASA_I	casa	[%r10] 0x80, %r31, %r9
TH_LABEL125:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba981f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 127: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba98bf  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79aa018  ! 131: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xd3ba983f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd212e00c  ! 133: LDUH_I	lduh	[%r11 + 0x000c], %r9
	.word 0xcdbad93f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc44ac01f  ! 136: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xc7baa010  ! 138: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xc7ba983f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc322c01f  ! 140: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcfbaa058  ! 142: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc39aa058  ! 145: LDDFA_I	ldda	[%r10, 0x0058], %f1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf9aa000  ! 146: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xcfbad8bf  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc442a074  ! 148: LDSW_I	ldsw	[%r10 + 0x0074], %r2
	.word 0xce42801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc01a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc502a048  ! 152: LDF_I	ld	[%r10, 0x0048], %f2
	.word 0xd3bad97f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd25aa068  ! 155: LDX_I	ldx	[%r10 + 0x0068], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc502a044  ! 156: LDF_I	ld	[%r10, 0x0044], %f2
	.word 0xd0cad07f  ! 157: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r8
	.word 0xcbbad89f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc49aa008  ! 160: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba981f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc292a07e  ! 162: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r1
	.word 0xd242801f  ! 163: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc3bad81f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL165:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02a03c  ! 166: LDF_I	ld	[%r10, 0x003c], %f7
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc40aa07a  ! 168: LDUB_I	ldub	[%r10 + 0x007a], %r2
	.word 0xd3bad83f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0ca903f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba995f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf9aa038  ! 172: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xc812c01f  ! 173: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xcdba997f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba991f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc68aa00c  ! 177: LDUBA_I	lduba	[%r10, + 0x000c] %asi, %r3
	.word 0xd1f2901f  ! 178: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc5bae048  ! 179: STDFA_I	stda	%f2, [0x0048, %r11]
	.word 0xc202e008  ! 180: LDUW_I	lduw	[%r11 + 0x0008], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702a038  ! 181: LDF_I	ld	[%r10, 0x0038], %f3
	.word 0xca82917f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r5
	.word 0xcdf2911f  ! 183: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcde2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd212e07e  ! 187: LDUH_I	lduh	[%r11 + 0x007e], %r9
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba991f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL190:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc442a048  ! 191: LDSW_I	ldsw	[%r10 + 0x0048], %r2
	.word 0xc20aa002  ! 192: LDUB_I	ldub	[%r10 + 0x0002], %r1
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba985f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0c2905f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 197: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcfbae050  ! 199: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xc4d2901f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba983f  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc7bae038  ! 203: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xcff2d11f  ! 204: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad81f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad81f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xced2a022  ! 207: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r7
	.word 0xcb02801f  ! 208: LDF_R	ld	[%r10, %r31], %f5
	.word 0xccdaa040  ! 209: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r6
	.word 0xc5bad91f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL210:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad9bf  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc42e024  ! 213: LDSW_I	ldsw	[%r11 + 0x0024], %r6
	.word 0xc9ba981f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482a000  ! 216: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r2
	.word 0xd0caa05c  ! 217: LDSBA_I	ldsba	[%r10, + 0x005c] %asi, %r8
	.word 0xc292d11f  ! 218: LDUHA_R	lduha	[%r11, %r31] 0x88, %r1
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc202e06c  ! 220: LDUW_I	lduw	[%r11 + 0x006c], %r1
TH_LABEL220:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba993f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 222: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc2cad17f  ! 223: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xc802a004  ! 224: LDUW_I	lduw	[%r10 + 0x0004], %r4
	.word 0xcbba987f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc702801f  ! 226: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcbbad8bf  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc452a060  ! 229: LDSH_I	ldsh	[%r10 + 0x0060], %r2
	.word 0xc3ba997f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbaa000  ! 231: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xcf22801f  ! 232: STF_R	st	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba983f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc60ae004  ! 235: LDUB_I	ldub	[%r11 + 0x0004], %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd00ac01f  ! 236: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc59ae040  ! 239: LDDFA_I	ldda	[%r11, 0x0040], %f2
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
TH_LABEL240:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad89f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd092e060  ! 243: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r8
	.word 0xd092a002  ! 244: LDUHA_I	lduha	[%r10, + 0x0002] %asi, %r8
	.word 0xc3bad93f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc81ae050  ! 246: LDD_I	ldd	[%r11 + 0x0050], %r4
	.word 0xc3ba991f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd09aa050  ! 248: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r8
	.word 0xc502801f  ! 249: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfba985f  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca52801f  ! 251: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xccc2d17f  ! 252: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r6
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2903f  ! 254: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82903f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r6
	.word 0xd322801f  ! 257: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa028  ! 259: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xcde2901f  ! 260: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba983f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca5aa070  ! 265: LDX_I	ldx	[%r10 + 0x0070], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bae050  ! 266: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xc5ba995f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd00ac01f  ! 268: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc6c2d07f  ! 270: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5f2903f  ! 271: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba989f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc502801f  ! 274: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL275:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2901f  ! 276: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2903f  ! 277: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcd02a008  ! 278: LDF_I	ld	[%r10, 0x0008], %f6
	.word 0xc7f2903f  ! 279: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc452801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa068  ! 281: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xc482907f  ! 282: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r2
	.word 0xc9ba995f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2d17f  ! 284: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r7
	.word 0xc252a036  ! 285: LDSH_I	ldsh	[%r10 + 0x0036], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc322801f  ! 286: STF_R	st	%f1, [%r31, %r10]
	.word 0xced2e05e  ! 287: LDSHA_I	ldsha	[%r11, + 0x005e] %asi, %r7
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc8d2913f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xcc42801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2903f  ! 291: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba985f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 293: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xca0aa07b  ! 294: LDUB_I	ldub	[%r10 + 0x007b], %r5
	.word 0xc68aa008  ! 295: LDUBA_I	lduba	[%r10, + 0x0008] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce92e064  ! 296: LDUHA_I	lduha	[%r11, + 0x0064] %asi, %r7
	.word 0xc9ba991f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba995f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba99bf  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 302: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc5bae068  ! 303: STDFA_I	stda	%f2, [0x0068, %r11]
	.word 0xd1e2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc322801f  ! 305: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc2d2a042  ! 309: LDSHA_I	ldsha	[%r10, + 0x0042] %asi, %r1
	.word 0xcd9aa058  ! 310: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad81f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2d2901f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xc9e2901f  ! 313: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xd102a038  ! 314: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xd00a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9f2911f  ! 316: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba981f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc6c2e068  ! 319: LDSWA_I	ldswa	[%r11, + 0x0068] %asi, %r3
	.word 0xc3ba993f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba999f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39aa030  ! 322: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba999f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc702a020  ! 326: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xd092901f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc3e2d03f  ! 328: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad97f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2d01f  ! 331: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xccdad17f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r6
	.word 0xd212a028  ! 333: LDUH_I	lduh	[%r10 + 0x0028], %r9
	.word 0xd012a078  ! 334: LDUH_I	lduh	[%r10 + 0x0078], %r8
	.word 0xcac2905f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad87f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc642e068  ! 337: LDSW_I	ldsw	[%r11 + 0x0068], %r3
	.word 0xd322801f  ! 338: STF_R	st	%f9, [%r31, %r10]
	.word 0xc5ba985f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce52a002  ! 341: LDSH_I	ldsh	[%r10 + 0x0002], %r7
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc48aa04d  ! 343: LDUBA_I	lduba	[%r10, + 0x004d] %asi, %r2
	.word 0xd3e2d01f  ! 344: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xd25ac01f  ! 347: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca02c01f  ! 350: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad9bf  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2d01f  ! 353: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xcbf2913f  ! 354: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc522801f  ! 355: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702e054  ! 356: LDF_I	ld	[%r11, 0x0054], %f3
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d11f  ! 358: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xc9baa040  ! 359: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
TH_LABEL360:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc502a010  ! 361: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xc9ba983f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc322801f  ! 363: STF_R	st	%f1, [%r31, %r10]
	.word 0xcff2903f  ! 364: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba999f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9ae058  ! 368: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xc5bad91f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL370:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad85f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc302a014  ! 372: LDF_I	ld	[%r10, 0x0014], %f1
	.word 0xc9bad81f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02801f  ! 374: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3e2d01f  ! 375: CASA_I	casa	[%r11] 0x80, %r31, %r1
TH_LABEL375:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad97f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd052a05a  ! 384: LDSH_I	ldsh	[%r10 + 0x005a], %r8
	.word 0xc8d2915f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
TH_LABEL385:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa078  ! 386: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xcd22801f  ! 387: STF_R	st	%f6, [%r31, %r10]
	.word 0xcfe2901f  ! 388: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd092e010  ! 391: LDUHA_I	lduha	[%r11, + 0x0010] %asi, %r8
	.word 0xd1ba987f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2913f  ! 395: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba999f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702801f  ! 397: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7ba983f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 400: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba981f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 403: STF_R	st	%f3, [%r31, %r10]
	.word 0xc322801f  ! 404: STF_R	st	%f1, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0d2903f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xce82911f  ! 407: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xd3f2901f  ! 408: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2901f  ! 409: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd2dad15f  ! 410: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccc2e03c  ! 411: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r6
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc60aa012  ! 414: LDUB_I	ldub	[%r10 + 0x0012], %r3
	.word 0xd2caa07a  ! 415: LDSBA_I	ldsba	[%r10, + 0x007a] %asi, %r9
TH_LABEL415:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd082a018  ! 416: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r8
	.word 0xca02801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcdbae018  ! 418: STDFA_I	stda	%f6, [0x0018, %r11]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2913f  ! 420: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcd22801f  ! 422: STF_R	st	%f6, [%r31, %r10]
	.word 0xc9f2d01f  ! 423: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc692e058  ! 426: LDUHA_I	lduha	[%r11, + 0x0058] %asi, %r3
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba987f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc1a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd2c2e044  ! 430: LDSWA_I	ldswa	[%r11, + 0x0044] %asi, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd242801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc5baa000  ! 434: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xce92a018  ! 435: LDUHA_I	lduha	[%r10, + 0x0018] %asi, %r7
TH_LABEL435:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad85f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc722c01f  ! 439: STF_R	st	%f3, [%r31, %r11]
	.word 0xd122801f  ! 440: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba981f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xcc1ae058  ! 444: LDD_I	ldd	[%r11 + 0x0058], %r6
	.word 0xcbbae010  ! 445: STDFA_I	stda	%f5, [0x0010, %r11]
TH_LABEL445:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc59ae018  ! 446: LDDFA_I	ldda	[%r11, 0x0018], %f2
	.word 0xd39ae028  ! 447: LDDFA_I	ldda	[%r11, 0x0028], %f9
	.word 0xd1ba991f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce12801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc9ba99bf  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc20aa049  ! 455: LDUB_I	ldub	[%r10 + 0x0049], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca52c01f  ! 456: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xd3ba997f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc92913f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2911f  ! 461: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba981f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba987f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcecaa041  ! 467: LDSBA_I	ldsba	[%r10, + 0x0041] %asi, %r7
	.word 0xcfbad97f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2c2a054  ! 469: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r1
	.word 0xc3e2901f  ! 470: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba985f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 473: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc99ae038  ! 474: LDDFA_I	ldda	[%r11, 0x0038], %f4
	.word 0xc4c2917f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r2
TH_LABEL475:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba993f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 477: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba98bf  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba981f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba983f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcec2901f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xca4ac01f  ! 485: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2903f  ! 486: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xd0ca905f  ! 487: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r8
	.word 0xd302801f  ! 488: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd202a060  ! 489: LDUW_I	lduw	[%r10 + 0x0060], %r9
	.word 0xd3ba983f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL490:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28a911f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x88, %r1
	.word 0xc602801f  ! 492: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcff2903f  ! 493: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba991f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc522801f  ! 498: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcd22801f  ! 502: STF_R	st	%f6, [%r31, %r10]
	.word 0xd0d2913f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r8
	.word 0xcd02a028  ! 504: LDF_I	ld	[%r10, 0x0028], %f6
	.word 0xd1baa058  ! 505: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba993f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba989f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc01a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xcdf2911f  ! 510: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2913f  ! 511: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcde2901f  ! 512: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba991f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba997f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce12801f  ! 519: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc322801f  ! 521: STF_R	st	%f1, [%r31, %r10]
	.word 0xc702a03c  ! 522: LDF_I	ld	[%r10, 0x003c], %f3
	.word 0xcfba987f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc41ae078  ! 524: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xd302e068  ! 525: LDF_I	ld	[%r11, 0x0068], %f9
TH_LABEL525:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc722801f  ! 527: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1e2d11f  ! 528: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xc2dad05f  ! 529: LDXA_R	ldxa	[%r11, %r31] 0x82, %r1
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce8a917f  ! 531: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r7
	.word 0xcdba981f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2911f  ! 534: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcc82917f  ! 538: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r6
	.word 0xd0c2911f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r8
	.word 0xcbba991f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8d2903f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r4
	.word 0xd3e2901f  ! 542: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb22c01f  ! 545: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2d03f  ! 546: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d01f  ! 548: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad8bf  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcacae061  ! 551: LDSBA_I	ldsba	[%r11, + 0x0061] %asi, %r5
	.word 0xcbba987f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2913f  ! 554: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba993f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba993f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc60aa027  ! 559: LDUB_I	ldub	[%r10 + 0x0027], %r3
	.word 0xc44a801f  ! 560: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad91f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d03f  ! 562: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad81f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcf9aa038  ! 565: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcd22801f  ! 566: STF_R	st	%f6, [%r31, %r10]
	.word 0xc85a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd122c01f  ! 568: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5bad97f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc202a05c  ! 570: LDUW_I	lduw	[%r10 + 0x005c], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca4ae00f  ! 571: LDSB_I	ldsb	[%r11 + 0x000f], %r5
	.word 0xc5bad95f  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc88a911f  ! 573: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xccd2a02c  ! 574: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r6
	.word 0xd1ba981f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd04a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc6ca913f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xd1e2911f  ! 579: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc2da915f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc692d03f  ! 581: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc20aa07a  ! 583: LDUB_I	ldub	[%r10 + 0x007a], %r1
	.word 0xccdaa018  ! 584: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r6
	.word 0xd2dae060  ! 585: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba995f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca5aa078  ! 587: LDX_I	ldx	[%r10 + 0x0078], %r5
	.word 0xc28ae04a  ! 588: LDUBA_I	lduba	[%r11, + 0x004a] %asi, %r1
	.word 0xd322801f  ! 589: STF_R	st	%f9, [%r31, %r10]
	.word 0xc7bad95f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbaa030  ! 591: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xd1bae040  ! 592: STDFA_I	stda	%f8, [0x0040, %r11]
	.word 0xc9e2911f  ! 593: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba989f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc99aa028  ! 595: LDDFA_I	ldda	[%r10, 0x0028], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcde2901f  ! 596: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc42801f  ! 597: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xca52a074  ! 598: LDSH_I	ldsh	[%r10 + 0x0074], %r5
	.word 0xcbba983f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba989f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba981f  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcfbaa030  ! 604: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xc3ba991f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba985f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902e010  ! 607: LDF_I	ld	[%r11, 0x0010], %f4
	.word 0xcb9aa000  ! 608: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xcff2913f  ! 609: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba993f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302a070  ! 611: LDF_I	ld	[%r10, 0x0070], %f9
	.word 0xc302801f  ! 612: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd3e2901f  ! 613: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba995f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba981f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca92911f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xccc2a018  ! 619: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r6
	.word 0xc9ba98bf  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcec2a038  ! 621: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r7
	.word 0xc40ac01f  ! 622: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcad2d17f  ! 624: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r5
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc882913f  ! 626: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r4
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcbbaa038  ! 628: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xd39aa008  ! 629: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xc3baa028  ! 630: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02801f  ! 631: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd1ba981f  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc322801f  ! 633: STF_R	st	%f1, [%r31, %r10]
	.word 0xd25a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba981f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xce5a801f  ! 638: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc3bad9bf  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc81ac01f  ! 641: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd0d2905f  ! 642: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
	.word 0xc28a905f  ! 643: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcd22801f  ! 645: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39aa068  ! 646: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xc412c01f  ! 647: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xced2a07e  ! 648: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r7
	.word 0xc25ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc44ae04d  ! 650: LDSB_I	ldsb	[%r11 + 0x004d], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d13f  ! 652: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcedad07f  ! 653: LDXA_R	ldxa	[%r11, %r31] 0x83, %r7
	.word 0xc3ba981f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL655:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd212801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd3f2d13f  ! 657: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xcad2903f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xc39ae018  ! 659: LDDFA_I	ldda	[%r11, 0x0018], %f1
	.word 0xd3ba983f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba987f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba995f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca52a01a  ! 666: LDSH_I	ldsh	[%r10 + 0x001a], %r5
	.word 0xcbbaa060  ! 667: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcdba981f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc812c01f  ! 670: LDUH_R	lduh	[%r11 + %r31], %r4
TH_LABEL670:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2913f  ! 671: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcfbaa078  ! 673: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xc5ba999f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc0ac01f  ! 675: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad9bf  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce92a00a  ! 677: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r7
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcb02801f  ! 679: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfe2913f  ! 680: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcff2911f  ! 681: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2913f  ! 683: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc59aa040  ! 684: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xc8cad07f  ! 685: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc65a801f  ! 686: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcdbae040  ! 687: STDFA_I	stda	%f6, [0x0040, %r11]
	.word 0xce82a04c  ! 688: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r7
	.word 0xd39ae000  ! 689: LDDFA_I	ldda	[%r11, 0x0000], %f9
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc52801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc41a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3ba993f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa040  ! 694: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xcc0aa008  ! 695: LDUB_I	ldub	[%r10 + 0x0008], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2c2a078  ! 696: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r1
	.word 0xcfe2901f  ! 697: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcac2901f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xd1bad81f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc20ae055  ! 700: LDUB_I	ldub	[%r11 + 0x0055], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc202801f  ! 701: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3f2d13f  ! 702: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc84ae043  ! 704: LDSB_I	ldsb	[%r11 + 0x0043], %r4
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2911f  ! 707: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xcb22801f  ! 708: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad81f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL710:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce8a911f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xc5baa078  ! 712: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2911f  ! 714: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc492a02c  ! 715: LDUHA_I	lduha	[%r10, + 0x002c] %asi, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd9aa010  ! 718: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xca42a05c  ! 719: LDSW_I	ldsw	[%r10 + 0x005c], %r5
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad89f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcad2913f  ! 722: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xcfbad9bf  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 725: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad83f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc612c01f  ! 728: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xd3bae008  ! 729: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xc45a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2913f  ! 731: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc24aa029  ! 732: LDSB_I	ldsb	[%r10 + 0x0029], %r1
	.word 0xc8c2901f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xca42a010  ! 734: LDSW_I	ldsw	[%r10 + 0x0010], %r5
	.word 0xc84aa058  ! 735: LDSB_I	ldsb	[%r10 + 0x0058], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba987f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22c01f  ! 737: STF_R	st	%f7, [%r31, %r11]
	.word 0xc9ba983f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc842a070  ! 740: LDSW_I	ldsw	[%r10 + 0x0070], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba999f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 744: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcff2901f  ! 746: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd39aa058  ! 747: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xcfba991f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 749: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc882e014  ! 750: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc25ae040  ! 751: LDX_I	ldx	[%r11 + 0x0040], %r1
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba98bf  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcbbaa060  ! 755: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce5ae030  ! 756: LDX_I	ldx	[%r11 + 0x0030], %r7
	.word 0xd05ae050  ! 757: LDX_I	ldx	[%r11 + 0x0050], %r8
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcfbaa030  ! 759: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xc4c2e068  ! 760: LDSWA_I	ldswa	[%r11, + 0x0068] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba983f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd292a014  ! 762: LDUHA_I	lduha	[%r10, + 0x0014] %asi, %r9
	.word 0xd122801f  ! 763: STF_R	st	%f8, [%r31, %r10]
	.word 0xc9ba987f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb02e014  ! 765: LDF_I	ld	[%r11, 0x0014], %f5
TH_LABEL765:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2911f  ! 766: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba98bf  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc81aa008  ! 770: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba98bf  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcecae01f  ! 773: LDSBA_I	ldsba	[%r11, + 0x001f] %asi, %r7
	.word 0xc7ba989f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 776: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc85a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd302801f  ! 778: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3bad93f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6da901f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d01f  ! 782: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad83f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc4ca903f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r2
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba993f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba98bf  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa008  ! 789: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xcdba989f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc01aa018  ! 792: LDD_I	ldd	[%r10 + 0x0018], %r0
	.word 0xcd02a078  ! 793: LDF_I	ld	[%r10, 0x0078], %f6
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcb22801f  ! 795: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba991f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd0da901f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xc7ba989f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba995f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc892a024  ! 806: LDUHA_I	lduha	[%r10, + 0x0024] %asi, %r4
	.word 0xc28a913f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x89, %r1
	.word 0xc39aa078  ! 808: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xd08ae031  ! 809: LDUBA_I	lduba	[%r11, + 0x0031] %asi, %r8
	.word 0xd25a801f  ! 810: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba995f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc85aa050  ! 813: LDX_I	ldx	[%r10 + 0x0050], %r4
	.word 0xc7e2913f  ! 814: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba997f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc902801f  ! 816: LDF_R	ld	[%r10, %r31], %f4
	.word 0xce42801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcb02a04c  ! 818: LDF_I	ld	[%r10, 0x004c], %f5
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd08a915f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc6d2d05f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xc6daa000  ! 823: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r3
	.word 0xd3ba993f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce82e048  ! 825: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba987f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf22c01f  ! 827: STF_R	st	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad81f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85ae040  ! 832: LDX_I	ldx	[%r11 + 0x0040], %r4
	.word 0xce02a048  ! 833: LDUW_I	lduw	[%r10 + 0x0048], %r7
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc25a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd20a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad99f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc52801f  ! 839: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd1bae018  ! 840: STDFA_I	stda	%f8, [0x0018, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcb9aa040  ! 841: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba983f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8caa018  ! 844: LDSBA_I	ldsba	[%r10, + 0x0018] %asi, %r4
	.word 0xc3e2903f  ! 845: CASA_I	casa	[%r10] 0x81, %r31, %r1
TH_LABEL845:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc702a07c  ! 846: LDF_I	ld	[%r10, 0x007c], %f3
	.word 0xc5e2911f  ! 847: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2913f  ! 848: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcdbaa008  ! 850: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad87f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d01f  ! 852: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad9bf  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc892a002  ! 856: LDUHA_I	lduha	[%r10, + 0x0002] %asi, %r4
	.word 0xcdbaa028  ! 857: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba987f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd042801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xca82e030  ! 862: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r5
	.word 0xc5ba98bf  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd04ae005  ! 865: LDSB_I	ldsb	[%r11 + 0x0005], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc212a038  ! 866: LDUH_I	lduh	[%r10 + 0x0038], %r1
	.word 0xc5bae040  ! 867: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xc9e2901f  ! 868: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbae050  ! 870: STDFA_I	stda	%f6, [0x0050, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0c2a004  ! 871: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r8
	.word 0xc9e2d01f  ! 872: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad99f  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302801f  ! 875: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba981f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc4daa078  ! 880: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r2
TH_LABEL880:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd042801f  ! 881: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xcc82a01c  ! 882: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r6
	.word 0xc3bad95f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd302801f  ! 885: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc99ae030  ! 886: LDDFA_I	ldda	[%r11, 0x0030], %f4
	.word 0xc65ae038  ! 887: LDX_I	ldx	[%r11 + 0x0038], %r3
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba985f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc322801f  ! 891: STF_R	st	%f1, [%r31, %r10]
	.word 0xd082e008  ! 892: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r8
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc59ae058  ! 895: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc302a000  ! 896: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xc902a024  ! 897: LDF_I	ld	[%r10, 0x0024], %f4
	.word 0xc9bad87f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80a801f  ! 900: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc202a048  ! 901: LDUW_I	lduw	[%r10 + 0x0048], %r1
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad9bf  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad85f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf02e05c  ! 907: LDF_I	ld	[%r11, 0x005c], %f7
	.word 0xc64ae052  ! 908: LDSB_I	ldsb	[%r11 + 0x0052], %r3
	.word 0xc7ba981f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1bae008  ! 910: STDFA_I	stda	%f8, [0x0008, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba987f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca02a034  ! 912: LDUW_I	lduw	[%r10 + 0x0034], %r5
	.word 0xd1ba99bf  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcfbaa008  ! 915: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba983f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302e04c  ! 917: LDF_I	ld	[%r11, 0x004c], %f9
	.word 0xc9bae030  ! 918: STDFA_I	stda	%f4, [0x0030, %r11]
	.word 0xcdf2d11f  ! 919: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xca4a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc402c01f  ! 921: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xce42a004  ! 923: LDSW_I	ldsw	[%r10 + 0x0004], %r7
	.word 0xc852801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc7e2d11f  ! 925: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3baa078  ! 926: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xc2d2d15f  ! 927: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r1
	.word 0xc892e07c  ! 928: LDUHA_I	lduha	[%r11, + 0x007c] %asi, %r4
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d13f  ! 930: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfe2d03f  ! 931: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d01f  ! 934: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xc79aa068  ! 935: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 937: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xc9baa010  ! 938: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc41aa040  ! 940: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad89f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc802801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcfbaa078  ! 943: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcf02a030  ! 945: LDF_I	ld	[%r10, 0x0030], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba99bf  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2d2a044  ! 949: LDSHA_I	ldsha	[%r10, + 0x0044] %asi, %r1
	.word 0xc7e2911f  ! 950: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba985f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba99bf  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd09aa048  ! 956: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xc6dae040  ! 957: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r3
	.word 0xcc0aa041  ! 958: LDUB_I	ldub	[%r10 + 0x0041], %r6
	.word 0xc6c2917f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xca82e048  ! 960: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba983f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba999f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc482e01c  ! 964: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r2
	.word 0xcbba993f  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbe2901f  ! 966: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba999f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 968: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba993f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc4ca907f  ! 971: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc20aa073  ! 974: LDUB_I	ldub	[%r10 + 0x0073], %r1
	.word 0xcbba997f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc502801f  ! 977: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5ba985f  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092a02e  ! 979: LDUHA_I	lduha	[%r10, + 0x002e] %asi, %r8
	.word 0xd1f2911f  ! 980: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2daa010  ! 981: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r1
	.word 0xd1ba99bf  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282e02c  ! 983: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r9
	.word 0xc9ba997f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL985:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba999f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa008  ! 987: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xc922801f  ! 988: STF_R	st	%f4, [%r31, %r10]
	.word 0xc442a074  ! 989: LDSW_I	ldsw	[%r10 + 0x0074], %r2
	.word 0xc39aa010  ! 990: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xcc1ae020  ! 992: LDD_I	ldd	[%r11 + 0x0020], %r6
	.word 0xc7bad83f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc282a014  ! 994: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r1
	.word 0xcbba987f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd092e04c  ! 997: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r8
	.word 0xcbe2d13f  ! 998: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad81f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc882901f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xc7f2901f  ! 1: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc902801f  ! 2: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc5ba987f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd1baa030  ! 5: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3f2913f  ! 6: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcecad11f  ! 7: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r7
	.word 0xd1bad91f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d01f  ! 10: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
TH_LABEL10:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4cad11f  ! 11: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r2
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 14: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcc02e060  ! 15: LDUW_I	lduw	[%r11 + 0x0060], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc7baa060  ! 17: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc3baa028  ! 18: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc79ae030  ! 19: LDDFA_I	ldda	[%r11, 0x0030], %f3
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba995f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcaca901f  ! 26: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba983f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19ae078  ! 29: LDDFA_I	ldda	[%r11, 0x0078], %f8
	.word 0xcfbad85f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca92911f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xcbba98bf  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc45a801f  ! 33: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd1bad8bf  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc922801f  ! 35: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc4daa040  ! 38: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r2
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd2d2d05f  ! 40: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd322801f  ! 41: STF_R	st	%f9, [%r31, %r10]
	.word 0xd0d2a06c  ! 42: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r8
	.word 0xce02e024  ! 43: LDUW_I	lduw	[%r11 + 0x0024], %r7
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc24aa042  ! 46: LDSB_I	ldsb	[%r10 + 0x0042], %r1
	.word 0xc5ba999f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd3bae058  ! 48: STDFA_I	stda	%f9, [0x0058, %r11]
	.word 0xcff2911f  ! 49: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2901f  ! 51: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xce8a905f  ! 52: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xc902a024  ! 53: LDF_I	ld	[%r10, 0x0024], %f4
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2901f  ! 55: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd09aa028  ! 56: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r8
	.word 0xc922c01f  ! 57: STF_R	st	%f4, [%r31, %r11]
	.word 0xcc1aa058  ! 58: LDD_I	ldd	[%r10 + 0x0058], %r6
	.word 0xc3bad89f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc442c01f  ! 60: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd19aa040  ! 61: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xcb02801f  ! 62: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd002a070  ! 63: LDUW_I	lduw	[%r10 + 0x0070], %r8
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc28ad17f  ! 65: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc8da911f  ! 66: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xd1e2901f  ! 67: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc4cad01f  ! 68: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xd1ba981f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xcb22801f  ! 72: STF_R	st	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba995f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc5baa018  ! 75: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2c2d13f  ! 76: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xcf9ae040  ! 77: LDDFA_I	ldda	[%r11, 0x0040], %f7
	.word 0xcdf2d03f  ! 78: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad99f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc302a06c  ! 81: LDF_I	ld	[%r10, 0x006c], %f1
	.word 0xca42c01f  ! 82: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xd1ba987f  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902a058  ! 84: LDF_I	ld	[%r10, 0x0058], %f4
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
TH_LABEL85:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba983f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd05ac01f  ! 87: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xcbbad91f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd00ae002  ! 89: LDUB_I	ldub	[%r11 + 0x0002], %r8
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba985f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc902c01f  ! 93: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd01aa010  ! 94: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xd3ba997f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba981f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 97: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xcb02c01f  ! 98: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc902a068  ! 99: LDF_I	ld	[%r10, 0x0068], %f4
	.word 0xcfba995f  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL100:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd292a004  ! 101: LDUHA_I	lduha	[%r10, + 0x0004] %asi, %r9
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd20aa072  ! 103: LDUB_I	ldub	[%r10 + 0x0072], %r9
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc8d2913f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba999f  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xd39ae028  ! 110: LDDFA_I	ldda	[%r11, 0x0028], %f9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc802801f  ! 111: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc9e2901f  ! 112: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba999f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702801f  ! 115: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2d11f  ! 116: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d01f  ! 118: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xceda905f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x82, %r7
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc6d2d05f  ! 121: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2901f  ! 123: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2903f  ! 125: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba991f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 127: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba981f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc59ae020  ! 131: LDDFA_I	ldda	[%r11, 0x0020], %f2
	.word 0xd3ba993f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd212a010  ! 133: LDUH_I	lduh	[%r10 + 0x0010], %r9
	.word 0xcdbad81f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc84a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1bae008  ! 138: STDFA_I	stda	%f8, [0x0008, %r11]
	.word 0xc7ba987f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 140: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3baa018  ! 142: STDFA_I	stda	%f9, [0x0018, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcb9ae000  ! 145: LDDFA_I	ldda	[%r11, 0x0000], %f5
TH_LABEL145:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd9ae008  ! 146: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xcfbad83f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd042a008  ! 148: LDSW_I	ldsw	[%r10 + 0x0008], %r8
	.word 0xc242801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc41a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcf02e070  ! 152: LDF_I	ld	[%r11, 0x0070], %f7
	.word 0xd3bad81f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65aa070  ! 155: LDX_I	ldx	[%r10 + 0x0070], %r3
TH_LABEL155:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502a018  ! 156: LDF_I	ld	[%r10, 0x0018], %f2
	.word 0xceca901f  ! 157: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcbbad97f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc49aa070  ! 160: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba981f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc892a024  ! 162: LDUHA_I	lduha	[%r10, + 0x0024] %asi, %r4
	.word 0xd242c01f  ! 163: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc3bad83f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc302e060  ! 166: LDF_I	ld	[%r11, 0x0060], %f1
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc80aa07d  ! 168: LDUB_I	ldub	[%r10 + 0x007d], %r4
	.word 0xd3bad9bf  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2ca905f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba995f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd19aa030  ! 172: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xce12801f  ! 173: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xcdba987f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba981f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd08ae03b  ! 177: LDUBA_I	lduba	[%r11, + 0x003b] %asi, %r8
	.word 0xd1f2903f  ! 178: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xcbbaa038  ! 179: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xce02e030  ! 180: LDUW_I	lduw	[%r11 + 0x0030], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd102a014  ! 181: LDF_I	ld	[%r10, 0x0014], %f8
	.word 0xca82901f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r5
	.word 0xcdf2901f  ! 183: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2903f  ! 186: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xca12a06c  ! 187: LDUH_I	lduh	[%r10 + 0x006c], %r5
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba981f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd042e034  ! 191: LDSW_I	ldsw	[%r11 + 0x0034], %r8
	.word 0xca0aa011  ! 192: LDUB_I	ldub	[%r10 + 0x0011], %r5
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba997f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2c2913f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r9
TH_LABEL195:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 197: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9baa078  ! 199: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xccd2901f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba98bf  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1baa018  ! 203: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xcff2d13f  ! 204: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad95f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL205:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad8bf  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccd2e062  ! 207: LDSHA_I	ldsha	[%r11, + 0x0062] %asi, %r6
	.word 0xd102801f  ! 208: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd2daa018  ! 209: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r9
	.word 0xc5bad81f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad8bf  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd042a01c  ! 213: LDSW_I	ldsw	[%r10 + 0x001c], %r8
	.word 0xc9ba99bf  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc682a03c  ! 216: LDUWA_I	lduwa	[%r10, + 0x003c] %asi, %r3
	.word 0xd2caa07f  ! 217: LDSBA_I	ldsba	[%r10, + 0x007f] %asi, %r9
	.word 0xc492905f  ! 218: LDUHA_R	lduha	[%r10, %r31] 0x82, %r2
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca02a004  ! 220: LDUW_I	lduw	[%r10 + 0x0004], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba991f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 222: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc4ca901f  ! 223: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xcc02e02c  ! 224: LDUW_I	lduw	[%r11 + 0x002c], %r6
	.word 0xcbba991f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc702801f  ! 226: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcbbad87f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcc52a00c  ! 229: LDSH_I	ldsh	[%r10 + 0x000c], %r6
	.word 0xc3ba989f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3baa000  ! 231: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xc722801f  ! 232: STF_R	st	%f3, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba981f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc40aa06f  ! 235: LDUB_I	ldub	[%r10 + 0x006f], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd20ac01f  ! 236: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19ae018  ! 239: LDDFA_I	ldda	[%r11, 0x0018], %f8
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad89f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd292a04a  ! 243: LDUHA_I	lduha	[%r10, + 0x004a] %asi, %r9
	.word 0xc292a078  ! 244: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r1
	.word 0xc3bad81f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc1ae070  ! 246: LDD_I	ldd	[%r11 + 0x0070], %r6
	.word 0xc3ba993f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd09aa050  ! 248: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r8
	.word 0xc902c01f  ! 249: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcfba99bf  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc252c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd0c2d01f  ! 252: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 254: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc682905f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r3
	.word 0xc922c01f  ! 257: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3ba997f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59aa040  ! 259: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xcde2903f  ! 260: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba991f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc65ae078  ! 265: LDX_I	ldx	[%r11 + 0x0078], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bae048  ! 266: STDFA_I	stda	%f3, [0x0048, %r11]
	.word 0xc5ba993f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc40a801f  ! 268: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc6c2901f  ! 270: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2903f  ! 271: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba981f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc302801f  ! 274: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2911f  ! 276: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2901f  ! 277: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xcd02a020  ! 278: LDF_I	ld	[%r10, 0x0020], %f6
	.word 0xc7f2913f  ! 279: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc252c01f  ! 280: LDSH_R	ldsh	[%r11 + %r31], %r1
TH_LABEL280:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd19aa050  ! 281: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xc482905f  ! 282: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r2
	.word 0xc9ba989f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xccc2d13f  ! 284: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xc652a04e  ! 285: LDSH_I	ldsh	[%r10 + 0x004e], %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd122801f  ! 286: STF_R	st	%f8, [%r31, %r10]
	.word 0xd0d2a036  ! 287: LDSHA_I	ldsha	[%r10, + 0x0036] %asi, %r8
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcad2911f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xc842801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2901f  ! 291: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 293: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xce0aa03d  ! 294: LDUB_I	ldub	[%r10 + 0x003d], %r7
	.word 0xc88ae07b  ! 295: LDUBA_I	lduba	[%r11, + 0x007b] %asi, %r4
TH_LABEL295:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc292a07e  ! 296: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r1
	.word 0xc9ba987f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba99bf  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba983f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502c01f  ! 302: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd3baa038  ! 303: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xd1e2913f  ! 304: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc322c01f  ! 305: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba993f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc2d2e058  ! 309: LDSHA_I	ldsha	[%r11, + 0x0058] %asi, %r1
	.word 0xc59aa068  ! 310: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad89f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccd2d17f  ! 312: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xc9e2911f  ! 313: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xcf02a05c  ! 314: LDF_I	ld	[%r10, 0x005c], %f7
	.word 0xc20a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r1
TH_LABEL315:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2903f  ! 316: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba985f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcac2a05c  ! 319: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r5
	.word 0xc3ba981f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba99bf  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc79aa040  ! 322: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba98bf  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf02a078  ! 326: LDF_I	ld	[%r10, 0x0078], %f7
	.word 0xce92917f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xc3e2d11f  ! 328: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad9bf  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL330:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3e2d01f  ! 331: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xd0dad11f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x88, %r8
	.word 0xd012a04a  ! 333: LDUH_I	lduh	[%r10 + 0x004a], %r8
	.word 0xd012a01c  ! 334: LDUH_I	lduh	[%r10 + 0x001c], %r8
	.word 0xc6c2907f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r3
TH_LABEL335:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad97f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc442e03c  ! 337: LDSW_I	ldsw	[%r11 + 0x003c], %r2
	.word 0xcd22801f  ! 338: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5ba983f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc652e04e  ! 341: LDSH_I	ldsh	[%r11 + 0x004e], %r3
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xca8aa01c  ! 343: LDUBA_I	lduba	[%r10, + 0x001c] %asi, %r5
	.word 0xd3e2d13f  ! 344: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc85a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02c01f  ! 350: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad9bf  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2d17f  ! 353: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r9
	.word 0xcbf2901f  ! 354: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcd22c01f  ! 355: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc902a074  ! 356: LDF_I	ld	[%r10, 0x0074], %f4
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d03f  ! 358: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xc5bae060  ! 359: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc302a03c  ! 361: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xc9ba985f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 363: STF_R	st	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 364: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
TH_LABEL365:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba985f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9ae028  ! 368: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xc5bad97f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad9bf  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02a01c  ! 372: LDF_I	ld	[%r10, 0x001c], %f7
	.word 0xc9bad9bf  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd02801f  ! 374: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc3e2d11f  ! 375: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad81f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad8bf  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad91f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcc52a01e  ! 384: LDSH_I	ldsh	[%r10 + 0x001e], %r6
	.word 0xc4d2905f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc39aa028  ! 386: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xcb22801f  ! 387: STF_R	st	%f5, [%r31, %r10]
	.word 0xcfe2913f  ! 388: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd092a000  ! 391: LDUHA_I	lduha	[%r10, + 0x0000] %asi, %r8
	.word 0xd1ba997f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2903f  ! 395: CASA_I	casa	[%r10] 0x81, %r31, %r8
TH_LABEL395:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba995f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902801f  ! 397: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc7ba997f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2903f  ! 400: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba985f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322c01f  ! 403: STF_R	st	%f9, [%r31, %r11]
	.word 0xc722c01f  ! 404: STF_R	st	%f3, [%r31, %r11]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcad2907f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r5
	.word 0xce82903f  ! 407: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r7
	.word 0xd3f2901f  ! 408: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2901f  ! 409: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xcada911f  ! 410: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0c2a020  ! 411: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r8
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd20ae000  ! 414: LDUB_I	ldub	[%r11 + 0x0000], %r9
	.word 0xc4caa049  ! 415: LDSBA_I	ldsba	[%r10, + 0x0049] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc882a010  ! 416: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r4
	.word 0xc202c01f  ! 417: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc5baa060  ! 418: STDFA_I	stda	%f2, [0x0060, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 420: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc722801f  ! 422: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9f2d11f  ! 423: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc892a060  ! 426: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r4
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba981f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xccc2e074  ! 430: LDSWA_I	ldswa	[%r11, + 0x0074] %asi, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc242801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc9baa020  ! 434: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc892e040  ! 435: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad81f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd122801f  ! 439: STF_R	st	%f8, [%r31, %r10]
	.word 0xc722c01f  ! 440: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba985f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc41aa070  ! 444: LDD_I	ldd	[%r10 + 0x0070], %r2
	.word 0xd3bae010  ! 445: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd39aa028  ! 446: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xc99aa048  ! 447: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xd1ba989f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc9ba981f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xd20ae062  ! 455: LDUB_I	ldub	[%r11 + 0x0062], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd252801f  ! 456: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3ba99bf  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd292903f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2913f  ! 461: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba991f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba99bf  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcacaa078  ! 467: LDSBA_I	ldsba	[%r10, + 0x0078] %asi, %r5
	.word 0xcfbad91f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcec2a020  ! 469: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r7
	.word 0xc3e2901f  ! 470: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba991f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 473: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcb9aa058  ! 474: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xcac2901f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba981f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 477: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba997f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba985f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba997f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6c2917f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xc64a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2901f  ! 486: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xd0cad15f  ! 487: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r8
	.word 0xcb02c01f  ! 488: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc602a03c  ! 489: LDUW_I	lduw	[%r10 + 0x003c], %r3
	.word 0xd3ba999f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc28a907f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xca02801f  ! 492: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcff2911f  ! 493: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba997f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb22801f  ! 498: STF_R	st	%f5, [%r31, %r10]
	.word 0xc5ba981f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcf22801f  ! 502: STF_R	st	%f7, [%r31, %r10]
	.word 0xccd2907f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r6
	.word 0xcd02a064  ! 504: LDF_I	ld	[%r10, 0x0064], %f6
	.word 0xcdbaa078  ! 505: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba993f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba981f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd01ac01f  ! 509: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xcdf2901f  ! 510: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2901f  ! 511: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2903f  ! 512: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba981f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba995f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd212801f  ! 519: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc522801f  ! 521: STF_R	st	%f2, [%r31, %r10]
	.word 0xd302e00c  ! 522: LDF_I	ld	[%r11, 0x000c], %f9
	.word 0xcfba991f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc41aa068  ! 524: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xd302a00c  ! 525: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcf22c01f  ! 527: STF_R	st	%f7, [%r31, %r11]
	.word 0xd1e2d11f  ! 528: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd2da903f  ! 529: LDXA_R	ldxa	[%r10, %r31] 0x81, %r9
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc68a901f  ! 531: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xcdba993f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2913f  ! 534: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xca82d03f  ! 538: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r5
	.word 0xc6c2917f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xcbba993f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcad2913f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xd3e2913f  ! 542: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd322801f  ! 545: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2d01f  ! 546: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d01f  ! 548: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad89f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2caa005  ! 551: LDSBA_I	ldsba	[%r10, + 0x0005] %asi, %r1
	.word 0xcbba999f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 554: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba999f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba99bf  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd00ae005  ! 559: LDUB_I	ldub	[%r11 + 0x0005], %r8
	.word 0xc24ac01f  ! 560: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad81f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 562: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad97f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc79ae030  ! 565: LDDFA_I	ldda	[%r11, 0x0030], %f3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd22801f  ! 566: STF_R	st	%f6, [%r31, %r10]
	.word 0xc85a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcb22c01f  ! 568: STF_R	st	%f5, [%r31, %r11]
	.word 0xc5bad91f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc802e01c  ! 570: LDUW_I	lduw	[%r11 + 0x001c], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc44aa054  ! 571: LDSB_I	ldsb	[%r10 + 0x0054], %r2
	.word 0xc5bad8bf  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc28a905f  ! 573: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xd2d2a050  ! 574: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r9
	.word 0xd1ba993f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc64a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc2ca907f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd1e2901f  ! 579: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd0dad03f  ! 580: LDXA_R	ldxa	[%r11, %r31] 0x81, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc892911f  ! 581: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd20ae005  ! 583: LDUB_I	ldub	[%r11 + 0x0005], %r9
	.word 0xd0dae018  ! 584: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r8
	.word 0xc6dae040  ! 585: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba989f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce5aa050  ! 587: LDX_I	ldx	[%r10 + 0x0050], %r7
	.word 0xc68aa022  ! 588: LDUBA_I	lduba	[%r10, + 0x0022] %asi, %r3
	.word 0xc522801f  ! 589: STF_R	st	%f2, [%r31, %r10]
	.word 0xc7bad93f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7baa060  ! 591: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc7baa028  ! 592: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xc9e2901f  ! 593: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc39aa000  ! 595: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2911f  ! 596: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xc642801f  ! 597: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc252a03c  ! 598: LDSH_I	ldsh	[%r10 + 0x003c], %r1
	.word 0xcbba991f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba981f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba987f  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcdbaa008  ! 604: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xc3ba999f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba981f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502e01c  ! 607: LDF_I	ld	[%r11, 0x001c], %f2
	.word 0xcd9aa010  ! 608: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xcff2911f  ! 609: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba993f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702e06c  ! 611: LDF_I	ld	[%r11, 0x006c], %f3
	.word 0xcd02801f  ! 612: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3e2901f  ! 613: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba985f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL615:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba993f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692905f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xd2c2e004  ! 619: LDSWA_I	ldswa	[%r11, + 0x0004] %asi, %r9
	.word 0xc9ba99bf  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6c2a008  ! 621: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r3
	.word 0xc40a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xced2d03f  ! 624: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r7
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
TH_LABEL625:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca82913f  ! 626: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r5
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd3baa000  ! 628: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xc99aa000  ! 629: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xcfbaa020  ! 630: STDFA_I	stda	%f7, [0x0020, %r10]
TH_LABEL630:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc702c01f  ! 631: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd1ba997f  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb22801f  ! 633: STF_R	st	%f5, [%r31, %r10]
	.word 0xc45a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba983f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xca5a801f  ! 638: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xc3bad99f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd01a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc6d2d01f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r3
	.word 0xce8ad11f  ! 643: LDUBA_R	lduba	[%r11, %r31] 0x88, %r7
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd322801f  ! 645: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc79aa040  ! 646: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xca12801f  ! 647: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xced2a026  ! 648: LDSHA_I	ldsha	[%r10, + 0x0026] %asi, %r7
	.word 0xce5a801f  ! 649: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd24aa06d  ! 650: LDSB_I	ldsb	[%r10 + 0x006d], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d13f  ! 652: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc6da913f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x89, %r3
	.word 0xc3ba983f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc612801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd3f2d03f  ! 657: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd2d2915f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r9
	.word 0xcd9aa048  ! 659: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xd3ba999f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL660:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba995f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba985f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL665:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd052a05c  ! 666: LDSH_I	ldsh	[%r10 + 0x005c], %r8
	.word 0xc5baa038  ! 667: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcdba997f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca12801f  ! 670: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1e2911f  ! 671: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc7baa028  ! 673: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xc5ba987f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd00ac01f  ! 675: LDUB_R	ldub	[%r11 + %r31], %r8
TH_LABEL675:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad81f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd292e022  ! 677: LDUHA_I	lduha	[%r11, + 0x0022] %asi, %r9
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc702c01f  ! 679: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcfe2903f  ! 680: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2901f  ! 681: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2901f  ! 683: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc99aa038  ! 684: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xc4ca913f  ! 685: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc65a801f  ! 686: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcfbaa020  ! 687: STDFA_I	stda	%f7, [0x0020, %r10]
	.word 0xc282a038  ! 688: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r1
	.word 0xc39aa040  ! 689: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc652801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcc1a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3ba99bf  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3bae048  ! 694: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xd00aa07e  ! 695: LDUB_I	ldub	[%r10 + 0x007e], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccc2a010  ! 696: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r6
	.word 0xcfe2901f  ! 697: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcac2907f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r5
	.word 0xd1bad97f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca0aa021  ! 700: LDUB_I	ldub	[%r10 + 0x0021], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca02801f  ! 701: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3f2d13f  ! 702: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd04aa003  ! 704: LDSB_I	ldsb	[%r10 + 0x0003], %r8
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 707: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcd22801f  ! 708: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad89f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd28a907f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x83, %r9
	.word 0xcbbaa018  ! 712: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 714: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xca92a078  ! 715: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa068  ! 718: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xd042a05c  ! 719: LDSW_I	ldsw	[%r10 + 0x005c], %r8
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad81f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccd2903f  ! 722: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xcfbad8bf  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d03f  ! 725: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad93f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc612801f  ! 728: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcfbae008  ! 729: STDFA_I	stda	%f7, [0x0008, %r11]
	.word 0xce5a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2901f  ! 731: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc64aa006  ! 732: LDSB_I	ldsb	[%r10 + 0x0006], %r3
	.word 0xcec2905f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r7
	.word 0xce42a03c  ! 734: LDSW_I	ldsw	[%r10 + 0x003c], %r7
	.word 0xc24ae01a  ! 735: LDSB_I	ldsb	[%r11 + 0x001a], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba985f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc722801f  ! 737: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9ba987f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42e044  ! 740: LDSW_I	ldsw	[%r11 + 0x0044], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcfba98bf  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 744: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2901f  ! 746: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcf9aa078  ! 747: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcfba981f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 749: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc882e044  ! 750: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc65ae050  ! 751: LDX_I	ldx	[%r11 + 0x0050], %r3
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba995f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcbbae040  ! 755: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc65aa028  ! 756: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xcc5aa060  ! 757: LDX_I	ldx	[%r10 + 0x0060], %r6
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc9baa048  ! 759: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xccc2a078  ! 760: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba981f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc92a00e  ! 762: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r6
	.word 0xc722c01f  ! 763: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9ba993f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102e058  ! 765: LDF_I	ld	[%r11, 0x0058], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2911f  ! 766: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba99bf  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc41aa008  ! 770: LDD_I	ldd	[%r10 + 0x0008], %r2
TH_LABEL770:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba997f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6caa05d  ! 773: LDSBA_I	ldsba	[%r10, + 0x005d] %asi, %r3
	.word 0xc7ba991f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL775:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 776: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc65a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc902c01f  ! 778: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd3bad8bf  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xccda901f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d01f  ! 782: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad97f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6ca907f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r3
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
TH_LABEL785:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba98bf  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa070  ! 789: STDFA_I	stda	%f7, [0x0070, %r10]
	.word 0xcdba989f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL790:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc1ae020  ! 792: LDD_I	ldd	[%r11 + 0x0020], %r6
	.word 0xc702e068  ! 793: LDF_I	ld	[%r11, 0x0068], %f3
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc922801f  ! 795: STF_R	st	%f4, [%r31, %r10]
TH_LABEL795:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba987f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xceda903f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x81, %r7
	.word 0xc7ba989f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba997f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba99bf  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc92a022  ! 806: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r6
	.word 0xd08a903f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x81, %r8
	.word 0xc59aa038  ! 808: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xca8aa00c  ! 809: LDUBA_I	lduba	[%r10, + 0x000c] %asi, %r5
	.word 0xca5a801f  ! 810: LDX_R	ldx	[%r10 + %r31], %r5
TH_LABEL810:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba991f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc25aa040  ! 813: LDX_I	ldx	[%r10 + 0x0040], %r1
	.word 0xc7e2901f  ! 814: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba99bf  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc502801f  ! 816: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd242801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcb02a030  ! 818: LDF_I	ld	[%r10, 0x0030], %f5
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xce8a903f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2d01f  ! 821: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc8d2d13f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r4
	.word 0xc6daa040  ! 823: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r3
	.word 0xd3ba993f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce82e074  ! 825: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba987f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc922801f  ! 827: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfbad89f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad85f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd05ae008  ! 832: LDX_I	ldx	[%r11 + 0x0008], %r8
	.word 0xce02a058  ! 833: LDUW_I	lduw	[%r10 + 0x0058], %r7
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd05ac01f  ! 835: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc40a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad8bf  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd252801f  ! 839: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcfbae020  ! 840: STDFA_I	stda	%f7, [0x0020, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc99aa020  ! 841: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba985f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0caa022  ! 844: LDSBA_I	ldsba	[%r10, + 0x0022] %asi, %r8
	.word 0xc3e2903f  ! 845: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02a028  ! 846: LDF_I	ld	[%r10, 0x0028], %f7
	.word 0xc5e2911f  ! 847: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2913f  ! 848: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcdbae058  ! 850: STDFA_I	stda	%f6, [0x0058, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bad8bf  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d01f  ! 852: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad89f  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd092a018  ! 856: LDUHA_I	lduha	[%r10, + 0x0018] %asi, %r8
	.word 0xd3baa060  ! 857: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc442c01f  ! 861: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc682e074  ! 862: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r3
	.word 0xc5ba981f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd04aa038  ! 865: LDSB_I	ldsb	[%r10 + 0x0038], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd212a04a  ! 866: LDUH_I	lduh	[%r10 + 0x004a], %r9
	.word 0xcdbaa000  ! 867: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xc9e2911f  ! 868: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba99bf  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9baa000  ! 870: STDFA_I	stda	%f4, [0x0000, %r10]
TH_LABEL870:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccc2a054  ! 871: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r6
	.word 0xc9e2d13f  ! 872: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad8bf  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd02801f  ! 875: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba999f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc8daa038  ! 880: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd242801f  ! 881: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc882e054  ! 882: LDUWA_I	lduwa	[%r11, + 0x0054] %asi, %r4
	.word 0xc3bad85f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc902801f  ! 885: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd39aa040  ! 886: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xd25ae068  ! 887: LDX_I	ldx	[%r11 + 0x0068], %r9
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba987f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL890:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf22c01f  ! 891: STF_R	st	%f7, [%r31, %r11]
	.word 0xce82e024  ! 892: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r7
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xcf9aa018  ! 895: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc302e060  ! 896: LDF_I	ld	[%r11, 0x0060], %f1
	.word 0xc302a01c  ! 897: LDF_I	ld	[%r10, 0x001c], %f1
	.word 0xc9bad93f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd20a801f  ! 900: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc02a01c  ! 901: LDUW_I	lduw	[%r10 + 0x001c], %r6
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad8bf  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
TH_LABEL905:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad93f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd102a01c  ! 907: LDF_I	ld	[%r10, 0x001c], %f8
	.word 0xd24aa041  ! 908: LDSB_I	ldsb	[%r10 + 0x0041], %r9
	.word 0xc7ba995f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbaa058  ! 910: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba995f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc602a078  ! 912: LDUW_I	lduw	[%r10 + 0x0078], %r3
	.word 0xd1ba999f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcdbaa070  ! 915: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba99bf  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02a00c  ! 917: LDF_I	ld	[%r10, 0x000c], %f7
	.word 0xd1baa028  ! 918: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xcdf2d01f  ! 919: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcc4a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce02c01f  ! 921: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc242a054  ! 923: LDSW_I	ldsw	[%r10 + 0x0054], %r1
	.word 0xd252801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc7e2d13f  ! 925: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3baa048  ! 926: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xced2d07f  ! 927: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r7
	.word 0xcc92e006  ! 928: LDUHA_I	lduha	[%r11, + 0x0006] %asi, %r6
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d03f  ! 930: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2d13f  ! 931: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d13f  ! 934: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcb9aa078  ! 935: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2911f  ! 937: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xcfbae030  ! 938: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc41ae078  ! 940: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad83f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd202801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc5baa058  ! 943: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcd02e05c  ! 945: LDF_I	ld	[%r11, 0x005c], %f6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba981f  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xccd2a024  ! 949: LDSHA_I	ldsha	[%r10, + 0x0024] %asi, %r6
	.word 0xc7e2903f  ! 950: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba987f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba987f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc49aa078  ! 956: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xcedaa020  ! 957: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r7
	.word 0xd00ae006  ! 958: LDUB_I	ldub	[%r11 + 0x0006], %r8
	.word 0xd2c2915f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xc282e060  ! 960: LDUWA_I	lduwa	[%r11, + 0x0060] %asi, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba995f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba993f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd282a068  ! 964: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r9
	.word 0xcbba98bf  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2911f  ! 966: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba995f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 968: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba999f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc4ca901f  ! 971: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad97f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc0aa04b  ! 974: LDUB_I	ldub	[%r10 + 0x004b], %r6
	.word 0xcbba989f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcb02c01f  ! 977: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5ba987f  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd292a00c  ! 979: LDUHA_I	lduha	[%r10, + 0x000c] %asi, %r9
	.word 0xd1f2913f  ! 980: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4daa038  ! 981: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r2
	.word 0xd1ba983f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482a018  ! 983: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r2
	.word 0xc9ba995f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba997f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9baa008  ! 987: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xcb22801f  ! 988: STF_R	st	%f5, [%r31, %r10]
	.word 0xc242a018  ! 989: LDSW_I	ldsw	[%r10 + 0x0018], %r1
	.word 0xd19aa018  ! 990: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xd01aa038  ! 992: LDD_I	ldd	[%r10 + 0x0038], %r8
	.word 0xc7bad87f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce82a078  ! 994: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r7
	.word 0xcbba98bf  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc492a030  ! 997: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r2
	.word 0xcbe2d01f  ! 998: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad85f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc482d03f  ! 1000: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r2
TH_LABEL1000:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xc7f2913f  ! 1: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xd302c01f  ! 2: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc5ba993f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa028  ! 5: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2911f  ! 6: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xd2ca917f  ! 7: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xd1bad87f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d11f  ! 10: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcaca901f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 14: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc202a03c  ! 15: LDUW_I	lduw	[%r10 + 0x003c], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcdbae068  ! 17: STDFA_I	stda	%f6, [0x0068, %r11]
	.word 0xcbbaa078  ! 18: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xcb9aa060  ! 19: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba993f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6cad01f  ! 26: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r3
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba983f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59aa068  ! 29: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xcfbad81f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd292d03f  ! 31: LDUHA_R	lduha	[%r11, %r31] 0x81, %r9
	.word 0xcbba987f  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85a801f  ! 33: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd1bad93f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcb22801f  ! 35: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba991f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc4daa068  ! 38: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r2
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc6d2d05f  ! 40: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf22801f  ! 41: STF_R	st	%f7, [%r31, %r10]
	.word 0xd2d2a044  ! 42: LDSHA_I	ldsha	[%r10, + 0x0044] %asi, %r9
	.word 0xd002e024  ! 43: LDUW_I	lduw	[%r11 + 0x0024], %r8
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc24aa06e  ! 46: LDSB_I	ldsb	[%r10 + 0x006e], %r1
	.word 0xc5ba989f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcbbaa068  ! 48: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xcff2901f  ! 49: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba987f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcff2911f  ! 51: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd08a913f  ! 52: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xd102a014  ! 53: LDF_I	ld	[%r10, 0x0014], %f8
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2903f  ! 55: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc49aa040  ! 56: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r2
	.word 0xd122801f  ! 57: STF_R	st	%f8, [%r31, %r10]
	.word 0xcc1aa008  ! 58: LDD_I	ldd	[%r10 + 0x0008], %r6
	.word 0xc3bad9bf  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd242c01f  ! 60: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc59aa018  ! 61: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcd02801f  ! 62: LDF_R	ld	[%r10, %r31], %f6
	.word 0xce02e000  ! 63: LDUW_I	lduw	[%r11 + 0x0000], %r7
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xce8a905f  ! 65: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
TH_LABEL65:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xccdad13f  ! 66: LDXA_R	ldxa	[%r11, %r31] 0x89, %r6
	.word 0xd1e2903f  ! 67: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc6cad07f  ! 68: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xd1ba99bf  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xc922801f  ! 72: STF_R	st	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba983f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd1baa040  ! 75: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2c2d03f  ! 76: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r1
	.word 0xc99aa050  ! 77: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xcdf2d01f  ! 78: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad95f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc502e028  ! 81: LDF_I	ld	[%r11, 0x0028], %f2
	.word 0xc842801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xd1ba995f  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd302a01c  ! 84: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba983f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85ac01f  ! 87: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xcbbad85f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0ae047  ! 89: LDUB_I	ldub	[%r11 + 0x0047], %r5
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba981f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc702801f  ! 93: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd01aa070  ! 94: LDD_I	ldd	[%r10 + 0x0070], %r8
	.word 0xd3ba999f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba993f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 97: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd102c01f  ! 98: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcf02e034  ! 99: LDF_I	ld	[%r11, 0x0034], %f7
	.word 0xcfba981f  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc492e000  ! 101: LDUHA_I	lduha	[%r11, + 0x0000] %asi, %r2
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xca0aa012  ! 103: LDUB_I	ldub	[%r10 + 0x0012], %r5
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc6d2911f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba999f  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba993f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc79ae018  ! 110: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc402801f  ! 111: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc9e2903f  ! 112: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba999f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502c01f  ! 115: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2d13f  ! 116: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d03f  ! 118: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xccdad17f  ! 119: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r6
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2d2903f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2901f  ! 123: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2903f  ! 125: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba99bf  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 127: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba999f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd39ae010  ! 131: LDDFA_I	ldda	[%r11, 0x0010], %f9
	.word 0xd3ba989f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce12a006  ! 133: LDUH_I	lduh	[%r10 + 0x0006], %r7
	.word 0xcdbad83f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
TH_LABEL135:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca4a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xc9baa010  ! 138: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc7ba991f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc322c01f  ! 140: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1baa068  ! 142: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcb9aa050  ! 145: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb9aa050  ! 146: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xcfbad89f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc842e034  ! 148: LDSW_I	ldsw	[%r11 + 0x0034], %r4
	.word 0xcc42801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc41a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcf02a018  ! 152: LDF_I	ld	[%r10, 0x0018], %f7
	.word 0xd3bad95f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca5ae030  ! 155: LDX_I	ldx	[%r11 + 0x0030], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302a034  ! 156: LDF_I	ld	[%r10, 0x0034], %f1
	.word 0xd2ca911f  ! 157: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r9
	.word 0xcbbad99f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc9aa010  ! 160: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
TH_LABEL160:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba983f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd292e05a  ! 162: LDUHA_I	lduha	[%r11, + 0x005a] %asi, %r9
	.word 0xd042c01f  ! 163: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc3bad97f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902a04c  ! 166: LDF_I	ld	[%r10, 0x004c], %f4
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc20aa045  ! 168: LDUB_I	ldub	[%r10 + 0x0045], %r1
	.word 0xd3bad87f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0ca903f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba989f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf9aa018  ! 172: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xca12801f  ! 173: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcdba989f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdba98bf  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc68ae06d  ! 177: LDUBA_I	lduba	[%r11, + 0x006d] %asi, %r3
	.word 0xd1f2911f  ! 178: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd3baa058  ! 179: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xca02a070  ! 180: LDUW_I	lduw	[%r10 + 0x0070], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02e064  ! 181: LDF_I	ld	[%r11, 0x0064], %f6
	.word 0xd082915f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xcdf2903f  ! 183: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcde2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc812a020  ! 187: LDUH_I	lduh	[%r10 + 0x0020], %r4
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba999f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc642a024  ! 191: LDSW_I	ldsw	[%r10 + 0x0024], %r3
	.word 0xc40ae02f  ! 192: LDUB_I	ldub	[%r11 + 0x002f], %r2
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcac2915f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2913f  ! 197: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc7baa040  ! 199: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xd0d2d01f  ! 200: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r8
TH_LABEL200:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba981f  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd3baa050  ! 203: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xcff2d13f  ! 204: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad81f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad91f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd2d2a028  ! 207: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r9
	.word 0xcb02801f  ! 208: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcadaa048  ! 209: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r5
	.word 0xc5bad95f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad87f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc442a064  ! 213: LDSW_I	ldsw	[%r10 + 0x0064], %r2
	.word 0xc9ba989f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc282a028  ! 216: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r1
	.word 0xc2cae000  ! 217: LDSBA_I	ldsba	[%r11, + 0x0000] %asi, %r1
	.word 0xce92917f  ! 218: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca02a060  ! 220: LDUW_I	lduw	[%r10 + 0x0060], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba989f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 222: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc4ca913f  ! 223: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xca02a018  ! 224: LDUW_I	lduw	[%r10 + 0x0018], %r5
	.word 0xcbba997f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc902801f  ! 226: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcbbad95f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc452a046  ! 229: LDSH_I	ldsh	[%r10 + 0x0046], %r2
	.word 0xc3ba995f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3baa018  ! 231: STDFA_I	stda	%f9, [0x0018, %r10]
	.word 0xc522c01f  ! 232: STF_R	st	%f2, [%r31, %r11]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba993f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca0aa00d  ! 235: LDUB_I	ldub	[%r10 + 0x000d], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce0a801f  ! 236: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9ae058  ! 239: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad87f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc492a07e  ! 243: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r2
	.word 0xc892e040  ! 244: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r4
	.word 0xc3bad85f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc41aa040  ! 246: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xc3ba99bf  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa038  ! 248: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r0
	.word 0xc902801f  ! 249: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfba987f  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd052c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xc6c2903f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 254: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc482903f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r2
	.word 0xcd22801f  ! 257: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3ba981f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd9aa060  ! 259: LDDFA_I	ldda	[%r10, 0x0060], %f6
	.word 0xcde2901f  ! 260: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba981f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc65aa040  ! 265: LDX_I	ldx	[%r10 + 0x0040], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1baa050  ! 266: STDFA_I	stda	%f8, [0x0050, %r10]
	.word 0xc5ba997f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce0a801f  ! 268: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcec2d13f  ! 270: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2901f  ! 271: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc502c01f  ! 274: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9f2913f  ! 276: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2901f  ! 277: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc702e00c  ! 278: LDF_I	ld	[%r11, 0x000c], %f3
	.word 0xc7f2911f  ! 279: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xce52801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc99aa010  ! 281: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcc82d13f  ! 282: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r6
	.word 0xc9ba981f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2915f  ! 284: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xce52a02c  ! 285: LDSH_I	ldsh	[%r10 + 0x002c], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd122c01f  ! 286: STF_R	st	%f8, [%r31, %r11]
	.word 0xc8d2a010  ! 287: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r4
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcad2901f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc442801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2911f  ! 291: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba993f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 293: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc40aa02f  ! 294: LDUB_I	ldub	[%r10 + 0x002f], %r2
	.word 0xc68ae076  ! 295: LDUBA_I	lduba	[%r11, + 0x0076] %asi, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd092a058  ! 296: LDUHA_I	lduha	[%r10, + 0x0058] %asi, %r8
	.word 0xc9ba989f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba997f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba993f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02801f  ! 302: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1baa068  ! 303: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xd1e2903f  ! 304: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xcf22801f  ! 305: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba99bf  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8d2a06c  ! 309: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r4
	.word 0xc39aa058  ! 310: LDDFA_I	ldda	[%r10, 0x0058], %f1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad8bf  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd0d2911f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r8
	.word 0xc9e2913f  ! 313: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xcb02a008  ! 314: LDF_I	ld	[%r10, 0x0008], %f5
	.word 0xca0a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2903f  ! 316: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba995f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc6c2a004  ! 319: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r3
	.word 0xc3ba987f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba981f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd19ae008  ! 322: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102e064  ! 326: LDF_I	ld	[%r11, 0x0064], %f8
	.word 0xc892913f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x89, %r4
	.word 0xc3e2d11f  ! 328: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad85f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2d11f  ! 331: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc4dad13f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x89, %r2
	.word 0xc412a010  ! 333: LDUH_I	lduh	[%r10 + 0x0010], %r2
	.word 0xd012a044  ! 334: LDUH_I	lduh	[%r10 + 0x0044], %r8
	.word 0xc8c2917f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad95f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc42a008  ! 337: LDSW_I	ldsw	[%r10 + 0x0008], %r6
	.word 0xcd22801f  ! 338: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5ba991f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd052a00e  ! 341: LDSH_I	ldsh	[%r10 + 0x000e], %r8
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcc8ae04b  ! 343: LDUBA_I	lduba	[%r11, + 0x004b] %asi, %r6
	.word 0xd3e2d13f  ! 344: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc85a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202801f  ! 350: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad89f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2d17f  ! 353: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r9
	.word 0xcbf2911f  ! 354: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcd22801f  ! 355: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02a008  ! 356: LDF_I	ld	[%r10, 0x0008], %f6
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d01f  ! 358: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xcdbaa058  ! 359: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302a030  ! 361: LDF_I	ld	[%r10, 0x0030], %f1
	.word 0xc9ba995f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd22c01f  ! 363: STF_R	st	%f6, [%r31, %r11]
	.word 0xcff2901f  ! 364: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba981f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc99aa060  ! 368: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xc5bad99f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad97f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd102a038  ! 372: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xc9bad85f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02c01f  ! 374: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc3e2d13f  ! 375: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad99f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad9bf  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL380:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc652a078  ! 384: LDSH_I	ldsh	[%r10 + 0x0078], %r3
	.word 0xc2d2d07f  ! 385: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc39aa018  ! 386: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xc522801f  ! 387: STF_R	st	%f2, [%r31, %r10]
	.word 0xcfe2913f  ! 388: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc292a036  ! 391: LDUHA_I	lduha	[%r10, + 0x0036] %asi, %r1
	.word 0xd1ba991f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2903f  ! 395: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba991f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302c01f  ! 397: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc7ba999f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 400: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba983f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf22c01f  ! 403: STF_R	st	%f7, [%r31, %r11]
	.word 0xc722801f  ! 404: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd2d2915f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r9
	.word 0xc882d15f  ! 407: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r4
	.word 0xd3f2903f  ! 408: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2911f  ! 409: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc8dad07f  ! 410: LDXA_R	ldxa	[%r11, %r31] 0x83, %r4
TH_LABEL410:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4c2a02c  ! 411: LDSWA_I	ldswa	[%r10, + 0x002c] %asi, %r2
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd20aa027  ! 414: LDUB_I	ldub	[%r10 + 0x0027], %r9
	.word 0xc2cae030  ! 415: LDSBA_I	ldsba	[%r11, + 0x0030] %asi, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc682a058  ! 416: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r3
	.word 0xd002c01f  ! 417: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd3baa008  ! 418: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 420: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcd22801f  ! 422: STF_R	st	%f6, [%r31, %r10]
	.word 0xc9f2d03f  ! 423: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc292a064  ! 426: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r1
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba993f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41ac01f  ! 429: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xd0c2a014  ! 430: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r8
TH_LABEL430:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca42801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcdbaa038  ! 434: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xca92a07e  ! 435: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbad8bf  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd122801f  ! 439: STF_R	st	%f8, [%r31, %r10]
	.word 0xcd22801f  ! 440: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba981f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc41aa068  ! 444: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xcfbae068  ! 445: STDFA_I	stda	%f7, [0x0068, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd19ae038  ! 446: LDDFA_I	ldda	[%r11, 0x0038], %f8
	.word 0xcd9aa068  ! 447: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xd1ba983f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca12801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc9ba991f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2901f  ! 454: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc80aa04f  ! 455: LDUB_I	ldub	[%r10 + 0x004f], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce52801f  ! 456: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd3ba993f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc892d01f  ! 460: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2901f  ! 461: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba987f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd2cae076  ! 467: LDSBA_I	ldsba	[%r11, + 0x0076] %asi, %r9
	.word 0xcfbad99f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcec2a06c  ! 469: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r7
	.word 0xc3e2903f  ! 470: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba98bf  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2903f  ! 473: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xcb9ae008  ! 474: LDDFA_I	ldda	[%r11, 0x0008], %f5
	.word 0xc2c2905f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba98bf  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 477: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba991f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba997f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba995f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcac2913f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xcc4a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r6
TH_LABEL485:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2903f  ! 486: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcccad03f  ! 487: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r6
	.word 0xc702c01f  ! 488: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd002e05c  ! 489: LDUW_I	lduw	[%r11 + 0x005c], %r8
	.word 0xd3ba989f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc8a911f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xc602c01f  ! 492: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xcff2903f  ! 493: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba989f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf22801f  ! 498: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5ba995f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc722c01f  ! 502: STF_R	st	%f3, [%r31, %r11]
	.word 0xd0d2901f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xc702a064  ! 504: LDF_I	ld	[%r10, 0x0064], %f3
	.word 0xd1baa020  ! 505: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba989f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba98bf  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc41a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcdf2903f  ! 510: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2901f  ! 511: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2903f  ! 512: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba99bf  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL515:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba991f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca12c01f  ! 519: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL520:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc922c01f  ! 521: STF_R	st	%f4, [%r31, %r11]
	.word 0xc902e07c  ! 522: LDF_I	ld	[%r11, 0x007c], %f4
	.word 0xcfba981f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd01ae020  ! 524: LDD_I	ldd	[%r11 + 0x0020], %r8
	.word 0xc302e03c  ! 525: LDF_I	ld	[%r11, 0x003c], %f1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcd22801f  ! 527: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1e2d01f  ! 528: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc4da911f  ! 529: LDXA_R	ldxa	[%r10, %r31] 0x88, %r2
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd28ad01f  ! 531: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xcdba98bf  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2903f  ! 534: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xca82913f  ! 538: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r5
	.word 0xcac2905f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xcbba995f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4d2907f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xd3e2913f  ! 542: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc922c01f  ! 545: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2d01f  ! 546: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d01f  ! 548: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL550:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcccaa01b  ! 551: LDSBA_I	ldsba	[%r10, + 0x001b] %asi, %r6
	.word 0xcbba997f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 554: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba98bf  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba985f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc0aa02e  ! 559: LDUB_I	ldub	[%r10 + 0x002e], %r6
	.word 0xce4a801f  ! 560: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad83f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 562: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad8bf  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd39ae008  ! 565: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc722801f  ! 566: STF_R	st	%f3, [%r31, %r10]
	.word 0xce5a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc522801f  ! 568: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5bad8bf  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc202a030  ! 570: LDUW_I	lduw	[%r10 + 0x0030], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc24ae00b  ! 571: LDSB_I	ldsb	[%r11 + 0x000b], %r1
	.word 0xc5bad9bf  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc28ad01f  ! 573: LDUBA_R	lduba	[%r11, %r31] 0x80, %r1
	.word 0xc4d2a01e  ! 574: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r2
	.word 0xd1ba99bf  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL575:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc24a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc4ca913f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xd1e2903f  ! 579: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc8dad13f  ! 580: LDXA_R	ldxa	[%r11, %r31] 0x89, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd292907f  ! 581: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd00aa04e  ! 583: LDUB_I	ldub	[%r10 + 0x004e], %r8
	.word 0xd0dae018  ! 584: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r8
	.word 0xcedaa010  ! 585: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba999f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd05aa030  ! 587: LDX_I	ldx	[%r10 + 0x0030], %r8
	.word 0xc48aa04b  ! 588: LDUBA_I	lduba	[%r10, + 0x004b] %asi, %r2
	.word 0xc522801f  ! 589: STF_R	st	%f2, [%r31, %r10]
	.word 0xc7bad81f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbaa040  ! 591: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xc5bae010  ! 592: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xc9e2913f  ! 593: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba995f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc39ae010  ! 595: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcde2901f  ! 596: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xca42c01f  ! 597: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc652a01e  ! 598: LDSH_I	ldsh	[%r10 + 0x001e], %r3
	.word 0xcbba981f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba991f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba991f  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd3bae070  ! 604: STDFA_I	stda	%f9, [0x0070, %r11]
	.word 0xc3ba99bf  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba991f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902e020  ! 607: LDF_I	ld	[%r11, 0x0020], %f4
	.word 0xcf9aa068  ! 608: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xcff2901f  ! 609: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba991f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf02a07c  ! 611: LDF_I	ld	[%r10, 0x007c], %f7
	.word 0xd102801f  ! 612: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd3e2901f  ! 613: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba99bf  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba997f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc292903f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x81, %r1
	.word 0xc2c2a048  ! 619: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r1
	.word 0xc9ba985f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2c2e01c  ! 621: LDSWA_I	ldswa	[%r11, + 0x001c] %asi, %r9
	.word 0xca0a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcad2901f  ! 624: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc882907f  ! 626: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcdbaa040  ! 628: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xd39aa068  ! 629: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xd1baa030  ! 630: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02801f  ! 631: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba997f  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc322801f  ! 633: STF_R	st	%f1, [%r31, %r10]
	.word 0xca5ac01f  ! 634: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc5f2903f  ! 635: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
TH_LABEL635:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba985f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc45ac01f  ! 638: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xc3bad83f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd01a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xced2d13f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r7
	.word 0xcc8a917f  ! 643: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc722801f  ! 645: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd19aa070  ! 646: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xc612801f  ! 647: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xced2a068  ! 648: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r7
	.word 0xd25ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd24aa03f  ! 650: LDSB_I	ldsb	[%r10 + 0x003f], %r9
TH_LABEL650:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 652: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc8da901f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc3ba995f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc212c01f  ! 656: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xd3f2d03f  ! 657: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xc8d2901f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xd19ae020  ! 659: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xd3ba999f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba983f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba983f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd052a050  ! 666: LDSH_I	ldsh	[%r10 + 0x0050], %r8
	.word 0xd1baa070  ! 667: STDFA_I	stda	%f8, [0x0070, %r10]
	.word 0xcdba981f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd012c01f  ! 670: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1e2911f  ! 671: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc9baa030  ! 673: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc5ba987f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc20a801f  ! 675: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad95f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc292e06e  ! 677: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r1
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc702c01f  ! 679: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcfe2901f  ! 680: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2913f  ! 681: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2903f  ! 683: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xd39ae008  ! 684: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xc8cad11f  ! 685: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r4
TH_LABEL685:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca5ac01f  ! 686: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xd1bae048  ! 687: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xd082e058  ! 688: LDUWA_I	lduwa	[%r11, + 0x0058] %asi, %r8
	.word 0xcf9aa070  ! 689: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc252c01f  ! 691: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcc1a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3ba981f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc5bae008  ! 694: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xd20aa043  ! 695: LDUB_I	ldub	[%r10 + 0x0043], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc6c2a050  ! 696: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r3
	.word 0xcfe2913f  ! 697: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc6c2911f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r3
	.word 0xd1bad8bf  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc20aa030  ! 700: LDUB_I	ldub	[%r10 + 0x0030], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc402c01f  ! 701: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc3f2d13f  ! 702: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xca4ae055  ! 704: LDSB_I	ldsb	[%r11 + 0x0055], %r5
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 707: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc922801f  ! 708: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad89f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8a901f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcdbaa058  ! 712: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2903f  ! 714: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd292a06e  ! 715: LDUHA_I	lduha	[%r10, + 0x006e] %asi, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba999f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb9aa000  ! 718: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xd242a05c  ! 719: LDSW_I	ldsw	[%r10 + 0x005c], %r9
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
TH_LABEL720:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad8bf  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc8d2d11f  ! 722: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xcfbad8bf  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 725: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad85f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc812801f  ! 728: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xcbbaa058  ! 729: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xc45a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2911f  ! 731: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xcc4aa05d  ! 732: LDSB_I	ldsb	[%r10 + 0x005d], %r6
	.word 0xd0c2913f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xce42a060  ! 734: LDSW_I	ldsw	[%r10 + 0x0060], %r7
	.word 0xce4aa00e  ! 735: LDSB_I	ldsb	[%r10 + 0x000e], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba981f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922801f  ! 737: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd042a06c  ! 740: LDSW_I	ldsw	[%r10 + 0x006c], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba981f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 744: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL745:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcff2913f  ! 746: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc59aa018  ! 747: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcfba995f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 749: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc882a024  ! 750: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc5aa070  ! 751: LDX_I	ldx	[%r10 + 0x0070], %r6
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba987f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbae050  ! 755: STDFA_I	stda	%f6, [0x0050, %r11]
TH_LABEL755:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc45aa078  ! 756: LDX_I	ldx	[%r10 + 0x0078], %r2
	.word 0xcc5aa048  ! 757: LDX_I	ldx	[%r10 + 0x0048], %r6
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc3bae050  ! 759: STDFA_I	stda	%f1, [0x0050, %r11]
	.word 0xcec2a05c  ! 760: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba993f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc892e078  ! 762: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r4
	.word 0xcb22c01f  ! 763: STF_R	st	%f5, [%r31, %r11]
	.word 0xc9ba983f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02a028  ! 765: LDF_I	ld	[%r10, 0x0028], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2901f  ! 766: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba991f  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc41aa030  ! 770: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba98bf  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8caa003  ! 773: LDSBA_I	ldsba	[%r10, + 0x0003] %asi, %r4
	.word 0xc7ba983f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902c01f  ! 776: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd05a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xcb02801f  ! 778: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd3bad89f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6da913f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x89, %r3
TH_LABEL780:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d13f  ! 782: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad81f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0ca901f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba99bf  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa050  ! 789: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xcdba981f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc41aa038  ! 792: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xc302e024  ! 793: LDF_I	ld	[%r11, 0x0024], %f1
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc722801f  ! 795: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba991f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd0da903f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x81, %r8
	.word 0xc7ba997f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba981f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL805:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd092a044  ! 806: LDUHA_I	lduha	[%r10, + 0x0044] %asi, %r8
	.word 0xcc8ad03f  ! 807: LDUBA_R	lduba	[%r11, %r31] 0x81, %r6
	.word 0xcf9aa030  ! 808: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xce8ae05b  ! 809: LDUBA_I	lduba	[%r11, + 0x005b] %asi, %r7
	.word 0xc85ac01f  ! 810: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba981f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd25ae000  ! 813: LDX_I	ldx	[%r11 + 0x0000], %r9
	.word 0xc7e2903f  ! 814: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba987f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc302801f  ! 816: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc242c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xd302a078  ! 818: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd08a901f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
TH_LABEL820:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2d03f  ! 821: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xc6d2d17f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r3
	.word 0xc4daa070  ! 823: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r2
	.word 0xd3ba99bf  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca82e074  ! 825: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r5
TH_LABEL825:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc522801f  ! 827: STF_R	st	%f2, [%r31, %r10]
	.word 0xcfbad97f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad97f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85aa048  ! 832: LDX_I	ldx	[%r10 + 0x0048], %r4
	.word 0xc402a030  ! 833: LDUW_I	lduw	[%r10 + 0x0030], %r2
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd05a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd20a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad83f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc252801f  ! 839: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xd1baa000  ! 840: STDFA_I	stda	%f8, [0x0000, %r10]
TH_LABEL840:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd9ae030  ! 841: LDDFA_I	ldda	[%r11, 0x0030], %f6
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba999f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcccae070  ! 844: LDSBA_I	ldsba	[%r11, + 0x0070] %asi, %r6
	.word 0xc3e2903f  ! 845: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02e058  ! 846: LDF_I	ld	[%r11, 0x0058], %f6
	.word 0xc5e2911f  ! 847: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2901f  ! 848: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5baa068  ! 850: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad87f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d11f  ! 852: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad9bf  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc292a01e  ! 856: LDUHA_I	lduha	[%r10, + 0x001e] %asi, %r1
	.word 0xd1baa010  ! 857: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba987f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc842801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xce82a058  ! 862: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r7
	.word 0xc5ba989f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce4ae00c  ! 865: LDSB_I	ldsb	[%r11 + 0x000c], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd212e056  ! 866: LDUH_I	lduh	[%r11 + 0x0056], %r9
	.word 0xc7bae008  ! 867: STDFA_I	stda	%f3, [0x0008, %r11]
	.word 0xc9e2911f  ! 868: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba981f  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7bae020  ! 870: STDFA_I	stda	%f3, [0x0020, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcac2e074  ! 871: LDSWA_I	ldswa	[%r11, + 0x0074] %asi, %r5
	.word 0xc9e2d03f  ! 872: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad85f  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd02801f  ! 875: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba991f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc2dae000  ! 880: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc642801f  ! 881: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd282a068  ! 882: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r9
	.word 0xc3bad93f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd302801f  ! 885: LDF_R	ld	[%r10, %r31], %f9
TH_LABEL885:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59ae058  ! 886: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xc45aa078  ! 887: LDX_I	ldx	[%r10 + 0x0078], %r2
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba985f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb22801f  ! 891: STF_R	st	%f5, [%r31, %r10]
	.word 0xc482a024  ! 892: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r2
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xd19aa078  ! 895: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702a070  ! 896: LDF_I	ld	[%r10, 0x0070], %f3
	.word 0xc502a018  ! 897: LDF_I	ld	[%r10, 0x0018], %f2
	.word 0xc9bad83f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd20a801f  ! 900: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc202a064  ! 901: LDUW_I	lduw	[%r10 + 0x0064], %r1
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad97f  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad83f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc502a020  ! 907: LDF_I	ld	[%r10, 0x0020], %f2
	.word 0xcc4aa047  ! 908: LDSB_I	ldsb	[%r10 + 0x0047], %r6
	.word 0xc7ba987f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbaa010  ! 910: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba985f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc02a02c  ! 912: LDUW_I	lduw	[%r10 + 0x002c], %r6
	.word 0xd1ba989f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd3bae028  ! 915: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc502e044  ! 917: LDF_I	ld	[%r11, 0x0044], %f2
	.word 0xc7bae018  ! 918: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xcdf2d01f  ! 919: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xd24a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca02801f  ! 921: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc42a058  ! 923: LDSW_I	ldsw	[%r10 + 0x0058], %r6
	.word 0xc852801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc7e2d01f  ! 925: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbaa058  ! 926: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xc2d2915f  ! 927: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r1
	.word 0xc692e06e  ! 928: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r3
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d01f  ! 930: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2d01f  ! 931: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 934: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xd39ae068  ! 935: LDDFA_I	ldda	[%r11, 0x0068], %f9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 937: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc9baa068  ! 938: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd01ae000  ! 940: LDD_I	ldd	[%r11 + 0x0000], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad89f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd002801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc7bae028  ! 943: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd102e078  ! 945: LDF_I	ld	[%r11, 0x0078], %f8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba981f  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd2d2e01c  ! 949: LDSHA_I	ldsha	[%r11, + 0x001c] %asi, %r9
	.word 0xc7e2913f  ! 950: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba989f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba985f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
TH_LABEL955:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc49aa038  ! 956: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r2
	.word 0xc8dae058  ! 957: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r4
	.word 0xc40aa024  ! 958: LDUB_I	ldub	[%r10 + 0x0024], %r2
	.word 0xccc2d15f  ! 959: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r6
	.word 0xd282e044  ! 960: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba999f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc282a024  ! 964: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r1
	.word 0xcbba981f  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL965:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2911f  ! 966: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba99bf  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 968: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xceca903f  ! 971: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r7
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad85f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc40aa064  ! 974: LDUB_I	ldub	[%r10 + 0x0064], %r2
	.word 0xcbba987f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd102801f  ! 977: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc5ba98bf  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd292a05a  ! 979: LDUHA_I	lduha	[%r10, + 0x005a] %asi, %r9
	.word 0xd1f2903f  ! 980: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2daa018  ! 981: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r1
	.word 0xd1ba997f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282a070  ! 983: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r9
	.word 0xc9ba999f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba983f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcbbaa028  ! 987: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xcb22c01f  ! 988: STF_R	st	%f5, [%r31, %r11]
	.word 0xc842a058  ! 989: LDSW_I	ldsw	[%r10 + 0x0058], %r4
	.word 0xd19aa030  ! 990: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xd01aa058  ! 992: LDD_I	ldd	[%r10 + 0x0058], %r8
	.word 0xc7bad83f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd282e034  ! 994: LDUWA_I	lduwa	[%r11, + 0x0034] %asi, %r9
	.word 0xcbba991f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd092a03e  ! 997: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r8
	.word 0xcbe2d01f  ! 998: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad89f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd082917f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xc7f2901f  ! 1: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcb02801f  ! 2: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc5ba983f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbae048  ! 5: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2903f  ! 6: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xceca907f  ! 7: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r7
	.word 0xd1bad99f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d13f  ! 10: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd0ca911f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 14: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xca02a00c  ! 15: LDUW_I	lduw	[%r10 + 0x000c], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcbbaa010  ! 17: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xcfbaa058  ! 18: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xc99ae008  ! 19: LDDFA_I	ldda	[%r11, 0x0008], %f4
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba983f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc8ca911f  ! 26: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r4
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa060  ! 29: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xcfbad8bf  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc692915f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xcbba99bf  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85ac01f  ! 33: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1bad87f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd122801f  ! 35: STF_R	st	%f8, [%r31, %r10]
TH_LABEL35:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba981f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc4daa078  ! 38: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r2
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8d2907f  ! 40: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd122801f  ! 41: STF_R	st	%f8, [%r31, %r10]
	.word 0xced2e072  ! 42: LDSHA_I	ldsha	[%r11, + 0x0072] %asi, %r7
	.word 0xc202a064  ! 43: LDUW_I	lduw	[%r10 + 0x0064], %r1
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc4ae029  ! 46: LDSB_I	ldsb	[%r11 + 0x0029], %r6
	.word 0xc5ba98bf  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5bae028  ! 48: STDFA_I	stda	%f2, [0x0028, %r11]
	.word 0xcff2911f  ! 49: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2903f  ! 51: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc8a917f  ! 52: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xd102e03c  ! 53: LDF_I	ld	[%r11, 0x003c], %f8
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2903f  ! 55: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc9ae038  ! 56: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r6
	.word 0xcd22801f  ! 57: STF_R	st	%f6, [%r31, %r10]
	.word 0xc81aa060  ! 58: LDD_I	ldd	[%r10 + 0x0060], %r4
	.word 0xc3bad89f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc242801f  ! 60: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9ae058  ! 61: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xd102c01f  ! 62: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc202e03c  ! 63: LDUW_I	lduw	[%r11 + 0x003c], %r1
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd28ad07f  ! 65: LDUBA_R	lduba	[%r11, %r31] 0x83, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6dad17f  ! 66: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r3
	.word 0xd1e2901f  ! 67: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc6cad11f  ! 68: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r3
	.word 0xd1ba991f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL70:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xcd22c01f  ! 72: STF_R	st	%f6, [%r31, %r11]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcdbaa030  ! 75: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc8c2903f  ! 76: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xc99aa038  ! 77: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xcdf2d03f  ! 78: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad89f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702e024  ! 81: LDF_I	ld	[%r11, 0x0024], %f3
	.word 0xd242801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd1ba987f  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd102a044  ! 84: LDF_I	ld	[%r10, 0x0044], %f8
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba999f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc65ac01f  ! 87: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xcbbad89f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd20ae067  ! 89: LDUB_I	ldub	[%r11 + 0x0067], %r9
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba993f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc502801f  ! 93: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc41aa050  ! 94: LDD_I	ldd	[%r10 + 0x0050], %r2
	.word 0xd3ba991f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL95:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba99bf  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 97: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xc702801f  ! 98: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc702e044  ! 99: LDF_I	ld	[%r11, 0x0044], %f3
	.word 0xcfba991f  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc492a054  ! 101: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r2
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc60aa079  ! 103: LDUB_I	ldub	[%r10 + 0x0079], %r3
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xccd2917f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
TH_LABEL105:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba99bf  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xcf9ae010  ! 110: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd002c01f  ! 111: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc9e2913f  ! 112: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba98bf  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb02c01f  ! 115: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2d03f  ! 116: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d03f  ! 118: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xccdad15f  ! 119: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r6
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
TH_LABEL120:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2d2911f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r1
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2901f  ! 123: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2903f  ! 125: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba987f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 127: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba997f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
TH_LABEL130:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf9aa018  ! 131: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xd3ba99bf  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce12a02e  ! 133: LDUH_I	lduh	[%r10 + 0x002e], %r7
	.word 0xcdbad93f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc64a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xc3baa040  ! 138: STDFA_I	stda	%f1, [0x0040, %r10]
	.word 0xc7ba983f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc522801f  ! 140: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcbbaa030  ! 142: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc99aa068  ! 145: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa018  ! 146: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcfbad81f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc42e068  ! 148: LDSW_I	ldsw	[%r11 + 0x0068], %r6
	.word 0xcc42801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcc1a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r6
TH_LABEL150:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcf02e018  ! 152: LDF_I	ld	[%r11, 0x0018], %f7
	.word 0xd3bad83f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65aa078  ! 155: LDX_I	ldx	[%r10 + 0x0078], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd102e03c  ! 156: LDF_I	ld	[%r11, 0x003c], %f8
	.word 0xc4cad17f  ! 157: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r2
	.word 0xcbbad87f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd09aa030  ! 160: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba981f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc492a03c  ! 162: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r2
	.word 0xc442c01f  ! 163: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc3bad99f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd102a018  ! 166: LDF_I	ld	[%r10, 0x0018], %f8
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xce0aa011  ! 168: LDUB_I	ldub	[%r10 + 0x0011], %r7
	.word 0xd3bad81f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6ca901f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba98bf  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc79ae030  ! 172: LDDFA_I	ldda	[%r11, 0x0030], %f3
	.word 0xcc12c01f  ! 173: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xcdba98bf  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
TH_LABEL175:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba993f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc28ae032  ! 177: LDUBA_I	lduba	[%r11, + 0x0032] %asi, %r1
	.word 0xd1f2901f  ! 178: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc7baa060  ! 179: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc802a040  ! 180: LDUW_I	lduw	[%r10 + 0x0040], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc302a048  ! 181: LDF_I	ld	[%r10, 0x0048], %f1
	.word 0xc882917f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r4
	.word 0xcdf2911f  ! 183: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
TH_LABEL185:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd212e07e  ! 187: LDUH_I	lduh	[%r11 + 0x007e], %r9
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba989f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce42e038  ! 191: LDSW_I	ldsw	[%r11 + 0x0038], %r7
	.word 0xc20aa00d  ! 192: LDUB_I	ldub	[%r10 + 0x000d], %r1
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2c2905f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2911f  ! 197: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcdbaa040  ! 199: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc4d2917f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba98bf  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1baa060  ! 203: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xcff2d03f  ! 204: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad91f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad81f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2e05c  ! 207: LDSHA_I	ldsha	[%r11, + 0x005c] %asi, %r3
	.word 0xc702c01f  ! 208: LDF_R	ld	[%r11, %r31], %f3
	.word 0xccdae030  ! 209: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r6
	.word 0xc5bad81f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad89f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc42a024  ! 213: LDSW_I	ldsw	[%r10 + 0x0024], %r6
	.word 0xc9ba987f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xce82a04c  ! 216: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r7
	.word 0xcacaa06f  ! 217: LDSBA_I	ldsba	[%r10, + 0x006f] %asi, %r5
	.word 0xc892d01f  ! 218: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd202a028  ! 220: LDUW_I	lduw	[%r10 + 0x0028], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba991f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 222: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc2ca905f  ! 223: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xc402a038  ! 224: LDUW_I	lduw	[%r10 + 0x0038], %r2
	.word 0xcbba989f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL225:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd102801f  ! 226: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcbbad81f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc652e066  ! 229: LDSH_I	ldsh	[%r11 + 0x0066], %r3
	.word 0xc3ba989f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3baa048  ! 231: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xd122c01f  ! 232: STF_R	st	%f8, [%r31, %r11]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba99bf  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc0aa01a  ! 235: LDUB_I	ldub	[%r10 + 0x001a], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd20ac01f  ! 236: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf9aa008  ! 239: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad97f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc892a076  ! 243: LDUHA_I	lduha	[%r10, + 0x0076] %asi, %r4
	.word 0xd292e036  ! 244: LDUHA_I	lduha	[%r11, + 0x0036] %asi, %r9
	.word 0xc3bad9bf  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01ae020  ! 246: LDD_I	ldd	[%r11 + 0x0020], %r8
	.word 0xc3ba985f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa030  ! 248: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xcb02801f  ! 249: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba99bf  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd252c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc2c2d07f  ! 252: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r1
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 254: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc882915f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r4
	.word 0xc722801f  ! 257: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3ba99bf  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb9ae068  ! 259: LDDFA_I	ldda	[%r11, 0x0068], %f5
	.word 0xcde2903f  ! 260: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc65aa078  ! 265: LDX_I	ldx	[%r10 + 0x0078], %r3
TH_LABEL265:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbaa030  ! 266: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xc5ba991f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80a801f  ! 268: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcec2915f  ! 270: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2901f  ! 271: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba983f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302801f  ! 274: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2901f  ! 276: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 277: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc502a05c  ! 278: LDF_I	ld	[%r10, 0x005c], %f2
	.word 0xc7f2913f  ! 279: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc852801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39aa078  ! 281: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xcc82d03f  ! 282: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r6
	.word 0xc9ba98bf  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2d13f  ! 284: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r4
	.word 0xce52a05a  ! 285: LDSH_I	ldsh	[%r10 + 0x005a], %r7
TH_LABEL285:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb22801f  ! 286: STF_R	st	%f5, [%r31, %r10]
	.word 0xc8d2e016  ! 287: LDSHA_I	ldsha	[%r11, + 0x0016] %asi, %r4
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xced2d11f  ! 289: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r7
	.word 0xc442801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2903f  ! 291: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba995f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 293: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc40ae01b  ! 294: LDUB_I	ldub	[%r11 + 0x001b], %r2
	.word 0xd28aa037  ! 295: LDUBA_I	lduba	[%r10, + 0x0037] %asi, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce92e00a  ! 296: LDUHA_I	lduha	[%r11, + 0x000a] %asi, %r7
	.word 0xc9ba999f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba99bf  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba98bf  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302801f  ! 302: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1bae030  ! 303: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xd1e2911f  ! 304: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc722801f  ! 305: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba993f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcad2a062  ! 309: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r5
	.word 0xc99aa060  ! 310: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad8bf  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcad2911f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xc9e2911f  ! 313: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc502a010  ! 314: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xce0a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2913f  ! 316: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba985f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xd0c2e028  ! 319: LDSWA_I	ldswa	[%r11, + 0x0028] %asi, %r8
	.word 0xc3ba987f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba991f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59ae070  ! 322: LDDFA_I	ldda	[%r11, 0x0070], %f2
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba985f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL325:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb02a05c  ! 326: LDF_I	ld	[%r10, 0x005c], %f5
	.word 0xc292d17f  ! 327: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r1
	.word 0xc3e2d03f  ! 328: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad85f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2d01f  ! 331: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xccdad01f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x80, %r6
	.word 0xcc12e06e  ! 333: LDUH_I	lduh	[%r11 + 0x006e], %r6
	.word 0xd012a044  ! 334: LDUH_I	lduh	[%r10 + 0x0044], %r8
	.word 0xc2c2911f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad8bf  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc842a004  ! 337: LDSW_I	ldsw	[%r10 + 0x0004], %r4
	.word 0xc722c01f  ! 338: STF_R	st	%f3, [%r31, %r11]
	.word 0xc5ba981f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc652e072  ! 341: LDSH_I	ldsh	[%r11 + 0x0072], %r3
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xca8aa070  ! 343: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r5
	.word 0xd3e2d01f  ! 344: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xd25ac01f  ! 347: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca02801f  ! 350: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad99f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8c2901f  ! 353: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xcbf2913f  ! 354: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcf22c01f  ! 355: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcd02a068  ! 356: LDF_I	ld	[%r10, 0x0068], %f6
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d13f  ! 358: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd1baa038  ! 359: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902a064  ! 361: LDF_I	ld	[%r10, 0x0064], %f4
	.word 0xc9ba981f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc322801f  ! 363: STF_R	st	%f1, [%r31, %r10]
	.word 0xcff2903f  ! 364: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba985f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9aa050  ! 368: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xc5bad93f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad89f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcb02a074  ! 372: LDF_I	ld	[%r10, 0x0074], %f5
	.word 0xc9bad8bf  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc502801f  ! 374: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc3e2d03f  ! 375: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad8bf  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad95f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad89f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc652e01a  ! 384: LDSH_I	ldsh	[%r11 + 0x001a], %r3
	.word 0xc8d2901f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd19ae010  ! 386: LDDFA_I	ldda	[%r11, 0x0010], %f8
	.word 0xcb22801f  ! 387: STF_R	st	%f5, [%r31, %r10]
	.word 0xcfe2911f  ! 388: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd092a03e  ! 391: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r8
	.word 0xd1ba981f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2901f  ! 395: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba989f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502801f  ! 397: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc7ba99bf  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 400: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba997f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 403: STF_R	st	%f3, [%r31, %r10]
	.word 0xd322801f  ! 404: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
TH_LABEL405:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc4d2917f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
	.word 0xc682d15f  ! 407: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r3
	.word 0xd3f2901f  ! 408: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2913f  ! 409: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc8da901f  ! 410: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2c2e020  ! 411: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r9
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc80aa079  ! 414: LDUB_I	ldub	[%r10 + 0x0079], %r4
	.word 0xcecaa035  ! 415: LDSBA_I	ldsba	[%r10, + 0x0035] %asi, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd282a070  ! 416: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r9
	.word 0xc202801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc9baa048  ! 418: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2911f  ! 420: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
TH_LABEL420:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc522801f  ! 422: STF_R	st	%f2, [%r31, %r10]
	.word 0xc9f2d11f  ! 423: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc92a078  ! 426: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r6
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba99bf  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd2c2a03c  ! 430: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc242801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc3baa050  ! 434: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xc492e050  ! 435: LDUHA_I	lduha	[%r11, + 0x0050] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad87f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc322801f  ! 439: STF_R	st	%f1, [%r31, %r10]
	.word 0xd322801f  ! 440: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba987f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc41ae070  ! 444: LDD_I	ldd	[%r11 + 0x0070], %r2
	.word 0xc9bae028  ! 445: STDFA_I	stda	%f4, [0x0028, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79ae070  ! 446: LDDFA_I	ldda	[%r11, 0x0070], %f3
	.word 0xcb9ae040  ! 447: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xd1ba985f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc412801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc9ba993f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2903f  ! 454: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcc0ae064  ! 455: LDUB_I	ldub	[%r11 + 0x0064], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca52801f  ! 456: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd3ba98bf  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba985f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca92911f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2903f  ! 461: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba98bf  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba983f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd2cae07d  ! 467: LDSBA_I	ldsba	[%r11, + 0x007d] %asi, %r9
	.word 0xcfbad95f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4c2a028  ! 469: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r2
	.word 0xc3e2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba995f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 473: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc39ae048  ! 474: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xc2c2d17f  ! 475: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba995f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 477: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba989f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba993f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba981f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcec2d01f  ! 484: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r7
	.word 0xce4a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2911f  ! 486: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc8cad13f  ! 487: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r4
	.word 0xc502801f  ! 488: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca02a050  ! 489: LDUW_I	lduw	[%r10 + 0x0050], %r5
	.word 0xd3ba993f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc8a903f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xc202801f  ! 492: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcff2901f  ! 493: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba989f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL495:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd122c01f  ! 498: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5ba993f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc922801f  ! 502: STF_R	st	%f4, [%r31, %r10]
	.word 0xccd2901f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xcb02a03c  ! 504: LDF_I	ld	[%r10, 0x003c], %f5
	.word 0xc7bae040  ! 505: STDFA_I	stda	%f3, [0x0040, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba985f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba981f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd01a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcdf2901f  ! 510: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
TH_LABEL510:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2911f  ! 511: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcde2903f  ! 512: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba981f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba987f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc12c01f  ! 519: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc322801f  ! 521: STF_R	st	%f1, [%r31, %r10]
	.word 0xc702a02c  ! 522: LDF_I	ld	[%r10, 0x002c], %f3
	.word 0xcfba991f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc01aa018  ! 524: LDD_I	ldd	[%r10 + 0x0018], %r0
	.word 0xc302a034  ! 525: LDF_I	ld	[%r10, 0x0034], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc722801f  ! 527: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1e2d11f  ! 528: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xccdad01f  ! 529: LDXA_R	ldxa	[%r11, %r31] 0x80, %r6
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc28ad05f  ! 531: LDUBA_R	lduba	[%r11, %r31] 0x82, %r1
	.word 0xcdba983f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2911f  ! 534: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xd082d05f  ! 538: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r8
	.word 0xc2c2907f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r1
	.word 0xcbba98bf  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4d2905f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xd3e2913f  ! 542: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcf22801f  ! 545: STF_R	st	%f7, [%r31, %r10]
TH_LABEL545:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2d01f  ! 546: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d11f  ! 548: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad85f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2cae019  ! 551: LDSBA_I	ldsba	[%r11, + 0x0019] %asi, %r9
	.word 0xcbba98bf  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2911f  ! 554: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba98bf  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL555:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba98bf  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0ae035  ! 559: LDUB_I	ldub	[%r11 + 0x0035], %r5
	.word 0xc24ac01f  ! 560: LDSB_R	ldsb	[%r11 + %r31], %r1
TH_LABEL560:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad89f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 562: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad81f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd39aa048  ! 565: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc322801f  ! 566: STF_R	st	%f1, [%r31, %r10]
	.word 0xca5a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcf22801f  ! 568: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5bad8bf  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc402e058  ! 570: LDUW_I	lduw	[%r11 + 0x0058], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd04aa06a  ! 571: LDSB_I	ldsb	[%r10 + 0x006a], %r8
	.word 0xc5bad81f  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc8a907f  ! 573: LDUBA_R	lduba	[%r10, %r31] 0x83, %r6
	.word 0xc2d2e01e  ! 574: LDSHA_I	ldsha	[%r11, + 0x001e] %asi, %r1
	.word 0xd1ba997f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcc4a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xccca915f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xd1e2901f  ! 579: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc6da901f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc92d05f  ! 581: LDUHA_R	lduha	[%r11, %r31] 0x82, %r6
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd00aa06f  ! 583: LDUB_I	ldub	[%r10 + 0x006f], %r8
	.word 0xcedaa038  ! 584: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r7
	.word 0xd2daa020  ! 585: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba999f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd05ae030  ! 587: LDX_I	ldx	[%r11 + 0x0030], %r8
	.word 0xcc8aa05d  ! 588: LDUBA_I	lduba	[%r10, + 0x005d] %asi, %r6
	.word 0xc522801f  ! 589: STF_R	st	%f2, [%r31, %r10]
	.word 0xc7bad97f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbae048  ! 591: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc9baa040  ! 592: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc9e2903f  ! 593: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba98bf  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd19ae030  ! 595: LDDFA_I	ldda	[%r11, 0x0030], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2901f  ! 596: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc842801f  ! 597: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcc52e07a  ! 598: LDSH_I	ldsh	[%r11 + 0x007a], %r6
	.word 0xcbba995f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba993f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba99bf  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbbae058  ! 604: STDFA_I	stda	%f5, [0x0058, %r11]
	.word 0xc3ba981f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba991f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102a05c  ! 607: LDF_I	ld	[%r10, 0x005c], %f8
	.word 0xc59ae008  ! 608: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xcff2903f  ! 609: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba991f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702a064  ! 611: LDF_I	ld	[%r10, 0x0064], %f3
	.word 0xd302c01f  ! 612: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd3e2901f  ! 613: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba997f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba985f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692905f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xccc2a028  ! 619: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r6
	.word 0xc9ba987f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcac2a050  ! 621: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r5
	.word 0xc80a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xd0d2907f  ! 624: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r8
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca82d17f  ! 626: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r5
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcfbae020  ! 628: STDFA_I	stda	%f7, [0x0020, %r11]
	.word 0xcb9ae018  ! 629: LDDFA_I	ldda	[%r11, 0x0018], %f5
	.word 0xc9bae068  ! 630: STDFA_I	stda	%f4, [0x0068, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf02801f  ! 631: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba997f  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd22c01f  ! 633: STF_R	st	%f6, [%r31, %r11]
	.word 0xc65a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5f2903f  ! 635: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba995f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd25a801f  ! 638: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc3bad87f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc1a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcad2911f  ! 642: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xd28a917f  ! 643: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcd22801f  ! 645: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd39aa000  ! 646: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xc812801f  ! 647: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc6d2e05c  ! 648: LDSHA_I	ldsha	[%r11, + 0x005c] %asi, %r3
	.word 0xc25ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xce4aa04d  ! 650: LDSB_I	ldsb	[%r10 + 0x004d], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d11f  ! 652: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xd2dad17f  ! 653: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r9
	.word 0xc3ba995f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc12801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3f2d13f  ! 657: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xccd2903f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc79ae038  ! 659: LDDFA_I	ldda	[%r11, 0x0038], %f3
	.word 0xd3ba995f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc452e04c  ! 666: LDSH_I	ldsh	[%r11 + 0x004c], %r2
	.word 0xc3baa030  ! 667: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xcdba987f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca12801f  ! 670: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2903f  ! 671: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc9baa020  ! 673: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc5ba985f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc60a801f  ! 675: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad93f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca92e02c  ! 677: LDUHA_I	lduha	[%r11, + 0x002c] %asi, %r5
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcd02c01f  ! 679: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcfe2901f  ! 680: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2903f  ! 681: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2903f  ! 683: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcf9ae058  ! 684: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xceca915f  ! 685: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc5a801f  ! 686: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc9baa018  ! 687: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xcc82a02c  ! 688: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r6
	.word 0xcb9ae078  ! 689: LDDFA_I	ldda	[%r11, 0x0078], %f5
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc852801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc41a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3ba995f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc5bae038  ! 694: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xc40aa06c  ! 695: LDUB_I	ldub	[%r10 + 0x006c], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcec2e01c  ! 696: LDSWA_I	ldswa	[%r11, + 0x001c] %asi, %r7
	.word 0xcfe2913f  ! 697: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xccc2913f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xd1bad99f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc40ae042  ! 700: LDUB_I	ldub	[%r11 + 0x0042], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca02801f  ! 701: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3f2d01f  ! 702: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc24ae002  ! 704: LDSB_I	ldsb	[%r11 + 0x0002], %r1
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 707: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc722801f  ! 708: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad85f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd28a915f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r9
	.word 0xc3baa038  ! 712: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2903f  ! 714: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd092a02e  ! 715: LDUHA_I	lduha	[%r10, + 0x002e] %asi, %r8
TH_LABEL715:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd39aa000  ! 718: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xc842a040  ! 719: LDSW_I	ldsw	[%r10 + 0x0040], %r4
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad87f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcad2915f  ! 722: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r5
	.word 0xcfbad89f  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 725: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad91f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd212c01f  ! 728: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc7baa020  ! 729: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xca5ac01f  ! 730: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2913f  ! 731: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc44ae04c  ! 732: LDSB_I	ldsb	[%r11 + 0x004c], %r2
	.word 0xc6c2913f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r3
	.word 0xca42a00c  ! 734: LDSW_I	ldsw	[%r10 + 0x000c], %r5
	.word 0xc84ae02d  ! 735: LDSB_I	ldsb	[%r11 + 0x002d], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba997f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922801f  ! 737: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca42a05c  ! 740: LDSW_I	ldsw	[%r10 + 0x005c], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd00a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcfba997f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 744: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2913f  ! 746: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc79aa060  ! 747: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xcfba98bf  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 749: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcc82a050  ! 750: LDUWA_I	lduwa	[%r10, + 0x0050] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc45aa048  ! 751: LDX_I	ldx	[%r10 + 0x0048], %r2
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba98bf  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc5baa070  ! 755: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xce5aa030  ! 756: LDX_I	ldx	[%r10 + 0x0030], %r7
	.word 0xc25aa038  ! 757: LDX_I	ldx	[%r10 + 0x0038], %r1
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bae050  ! 759: STDFA_I	stda	%f8, [0x0050, %r11]
	.word 0xcec2a040  ! 760: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba997f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc692e06e  ! 762: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r3
	.word 0xc722c01f  ! 763: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9ba981f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302a010  ! 765: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2911f  ! 766: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba993f  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcc1aa020  ! 770: LDD_I	ldd	[%r10 + 0x0020], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba997f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8caa071  ! 773: LDSBA_I	ldsba	[%r10, + 0x0071] %asi, %r4
	.word 0xc7ba989f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc902801f  ! 776: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc45ac01f  ! 777: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd102c01f  ! 778: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd3bad97f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xceda903f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d11f  ! 782: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad89f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xceca901f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba999f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba987f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5baa070  ! 789: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xcdba997f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd01aa058  ! 792: LDD_I	ldd	[%r10 + 0x0058], %r8
	.word 0xc902a06c  ! 793: LDF_I	ld	[%r10, 0x006c], %f4
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcf22c01f  ! 795: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba999f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xceda907f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x83, %r7
	.word 0xc7ba995f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba991f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc892e04a  ! 806: LDUHA_I	lduha	[%r11, + 0x004a] %asi, %r4
	.word 0xc88a907f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xd39ae040  ! 808: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xc88aa030  ! 809: LDUBA_I	lduba	[%r10, + 0x0030] %asi, %r4
	.word 0xd05a801f  ! 810: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba991f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc5ae010  ! 813: LDX_I	ldx	[%r11 + 0x0010], %r6
	.word 0xc7e2911f  ! 814: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba981f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc702801f  ! 816: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc242c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc902e014  ! 818: LDF_I	ld	[%r11, 0x0014], %f4
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc68a901f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc2d2d17f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r1
	.word 0xc6daa020  ! 823: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r3
	.word 0xd3ba981f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc82a00c  ! 825: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba995f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd122c01f  ! 827: STF_R	st	%f8, [%r31, %r11]
	.word 0xcfbad85f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad89f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85ae010  ! 832: LDX_I	ldx	[%r11 + 0x0010], %r4
	.word 0xd202a044  ! 833: LDUW_I	lduw	[%r10 + 0x0044], %r9
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd05ac01f  ! 835: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc40a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad87f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce52c01f  ! 839: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcbbaa078  ! 840: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd19aa030  ! 841: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba981f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4caa051  ! 844: LDSBA_I	ldsba	[%r10, + 0x0051] %asi, %r2
	.word 0xc3e2911f  ! 845: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302e064  ! 846: LDF_I	ld	[%r11, 0x0064], %f1
	.word 0xc5e2901f  ! 847: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2903f  ! 848: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcbbae040  ! 850: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bad9bf  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d13f  ! 852: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad87f  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL855:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd292a032  ! 856: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r9
	.word 0xc5baa030  ! 857: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xce82e05c  ! 862: LDUWA_I	lduwa	[%r11, + 0x005c] %asi, %r7
	.word 0xc5ba983f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca4aa074  ! 865: LDSB_I	ldsb	[%r10 + 0x0074], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd212a07a  ! 866: LDUH_I	lduh	[%r10 + 0x007a], %r9
	.word 0xcbbae048  ! 867: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc9e2913f  ! 868: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba991f  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7bae078  ! 870: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc8c2a05c  ! 871: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r4
	.word 0xc9e2d01f  ! 872: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad91f  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02c01f  ! 875: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba985f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc2daa020  ! 880: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce42c01f  ! 881: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd282e034  ! 882: LDUWA_I	lduwa	[%r11, + 0x0034] %asi, %r9
	.word 0xc3bad89f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcb02c01f  ! 885: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf9ae038  ! 886: LDDFA_I	ldda	[%r11, 0x0038], %f7
	.word 0xd25aa030  ! 887: LDX_I	ldx	[%r10 + 0x0030], %r9
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba997f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd22801f  ! 891: STF_R	st	%f6, [%r31, %r10]
	.word 0xd282a074  ! 892: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r9
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xd39aa070  ! 895: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502a014  ! 896: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xcd02e05c  ! 897: LDF_I	ld	[%r11, 0x005c], %f6
	.word 0xc9bad97f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc40ac01f  ! 900: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc802e010  ! 901: LDUW_I	lduw	[%r11 + 0x0010], %r4
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad9bf  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad89f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd302e010  ! 907: LDF_I	ld	[%r11, 0x0010], %f9
	.word 0xc84ae077  ! 908: LDSB_I	ldsb	[%r11 + 0x0077], %r4
	.word 0xc7ba993f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd3bae070  ! 910: STDFA_I	stda	%f9, [0x0070, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba993f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc02a050  ! 912: LDUW_I	lduw	[%r10 + 0x0050], %r6
	.word 0xd1ba999f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1bae078  ! 915: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba995f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd02e070  ! 917: LDF_I	ld	[%r11, 0x0070], %f6
	.word 0xcbbaa010  ! 918: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xcdf2d13f  ! 919: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xce4ac01f  ! 920: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc402c01f  ! 921: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc842a008  ! 923: LDSW_I	ldsw	[%r10 + 0x0008], %r4
	.word 0xcc52c01f  ! 924: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc7e2d13f  ! 925: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa028  ! 926: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xd2d2d13f  ! 927: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r9
	.word 0xca92a062  ! 928: LDUHA_I	lduha	[%r10, + 0x0062] %asi, %r5
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d13f  ! 930: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfe2d01f  ! 931: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 934: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcd9ae000  ! 935: LDDFA_I	ldda	[%r11, 0x0000], %f6
TH_LABEL935:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 937: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd3bae070  ! 938: STDFA_I	stda	%f9, [0x0070, %r11]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc1aa070  ! 940: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad91f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc202801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xd3bae048  ! 943: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd102a05c  ! 945: LDF_I	ld	[%r10, 0x005c], %f8
TH_LABEL945:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba991f  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2d2e050  ! 949: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r1
	.word 0xc7e2913f  ! 950: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba981f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba991f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc89ae040  ! 956: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r4
	.word 0xc4dae030  ! 957: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r2
	.word 0xca0aa019  ! 958: LDUB_I	ldub	[%r10 + 0x0019], %r5
	.word 0xc8c2905f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xca82a018  ! 960: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r5
TH_LABEL960:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba98bf  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82a074  ! 964: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r5
	.word 0xcbba991f  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2901f  ! 966: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba987f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 968: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL970:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0cad07f  ! 971: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r8
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc20aa014  ! 974: LDUB_I	ldub	[%r10 + 0x0014], %r1
	.word 0xcbba98bf  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcd02801f  ! 977: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc5ba98bf  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc292a00e  ! 979: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r1
	.word 0xd1f2913f  ! 980: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6daa050  ! 981: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r3
	.word 0xd1ba989f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82e014  ! 983: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r5
	.word 0xc9ba987f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba999f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa008  ! 987: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xd122801f  ! 988: STF_R	st	%f8, [%r31, %r10]
	.word 0xd042a00c  ! 989: LDSW_I	ldsw	[%r10 + 0x000c], %r8
	.word 0xcb9aa010  ! 990: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xc41aa048  ! 992: LDD_I	ldd	[%r10 + 0x0048], %r2
	.word 0xc7bad83f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc82e064  ! 994: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r6
	.word 0xcbba993f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd092e004  ! 997: LDUHA_I	lduha	[%r11, + 0x0004] %asi, %r8
	.word 0xcbe2d13f  ! 998: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad91f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd282907f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r9
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
	.word 0xc7f2911f  ! 1: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xd102801f  ! 2: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc5ba983f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbaa030  ! 5: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2913f  ! 6: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcaca917f  ! 7: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xd1bad91f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d03f  ! 10: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2ca907f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 14: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc402a048  ! 15: LDUW_I	lduw	[%r10 + 0x0048], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc5baa050  ! 17: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc7baa010  ! 18: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xc99aa020  ! 19: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba999f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc6cad05f  ! 26: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r3
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9ae038  ! 29: LDDFA_I	ldda	[%r11, 0x0038], %f7
	.word 0xcfbad9bf  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc692913f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xcbba98bf  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce5ac01f  ! 33: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xd1bad95f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd22c01f  ! 35: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba999f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc6daa018  ! 38: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r3
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8d2917f  ! 40: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r4
TH_LABEL40:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc722801f  ! 41: STF_R	st	%f3, [%r31, %r10]
	.word 0xced2e028  ! 42: LDSHA_I	ldsha	[%r11, + 0x0028] %asi, %r7
	.word 0xc802e05c  ! 43: LDUW_I	lduw	[%r11 + 0x005c], %r4
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
TH_LABEL45:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc64aa069  ! 46: LDSB_I	ldsb	[%r10 + 0x0069], %r3
	.word 0xc5ba999f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd1baa048  ! 48: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xcff2911f  ! 49: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba99bf  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcff2911f  ! 51: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd08a901f  ! 52: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xd302a034  ! 53: LDF_I	ld	[%r10, 0x0034], %f9
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2913f  ! 55: CASA_I	casa	[%r10] 0x89, %r31, %r3
TH_LABEL55:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc09aa070  ! 56: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r0
	.word 0xd322801f  ! 57: STF_R	st	%f9, [%r31, %r10]
	.word 0xc41aa030  ! 58: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xc3bad81f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc642c01f  ! 60: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf9aa060  ! 61: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xc502801f  ! 62: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca02a018  ! 63: LDUW_I	lduw	[%r10 + 0x0018], %r5
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc68a903f  ! 65: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcedad17f  ! 66: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r7
	.word 0xd1e2901f  ! 67: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcacad03f  ! 68: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r5
	.word 0xd1ba987f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xc922801f  ! 72: STF_R	st	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba983f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd3baa018  ! 75: STDFA_I	stda	%f9, [0x0018, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2c2915f  ! 76: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xcf9ae040  ! 77: LDDFA_I	ldda	[%r11, 0x0040], %f7
	.word 0xcdf2d11f  ! 78: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad87f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL80:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc302a05c  ! 81: LDF_I	ld	[%r10, 0x005c], %f1
	.word 0xc242801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xd1ba99bf  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902a02c  ! 84: LDF_I	ld	[%r10, 0x002c], %f4
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba983f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc65a801f  ! 87: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcbbad89f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd20aa02b  ! 89: LDUB_I	ldub	[%r10 + 0x002b], %r9
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL90:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba987f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102801f  ! 93: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc01aa040  ! 94: LDD_I	ldd	[%r10 + 0x0040], %r0
	.word 0xd3ba991f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba997f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 97: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcd02c01f  ! 98: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd302a010  ! 99: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xcfba993f  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc92e034  ! 101: LDUHA_I	lduha	[%r11, + 0x0034] %asi, %r6
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc60aa027  ! 103: LDUB_I	ldub	[%r10 + 0x0027], %r3
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc6d2913f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba989f  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba999f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xcf9aa060  ! 110: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca02c01f  ! 111: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xc9e2901f  ! 112: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 115: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2d01f  ! 116: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d11f  ! 118: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc6da903f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x81, %r3
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2d2d01f  ! 121: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r9
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2903f  ! 123: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2901f  ! 125: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba981f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 127: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba999f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd19ae070  ! 131: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xd3ba987f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc212e07e  ! 133: LDUH_I	lduh	[%r11 + 0x007e], %r1
	.word 0xcdbad97f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc44a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xcfbae018  ! 138: STDFA_I	stda	%f7, [0x0018, %r11]
	.word 0xc7ba993f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 140: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc3baa020  ! 142: STDFA_I	stda	%f1, [0x0020, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcb9ae070  ! 145: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae028  ! 146: LDDFA_I	ldda	[%r11, 0x0028], %f1
	.word 0xcfbad81f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc642a01c  ! 148: LDSW_I	ldsw	[%r10 + 0x001c], %r3
	.word 0xc842801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcc1a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcb02e070  ! 152: LDF_I	ld	[%r11, 0x0070], %f5
	.word 0xd3bad97f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc45ae020  ! 155: LDX_I	ldx	[%r11 + 0x0020], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc302e024  ! 156: LDF_I	ld	[%r11, 0x0024], %f1
	.word 0xc2ca913f  ! 157: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r1
	.word 0xcbbad8bf  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc09aa008  ! 160: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r0
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba981f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc292a04c  ! 162: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r1
	.word 0xd042801f  ! 163: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc3bad89f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc502a070  ! 166: LDF_I	ld	[%r10, 0x0070], %f2
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc60aa077  ! 168: LDUB_I	ldub	[%r10 + 0x0077], %r3
	.word 0xd3bad93f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xceca917f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba999f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf9aa008  ! 172: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xd212c01f  ! 173: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xcdba989f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba99bf  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc88ae066  ! 177: LDUBA_I	lduba	[%r11, + 0x0066] %asi, %r4
	.word 0xd1f2901f  ! 178: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcdbae010  ! 179: STDFA_I	stda	%f6, [0x0010, %r11]
	.word 0xc802e02c  ! 180: LDUW_I	lduw	[%r11 + 0x002c], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902e034  ! 181: LDF_I	ld	[%r11, 0x0034], %f4
	.word 0xce82913f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r7
	.word 0xcdf2901f  ! 183: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcde2903f  ! 186: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xc612e044  ! 187: LDUH_I	lduh	[%r11 + 0x0044], %r3
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba991f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc842a018  ! 191: LDSW_I	ldsw	[%r10 + 0x0018], %r4
	.word 0xca0aa036  ! 192: LDUB_I	ldub	[%r10 + 0x0036], %r5
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2907f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 197: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcfbae028  ! 199: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xcad2d03f  ! 200: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba985f  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcdbaa020  ! 203: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xcff2d13f  ! 204: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad8bf  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad9bf  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2e022  ! 207: LDSHA_I	ldsha	[%r11, + 0x0022] %asi, %r3
	.word 0xc502801f  ! 208: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcadaa068  ! 209: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r5
	.word 0xc5bad81f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad83f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc242a058  ! 213: LDSW_I	ldsw	[%r10 + 0x0058], %r1
	.word 0xc9ba989f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL215:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce82e018  ! 216: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r7
	.word 0xcacaa032  ! 217: LDSBA_I	ldsba	[%r10, + 0x0032] %asi, %r5
	.word 0xcc92d07f  ! 218: LDUHA_R	lduha	[%r11, %r31] 0x83, %r6
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce02a048  ! 220: LDUW_I	lduw	[%r10 + 0x0048], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba981f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 222: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xceca903f  ! 223: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r7
	.word 0xc202a074  ! 224: LDUW_I	lduw	[%r10 + 0x0074], %r1
	.word 0xcbba987f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf02801f  ! 226: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcbbad8bf  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd252e038  ! 229: LDSH_I	ldsh	[%r11 + 0x0038], %r9
	.word 0xc3ba989f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL230:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bae010  ! 231: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xc922801f  ! 232: STF_R	st	%f4, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba995f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc80ae023  ! 235: LDUB_I	ldub	[%r11 + 0x0023], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce0a801f  ! 236: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf9aa060  ! 239: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad8bf  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc692a03a  ! 243: LDUHA_I	lduha	[%r10, + 0x003a] %asi, %r3
	.word 0xc492a02c  ! 244: LDUHA_I	lduha	[%r10, + 0x002c] %asi, %r2
	.word 0xc3bad91f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd01ae028  ! 246: LDD_I	ldd	[%r11 + 0x0028], %r8
	.word 0xc3ba999f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc89aa058  ! 248: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xd102801f  ! 249: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfba981f  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL250:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca52c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc4c2d05f  ! 252: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r2
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2911f  ! 254: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc82911f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r6
	.word 0xd322801f  ! 257: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc39aa028  ! 259: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xcde2913f  ! 260: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba993f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc5aa030  ! 265: LDX_I	ldx	[%r10 + 0x0030], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbae038  ! 266: STDFA_I	stda	%f6, [0x0038, %r11]
	.word 0xc5ba997f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce0a801f  ! 268: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xccc2d15f  ! 270: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2913f  ! 271: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba983f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc502801f  ! 274: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2911f  ! 276: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2903f  ! 277: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc502a070  ! 278: LDF_I	ld	[%r10, 0x0070], %f2
	.word 0xc7f2913f  ! 279: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xd252801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc99ae028  ! 281: LDDFA_I	ldda	[%r11, 0x0028], %f4
	.word 0xd282901f  ! 282: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r9
	.word 0xc9ba987f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2901f  ! 284: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xc852e03c  ! 285: LDSH_I	ldsh	[%r11 + 0x003c], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc522801f  ! 286: STF_R	st	%f2, [%r31, %r10]
	.word 0xc2d2e040  ! 287: LDSHA_I	ldsha	[%r11, + 0x0040] %asi, %r1
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcad2d01f  ! 289: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xce42801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9e2901f  ! 291: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 293: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc20aa021  ! 294: LDUB_I	ldub	[%r10 + 0x0021], %r1
	.word 0xc68ae015  ! 295: LDUBA_I	lduba	[%r11, + 0x0015] %asi, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd292a000  ! 296: LDUHA_I	lduha	[%r10, + 0x0000] %asi, %r9
	.word 0xc9ba98bf  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba981f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba991f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd02c01f  ! 302: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3bae030  ! 303: STDFA_I	stda	%f9, [0x0030, %r11]
	.word 0xd1e2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd122c01f  ! 305: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba983f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8d2a06c  ! 309: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r4
	.word 0xc79aa020  ! 310: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad8bf  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcad2d07f  ! 312: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r5
	.word 0xc9e2901f  ! 313: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc702a008  ! 314: LDF_I	ld	[%r10, 0x0008], %f3
	.word 0xc20ac01f  ! 315: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2903f  ! 316: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba98bf  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc8c2a00c  ! 319: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r4
	.word 0xc3ba989f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba983f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc79ae050  ! 322: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc702a02c  ! 326: LDF_I	ld	[%r10, 0x002c], %f3
	.word 0xc292907f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xc3e2d03f  ! 328: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad87f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2d01f  ! 331: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc2dad15f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r1
	.word 0xc212a000  ! 333: LDUH_I	lduh	[%r10 + 0x0000], %r1
	.word 0xc412a074  ! 334: LDUH_I	lduh	[%r10 + 0x0074], %r2
	.word 0xc2c2917f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad91f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xce42a074  ! 337: LDSW_I	ldsw	[%r10 + 0x0074], %r7
	.word 0xc522c01f  ! 338: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5ba991f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd052a06a  ! 341: LDSH_I	ldsh	[%r10 + 0x006a], %r8
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc48aa016  ! 343: LDUBA_I	lduba	[%r10, + 0x0016] %asi, %r2
	.word 0xd3e2d01f  ! 344: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc25a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba987f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202801f  ! 350: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad83f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcec2901f  ! 353: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xcbf2903f  ! 354: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xd322801f  ! 355: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd102a01c  ! 356: LDF_I	ld	[%r10, 0x001c], %f8
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d13f  ! 358: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xcdbaa060  ! 359: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb02a034  ! 361: LDF_I	ld	[%r10, 0x0034], %f5
	.word 0xc9ba981f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 363: STF_R	st	%f4, [%r31, %r10]
	.word 0xcff2901f  ! 364: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba989f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd39aa060  ! 368: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xc5bad85f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad91f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc502a008  ! 372: LDF_I	ld	[%r10, 0x0008], %f2
	.word 0xc9bad83f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302c01f  ! 374: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc3e2d01f  ! 375: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad99f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad95f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad89f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc452a05a  ! 384: LDSH_I	ldsh	[%r10 + 0x005a], %r2
	.word 0xc4d2917f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa010  ! 386: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xc922801f  ! 387: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfe2911f  ! 388: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc92a07c  ! 391: LDUHA_I	lduha	[%r10, + 0x007c] %asi, %r6
	.word 0xd1ba999f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2911f  ! 395: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902c01f  ! 397: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc7ba981f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 400: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba985f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb22801f  ! 403: STF_R	st	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 404: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0d2917f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r8
	.word 0xc482901f  ! 407: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xd3f2901f  ! 408: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2903f  ! 409: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc6da901f  ! 410: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2c2a024  ! 411: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r9
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc80aa009  ! 414: LDUB_I	ldub	[%r10 + 0x0009], %r4
	.word 0xc2caa056  ! 415: LDSBA_I	ldsba	[%r10, + 0x0056] %asi, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc882a014  ! 416: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r4
	.word 0xd202801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcdbaa068  ! 418: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2913f  ! 420: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcb22c01f  ! 422: STF_R	st	%f5, [%r31, %r11]
	.word 0xc9f2d01f  ! 423: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc892e016  ! 426: LDUHA_I	lduha	[%r11, + 0x0016] %asi, %r4
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba989f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc4c2e078  ! 430: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd242801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc5baa038  ! 434: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xca92a01e  ! 435: LDUHA_I	lduha	[%r10, + 0x001e] %asi, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad87f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc322c01f  ! 439: STF_R	st	%f1, [%r31, %r11]
	.word 0xd322801f  ! 440: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba981f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc81ae010  ! 444: LDD_I	ldd	[%r11 + 0x0010], %r4
	.word 0xc5bae060  ! 445: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc99ae060  ! 446: LDDFA_I	ldda	[%r11, 0x0060], %f4
	.word 0xc39aa008  ! 447: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xd1ba989f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca12801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc9ba999f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2901f  ! 454: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc20ae02b  ! 455: LDUB_I	ldub	[%r11 + 0x002b], %r1
TH_LABEL455:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce52c01f  ! 456: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xd3ba993f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba983f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca92d13f  ! 460: LDUHA_R	lduha	[%r11, %r31] 0x89, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2901f  ! 461: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba995f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba989f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd2caa033  ! 467: LDSBA_I	ldsba	[%r10, + 0x0033] %asi, %r9
	.word 0xcfbad93f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcac2e028  ! 469: LDSWA_I	ldswa	[%r11, + 0x0028] %asi, %r5
	.word 0xc3e2901f  ! 470: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba999f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 473: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcd9aa030  ! 474: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xc4c2911f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba991f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 477: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba993f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba989f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba987f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2c2d13f  ! 484: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xca4a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2913f  ! 486: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc8ca917f  ! 487: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xcf02801f  ! 488: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd002a048  ! 489: LDUW_I	lduw	[%r10 + 0x0048], %r8
	.word 0xd3ba997f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc8a901f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xc602c01f  ! 492: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xcff2913f  ! 493: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba983f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba991f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf22801f  ! 498: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5ba99bf  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd122801f  ! 502: STF_R	st	%f8, [%r31, %r10]
	.word 0xc4d2905f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xc702a008  ! 504: LDF_I	ld	[%r10, 0x0008], %f3
	.word 0xcdbaa068  ! 505: STDFA_I	stda	%f6, [0x0068, %r10]
TH_LABEL505:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba989f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba997f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc81a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcdf2911f  ! 510: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2913f  ! 511: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcde2911f  ! 512: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba993f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba98bf  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce12c01f  ! 519: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc922c01f  ! 521: STF_R	st	%f4, [%r31, %r11]
	.word 0xc502a010  ! 522: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xcfba981f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc1ae048  ! 524: LDD_I	ldd	[%r11 + 0x0048], %r6
	.word 0xc302a060  ! 525: LDF_I	ld	[%r10, 0x0060], %f1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd322c01f  ! 527: STF_R	st	%f9, [%r31, %r11]
	.word 0xd1e2d03f  ! 528: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xcadad17f  ! 529: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r5
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
TH_LABEL530:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc88a907f  ! 531: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xcdba995f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2901f  ! 534: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcc82901f  ! 538: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xcac2907f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r5
	.word 0xcbba991f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd2d2911f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r9
	.word 0xd3e2913f  ! 542: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc522c01f  ! 545: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2d03f  ! 546: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d13f  ! 548: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4cae000  ! 551: LDSBA_I	ldsba	[%r11, + 0x0000] %asi, %r2
	.word 0xcbba981f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 554: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba995f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba991f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80aa076  ! 559: LDUB_I	ldub	[%r10 + 0x0076], %r4
	.word 0xd04a801f  ! 560: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad95f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d13f  ! 562: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad91f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcd9aa010  ! 565: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc922c01f  ! 566: STF_R	st	%f4, [%r31, %r11]
	.word 0xca5ac01f  ! 567: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xd122c01f  ! 568: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5bad91f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc402a050  ! 570: LDUW_I	lduw	[%r10 + 0x0050], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd24aa071  ! 571: LDSB_I	ldsb	[%r10 + 0x0071], %r9
	.word 0xc5bad87f  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd08a907f  ! 573: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
	.word 0xd0d2e068  ! 574: LDSHA_I	ldsha	[%r11, + 0x0068] %asi, %r8
	.word 0xd1ba989f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc64a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xceca907f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r7
	.word 0xd1e2901f  ! 579: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc4da905f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd292907f  ! 581: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd00aa01a  ! 583: LDUB_I	ldub	[%r10 + 0x001a], %r8
	.word 0xd2daa060  ! 584: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r9
	.word 0xc6daa078  ! 585: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba993f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce5aa068  ! 587: LDX_I	ldx	[%r10 + 0x0068], %r7
	.word 0xc28aa063  ! 588: LDUBA_I	lduba	[%r10, + 0x0063] %asi, %r1
	.word 0xc322c01f  ! 589: STF_R	st	%f1, [%r31, %r11]
	.word 0xc7bad93f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bae018  ! 591: STDFA_I	stda	%f8, [0x0018, %r11]
	.word 0xd3baa028  ! 592: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xc9e2901f  ! 593: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba981f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb9aa000  ! 595: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcde2913f  ! 596: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xd042801f  ! 597: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xcc52a072  ! 598: LDSH_I	ldsh	[%r10 + 0x0072], %r6
	.word 0xcbba99bf  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba993f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba997f  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc7baa038  ! 604: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xc3ba98bf  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba981f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02a058  ! 607: LDF_I	ld	[%r10, 0x0058], %f7
	.word 0xcf9aa070  ! 608: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xcff2901f  ! 609: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba997f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc302a044  ! 611: LDF_I	ld	[%r10, 0x0044], %f1
	.word 0xc902801f  ! 612: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd3e2903f  ! 613: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba987f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba983f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd292913f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x89, %r9
	.word 0xc4c2a06c  ! 619: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r2
	.word 0xc9ba995f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4c2e060  ! 621: LDSWA_I	ldswa	[%r11, + 0x0060] %asi, %r2
	.word 0xd00ac01f  ! 622: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xccd2913f  ! 624: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r6
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd082d13f  ! 626: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r8
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc9baa058  ! 628: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xd19aa038  ! 629: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xd3baa078  ! 630: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf02c01f  ! 631: LDF_R	ld	[%r11, %r31], %f7
	.word 0xd1ba98bf  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd122801f  ! 633: STF_R	st	%f8, [%r31, %r10]
	.word 0xc45a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba99bf  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc45a801f  ! 638: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc3bad85f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL640:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01ac01f  ! 641: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xccd2d11f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r6
	.word 0xce8a913f  ! 643: LDUBA_R	lduba	[%r10, %r31] 0x89, %r7
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc322801f  ! 645: STF_R	st	%f1, [%r31, %r10]
TH_LABEL645:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd19aa028  ! 646: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xc212801f  ! 647: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcad2a004  ! 648: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r5
	.word 0xc25ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xd24aa078  ! 650: LDSB_I	ldsb	[%r10 + 0x0078], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 652: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xd0da901f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xc3ba995f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc212801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd3f2d11f  ! 657: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xc4d2905f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xc39aa020  ! 659: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xd3ba989f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba985f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba997f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd252e05c  ! 666: LDSH_I	ldsh	[%r11 + 0x005c], %r9
	.word 0xcdbae050  ! 667: STDFA_I	stda	%f6, [0x0050, %r11]
	.word 0xcdba987f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc12c01f  ! 670: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2911f  ! 671: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc3baa010  ! 673: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xc5ba981f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc20a801f  ! 675: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad83f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc292a06c  ! 677: LDUHA_I	lduha	[%r10, + 0x006c] %asi, %r1
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd302c01f  ! 679: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcfe2903f  ! 680: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcff2901f  ! 681: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2901f  ! 683: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xd39ae068  ! 684: LDDFA_I	ldda	[%r11, 0x0068], %f9
	.word 0xc2cad15f  ! 685: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca5a801f  ! 686: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xd1baa060  ! 687: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xc282e048  ! 688: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r1
	.word 0xc99aa010  ! 689: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
TH_LABEL690:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc852801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xd01a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd3ba987f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd1baa040  ! 694: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xca0ae02a  ! 695: LDUB_I	ldub	[%r11 + 0x002a], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xccc2a068  ! 696: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r6
	.word 0xcfe2913f  ! 697: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc6c2915f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r3
	.word 0xd1bad81f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce0aa005  ! 700: LDUB_I	ldub	[%r10 + 0x0005], %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce02801f  ! 701: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc3f2d13f  ! 702: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc44ae059  ! 704: LDSB_I	ldsb	[%r11 + 0x0059], %r2
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2913f  ! 707: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc322c01f  ! 708: STF_R	st	%f1, [%r31, %r11]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad93f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd08a913f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xc9bae020  ! 712: STDFA_I	stda	%f4, [0x0020, %r11]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 714: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc492a032  ! 715: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc59ae060  ! 718: LDDFA_I	ldda	[%r11, 0x0060], %f2
	.word 0xc842e060  ! 719: LDSW_I	ldsw	[%r11 + 0x0060], %r4
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad85f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2d07f  ! 722: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r3
	.word 0xcfbad91f  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 725: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad85f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc212801f  ! 728: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd3baa010  ! 729: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xc85a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2913f  ! 731: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xcc4aa032  ! 732: LDSB_I	ldsb	[%r10 + 0x0032], %r6
	.word 0xc8c2907f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r4
	.word 0xc842e03c  ! 734: LDSW_I	ldsw	[%r11 + 0x003c], %r4
	.word 0xca4aa031  ! 735: LDSB_I	ldsb	[%r10 + 0x0031], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba983f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122801f  ! 737: STF_R	st	%f8, [%r31, %r10]
	.word 0xc9ba991f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc842a034  ! 740: LDSW_I	ldsw	[%r10 + 0x0034], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc0ac01f  ! 741: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xcfba993f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 744: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcff2903f  ! 746: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcb9ae028  ! 747: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xcfba987f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 749: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xc482e018  ! 750: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd05aa028  ! 751: LDX_I	ldx	[%r10 + 0x0028], %r8
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba981f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcbbae078  ! 755: STDFA_I	stda	%f5, [0x0078, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc25aa008  ! 756: LDX_I	ldx	[%r10 + 0x0008], %r1
	.word 0xca5aa020  ! 757: LDX_I	ldx	[%r10 + 0x0020], %r5
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1baa008  ! 759: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xc8c2a020  ! 760: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba983f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd092a01a  ! 762: LDUHA_I	lduha	[%r10, + 0x001a] %asi, %r8
	.word 0xcf22801f  ! 763: STF_R	st	%f7, [%r31, %r10]
	.word 0xc9ba981f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702e00c  ! 765: LDF_I	ld	[%r11, 0x000c], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2903f  ! 766: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba981f  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc41aa070  ! 770: LDD_I	ldd	[%r10 + 0x0070], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba999f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4caa01e  ! 773: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r2
	.word 0xc7ba99bf  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302801f  ! 776: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcc5a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc502c01f  ! 778: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd3bad97f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4da917f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d01f  ! 782: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad93f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcccad03f  ! 784: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r6
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba995f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3baa048  ! 789: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xcdba999f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc01aa038  ! 792: LDD_I	ldd	[%r10 + 0x0038], %r0
	.word 0xcb02a074  ! 793: LDF_I	ld	[%r10, 0x0074], %f5
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcf22801f  ! 795: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba981f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc6da907f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc7ba993f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL800:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba987f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc92a046  ! 806: LDUHA_I	lduha	[%r10, + 0x0046] %asi, %r6
	.word 0xc88ad01f  ! 807: LDUBA_R	lduba	[%r11, %r31] 0x80, %r4
	.word 0xcd9aa040  ! 808: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xca8aa07f  ! 809: LDUBA_I	lduba	[%r10, + 0x007f] %asi, %r5
	.word 0xc85ac01f  ! 810: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba987f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce5aa078  ! 813: LDX_I	ldx	[%r10 + 0x0078], %r7
	.word 0xc7e2903f  ! 814: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba98bf  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02801f  ! 816: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd242801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc902a038  ! 818: LDF_I	ld	[%r10, 0x0038], %f4
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcc8a907f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x83, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1e2d01f  ! 821: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd2d2d17f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r9
	.word 0xc4dae040  ! 823: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r2
	.word 0xd3ba987f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc82a070  ! 825: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba98bf  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc722801f  ! 827: STF_R	st	%f3, [%r31, %r10]
	.word 0xcfbad85f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad8bf  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85ae008  ! 832: LDX_I	ldx	[%r11 + 0x0008], %r4
	.word 0xc802a020  ! 833: LDUW_I	lduw	[%r10 + 0x0020], %r4
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc85a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r4
TH_LABEL835:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd00a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad8bf  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc252c01f  ! 839: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcdbaa078  ! 840: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa050  ! 841: LDDFA_I	ldda	[%r10, 0x0050], %f2
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba999f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4caa05f  ! 844: LDSBA_I	ldsba	[%r10, + 0x005f] %asi, %r2
	.word 0xc3e2913f  ! 845: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc302a044  ! 846: LDF_I	ld	[%r10, 0x0044], %f1
	.word 0xc5e2913f  ! 847: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2911f  ! 848: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcbbaa040  ! 850: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bad97f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d11f  ! 852: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad87f  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc892a022  ! 856: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r4
	.word 0xcfbaa070  ! 857: STDFA_I	stda	%f7, [0x0070, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd242801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xce82a024  ! 862: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r7
	.word 0xc5ba985f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc4aa066  ! 865: LDSB_I	ldsb	[%r10 + 0x0066], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce12e064  ! 866: LDUH_I	lduh	[%r11 + 0x0064], %r7
	.word 0xd1baa058  ! 867: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc9e2911f  ! 868: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba989f  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa070  ! 870: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4c2e024  ! 871: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r2
	.word 0xc9e2d11f  ! 872: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad8bf  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd02801f  ! 875: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba995f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc8daa000  ! 880: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc642c01f  ! 881: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xcc82a014  ! 882: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r6
	.word 0xc3bad87f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcf02c01f  ! 885: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19aa058  ! 886: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xc25ae050  ! 887: LDX_I	ldx	[%r11 + 0x0050], %r1
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba993f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb22801f  ! 891: STF_R	st	%f5, [%r31, %r10]
	.word 0xc282a008  ! 892: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r1
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xd19aa040  ! 895: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902a01c  ! 896: LDF_I	ld	[%r10, 0x001c], %f4
	.word 0xd102a008  ! 897: LDF_I	ld	[%r10, 0x0008], %f8
	.word 0xc9bad9bf  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0ac01f  ! 900: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc02e020  ! 901: LDUW_I	lduw	[%r11 + 0x0020], %r6
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad81f  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad91f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302a06c  ! 907: LDF_I	ld	[%r10, 0x006c], %f1
	.word 0xd24aa00d  ! 908: LDSB_I	ldsb	[%r10 + 0x000d], %r9
	.word 0xc7ba997f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbae040  ! 910: STDFA_I	stda	%f7, [0x0040, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba98bf  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc02a000  ! 912: LDUW_I	lduw	[%r10 + 0x0000], %r6
	.word 0xd1ba993f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd3baa030  ! 915: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba981f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd102e044  ! 917: LDF_I	ld	[%r11, 0x0044], %f8
	.word 0xcdbae008  ! 918: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xcdf2d03f  ! 919: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xd24ac01f  ! 920: LDSB_R	ldsb	[%r11 + %r31], %r9
TH_LABEL920:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce02801f  ! 921: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc242e070  ! 923: LDSW_I	ldsw	[%r11 + 0x0070], %r1
	.word 0xd252801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc7e2d01f  ! 925: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbaa008  ! 926: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xc4d2913f  ! 927: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xcc92a006  ! 928: LDUHA_I	lduha	[%r10, + 0x0006] %asi, %r6
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d13f  ! 930: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfe2d03f  ! 931: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d01f  ! 934: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xc99aa058  ! 935: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 937: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd3baa030  ! 938: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc41aa060  ! 940: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad91f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc202c01f  ! 942: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc7baa030  ! 943: STDFA_I	stda	%f3, [0x0030, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc502e05c  ! 945: LDF_I	ld	[%r11, 0x005c], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba991f  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xced2a056  ! 949: LDSHA_I	ldsha	[%r10, + 0x0056] %asi, %r7
	.word 0xc7e2911f  ! 950: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba981f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba981f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc49ae058  ! 956: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r2
	.word 0xc8dae058  ! 957: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r4
	.word 0xc40aa037  ! 958: LDUB_I	ldub	[%r10 + 0x0037], %r2
	.word 0xc8c2903f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xca82a044  ! 960: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba989f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba985f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd082e000  ! 964: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r8
	.word 0xcbba99bf  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2903f  ! 966: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbba995f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 968: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcccad01f  ! 971: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r6
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad95f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc20ae04b  ! 974: LDUB_I	ldub	[%r11 + 0x004b], %r1
	.word 0xcbba985f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc702801f  ! 977: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc5ba989f  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd292e07e  ! 979: LDUHA_I	lduha	[%r11, + 0x007e] %asi, %r9
	.word 0xd1f2913f  ! 980: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2daa000  ! 981: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r9
	.word 0xd1ba987f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82e010  ! 983: LDUWA_I	lduwa	[%r11, + 0x0010] %asi, %r5
	.word 0xc9ba987f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba995f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3bae000  ! 987: STDFA_I	stda	%f9, [0x0000, %r11]
	.word 0xcb22801f  ! 988: STF_R	st	%f5, [%r31, %r10]
	.word 0xc842e02c  ! 989: LDSW_I	ldsw	[%r11 + 0x002c], %r4
	.word 0xc59ae050  ! 990: LDDFA_I	ldda	[%r11, 0x0050], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xc01ae038  ! 992: LDD_I	ldd	[%r11 + 0x0038], %r0
	.word 0xc7bad8bf  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc882a010  ! 994: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r4
	.word 0xcbba981f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xce92a022  ! 997: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r7
	.word 0xcbe2d01f  ! 998: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad93f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc482913f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	subcc %r30, 1, %r30
	bnz  TH3_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	add	%g0,	0x1,	%r30
TH2_LOOP_START:
	.word 0xc7f2901f  ! 1: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcf02c01f  ! 2: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc5ba995f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc3baa070  ! 5: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2901f  ! 6: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc2ca907f  ! 7: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd1bad83f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d01f  ! 10: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2ca907f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 14: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xca02e03c  ! 15: LDUW_I	lduw	[%r11 + 0x003c], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc9bae058  ! 17: STDFA_I	stda	%f4, [0x0058, %r11]
	.word 0xd3bae058  ! 18: STDFA_I	stda	%f9, [0x0058, %r11]
	.word 0xc79aa038  ! 19: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba997f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 25: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2ca901f  ! 26: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa070  ! 29: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xcfbad85f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce92911f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x88, %r7
	.word 0xcbba981f  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd25ac01f  ! 33: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd1bad91f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd22801f  ! 35: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba999f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc6dae068  ! 38: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r3
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc6d2d01f  ! 40: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd322c01f  ! 41: STF_R	st	%f9, [%r31, %r11]
	.word 0xced2a03c  ! 42: LDSHA_I	ldsha	[%r10, + 0x003c] %asi, %r7
	.word 0xc402e034  ! 43: LDUW_I	lduw	[%r11 + 0x0034], %r2
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc24ae066  ! 46: LDSB_I	ldsb	[%r11 + 0x0066], %r1
	.word 0xc5ba983f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5bae078  ! 48: STDFA_I	stda	%f2, [0x0078, %r11]
	.word 0xcff2903f  ! 49: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba98bf  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2911f  ! 51: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd08ad11f  ! 52: LDUBA_R	lduba	[%r11, %r31] 0x88, %r8
	.word 0xd102a06c  ! 53: LDF_I	ld	[%r10, 0x006c], %f8
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2911f  ! 55: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc09aa028  ! 56: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r0
	.word 0xd322801f  ! 57: STF_R	st	%f9, [%r31, %r10]
	.word 0xc01aa008  ! 58: LDD_I	ldd	[%r10 + 0x0008], %r0
	.word 0xc3bad81f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc42801f  ! 60: LDSW_R	ldsw	[%r10 + %r31], %r6
TH_LABEL60:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc79aa038  ! 61: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xc502801f  ! 62: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc202a064  ! 63: LDUW_I	lduw	[%r10 + 0x0064], %r1
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc8ad01f  ! 65: LDUBA_R	lduba	[%r11, %r31] 0x80, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6da917f  ! 66: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xd1e2911f  ! 67: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd2cad01f  ! 68: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xd1ba987f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xc922801f  ! 72: STF_R	st	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba987f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcdbaa038  ! 75: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2c2915f  ! 76: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xd39ae050  ! 77: LDDFA_I	ldda	[%r11, 0x0050], %f9
	.word 0xcdf2d01f  ! 78: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad85f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd302e06c  ! 81: LDF_I	ld	[%r11, 0x006c], %f9
	.word 0xc642801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd1ba99bf  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302a024  ! 84: LDF_I	ld	[%r10, 0x0024], %f1
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba99bf  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc65a801f  ! 87: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcbbad8bf  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc20aa016  ! 89: LDUB_I	ldub	[%r10 + 0x0016], %r1
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba989f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302c01f  ! 93: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc01aa070  ! 94: LDD_I	ldd	[%r10 + 0x0070], %r0
	.word 0xd3ba999f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba981f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 97: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xcf02801f  ! 98: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc302a064  ! 99: LDF_I	ld	[%r10, 0x0064], %f1
	.word 0xcfba993f  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc492e054  ! 101: LDUHA_I	lduha	[%r11, + 0x0054] %asi, %r2
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc20aa012  ! 103: LDUB_I	ldub	[%r10 + 0x0012], %r1
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcad2903f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba98bf  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc79aa050  ! 110: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc602c01f  ! 111: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc9e2903f  ! 112: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba983f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 115: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2d01f  ! 116: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d11f  ! 118: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xd2da901f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd0d2915f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2913f  ! 123: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2901f  ! 125: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba98bf  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 127: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba985f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd9ae000  ! 131: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xd3ba981f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce12a05c  ! 133: LDUH_I	lduh	[%r10 + 0x005c], %r7
	.word 0xcdbad85f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca4a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xcbbaa020  ! 138: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xc7ba98bf  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922c01f  ! 140: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3baa040  ! 142: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcd9ae058  ! 145: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc99aa060  ! 146: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xcfbad97f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc42a008  ! 148: LDSW_I	ldsw	[%r10 + 0x0008], %r6
	.word 0xd042801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xcc1ac01f  ! 150: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcd02a04c  ! 152: LDF_I	ld	[%r10, 0x004c], %f6
	.word 0xd3bad9bf  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65aa060  ! 155: LDX_I	ldx	[%r10 + 0x0060], %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc502a01c  ! 156: LDF_I	ld	[%r10, 0x001c], %f2
	.word 0xc6cad15f  ! 157: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r3
	.word 0xcbbad81f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc9aa040  ! 160: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba99bf  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc492a05a  ! 162: LDUHA_I	lduha	[%r10, + 0x005a] %asi, %r2
	.word 0xca42801f  ! 163: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc3bad93f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd02a028  ! 166: LDF_I	ld	[%r10, 0x0028], %f6
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc80aa070  ! 168: LDUB_I	ldub	[%r10 + 0x0070], %r4
	.word 0xd3bad8bf  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2ca915f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba987f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc59aa068  ! 172: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xc212c01f  ! 173: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xcdba997f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba987f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc48aa002  ! 177: LDUBA_I	lduba	[%r10, + 0x0002] %asi, %r2
	.word 0xd1f2911f  ! 178: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1bae020  ! 179: STDFA_I	stda	%f8, [0x0020, %r11]
	.word 0xc402a01c  ! 180: LDUW_I	lduw	[%r10 + 0x001c], %r2
TH_LABEL180:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd302e014  ! 181: LDF_I	ld	[%r11, 0x0014], %f9
	.word 0xc682901f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xcdf2901f  ! 183: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcde2911f  ! 186: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xd012e02c  ! 187: LDUH_I	lduh	[%r11 + 0x002c], %r8
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba999f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce42a07c  ! 191: LDSW_I	ldsw	[%r10 + 0x007c], %r7
	.word 0xd00ae009  ! 192: LDUB_I	ldub	[%r11 + 0x0009], %r8
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2915f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 197: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc7baa068  ! 199: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xc2d2903f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba995f  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc9baa040  ! 203: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xcff2d11f  ! 204: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad83f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad99f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2e006  ! 207: LDSHA_I	ldsha	[%r11, + 0x0006] %asi, %r2
	.word 0xcb02801f  ! 208: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd2daa038  ! 209: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r9
	.word 0xc5bad85f  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad91f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca42a060  ! 213: LDSW_I	ldsw	[%r10 + 0x0060], %r5
	.word 0xc9ba995f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd282a020  ! 216: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r9
	.word 0xd2cae003  ! 217: LDSBA_I	ldsba	[%r11, + 0x0003] %asi, %r9
	.word 0xca92901f  ! 218: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce02e07c  ! 220: LDUW_I	lduw	[%r11 + 0x007c], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba997f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 222: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd0cad13f  ! 223: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r8
	.word 0xca02e00c  ! 224: LDUW_I	lduw	[%r11 + 0x000c], %r5
	.word 0xcbba99bf  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd102801f  ! 226: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcbbad99f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc252a058  ! 229: LDSH_I	ldsh	[%r10 + 0x0058], %r1
	.word 0xc3ba981f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbaa060  ! 231: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xc722801f  ! 232: STF_R	st	%f3, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba997f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce0aa067  ! 235: LDUB_I	ldub	[%r10 + 0x0067], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc80ac01f  ! 236: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba991f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb9ae058  ! 239: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad97f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd092e058  ! 243: LDUHA_I	lduha	[%r11, + 0x0058] %asi, %r8
	.word 0xca92e02e  ! 244: LDUHA_I	lduha	[%r11, + 0x002e] %asi, %r5
	.word 0xc3bad87f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1ae008  ! 246: LDD_I	ldd	[%r11 + 0x0008], %r6
	.word 0xc3ba993f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc89aa040  ! 248: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xcd02801f  ! 249: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcfba999f  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc652801f  ! 251: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xd0c2903f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 254: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL255:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc282915f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r1
	.word 0xcf22801f  ! 257: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3ba993f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19aa018  ! 259: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcde2911f  ! 260: CASA_I	casa	[%r10] 0x88, %r31, %r6
TH_LABEL260:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba981f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc45ae020  ! 265: LDX_I	ldx	[%r11 + 0x0020], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbaa028  ! 266: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xc5ba98bf  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc0ac01f  ! 268: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd0c2d03f  ! 270: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2913f  ! 271: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba987f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302c01f  ! 274: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2901f  ! 276: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 277: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc902e070  ! 278: LDF_I	ld	[%r11, 0x0070], %f4
	.word 0xc7f2903f  ! 279: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xd052801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd39aa000  ! 281: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xcc82d13f  ! 282: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r6
	.word 0xc9ba987f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcac2915f  ! 284: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r5
	.word 0xc252a052  ! 285: LDSH_I	ldsh	[%r10 + 0x0052], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc522801f  ! 286: STF_R	st	%f2, [%r31, %r10]
	.word 0xc6d2a01e  ! 287: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r3
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd0d2915f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xcc42801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2901f  ! 291: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 293: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc80ae074  ! 294: LDUB_I	ldub	[%r11 + 0x0074], %r4
	.word 0xd28ae024  ! 295: LDUBA_I	lduba	[%r11, + 0x0024] %asi, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd292a02e  ! 296: LDUHA_I	lduha	[%r10, + 0x002e] %asi, %r9
	.word 0xc9ba98bf  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba997f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL300:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba993f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 302: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1bae050  ! 303: STDFA_I	stda	%f8, [0x0050, %r11]
	.word 0xd1e2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc322801f  ! 305: STF_R	st	%f1, [%r31, %r10]
TH_LABEL305:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba989f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcad2a072  ! 309: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r5
	.word 0xc39aa068  ! 310: LDDFA_I	ldda	[%r10, 0x0068], %f1
TH_LABEL310:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad91f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd0d2903f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xc9e2901f  ! 313: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcd02e060  ! 314: LDF_I	ld	[%r11, 0x0060], %f6
	.word 0xce0a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2903f  ! 316: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba995f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xd2c2e00c  ! 319: LDSWA_I	ldswa	[%r11, + 0x000c] %asi, %r9
	.word 0xc3ba995f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL320:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba985f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39aa070  ! 322: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba98bf  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc902e070  ! 326: LDF_I	ld	[%r11, 0x0070], %f4
	.word 0xc692911f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x88, %r3
	.word 0xc3e2d11f  ! 328: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad87f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2d01f  ! 331: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xccda901f  ! 332: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xce12a058  ! 333: LDUH_I	lduh	[%r10 + 0x0058], %r7
	.word 0xd012a01a  ! 334: LDUH_I	lduh	[%r10 + 0x001a], %r8
	.word 0xd2c2d05f  ! 335: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad93f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca42a074  ! 337: LDSW_I	ldsw	[%r10 + 0x0074], %r5
	.word 0xcb22c01f  ! 338: STF_R	st	%f5, [%r31, %r11]
	.word 0xc5ba989f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc652a056  ! 341: LDSH_I	ldsh	[%r10 + 0x0056], %r3
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc88ae068  ! 343: LDUBA_I	lduba	[%r11, + 0x0068] %asi, %r4
	.word 0xd3e2d13f  ! 344: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc85a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba993f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc402c01f  ! 350: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad91f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2915f  ! 353: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xcbf2903f  ! 354: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc522801f  ! 355: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb02e014  ! 356: LDF_I	ld	[%r11, 0x0014], %f5
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d11f  ! 358: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xc7baa030  ! 359: STDFA_I	stda	%f3, [0x0030, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc902a068  ! 361: LDF_I	ld	[%r10, 0x0068], %f4
	.word 0xc9ba987f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922c01f  ! 363: STF_R	st	%f4, [%r31, %r11]
	.word 0xcff2913f  ! 364: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba991f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc99aa048  ! 368: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xc5bad89f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bad81f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02a02c  ! 372: LDF_I	ld	[%r10, 0x002c], %f7
	.word 0xc9bad81f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302801f  ! 374: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3e2d03f  ! 375: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3bad89f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad97f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad89f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc852e06a  ! 384: LDSH_I	ldsh	[%r11 + 0x006a], %r4
	.word 0xc2d2917f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99aa038  ! 386: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xc922801f  ! 387: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfe2903f  ! 388: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL390:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc892a07e  ! 391: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r4
	.word 0xd1ba98bf  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2903f  ! 395: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba997f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302801f  ! 397: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7ba983f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2913f  ! 400: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba987f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 403: STF_R	st	%f3, [%r31, %r10]
	.word 0xcb22801f  ! 404: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2d2d15f  ! 406: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r9
	.word 0xcc82915f  ! 407: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xd3f2913f  ! 408: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2901f  ! 409: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc6da911f  ! 410: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8c2e060  ! 411: LDSWA_I	ldswa	[%r11, + 0x0060] %asi, %r4
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc60ae042  ! 414: LDUB_I	ldub	[%r11 + 0x0042], %r3
	.word 0xc6caa06c  ! 415: LDSBA_I	ldsba	[%r10, + 0x006c] %asi, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc282e03c  ! 416: LDUWA_I	lduwa	[%r11, + 0x003c] %asi, %r1
	.word 0xc802801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcdbaa000  ! 418: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 420: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc322c01f  ! 422: STF_R	st	%f1, [%r31, %r11]
	.word 0xc9f2d13f  ! 423: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
TH_LABEL425:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce92e03c  ! 426: LDUHA_I	lduha	[%r11, + 0x003c] %asi, %r7
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba981f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc2c2a03c  ! 430: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd242801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcdbae060  ! 434: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xc892a01e  ! 435: LDUHA_I	lduha	[%r10, + 0x001e] %asi, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad97f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcb22c01f  ! 439: STF_R	st	%f5, [%r31, %r11]
	.word 0xd122801f  ! 440: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba987f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd01aa008  ! 444: LDD_I	ldd	[%r10 + 0x0008], %r8
	.word 0xc7baa060  ! 445: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd9ae038  ! 446: LDDFA_I	ldda	[%r11, 0x0038], %f6
	.word 0xc99aa070  ! 447: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xd1ba999f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd212801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc9ba99bf  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2911f  ! 454: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc60ae02f  ! 455: LDUB_I	ldub	[%r11 + 0x002f], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd252801f  ! 456: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3ba985f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc492905f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2901f  ! 461: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba991f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba98bf  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcccaa01f  ! 467: LDSBA_I	ldsba	[%r10, + 0x001f] %asi, %r6
	.word 0xcfbad95f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd2c2e02c  ! 469: LDSWA_I	ldswa	[%r11, + 0x002c] %asi, %r9
	.word 0xc3e2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba991f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2901f  ! 473: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc59aa020  ! 474: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xcac2903f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba985f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 477: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba997f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba995f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba981f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4c2903f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r2
	.word 0xd04ac01f  ! 485: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2903f  ! 486: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc6ca901f  ! 487: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xc702801f  ! 488: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc402a078  ! 489: LDUW_I	lduw	[%r10 + 0x0078], %r2
	.word 0xd3ba981f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce8a907f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x83, %r7
	.word 0xd002801f  ! 492: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xcff2911f  ! 493: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba993f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc722801f  ! 498: STF_R	st	%f3, [%r31, %r10]
	.word 0xc5ba985f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc722801f  ! 502: STF_R	st	%f3, [%r31, %r10]
	.word 0xc2d2d15f  ! 503: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r1
	.word 0xc702a040  ! 504: LDF_I	ld	[%r10, 0x0040], %f3
	.word 0xc5baa000  ! 505: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba98bf  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba983f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc41a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcdf2911f  ! 510: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdf2901f  ! 511: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2901f  ! 512: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba991f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba981f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc212c01f  ! 519: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd322801f  ! 521: STF_R	st	%f9, [%r31, %r10]
	.word 0xc902a030  ! 522: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xcfba993f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc1aa068  ! 524: LDD_I	ldd	[%r10 + 0x0068], %r6
	.word 0xd302a018  ! 525: LDF_I	ld	[%r10, 0x0018], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc722801f  ! 527: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1e2d11f  ! 528: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd2da911f  ! 529: LDXA_R	ldxa	[%r10, %r31] 0x88, %r9
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc8a917f  ! 531: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xcdba993f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2913f  ! 534: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcc82d07f  ! 538: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r6
	.word 0xd0c2d11f  ! 539: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r8
	.word 0xcbba995f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4d2903f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xd3e2911f  ! 542: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd122801f  ! 545: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2d01f  ! 546: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d03f  ! 548: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcecae01c  ! 551: LDSBA_I	ldsba	[%r11, + 0x001c] %asi, %r7
	.word 0xcbba98bf  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2913f  ! 554: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba987f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba989f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc40aa07d  ! 559: LDUB_I	ldub	[%r10 + 0x007d], %r2
	.word 0xcc4a801f  ! 560: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad85f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 562: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad89f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcf9aa050  ! 565: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc522c01f  ! 566: STF_R	st	%f2, [%r31, %r11]
	.word 0xca5a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcd22801f  ! 568: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5bad81f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc202a064  ! 570: LDUW_I	lduw	[%r10 + 0x0064], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc84aa058  ! 571: LDSB_I	ldsb	[%r10 + 0x0058], %r4
	.word 0xc5bad87f  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc28ad01f  ! 573: LDUBA_R	lduba	[%r11, %r31] 0x80, %r1
	.word 0xc6d2a00c  ! 574: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r3
	.word 0xd1ba989f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc64a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc4ca917f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xd1e2903f  ! 579: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xccda917f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
TH_LABEL580:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd292d11f  ! 581: LDUHA_R	lduha	[%r11, %r31] 0x88, %r9
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xca0aa037  ! 583: LDUB_I	ldub	[%r10 + 0x0037], %r5
	.word 0xc8daa060  ! 584: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r4
	.word 0xcedae058  ! 585: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r7
TH_LABEL585:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba981f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc5ae000  ! 587: LDX_I	ldx	[%r11 + 0x0000], %r6
	.word 0xc88ae022  ! 588: LDUBA_I	lduba	[%r11, + 0x0022] %asi, %r4
	.word 0xd122c01f  ! 589: STF_R	st	%f8, [%r31, %r11]
	.word 0xc7bad93f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bae028  ! 591: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xc5bae030  ! 592: STDFA_I	stda	%f2, [0x0030, %r11]
	.word 0xc9e2901f  ! 593: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb9aa060  ! 595: LDDFA_I	ldda	[%r10, 0x0060], %f5
TH_LABEL595:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2903f  ! 596: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xc842c01f  ! 597: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xca52a034  ! 598: LDSH_I	ldsh	[%r10 + 0x0034], %r5
	.word 0xcbba995f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba987f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba99bf  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc5baa030  ! 604: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xc3ba993f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba993f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcb02a008  ! 607: LDF_I	ld	[%r10, 0x0008], %f5
	.word 0xc79aa018  ! 608: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xcff2913f  ! 609: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba995f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL610:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc702a050  ! 611: LDF_I	ld	[%r10, 0x0050], %f3
	.word 0xc302c01f  ! 612: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3e2911f  ! 613: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba983f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba995f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce92915f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xc6c2a074  ! 619: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r3
	.word 0xc9ba999f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc8c2a038  ! 621: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r4
	.word 0xcc0a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xccd2903f  ! 624: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc882907f  ! 626: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc9bae060  ! 628: STDFA_I	stda	%f4, [0x0060, %r11]
	.word 0xc79ae040  ! 629: LDDFA_I	ldda	[%r11, 0x0040], %f3
	.word 0xcdbaa028  ! 630: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc302801f  ! 631: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1ba997f  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc722801f  ! 633: STF_R	st	%f3, [%r31, %r10]
	.word 0xd05a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba997f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc65ac01f  ! 638: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc3bad8bf  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd01a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcad2d01f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xcc8ad01f  ! 643: LDUBA_R	lduba	[%r11, %r31] 0x80, %r6
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd122c01f  ! 645: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd9aa048  ! 646: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xc812c01f  ! 647: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xd0d2a050  ! 648: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r8
	.word 0xd05a801f  ! 649: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd04aa006  ! 650: LDSB_I	ldsb	[%r10 + 0x0006], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d03f  ! 652: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xceda913f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x89, %r7
	.word 0xc3ba981f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc612801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd3f2d13f  ! 657: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xc4d2913f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xc59ae008  ! 659: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xd3ba993f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba995f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc252a058  ! 666: LDSH_I	ldsh	[%r10 + 0x0058], %r1
	.word 0xd3baa028  ! 667: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xcdba989f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc12c01f  ! 670: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2901f  ! 671: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd3bae050  ! 673: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xc5ba981f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce0a801f  ! 675: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad83f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd092e02a  ! 677: LDUHA_I	lduha	[%r11, + 0x002a] %asi, %r8
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd302c01f  ! 679: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcfe2901f  ! 680: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2911f  ! 681: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2913f  ! 683: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc59aa070  ! 684: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xd0cad11f  ! 685: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce5a801f  ! 686: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd3baa008  ! 687: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xd282a008  ! 688: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r9
	.word 0xc39ae070  ! 689: LDDFA_I	ldda	[%r11, 0x0070], %f1
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc852801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc81a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd3ba995f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcfbae048  ! 694: STDFA_I	stda	%f7, [0x0048, %r11]
	.word 0xcc0aa042  ! 695: LDUB_I	ldub	[%r10 + 0x0042], %r6
TH_LABEL695:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4c2a064  ! 696: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r2
	.word 0xcfe2901f  ! 697: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc4c2913f  ! 698: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xd1bad91f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce0aa072  ! 700: LDUB_I	ldub	[%r10 + 0x0072], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca02801f  ! 701: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3f2d13f  ! 702: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xca4aa009  ! 704: LDSB_I	ldsb	[%r10 + 0x0009], %r5
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2903f  ! 707: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc922c01f  ! 708: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd08a905f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xd3baa040  ! 712: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2911f  ! 714: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc492a03c  ! 715: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba98bf  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc59ae048  ! 718: LDDFA_I	ldda	[%r11, 0x0048], %f2
	.word 0xce42a038  ! 719: LDSW_I	ldsw	[%r10 + 0x0038], %r7
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad87f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2d2905f  ! 722: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r1
	.word 0xcfbad95f  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d03f  ! 725: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad95f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xca12801f  ! 728: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7baa050  ! 729: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xce5a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2901f  ! 731: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xce4ae067  ! 732: LDSB_I	ldsb	[%r11 + 0x0067], %r7
	.word 0xcac2905f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xc642a020  ! 734: LDSW_I	ldsw	[%r10 + 0x0020], %r3
	.word 0xc84aa03a  ! 735: LDSB_I	ldsb	[%r10 + 0x003a], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba995f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322c01f  ! 737: STF_R	st	%f9, [%r31, %r11]
	.word 0xc9ba981f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242a060  ! 740: LDSW_I	ldsw	[%r10 + 0x0060], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba997f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 744: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2903f  ! 746: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xd19aa018  ! 747: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcfba999f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 749: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xc682e068  ! 750: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r3
TH_LABEL750:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd25ae010  ! 751: LDX_I	ldx	[%r11 + 0x0010], %r9
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba981f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1baa000  ! 755: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc85ae018  ! 756: LDX_I	ldx	[%r11 + 0x0018], %r4
	.word 0xce5ae018  ! 757: LDX_I	ldx	[%r11 + 0x0018], %r7
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc3baa058  ! 759: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xcec2a000  ! 760: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r7
TH_LABEL760:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba983f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca92a052  ! 762: LDUHA_I	lduha	[%r10, + 0x0052] %asi, %r5
	.word 0xcd22c01f  ! 763: STF_R	st	%f6, [%r31, %r11]
	.word 0xc9ba983f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb02a060  ! 765: LDF_I	ld	[%r10, 0x0060], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2901f  ! 766: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba989f  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcc1ae028  ! 770: LDD_I	ldd	[%r11 + 0x0028], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba999f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2cae055  ! 773: LDSBA_I	ldsba	[%r11, + 0x0055] %asi, %r1
	.word 0xc7ba98bf  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 776: LDF_R	ld	[%r10, %r31], %f7
	.word 0xce5a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcd02c01f  ! 778: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3bad95f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2da915f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d13f  ! 782: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad87f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc8ca907f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba989f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd1baa020  ! 789: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xcdba985f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc81aa050  ! 792: LDD_I	ldd	[%r10 + 0x0050], %r4
	.word 0xd302a014  ! 793: LDF_I	ld	[%r10, 0x0014], %f9
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc722801f  ! 795: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba991f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc4da915f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r2
	.word 0xc7ba985f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba983f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc92e03e  ! 806: LDUHA_I	lduha	[%r11, + 0x003e] %asi, %r6
	.word 0xcc8a903f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xd39aa038  ! 808: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xd28ae050  ! 809: LDUBA_I	lduba	[%r11, + 0x0050] %asi, %r9
	.word 0xd25a801f  ! 810: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba997f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc25ae050  ! 813: LDX_I	ldx	[%r11 + 0x0050], %r1
	.word 0xc7e2913f  ! 814: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba987f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502801f  ! 816: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc442801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcd02e054  ! 818: LDF_I	ld	[%r11, 0x0054], %f6
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc48ad17f  ! 820: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xccd2901f  ! 822: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xd2dae008  ! 823: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r9
	.word 0xd3ba981f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd082e02c  ! 825: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba981f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb22801f  ! 827: STF_R	st	%f5, [%r31, %r10]
	.word 0xcfbad93f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
TH_LABEL830:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad81f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85aa058  ! 832: LDX_I	ldx	[%r10 + 0x0058], %r4
	.word 0xd002a008  ! 833: LDUW_I	lduw	[%r10 + 0x0008], %r8
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd25a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc80a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad91f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca52c01f  ! 839: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc9baa008  ! 840: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb9aa000  ! 841: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba987f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcacae06a  ! 844: LDSBA_I	ldsba	[%r11, + 0x006a] %asi, %r5
	.word 0xc3e2901f  ! 845: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02a01c  ! 846: LDF_I	ld	[%r10, 0x001c], %f7
	.word 0xc5e2903f  ! 847: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2901f  ! 848: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5bae008  ! 850: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bad95f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d03f  ! 852: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad9bf  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc92a022  ! 856: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r6
	.word 0xd3baa070  ! 857: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc842801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xd082a038  ! 862: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r8
	.word 0xc5ba993f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce4aa072  ! 865: LDSB_I	ldsb	[%r10 + 0x0072], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc612a052  ! 866: LDUH_I	lduh	[%r10 + 0x0052], %r3
	.word 0xc9bae078  ! 867: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xc9e2901f  ! 868: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcfbae078  ! 870: STDFA_I	stda	%f7, [0x0078, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcac2a04c  ! 871: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r5
	.word 0xc9e2d01f  ! 872: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad81f  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc902c01f  ! 875: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba995f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0dae010  ! 880: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc242801f  ! 881: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc682a068  ! 882: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r3
	.word 0xc3bad81f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc502c01f  ! 885: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae010  ! 886: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xd05aa028  ! 887: LDX_I	ldx	[%r10 + 0x0028], %r8
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba98bf  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd22801f  ! 891: STF_R	st	%f6, [%r31, %r10]
	.word 0xca82a000  ! 892: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r5
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xd39aa048  ! 895: LDDFA_I	ldda	[%r10, 0x0048], %f9
TH_LABEL895:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd302e074  ! 896: LDF_I	ld	[%r11, 0x0074], %f9
	.word 0xc702a048  ! 897: LDF_I	ld	[%r10, 0x0048], %f3
	.word 0xc9bad85f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0a801f  ! 900: LDUB_R	ldub	[%r10 + %r31], %r7
TH_LABEL900:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd002a03c  ! 901: LDUW_I	lduw	[%r10 + 0x003c], %r8
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad95f  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad91f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf02e048  ! 907: LDF_I	ld	[%r11, 0x0048], %f7
	.word 0xd24aa045  ! 908: LDSB_I	ldsb	[%r10 + 0x0045], %r9
	.word 0xc7ba983f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbaa038  ! 910: STDFA_I	stda	%f6, [0x0038, %r10]
TH_LABEL910:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba999f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd002e018  ! 912: LDUW_I	lduw	[%r11 + 0x0018], %r8
	.word 0xd1ba98bf  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd3bae058  ! 915: STDFA_I	stda	%f9, [0x0058, %r11]
TH_LABEL915:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba995f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302e074  ! 917: LDF_I	ld	[%r11, 0x0074], %f1
	.word 0xd3bae050  ! 918: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xcdf2d01f  ! 919: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcc4a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc02801f  ! 921: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc842a01c  ! 923: LDSW_I	ldsw	[%r10 + 0x001c], %r4
	.word 0xcc52801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc7e2d11f  ! 925: CASA_I	casa	[%r11] 0x88, %r31, %r3
TH_LABEL925:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbaa028  ! 926: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xcad2911f  ! 927: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xca92a060  ! 928: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r5
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d11f  ! 930: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
TH_LABEL930:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2d01f  ! 931: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d13f  ! 934: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xd39aa020  ! 935: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 937: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd3baa070  ! 938: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc81ae030  ! 940: LDD_I	ldd	[%r11 + 0x0030], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad83f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd202801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc9baa038  ! 943: STDFA_I	stda	%f4, [0x0038, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc302a040  ! 945: LDF_I	ld	[%r10, 0x0040], %f1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba99bf  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd0d2a066  ! 949: LDSHA_I	ldsha	[%r10, + 0x0066] %asi, %r8
	.word 0xc7e2911f  ! 950: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba991f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba999f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd09aa000  ! 956: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r8
	.word 0xd0dae030  ! 957: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r8
	.word 0xcc0aa00e  ! 958: LDUB_I	ldub	[%r10 + 0x000e], %r6
	.word 0xc6c2917f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xca82e064  ! 960: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba987f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82a040  ! 964: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r5
	.word 0xcbba995f  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbe2911f  ! 966: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba997f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 968: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2cad15f  ! 971: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r1
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad93f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc80ae038  ! 974: LDUB_I	ldub	[%r11 + 0x0038], %r4
	.word 0xcbba989f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL975:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf02801f  ! 977: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc5ba98bf  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692a05c  ! 979: LDUHA_I	lduha	[%r10, + 0x005c] %asi, %r3
	.word 0xd1f2913f  ! 980: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
TH_LABEL980:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6dae078  ! 981: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r3
	.word 0xd1ba999f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482a03c  ! 983: LDUWA_I	lduwa	[%r10, + 0x003c] %asi, %r2
	.word 0xc9ba985f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba99bf  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa000  ! 987: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xd122801f  ! 988: STF_R	st	%f8, [%r31, %r10]
	.word 0xc442a04c  ! 989: LDSW_I	ldsw	[%r10 + 0x004c], %r2
	.word 0xc99aa040  ! 990: LDDFA_I	ldda	[%r10, 0x0040], %f4
TH_LABEL990:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xd01aa038  ! 992: LDD_I	ldd	[%r10 + 0x0038], %r8
	.word 0xc7bad89f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd282a070  ! 994: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r9
	.word 0xcbba989f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc892a05e  ! 997: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r4
	.word 0xcbe2d11f  ! 998: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad8bf  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce82907f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xc7f2911f  ! 1: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xcd02801f  ! 2: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc5ba999f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcbbae058  ! 5: STDFA_I	stda	%f5, [0x0058, %r11]
TH_LABEL5:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2901f  ! 6: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc8cad07f  ! 7: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r4
	.word 0xd1bad81f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d03f  ! 10: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6ca907f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r3
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba991f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 14: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd002a068  ! 15: LDUW_I	lduw	[%r10 + 0x0068], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcdbaa020  ! 17: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xc5bae038  ! 18: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xd19ae030  ! 19: LDDFA_I	ldda	[%r11, 0x0030], %f8
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba981f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2911f  ! 25: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcecad01f  ! 26: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r7
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa020  ! 29: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xcfbad95f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca92d11f  ! 31: LDUHA_R	lduha	[%r11, %r31] 0x88, %r5
	.word 0xcbba997f  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc65a801f  ! 33: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd1bad97f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd122c01f  ! 35: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba983f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xd0daa038  ! 38: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcad2911f  ! 40: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc922801f  ! 41: STF_R	st	%f4, [%r31, %r10]
	.word 0xc4d2a012  ! 42: LDSHA_I	ldsha	[%r10, + 0x0012] %asi, %r2
	.word 0xc202e07c  ! 43: LDUW_I	lduw	[%r11 + 0x007c], %r1
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc44aa035  ! 46: LDSB_I	ldsb	[%r10 + 0x0035], %r2
	.word 0xc5ba991f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc9baa020  ! 48: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xcff2903f  ! 49: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba987f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL50:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2903f  ! 51: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xc88ad03f  ! 52: LDUBA_R	lduba	[%r11, %r31] 0x81, %r4
	.word 0xcb02a01c  ! 53: LDF_I	ld	[%r10, 0x001c], %f5
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2911f  ! 55: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc49aa030  ! 56: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r2
	.word 0xc522801f  ! 57: STF_R	st	%f2, [%r31, %r10]
	.word 0xc41aa048  ! 58: LDD_I	ldd	[%r10 + 0x0048], %r2
	.word 0xc3bad97f  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce42c01f  ! 60: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd9aa070  ! 61: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xcb02801f  ! 62: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd002a034  ! 63: LDUW_I	lduw	[%r10 + 0x0034], %r8
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc48ad15f  ! 65: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2da901f  ! 66: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xd1e2913f  ! 67: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc8ca901f  ! 68: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xd1ba981f  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd122c01f  ! 72: STF_R	st	%f8, [%r31, %r11]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbbaa030  ! 75: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc6c2903f  ! 76: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xc99aa030  ! 77: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xcdf2d11f  ! 78: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad97f  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02e010  ! 81: LDF_I	ld	[%r11, 0x0010], %f6
	.word 0xc442801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xd1ba997f  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702a074  ! 84: LDF_I	ld	[%r10, 0x0074], %f3
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba991f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd25ac01f  ! 87: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcbbad97f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc40aa05e  ! 89: LDUB_I	ldub	[%r10 + 0x005e], %r2
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba981f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102c01f  ! 93: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd01aa058  ! 94: LDD_I	ldd	[%r10 + 0x0058], %r8
	.word 0xd3ba993f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba991f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 97: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xcb02c01f  ! 98: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcd02a054  ! 99: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xcfba98bf  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca92a014  ! 101: LDUHA_I	lduha	[%r10, + 0x0014] %asi, %r5
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xca0ae068  ! 103: LDUB_I	ldub	[%r11 + 0x0068], %r5
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xced2903f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba983f  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba997f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc99aa020  ! 110: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd002801f  ! 111: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc9e2901f  ! 112: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302801f  ! 115: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9f2d11f  ! 116: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d11f  ! 118: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc8da905f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8d2903f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r4
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2911f  ! 123: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2913f  ! 125: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba989f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 127: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba985f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa030  ! 131: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xd3ba981f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce12e02e  ! 133: LDUH_I	lduh	[%r11 + 0x002e], %r7
	.word 0xcdbad9bf  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc44ac01f  ! 136: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xcfbae020  ! 138: STDFA_I	stda	%f7, [0x0020, %r11]
	.word 0xc7ba98bf  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 140: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc3baa078  ! 142: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc59aa030  ! 145: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc79aa020  ! 146: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xcfbad99f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd042a02c  ! 148: LDSW_I	ldsw	[%r10 + 0x002c], %r8
	.word 0xcc42801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc81ac01f  ! 150: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcf02a020  ! 152: LDF_I	ld	[%r10, 0x0020], %f7
	.word 0xd3bad93f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd05ae030  ! 155: LDX_I	ldx	[%r11 + 0x0030], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302a004  ! 156: LDF_I	ld	[%r10, 0x0004], %f1
	.word 0xc8ca915f  ! 157: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r4
	.word 0xcbbad81f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd09aa028  ! 160: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba989f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc92a04c  ! 162: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r6
	.word 0xd242c01f  ! 163: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc3bad81f  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02a02c  ! 166: LDF_I	ld	[%r10, 0x002c], %f6
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc20aa07d  ! 168: LDUB_I	ldub	[%r10 + 0x007d], %r1
	.word 0xd3bad95f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2ca907f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba985f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd19ae048  ! 172: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xd012801f  ! 173: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xcdba989f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba981f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce8aa035  ! 177: LDUBA_I	lduba	[%r10, + 0x0035] %asi, %r7
	.word 0xd1f2913f  ! 178: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc7baa018  ! 179: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xc202e020  ! 180: LDUW_I	lduw	[%r11 + 0x0020], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02a008  ! 181: LDF_I	ld	[%r10, 0x0008], %f6
	.word 0xca82907f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xcdf2901f  ! 183: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcde2913f  ! 186: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xc612a040  ! 187: LDUH_I	lduh	[%r10 + 0x0040], %r3
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba999f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc242e054  ! 191: LDSW_I	ldsw	[%r11 + 0x0054], %r1
	.word 0xc80ae06d  ! 192: LDUB_I	ldub	[%r11 + 0x006d], %r4
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6c2d05f  ! 195: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2913f  ! 197: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd3baa038  ! 199: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xc6d2915f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba997f  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcdbaa038  ! 203: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcff2d01f  ! 204: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad83f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad97f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc8d2e000  ! 207: LDSHA_I	ldsha	[%r11, + 0x0000] %asi, %r4
	.word 0xc902801f  ! 208: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc4daa018  ! 209: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r2
	.word 0xc5bad9bf  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad81f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce42a000  ! 213: LDSW_I	ldsw	[%r10 + 0x0000], %r7
	.word 0xc9ba981f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce82a030  ! 216: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r7
	.word 0xcacaa033  ! 217: LDSBA_I	ldsba	[%r10, + 0x0033] %asi, %r5
	.word 0xcc92911f  ! 218: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd002a008  ! 220: LDUW_I	lduw	[%r10 + 0x0008], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba989f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 222: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xcecad01f  ! 223: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r7
	.word 0xc202a00c  ! 224: LDUW_I	lduw	[%r10 + 0x000c], %r1
	.word 0xcbba995f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02801f  ! 226: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcbbad83f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc452a048  ! 229: LDSH_I	ldsh	[%r10 + 0x0048], %r2
	.word 0xc3ba993f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1baa040  ! 231: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xc722801f  ! 232: STF_R	st	%f3, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba981f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca0aa060  ! 235: LDUB_I	ldub	[%r10 + 0x0060], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc80ac01f  ! 236: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba985f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9aa008  ! 239: LDDFA_I	ldda	[%r10, 0x0008], %f6
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad97f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc692a016  ! 243: LDUHA_I	lduha	[%r10, + 0x0016] %asi, %r3
	.word 0xd292e040  ! 244: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r9
	.word 0xc3bad97f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL245:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc01aa000  ! 246: LDD_I	ldd	[%r10 + 0x0000], %r0
	.word 0xc3ba985f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd09aa000  ! 248: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r8
	.word 0xcb02801f  ! 249: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba983f  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc852c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xcec2907f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r7
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2913f  ! 254: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc682907f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r3
	.word 0xd122801f  ! 257: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3ba985f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19aa040  ! 259: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xcde2913f  ! 260: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba983f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc25aa058  ! 265: LDX_I	ldx	[%r10 + 0x0058], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3baa068  ! 266: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xc5ba993f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80a801f  ! 268: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc8c2901f  ! 270: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2903f  ! 271: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba995f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102801f  ! 274: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2901f  ! 276: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 277: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc902a048  ! 278: LDF_I	ld	[%r10, 0x0048], %f4
	.word 0xc7f2913f  ! 279: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc852801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd39aa030  ! 281: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xce82905f  ! 282: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r7
	.word 0xc9ba981f  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2d13f  ! 284: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r7
	.word 0xca52a056  ! 285: LDSH_I	ldsh	[%r10 + 0x0056], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc322801f  ! 286: STF_R	st	%f1, [%r31, %r10]
	.word 0xced2a046  ! 287: LDSHA_I	ldsha	[%r10, + 0x0046] %asi, %r7
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd2d2901f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xd042801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2913f  ! 291: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba99bf  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 293: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xd20aa030  ! 294: LDUB_I	ldub	[%r10 + 0x0030], %r9
	.word 0xc88aa061  ! 295: LDUBA_I	lduba	[%r10, + 0x0061] %asi, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xca92e03a  ! 296: LDUHA_I	lduha	[%r11, + 0x003a] %asi, %r5
	.word 0xc9ba989f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba991f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba981f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102c01f  ! 302: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc5bae028  ! 303: STDFA_I	stda	%f2, [0x0028, %r11]
	.word 0xd1e2903f  ! 304: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc722c01f  ! 305: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba985f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xccd2a074  ! 309: LDSHA_I	ldsha	[%r10, + 0x0074] %asi, %r6
	.word 0xd39aa020  ! 310: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad83f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xced2915f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r7
	.word 0xc9e2901f  ! 313: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xd102a05c  ! 314: LDF_I	ld	[%r10, 0x005c], %f8
	.word 0xc60ac01f  ! 315: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2901f  ! 316: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba981f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xd0c2a040  ! 319: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r8
	.word 0xc3ba983f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba993f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcb9aa048  ! 322: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc902a034  ! 326: LDF_I	ld	[%r10, 0x0034], %f4
	.word 0xc692911f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x88, %r3
	.word 0xc3e2d01f  ! 328: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad93f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2d13f  ! 331: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xccdad17f  ! 332: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r6
	.word 0xce12e072  ! 333: LDUH_I	lduh	[%r11 + 0x0072], %r7
	.word 0xc412a04c  ! 334: LDUH_I	lduh	[%r10 + 0x004c], %r2
	.word 0xcac2911f  ! 335: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad89f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd242a058  ! 337: LDSW_I	ldsw	[%r10 + 0x0058], %r9
	.word 0xc922c01f  ! 338: STF_R	st	%f4, [%r31, %r11]
	.word 0xc5ba98bf  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc852e05a  ! 341: LDSH_I	ldsh	[%r11 + 0x005a], %r4
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xce8ae034  ! 343: LDUBA_I	lduba	[%r11, + 0x0034] %asi, %r7
	.word 0xd3e2d13f  ! 344: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL345:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xca5a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc802801f  ! 350: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad95f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8c2d17f  ! 353: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r4
	.word 0xcbf2901f  ! 354: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcf22801f  ! 355: STF_R	st	%f7, [%r31, %r10]
TH_LABEL355:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd302e074  ! 356: LDF_I	ld	[%r11, 0x0074], %f9
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d13f  ! 358: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xc7baa008  ! 359: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb02e038  ! 361: LDF_I	ld	[%r11, 0x0038], %f5
	.word 0xc9ba989f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd122801f  ! 363: STF_R	st	%f8, [%r31, %r10]
	.word 0xcff2901f  ! 364: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba983f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd39aa038  ! 368: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc5bad93f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad91f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd102e000  ! 372: LDF_I	ld	[%r11, 0x0000], %f8
	.word 0xc9bad89f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102c01f  ! 374: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc3e2d03f  ! 375: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad97f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad99f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad91f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcc52e01a  ! 384: LDSH_I	ldsh	[%r11 + 0x001a], %r6
	.word 0xc4d2907f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd9aa030  ! 386: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xc922801f  ! 387: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfe2901f  ! 388: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca92e052  ! 391: LDUHA_I	lduha	[%r11, + 0x0052] %asi, %r5
	.word 0xd1ba995f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2901f  ! 395: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba981f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902801f  ! 397: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc7ba983f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2913f  ! 400: CASA_I	casa	[%r10] 0x89, %r31, %r3
TH_LABEL400:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba999f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 403: STF_R	st	%f9, [%r31, %r10]
	.word 0xcd22801f  ! 404: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2d2d01f  ! 406: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xd282d15f  ! 407: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r9
	.word 0xd3f2911f  ! 408: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2913f  ! 409: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc4da913f  ! 410: LDXA_R	ldxa	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2c2a078  ! 411: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r1
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc80aa004  ! 414: LDUB_I	ldub	[%r10 + 0x0004], %r4
	.word 0xc4caa04f  ! 415: LDSBA_I	ldsba	[%r10, + 0x004f] %asi, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce82e060  ! 416: LDUWA_I	lduwa	[%r11, + 0x0060] %asi, %r7
	.word 0xc202801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc9baa050  ! 418: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2911f  ! 420: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc922801f  ! 422: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9f2d13f  ! 423: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca92a008  ! 426: LDUHA_I	lduha	[%r10, + 0x0008] %asi, %r5
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba999f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd0c2a064  ! 430: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca42801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7baa060  ! 434: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xca92a026  ! 435: LDUHA_I	lduha	[%r10, + 0x0026] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad83f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc522801f  ! 439: STF_R	st	%f2, [%r31, %r10]
	.word 0xc722c01f  ! 440: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba997f  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd01ae070  ! 444: LDD_I	ldd	[%r11 + 0x0070], %r8
	.word 0xcbbaa028  ! 445: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcd9aa068  ! 446: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xd19aa018  ! 447: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xd1ba995f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc812c01f  ! 451: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc9ba993f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2903f  ! 454: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xca0aa068  ! 455: LDUB_I	ldub	[%r10 + 0x0068], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca52c01f  ! 456: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xd3ba983f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba989f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692915f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2901f  ! 461: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba995f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc6cae051  ! 467: LDSBA_I	ldsba	[%r11, + 0x0051] %asi, %r3
	.word 0xcfbad89f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6c2e020  ! 469: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r3
	.word 0xc3e2903f  ! 470: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba999f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 473: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xd19aa010  ! 474: LDDFA_I	ldda	[%r10, 0x0010], %f8
	.word 0xc6c2903f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba985f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 477: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba997f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba983f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba99bf  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcec2917f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r7
	.word 0xcc4a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2913f  ! 486: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc2ca913f  ! 487: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r1
	.word 0xc502801f  ! 488: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca02a000  ! 489: LDUW_I	lduw	[%r10 + 0x0000], %r5
	.word 0xd3ba983f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc68a911f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x88, %r3
	.word 0xca02c01f  ! 492: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xcff2913f  ! 493: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba981f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc722c01f  ! 498: STF_R	st	%f3, [%r31, %r11]
	.word 0xc5ba993f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL500:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcb22801f  ! 502: STF_R	st	%f5, [%r31, %r10]
	.word 0xc4d2901f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xd302a034  ! 504: LDF_I	ld	[%r10, 0x0034], %f9
	.word 0xc9baa058  ! 505: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba999f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba981f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc81a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcdf2901f  ! 510: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2911f  ! 511: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcde2901f  ! 512: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba997f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba981f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc412c01f  ! 519: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf22801f  ! 521: STF_R	st	%f7, [%r31, %r10]
	.word 0xcb02a060  ! 522: LDF_I	ld	[%r10, 0x0060], %f5
	.word 0xcfba999f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc01aa068  ! 524: LDD_I	ldd	[%r10 + 0x0068], %r0
	.word 0xcb02a014  ! 525: LDF_I	ld	[%r10, 0x0014], %f5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd322801f  ! 527: STF_R	st	%f9, [%r31, %r10]
	.word 0xd1e2d01f  ! 528: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc4da913f  ! 529: LDXA_R	ldxa	[%r10, %r31] 0x89, %r2
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc28ad11f  ! 531: LDUBA_R	lduba	[%r11, %r31] 0x88, %r1
	.word 0xcdba999f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2901f  ! 534: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc882911f  ! 538: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r4
	.word 0xc6c2d05f  ! 539: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r3
	.word 0xcbba991f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL540:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2d2901f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xd3e2903f  ! 542: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc522c01f  ! 545: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2d11f  ! 546: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d01f  ! 548: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad91f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2cae027  ! 551: LDSBA_I	ldsba	[%r11, + 0x0027] %asi, %r9
	.word 0xcbba997f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 554: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba991f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba997f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce0aa050  ! 559: LDUB_I	ldub	[%r10 + 0x0050], %r7
	.word 0xd24ac01f  ! 560: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad9bf  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 562: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad9bf  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd39aa008  ! 565: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf22c01f  ! 566: STF_R	st	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcb22801f  ! 568: STF_R	st	%f5, [%r31, %r10]
	.word 0xc5bad91f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce02e024  ! 570: LDUW_I	lduw	[%r11 + 0x0024], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd24aa02a  ! 571: LDSB_I	ldsb	[%r10 + 0x002a], %r9
	.word 0xc5bad91f  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc28ad03f  ! 573: LDUBA_R	lduba	[%r11, %r31] 0x81, %r1
	.word 0xd0d2e01a  ! 574: LDSHA_I	ldsha	[%r11, + 0x001a] %asi, %r8
	.word 0xd1ba989f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc84a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xccca901f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xd1e2901f  ! 579: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd0da901f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc692d01f  ! 581: LDUHA_R	lduha	[%r11, %r31] 0x80, %r3
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd00ae04e  ! 583: LDUB_I	ldub	[%r11 + 0x004e], %r8
	.word 0xc8daa048  ! 584: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r4
	.word 0xccdae050  ! 585: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba999f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd05ae050  ! 587: LDX_I	ldx	[%r11 + 0x0050], %r8
	.word 0xcc8aa06b  ! 588: LDUBA_I	lduba	[%r10, + 0x006b] %asi, %r6
	.word 0xcd22801f  ! 589: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7bad99f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL590:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbaa010  ! 591: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xcbbae070  ! 592: STDFA_I	stda	%f5, [0x0070, %r11]
	.word 0xc9e2901f  ! 593: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba987f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb9aa018  ! 595: LDDFA_I	ldda	[%r10, 0x0018], %f5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2913f  ! 596: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xd042c01f  ! 597: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd252a042  ! 598: LDSH_I	ldsh	[%r10 + 0x0042], %r9
	.word 0xcbba981f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba983f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba981f  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcfbaa048  ! 604: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xc3ba985f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL605:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba983f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102a078  ! 607: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xcf9ae020  ! 608: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xcff2903f  ! 609: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba987f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd102a030  ! 611: LDF_I	ld	[%r10, 0x0030], %f8
	.word 0xd302801f  ! 612: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3e2903f  ! 613: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba999f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba995f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692917f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xd2c2e03c  ! 619: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r9
	.word 0xc9ba981f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL620:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd2c2e078  ! 621: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r9
	.word 0xce0a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xc2d2917f  ! 624: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r1
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc882917f  ! 626: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r4
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc3bae028  ! 628: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xcb9aa018  ! 629: LDDFA_I	ldda	[%r10, 0x0018], %f5
	.word 0xd1bae078  ! 630: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02c01f  ! 631: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd1ba98bf  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc522c01f  ! 633: STF_R	st	%f2, [%r31, %r11]
	.word 0xc65a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba99bf  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc85a801f  ! 638: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc3bad91f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc41a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcad2d15f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r5
	.word 0xd28ad17f  ! 643: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r9
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc522c01f  ! 645: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9aa058  ! 646: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xc212c01f  ! 647: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xd2d2e05c  ! 648: LDSHA_I	ldsha	[%r11, + 0x005c] %asi, %r9
	.word 0xce5ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xd04aa05f  ! 650: LDSB_I	ldsb	[%r10 + 0x005f], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d11f  ! 652: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xcada917f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r5
	.word 0xc3ba985f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd012801f  ! 656: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd3f2d01f  ! 657: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xccd2907f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r6
	.word 0xc59ae008  ! 659: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xd3ba995f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba997f  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc852e00a  ! 666: LDSH_I	ldsh	[%r11 + 0x000a], %r4
	.word 0xcdbaa008  ! 667: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xcdba999f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc12c01f  ! 670: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2903f  ! 671: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1baa018  ! 673: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xc5ba99bf  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce0a801f  ! 675: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad97f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc292a038  ! 677: LDUHA_I	lduha	[%r10, + 0x0038] %asi, %r1
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd102c01f  ! 679: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcfe2901f  ! 680: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcff2903f  ! 681: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2903f  ! 683: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcf9ae040  ! 684: LDDFA_I	ldda	[%r11, 0x0040], %f7
	.word 0xccca901f  ! 685: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc85ac01f  ! 686: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xcdbae050  ! 687: STDFA_I	stda	%f6, [0x0050, %r11]
	.word 0xc882a028  ! 688: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r4
	.word 0xc79aa018  ! 689: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc452c01f  ! 691: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc81a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd3ba995f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc3bae010  ! 694: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xcc0ae024  ! 695: LDUB_I	ldub	[%r11 + 0x0024], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc6c2a074  ! 696: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r3
	.word 0xcfe2913f  ! 697: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc8c2d01f  ! 698: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r4
	.word 0xd1bad87f  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc0ae017  ! 700: LDUB_I	ldub	[%r11 + 0x0017], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc802c01f  ! 701: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc3f2d11f  ! 702: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc64aa01d  ! 704: LDSB_I	ldsb	[%r10 + 0x001d], %r3
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 707: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc322c01f  ! 708: STF_R	st	%f1, [%r31, %r11]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad97f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc48ad11f  ! 711: LDUBA_R	lduba	[%r11, %r31] 0x88, %r2
	.word 0xd1baa078  ! 712: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2911f  ! 714: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc292e04a  ! 715: LDUHA_I	lduha	[%r11, + 0x004a] %asi, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc79aa058  ! 718: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xce42a068  ! 719: LDSW_I	ldsw	[%r10 + 0x0068], %r7
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad85f  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xced2901f  ! 722: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xcfbad97f  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 725: CASA_I	casa	[%r11] 0x80, %r31, %r7
TH_LABEL725:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad93f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc12c01f  ! 728: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xd1bae070  ! 729: STDFA_I	stda	%f8, [0x0070, %r11]
	.word 0xca5a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2901f  ! 731: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc44ae043  ! 732: LDSB_I	ldsb	[%r11 + 0x0043], %r2
	.word 0xc8c2911f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r4
	.word 0xca42a01c  ! 734: LDSW_I	ldsw	[%r10 + 0x001c], %r5
	.word 0xca4ae042  ! 735: LDSB_I	ldsb	[%r11 + 0x0042], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba987f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 737: STF_R	st	%f7, [%r31, %r10]
	.word 0xc9ba983f  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd042a004  ! 740: LDSW_I	ldsw	[%r10 + 0x0004], %r8
TH_LABEL740:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba981f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 744: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcff2911f  ! 746: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xc79aa048  ! 747: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xcfba985f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 749: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc82a018  ! 750: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca5aa010  ! 751: LDX_I	ldx	[%r10 + 0x0010], %r5
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba985f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1baa028  ! 755: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc45aa030  ! 756: LDX_I	ldx	[%r10 + 0x0030], %r2
	.word 0xca5aa010  ! 757: LDX_I	ldx	[%r10 + 0x0010], %r5
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc3baa048  ! 759: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xccc2a050  ! 760: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba989f  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc492a064  ! 762: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r2
	.word 0xcf22801f  ! 763: STF_R	st	%f7, [%r31, %r10]
	.word 0xc9ba98bf  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702a03c  ! 765: LDF_I	ld	[%r10, 0x003c], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2903f  ! 766: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba99bf  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcc1aa030  ! 770: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba999f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4cae044  ! 773: LDSBA_I	ldsba	[%r11, + 0x0044] %asi, %r2
	.word 0xc7ba985f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd302801f  ! 776: LDF_R	ld	[%r10, %r31], %f9
	.word 0xce5a801f  ! 777: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd302c01f  ! 778: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd3bad9bf  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8da911f  ! 780: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d03f  ! 782: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad83f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc4ca911f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba981f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbae048  ! 789: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xcdba99bf  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc1ae058  ! 792: LDD_I	ldd	[%r11 + 0x0058], %r6
	.word 0xc502a034  ! 793: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc522801f  ! 795: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba995f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc8dad01f  ! 798: LDXA_R	ldxa	[%r11, %r31] 0x80, %r4
	.word 0xc7ba981f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba997f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc292a00e  ! 806: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r1
	.word 0xc28a901f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xc99ae048  ! 808: LDDFA_I	ldda	[%r11, 0x0048], %f4
	.word 0xca8aa054  ! 809: LDUBA_I	lduba	[%r10, + 0x0054] %asi, %r5
	.word 0xce5ac01f  ! 810: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba987f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc45aa058  ! 813: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xc7e2911f  ! 814: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba993f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302c01f  ! 816: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc242c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc702a000  ! 818: LDF_I	ld	[%r10, 0x0000], %f3
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc28a911f  ! 820: LDUBA_R	lduba	[%r10, %r31] 0x88, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2d03f  ! 821: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xc2d2901f  ! 822: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xcadaa050  ! 823: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r5
	.word 0xd3ba991f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc82e068  ! 825: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba991f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd322801f  ! 827: STF_R	st	%f9, [%r31, %r10]
	.word 0xcfbad85f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad85f  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85aa058  ! 832: LDX_I	ldx	[%r10 + 0x0058], %r4
	.word 0xce02a06c  ! 833: LDUW_I	lduw	[%r10 + 0x006c], %r7
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd25a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc0a801f  ! 836: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad91f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc252801f  ! 839: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcfbaa010  ! 840: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd39aa068  ! 841: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba983f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0caa014  ! 844: LDSBA_I	ldsba	[%r10, + 0x0014] %asi, %r8
	.word 0xc3e2911f  ! 845: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd302e044  ! 846: LDF_I	ld	[%r11, 0x0044], %f9
	.word 0xc5e2901f  ! 847: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2901f  ! 848: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5bae008  ! 850: STDFA_I	stda	%f2, [0x0008, %r11]
TH_LABEL850:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad81f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d01f  ! 852: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad81f  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc92e008  ! 856: LDUHA_I	lduha	[%r11, + 0x0008] %asi, %r6
	.word 0xc9bae028  ! 857: STDFA_I	stda	%f4, [0x0028, %r11]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc442801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xce82a024  ! 862: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r7
	.word 0xc5ba995f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc84aa067  ! 865: LDSB_I	ldsb	[%r10 + 0x0067], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc612e004  ! 866: LDUH_I	lduh	[%r11 + 0x0004], %r3
	.word 0xcfbaa040  ! 867: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xc9e2901f  ! 868: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa010  ! 870: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccc2a060  ! 871: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r6
	.word 0xc9e2d11f  ! 872: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad8bf  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02801f  ! 875: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba99bf  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0dae068  ! 880: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc242801f  ! 881: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc482a04c  ! 882: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r2
	.word 0xc3bad91f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcd02c01f  ! 885: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39ae050  ! 886: LDDFA_I	ldda	[%r11, 0x0050], %f9
	.word 0xce5aa058  ! 887: LDX_I	ldx	[%r10 + 0x0058], %r7
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba983f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd122801f  ! 891: STF_R	st	%f8, [%r31, %r10]
	.word 0xce82a060  ! 892: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r7
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xd19aa008  ! 895: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102a028  ! 896: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xc902e06c  ! 897: LDF_I	ld	[%r11, 0x006c], %f4
	.word 0xc9bad81f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80a801f  ! 900: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc202a038  ! 901: LDUW_I	lduw	[%r10 + 0x0038], %r1
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad91f  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad89f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc502a048  ! 907: LDF_I	ld	[%r10, 0x0048], %f2
	.word 0xc24aa060  ! 908: LDSB_I	ldsb	[%r10 + 0x0060], %r1
	.word 0xc7ba981f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc9bae068  ! 910: STDFA_I	stda	%f4, [0x0068, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba98bf  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca02e06c  ! 912: LDUW_I	lduw	[%r11 + 0x006c], %r5
	.word 0xd1ba985f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc9baa048  ! 915: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba985f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc702a018  ! 917: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xc5baa000  ! 918: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xcdf2d13f  ! 919: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xc84a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc202801f  ! 921: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc42e058  ! 923: LDSW_I	ldsw	[%r11 + 0x0058], %r6
	.word 0xca52801f  ! 924: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc7e2d11f  ! 925: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7baa048  ! 926: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xc2d2d17f  ! 927: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r1
	.word 0xd292e04c  ! 928: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r9
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d11f  ! 930: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2d01f  ! 931: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d13f  ! 934: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xc79ae078  ! 935: LDDFA_I	ldda	[%r11, 0x0078], %f3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 937: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc7baa010  ! 938: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc1aa070  ! 940: LDD_I	ldd	[%r10 + 0x0070], %r6
TH_LABEL940:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad83f  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc402801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc5baa000  ! 943: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd102a054  ! 945: LDF_I	ld	[%r10, 0x0054], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba981f  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd0d2e032  ! 949: LDSHA_I	ldsha	[%r11, + 0x0032] %asi, %r8
	.word 0xc7e2913f  ! 950: CASA_I	casa	[%r10] 0x89, %r31, %r3
TH_LABEL950:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba991f  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba993f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc09ae040  ! 956: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r0
	.word 0xc2daa018  ! 957: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r1
	.word 0xca0aa015  ! 958: LDUB_I	ldub	[%r10 + 0x0015], %r5
	.word 0xcec2d15f  ! 959: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r7
	.word 0xc882e07c  ! 960: LDUWA_I	lduwa	[%r11, + 0x007c] %asi, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba985f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce82e064  ! 964: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r7
	.word 0xcbba98bf  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2913f  ! 966: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbba985f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 968: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba995f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcecad11f  ! 971: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r7
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0aa046  ! 974: LDUB_I	ldub	[%r10 + 0x0046], %r5
	.word 0xcbba993f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcd02801f  ! 977: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc5ba981f  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92a03e  ! 979: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r6
	.word 0xd1f2903f  ! 980: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcadaa048  ! 981: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r5
	.word 0xd1ba991f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482e048  ! 983: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r2
	.word 0xc9ba987f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba999f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa038  ! 987: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc722801f  ! 988: STF_R	st	%f3, [%r31, %r10]
	.word 0xd042a018  ! 989: LDSW_I	ldsw	[%r10 + 0x0018], %r8
	.word 0xc79aa070  ! 990: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xc01aa010  ! 992: LDD_I	ldd	[%r10 + 0x0010], %r0
	.word 0xc7bad81f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc682e014  ! 994: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r3
	.word 0xcbba981f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL995:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd092a012  ! 997: LDUHA_I	lduha	[%r10, + 0x0012] %asi, %r8
	.word 0xcbe2d01f  ! 998: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad97f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca82907f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xc7f2903f  ! 1: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc502801f  ! 2: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5ba981f  ! 3: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 4: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc3baa058  ! 5: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2901f  ! 6: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd0cad17f  ! 7: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r8
	.word 0xd1bad85f  ! 8: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2d01f  ! 10: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0ca915f  ! 11: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xd1f2a01f  ! 12: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 13: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 14: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd202e010  ! 15: LDUW_I	lduw	[%r11 + 0x0010], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2e01f  ! 16: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc5bae000  ! 17: STDFA_I	stda	%f2, [0x0000, %r11]
	.word 0xc9baa020  ! 18: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xd19aa030  ! 19: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xd03a801f  ! 20: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL20:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa030  ! 21: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba989f  ! 22: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 23: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 24: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd2ca917f  ! 26: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xd3f2a01f  ! 27: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 28: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9ae010  ! 29: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xcfbad89f  ! 30: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL30:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca92905f  ! 31: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xcbba983f  ! 32: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd05ac01f  ! 33: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xd1bad97f  ! 34: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcf22801f  ! 35: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba997f  ! 36: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 37: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc6dae020  ! 38: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r3
	.word 0xc7e2e01f  ! 39: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc4d2d03f  ! 40: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf22c01f  ! 41: STF_R	st	%f7, [%r31, %r11]
	.word 0xccd2a02a  ! 42: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r6
	.word 0xc602a020  ! 43: LDUW_I	lduw	[%r10 + 0x0020], %r3
	.word 0xc7e2a01f  ! 44: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 45: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc44aa057  ! 46: LDSB_I	ldsb	[%r10 + 0x0057], %r2
	.word 0xc5ba999f  ! 47: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcfbaa058  ! 48: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xcff2901f  ! 49: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba991f  ! 50: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2911f  ! 51: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xc48ad07f  ! 52: LDUBA_R	lduba	[%r11, %r31] 0x83, %r2
	.word 0xc702a010  ! 53: LDF_I	ld	[%r10, 0x0010], %f3
	.word 0xc7f2a01f  ! 54: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2911f  ! 55: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc9aa048  ! 56: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xc322c01f  ! 57: STF_R	st	%f1, [%r31, %r11]
	.word 0xc01ae060  ! 58: LDD_I	ldd	[%r11 + 0x0060], %r0
	.word 0xc3bad8bf  ! 59: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc242801f  ! 60: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59ae040  ! 61: LDDFA_I	ldda	[%r11, 0x0040], %f2
	.word 0xcf02c01f  ! 62: LDF_R	ld	[%r11, %r31], %f7
	.word 0xce02e050  ! 63: LDUW_I	lduw	[%r11 + 0x0050], %r7
	.word 0xcff2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc88a913f  ! 65: LDUBA_R	lduba	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0da915f  ! 66: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r8
	.word 0xd1e2903f  ! 67: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd0ca901f  ! 68: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xd1ba99bf  ! 69: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 70: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa050  ! 71: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xcb22801f  ! 72: STF_R	st	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 73: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba989f  ! 74: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc3bae028  ! 75: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6c2d13f  ! 76: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r3
	.word 0xcd9ae030  ! 77: LDDFA_I	ldda	[%r11, 0x0030], %f6
	.word 0xcdf2d03f  ! 78: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad9bf  ! 79: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 80: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd02a05c  ! 81: LDF_I	ld	[%r10, 0x005c], %f6
	.word 0xd042801f  ! 82: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xd1ba99bf  ! 83: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb02a074  ! 84: LDF_I	ld	[%r10, 0x0074], %f5
	.word 0xcbf2a01f  ! 85: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba981f  ! 86: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca5ac01f  ! 87: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xcbbad87f  ! 88: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc40aa064  ! 89: LDUB_I	ldub	[%r10 + 0x0064], %r2
	.word 0xc5e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba98bf  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb02c01f  ! 93: LDF_R	ld	[%r11, %r31], %f5
	.word 0xd01aa018  ! 94: LDD_I	ldd	[%r10 + 0x0018], %r8
	.word 0xd3ba997f  ! 95: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba987f  ! 96: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 97: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc502801f  ! 98: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcf02a048  ! 99: LDF_I	ld	[%r10, 0x0048], %f7
	.word 0xcfba98bf  ! 100: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd292a042  ! 101: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r9
	.word 0xd3f2a01f  ! 102: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xce0aa060  ! 103: LDUB_I	ldub	[%r10 + 0x0060], %r7
	.word 0xcc3a801f  ! 104: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcad2901f  ! 105: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba98bf  ! 106: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 107: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba999f  ! 108: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa060  ! 109: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc39ae020  ! 110: LDDFA_I	ldda	[%r11, 0x0020], %f1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc802801f  ! 111: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc9e2911f  ! 112: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba983f  ! 113: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 114: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902c01f  ! 115: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2d11f  ! 116: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ac01f  ! 117: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d11f  ! 118: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc6da901f  ! 119: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xc7f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2d2911f  ! 121: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r9
	.word 0xd03aa020  ! 122: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3f2911f  ! 123: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03aa020  ! 124: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd3e2903f  ! 125: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba995f  ! 126: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 127: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba983f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 129: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd03aa020  ! 130: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39aa010  ! 131: LDDFA_I	ldda	[%r10, 0x0010], %f9
	.word 0xd3ba98bf  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc12e062  ! 133: LDUH_I	lduh	[%r11 + 0x0062], %r6
	.word 0xcdbad83f  ! 134: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 135: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd04a801f  ! 136: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd03aa060  ! 137: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xc7baa020  ! 138: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xc7ba989f  ! 139: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122801f  ! 140: STF_R	st	%f8, [%r31, %r10]
TH_LABEL140:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 141: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1bae028  ! 142: STDFA_I	stda	%f8, [0x0028, %r11]
	.word 0xd03ae028  ! 143: STD_I	std	%r8, [%r11 + 0x0028]
	.word 0xd03ac01f  ! 144: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc59aa008  ! 145: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf9ae078  ! 146: LDDFA_I	ldda	[%r11, 0x0078], %f7
	.word 0xcfbad99f  ! 147: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc242e06c  ! 148: LDSW_I	ldsw	[%r11 + 0x006c], %r1
	.word 0xc642801f  ! 149: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc01a801f  ! 150: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2a01f  ! 151: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd302e070  ! 152: LDF_I	ld	[%r11, 0x0070], %f9
	.word 0xd3bad93f  ! 153: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 154: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65aa040  ! 155: LDX_I	ldx	[%r10 + 0x0040], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd02a038  ! 156: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xcacad01f  ! 157: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xcbbad83f  ! 158: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 159: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc89aa050  ! 160: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba989f  ! 161: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca92e07a  ! 162: LDUHA_I	lduha	[%r11, + 0x007a] %asi, %r5
	.word 0xc242c01f  ! 163: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc3bad8bf  ! 164: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 165: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf02e03c  ! 166: LDF_I	ld	[%r11, 0x003c], %f7
	.word 0xcff2e01f  ! 167: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd20ae06b  ! 168: LDUB_I	ldub	[%r11 + 0x006b], %r9
	.word 0xd3bad97f  ! 169: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8ca913f  ! 170: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r4
TH_LABEL170:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba991f  ! 171: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc59aa040  ! 172: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xcc12801f  ! 173: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcdba98bf  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 175: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba983f  ! 176: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd08aa04d  ! 177: LDUBA_I	lduba	[%r10, + 0x004d] %asi, %r8
	.word 0xd1f2913f  ! 178: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xcdbaa060  ! 179: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xd202e010  ! 180: LDUW_I	lduw	[%r11 + 0x0010], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcb02e074  ! 181: LDF_I	ld	[%r11, 0x0074], %f5
	.word 0xcc82905f  ! 182: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r6
	.word 0xcdf2903f  ! 183: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc3a801f  ! 184: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 185: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2913f  ! 186: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xc212a050  ! 187: LDUH_I	lduh	[%r10 + 0x0050], %r1
	.word 0xc03aa050  ! 188: STD_I	std	%r0, [%r10 + 0x0050]
	.word 0xc3ba991f  ! 189: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 190: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca42a020  ! 191: LDSW_I	ldsw	[%r10 + 0x0020], %r5
	.word 0xd20aa00a  ! 192: LDUB_I	ldub	[%r10 + 0x000a], %r9
	.word 0xd03a801f  ! 193: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba989f  ! 194: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8c2901f  ! 195: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9f2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2913f  ! 197: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2a01f  ! 198: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc7baa018  ! 199: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xd0d2903f  ! 200: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba99bf  ! 201: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcfbae068  ! 203: STDFA_I	stda	%f7, [0x0068, %r11]
	.word 0xcff2d03f  ! 204: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad85f  ! 205: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad93f  ! 206: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcad2a004  ! 207: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r5
	.word 0xc702801f  ! 208: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc4dae000  ! 209: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r2
	.word 0xc5bad8bf  ! 210: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2e01f  ! 211: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad89f  ! 212: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc842a024  ! 213: LDSW_I	ldsw	[%r10 + 0x0024], %r4
	.word 0xc9ba997f  ! 214: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 215: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce82a05c  ! 216: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r7
	.word 0xcecaa013  ! 217: LDSBA_I	ldsba	[%r10, + 0x0013] %asi, %r7
	.word 0xcc92911f  ! 218: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xcc3a801f  ! 219: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd202a020  ! 220: LDUW_I	lduw	[%r10 + 0x0020], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba981f  ! 221: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 222: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc2ca903f  ! 223: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xca02a030  ! 224: LDUW_I	lduw	[%r10 + 0x0030], %r5
	.word 0xcbba997f  ! 225: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb02c01f  ! 226: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcbbad91f  ! 227: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 228: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc252a07a  ! 229: LDSH_I	ldsh	[%r10 + 0x007a], %r1
	.word 0xc3ba981f  ! 230: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbaa048  ! 231: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xcf22801f  ! 232: STF_R	st	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 233: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba989f  ! 234: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc20ae07e  ! 235: LDUB_I	ldub	[%r11 + 0x007e], %r1
TH_LABEL235:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd00a801f  ! 236: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1f2a01f  ! 237: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 238: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb9ae028  ! 239: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xcbf2e01f  ! 240: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad85f  ! 241: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 242: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd292a054  ! 243: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r9
	.word 0xc292e056  ! 244: LDUHA_I	lduha	[%r11, + 0x0056] %asi, %r1
	.word 0xc3bad87f  ! 245: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc01aa058  ! 246: LDD_I	ldd	[%r10 + 0x0058], %r0
	.word 0xc3ba999f  ! 247: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa020  ! 248: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r0
	.word 0xcf02801f  ! 249: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba99bf  ! 250: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd252c01f  ! 251: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc6c2915f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r3
	.word 0xc43a801f  ! 253: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2903f  ! 254: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc43a801f  ! 255: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc682901f  ! 256: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xd322801f  ! 257: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd9aa058  ! 259: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xcde2911f  ! 260: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 261: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba993f  ! 262: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 263: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 264: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc45ae068  ! 265: LDX_I	ldx	[%r11 + 0x0068], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5baa078  ! 266: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc5ba981f  ! 267: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc60ac01f  ! 268: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 269: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc4c2901f  ! 270: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
TH_LABEL270:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2901f  ! 271: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba993f  ! 272: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 273: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc902801f  ! 274: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9f2a01f  ! 275: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9f2903f  ! 276: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2911f  ! 277: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc702a070  ! 278: LDF_I	ld	[%r10, 0x0070], %f3
	.word 0xc7f2911f  ! 279: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc252801f  ! 280: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc99aa010  ! 281: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xc882907f  ! 282: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xc9ba99bf  ! 283: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2903f  ! 284: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xd052e036  ! 285: LDSH_I	ldsh	[%r11 + 0x0036], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf22c01f  ! 286: STF_R	st	%f7, [%r31, %r11]
	.word 0xd2d2e01c  ! 287: LDSHA_I	ldsha	[%r11, + 0x001c] %asi, %r9
	.word 0xd03ac01f  ! 288: STD_R	std	%r8, [%r11 + %r31]
	.word 0xccd2901f  ! 289: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xc842801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r4
TH_LABEL290:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2913f  ! 291: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba987f  ! 292: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 293: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd00aa008  ! 294: LDUB_I	ldub	[%r10 + 0x0008], %r8
	.word 0xc48ae06f  ! 295: LDUBA_I	lduba	[%r11, + 0x006f] %asi, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc892a040  ! 296: LDUHA_I	lduha	[%r10, + 0x0040] %asi, %r4
	.word 0xc9ba991f  ! 297: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa040  ! 298: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc83aa040  ! 299: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xc9ba983f  ! 300: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba987f  ! 301: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702c01f  ! 302: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd1baa010  ! 303: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xd1e2903f  ! 304: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd122801f  ! 305: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba981f  ! 306: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 307: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 308: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xccd2a052  ! 309: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r6
	.word 0xc99ae000  ! 310: LDDFA_I	ldda	[%r11, 0x0000], %f4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad93f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc8d2915f  ! 312: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
	.word 0xc9e2911f  ! 313: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xcf02a014  ! 314: LDF_I	ld	[%r10, 0x0014], %f7
	.word 0xc80a801f  ! 315: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2913f  ! 316: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba981f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa010  ! 318: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc2c2a034  ! 319: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r1
	.word 0xc3ba981f  ! 320: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba989f  ! 321: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd19aa030  ! 322: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xd1e2a01f  ! 323: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 324: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba993f  ! 325: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02a060  ! 326: LDF_I	ld	[%r10, 0x0060], %f7
	.word 0xc292d07f  ! 327: LDUHA_R	lduha	[%r11, %r31] 0x83, %r1
	.word 0xc3e2d11f  ! 328: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc03ac01f  ! 329: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad83f  ! 330: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2d13f  ! 331: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xcada917f  ! 332: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r5
	.word 0xcc12e00c  ! 333: LDUH_I	lduh	[%r11 + 0x000c], %r6
	.word 0xc212e012  ! 334: LDUH_I	lduh	[%r11 + 0x0012], %r1
	.word 0xd2c2d01f  ! 335: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad83f  ! 336: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xce42a00c  ! 337: LDSW_I	ldsw	[%r10 + 0x000c], %r7
	.word 0xc522801f  ! 338: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 339: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 340: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL340:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc452a032  ! 341: LDSH_I	ldsh	[%r10 + 0x0032], %r2
	.word 0xc43a801f  ! 342: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd28ae050  ! 343: LDUBA_I	lduba	[%r11, + 0x0050] %asi, %r9
	.word 0xd3e2d13f  ! 344: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ac01f  ! 345: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ae050  ! 346: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xcc5a801f  ! 347: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcc3a801f  ! 348: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 349: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02c01f  ! 350: LDUW_R	lduw	[%r11 + %r31], %r6
TH_LABEL350:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbad95f  ! 351: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 352: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcac2915f  ! 353: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r5
	.word 0xcbf2903f  ! 354: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xd322801f  ! 355: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd302e008  ! 356: LDF_I	ld	[%r11, 0x0008], %f9
	.word 0xd03ae008  ! 357: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2d03f  ! 358: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xcbbaa060  ! 359: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xc83aa060  ! 360: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902a07c  ! 361: LDF_I	ld	[%r10, 0x007c], %f4
	.word 0xc9ba993f  ! 362: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 363: STF_R	st	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 364: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3aa078  ! 365: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba995f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc59ae048  ! 368: LDDFA_I	ldda	[%r11, 0x0048], %f2
	.word 0xc5bad93f  ! 369: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 370: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5bad91f  ! 371: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc902e04c  ! 372: LDF_I	ld	[%r11, 0x004c], %f4
	.word 0xc9bad87f  ! 373: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc302c01f  ! 374: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc3e2d03f  ! 375: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad83f  ! 376: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 377: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 378: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 379: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 380: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3e2e01f  ! 381: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad93f  ! 382: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 383: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc452a006  ! 384: LDSH_I	ldsh	[%r10 + 0x0006], %r2
	.word 0xc2d2907f  ! 385: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf9aa068  ! 386: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xcf22801f  ! 387: STF_R	st	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 388: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 389: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 390: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd092a01e  ! 391: LDUHA_I	lduha	[%r10, + 0x001e] %asi, %r8
	.word 0xd1ba989f  ! 392: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 393: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 394: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2901f  ! 395: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba995f  ! 396: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702801f  ! 397: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7ba981f  ! 398: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 399: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 400: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba995f  ! 401: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 402: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf22801f  ! 403: STF_R	st	%f7, [%r31, %r10]
	.word 0xd322c01f  ! 404: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 405: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2d2911f  ! 406: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r9
	.word 0xd282911f  ! 407: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r9
	.word 0xd3f2911f  ! 408: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2913f  ! 409: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc4dad01f  ! 410: LDXA_R	ldxa	[%r11, %r31] 0x80, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4c2e078  ! 411: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r2
	.word 0xc43ae078  ! 412: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc43ae078  ! 413: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc20ae040  ! 414: LDUB_I	ldub	[%r11 + 0x0040], %r1
	.word 0xd0caa025  ! 415: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd082e054  ! 416: LDUWA_I	lduwa	[%r11, + 0x0054] %asi, %r8
	.word 0xd202801f  ! 417: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcdbaa050  ! 418: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xcdf2a01f  ! 419: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2903f  ! 420: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2a01f  ! 421: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc922c01f  ! 422: STF_R	st	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 423: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae050  ! 424: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9e2e01f  ! 425: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc92a03c  ! 426: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r6
	.word 0xcc3aa038  ! 427: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcdba985f  ! 428: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc01a801f  ! 429: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xccc2a070  ! 430: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2a01f  ! 431: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 432: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce42801f  ! 433: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xd3baa070  ! 434: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xcc92e01e  ! 435: LDUHA_I	lduha	[%r11, + 0x001e] %asi, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad91f  ! 436: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 437: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 438: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd322c01f  ! 439: STF_R	st	%f9, [%r31, %r11]
	.word 0xd322801f  ! 440: STF_R	st	%f9, [%r31, %r10]
TH_LABEL440:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba98bf  ! 441: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 442: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 443: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd01ae040  ! 444: LDD_I	ldd	[%r11 + 0x0040], %r8
	.word 0xc9baa000  ! 445: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc39aa070  ! 446: LDDFA_I	ldda	[%r10, 0x0070], %f1
	.word 0xd19aa058  ! 447: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xd1ba99bf  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 449: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 450: CASA_R	casa	[%r10] %asi, %r31, %r8
TH_LABEL450:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc812801f  ! 451: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc9ba981f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 453: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2911f  ! 454: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc40aa027  ! 455: LDUB_I	ldub	[%r10 + 0x0027], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd252801f  ! 456: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3ba991f  ! 457: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 459: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd092901f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
TH_LABEL460:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2911f  ! 461: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba995f  ! 462: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 463: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa020  ! 464: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd03aa020  ! 465: STD_I	std	%r8, [%r10 + 0x0020]
TH_LABEL465:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba983f  ! 466: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcecae04e  ! 467: LDSBA_I	ldsba	[%r11, + 0x004e] %asi, %r7
	.word 0xcfbad91f  ! 468: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2c2a074  ! 469: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r1
	.word 0xc3e2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r1
TH_LABEL470:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba981f  ! 471: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2913f  ! 473: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc39ae030  ! 474: LDDFA_I	ldda	[%r11, 0x0030], %f1
	.word 0xc2c2915f  ! 475: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba991f  ! 476: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 477: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba981f  ! 478: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 479: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba995f  ! 480: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL480:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba997f  ! 481: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 482: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2c2917f  ! 484: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r9
	.word 0xc84a801f  ! 485: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2913f  ! 486: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc6cad07f  ! 487: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xcd02c01f  ! 488: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd202a050  ! 489: LDUW_I	lduw	[%r10 + 0x0050], %r9
	.word 0xd3ba983f  ! 490: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc88a911f  ! 491: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xce02801f  ! 492: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcff2901f  ! 493: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba981f  ! 494: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 495: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba991f  ! 497: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc522801f  ! 498: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2a01f  ! 501: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc722801f  ! 502: STF_R	st	%f3, [%r31, %r10]
	.word 0xccd2913f  ! 503: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r6
	.word 0xc702a030  ! 504: LDF_I	ld	[%r10, 0x0030], %f3
	.word 0xc5baa040  ! 505: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba995f  ! 506: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 507: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba985f  ! 508: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc1a801f  ! 509: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcdf2913f  ! 510: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2903f  ! 511: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcde2901f  ! 512: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3aa040  ! 513: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcdba991f  ! 514: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba995f  ! 516: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 517: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 518: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc212801f  ! 519: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc03a801f  ! 520: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc322801f  ! 521: STF_R	st	%f1, [%r31, %r10]
	.word 0xcf02a050  ! 522: LDF_I	ld	[%r10, 0x0050], %f7
	.word 0xcfba991f  ! 523: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd01aa010  ! 524: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xcb02a070  ! 525: LDF_I	ld	[%r10, 0x0070], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbe2a01f  ! 526: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd122c01f  ! 527: STF_R	st	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 528: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xc2dad11f  ! 529: LDXA_R	ldxa	[%r11, %r31] 0x88, %r1
	.word 0xc3f2e01f  ! 530: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc8a903f  ! 531: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xcdba981f  ! 532: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 533: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcdf2901f  ! 534: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2a01f  ! 535: CASXA_R	casxa	[%r10]%asi, %r31, %r6
TH_LABEL535:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 536: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xce82917f  ! 538: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r7
	.word 0xcac2917f  ! 539: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r5
	.word 0xcbba991f  ! 540: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2d2907f  ! 541: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r9
	.word 0xd3e2903f  ! 542: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 544: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb22c01f  ! 545: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2d11f  ! 546: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xc83ae070  ! 547: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbf2d03f  ! 548: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbe2e01f  ! 549: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad91f  ! 550: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcacaa03c  ! 551: LDSBA_I	ldsba	[%r10, + 0x003c] %asi, %r5
	.word 0xcbba991f  ! 552: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2911f  ! 554: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba995f  ! 555: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa038  ! 556: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbba989f  ! 557: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 558: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc60aa07b  ! 559: LDUB_I	ldub	[%r10 + 0x007b], %r3
	.word 0xce4ac01f  ! 560: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad81f  ! 561: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 562: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad85f  ! 563: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 564: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc39aa008  ! 565: LDDFA_I	ldda	[%r10, 0x0008], %f1
TH_LABEL565:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc522801f  ! 566: STF_R	st	%f2, [%r31, %r10]
	.word 0xc45a801f  ! 567: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc522c01f  ! 568: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 569: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd202a040  ! 570: LDUW_I	lduw	[%r10 + 0x0040], %r9
TH_LABEL570:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc44ae018  ! 571: LDSB_I	ldsb	[%r11 + 0x0018], %r2
	.word 0xc5bad8bf  ! 572: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc88a901f  ! 573: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xd0d2a070  ! 574: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r8
	.word 0xd1ba993f  ! 575: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc84a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd0ca917f  ! 578: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xd1e2913f  ! 579: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc4da917f  ! 580: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd092917f  ! 581: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xd1f2a01f  ! 582: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xce0ae054  ! 583: LDUB_I	ldub	[%r11 + 0x0054], %r7
	.word 0xc4dae018  ! 584: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r2
	.word 0xd0daa008  ! 585: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba983f  ! 586: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd25ae068  ! 587: LDX_I	ldx	[%r11 + 0x0068], %r9
	.word 0xc88ae01c  ! 588: LDUBA_I	lduba	[%r11, + 0x001c] %asi, %r4
	.word 0xc722c01f  ! 589: STF_R	st	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 590: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bae008  ! 591: STDFA_I	stda	%f3, [0x0008, %r11]
	.word 0xc9baa020  ! 592: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc9e2911f  ! 593: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba993f  ! 594: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9aa000  ! 595: LDDFA_I	ldda	[%r10, 0x0000], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcde2903f  ! 596: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xca42c01f  ! 597: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xca52a002  ! 598: LDSH_I	ldsh	[%r10 + 0x0002], %r5
	.word 0xcbba981f  ! 599: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 600: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL600:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba981f  ! 601: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa000  ! 602: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcbba99bf  ! 603: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc3baa010  ! 604: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xc3ba989f  ! 605: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba991f  ! 606: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd302a078  ! 607: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xcf9aa038  ! 608: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xcff2911f  ! 609: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba999f  ! 610: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc302a000  ! 611: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xd302801f  ! 612: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3e2901f  ! 613: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa000  ! 614: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba999f  ! 615: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba995f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 617: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc892901f  ! 618: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xc8c2a038  ! 619: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r4
	.word 0xc9ba989f  ! 620: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6c2a028  ! 621: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r3
	.word 0xcc0a801f  ! 622: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcc3aa028  ! 623: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xc6d2d03f  ! 624: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r3
	.word 0xc43ac01f  ! 625: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc682d01f  ! 626: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r3
	.word 0xc7f2e01f  ! 627: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcfbae010  ! 628: STDFA_I	stda	%f7, [0x0010, %r11]
	.word 0xcb9ae038  ! 629: LDDFA_I	ldda	[%r11, 0x0038], %f5
	.word 0xd1baa000  ! 630: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd102801f  ! 631: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba98bf  ! 632: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd322c01f  ! 633: STF_R	st	%f9, [%r31, %r11]
	.word 0xc45a801f  ! 634: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2901f  ! 635: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba981f  ! 636: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 637: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc25ac01f  ! 638: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc3bad93f  ! 639: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 640: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc01a801f  ! 641: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xccd2d17f  ! 642: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xd28a901f  ! 643: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
	.word 0xd3f2a01f  ! 644: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc522801f  ! 645: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf9aa000  ! 646: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc612801f  ! 647: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xccd2a05a  ! 648: LDSHA_I	ldsha	[%r10, + 0x005a] %asi, %r6
	.word 0xd05ac01f  ! 649: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xca4ae02d  ! 650: LDSB_I	ldsb	[%r11 + 0x002d], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ac01f  ! 651: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d13f  ! 652: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc2da915f  ! 653: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r1
	.word 0xc3ba981f  ! 654: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 655: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd212c01f  ! 656: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xd3f2d01f  ! 657: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc8d2905f  ! 658: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r4
	.word 0xd39aa010  ! 659: LDDFA_I	ldda	[%r10, 0x0010], %f9
	.word 0xd3ba99bf  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2a01f  ! 661: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 662: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 663: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 664: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba98bf  ! 665: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc452e064  ! 666: LDSH_I	ldsh	[%r11 + 0x0064], %r2
	.word 0xcdbaa030  ! 667: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xcdba997f  ! 668: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd012801f  ! 670: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2903f  ! 671: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 672: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc5baa078  ! 673: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc5ba99bf  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80ac01f  ! 675: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad95f  ! 676: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc92a038  ! 677: LDUHA_I	lduha	[%r10, + 0x0038] %asi, %r6
	.word 0xcc3aa038  ! 678: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcf02801f  ! 679: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfe2911f  ! 680: CASA_I	casa	[%r10] 0x88, %r31, %r7
TH_LABEL680:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcff2901f  ! 681: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2901f  ! 683: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc39aa068  ! 684: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xc4ca901f  ! 685: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc5ac01f  ! 686: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcdbae058  ! 687: STDFA_I	stda	%f6, [0x0058, %r11]
	.word 0xc682e068  ! 688: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r3
	.word 0xcf9aa048  ! 689: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xcfe2a01f  ! 690: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca52801f  ! 691: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd01a801f  ! 692: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd3ba997f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa030  ! 694: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc80aa01a  ! 695: LDUB_I	ldub	[%r10 + 0x001a], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcec2a048  ! 696: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r7
	.word 0xcfe2913f  ! 697: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xd0c2d01f  ! 698: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xd1bad9bf  ! 699: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc0ae072  ! 700: LDUB_I	ldub	[%r11 + 0x0072], %r6
TH_LABEL700:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc202c01f  ! 701: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc3f2d01f  ! 702: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 703: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd04aa012  ! 704: LDSB_I	ldsb	[%r10 + 0x0012], %r8
	.word 0xd03aa010  ! 705: STD_I	std	%r8, [%r10 + 0x0010]
TH_LABEL705:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa010  ! 706: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2913f  ! 707: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd322c01f  ! 708: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 709: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 710: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc88a911f  ! 711: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xd3baa028  ! 712: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xd3f2a01f  ! 713: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2911f  ! 714: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xca92a070  ! 715: LDUHA_I	lduha	[%r10, + 0x0070] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba99bf  ! 717: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf9ae030  ! 718: LDDFA_I	ldda	[%r11, 0x0030], %f7
	.word 0xce42e040  ! 719: LDSW_I	ldsw	[%r11 + 0x0040], %r7
	.word 0xcfe2e01f  ! 720: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad8bf  ! 721: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xced2d01f  ! 722: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r7
	.word 0xcfbad97f  ! 723: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 724: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d03f  ! 725: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad91f  ! 726: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 727: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc212801f  ! 728: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc5bae048  ! 729: STDFA_I	stda	%f2, [0x0048, %r11]
	.word 0xd05a801f  ! 730: LDX_R	ldx	[%r10 + %r31], %r8
TH_LABEL730:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2903f  ! 731: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc24aa02c  ! 732: LDSB_I	ldsb	[%r10 + 0x002c], %r1
	.word 0xc6c2901f  ! 733: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xc242e070  ! 734: LDSW_I	ldsw	[%r11 + 0x0070], %r1
	.word 0xca4aa07a  ! 735: LDSB_I	ldsb	[%r10 + 0x007a], %r5
TH_LABEL735:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba995f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922801f  ! 737: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 738: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 739: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca42a07c  ! 740: LDSW_I	ldsw	[%r10 + 0x007c], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce0a801f  ! 741: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba981f  ! 742: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 744: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 745: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcff2903f  ! 746: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcf9aa070  ! 747: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xcfba995f  ! 748: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 749: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xc882a064  ! 750: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc65aa038  ! 751: LDX_I	ldx	[%r10 + 0x0038], %r3
	.word 0xc7e2a01f  ! 752: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba995f  ! 753: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 754: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7bae020  ! 755: STDFA_I	stda	%f3, [0x0020, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd05aa048  ! 756: LDX_I	ldx	[%r10 + 0x0048], %r8
	.word 0xd05ae070  ! 757: LDX_I	ldx	[%r11 + 0x0070], %r8
	.word 0xd1e2e01f  ! 758: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc5baa020  ! 759: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xcac2a03c  ! 760: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba98bf  ! 761: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc692a072  ! 762: LDUHA_I	lduha	[%r10, + 0x0072] %asi, %r3
	.word 0xc922801f  ! 763: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 764: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302a06c  ! 765: LDF_I	ld	[%r10, 0x006c], %f1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2901f  ! 766: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba997f  ! 767: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 768: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 769: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc41aa060  ! 770: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba995f  ! 771: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 772: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6caa03d  ! 773: LDSBA_I	ldsba	[%r10, + 0x003d] %asi, %r3
	.word 0xc7ba995f  ! 774: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 775: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd102801f  ! 776: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc65ac01f  ! 777: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd302c01f  ! 778: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd3bad95f  ! 779: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2dad07f  ! 780: LDXA_R	ldxa	[%r11, %r31] 0x83, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2e01f  ! 781: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3e2d03f  ! 782: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad95f  ! 783: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccca905f  ! 784: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xcc3aa038  ! 785: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba995f  ! 786: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 787: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 788: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdbaa078  ! 789: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xcdba987f  ! 790: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 791: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc81aa008  ! 792: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xcf02a050  ! 793: LDF_I	ld	[%r10, 0x0050], %f7
	.word 0xcc3aa050  ! 794: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc522801f  ! 795: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba993f  ! 796: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 797: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc6da911f  ! 798: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xc7ba989f  ! 799: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 800: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba991f  ! 801: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 802: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 803: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 804: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 805: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc92a072  ! 806: LDUHA_I	lduha	[%r10, + 0x0072] %asi, %r6
	.word 0xc88a907f  ! 807: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xd19ae008  ! 808: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xcc8ae04b  ! 809: LDUBA_I	lduba	[%r11, + 0x004b] %asi, %r6
	.word 0xcc5a801f  ! 810: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba983f  ! 811: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc65aa028  ! 813: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xc7e2903f  ! 814: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba987f  ! 815: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL815:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902c01f  ! 816: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd042c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc702e070  ! 818: LDF_I	ld	[%r11, 0x0070], %f3
	.word 0xc7e2e01f  ! 819: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd08ad01f  ! 820: LDUBA_R	lduba	[%r11, %r31] 0x80, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc2d2d13f  ! 822: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r1
	.word 0xd2daa060  ! 823: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r9
	.word 0xd3ba999f  ! 824: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd082a078  ! 825: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba985f  ! 826: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf22c01f  ! 827: STF_R	st	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 828: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 829: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 830: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad9bf  ! 831: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd25aa038  ! 832: LDX_I	ldx	[%r10 + 0x0038], %r9
	.word 0xc402a054  ! 833: LDUW_I	lduw	[%r10 + 0x0054], %r2
	.word 0xc43aa050  ! 834: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xce5a801f  ! 835: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc80ac01f  ! 836: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc83ae050  ! 837: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xc9bad95f  ! 838: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd252801f  ! 839: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcbbae008  ! 840: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc39aa038  ! 841: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xc3f2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba995f  ! 843: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2caa025  ! 844: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r1
	.word 0xc3e2911f  ! 845: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502a06c  ! 846: LDF_I	ld	[%r10, 0x006c], %f2
	.word 0xc5e2901f  ! 847: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2903f  ! 848: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2a01f  ! 849: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc7bae058  ! 850: STDFA_I	stda	%f3, [0x0058, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad89f  ! 851: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2d01f  ! 852: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 853: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae058  ! 854: STD_I	std	%r2, [%r11 + 0x0058]
	.word 0xc7bad85f  ! 855: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd292a030  ! 856: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r9
	.word 0xcdbaa040  ! 857: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xcdf2a01f  ! 858: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 859: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 860: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL860:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc42801f  ! 861: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc482a018  ! 862: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r2
	.word 0xc5ba987f  ! 863: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 864: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce4ae05f  ! 865: LDSB_I	ldsb	[%r11 + 0x005f], %r7
TH_LABEL865:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc12a05e  ! 866: LDUH_I	lduh	[%r10 + 0x005e], %r6
	.word 0xc9baa050  ! 867: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xc9e2901f  ! 868: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 869: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7bae070  ! 870: STDFA_I	stda	%f3, [0x0070, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc8c2e074  ! 871: LDSWA_I	ldswa	[%r11, + 0x0074] %asi, %r4
	.word 0xc9e2d01f  ! 872: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad93f  ! 873: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 874: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc302801f  ! 875: LDF_R	ld	[%r10, %r31], %f1
TH_LABEL875:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba98bf  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 877: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 878: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0dae040  ! 880: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc242c01f  ! 881: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc282e058  ! 882: LDUWA_I	lduwa	[%r11, + 0x0058] %asi, %r1
	.word 0xc3bad95f  ! 883: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 884: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc302801f  ! 885: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf9aa060  ! 886: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xc45aa008  ! 887: LDX_I	ldx	[%r10 + 0x0008], %r2
	.word 0xc43aa008  ! 888: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba985f  ! 889: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 890: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc722801f  ! 891: STF_R	st	%f3, [%r31, %r10]
	.word 0xc282e008  ! 892: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r1
	.word 0xc03ae008  ! 893: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc03ae008  ! 894: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc39aa030  ! 895: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd02e05c  ! 896: LDF_I	ld	[%r11, 0x005c], %f6
	.word 0xc902e018  ! 897: LDF_I	ld	[%r11, 0x0018], %f4
	.word 0xc9bad97f  ! 898: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 899: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0ac01f  ! 900: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca02e050  ! 901: LDUW_I	lduw	[%r11 + 0x0050], %r5
	.word 0xc83ae050  ! 902: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2e01f  ! 903: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 904: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 905: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad9bf  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd102a010  ! 907: LDF_I	ld	[%r10, 0x0010], %f8
	.word 0xc64aa033  ! 908: LDSB_I	ldsb	[%r10 + 0x0033], %r3
	.word 0xc7ba985f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc5baa058  ! 910: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba987f  ! 911: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd002a04c  ! 912: LDUW_I	lduw	[%r10 + 0x004c], %r8
	.word 0xd1ba999f  ! 913: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 914: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcbbaa010  ! 915: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba991f  ! 916: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd102e00c  ! 917: LDF_I	ld	[%r11, 0x000c], %f8
	.word 0xcdbae020  ! 918: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xcdf2d01f  ! 919: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc44ac01f  ! 920: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc02801f  ! 921: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdf2a01f  ! 922: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xce42a02c  ! 923: LDSW_I	ldsw	[%r10 + 0x002c], %r7
	.word 0xc652c01f  ! 924: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc7e2d03f  ! 925: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa048  ! 926: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xced2901f  ! 927: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xce92e07e  ! 928: LDUHA_I	lduha	[%r11, + 0x007e] %asi, %r7
	.word 0xcfe2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcff2d11f  ! 930: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2d01f  ! 931: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfe2e01f  ! 932: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcc3ac01f  ! 933: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d03f  ! 934: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xd19aa020  ! 935: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 937: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xc9bae050  ! 938: STDFA_I	stda	%f4, [0x0050, %r11]
	.word 0xc83ac01f  ! 939: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd01ae068  ! 940: LDD_I	ldd	[%r11 + 0x0068], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad9bf  ! 941: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce02801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc7baa030  ! 943: STDFA_I	stda	%f3, [0x0030, %r10]
	.word 0xc7e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcf02a074  ! 945: LDF_I	ld	[%r10, 0x0074], %f7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba98bf  ! 946: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 947: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 948: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc6d2a074  ! 949: LDSHA_I	ldsha	[%r10, + 0x0074] %asi, %r3
	.word 0xc7e2903f  ! 950: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba98bf  ! 951: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa070  ! 952: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc7ba997f  ! 953: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 954: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 955: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc9aa008  ! 956: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xcadaa028  ! 957: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xce0ae015  ! 958: LDUB_I	ldub	[%r11 + 0x0015], %r7
	.word 0xcac2901f  ! 959: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xce82a058  ! 960: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba997f  ! 961: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 962: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 963: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82a060  ! 964: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r5
	.word 0xcbba99bf  ! 965: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2901f  ! 966: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba993f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 968: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2a01f  ! 969: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba991f  ! 970: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcacad01f  ! 971: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xc83ac01f  ! 972: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad99f  ! 973: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0aa047  ! 974: LDUB_I	ldub	[%r10 + 0x0047], %r5
	.word 0xcbba989f  ! 975: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc502801f  ! 977: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5ba995f  ! 978: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092a074  ! 979: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r8
	.word 0xd1f2901f  ! 980: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd0daa020  ! 981: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r8
	.word 0xd1ba983f  ! 982: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882a010  ! 983: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r4
	.word 0xc9ba983f  ! 984: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 985: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba981f  ! 986: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcbbaa050  ! 987: STDFA_I	stda	%f5, [0x0050, %r10]
	.word 0xcf22c01f  ! 988: STF_R	st	%f7, [%r31, %r11]
	.word 0xce42e01c  ! 989: LDSW_I	ldsw	[%r11 + 0x001c], %r7
	.word 0xd19aa070  ! 990: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa070  ! 991: STD_I	std	%r8, [%r10 + 0x0070]
	.word 0xc41ae078  ! 992: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xc7bad95f  ! 993: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca82a078  ! 994: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r5
	.word 0xcbba987f  ! 995: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83aa078  ! 996: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xca92e04c  ! 997: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r5
	.word 0xcbe2d01f  ! 998: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad97f  ! 999: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc682917f  ! 1000: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
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
.xword 0xa310ae21b2664f4f
.xword 0xa85298b5ab86314e
.xword 0xc617b1262e8c367a
.xword 0x2543d58fe942d103
.xword 0x2176040b45eaf3f7
.xword 0xdaac4fc65b0c31a7
.xword 0x28a1c5ae48b3308f
.xword 0x4cb906fa776bf045
.xword 0xa0bf7d83d6c15013
.xword 0x584e24054ba01c06
.xword 0x3c690991a4d7acc6
.xword 0x88a4d2c43fd41919
.xword 0xc5036b3453a34545
.xword 0x1f5d8189750fd601
.xword 0x646dca8cf2da8107
.xword 0x1a2044077b4f0fc0
.xword 0x56970b02fef38a58
.xword 0xbb50ee8f9860a381
.xword 0x49843ee1227f4630
.xword 0xfc6233619e4864a3
.xword 0x2fc29ae03400d2a8
.xword 0xdde3e73d35fb3213
.xword 0x80ba27e5ec5a5ae0
.xword 0x0da043bd29bc8fcd
.xword 0x746d0a8cf14b6ff8
.xword 0xc0e4c5947c049efd
.xword 0x4d532180771b8506
.xword 0x146a06eb52ad2719
.xword 0x05a99c7d7638f016
.xword 0x5bd592ee91b381da
.xword 0xd7366e86f9d1a0ff
.xword 0xa861052b95faec74



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
.xword 0xac7a9b72560a1566

.xword 0x5edc067254d18296

.xword 0x44d0fa6f344958f9

.xword 0x0474b8ce5c36176b

.xword 0x25bf7388b2106cab

.xword 0x63a3312f3fd98bdd

.xword 0xcb4b90a41035baad

.xword 0x02b53f84d376220d

.xword 0xc50aa5a5e3c3950f

.xword 0xb41a8ffca891aba8

.xword 0xf2efd5062d50d433

.xword 0xf3fa14eb99ab8258

.xword 0xd21a7af69d43c6cf

.xword 0x900d8f36064e02d6

.xword 0x9fd6197369148bbe

.xword 0xd984c1d14db6ebf7

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
.xword 0xd9460f1150e1c53e
.xword 0x7c7c9e86ec948b92
.xword 0x638da040385be569
.xword 0x254078c4e31d9a82
.xword 0xd0bce66ecb17da1c
.xword 0x081aa40e69cf3160
.xword 0xd50dff5ad6f4de27
.xword 0x5ce86a3f0965b5f1
.xword 0xdecc05b8ffa10491




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
.xword 0xff9a2b9613b8e8fd
.xword 0xb269ca63eb45baa4
.xword 0x98c2321c341cd297
.xword 0xc1dde73c0d0a66fb
.xword 0xf6701a0d3fdc3590
.xword 0x8385757d74d249af
.xword 0xe5b7921aa010ce06
.xword 0xad5fb391e0304f40
.xword 0x66052b3a6dafd4ac




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
.xword 0x2e3f79906b15f211
.xword 0x027183b9ccaca858
.xword 0xd1815f34a77629de
.xword 0xed7d1e48f83e36bb
.xword 0x3071732715015d29
.xword 0x03c26406462d9edc
.xword 0x2fab23c28dcd2f67
.xword 0x3e05adc43f6cd4dd
.xword 0x0bcc76e813ab6ebc




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
.xword 0x9716eee8402a1588
.xword 0x07e342ad489dbad8
.xword 0x4c78ff4566abe505
.xword 0x699339aafe455e00
.xword 0x45ea6ca30e99224c
.xword 0x6197c7a481401689
.xword 0xb2b9d17c18ca3e3b
.xword 0x5d9d8727201d1c75
.xword 0x1d53186ca979d31a




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
.xword 0x5a5b00e63ec0559f
.xword 0xd833a5ca77ab6a1d
.xword 0x82366f230cf8f3f2
.xword 0x69a0a3adabff015c
.xword 0xd2211677656a554e
.xword 0x7e0f5ca2d38dec6d
.xword 0x97f9c7d48a490312
.xword 0x063bf3ebd56983c2
.xword 0x12f5e8c252093a1f




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
.xword 0x32324e3fe46d9327
.xword 0x05c128d25994887c
.xword 0x9ba8ed741b5c3277
.xword 0x759e3933283319d8
.xword 0xa607c922876e75d5
.xword 0xdb95ca9eb529e92b
.xword 0x89f2e7f4a7e3f89d
.xword 0x6a8f3ddc2a4543d8
.xword 0x7a8150ca4b93c305




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
.xword 0xde69fd6babe9937a
.xword 0xd82ad0e5086db550
.xword 0xe91391331d5a7fc3
.xword 0x06f3e729df7eca3a
.xword 0xc441b51a28fdf8d7
.xword 0x7e32362d0d5b0ac3
.xword 0xefd482ad0207f161
.xword 0xed6b76b65825c28c
.xword 0x391cd6153b725a98






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
.xword 0x4a8f905f996736d2

.xword 0xca6edb6bc9215e69

.xword 0x99e415f2297faa22

.xword 0x1ae08eb9a52e0c16

.xword 0x0b53cb8953f3d447

.xword 0xbb794d41e8eb7ced

.xword 0x99c7cb9cd7478088

.xword 0x0343d5d04725ce9f

.xword 0xe28558ad6787cc54

.xword 0xe4b53ae58cca9396

.xword 0x057c1c69a57eceee

.xword 0x3f49cc524f84c50e

.xword 0xbf54d7671615284b

.xword 0x08efedb5290a7c3b

.xword 0xfaeed54b21aa70b8

.xword 0x6de6387ce3066f24




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
.xword 0xc88a702327685675
.xword 0x5c246545db03918c
.xword 0x9b957fd64420d9e5
.xword 0x5dc04e06cc8c7fd6
.xword 0xf331ec5ce9dc58dd
.xword 0x9b6b78bfe1525c4b
.xword 0x08a48344d45c4657
.xword 0x2ad16e8a8ee6308d



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
.xword 0x20a504b24021e216
.xword 0x30a4b3cdcfe4f8ba
.xword 0x28e9e07541539393
.xword 0xfa76e036aa8e4e97
.xword 0x7486cb9d8216dda7
.xword 0x36bed98f7ac6a116
.xword 0x2678a64fb16023c7
.xword 0xae2bd24ff0263c94



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
.xword 0x697892d5863705dc
.xword 0xc55ac3f96d1c5c65
.xword 0xda4884b3e48bf999
.xword 0x71b992e2a12eb57f
.xword 0x032c049f3a26d52c
.xword 0xe41659f917b6dac6
.xword 0xcb232a49d5158bff
.xword 0x22fc72e4b903b12a



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
.xword 0x6ebe7b6309b4a98d
.xword 0x12941e65a60c1eb1
.xword 0x80b807c8d93afe5e
.xword 0x74dc3ba3bf744b94
.xword 0x3fb9bdf78ba9d697
.xword 0x91d94a75b2371f73
.xword 0xe14b1eb1782fde35
.xword 0xe2aa61f7d6a9a1d6



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
.xword 0x821d275beeb69c77
.xword 0x2acce163a6601fe2
.xword 0x1a6165fec3c638b2
.xword 0x1ed50e6e9b0a2b0f
.xword 0xdf07fcb4ff31c72f
.xword 0xe445eacd5a51c6c8
.xword 0x9f64c2beae2fe8ef
.xword 0x63e207495b888d44



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
.xword 0xc146da39ee924de3
.xword 0xf894b6fcfc6d5b31
.xword 0xb11742a5da7df0cd
.xword 0x47483c15f6485786
.xword 0x2cc4a3db4f33d2a7
.xword 0x56e6ddf2b54a2c38
.xword 0xe061b76cffb26144
.xword 0x4060ca2e4d834b07



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
.xword 0x62ef34b30e8a25fd
.xword 0x2d32fce909a3a8fe
.xword 0x45204d118e1a8998
.xword 0xf4b6265d220cefca
.xword 0x3d2938000d0ae313
.xword 0x8409de7acc4e4e70
.xword 0xcf78f78188ecad55
.xword 0xd449514d01d2fec5





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
.xword 0xe9813c41257f3dae

.xword 0xf46e57600bde9cec

.xword 0x19e58323e890ede2

.xword 0xb6eaf269f62c713a

.xword 0x08f526c3bd0893ed

.xword 0x9db00fd56fcfd091

.xword 0xb22795b1cb9f0a67

.xword 0x1ba18843232e68f6

.xword 0x7524cfbf47a2adc1

.xword 0x52f174e4b07b08a9

.xword 0xf3e4b54903d34d1b

.xword 0x0492a3971846ba58

.xword 0xf88ebcf7d27e2c80

.xword 0xd912a469683a720e

.xword 0x71242b9186951b66

.xword 0x5c872afc2a790e69

.xword 0xe5c887c9bbcf9efa

.xword 0x7b5edfd3ec73586a

.xword 0xdb726b76973d5797

.xword 0x07c6131de16d7849

.xword 0xcea120e10496932a

.xword 0x819527a3459189d2

.xword 0xa5e7bed60ac37d05

.xword 0x9db95dd1eb7bcb44

.xword 0x018eb4be187204f5

.xword 0x2afe4e04168faf78

.xword 0x9799f481006f55df

.xword 0x01760364daaa8ec4

.xword 0x02c89fd1f7cbcbac

.xword 0xb057aa7132da4470

.xword 0xf10c57afdc988539

.xword 0x4bd6bf76ec115aeb

.xword 0x5d46cf45cf111bc2

.xword 0xa310d5261f21b7c0

.xword 0x65e5669254d7930d

.xword 0x63a82a66731405fa

.xword 0x45254d57c0fc9cea

.xword 0xe4aa07bfd0da38c7

.xword 0x4f17330ab04811bb

.xword 0x54c215dbb74c815c

.xword 0xb2e5875aa36b725b

.xword 0x02b54016c95e159d

.xword 0x9909a6874a658554

.xword 0x579a798eae21893a

.xword 0xcf188c74a89aa5cd

.xword 0x32a16f8583896b2c

.xword 0xdbac410a02f7fd76

.xword 0xf797f2bebd43fcdd

.xword 0x5094e51f371aafb1

.xword 0x7001d0c3b7f86230

.xword 0x03001bc231786c55

.xword 0xa66a903324b3e8c6

.xword 0xb9cf5ae4aa1ec045

.xword 0x379756a41fef6fe5

.xword 0xe6c97900c1bd235c

.xword 0x3586b88d10d6a7ae

.xword 0x43f9e195c32eca33

.xword 0xc81a97b5558622a0

.xword 0xb234d1c8fe425a81

.xword 0x0ae9d434e4ea0bb7

.xword 0x390c99a3ec6ca173

.xword 0xcab4ebddf4b99790

.xword 0xcc427d72a688243a

.xword 0x30e5a134aa2ac6f0

.xword 0xd7753830ac90fa84

.xword 0xaa8a644bc1901c05

.xword 0xd90d8f6e99a2d140

.xword 0x2e87880a3eabdcfc

.xword 0x591df7af20b15b9c

.xword 0x1c0170193ed81584

.xword 0x5b5324fb503f1385

.xword 0xa62ed100854bfc29

.xword 0x6c8f662c9ce628cd

.xword 0xbf365440e43e7edd

.xword 0x245d322a4a32333f

.xword 0x9c916bea53eca48b

.xword 0xdcbd82111bfb565f

.xword 0x3da563ec1b5210e9

.xword 0x03732af4f5626fb4

.xword 0x6783ae0823a43505

.xword 0xb4c260f67a7e1384

.xword 0x83704928a817bc4f

.xword 0x13bae8fe736552f8

.xword 0xab533906c062ae5f

.xword 0xfc727d22afdddc19

.xword 0xc78e4536cbdd8fc7

.xword 0xfe1faf03a50c3b10

.xword 0x74c7c70966be43cb

.xword 0x2e6804c5ddd9357b

.xword 0x92949babc88b1aab

.xword 0xd7f3e55f6b3bd227

.xword 0x3001ada9ff8fb796

.xword 0x022ec4b17a0103a9

.xword 0xf9d201b5141fd47e

.xword 0xf7746d1fbae71adf

.xword 0xe8646078db590056

.xword 0xb8f8b5033c7059db

.xword 0xb9867d1aeee55d62

.xword 0xbb71419d840ed24a

.xword 0x1f698e394a32b0ea

.xword 0x4195c6b15b4422fd

.xword 0x766755f68acb0017

.xword 0x44487fcb152992ee

.xword 0x517c49e9b6825cb4

.xword 0x2f4ef06f50b0d241

.xword 0x0543c71590f57b0a

.xword 0x1ed8c2f8405836bf

.xword 0xfe519fe1d5d75d45

.xword 0xdfbfe0c63951252a

.xword 0x868e05bd1a64a47c

.xword 0x920609a85013128b

.xword 0x58810eee385c6421

.xword 0xe6f1148aa3918bcb

.xword 0xdc3c6c40d5924d15

.xword 0xb4a09859e157164e

.xword 0xcd964849ba9c359e

.xword 0x4c4f835f14388333

.xword 0x257ffa79ffa70730

.xword 0x692923d076144174

.xword 0xb1e5a8e8c9f64951

.xword 0xfcb10969776fd960

.xword 0x62a4ffa41a6a95ba

.xword 0xba61c0e0c7d3d227

.xword 0x2efe4c982eba0e1f

.xword 0xe221c909ec4b18f5

.xword 0xc99f909efb6ce388

.xword 0xdec5c63cd1f8b99c

.xword 0x35d9433a74e1827a

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
