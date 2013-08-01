/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst2.s
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
	setx 0x5f7d7877d14788fc, %g1, %r2
	setx 0x125334c79ddd4394, %g1, %r3
	setx 0x898766212c05c42f, %g1, %r4
	setx 0x3ea97d648da13d70, %g1, %r5
	setx 0x660fcc53f1c0f68f, %g1, %r6
	setx 0xc514d09c4c9f799e, %g1, %r7
	setx 0x0e0b29d9495bf16e, %g1, %r8

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
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xd122c01f  ! 2: STF_R	st	%f8, [%r31, %r11]
	.word 0xcdba983f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba99bf  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5baa058  ! 7: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad89f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL10:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad81f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc842801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc4daa000  ! 14: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r2
	.word 0xc722801f  ! 15: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad93f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcbbaa048  ! 19: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xc922801f  ! 20: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc79aa010  ! 22: LDDFA_I	ldda	[%r10, 0x0010], %f3
	.word 0xc492d01f  ! 23: LDUHA_R	lduha	[%r11, %r31] 0x80, %r2
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc89ae068  ! 26: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r4
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc2d2901f  ! 28: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xc3bae010  ! 29: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
TH_LABEL30:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba999f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba981f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb22801f  ! 34: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbbad8bf  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL35:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc642c01f  ! 36: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc502801f  ! 37: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xc502801f  ! 39: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba991f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc20aa05c  ! 43: LDUB_I	ldub	[%r10 + 0x005c], %r1
	.word 0xcbba98bf  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa000  ! 46: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcaca903f  ! 48: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xd3f2d01f  ! 49: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc99aa048  ! 50: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2d01f  ! 51: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad93f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d13f  ! 55: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xceda917f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r7
	.word 0xcbe2d01f  ! 57: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad9bf  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd09ae078  ! 59: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r8
	.word 0xcfe2903f  ! 60: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba991f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02e044  ! 62: LDF_I	ld	[%r11, 0x0044], %f5
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba99bf  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcf02801f  ! 65: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2903f  ! 66: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc2c2915f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xc5ba999f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcac2901f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc88a905f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba991f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc902a05c  ! 74: LDF_I	ld	[%r10, 0x005c], %f4
	.word 0xcc92e030  ! 75: LDUHA_I	lduha	[%r11, + 0x0030] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09aa068  ! 76: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r8
	.word 0xcbbad97f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc882d03f  ! 78: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r4
	.word 0xcfba981f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba989f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca5a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xc41a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd0c2a04c  ! 84: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r8
	.word 0xc7bae048  ! 85: STDFA_I	stda	%f3, [0x0048, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad93f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd08a905f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2901f  ! 89: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba985f  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc642a02c  ! 91: LDSW_I	ldsw	[%r10 + 0x002c], %r3
	.word 0xc3f2911f  ! 92: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba995f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2901f  ! 99: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcf22801f  ! 100: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad97f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd25aa058  ! 105: LDX_I	ldx	[%r10 + 0x0058], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2903f  ! 106: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba985f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca0ac01f  ! 110: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01ac01f  ! 111: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd3ba987f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xca42a034  ! 114: LDSW_I	ldsw	[%r10 + 0x0034], %r5
	.word 0xc7baa058  ! 115: STDFA_I	stda	%f3, [0x0058, %r10]
TH_LABEL115:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0c2a058  ! 116: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r8
	.word 0xc852801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xca52c01f  ! 118: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc522c01f  ! 119: STF_R	st	%f2, [%r31, %r11]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba983f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc322c01f  ! 122: STF_R	st	%f1, [%r31, %r11]
	.word 0xcc12801f  ! 123: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc5ba98bf  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd3baa050  ! 125: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc6d2e058  ! 126: LDSHA_I	ldsha	[%r11, + 0x0058] %asi, %r3
	.word 0xcc82905f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r6
	.word 0xd39aa008  ! 128: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xd3bad99f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xceda903f  ! 131: LDXA_R	ldxa	[%r10, %r31] 0x81, %r7
	.word 0xcdf2913f  ! 132: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce4aa06a  ! 134: LDSB_I	ldsb	[%r10 + 0x006a], %r7
	.word 0xc9e2911f  ! 135: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba997f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcb02a034  ! 139: LDF_I	ld	[%r10, 0x0034], %f5
	.word 0xc81ae070  ! 140: LDD_I	ldd	[%r11 + 0x0070], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2901f  ! 141: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc502e07c  ! 142: LDF_I	ld	[%r11, 0x007c], %f2
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xc39aa078  ! 144: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xcd02a068  ! 145: LDF_I	ld	[%r10, 0x0068], %f6
TH_LABEL145:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba985f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 148: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd3bae048  ! 150: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 151: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcb9aa070  ! 152: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcecad01f  ! 155: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902801f  ! 156: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfba989f  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba987f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbaa008  ! 161: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xcfe2913f  ! 162: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba989f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc1ac01f  ! 166: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd1baa010  ! 167: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xd102a008  ! 168: LDF_I	ld	[%r10, 0x0008], %f8
	.word 0xcdf2913f  ! 169: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd102a020  ! 170: LDF_I	ld	[%r10, 0x0020], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7bad85f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc502e01c  ! 174: LDF_I	ld	[%r11, 0x001c], %f2
	.word 0xcc12a044  ! 175: LDUH_I	lduh	[%r10 + 0x0044], %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5baa030  ! 176: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd082a034  ! 178: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r8
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc502a020  ! 180: LDF_I	ld	[%r10, 0x0020], %f2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad8bf  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad89f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd1bae028  ! 187: STDFA_I	stda	%f8, [0x0028, %r11]
	.word 0xcc42801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba995f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2901f  ! 193: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xccc2913f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd102801f  ! 196: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad89f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 199: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbe2d01f  ! 201: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xce02a018  ! 202: LDUW_I	lduw	[%r10 + 0x0018], %r7
	.word 0xc5ba981f  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 204: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc402801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2911f  ! 206: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcf02a000  ! 207: LDF_I	ld	[%r10, 0x0000], %f7
	.word 0xca52c01f  ! 208: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcfbad93f  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc4a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302801f  ! 216: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1e2913f  ! 217: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba981f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc44a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd25aa000  ! 220: LDX_I	ldx	[%r10 + 0x0000], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bae018  ! 221: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xc602e04c  ! 222: LDUW_I	lduw	[%r11 + 0x004c], %r3
	.word 0xcf02e00c  ! 223: LDF_I	ld	[%r11, 0x000c], %f7
	.word 0xcbba989f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd00ac01f  ! 225: LDUB_R	ldub	[%r11 + %r31], %r8
TH_LABEL225:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc4da901f  ! 227: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xd302801f  ! 228: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc502c01f  ! 230: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba98bf  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2911f  ! 232: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xd2d2a014  ! 233: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r9
	.word 0xc692a056  ! 234: LDUHA_I	lduha	[%r10, + 0x0056] %asi, %r3
	.word 0xc7baa048  ! 235: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9baa078  ! 236: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xc49aa068  ! 237: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xcf02c01f  ! 238: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcc9aa008  ! 239: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xd3ba981f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL240:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2901f  ! 241: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd09aa070  ! 242: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r8
	.word 0xc5ba981f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 244: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xca92a042  ! 245: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba98bf  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc28a913f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x89, %r1
	.word 0xd3baa030  ! 248: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad97f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad93f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d01f  ! 253: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad8bf  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc60ac01f  ! 260: LDUB_R	ldub	[%r11 + %r31], %r3
TH_LABEL260:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba987f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc802a03c  ! 264: LDUW_I	lduw	[%r10 + 0x003c], %r4
	.word 0xc5e2d01f  ! 265: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad87f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d13f  ! 269: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad91f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd19aa018  ! 271: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xcbbae038  ! 273: STDFA_I	stda	%f5, [0x0038, %r11]
	.word 0xc84ac01f  ! 274: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xd1bad91f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb22c01f  ! 276: STF_R	st	%f5, [%r31, %r11]
	.word 0xc282d05f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r1
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcd9aa000  ! 279: LDDFA_I	ldda	[%r10, 0x0000], %f6
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba993f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc212a05a  ! 284: LDUH_I	lduh	[%r10 + 0x005a], %r1
	.word 0xcdba987f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd2c2e044  ! 288: LDSWA_I	ldswa	[%r11, + 0x0044] %asi, %r9
	.word 0xc79aa058  ! 289: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
TH_LABEL290:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad91f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3bad85f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 297: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad83f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 299: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xcb02801f  ! 300: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc302a01c  ! 301: LDF_I	ld	[%r10, 0x001c], %f1
	.word 0xc8c2d05f  ! 302: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r4
	.word 0xcc82d03f  ! 303: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r6
	.word 0xc4da917f  ! 304: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xcdbaa060  ! 305: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba989f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902a000  ! 307: LDF_I	ld	[%r10, 0x0000], %f4
	.word 0xcfbae058  ! 308: STDFA_I	stda	%f7, [0x0058, %r11]
	.word 0xc9ba985f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcfbae038  ! 310: STDFA_I	stda	%f7, [0x0038, %r11]
TH_LABEL310:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba995f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc20ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd1f2d03f  ! 314: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad83f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc612a03c  ! 316: LDUH_I	lduh	[%r10 + 0x003c], %r3
	.word 0xd302a014  ! 317: LDF_I	ld	[%r10, 0x0014], %f9
	.word 0xcf02801f  ! 318: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc252a01e  ! 320: LDSH_I	ldsh	[%r10 + 0x001e], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad95f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad95f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80a801f  ! 324: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xcfba995f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba987f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd39aa038  ! 327: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xd1bad93f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce4aa06f  ! 329: LDSB_I	ldsb	[%r10 + 0x006f], %r7
	.word 0xd122c01f  ! 330: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5e2901f  ! 331: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2913f  ! 332: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc41a801f  ! 333: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9ba997f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc52801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r6
TH_LABEL335:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc902801f  ! 336: LDF_R	ld	[%r10, %r31], %f4
	.word 0xca12801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd3e2d11f  ! 338: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd1bae070  ! 339: STDFA_I	stda	%f8, [0x0070, %r11]
	.word 0xd1bad9bf  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad85f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d03f  ! 342: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xcacad01f  ! 343: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xc3ba983f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba995f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca12e062  ! 347: LDUH_I	lduh	[%r11 + 0x0062], %r5
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa000  ! 349: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xc5ba993f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba985f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc322801f  ! 353: STF_R	st	%f1, [%r31, %r10]
	.word 0xd1bad81f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad97f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad87f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce82d15f  ! 362: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r7
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcac2e030  ! 364: LDSWA_I	ldswa	[%r11, + 0x0030] %asi, %r5
	.word 0xd082907f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad8bf  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 369: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad81f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc612a046  ! 371: LDUH_I	lduh	[%r10 + 0x0046], %r3
	.word 0xcfe2911f  ! 372: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2913f  ! 373: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2901f  ! 374: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd302a060  ! 375: LDF_I	ld	[%r10, 0x0060], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02e01c  ! 376: LDF_I	ld	[%r11, 0x001c], %f6
	.word 0xcbf2903f  ! 377: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xd002801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc60aa04f  ! 379: LDUB_I	ldub	[%r10 + 0x004f], %r3
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc902801f  ! 381: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9e2901f  ! 382: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcc12c01f  ! 383: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xc7ba99bf  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd05aa030  ! 385: LDX_I	ldx	[%r10 + 0x0030], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2d03f  ! 386: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xcf02a054  ! 387: LDF_I	ld	[%r10, 0x0054], %f7
	.word 0xc5ba995f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc322801f  ! 389: STF_R	st	%f1, [%r31, %r10]
	.word 0xc842a04c  ! 390: LDSW_I	ldsw	[%r10 + 0x004c], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba991f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 392: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcc9aa018  ! 393: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xc9bad93f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd202a00c  ! 395: LDUW_I	lduw	[%r10 + 0x000c], %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xd24a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc5ba983f  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc60aa049  ! 399: LDUB_I	ldub	[%r10 + 0x0049], %r3
	.word 0xc3f2d01f  ! 400: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcecaa00b  ! 401: LDSBA_I	ldsba	[%r10, + 0x000b] %asi, %r7
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc68a911f  ! 406: LDUBA_R	lduba	[%r10, %r31] 0x88, %r3
	.word 0xc9bad85f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca92907f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xcbbae078  ! 410: STDFA_I	stda	%f5, [0x0078, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2903f  ! 411: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba999f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5f2911f  ! 416: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc60a801f  ! 417: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc9bad8bf  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6c2d17f  ! 419: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r3
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
TH_LABEL420:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad91f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccd2917f  ! 422: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xc3ba997f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 425: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca42801f  ! 426: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd0d2d07f  ! 427: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r8
	.word 0xcdf2901f  ! 428: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL430:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba997f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba987f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 435: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
TH_LABEL435:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce52801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcc1aa018  ! 438: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xcecaa062  ! 439: LDSBA_I	ldsba	[%r10, + 0x0062] %asi, %r7
	.word 0xcdba997f  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd282a044  ! 441: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r9
	.word 0xc2c2d13f  ! 442: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xc7bad99f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc84ac01f  ! 445: LDSB_R	ldsb	[%r11 + %r31], %r4
TH_LABEL445:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302801f  ! 446: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcdba997f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2913f  ! 449: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba985f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xd282d03f  ! 452: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r9
	.word 0xd3ba995f  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc602e024  ! 455: LDUW_I	lduw	[%r11 + 0x0024], %r3
TH_LABEL455:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc3bae010  ! 457: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xc25aa010  ! 458: LDX_I	ldx	[%r10 + 0x0010], %r1
	.word 0xd1ba98bf  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc28aa068  ! 460: LDUBA_I	lduba	[%r10, + 0x0068] %asi, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc902c01f  ! 461: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcbba997f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd102e050  ! 463: LDF_I	ld	[%r11, 0x0050], %f8
	.word 0xc522c01f  ! 464: STF_R	st	%f2, [%r31, %r11]
	.word 0xc39aa048  ! 465: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5baa000  ! 466: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xcbba981f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc402a038  ! 468: LDUW_I	lduw	[%r10 + 0x0038], %r2
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba981f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc64ae066  ! 472: LDSB_I	ldsb	[%r11 + 0x0066], %r3
	.word 0xd092901f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xcfe2d03f  ! 474: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcff2d11f  ! 475: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
TH_LABEL475:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2d03f  ! 476: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd0caa032  ! 478: LDSBA_I	ldsba	[%r10, + 0x0032] %asi, %r8
	.word 0xc2daa000  ! 479: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r1
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd0ca915f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xccd2d17f  ! 482: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xcfbad85f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd04aa00f  ! 486: LDSB_I	ldsb	[%r10 + 0x000f], %r8
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd282a050  ! 488: LDUWA_I	lduwa	[%r10, + 0x0050] %asi, %r9
	.word 0xd00ae019  ! 489: LDUB_I	ldub	[%r11 + 0x0019], %r8
	.word 0xcf9aa060  ! 490: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba983f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc01ae010  ! 493: LDD_I	ldd	[%r11 + 0x0010], %r0
	.word 0xd2ca905f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r9
	.word 0xd19aa038  ! 495: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbaa018  ! 496: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xcbbad8bf  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 498: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc7bae000  ! 500: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2903f  ! 501: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba981f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL505:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc4daa060  ! 507: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r2
	.word 0xc292d11f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x88, %r1
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad89f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad97f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd3baa010  ! 512: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xc3f2911f  ! 513: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba985f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc99aa078  ! 515: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc9aa028  ! 518: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r6
	.word 0xc7bae008  ! 519: STDFA_I	stda	%f3, [0x0008, %r11]
	.word 0xc412801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6c2d05f  ! 521: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r3
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc59aa028  ! 523: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xc492911f  ! 524: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xcbba98bf  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2d2a04a  ! 526: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r1
	.word 0xcdba989f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 528: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc4aa032  ! 529: LDSB_I	ldsb	[%r10 + 0x0032], %r6
	.word 0xd3bad93f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d13f  ! 531: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xca5ac01f  ! 533: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc2daa028  ! 534: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r1
	.word 0xcfba983f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba985f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 539: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba999f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8aa05a  ! 541: LDUBA_I	lduba	[%r10, + 0x005a] %asi, %r7
	.word 0xc81aa040  ! 542: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL545:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc452801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xce5a801f  ! 547: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc5bad83f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc41aa030  ! 550: LDD_I	ldd	[%r10 + 0x0030], %r2
TH_LABEL550:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf22c01f  ! 551: STF_R	st	%f7, [%r31, %r11]
	.word 0xd3bad91f  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xceda911f  ! 553: LDXA_R	ldxa	[%r10, %r31] 0x88, %r7
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2913f  ! 556: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc64a801f  ! 557: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc4caa02a  ! 558: LDSBA_I	ldsba	[%r10, + 0x002a] %asi, %r2
	.word 0xd1ba981f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc652e052  ! 560: LDSH_I	ldsh	[%r11 + 0x0052], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba981f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba985f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd00a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02801f  ! 566: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba98bf  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca5aa070  ! 571: LDX_I	ldx	[%r10 + 0x0070], %r5
	.word 0xc3ba987f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce02801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc7ba993f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd04aa008  ! 576: LDSB_I	ldsb	[%r10 + 0x0008], %r8
	.word 0xcc4ac01f  ! 577: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xcd9ae050  ! 578: LDDFA_I	ldda	[%r11, 0x0050], %f6
	.word 0xc3bad93f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xce0ae00f  ! 583: LDUB_I	ldub	[%r11 + 0x000f], %r7
	.word 0xc292a07c  ! 584: LDUHA_I	lduha	[%r10, + 0x007c] %asi, %r1
	.word 0xcff2911f  ! 585: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc79ae070  ! 586: LDDFA_I	ldda	[%r11, 0x0070], %f3
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xcc8ad01f  ! 589: LDUBA_R	lduba	[%r11, %r31] 0x80, %r6
	.word 0xcbe2d01f  ! 590: CASA_I	casa	[%r11] 0x80, %r31, %r5
TH_LABEL590:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad9bf  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc0a801f  ! 592: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc9baa078  ! 593: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xcd9ae018  ! 594: LDDFA_I	ldda	[%r11, 0x0018], %f6
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd092911f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x88, %r8
	.word 0xce12801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc9f2913f  ! 599: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba991f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba98bf  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb22801f  ! 602: STF_R	st	%f5, [%r31, %r10]
	.word 0xc79ae008  ! 603: LDDFA_I	ldda	[%r11, 0x0008], %f3
	.word 0xcb9aa018  ! 604: LDDFA_I	ldda	[%r10, 0x0018], %f5
	.word 0xc7bad91f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc642a010  ! 606: LDSW_I	ldsw	[%r10 + 0x0010], %r3
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad81f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc892d05f  ! 611: LDUHA_R	lduha	[%r11, %r31] 0x82, %r4
	.word 0xcb02801f  ! 612: LDF_R	ld	[%r10, %r31], %f5
	.word 0xca42801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcfba98bf  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc882e014  ! 615: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc81ac01f  ! 616: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba999f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc212a04e  ! 620: LDUH_I	lduh	[%r10 + 0x004e], %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc81a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcc5aa038  ! 622: LDX_I	ldx	[%r10 + 0x0038], %r6
	.word 0xcf02a064  ! 623: LDF_I	ld	[%r10, 0x0064], %f7
	.word 0xcdba981f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa028  ! 625: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5baa038  ! 626: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc292903f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x81, %r1
	.word 0xd092e024  ! 628: LDUHA_I	lduha	[%r11, + 0x0024] %asi, %r8
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xce52a018  ! 630: LDSH_I	ldsh	[%r10 + 0x0018], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba985f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2911f  ! 633: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3f2903f  ! 634: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba985f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba99bf  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ae038  ! 637: LDD_I	ldd	[%r11 + 0x0038], %r4
	.word 0xc9bad81f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccd2e072  ! 639: LDSHA_I	ldsha	[%r11, + 0x0072] %asi, %r6
	.word 0xcdba989f  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba995f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcccae000  ! 642: LDSBA_I	ldsba	[%r11, + 0x0000] %asi, %r6
	.word 0xd3ba995f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 645: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba981f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 649: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc9baa068  ! 650: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbaa050  ! 651: STDFA_I	stda	%f5, [0x0050, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcd9aa020  ! 653: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xc68aa064  ! 654: LDUBA_I	lduba	[%r10, + 0x0064] %asi, %r3
	.word 0xd1baa040  ! 655: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02801f  ! 656: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3f2901f  ! 657: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba983f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc5baa038  ! 662: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xce82a010  ! 663: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r7
	.word 0xd09ae050  ! 664: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r8
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc39ae018  ! 667: LDDFA_I	ldda	[%r11, 0x0018], %f1
	.word 0xcbf2901f  ! 668: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xced2e060  ! 671: LDSHA_I	ldsha	[%r11, + 0x0060] %asi, %r7
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad95f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d13f  ! 675: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc812801f  ! 676: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc20ae071  ! 677: LDUB_I	ldub	[%r11 + 0x0071], %r1
	.word 0xc3ba991f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc6c2a038  ! 681: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r3
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd1bae030  ! 683: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xcbba981f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc522801f  ! 685: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd012a044  ! 686: LDUH_I	lduh	[%r10 + 0x0044], %r8
	.word 0xc502a04c  ! 687: LDF_I	ld	[%r10, 0x004c], %f2
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba981f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xc01a801f  ! 693: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xcfba981f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
TH_LABEL695:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc9aa030  ! 696: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r6
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc5aa030  ! 698: LDX_I	ldx	[%r10 + 0x0030], %r6
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad85f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc902a058  ! 702: LDF_I	ld	[%r10, 0x0058], %f4
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xce52a06a  ! 704: LDSH_I	ldsh	[%r10 + 0x006a], %r7
	.word 0xcfbae050  ! 705: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad89f  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd1bae038  ! 707: STDFA_I	stda	%f8, [0x0038, %r11]
	.word 0xc65aa010  ! 708: LDX_I	ldx	[%r10 + 0x0010], %r3
	.word 0xd302801f  ! 709: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba987f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb02801f  ! 711: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd01a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcdba999f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
TH_LABEL715:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc09ae058  ! 716: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r0
	.word 0xc5ba999f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 720: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce82911f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xc322801f  ! 722: STF_R	st	%f1, [%r31, %r10]
	.word 0xc2cad03f  ! 723: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r1
	.word 0xc41ac01f  ! 724: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xcfbad95f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL725:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd05a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba995f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc79ae040  ! 730: LDDFA_I	ldda	[%r11, 0x0040], %f3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc82a020  ! 731: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r6
	.word 0xc412a006  ! 732: LDUH_I	lduh	[%r10 + 0x0006], %r2
	.word 0xc302801f  ! 733: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcf02c01f  ! 734: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba981f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd24aa067  ! 739: LDSB_I	ldsb	[%r10 + 0x0067], %r9
	.word 0xc8daa008  ! 740: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc4d2d05f  ! 741: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r2
	.word 0xcbbaa018  ! 742: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xc3bad85f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd00aa07d  ! 744: LDUB_I	ldub	[%r10 + 0x007d], %r8
	.word 0xcd02a078  ! 745: LDF_I	ld	[%r10, 0x0078], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc6d2a004  ! 746: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r3
	.word 0xd042e018  ! 747: LDSW_I	ldsw	[%r11 + 0x0018], %r8
	.word 0xc5baa048  ! 748: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad85f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbaa030  ! 752: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xd3bad8bf  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad97f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xd19aa020  ! 759: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xce0aa07b  ! 760: LDUB_I	ldub	[%r10 + 0x007b], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc882a00c  ! 762: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r4
	.word 0xd3f2903f  ! 763: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba993f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba987f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc68aa078  ! 767: LDUBA_I	lduba	[%r10, + 0x0078] %asi, %r3
	.word 0xce92a05e  ! 768: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r7
	.word 0xd08ad01f  ! 769: LDUBA_R	lduba	[%r11, %r31] 0x80, %r8
	.word 0xca4aa042  ! 770: LDSB_I	ldsb	[%r10 + 0x0042], %r5
TH_LABEL770:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc722c01f  ! 771: STF_R	st	%f3, [%r31, %r11]
	.word 0xcdba989f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca02801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc2da917f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc302801f  ! 780: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d11f  ! 782: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad85f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4caa023  ! 786: LDSBA_I	ldsba	[%r10, + 0x0023] %asi, %r2
	.word 0xd2c2913f  ! 787: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r9
	.word 0xcbbad81f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41a801f  ! 789: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad91f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc65ae030  ! 794: LDX_I	ldx	[%r11 + 0x0030], %r3
	.word 0xc9e2d03f  ! 795: CASA_I	casa	[%r11] 0x81, %r31, %r4
TH_LABEL795:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bad93f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02a068  ! 799: LDF_I	ld	[%r10, 0x0068], %f5
	.word 0xc882905f  ! 800: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r4
TH_LABEL800:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc89aa060  ! 801: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xc79aa060  ! 802: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xcd9aa028  ! 803: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xcd22801f  ! 804: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba98bf  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa058  ! 808: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc28a903f  ! 809: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xcbe2d03f  ! 810: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad97f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd39aa050  ! 812: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad89f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652801f  ! 815: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2911f  ! 816: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xd042a038  ! 817: LDSW_I	ldsw	[%r10 + 0x0038], %r8
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc80aa025  ! 819: LDUB_I	ldub	[%r10 + 0x0025], %r4
	.word 0xd122801f  ! 820: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba991f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9ae070  ! 823: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r6
	.word 0xd042801f  ! 824: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc9bad81f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc892907f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x83, %r4
	.word 0xc81ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcd9aa018  ! 828: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xc702c01f  ! 829: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2d01f  ! 831: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 834: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
TH_LABEL835:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccca903f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r6
	.word 0xc8caa066  ! 837: LDSBA_I	ldsba	[%r10, + 0x0066] %asi, %r4
	.word 0xcfbad87f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb9ae078  ! 839: LDDFA_I	ldda	[%r11, 0x0078], %f5
	.word 0xcdba99bf  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc8c2a074  ! 843: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r4
	.word 0xd202801f  ! 844: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd322c01f  ! 846: STF_R	st	%f9, [%r31, %r11]
	.word 0xc7ba981f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 849: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc882911f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd212a01a  ! 851: LDUH_I	lduh	[%r10 + 0x001a], %r9
	.word 0xd1bad81f  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 853: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad91f  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 859: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad81f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL860:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd302c01f  ! 861: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc3ba999f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc02801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xccc2a00c  ! 868: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r6
	.word 0xc28ad01f  ! 869: LDUBA_R	lduba	[%r11, %r31] 0x80, %r1
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba999f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc0ae074  ! 872: LDUB_I	ldub	[%r11 + 0x0074], %r6
	.word 0xca42c01f  ! 873: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc7ba991f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba991f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 877: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2903f  ! 880: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba981f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502801f  ! 884: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad91f  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc39aa068  ! 889: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xc7bad8bf  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL890:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad87f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcb22c01f  ! 894: STF_R	st	%f5, [%r31, %r11]
	.word 0xc5bad83f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad87f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad83f  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd012801f  ! 900: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad87f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d13f  ! 904: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad93f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad85f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc65aa038  ! 908: LDX_I	ldx	[%r10 + 0x0038], %r3
	.word 0xcd22c01f  ! 909: STF_R	st	%f6, [%r31, %r11]
	.word 0xcf02e034  ! 910: LDF_I	ld	[%r11, 0x0034], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbaa060  ! 911: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcec2a06c  ! 913: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r7
	.word 0xc3ba995f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2903f  ! 916: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc8ad07f  ! 918: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba99bf  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf02801f  ! 921: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc612a076  ! 922: LDUH_I	lduh	[%r10 + 0x0076], %r3
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2903f  ! 925: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc812801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xd1ba987f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc602a068  ! 928: LDUW_I	lduw	[%r10 + 0x0068], %r3
	.word 0xd3bad83f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca92e03c  ! 931: LDUHA_I	lduha	[%r11, + 0x003c] %asi, %r5
	.word 0xce12a07c  ! 932: LDUH_I	lduh	[%r10 + 0x007c], %r7
	.word 0xd19ae010  ! 933: LDDFA_I	ldda	[%r11, 0x0010], %f8
	.word 0xcdba981f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd292917f  ! 936: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xc3e2d01f  ! 937: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc28aa07b  ! 938: LDUBA_I	lduba	[%r10, + 0x007b] %asi, %r1
	.word 0xc812a028  ! 939: LDUH_I	lduh	[%r10 + 0x0028], %r4
	.word 0xc202a018  ! 940: LDUW_I	lduw	[%r10 + 0x0018], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad99f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xc702a06c  ! 944: LDF_I	ld	[%r10, 0x006c], %f3
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad81f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcfbae030  ! 947: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xc6c2a034  ! 948: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r3
	.word 0xca8a901f  ! 949: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xc9ba991f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xd2d2a02a  ! 952: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r9
	.word 0xcd02801f  ! 953: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcfba981f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
TH_LABEL955:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2913f  ! 957: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xd2caa015  ! 958: LDSBA_I	ldsba	[%r10, + 0x0015] %asi, %r9
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xcb02a07c  ! 960: LDF_I	ld	[%r10, 0x007c], %f5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd22801f  ! 961: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1ba985f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc902c01f  ! 966: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc252a002  ! 967: LDSH_I	ldsh	[%r10 + 0x0002], %r1
	.word 0xcfba991f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xc652e030  ! 970: LDSH_I	ldsh	[%r11 + 0x0030], %r3
TH_LABEL970:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba999f  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba993f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc9aa008  ! 977: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d11f  ! 979: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad8bf  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad83f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc652c01f  ! 982: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc5baa050  ! 983: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xcb9aa078  ! 984: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xc3ba997f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 987: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba991f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd092905f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xd1ba981f  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba981f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xd122801f  ! 2: STF_R	st	%f8, [%r31, %r10]
	.word 0xcdba997f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL5:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba991f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa050  ! 7: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad95f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad87f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc242801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc2daa010  ! 14: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r1
	.word 0xc722801f  ! 15: STF_R	st	%f3, [%r31, %r10]
TH_LABEL15:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3bad9bf  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcfbaa040  ! 19: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xd122801f  ! 20: STF_R	st	%f8, [%r31, %r10]
TH_LABEL20:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd19ae038  ! 22: LDDFA_I	ldda	[%r11, 0x0038], %f8
	.word 0xca92905f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc89aa068  ! 26: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc4d2d01f  ! 28: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r2
	.word 0xcdbae058  ! 29: STDFA_I	stda	%f6, [0x0058, %r11]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba993f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba989f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 34: STF_R	st	%f9, [%r31, %r10]
	.word 0xcbbad89f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca42801f  ! 36: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcb02801f  ! 37: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xc902801f  ! 39: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd1ba987f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL40:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba997f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xce0ae052  ! 43: LDUB_I	ldub	[%r11 + 0x0052], %r7
	.word 0xcbba993f  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbaa040  ! 46: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcecad13f  ! 48: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r7
	.word 0xd3f2d01f  ! 49: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd39ae040  ! 50: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2d13f  ! 51: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad97f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d03f  ! 55: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2da905f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xcbe2d01f  ! 57: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad85f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc89ae008  ! 59: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r4
	.word 0xcfe2911f  ! 60: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba991f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902e024  ! 62: LDF_I	ld	[%r11, 0x0024], %f4
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba981f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd302801f  ! 65: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2913f  ! 66: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcec2901f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xc5ba981f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcac2915f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r5
	.word 0xce8a913f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba98bf  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb02a00c  ! 74: LDF_I	ld	[%r10, 0x000c], %f5
	.word 0xc492a040  ! 75: LDUHA_I	lduha	[%r10, + 0x0040] %asi, %r2
TH_LABEL75:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc9aa078  ! 76: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r6
	.word 0xcbbad89f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc282901f  ! 78: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r1
	.word 0xcfba989f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba991f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce5a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc01ac01f  ! 83: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xccc2a060  ! 84: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r6
	.word 0xc5bae010  ! 85: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad87f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc88a915f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r4
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2903f  ! 89: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba985f  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc842a020  ! 91: LDSW_I	ldsw	[%r10 + 0x0020], %r4
	.word 0xc3f2911f  ! 92: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba981f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2901f  ! 99: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc322c01f  ! 100: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad81f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc25aa048  ! 105: LDX_I	ldx	[%r10 + 0x0048], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2913f  ! 106: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba99bf  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca0a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc1a801f  ! 111: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3ba98bf  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd042e064  ! 114: LDSW_I	ldsw	[%r11 + 0x0064], %r8
	.word 0xc3baa060  ! 115: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6c2a060  ! 116: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r3
	.word 0xc652801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcc52c01f  ! 118: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xcb22801f  ! 119: STF_R	st	%f5, [%r31, %r10]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba995f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb22801f  ! 122: STF_R	st	%f5, [%r31, %r10]
	.word 0xca12c01f  ! 123: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc5ba987f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5baa018  ! 125: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcad2e046  ! 126: LDSHA_I	ldsha	[%r11, + 0x0046] %asi, %r5
	.word 0xcc82d03f  ! 127: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r6
	.word 0xc39aa018  ! 128: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xd3bad81f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8da911f  ! 131: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xcdf2913f  ! 132: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd04ae048  ! 134: LDSB_I	ldsb	[%r11 + 0x0048], %r8
	.word 0xc9e2901f  ! 135: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba987f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc502e078  ! 139: LDF_I	ld	[%r11, 0x0078], %f2
	.word 0xd01ae050  ! 140: LDD_I	ldd	[%r11 + 0x0050], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2911f  ! 141: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd302e028  ! 142: LDF_I	ld	[%r11, 0x0028], %f9
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xd39ae068  ! 144: LDDFA_I	ldda	[%r11, 0x0068], %f9
	.word 0xcb02a028  ! 145: LDF_I	ld	[%r10, 0x0028], %f5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 148: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc5baa078  ! 150: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc502c01f  ! 151: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd19ae020  ! 152: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad8bf  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0cad05f  ! 155: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02801f  ! 156: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba99bf  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbaa040  ! 161: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xcfe2911f  ! 162: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc1a801f  ! 166: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc7baa050  ! 167: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xc302a070  ! 168: LDF_I	ld	[%r10, 0x0070], %f1
	.word 0xcdf2903f  ! 169: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc502a060  ! 170: LDF_I	ld	[%r10, 0x0060], %f2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bad97f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcb02a05c  ! 174: LDF_I	ld	[%r10, 0x005c], %f5
	.word 0xca12e024  ! 175: LDUH_I	lduh	[%r11 + 0x0024], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3baa060  ! 176: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd282a028  ! 178: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r9
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcb02e044  ! 180: LDF_I	ld	[%r11, 0x0044], %f5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad91f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad99f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL185:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfbaa038  ! 187: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xd042c01f  ! 188: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba997f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2901f  ! 193: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc2c2903f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r1
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc302801f  ! 196: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad95f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 199: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2d11f  ! 201: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xd202a050  ! 202: LDUW_I	lduw	[%r10 + 0x0050], %r9
	.word 0xc5ba98bf  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 204: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc602801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2911f  ! 206: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc302a024  ! 207: LDF_I	ld	[%r10, 0x0024], %f1
	.word 0xc652801f  ! 208: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcfbad91f  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd24a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba987f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02c01f  ! 216: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd1e2903f  ! 217: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba983f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd04a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xce5ae018  ! 220: LDX_I	ldx	[%r11 + 0x0018], %r7
TH_LABEL220:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bae040  ! 221: STDFA_I	stda	%f8, [0x0040, %r11]
	.word 0xce02a040  ! 222: LDUW_I	lduw	[%r10 + 0x0040], %r7
	.word 0xc702a02c  ! 223: LDF_I	ld	[%r10, 0x002c], %f3
	.word 0xcbba995f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd00a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc6dad17f  ! 227: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r3
	.word 0xd102801f  ! 228: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc502c01f  ! 230: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba983f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2903f  ! 232: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xd0d2a022  ! 233: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r8
	.word 0xc492e05e  ! 234: LDUHA_I	lduha	[%r11, + 0x005e] %asi, %r2
	.word 0xc7bae010  ! 235: STDFA_I	stda	%f3, [0x0010, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3baa048  ! 236: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xcc9ae018  ! 237: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r6
	.word 0xc502801f  ! 238: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd09ae050  ! 239: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r8
	.word 0xd3ba999f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2903f  ! 241: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd09aa070  ! 242: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r8
	.word 0xc5ba983f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 244: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc892e060  ! 245: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba991f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88a911f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xc7bae018  ! 248: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad81f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad97f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d11f  ! 253: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad81f  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc0a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba99bf  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc802a028  ! 264: LDUW_I	lduw	[%r10 + 0x0028], %r4
	.word 0xc5e2d11f  ! 265: CASA_I	casa	[%r11] 0x88, %r31, %r2
TH_LABEL265:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad95f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad99f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd19aa040  ! 271: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xcdbaa000  ! 273: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xc84ac01f  ! 274: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xd1bad83f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf22c01f  ! 276: STF_R	st	%f7, [%r31, %r11]
	.word 0xc482d01f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r2
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcb9ae028  ! 279: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba985f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc612a05a  ! 284: LDUH_I	lduh	[%r10 + 0x005a], %r3
	.word 0xcdba993f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcac2a060  ! 288: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r5
	.word 0xcb9aa058  ! 289: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad8bf  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad97f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 297: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad99f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 299: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xcf02c01f  ! 300: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb02e004  ! 301: LDF_I	ld	[%r11, 0x0004], %f5
	.word 0xd0c2d01f  ! 302: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xcc82d13f  ! 303: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r6
	.word 0xc2dad11f  ! 304: LDXA_R	ldxa	[%r11, %r31] 0x88, %r1
	.word 0xcfbae058  ! 305: STDFA_I	stda	%f7, [0x0058, %r11]
TH_LABEL305:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba98bf  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc302a034  ! 307: LDF_I	ld	[%r10, 0x0034], %f1
	.word 0xd1bae078  ! 308: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xc9ba983f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7bae028  ! 310: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba983f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc60ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd1f2d11f  ! 314: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad83f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce12a024  ! 316: LDUH_I	lduh	[%r10 + 0x0024], %r7
	.word 0xcb02a040  ! 317: LDF_I	ld	[%r10, 0x0040], %f5
	.word 0xc502801f  ! 318: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc852a060  ! 320: LDSH_I	ldsh	[%r10 + 0x0060], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad8bf  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad8bf  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc40a801f  ! 324: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcfba991f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba987f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9ae070  ! 327: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xd1bad99f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc64ae020  ! 329: LDSB_I	ldsb	[%r11 + 0x0020], %r3
	.word 0xd122c01f  ! 330: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2903f  ! 332: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc41a801f  ! 333: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9ba999f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd252801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd302801f  ! 336: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcc12801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3e2d13f  ! 338: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xcfbaa060  ! 339: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xd1bad85f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad85f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 342: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd0ca917f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xc3ba985f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba989f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca12a062  ! 347: LDUH_I	lduh	[%r10 + 0x0062], %r5
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa030  ! 349: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc5ba985f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba987f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc522801f  ! 353: STF_R	st	%f2, [%r31, %r10]
	.word 0xd1bad81f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad9bf  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad89f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc882917f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r4
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc6c2e038  ! 364: LDSWA_I	ldswa	[%r11, + 0x0038] %asi, %r3
	.word 0xc882905f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad83f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 369: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad91f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc612a004  ! 371: LDUH_I	lduh	[%r10 + 0x0004], %r3
	.word 0xcfe2901f  ! 372: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2911f  ! 373: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2913f  ! 374: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcd02e068  ! 375: LDF_I	ld	[%r11, 0x0068], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd302a064  ! 376: LDF_I	ld	[%r10, 0x0064], %f9
	.word 0xcbf2913f  ! 377: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xca02801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd20ae034  ! 379: LDUB_I	ldub	[%r11 + 0x0034], %r9
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd102c01f  ! 381: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc9e2903f  ! 382: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcc12801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7ba993f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce5aa038  ! 385: LDX_I	ldx	[%r10 + 0x0038], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2d11f  ! 386: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xcf02a05c  ! 387: LDF_I	ld	[%r10, 0x005c], %f7
	.word 0xc5ba989f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd22c01f  ! 389: STF_R	st	%f6, [%r31, %r11]
	.word 0xc442a010  ! 390: LDSW_I	ldsw	[%r10 + 0x0010], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba985f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 392: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc49ae028  ! 393: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r2
	.word 0xc9bad85f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc802a060  ! 395: LDUW_I	lduw	[%r10 + 0x0060], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc44a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc5ba995f  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc40aa024  ! 399: LDUB_I	ldub	[%r10 + 0x0024], %r2
	.word 0xc3f2d13f  ! 400: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6caa048  ! 401: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r3
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba98bf  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca8a917f  ! 406: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r5
	.word 0xc9bad91f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca92d03f  ! 409: LDUHA_R	lduha	[%r11, %r31] 0x81, %r5
	.word 0xcfbaa040  ! 410: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5e2901f  ! 411: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 413: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba997f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5f2903f  ! 416: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xcc0ac01f  ! 417: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc9bad8bf  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd0c2907f  ! 419: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r8
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad83f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcad2d17f  ! 422: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r5
	.word 0xc3ba983f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 425: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc242801f  ! 426: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc8d2903f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r4
	.word 0xcdf2903f  ! 428: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdba98bf  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba999f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 435: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc652801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc41ae038  ! 438: LDD_I	ldd	[%r11 + 0x0038], %r2
	.word 0xcecaa048  ! 439: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r7
	.word 0xcdba98bf  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc82e070  ! 441: LDUWA_I	lduwa	[%r11, + 0x0070] %asi, %r6
	.word 0xc8c2905f  ! 442: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xc7bad83f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca4a801f  ! 445: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf02801f  ! 446: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcdba981f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2903f  ! 449: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcdba99bf  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL450:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc282d07f  ! 452: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r1
	.word 0xd3ba98bf  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce02a06c  ! 455: LDUW_I	lduw	[%r10 + 0x006c], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcdbaa028  ! 457: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xc25aa040  ! 458: LDX_I	ldx	[%r10 + 0x0040], %r1
	.word 0xd1ba991f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc48aa011  ! 460: LDUBA_I	lduba	[%r10, + 0x0011] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02801f  ! 461: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcbba989f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902a004  ! 463: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xcf22801f  ! 464: STF_R	st	%f7, [%r31, %r10]
	.word 0xd39aa020  ! 465: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bae060  ! 466: STDFA_I	stda	%f9, [0x0060, %r11]
	.word 0xcbba999f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc02a05c  ! 468: LDUW_I	lduw	[%r10 + 0x005c], %r6
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba98bf  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc84ae001  ! 472: LDSB_I	ldsb	[%r11 + 0x0001], %r4
	.word 0xcc92d17f  ! 473: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r6
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d03f  ! 475: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2d11f  ! 476: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcccae059  ! 478: LDSBA_I	ldsba	[%r11, + 0x0059] %asi, %r6
	.word 0xc8dae018  ! 479: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r4
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2cad03f  ! 481: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r1
	.word 0xcad2903f  ! 482: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xcfbad9bf  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc84aa055  ! 486: LDSB_I	ldsb	[%r10 + 0x0055], %r4
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc282e000  ! 488: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r1
	.word 0xd20aa004  ! 489: LDUB_I	ldub	[%r10 + 0x0004], %r9
	.word 0xc99aa068  ! 490: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba981f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd01ae040  ! 493: LDD_I	ldd	[%r11 + 0x0040], %r8
	.word 0xc6ca905f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r3
	.word 0xc39aa010  ! 495: LDDFA_I	ldda	[%r10, 0x0010], %f1
TH_LABEL495:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa070  ! 496: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xcbbad95f  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 498: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc9baa008  ! 500: STDFA_I	stda	%f4, [0x0008, %r10]
TH_LABEL500:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2911f  ! 501: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba99bf  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcedaa000  ! 507: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r7
	.word 0xce92d03f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x81, %r7
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad9bf  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad9bf  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcbbae050  ! 512: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xc3f2911f  ! 513: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba987f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa040  ! 515: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad9bf  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd09aa078  ! 518: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xcdbaa078  ! 519: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xd212c01f  ! 520: LDUH_R	lduh	[%r11 + %r31], %r9
TH_LABEL520:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd0c2d07f  ! 521: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r8
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcd9ae010  ! 523: LDDFA_I	ldda	[%r11, 0x0010], %f6
	.word 0xc892d11f  ! 524: LDUHA_R	lduha	[%r11, %r31] 0x88, %r4
	.word 0xcbba985f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL525:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2d2a060  ! 526: LDSHA_I	ldsha	[%r10, + 0x0060] %asi, %r1
	.word 0xcdba99bf  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 528: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xca4ae007  ! 529: LDSB_I	ldsb	[%r11 + 0x0007], %r5
	.word 0xd3bad95f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2d03f  ! 531: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xc45a801f  ! 533: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcedae038  ! 534: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r7
	.word 0xcfba995f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba995f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 539: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba997f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd28ae070  ! 541: LDUBA_I	lduba	[%r11, + 0x0070] %asi, %r9
	.word 0xc41aa040  ! 542: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc852801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xce5a801f  ! 547: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc5bad83f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc01aa020  ! 550: LDD_I	ldd	[%r10 + 0x0020], %r0
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd122c01f  ! 551: STF_R	st	%f8, [%r31, %r11]
	.word 0xd3bad93f  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6dad13f  ! 553: LDXA_R	ldxa	[%r11, %r31] 0x89, %r3
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2901f  ! 556: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc44a801f  ! 557: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc2caa059  ! 558: LDSBA_I	ldsba	[%r10, + 0x0059] %asi, %r1
	.word 0xd1ba981f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd052a07a  ! 560: LDSH_I	ldsh	[%r10 + 0x007a], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba985f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba983f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc80a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r4
TH_LABEL565:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302801f  ! 566: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba983f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd05ae068  ! 571: LDX_I	ldx	[%r11 + 0x0068], %r8
	.word 0xc3ba981f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd002c01f  ! 574: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc7ba99bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd24ae010  ! 576: LDSB_I	ldsb	[%r11 + 0x0010], %r9
	.word 0xd04a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd39aa050  ! 578: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xc3bad89f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL580:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xca0ae04b  ! 583: LDUB_I	ldub	[%r11 + 0x004b], %r5
	.word 0xd092a070  ! 584: LDUHA_I	lduha	[%r10, + 0x0070] %asi, %r8
	.word 0xcff2901f  ! 585: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc79ae070  ! 586: LDDFA_I	ldda	[%r11, 0x0070], %f3
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xca8a913f  ! 589: LDUBA_R	lduba	[%r10, %r31] 0x89, %r5
	.word 0xcbe2d01f  ! 590: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad97f  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc80ac01f  ! 592: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xcbbaa018  ! 593: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xd39ae040  ! 594: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd292901f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x80, %r9
	.word 0xcc12801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc9f2913f  ! 599: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba981f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL600:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba981f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 602: STF_R	st	%f7, [%r31, %r10]
	.word 0xc79aa040  ! 603: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xc59aa070  ! 604: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xc7bad83f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc442a018  ! 606: LDSW_I	ldsw	[%r10 + 0x0018], %r2
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad99f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca92907f  ! 611: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xc502801f  ! 612: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcc42801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcfba993f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82a00c  ! 615: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc41a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba989f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc212a036  ! 620: LDUH_I	lduh	[%r10 + 0x0036], %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc81a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd25aa038  ! 622: LDX_I	ldx	[%r10 + 0x0038], %r9
	.word 0xcf02a028  ! 623: LDF_I	ld	[%r10, 0x0028], %f7
	.word 0xcdba995f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa068  ! 625: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbaa030  ! 626: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xce92913f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x89, %r7
	.word 0xc892e022  ! 628: LDUHA_I	lduha	[%r11, + 0x0022] %asi, %r4
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc852e00a  ! 630: LDSH_I	ldsh	[%r11 + 0x000a], %r4
TH_LABEL630:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba995f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2901f  ! 633: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2901f  ! 634: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba991f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba999f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc01aa000  ! 637: LDD_I	ldd	[%r10 + 0x0000], %r0
	.word 0xc9bad83f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6d2a040  ! 639: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r3
	.word 0xcdba985f  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba981f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2caa00c  ! 642: LDSBA_I	ldsba	[%r10, + 0x000c] %asi, %r9
	.word 0xd3ba995f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba991f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 649: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xc9baa058  ! 650: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3baa000  ! 651: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcb9aa060  ! 653: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xc68aa058  ! 654: LDUBA_I	lduba	[%r10, + 0x0058] %asi, %r3
	.word 0xcbbaa020  ! 655: STDFA_I	stda	%f5, [0x0020, %r10]
TH_LABEL655:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd102c01f  ! 656: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd3f2911f  ! 657: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba989f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcfbaa048  ! 662: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xc482a054  ! 663: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r2
	.word 0xc89aa060  ! 664: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcd9aa060  ! 667: LDDFA_I	ldda	[%r10, 0x0060], %f6
	.word 0xcbf2901f  ! 668: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcad2e07c  ! 671: LDSHA_I	ldsha	[%r11, + 0x007c] %asi, %r5
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad85f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d11f  ! 675: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc412c01f  ! 676: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc20aa06c  ! 677: LDUB_I	ldub	[%r10 + 0x006c], %r1
	.word 0xc3ba985f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL680:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc4c2a050  ! 681: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r2
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc3baa028  ! 683: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xcbba999f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc522801f  ! 685: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce12a078  ! 686: LDUH_I	lduh	[%r10 + 0x0078], %r7
	.word 0xc502a07c  ! 687: LDF_I	ld	[%r10, 0x007c], %f2
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba981f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 692: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xc81a801f  ! 693: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba98bf  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc9aa000  ! 696: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r6
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd05ae068  ! 698: LDX_I	ldx	[%r11 + 0x0068], %r8
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad97f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc302e070  ! 702: LDF_I	ld	[%r11, 0x0070], %f1
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xca52e030  ! 704: LDSH_I	ldsh	[%r11 + 0x0030], %r5
	.word 0xd1baa030  ! 705: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bad8bf  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3baa048  ! 707: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xd25aa058  ! 708: LDX_I	ldx	[%r10 + 0x0058], %r9
	.word 0xc702801f  ! 709: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfba997f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL710:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf02801f  ! 711: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcc1a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcdba983f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd09ae060  ! 716: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r8
	.word 0xc5ba983f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2913f  ! 720: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce82911f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xcd22c01f  ! 722: STF_R	st	%f6, [%r31, %r11]
	.word 0xc2ca905f  ! 723: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xd01a801f  ! 724: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfbad91f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd25ac01f  ! 726: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba999f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd39aa048  ! 730: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd282a008  ! 731: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r9
	.word 0xc812a036  ! 732: LDUH_I	lduh	[%r10 + 0x0036], %r4
	.word 0xd102c01f  ! 733: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc302801f  ! 734: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba997f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc4aa033  ! 739: LDSB_I	ldsb	[%r10 + 0x0033], %r6
	.word 0xd0dae068  ! 740: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xced2903f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xd3baa040  ! 742: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xc3bad89f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca0ae06c  ! 744: LDUB_I	ldub	[%r11 + 0x006c], %r5
	.word 0xcb02a054  ! 745: LDF_I	ld	[%r10, 0x0054], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccd2a022  ! 746: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r6
	.word 0xc842a038  ! 747: LDSW_I	ldsw	[%r10 + 0x0038], %r4
	.word 0xcbbae030  ! 748: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad99f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd1baa028  ! 752: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xd3bad83f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bad93f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcb9ae018  ! 759: LDDFA_I	ldda	[%r11, 0x0018], %f5
	.word 0xcc0ae028  ! 760: LDUB_I	ldub	[%r11 + 0x0028], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc282e004  ! 762: LDUWA_I	lduwa	[%r11, + 0x0004] %asi, %r1
	.word 0xd3f2913f  ! 763: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba981f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba99bf  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc8aa020  ! 767: LDUBA_I	lduba	[%r10, + 0x0020] %asi, %r6
	.word 0xca92e018  ! 768: LDUHA_I	lduha	[%r11, + 0x0018] %asi, %r5
	.word 0xc28a915f  ! 769: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r1
	.word 0xce4aa043  ! 770: LDSB_I	ldsb	[%r10 + 0x0043], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd322801f  ! 771: STF_R	st	%f9, [%r31, %r10]
	.word 0xcdba981f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd202801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc6da903f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2903f  ! 778: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcf02c01f  ! 780: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d01f  ! 782: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad97f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL785:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0caa001  ! 786: LDSBA_I	ldsba	[%r10, + 0x0001] %asi, %r8
	.word 0xc2c2d15f  ! 787: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r1
	.word 0xcbbad89f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc01ac01f  ! 789: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad81f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd05aa050  ! 794: LDX_I	ldx	[%r10 + 0x0050], %r8
	.word 0xc9e2d03f  ! 795: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad95f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02e058  ! 799: LDF_I	ld	[%r11, 0x0058], %f5
	.word 0xc882911f  ! 800: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc9aa040  ! 801: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r6
	.word 0xc59ae068  ! 802: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xc79aa050  ! 803: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xcb22801f  ! 804: STF_R	st	%f5, [%r31, %r10]
	.word 0xcdba991f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba991f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa000  ! 808: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xc48a901f  ! 809: LDUBA_R	lduba	[%r10, %r31] 0x80, %r2
	.word 0xcbe2d13f  ! 810: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad89f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc99ae050  ! 812: LDDFA_I	ldda	[%r11, 0x0050], %f4
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad81f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd052801f  ! 815: LDSH_R	ldsh	[%r10 + %r31], %r8
TH_LABEL815:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2901f  ! 816: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xca42a070  ! 817: LDSW_I	ldsw	[%r10 + 0x0070], %r5
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd20ae053  ! 819: LDUB_I	ldub	[%r11 + 0x0053], %r9
	.word 0xcb22801f  ! 820: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba981f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc49ae018  ! 823: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r2
	.word 0xcc42801f  ! 824: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9bad85f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc292911f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x88, %r1
	.word 0xc41ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xd19aa050  ! 828: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xc502c01f  ! 829: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2d13f  ! 831: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad89f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 834: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4cad11f  ! 836: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r2
	.word 0xd0cae03d  ! 837: LDSBA_I	ldsba	[%r11, + 0x003d] %asi, %r8
	.word 0xcfbad93f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf9aa010  ! 839: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xcdba997f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL840:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc6c2a038  ! 843: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r3
	.word 0xce02c01f  ! 844: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd322c01f  ! 846: STF_R	st	%f9, [%r31, %r11]
	.word 0xc7ba989f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 849: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xd082915f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd212a038  ! 851: LDUH_I	lduh	[%r10 + 0x0038], %r9
	.word 0xd1bad81f  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 853: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad81f  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 859: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad81f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02801f  ! 861: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc3ba989f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL865:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd202801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc3e2913f  ! 867: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xccc2e018  ! 868: LDSWA_I	ldswa	[%r11, + 0x0018] %asi, %r6
	.word 0xd08a915f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba983f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca0aa007  ! 872: LDUB_I	ldub	[%r10 + 0x0007], %r5
	.word 0xc242c01f  ! 873: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc7ba983f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba997f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 877: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba999f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2913f  ! 880: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba981f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd102801f  ! 884: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad85f  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcf9ae028  ! 889: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xc7bad81f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bad81f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcf22801f  ! 894: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5bad9bf  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bad85f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad8bf  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca12c01f  ! 900: LDUH_R	lduh	[%r11 + %r31], %r5
TH_LABEL900:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad87f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d01f  ! 904: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad89f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad8bf  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc85aa058  ! 908: LDX_I	ldx	[%r10 + 0x0058], %r4
	.word 0xc922c01f  ! 909: STF_R	st	%f4, [%r31, %r11]
	.word 0xcd02a068  ! 910: LDF_I	ld	[%r10, 0x0068], %f6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbae038  ! 911: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc8c2a01c  ! 913: LDSWA_I	ldswa	[%r10, + 0x001c] %asi, %r4
	.word 0xc3ba983f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL915:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2901f  ! 916: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xca8a907f  ! 918: LDUBA_R	lduba	[%r10, %r31] 0x83, %r5
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba991f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc302801f  ! 921: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcc12e04a  ! 922: LDUH_I	lduh	[%r11 + 0x004a], %r6
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 925: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
TH_LABEL925:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc212c01f  ! 926: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xd1ba995f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc802a014  ! 928: LDUW_I	lduw	[%r10 + 0x0014], %r4
	.word 0xd3bad8bf  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL930:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc692a006  ! 931: LDUHA_I	lduha	[%r10, + 0x0006] %asi, %r3
	.word 0xc412e00a  ! 932: LDUH_I	lduh	[%r11 + 0x000a], %r2
	.word 0xd19aa018  ! 933: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcdba991f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd092901f  ! 936: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc3e2d13f  ! 937: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xd28aa010  ! 938: LDUBA_I	lduba	[%r10, + 0x0010] %asi, %r9
	.word 0xc412a040  ! 939: LDUH_I	lduh	[%r10 + 0x0040], %r2
	.word 0xd002a070  ! 940: LDUW_I	lduw	[%r10 + 0x0070], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad87f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xd302a024  ! 944: LDF_I	ld	[%r10, 0x0024], %f9
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad85f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc3baa060  ! 947: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xc2c2a024  ! 948: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r1
	.word 0xc48ad17f  ! 949: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r2
	.word 0xc9ba993f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc2d2a052  ! 952: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r1
	.word 0xc702801f  ! 953: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfba983f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2901f  ! 957: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcacaa014  ! 958: LDSBA_I	ldsba	[%r10, + 0x0014] %asi, %r5
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc702e078  ! 960: LDF_I	ld	[%r11, 0x0078], %f3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd22c01f  ! 961: STF_R	st	%f6, [%r31, %r11]
	.word 0xd1ba99bf  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902c01f  ! 966: LDF_R	ld	[%r11, %r31], %f4
	.word 0xca52a028  ! 967: LDSH_I	ldsh	[%r10 + 0x0028], %r5
	.word 0xcfba995f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xc252a018  ! 970: LDSH_I	ldsh	[%r10 + 0x0018], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba99bf  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba995f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc09ae068  ! 977: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r0
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d11f  ! 979: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad81f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL980:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad97f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce52801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd3baa078  ! 983: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xcb9ae030  ! 984: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc3ba98bf  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2903f  ! 987: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba993f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc92911f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xd1ba98bf  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL990:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba995f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xd122801f  ! 2: STF_R	st	%f8, [%r31, %r10]
	.word 0xcdba989f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba981f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbae008  ! 7: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad85f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad83f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd242801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd2daa040  ! 14: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r9
	.word 0xc522801f  ! 15: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3bad83f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcdbae060  ! 19: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xc322801f  ! 20: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc79aa050  ! 22: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xce92d11f  ! 23: LDUHA_R	lduha	[%r11, %r31] 0x88, %r7
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL25:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc89ae030  ! 26: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xccd2903f  ! 28: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc5baa018  ! 29: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba98bf  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba991f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122c01f  ! 34: STF_R	st	%f8, [%r31, %r11]
	.word 0xcbbad85f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xca42c01f  ! 36: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc702801f  ! 37: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xc702801f  ! 39: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba989f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba981f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd00ae017  ! 43: LDUB_I	ldub	[%r11 + 0x0017], %r8
	.word 0xcbba997f  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbae008  ! 46: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd0cad01f  ! 48: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r8
	.word 0xd3f2d13f  ! 49: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xc79aa050  ! 50: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7f2d13f  ! 51: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad9bf  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 55: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6dad05f  ! 56: LDXA_R	ldxa	[%r11, %r31] 0x82, %r3
	.word 0xcbe2d13f  ! 57: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad85f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc9aa030  ! 59: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r6
	.word 0xcfe2901f  ! 60: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba999f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702a00c  ! 62: LDF_I	ld	[%r10, 0x000c], %f3
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba981f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc702c01f  ! 65: LDF_R	ld	[%r11, %r31], %f3
TH_LABEL65:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2903f  ! 66: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd2c2905f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r9
	.word 0xc5ba99bf  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0c2903f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xc28a903f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba997f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb02a024  ! 74: LDF_I	ld	[%r10, 0x0024], %f5
	.word 0xc892a074  ! 75: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc9aa028  ! 76: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r6
	.word 0xcbbad91f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc482d11f  ! 78: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r2
	.word 0xcfba993f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba993f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd25a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc81a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd2c2a018  ! 84: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r9
	.word 0xcdbae010  ! 85: STDFA_I	stda	%f6, [0x0010, %r11]
TH_LABEL85:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad95f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd08a913f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2901f  ! 89: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba99bf  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd242a034  ! 91: LDSW_I	ldsw	[%r10 + 0x0034], %r9
	.word 0xc3f2911f  ! 92: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL95:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba987f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2913f  ! 99: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcb22801f  ! 100: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad99f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca5aa040  ! 105: LDX_I	ldx	[%r10 + 0x0040], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2913f  ! 106: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba999f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd20a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc41a801f  ! 111: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3ba989f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc442a070  ! 114: LDSW_I	ldsw	[%r10 + 0x0070], %r2
	.word 0xd3bae068  ! 115: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcac2e068  ! 116: LDSWA_I	ldswa	[%r11, + 0x0068] %asi, %r5
	.word 0xc652801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcc52c01f  ! 118: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xd122c01f  ! 119: STF_R	st	%f8, [%r31, %r11]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL120:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba999f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc722c01f  ! 122: STF_R	st	%f3, [%r31, %r11]
	.word 0xc612c01f  ! 123: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc5ba987f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5baa060  ! 125: STDFA_I	stda	%f2, [0x0060, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccd2e052  ! 126: LDSHA_I	ldsha	[%r11, + 0x0052] %asi, %r6
	.word 0xca82907f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xcd9ae020  ! 128: LDDFA_I	ldda	[%r11, 0x0020], %f6
	.word 0xd3bad9bf  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
TH_LABEL130:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2dad17f  ! 131: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r1
	.word 0xcdf2911f  ! 132: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc4aa068  ! 134: LDSB_I	ldsb	[%r10 + 0x0068], %r6
	.word 0xc9e2913f  ! 135: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba995f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcd02e00c  ! 139: LDF_I	ld	[%r11, 0x000c], %f6
	.word 0xcc1ae018  ! 140: LDD_I	ldd	[%r11 + 0x0018], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2901f  ! 141: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcf02a03c  ! 142: LDF_I	ld	[%r10, 0x003c], %f7
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xc79aa040  ! 144: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xd302a01c  ! 145: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba99bf  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 148: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcbbaa040  ! 150: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc902c01f  ! 151: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd19aa020  ! 152: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0ca915f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302c01f  ! 156: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcfba981f  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba999f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bae020  ! 161: STDFA_I	stda	%f4, [0x0020, %r11]
	.word 0xcfe2901f  ! 162: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba98bf  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc1a801f  ! 166: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc7bae050  ! 167: STDFA_I	stda	%f3, [0x0050, %r11]
	.word 0xcd02a03c  ! 168: LDF_I	ld	[%r10, 0x003c], %f6
	.word 0xcdf2911f  ! 169: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd302a058  ! 170: LDF_I	ld	[%r10, 0x0058], %f9
TH_LABEL170:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bad81f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc702e07c  ! 174: LDF_I	ld	[%r11, 0x007c], %f3
	.word 0xd212a022  ! 175: LDUH_I	lduh	[%r10 + 0x0022], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbaa030  ! 176: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc282e048  ! 178: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r1
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc302e004  ! 180: LDF_I	ld	[%r11, 0x0004], %f1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad83f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad89f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc5bae078  ! 187: STDFA_I	stda	%f2, [0x0078, %r11]
	.word 0xd242801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba997f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2903f  ! 193: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc2c2905f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL195:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02c01f  ! 196: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad87f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 199: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbe2d03f  ! 201: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xce02e068  ! 202: LDUW_I	lduw	[%r11 + 0x0068], %r7
	.word 0xc5ba99bf  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 204: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xd202c01f  ! 205: LDUW_R	lduw	[%r11 + %r31], %r9
TH_LABEL205:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2903f  ! 206: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xd102a028  ! 207: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xc852801f  ! 208: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcfbad81f  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc4ac01f  ! 211: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302c01f  ! 216: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd1e2903f  ! 217: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba993f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd24ac01f  ! 219: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xd05aa010  ! 220: LDX_I	ldx	[%r10 + 0x0010], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3baa018  ! 221: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xc202a00c  ! 222: LDUW_I	lduw	[%r10 + 0x000c], %r1
	.word 0xd102e050  ! 223: LDF_I	ld	[%r11, 0x0050], %f8
	.word 0xcbba989f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80ac01f  ! 225: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd2da907f  ! 227: LDXA_R	ldxa	[%r10, %r31] 0x83, %r9
	.word 0xcd02801f  ! 228: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcb02801f  ! 230: LDF_R	ld	[%r10, %r31], %f5
TH_LABEL230:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba999f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2913f  ! 232: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xd2d2a012  ! 233: LDSHA_I	ldsha	[%r10, + 0x0012] %asi, %r9
	.word 0xd292a06a  ! 234: LDUHA_I	lduha	[%r10, + 0x006a] %asi, %r9
	.word 0xc3bae018  ! 235: STDFA_I	stda	%f1, [0x0018, %r11]
TH_LABEL235:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bae050  ! 236: STDFA_I	stda	%f8, [0x0050, %r11]
	.word 0xc09aa008  ! 237: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r0
	.word 0xd102801f  ! 238: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcc9aa018  ! 239: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xd3ba985f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2901f  ! 241: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc89aa068  ! 242: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xc5ba995f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 244: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc292e05a  ! 245: LDUHA_I	lduha	[%r11, + 0x005a] %asi, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba981f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88a901f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc9baa000  ! 248: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad8bf  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bad91f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d13f  ! 253: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad8bf  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc40ac01f  ! 260: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba981f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc202a068  ! 264: LDUW_I	lduw	[%r10 + 0x0068], %r1
	.word 0xc5e2d01f  ! 265: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad81f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d11f  ! 269: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad95f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9ae018  ! 271: LDDFA_I	ldda	[%r11, 0x0018], %f5
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc3baa070  ! 273: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xc44a801f  ! 274: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd1bad85f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc522801f  ! 276: STF_R	st	%f2, [%r31, %r10]
	.word 0xc482d05f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r2
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc99aa048  ! 279: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2911f  ! 282: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba993f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc612e062  ! 284: LDUH_I	lduh	[%r11 + 0x0062], %r3
	.word 0xcdba993f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL285:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd2c2a010  ! 288: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r9
	.word 0xd19aa048  ! 289: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad81f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad81f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 297: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad85f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 299: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xcb02c01f  ! 300: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502a038  ! 301: LDF_I	ld	[%r10, 0x0038], %f2
	.word 0xc2c2d13f  ! 302: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xce82917f  ! 303: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r7
	.word 0xd2dad03f  ! 304: LDXA_R	ldxa	[%r11, %r31] 0x81, %r9
	.word 0xc7baa028  ! 305: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba995f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502a000  ! 307: LDF_I	ld	[%r10, 0x0000], %f2
	.word 0xc7baa078  ! 308: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc9ba995f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9bae078  ! 310: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba993f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc20ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd1f2d11f  ! 314: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad85f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce12a002  ! 316: LDUH_I	lduh	[%r10 + 0x0002], %r7
	.word 0xc302a000  ! 317: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xd102801f  ! 318: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc452e04c  ! 320: LDSH_I	ldsh	[%r11 + 0x004c], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bad99f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad83f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0ac01f  ! 324: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xcfba98bf  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba99bf  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd19ae020  ! 327: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xd1bad97f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc4ae001  ! 329: LDSB_I	ldsb	[%r11 + 0x0001], %r6
	.word 0xcd22c01f  ! 330: STF_R	st	%f6, [%r31, %r11]
TH_LABEL330:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2903f  ! 331: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2913f  ! 332: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc81ac01f  ! 333: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc9ba997f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd052801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf02c01f  ! 336: LDF_R	ld	[%r11, %r31], %f7
	.word 0xd212801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd3e2d03f  ! 338: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xc7bae060  ! 339: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xd1bad97f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad81f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 342: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc4ca907f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xc3ba995f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba989f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc612a01c  ! 347: LDUH_I	lduh	[%r10 + 0x001c], %r3
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9bae050  ! 349: STDFA_I	stda	%f4, [0x0050, %r11]
	.word 0xc5ba995f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba981f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc322801f  ! 353: STF_R	st	%f1, [%r31, %r10]
	.word 0xd1bad97f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bad81f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad8bf  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd082901f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r8
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd2c2e024  ! 364: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r9
	.word 0xcc82901f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad85f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d11f  ! 369: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad9bf  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc612a04c  ! 371: LDUH_I	lduh	[%r10 + 0x004c], %r3
	.word 0xcfe2901f  ! 372: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2911f  ! 373: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2911f  ! 374: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcb02a040  ! 375: LDF_I	ld	[%r10, 0x0040], %f5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb02e06c  ! 376: LDF_I	ld	[%r11, 0x006c], %f5
	.word 0xcbf2901f  ! 377: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xca02801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc60aa03d  ! 379: LDUB_I	ldub	[%r10 + 0x003d], %r3
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102801f  ! 381: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc9e2913f  ! 382: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc612801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba989f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc45aa068  ! 385: LDX_I	ldx	[%r10 + 0x0068], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d13f  ! 386: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xcd02a028  ! 387: LDF_I	ld	[%r10, 0x0028], %f6
	.word 0xc5ba99bf  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc522801f  ! 389: STF_R	st	%f2, [%r31, %r10]
	.word 0xc842a038  ! 390: LDSW_I	ldsw	[%r10 + 0x0038], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba98bf  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 392: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcc9aa058  ! 393: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r6
	.word 0xc9bad89f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc802a07c  ! 395: LDUW_I	lduw	[%r10 + 0x007c], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xce4ac01f  ! 397: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc5ba983f  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc0ae010  ! 399: LDUB_I	ldub	[%r11 + 0x0010], %r6
	.word 0xc3f2d01f  ! 400: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6caa043  ! 401: LDSBA_I	ldsba	[%r10, + 0x0043] %asi, %r3
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc88ad15f  ! 406: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r4
	.word 0xc9bad91f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd292907f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xd3baa058  ! 410: STDFA_I	stda	%f9, [0x0058, %r10]
TH_LABEL410:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2901f  ! 411: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba999f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2913f  ! 416: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc60a801f  ! 417: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc9bad83f  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2c2901f  ! 419: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad9bf  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2d2d17f  ! 422: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r9
	.word 0xc3ba991f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 425: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
TH_LABEL425:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc242c01f  ! 426: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xcad2905f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xcdf2901f  ! 428: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba999f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba985f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 435: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd052801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcc1aa010  ! 438: LDD_I	ldd	[%r10 + 0x0010], %r6
	.word 0xc8caa051  ! 439: LDSBA_I	ldsba	[%r10, + 0x0051] %asi, %r4
	.word 0xcdba981f  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482a074  ! 441: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r2
	.word 0xc2c2901f  ! 442: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc7bad99f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc24a801f  ! 445: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702c01f  ! 446: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcdba999f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2913f  ! 449: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba995f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc882907f  ! 452: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xd3ba98bf  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc602a050  ! 455: LDUW_I	lduw	[%r10 + 0x0050], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bae070  ! 457: STDFA_I	stda	%f9, [0x0070, %r11]
	.word 0xc65aa050  ! 458: LDX_I	ldx	[%r10 + 0x0050], %r3
	.word 0xd1ba997f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88ae024  ! 460: LDUBA_I	lduba	[%r11, + 0x0024] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd302c01f  ! 461: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcbba987f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302a02c  ! 463: LDF_I	ld	[%r10, 0x002c], %f9
	.word 0xcd22c01f  ! 464: STF_R	st	%f6, [%r31, %r11]
	.word 0xc39ae010  ! 465: LDDFA_I	ldda	[%r11, 0x0010], %f1
TH_LABEL465:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3bae048  ! 466: STDFA_I	stda	%f1, [0x0048, %r11]
	.word 0xcbba991f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce02a014  ! 468: LDUW_I	lduw	[%r10 + 0x0014], %r7
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba99bf  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd04ae033  ! 472: LDSB_I	ldsb	[%r11 + 0x0033], %r8
	.word 0xcc92901f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d13f  ! 475: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcff2d03f  ! 476: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcacaa04b  ! 478: LDSBA_I	ldsba	[%r10, + 0x004b] %asi, %r5
	.word 0xd0daa060  ! 479: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r8
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2ca907f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd2d2911f  ! 482: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r9
	.word 0xcfbad99f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce4aa042  ! 486: LDSB_I	ldsb	[%r10 + 0x0042], %r7
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc482a018  ! 488: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r2
	.word 0xc80aa020  ! 489: LDUB_I	ldub	[%r10 + 0x0020], %r4
	.word 0xd39ae050  ! 490: LDDFA_I	ldda	[%r11, 0x0050], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba989f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd01aa058  ! 493: LDD_I	ldd	[%r10 + 0x0058], %r8
	.word 0xd2ca915f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xd19aa078  ! 495: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1baa060  ! 496: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xcbbad93f  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 498: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcfbaa040  ! 500: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2911f  ! 501: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba991f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc8daa048  ! 507: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r4
	.word 0xc292d05f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x82, %r1
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad99f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd1baa038  ! 512: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xc3f2913f  ! 513: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba995f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39ae058  ! 515: LDDFA_I	ldda	[%r11, 0x0058], %f9
TH_LABEL515:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc49aa030  ! 518: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r2
	.word 0xc9baa030  ! 519: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xcc12801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2911f  ! 521: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc39aa058  ! 523: LDDFA_I	ldda	[%r10, 0x0058], %f1
	.word 0xce92d13f  ! 524: LDUHA_R	lduha	[%r11, %r31] 0x89, %r7
	.word 0xcbba995f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xced2a00a  ! 526: LDSHA_I	ldsha	[%r10, + 0x000a] %asi, %r7
	.word 0xcdba99bf  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 528: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd04ae04e  ! 529: LDSB_I	ldsb	[%r11 + 0x004e], %r8
	.word 0xd3bad83f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2d13f  ! 531: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xce5a801f  ! 533: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcedae000  ! 534: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r7
	.word 0xcfba991f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba98bf  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2911f  ! 539: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba987f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc68ae06c  ! 541: LDUBA_I	lduba	[%r11, + 0x006c] %asi, %r3
	.word 0xc81aa018  ! 542: LDD_I	ldd	[%r10 + 0x0018], %r4
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba98bf  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd052801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd05ac01f  ! 547: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xc5bad81f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xd01aa000  ! 550: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd122801f  ! 551: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3bad9bf  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8da911f  ! 553: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2911f  ! 556: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xce4ac01f  ! 557: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xd2caa00e  ! 558: LDSBA_I	ldsba	[%r10, + 0x000e] %asi, %r9
	.word 0xd1ba98bf  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc652a066  ! 560: LDSH_I	ldsh	[%r10 + 0x0066], %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba995f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba991f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc0a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502c01f  ! 566: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba983f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc45aa048  ! 571: LDX_I	ldx	[%r10 + 0x0048], %r2
	.word 0xc3ba99bf  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc02801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc7ba99bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca4aa01e  ! 576: LDSB_I	ldsb	[%r10 + 0x001e], %r5
	.word 0xd04a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc79aa058  ! 578: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc3bad87f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc20aa031  ! 583: LDUB_I	ldub	[%r10 + 0x0031], %r1
	.word 0xc492e002  ! 584: LDUHA_I	lduha	[%r11, + 0x0002] %asi, %r2
	.word 0xcff2901f  ! 585: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59aa060  ! 586: LDDFA_I	ldda	[%r10, 0x0060], %f2
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc28a901f  ! 589: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xcbe2d03f  ! 590: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad99f  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd20ac01f  ! 592: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xcfbaa068  ! 593: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xcb9aa030  ! 594: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd092901f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc612c01f  ! 598: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc9f2901f  ! 599: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba99bf  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 602: STF_R	st	%f7, [%r31, %r10]
	.word 0xcd9ae060  ! 603: LDDFA_I	ldda	[%r11, 0x0060], %f6
	.word 0xcb9aa008  ! 604: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xc7bad95f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc442e078  ! 606: LDSW_I	ldsw	[%r11 + 0x0078], %r2
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL610:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce92903f  ! 611: LDUHA_R	lduha	[%r10, %r31] 0x81, %r7
	.word 0xd302c01f  ! 612: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc442801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcfba981f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc482a040  ! 615: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc01a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba981f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc412a040  ! 620: LDUH_I	lduh	[%r10 + 0x0040], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd01ac01f  ! 621: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc25aa070  ! 622: LDX_I	ldx	[%r10 + 0x0070], %r1
	.word 0xcd02a040  ! 623: LDF_I	ld	[%r10, 0x0040], %f6
	.word 0xcdba98bf  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdbaa040  ! 625: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1baa060  ! 626: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xd292d13f  ! 627: LDUHA_R	lduha	[%r11, %r31] 0x89, %r9
	.word 0xca92e044  ! 628: LDUHA_I	lduha	[%r11, + 0x0044] %asi, %r5
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd252e026  ! 630: LDSH_I	ldsh	[%r11 + 0x0026], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba987f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2903f  ! 633: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2903f  ! 634: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba991f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba991f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ae060  ! 637: LDD_I	ldd	[%r11 + 0x0060], %r4
	.word 0xc9bad93f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6d2e036  ! 639: LDSHA_I	ldsha	[%r11, + 0x0036] %asi, %r3
	.word 0xcdba991f  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba995f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcecae04e  ! 642: LDSBA_I	ldsba	[%r11, + 0x004e] %asi, %r7
	.word 0xd3ba987f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba981f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 649: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcfbaa000  ! 650: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3baa048  ! 651: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc39aa008  ! 653: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xc68aa078  ! 654: LDUBA_I	lduba	[%r10, + 0x0078] %asi, %r3
	.word 0xc9baa030  ! 655: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02801f  ! 656: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3f2901f  ! 657: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba993f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcbbae058  ! 662: STDFA_I	stda	%f5, [0x0058, %r11]
	.word 0xc882a014  ! 663: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r4
	.word 0xcc9aa070  ! 664: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcf9aa078  ! 667: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcbf2901f  ! 668: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba993f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc4d2e07e  ! 671: LDSHA_I	ldsha	[%r11, + 0x007e] %asi, %r2
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad91f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 675: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce12801f  ! 676: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xca0aa02f  ! 677: LDUB_I	ldub	[%r10 + 0x002f], %r5
	.word 0xc3ba98bf  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2a054  ! 681: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r2
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcbbae008  ! 683: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xcbba99bf  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122801f  ! 685: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc212a038  ! 686: LDUH_I	lduh	[%r10 + 0x0038], %r1
	.word 0xc502a014  ! 687: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba981f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xc81ac01f  ! 693: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcfba985f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc9aa038  ! 696: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r6
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd25aa010  ! 698: LDX_I	ldx	[%r10 + 0x0010], %r9
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad99f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL700:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc902a034  ! 702: LDF_I	ld	[%r10, 0x0034], %f4
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc652a024  ! 704: LDSH_I	ldsh	[%r10 + 0x0024], %r3
	.word 0xc5bae030  ! 705: STDFA_I	stda	%f2, [0x0030, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad8bf  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc9baa068  ! 707: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xcc5aa050  ! 708: LDX_I	ldx	[%r10 + 0x0050], %r6
	.word 0xcb02c01f  ! 709: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcfba985f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf02801f  ! 711: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc41ac01f  ! 712: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xcdba993f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd09aa028  ! 716: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r8
	.word 0xc5ba981f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 720: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc682907f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r3
	.word 0xd122801f  ! 722: STF_R	st	%f8, [%r31, %r10]
	.word 0xc8cad07f  ! 723: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r4
	.word 0xcc1a801f  ! 724: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfbad93f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce5a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba993f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd39aa008  ! 730: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc282a048  ! 731: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r1
	.word 0xca12a016  ! 732: LDUH_I	lduh	[%r10 + 0x0016], %r5
	.word 0xd102801f  ! 733: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcf02c01f  ! 734: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL735:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba999f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd24aa027  ! 739: LDSB_I	ldsb	[%r10 + 0x0027], %r9
	.word 0xc8daa038  ! 740: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc2d2d01f  ! 741: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xc7baa078  ! 742: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc3bad81f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd00aa052  ! 744: LDUB_I	ldub	[%r10 + 0x0052], %r8
	.word 0xc502a060  ! 745: LDF_I	ld	[%r10, 0x0060], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xced2a00e  ! 746: LDSHA_I	ldsha	[%r10, + 0x000e] %asi, %r7
	.word 0xc442a064  ! 747: LDSW_I	ldsw	[%r10 + 0x0064], %r2
	.word 0xd1bae060  ! 748: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad83f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbae010  ! 752: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xd3bad81f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad87f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcf9aa048  ! 759: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xd20aa019  ! 760: LDUB_I	ldub	[%r10 + 0x0019], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xce82a074  ! 762: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r7
	.word 0xd3f2911f  ! 763: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba991f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba983f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca8aa007  ! 767: LDUBA_I	lduba	[%r10, + 0x0007] %asi, %r5
	.word 0xd292a022  ! 768: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r9
	.word 0xc28ad05f  ! 769: LDUBA_R	lduba	[%r11, %r31] 0x82, %r1
	.word 0xce4aa00b  ! 770: LDSB_I	ldsb	[%r10 + 0x000b], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcd22c01f  ! 771: STF_R	st	%f6, [%r31, %r11]
	.word 0xcdba985f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xccda917f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd102c01f  ! 780: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d11f  ! 782: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad87f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd0caa072  ! 786: LDSBA_I	ldsba	[%r10, + 0x0072] %asi, %r8
	.word 0xd0c2d05f  ! 787: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
	.word 0xcbbad9bf  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41a801f  ! 789: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad85f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd25ae000  ! 794: LDX_I	ldx	[%r11 + 0x0000], %r9
	.word 0xc9e2d01f  ! 795: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad83f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd02a010  ! 799: LDF_I	ld	[%r10, 0x0010], %f6
	.word 0xca82903f  ! 800: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc89aa028  ! 801: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xc39aa060  ! 802: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc39ae000  ! 803: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xc722c01f  ! 804: STF_R	st	%f3, [%r31, %r11]
	.word 0xcdba981f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba981f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbae060  ! 808: STDFA_I	stda	%f7, [0x0060, %r11]
	.word 0xc88a903f  ! 809: LDUBA_R	lduba	[%r10, %r31] 0x81, %r4
	.word 0xcbe2d13f  ! 810: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad81f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf9ae050  ! 812: LDDFA_I	ldda	[%r11, 0x0050], %f7
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad97f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652c01f  ! 815: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2913f  ! 816: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xd242e038  ! 817: LDSW_I	ldsw	[%r11 + 0x0038], %r9
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc40ae05b  ! 819: LDUB_I	ldub	[%r11 + 0x005b], %r2
	.word 0xcf22c01f  ! 820: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba995f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc49ae068  ! 823: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r2
	.word 0xc642c01f  ! 824: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc9bad83f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL825:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc492903f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x81, %r2
	.word 0xc81a801f  ! 827: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd39aa010  ! 828: LDDFA_I	ldda	[%r10, 0x0010], %f9
	.word 0xcb02801f  ! 829: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2d13f  ! 831: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad87f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 834: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcaca917f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xcccaa04d  ! 837: LDSBA_I	ldsba	[%r10, + 0x004d] %asi, %r6
	.word 0xcfbad85f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd39ae018  ! 839: LDDFA_I	ldda	[%r11, 0x0018], %f9
	.word 0xcdba987f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd0c2a078  ! 843: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r8
	.word 0xc202c01f  ! 844: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf22c01f  ! 846: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba997f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 849: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xce82d03f  ! 850: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc612e044  ! 851: LDUH_I	lduh	[%r11 + 0x0044], %r3
	.word 0xd1bad81f  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 853: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad8bf  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 859: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad97f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702c01f  ! 861: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc3ba981f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd202c01f  ! 866: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc4c2e078  ! 868: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r2
	.word 0xc88a915f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r4
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL870:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba993f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc40aa067  ! 872: LDUB_I	ldub	[%r10 + 0x0067], %r2
	.word 0xd042801f  ! 873: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7ba985f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL875:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba997f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 877: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba985f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2903f  ! 880: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba983f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc902c01f  ! 884: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad9bf  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc59aa010  ! 889: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xc7bad89f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bad99f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc322c01f  ! 894: STF_R	st	%f1, [%r31, %r11]
	.word 0xc5bad91f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL895:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad9bf  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad85f  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd212801f  ! 900: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad99f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d01f  ! 904: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad97f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL905:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad91f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc45ae068  ! 908: LDX_I	ldx	[%r11 + 0x0068], %r2
	.word 0xc322801f  ! 909: STF_R	st	%f1, [%r31, %r10]
	.word 0xc302a04c  ! 910: LDF_I	ld	[%r10, 0x004c], %f1
TH_LABEL910:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7baa078  ! 911: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcec2a074  ! 913: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r7
	.word 0xc3ba983f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2901f  ! 916: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xca8a905f  ! 918: LDUBA_R	lduba	[%r10, %r31] 0x82, %r5
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba999f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302c01f  ! 921: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc612a05c  ! 922: LDUH_I	lduh	[%r10 + 0x005c], %r3
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 925: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc12c01f  ! 926: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xd1ba987f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc802e000  ! 928: LDUW_I	lduw	[%r11 + 0x0000], %r4
	.word 0xd3bad89f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd092e060  ! 931: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r8
	.word 0xc412a046  ! 932: LDUH_I	lduh	[%r10 + 0x0046], %r2
	.word 0xc39ae078  ! 933: LDDFA_I	ldda	[%r11, 0x0078], %f1
	.word 0xcdba991f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL935:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca92d13f  ! 936: LDUHA_R	lduha	[%r11, %r31] 0x89, %r5
	.word 0xc3e2d03f  ! 937: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xce8aa039  ! 938: LDUBA_I	lduba	[%r10, + 0x0039] %asi, %r7
	.word 0xc612a058  ! 939: LDUH_I	lduh	[%r10 + 0x0058], %r3
	.word 0xc402a078  ! 940: LDUW_I	lduw	[%r10 + 0x0078], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xd102a064  ! 944: LDF_I	ld	[%r10, 0x0064], %f8
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad99f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3baa078  ! 947: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xc4c2a03c  ! 948: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r2
	.word 0xca8a901f  ! 949: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xc9ba983f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc6d2a05e  ! 952: LDSHA_I	ldsha	[%r10, + 0x005e] %asi, %r3
	.word 0xcd02c01f  ! 953: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcfba981f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2911f  ! 957: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcccae037  ! 958: LDSBA_I	ldsba	[%r11, + 0x0037] %asi, %r6
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd102a024  ! 960: LDF_I	ld	[%r10, 0x0024], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd322801f  ! 961: STF_R	st	%f9, [%r31, %r10]
	.word 0xd1ba99bf  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba98bf  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd02c01f  ! 966: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc652a064  ! 967: LDSH_I	ldsh	[%r10 + 0x0064], %r3
	.word 0xcfba98bf  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xca52a052  ! 970: LDSH_I	ldsh	[%r10 + 0x0052], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba989f  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba991f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc9ae018  ! 977: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r6
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d13f  ! 979: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad99f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad95f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca52801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc5bae050  ! 983: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xcb9aa000  ! 984: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xc3ba991f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL985:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 987: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba995f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd292915f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r9
	.word 0xd1ba993f  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba991f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcb22801f  ! 2: STF_R	st	%f5, [%r31, %r10]
	.word 0xcdba989f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba989f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3baa058  ! 7: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad95f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad91f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc642801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xcedaa030  ! 14: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r7
	.word 0xd122801f  ! 15: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad81f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc9bae078  ! 19: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xc522801f  ! 20: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcd9aa070  ! 22: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xc292907f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc89ae048  ! 26: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r4
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xced2913f  ! 28: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
	.word 0xc9baa040  ! 29: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba981f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba989f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc322801f  ! 34: STF_R	st	%f1, [%r31, %r10]
	.word 0xcbbad97f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc642801f  ! 36: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd102801f  ! 37: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xd102c01f  ! 39: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd1ba99bf  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba98bf  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc60aa01b  ! 43: LDUB_I	ldub	[%r10 + 0x001b], %r3
	.word 0xcbba993f  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbae000  ! 46: STDFA_I	stda	%f5, [0x0000, %r11]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc2ca907f  ! 48: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd3f2d11f  ! 49: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xc79aa028  ! 50: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7f2d13f  ! 51: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad87f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d03f  ! 55: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2da905f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xcbe2d01f  ! 57: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad85f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc49aa078  ! 59: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xcfe2911f  ! 60: CASA_I	casa	[%r10] 0x88, %r31, %r7
TH_LABEL60:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba98bf  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102e068  ! 62: LDF_I	ld	[%r11, 0x0068], %f8
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba995f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb02c01f  ! 65: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2911f  ! 66: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc6c2d01f  ! 67: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xc5ba989f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6c2d17f  ! 69: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r3
	.word 0xce8a901f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
TH_LABEL70:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba999f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc302a01c  ! 74: LDF_I	ld	[%r10, 0x001c], %f1
	.word 0xce92a05e  ! 75: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc09ae008  ! 76: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r0
	.word 0xcbbad91f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd282913f  ! 78: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r9
	.word 0xcfba991f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba981f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd05ac01f  ! 82: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xc81a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc2c2e038  ! 84: LDSWA_I	ldswa	[%r11, + 0x0038] %asi, %r1
	.word 0xcdbaa070  ! 85: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad97f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc68a907f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x83, %r3
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2903f  ! 89: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba98bf  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL90:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc642a078  ! 91: LDSW_I	ldsw	[%r10 + 0x0078], %r3
	.word 0xc3f2901f  ! 92: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba987f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2913f  ! 99: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xd322801f  ! 100: STF_R	st	%f9, [%r31, %r10]
TH_LABEL100:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad8bf  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc25aa048  ! 105: LDX_I	ldx	[%r10 + 0x0048], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2901f  ! 106: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xce0a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc1ac01f  ! 111: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd3ba981f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd042a004  ! 114: LDSW_I	ldsw	[%r10 + 0x0004], %r8
	.word 0xc5bae048  ! 115: STDFA_I	stda	%f2, [0x0048, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccc2a048  ! 116: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r6
	.word 0xd052801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd252801f  ! 118: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcd22801f  ! 119: STF_R	st	%f6, [%r31, %r10]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba991f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc522801f  ! 122: STF_R	st	%f2, [%r31, %r10]
	.word 0xce12801f  ! 123: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc5ba989f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcbbaa038  ! 125: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6d2a032  ! 126: LDSHA_I	ldsha	[%r10, + 0x0032] %asi, %r3
	.word 0xce82903f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r7
	.word 0xc39aa048  ! 128: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xd3bad89f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc6dad05f  ! 131: LDXA_R	ldxa	[%r11, %r31] 0x82, %r3
	.word 0xcdf2903f  ! 132: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc24ae031  ! 134: LDSB_I	ldsb	[%r11 + 0x0031], %r1
	.word 0xc9e2903f  ! 135: CASA_I	casa	[%r10] 0x81, %r31, %r4
TH_LABEL135:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba981f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcd02a054  ! 139: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xcc1aa030  ! 140: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2913f  ! 141: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc902e054  ! 142: LDF_I	ld	[%r11, 0x0054], %f4
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xcb9ae040  ! 144: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xd102a00c  ! 145: LDF_I	ld	[%r10, 0x000c], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba983f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 148: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcbbaa048  ! 150: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102c01f  ! 151: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc59aa030  ! 152: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad89f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc2ca915f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302801f  ! 156: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcfba99bf  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3baa010  ! 161: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xcfe2911f  ! 162: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL165:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc1ac01f  ! 166: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd1bae050  ! 167: STDFA_I	stda	%f8, [0x0050, %r11]
	.word 0xcf02a024  ! 168: LDF_I	ld	[%r10, 0x0024], %f7
	.word 0xcdf2903f  ! 169: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcf02e050  ! 170: LDF_I	ld	[%r11, 0x0050], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad87f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc902a060  ! 174: LDF_I	ld	[%r10, 0x0060], %f4
	.word 0xc412e006  ! 175: LDUH_I	lduh	[%r11 + 0x0006], %r2
TH_LABEL175:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9baa068  ! 176: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc82e068  ! 178: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r6
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc702a03c  ! 180: LDF_I	ld	[%r10, 0x003c], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad85f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad87f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfbae028  ! 187: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xc642c01f  ! 188: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba997f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2913f  ! 193: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc4c2d17f  ! 194: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r2
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc302801f  ! 196: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 199: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbe2d03f  ! 201: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc802e078  ! 202: LDUW_I	lduw	[%r11 + 0x0078], %r4
	.word 0xc5ba987f  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 204: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd002c01f  ! 205: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2901f  ! 206: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcd02a000  ! 207: LDF_I	ld	[%r10, 0x0000], %f6
	.word 0xcc52c01f  ! 208: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xcfbad8bf  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc24a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL215:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102801f  ! 216: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1e2911f  ! 217: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba997f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca4a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc25aa040  ! 220: LDX_I	ldx	[%r10 + 0x0040], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5baa028  ! 221: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xd202a010  ! 222: LDUW_I	lduw	[%r10 + 0x0010], %r9
	.word 0xcf02a004  ! 223: LDF_I	ld	[%r10, 0x0004], %f7
	.word 0xcbba991f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc0a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc8da905f  ! 227: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xcb02801f  ! 228: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcb02c01f  ! 230: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba983f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc2d2a068  ! 233: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r1
	.word 0xc892a038  ! 234: LDUHA_I	lduha	[%r10, + 0x0038] %asi, %r4
	.word 0xd1baa030  ! 235: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bae028  ! 236: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xcc9ae018  ! 237: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r6
	.word 0xcd02801f  ! 238: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd09ae020  ! 239: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xd3ba99bf  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2903f  ! 241: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd09aa078  ! 242: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xc5ba997f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 244: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc692e006  ! 245: LDUHA_I	lduha	[%r11, + 0x0006] %asi, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba98bf  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8a911f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xcdbaa028  ! 248: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad87f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL250:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad93f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d01f  ! 253: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad81f  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad95f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc80a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc602e034  ! 264: LDUW_I	lduw	[%r11 + 0x0034], %r3
	.word 0xc5e2d13f  ! 265: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad99f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d11f  ! 269: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad93f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc39aa018  ! 271: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd3bae038  ! 273: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xc64a801f  ! 274: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xd1bad89f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf22c01f  ! 276: STF_R	st	%f7, [%r31, %r11]
	.word 0xc482d01f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r2
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcb9ae030  ! 279: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
TH_LABEL280:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba995f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc212a03e  ! 284: LDUH_I	lduh	[%r10 + 0x003e], %r1
	.word 0xcdba985f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc6c2a014  ! 288: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r3
	.word 0xc79ae010  ! 289: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad81f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3bad99f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d11f  ! 297: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad95f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 299: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xd302801f  ! 300: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc302a03c  ! 301: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xcac2901f  ! 302: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc682913f  ! 303: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xc4da917f  ! 304: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xcbbaa040  ! 305: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba983f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102a034  ! 307: LDF_I	ld	[%r10, 0x0034], %f8
	.word 0xc3baa038  ! 308: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc9ba981f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa000  ! 310: STDFA_I	stda	%f3, [0x0000, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba991f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc0ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xd1f2d11f  ! 314: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad93f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc812e046  ! 316: LDUH_I	lduh	[%r11 + 0x0046], %r4
	.word 0xc302a05c  ! 317: LDF_I	ld	[%r10, 0x005c], %f1
	.word 0xcd02c01f  ! 318: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc52a03c  ! 320: LDSH_I	ldsh	[%r10 + 0x003c], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bad85f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad87f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca0ac01f  ! 324: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcfba98bf  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba981f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc79aa028  ! 327: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xd1bad95f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc64aa04f  ! 329: LDSB_I	ldsb	[%r10 + 0x004f], %r3
	.word 0xcd22801f  ! 330: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2913f  ! 331: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2913f  ! 332: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc01a801f  ! 333: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc9ba987f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca52801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02801f  ! 336: LDF_R	ld	[%r10, %r31], %f7
	.word 0xce12801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd3e2d03f  ! 338: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xc9baa030  ! 339: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xd1bad85f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL340:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad89f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 342: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xceca915f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xc3ba98bf  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
TH_LABEL345:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba985f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc212a002  ! 347: LDUH_I	lduh	[%r10 + 0x0002], %r1
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc7baa038  ! 349: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xc5ba995f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL350:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba981f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc722801f  ! 353: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1bad91f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad91f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad81f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc482d17f  ! 362: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r2
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd0c2e008  ! 364: LDSWA_I	ldswa	[%r11, + 0x0008] %asi, %r8
	.word 0xc682903f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad89f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 369: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad83f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc212e00e  ! 371: LDUH_I	lduh	[%r11 + 0x000e], %r1
	.word 0xcfe2913f  ! 372: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcff2901f  ! 373: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2901f  ! 374: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc702a05c  ! 375: LDF_I	ld	[%r10, 0x005c], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd102a078  ! 376: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xcbf2901f  ! 377: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc802801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc20ae000  ! 379: LDUB_I	ldub	[%r11 + 0x0000], %r1
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL380:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc502c01f  ! 381: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc9e2913f  ! 382: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xca12801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7ba99bf  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd05ae018  ! 385: LDX_I	ldx	[%r11 + 0x0018], %r8
TH_LABEL385:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3f2d11f  ! 386: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc302a038  ! 387: LDF_I	ld	[%r10, 0x0038], %f1
	.word 0xc5ba989f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc522c01f  ! 389: STF_R	st	%f2, [%r31, %r11]
	.word 0xc242a018  ! 390: LDSW_I	ldsw	[%r10 + 0x0018], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba985f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 392: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc49aa030  ! 393: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r2
	.word 0xc9bad91f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce02e038  ! 395: LDUW_I	lduw	[%r11 + 0x0038], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc44a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc5ba99bf  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc60aa052  ! 399: LDUB_I	ldub	[%r10 + 0x0052], %r3
	.word 0xc3f2d03f  ! 400: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
TH_LABEL400:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcecae07e  ! 401: LDSBA_I	ldsba	[%r11, + 0x007e] %asi, %r7
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba98bf  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc8ad11f  ! 406: LDUBA_R	lduba	[%r11, %r31] 0x88, %r6
	.word 0xc9bad85f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc692905f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xc3bae048  ! 410: STDFA_I	stda	%f1, [0x0048, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2901f  ! 411: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2913f  ! 416: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xd20a801f  ! 417: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc9bad93f  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcec2903f  ! 419: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad83f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccd2901f  ! 422: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xc3ba997f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 425: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca42c01f  ! 426: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc6d2917f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xcdf2913f  ! 428: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba981f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba999f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 435: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc52801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc81ae040  ! 438: LDD_I	ldd	[%r11 + 0x0040], %r4
	.word 0xcacaa019  ! 439: LDSBA_I	ldsba	[%r10, + 0x0019] %asi, %r5
	.word 0xcdba995f  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc282e024  ! 441: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r1
	.word 0xc8c2905f  ! 442: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xc7bad95f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd24ac01f  ! 445: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd302801f  ! 446: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcdba99bf  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2901f  ! 449: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba999f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xd082d01f  ! 452: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xd3ba993f  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd202a004  ! 455: LDUW_I	lduw	[%r10 + 0x0004], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc5baa050  ! 457: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc65aa030  ! 458: LDX_I	ldx	[%r10 + 0x0030], %r3
	.word 0xd1ba997f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88ae062  ! 460: LDUBA_I	lduba	[%r11, + 0x0062] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd102c01f  ! 461: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcbba985f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02a068  ! 463: LDF_I	ld	[%r10, 0x0068], %f7
	.word 0xc922801f  ! 464: STF_R	st	%f4, [%r31, %r10]
	.word 0xcf9aa040  ! 465: LDDFA_I	ldda	[%r10, 0x0040], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa070  ! 466: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xcbba999f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc802e03c  ! 468: LDUW_I	lduw	[%r11 + 0x003c], %r4
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba981f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc4aa07b  ! 472: LDSB_I	ldsb	[%r10 + 0x007b], %r6
	.word 0xc492911f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d03f  ! 475: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2d01f  ! 476: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd0cae01b  ! 478: LDSBA_I	ldsba	[%r11, + 0x001b] %asi, %r8
	.word 0xc4dae000  ! 479: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r2
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0ca913f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r8
	.word 0xced2913f  ! 482: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
	.word 0xcfbad85f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc84ae042  ! 486: LDSB_I	ldsb	[%r11 + 0x0042], %r4
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd282a030  ! 488: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r9
	.word 0xd00ae024  ! 489: LDUB_I	ldub	[%r11 + 0x0024], %r8
	.word 0xc39aa040  ! 490: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba99bf  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc81aa048  ! 493: LDD_I	ldd	[%r10 + 0x0048], %r4
	.word 0xc6ca901f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xcf9ae068  ! 495: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bae050  ! 496: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xcbbad8bf  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 498: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcdbaa030  ! 500: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3f2911f  ! 501: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba99bf  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xccdae010  ! 507: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r6
	.word 0xc892d15f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r4
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad99f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad81f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bae010  ! 512: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xc3f2901f  ! 513: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba991f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39ae000  ! 515: LDDFA_I	ldda	[%r11, 0x0000], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc89aa010  ! 518: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xc7baa040  ! 519: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xce12801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6c2d07f  ! 521: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcf9aa018  ! 523: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc892d03f  ! 524: LDUHA_R	lduha	[%r11, %r31] 0x81, %r4
	.word 0xcbba981f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xccd2a068  ! 526: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r6
	.word 0xcdba981f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 528: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc24aa032  ! 529: LDSB_I	ldsb	[%r10 + 0x0032], %r1
	.word 0xd3bad99f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2d01f  ! 531: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xc65a801f  ! 533: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xccdae018  ! 534: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r6
	.word 0xcfba981f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba997f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2903f  ! 539: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba999f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc8aa05b  ! 541: LDUBA_I	lduba	[%r10, + 0x005b] %asi, %r6
	.word 0xc81aa040  ! 542: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc652c01f  ! 546: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xcc5a801f  ! 547: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc5bad81f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xd01ae028  ! 550: LDD_I	ldd	[%r11 + 0x0028], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc522801f  ! 551: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3bad8bf  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2da905f  ! 553: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2913f  ! 556: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc84ac01f  ! 557: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xcecae054  ! 558: LDSBA_I	ldsba	[%r11, + 0x0054] %asi, %r7
	.word 0xd1ba987f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc452e002  ! 560: LDSH_I	ldsh	[%r11 + 0x0002], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba997f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba981f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc0a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702801f  ! 566: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba987f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc25ae070  ! 571: LDX_I	ldx	[%r11 + 0x0070], %r1
	.word 0xc3ba985f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce02801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc7ba995f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc24aa064  ! 576: LDSB_I	ldsb	[%r10 + 0x0064], %r1
	.word 0xc64a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xd19ae078  ! 578: LDDFA_I	ldda	[%r11, 0x0078], %f8
	.word 0xc3bad97f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xca0aa056  ! 583: LDUB_I	ldub	[%r10 + 0x0056], %r5
	.word 0xc692e004  ! 584: LDUHA_I	lduha	[%r11, + 0x0004] %asi, %r3
	.word 0xcff2901f  ! 585: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd19aa040  ! 586: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd08a911f  ! 589: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
	.word 0xcbe2d03f  ! 590: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad81f  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0ac01f  ! 592: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc5baa038  ! 593: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcd9ae028  ! 594: LDDFA_I	ldda	[%r11, 0x0028], %f6
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd092915f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r8
	.word 0xcc12801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc9f2911f  ! 599: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba981f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba995f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 602: STF_R	st	%f4, [%r31, %r10]
	.word 0xc99aa000  ! 603: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xc59aa040  ! 604: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xc7bad93f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc242e044  ! 606: LDSW_I	ldsw	[%r11 + 0x0044], %r1
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad81f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce92915f  ! 611: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xc502801f  ! 612: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca42c01f  ! 613: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xcfba981f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82e064  ! 615: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc41a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba985f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc412a072  ! 620: LDUH_I	lduh	[%r10 + 0x0072], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc1a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd25aa038  ! 622: LDX_I	ldx	[%r10 + 0x0038], %r9
	.word 0xc702e028  ! 623: LDF_I	ld	[%r11, 0x0028], %f3
	.word 0xcdba985f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5bae018  ! 625: STDFA_I	stda	%f2, [0x0018, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5baa000  ! 626: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc892907f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x83, %r4
	.word 0xcc92a00e  ! 628: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r6
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd252a01c  ! 630: LDSH_I	ldsh	[%r10 + 0x001c], %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba989f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2903f  ! 633: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2911f  ! 634: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba99bf  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba989f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41ae038  ! 637: LDD_I	ldd	[%r11 + 0x0038], %r2
	.word 0xc9bad87f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc4d2e01e  ! 639: LDSHA_I	ldsha	[%r11, + 0x001e] %asi, %r2
	.word 0xcdba983f  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba995f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8cae00f  ! 642: LDSBA_I	ldsba	[%r11, + 0x000f] %asi, %r4
	.word 0xd3ba995f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba985f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 649: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcbbae018  ! 650: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7baa040  ! 651: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcd9ae068  ! 653: LDDFA_I	ldda	[%r11, 0x0068], %f6
	.word 0xc88ae032  ! 654: LDUBA_I	lduba	[%r11, + 0x0032] %asi, %r4
	.word 0xd3baa068  ! 655: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902801f  ! 656: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd3f2901f  ! 657: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba991f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc3bae008  ! 662: STDFA_I	stda	%f1, [0x0008, %r11]
	.word 0xc682a024  ! 663: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r3
	.word 0xcc9aa028  ! 664: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r6
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
TH_LABEL665:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc39ae038  ! 667: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xcbf2901f  ! 668: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba993f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4d2a05e  ! 671: LDSHA_I	ldsha	[%r10, + 0x005e] %asi, %r2
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d13f  ! 675: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc412c01f  ! 676: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc80aa021  ! 677: LDUB_I	ldub	[%r10 + 0x0021], %r4
	.word 0xc3ba997f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2c2a078  ! 681: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r9
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc3baa028  ! 683: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xcbba997f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122801f  ! 685: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc412e050  ! 686: LDUH_I	lduh	[%r11 + 0x0050], %r2
	.word 0xd302a004  ! 687: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba991f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc1ac01f  ! 693: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfba985f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc49aa068  ! 696: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc65aa028  ! 698: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad95f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcb02a044  ! 702: LDF_I	ld	[%r10, 0x0044], %f5
	.word 0xd1e2913f  ! 703: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc252a04a  ! 704: LDSH_I	ldsh	[%r10 + 0x004a], %r1
	.word 0xd3baa060  ! 705: STDFA_I	stda	%f9, [0x0060, %r10]
TH_LABEL705:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad85f  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc3bae020  ! 707: STDFA_I	stda	%f1, [0x0020, %r11]
	.word 0xc65aa010  ! 708: LDX_I	ldx	[%r10 + 0x0010], %r3
	.word 0xc302801f  ! 709: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcfba98bf  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc702801f  ! 711: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcc1ac01f  ! 712: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcdba981f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc9aa018  ! 716: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xc5ba98bf  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2913f  ! 720: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd082917f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xd322c01f  ! 722: STF_R	st	%f9, [%r31, %r11]
	.word 0xc6ca915f  ! 723: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r3
	.word 0xc81ac01f  ! 724: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcfbad95f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd05a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf9ae028  ! 730: LDDFA_I	ldda	[%r11, 0x0028], %f7
TH_LABEL730:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd082e01c  ! 731: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r8
	.word 0xd012a060  ! 732: LDUH_I	lduh	[%r10 + 0x0060], %r8
	.word 0xc702801f  ! 733: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc702c01f  ! 734: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba981f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc4ae043  ! 739: LDSB_I	ldsb	[%r11 + 0x0043], %r6
	.word 0xcedaa058  ! 740: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6d2917f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xcfbae038  ! 742: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xc3bad99f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc80aa053  ! 744: LDUB_I	ldub	[%r10 + 0x0053], %r4
	.word 0xc702e03c  ! 745: LDF_I	ld	[%r11, 0x003c], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2d2a040  ! 746: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r9
	.word 0xc842a060  ! 747: LDSW_I	ldsw	[%r10 + 0x0060], %r4
	.word 0xcdbaa038  ! 748: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad85f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbaa048  ! 752: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xd3bad95f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad95f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc99ae060  ! 759: LDDFA_I	ldda	[%r11, 0x0060], %f4
	.word 0xca0ae00d  ! 760: LDUB_I	ldub	[%r11 + 0x000d], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc482e050  ! 762: LDUWA_I	lduwa	[%r11, + 0x0050] %asi, %r2
	.word 0xd3f2913f  ! 763: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba981f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba981f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce8ae048  ! 767: LDUBA_I	lduba	[%r11, + 0x0048] %asi, %r7
	.word 0xd292e06e  ! 768: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r9
	.word 0xcc8ad13f  ! 769: LDUBA_R	lduba	[%r11, %r31] 0x89, %r6
	.word 0xce4ae014  ! 770: LDSB_I	ldsb	[%r11 + 0x0014], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd322c01f  ! 771: STF_R	st	%f9, [%r31, %r11]
	.word 0xcdba989f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce02c01f  ! 774: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc6dad01f  ! 775: LDXA_R	ldxa	[%r11, %r31] 0x80, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc502801f  ! 780: LDF_R	ld	[%r10, %r31], %f2
TH_LABEL780:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d01f  ! 782: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad91f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4caa06a  ! 786: LDSBA_I	ldsba	[%r10, + 0x006a] %asi, %r2
	.word 0xc2c2901f  ! 787: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xcbbad97f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41a801f  ! 789: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad83f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc65ae048  ! 794: LDX_I	ldx	[%r11 + 0x0048], %r3
	.word 0xc9e2d01f  ! 795: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad91f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02a004  ! 799: LDF_I	ld	[%r10, 0x0004], %f7
	.word 0xd082907f  ! 800: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc09ae010  ! 801: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r0
	.word 0xc59aa038  ! 802: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xc59ae060  ! 803: LDDFA_I	ldda	[%r11, 0x0060], %f2
	.word 0xc922c01f  ! 804: STF_R	st	%f4, [%r31, %r11]
	.word 0xcdba987f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba983f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd1baa060  ! 808: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xce8ad13f  ! 809: LDUBA_R	lduba	[%r11, %r31] 0x89, %r7
	.word 0xcbe2d11f  ! 810: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad95f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf9aa038  ! 812: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad97f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce52c01f  ! 815: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2903f  ! 816: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xca42a008  ! 817: LDSW_I	ldsw	[%r10 + 0x0008], %r5
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xce0aa03d  ! 819: LDUB_I	ldub	[%r10 + 0x003d], %r7
	.word 0xc522801f  ! 820: STF_R	st	%f2, [%r31, %r10]
TH_LABEL820:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba99bf  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc89ae040  ! 823: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r4
	.word 0xd242c01f  ! 824: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc9bad91f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc492905f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x82, %r2
	.word 0xc81ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc59aa038  ! 828: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xc302c01f  ! 829: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1e2d11f  ! 831: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad97f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 834: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xccca905f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xcecaa042  ! 837: LDSBA_I	ldsba	[%r10, + 0x0042] %asi, %r7
	.word 0xcfbad89f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb9aa030  ! 839: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xcdba985f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcec2e064  ! 843: LDSWA_I	ldswa	[%r11, + 0x0064] %asi, %r7
	.word 0xce02c01f  ! 844: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf22801f  ! 846: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7ba997f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 849: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc282905f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc612a03a  ! 851: LDUH_I	lduh	[%r10 + 0x003a], %r3
	.word 0xd1bad8bf  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 853: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad8bf  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 859: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad89f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02c01f  ! 861: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc3ba987f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc602c01f  ! 866: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc3e2913f  ! 867: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc6c2a044  ! 868: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r3
	.word 0xc48a903f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x81, %r2
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba99bf  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd20aa03c  ! 872: LDUB_I	ldub	[%r10 + 0x003c], %r9
	.word 0xcc42c01f  ! 873: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xc7ba999f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba997f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 877: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba989f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2901f  ! 880: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba989f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd102801f  ! 884: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad9bf  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc79aa068  ! 889: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xc7bad99f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bad99f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcd22801f  ! 894: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5bad83f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bad91f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad95f  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc12801f  ! 900: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad85f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d03f  ! 904: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad81f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad9bf  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcc5aa008  ! 908: LDX_I	ldx	[%r10 + 0x0008], %r6
	.word 0xd122801f  ! 909: STF_R	st	%f8, [%r31, %r10]
	.word 0xc302a07c  ! 910: LDF_I	ld	[%r10, 0x007c], %f1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bae060  ! 911: STDFA_I	stda	%f9, [0x0060, %r11]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc4c2a008  ! 913: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r2
	.word 0xc3ba983f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2901f  ! 916: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc28a907f  ! 918: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba983f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc702c01f  ! 921: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc612e012  ! 922: LDUH_I	lduh	[%r11 + 0x0012], %r3
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2911f  ! 925: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc212801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd1ba997f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc02a054  ! 928: LDUW_I	lduw	[%r10 + 0x0054], %r6
	.word 0xd3bad83f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd292e000  ! 931: LDUHA_I	lduha	[%r11, + 0x0000] %asi, %r9
	.word 0xca12a06a  ! 932: LDUH_I	lduh	[%r10 + 0x006a], %r5
	.word 0xc39aa068  ! 933: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xcdba985f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce92d17f  ! 936: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r7
	.word 0xc3e2d03f  ! 937: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd08aa008  ! 938: LDUBA_I	lduba	[%r10, + 0x0008] %asi, %r8
	.word 0xc412e078  ! 939: LDUH_I	lduh	[%r11 + 0x0078], %r2
	.word 0xd002a050  ! 940: LDUW_I	lduw	[%r10 + 0x0050], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad85f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xc302a04c  ! 944: LDF_I	ld	[%r10, 0x004c], %f1
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL945:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bad99f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd1baa030  ! 947: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xccc2a008  ! 948: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r6
	.word 0xc28ad15f  ! 949: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r1
	.word 0xc9ba981f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc2d2a056  ! 952: LDSHA_I	ldsha	[%r10, + 0x0056] %asi, %r1
	.word 0xc502801f  ! 953: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfba989f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2911f  ! 957: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcecaa05c  ! 958: LDSBA_I	ldsba	[%r10, + 0x005c] %asi, %r7
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc902e024  ! 960: LDF_I	ld	[%r11, 0x0024], %f4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc922801f  ! 961: STF_R	st	%f4, [%r31, %r10]
	.word 0xd1ba997f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL965:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc902c01f  ! 966: LDF_R	ld	[%r11, %r31], %f4
	.word 0xce52a076  ! 967: LDSH_I	ldsh	[%r10 + 0x0076], %r7
	.word 0xcfba99bf  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcc52a05a  ! 970: LDSH_I	ldsh	[%r10 + 0x005a], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba98bf  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba995f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc49ae050  ! 977: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r2
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d13f  ! 979: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad81f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad83f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc52801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcbbae048  ! 983: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc99aa040  ! 984: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xc3ba995f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 987: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba999f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce92905f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x82, %r7
	.word 0xd1ba981f  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba981f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
TH_LABEL995:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xc922c01f  ! 2: STF_R	st	%f4, [%r31, %r11]
	.word 0xcdba99bf  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba987f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd1bae048  ! 7: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad81f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad83f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd242c01f  ! 13: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc2dae050  ! 14: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r1
	.word 0xc322c01f  ! 15: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad95f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc9baa028  ! 19: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xc722801f  ! 20: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc79ae008  ! 22: LDDFA_I	ldda	[%r11, 0x0008], %f3
	.word 0xc892911f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd09aa068  ! 26: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r8
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcad2d01f  ! 28: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xc3bae008  ! 29: STDFA_I	stda	%f1, [0x0008, %r11]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba991f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba981f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922c01f  ! 34: STF_R	st	%f4, [%r31, %r11]
	.word 0xcbbad83f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc242c01f  ! 36: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xcd02801f  ! 37: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xd302c01f  ! 39: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd1ba991f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba98bf  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc60aa072  ! 43: LDUB_I	ldub	[%r10 + 0x0072], %r3
	.word 0xcbba99bf  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3baa040  ! 46: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd0ca901f  ! 48: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xd3f2d01f  ! 49: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xcd9aa000  ! 50: LDDFA_I	ldda	[%r10, 0x0000], %f6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7f2d03f  ! 51: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad87f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d03f  ! 55: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcada903f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xcbe2d01f  ! 57: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad9bf  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc9aa070  ! 59: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xcfe2901f  ! 60: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502a058  ! 62: LDF_I	ld	[%r10, 0x0058], %f2
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba989f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcd02801f  ! 65: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2911f  ! 66: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd0c2915f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xc5ba997f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6c2903f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xcc8a913f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba991f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc502a05c  ! 74: LDF_I	ld	[%r10, 0x005c], %f2
	.word 0xcc92a044  ! 75: LDUHA_I	lduha	[%r10, + 0x0044] %asi, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc09ae020  ! 76: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r0
	.word 0xcbbad99f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82913f  ! 78: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r6
	.word 0xcfba995f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL80:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba997f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc85a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc41a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc6c2a06c  ! 84: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r3
	.word 0xd3baa008  ! 85: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad99f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc48a903f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x81, %r2
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2901f  ! 89: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba999f  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc642e044  ! 91: LDSW_I	ldsw	[%r11 + 0x0044], %r3
	.word 0xc3f2901f  ! 92: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba98bf  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2901f  ! 99: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd322801f  ! 100: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad89f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc45aa048  ! 105: LDX_I	ldx	[%r10 + 0x0048], %r2
TH_LABEL105:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2901f  ! 106: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc20a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r1
TH_LABEL110:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc81ac01f  ! 111: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd3ba995f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xca42a02c  ! 114: LDSW_I	ldsw	[%r10 + 0x002c], %r5
	.word 0xc5bae068  ! 115: STDFA_I	stda	%f2, [0x0068, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2e000  ! 116: LDSWA_I	ldswa	[%r11, + 0x0000] %asi, %r2
	.word 0xca52801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd252801f  ! 118: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd122801f  ! 119: STF_R	st	%f8, [%r31, %r10]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba981f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc722801f  ! 122: STF_R	st	%f3, [%r31, %r10]
	.word 0xca12801f  ! 123: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc5ba991f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd1baa058  ! 125: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2d2a03a  ! 126: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r1
	.word 0xd282917f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r9
	.word 0xc99aa078  ! 128: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xd3bad87f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6dad17f  ! 131: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r3
	.word 0xcdf2901f  ! 132: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd24aa078  ! 134: LDSB_I	ldsb	[%r10 + 0x0078], %r9
	.word 0xc9e2913f  ! 135: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba98bf  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc302a074  ! 139: LDF_I	ld	[%r10, 0x0074], %f1
	.word 0xcc1aa008  ! 140: LDD_I	ldd	[%r10 + 0x0008], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2913f  ! 141: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc502a028  ! 142: LDF_I	ld	[%r10, 0x0028], %f2
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xcb9aa068  ! 144: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xcd02a018  ! 145: LDF_I	ld	[%r10, 0x0018], %f6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 148: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd3bae040  ! 150: STDFA_I	stda	%f9, [0x0040, %r11]
TH_LABEL150:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd02c01f  ! 151: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc39aa008  ! 152: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc4cad03f  ! 155: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd102801f  ! 156: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfba98bf  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbaa078  ! 161: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xcfe2901f  ! 162: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba999f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc81a801f  ! 166: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc5bae050  ! 167: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xc502a064  ! 168: LDF_I	ld	[%r10, 0x0064], %f2
	.word 0xcdf2911f  ! 169: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcf02e040  ! 170: LDF_I	ld	[%r11, 0x0040], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad81f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc302a048  ! 174: LDF_I	ld	[%r10, 0x0048], %f1
	.word 0xd012a006  ! 175: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bae038  ! 176: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc282e020  ! 178: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r1
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcb02e000  ! 180: LDF_I	ld	[%r11, 0x0000], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad81f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad87f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc9baa070  ! 187: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xc642801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba993f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2903f  ! 193: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xd2c2913f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r9
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd102801f  ! 196: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 199: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2d01f  ! 201: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xce02a018  ! 202: LDUW_I	lduw	[%r10 + 0x0018], %r7
	.word 0xc5ba987f  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 204: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd002801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2913f  ! 206: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc902a02c  ! 207: LDF_I	ld	[%r10, 0x002c], %f4
	.word 0xc252c01f  ! 208: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcfbad97f  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL210:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc24a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba983f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02c01f  ! 216: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd1e2901f  ! 217: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba985f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc24a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xd25ae068  ! 220: LDX_I	ldx	[%r11 + 0x0068], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5baa010  ! 221: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xcc02e04c  ! 222: LDUW_I	lduw	[%r11 + 0x004c], %r6
	.word 0xc702a020  ! 223: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xcbba987f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcedad15f  ! 227: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r7
	.word 0xc702801f  ! 228: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd302c01f  ! 230: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba983f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd0d2e06c  ! 233: LDSHA_I	ldsha	[%r11, + 0x006c] %asi, %r8
	.word 0xc692a070  ! 234: LDUHA_I	lduha	[%r10, + 0x0070] %asi, %r3
	.word 0xcfbaa078  ! 235: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbae018  ! 236: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xcc9aa018  ! 237: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xc502801f  ! 238: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc49ae038  ! 239: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r2
	.word 0xd3ba985f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2913f  ! 241: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xc09ae028  ! 242: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r0
	.word 0xc5ba98bf  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2913f  ! 244: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xcc92e060  ! 245: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba989f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68a913f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x89, %r3
	.word 0xc5baa078  ! 248: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad83f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad89f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d13f  ! 253: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad81f  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad91f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd20a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd202a040  ! 264: LDUW_I	lduw	[%r10 + 0x0040], %r9
	.word 0xc5e2d01f  ! 265: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad9bf  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d13f  ! 269: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad87f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL270:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf9ae050  ! 271: LDDFA_I	ldda	[%r11, 0x0050], %f7
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd3baa010  ! 273: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xcc4a801f  ! 274: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xd1bad97f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL275:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc322801f  ! 276: STF_R	st	%f1, [%r31, %r10]
	.word 0xc682d11f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r3
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc99ae008  ! 279: LDDFA_I	ldda	[%r11, 0x0008], %f4
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba985f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca12a01c  ! 284: LDUH_I	lduh	[%r10 + 0x001c], %r5
	.word 0xcdba989f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc8c2e044  ! 288: LDSWA_I	ldswa	[%r11, + 0x0044] %asi, %r4
	.word 0xcf9aa010  ! 289: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad87f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL295:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad87f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 297: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad91f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 299: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xd102c01f  ! 300: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302a028  ! 301: LDF_I	ld	[%r10, 0x0028], %f1
	.word 0xcec2917f  ! 302: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r7
	.word 0xcc82903f  ! 303: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r6
	.word 0xc4da917f  ! 304: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xcfbaa078  ! 305: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba98bf  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02e00c  ! 307: LDF_I	ld	[%r11, 0x000c], %f5
	.word 0xd1baa060  ! 308: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xc9ba993f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbaa010  ! 310: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba991f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd00a801f  ! 313: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1f2d13f  ! 314: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad91f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL315:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc412a012  ! 316: LDUH_I	lduh	[%r10 + 0x0012], %r2
	.word 0xc902a04c  ! 317: LDF_I	ld	[%r10, 0x004c], %f4
	.word 0xc702801f  ! 318: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc852a060  ! 320: LDSH_I	ldsh	[%r10 + 0x0060], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad89f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad87f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca0ac01f  ! 324: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcfba999f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba989f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc99aa060  ! 327: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xd1bad97f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc4aa052  ! 329: LDSB_I	ldsb	[%r10 + 0x0052], %r6
	.word 0xcf22c01f  ! 330: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5e2913f  ! 331: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2901f  ! 332: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xcc1a801f  ! 333: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc9ba987f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc852801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc302801f  ! 336: LDF_R	ld	[%r10, %r31], %f1
	.word 0xca12801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd3e2d13f  ! 338: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd1baa038  ! 339: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xd1bad85f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad89f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 342: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc2ca915f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r1
	.word 0xc3ba987f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba99bf  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd212a004  ! 347: LDUH_I	lduh	[%r10 + 0x0004], %r9
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa078  ! 349: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc5ba987f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba999f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcd22801f  ! 353: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1bad8bf  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL355:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad89f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad9bf  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc82913f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r6
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcac2e014  ! 364: LDSWA_I	ldswa	[%r11, + 0x0014] %asi, %r5
	.word 0xc282901f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r1
TH_LABEL365:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad97f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 369: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad9bf  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc812a048  ! 371: LDUH_I	lduh	[%r10 + 0x0048], %r4
	.word 0xcfe2901f  ! 372: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2911f  ! 373: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2913f  ! 374: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc902e03c  ! 375: LDF_I	ld	[%r11, 0x003c], %f4
TH_LABEL375:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902a060  ! 376: LDF_I	ld	[%r10, 0x0060], %f4
	.word 0xcbf2911f  ! 377: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xce02801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc40aa07c  ! 379: LDUB_I	ldub	[%r10 + 0x007c], %r2
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702c01f  ! 381: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc9e2901f  ! 382: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xce12801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7ba993f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd25aa020  ! 385: LDX_I	ldx	[%r10 + 0x0020], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d01f  ! 386: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xd102a054  ! 387: LDF_I	ld	[%r10, 0x0054], %f8
	.word 0xc5ba997f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd22801f  ! 389: STF_R	st	%f6, [%r31, %r10]
	.word 0xc842a070  ! 390: LDSW_I	ldsw	[%r10 + 0x0070], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba981f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 392: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc89aa060  ! 393: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xc9bad9bf  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc602e014  ! 395: LDUW_I	lduw	[%r11 + 0x0014], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xce4a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xc5ba989f  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80ae029  ! 399: LDUB_I	ldub	[%r11 + 0x0029], %r4
	.word 0xc3f2d03f  ! 400: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcecaa01d  ! 401: LDSBA_I	ldsba	[%r10, + 0x001d] %asi, %r7
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
TH_LABEL405:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd28a905f  ! 406: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xc9bad81f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca92917f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xc9baa078  ! 410: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2901f  ! 411: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba991f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL415:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2901f  ! 416: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xd00a801f  ! 417: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc9bad93f  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc4c2d05f  ! 419: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r2
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad81f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcad2913f  ! 422: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xc3ba983f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 425: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd242801f  ! 426: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd0d2903f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xcdf2901f  ! 428: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba983f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba981f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 435: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca52801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc41ae040  ! 438: LDD_I	ldd	[%r11 + 0x0040], %r2
	.word 0xd0caa028  ! 439: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r8
	.word 0xcdba99bf  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca82a034  ! 441: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r5
	.word 0xcac2d11f  ! 442: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r5
	.word 0xc7bad81f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad99f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc44ac01f  ! 445: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502801f  ! 446: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcdba981f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 448: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcde2901f  ! 449: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba99bf  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xce82911f  ! 452: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xd3ba981f  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd002e074  ! 455: LDUW_I	lduw	[%r11 + 0x0074], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcdbae048  ! 457: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xc45aa040  ! 458: LDX_I	ldx	[%r10 + 0x0040], %r2
	.word 0xd1ba997f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca8ae045  ! 460: LDUBA_I	lduba	[%r11, + 0x0045] %asi, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502801f  ! 461: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcbba991f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd02a02c  ! 463: LDF_I	ld	[%r10, 0x002c], %f6
	.word 0xcb22801f  ! 464: STF_R	st	%f5, [%r31, %r10]
	.word 0xc59aa030  ! 465: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1baa058  ! 466: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xcbba991f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc802e070  ! 468: LDUW_I	lduw	[%r11 + 0x0070], %r4
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba995f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL470:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xca4aa053  ! 472: LDSB_I	ldsb	[%r10 + 0x0053], %r5
	.word 0xca92911f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d01f  ! 475: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcff2d01f  ! 476: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcacaa049  ! 478: LDSBA_I	ldsba	[%r10, + 0x0049] %asi, %r5
	.word 0xccdaa008  ! 479: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r6
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2ca901f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xc2d2d01f  ! 482: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xcfbad83f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
TH_LABEL485:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc4aa009  ! 486: LDSB_I	ldsb	[%r10 + 0x0009], %r6
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca82a044  ! 488: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r5
	.word 0xc80ae026  ! 489: LDUB_I	ldub	[%r11 + 0x0026], %r4
	.word 0xc99ae020  ! 490: LDDFA_I	ldda	[%r11, 0x0020], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba981f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc81aa040  ! 493: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xccca901f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xc39ae060  ! 495: LDDFA_I	ldda	[%r11, 0x0060], %f1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bae050  ! 496: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xcbbad83f  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 498: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc5baa000  ! 500: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2913f  ! 501: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba999f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xccdae028  ! 507: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r6
	.word 0xc292911f  ! 508: LDUHA_R	lduha	[%r10, %r31] 0x88, %r1
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad93f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad87f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc5bae008  ! 512: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xc3f2911f  ! 513: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba99bf  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd19ae060  ! 515: LDDFA_I	ldda	[%r11, 0x0060], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad8bf  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc9aa020  ! 518: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xcdbaa058  ! 519: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xc412801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8c2907f  ! 521: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r4
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc59ae040  ! 523: LDDFA_I	ldda	[%r11, 0x0040], %f2
	.word 0xc292d11f  ! 524: LDUHA_R	lduha	[%r11, %r31] 0x88, %r1
	.word 0xcbba991f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6d2e07a  ! 526: LDSHA_I	ldsha	[%r11, + 0x007a] %asi, %r3
	.word 0xcdba997f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 528: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc84ae03f  ! 529: LDSB_I	ldsb	[%r11 + 0x003f], %r4
	.word 0xd3bad81f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL530:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3f2d03f  ! 531: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xcc5ac01f  ! 533: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xd0daa038  ! 534: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xcfba989f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba985f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2903f  ! 539: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba99bf  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL540:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce8ae004  ! 541: LDUBA_I	lduba	[%r11, + 0x0004] %asi, %r7
	.word 0xd01ae078  ! 542: LDD_I	ldd	[%r11 + 0x0078], %r8
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca52801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd05a801f  ! 547: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc5bad97f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc41aa040  ! 550: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc922801f  ! 551: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3bad81f  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcedad11f  ! 553: LDXA_R	ldxa	[%r11, %r31] 0x88, %r7
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2903f  ! 556: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xd24a801f  ! 557: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc2caa046  ! 558: LDSBA_I	ldsba	[%r10, + 0x0046] %asi, %r1
	.word 0xd1ba991f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc652a000  ! 560: LDSH_I	ldsh	[%r10 + 0x0000], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba999f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba995f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca0a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb02c01f  ! 566: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5f2913f  ! 567: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba993f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc45ae018  ! 571: LDX_I	ldx	[%r11 + 0x0018], %r2
	.word 0xc3ba995f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc602801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc7ba987f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd24aa04f  ! 576: LDSB_I	ldsb	[%r10 + 0x004f], %r9
	.word 0xc64ac01f  ! 577: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xcb9ae058  ! 578: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xc3bad8bf  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xcc0ae02d  ! 583: LDUB_I	ldub	[%r11 + 0x002d], %r6
	.word 0xc492a030  ! 584: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r2
	.word 0xcff2913f  ! 585: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
TH_LABEL585:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf9aa068  ! 586: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd08a905f  ! 589: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xcbe2d01f  ! 590: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad99f  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc80a801f  ! 592: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xcbbaa010  ! 593: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xc39ae030  ! 594: LDDFA_I	ldda	[%r11, 0x0030], %f1
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
TH_LABEL595:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd092913f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xc212801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc9f2901f  ! 599: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba995f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd22801f  ! 602: STF_R	st	%f6, [%r31, %r10]
	.word 0xc79aa048  ! 603: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xc99ae060  ! 604: LDDFA_I	ldda	[%r11, 0x0060], %f4
	.word 0xc7bad85f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL605:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc842e000  ! 606: LDSW_I	ldsw	[%r11 + 0x0000], %r4
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad99f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca92917f  ! 611: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xd302c01f  ! 612: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc642801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xcfba989f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd282e000  ! 615: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc41a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba99bf  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xca12e076  ! 620: LDUH_I	lduh	[%r11 + 0x0076], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc1ac01f  ! 621: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xce5ae050  ! 622: LDX_I	ldx	[%r11 + 0x0050], %r7
	.word 0xcb02a008  ! 623: LDF_I	ld	[%r10, 0x0008], %f5
	.word 0xcdba989f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa040  ! 625: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbae040  ! 626: STDFA_I	stda	%f6, [0x0040, %r11]
	.word 0xc692903f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x81, %r3
	.word 0xc292a02a  ! 628: LDUHA_I	lduha	[%r10, + 0x002a] %asi, %r1
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc252a018  ! 630: LDSH_I	ldsh	[%r10 + 0x0018], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba981f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2903f  ! 633: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2913f  ! 634: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba999f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba985f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1aa078  ! 637: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xc9bad97f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccd2a05e  ! 639: LDSHA_I	ldsha	[%r10, + 0x005e] %asi, %r6
	.word 0xcdba98bf  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba993f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8caa064  ! 642: LDSBA_I	ldsba	[%r10, + 0x0064] %asi, %r4
	.word 0xd3ba98bf  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba997f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 649: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xc3baa000  ! 650: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bae070  ! 651: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc59ae050  ! 653: LDDFA_I	ldda	[%r11, 0x0050], %f2
	.word 0xce8aa051  ! 654: LDUBA_I	lduba	[%r10, + 0x0051] %asi, %r7
	.word 0xc9baa058  ! 655: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc302c01f  ! 656: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3f2913f  ! 657: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL660:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba997f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd1baa030  ! 662: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xce82a014  ! 663: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r7
	.word 0xd09aa048  ! 664: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xd19aa058  ! 667: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xcbf2903f  ! 668: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba99bf  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccd2e018  ! 671: LDSHA_I	ldsha	[%r11, + 0x0018] %asi, %r6
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad95f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d13f  ! 675: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce12801f  ! 676: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc80ae018  ! 677: LDUB_I	ldub	[%r11 + 0x0018], %r4
	.word 0xc3ba983f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcec2a07c  ! 681: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r7
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd1baa048  ! 683: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xcbba987f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 685: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc212a058  ! 686: LDUH_I	lduh	[%r10 + 0x0058], %r1
	.word 0xcb02a00c  ! 687: LDF_I	ld	[%r10, 0x000c], %f5
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL690:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba993f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc1ac01f  ! 693: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfba985f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc89ae060  ! 696: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r4
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca5ae008  ! 698: LDX_I	ldx	[%r11 + 0x0008], %r5
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad87f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd102e024  ! 702: LDF_I	ld	[%r11, 0x0024], %f8
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc452a04e  ! 704: LDSH_I	ldsh	[%r10 + 0x004e], %r2
	.word 0xc3bae028  ! 705: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad8bf  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc3baa030  ! 707: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xc65aa000  ! 708: LDX_I	ldx	[%r10 + 0x0000], %r3
	.word 0xd302801f  ! 709: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba99bf  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc902801f  ! 711: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcc1a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcdba985f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc89ae038  ! 716: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r4
	.word 0xc5ba997f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 720: CASA_I	casa	[%r10] 0x88, %r31, %r2
TH_LABEL720:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc882907f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xd122801f  ! 722: STF_R	st	%f8, [%r31, %r10]
	.word 0xc2ca913f  ! 723: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r1
	.word 0xc41a801f  ! 724: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcfbad85f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc45a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc99aa000  ! 730: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca82e050  ! 731: LDUWA_I	lduwa	[%r11, + 0x0050] %asi, %r5
	.word 0xc612a004  ! 732: LDUH_I	lduh	[%r10 + 0x0004], %r3
	.word 0xc502c01f  ! 733: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcf02801f  ! 734: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba991f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd24ae03f  ! 739: LDSB_I	ldsb	[%r11 + 0x003f], %r9
	.word 0xcedae050  ! 740: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4d2905f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xc7baa028  ! 742: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xc3bad83f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca0aa06c  ! 744: LDUB_I	ldub	[%r10 + 0x006c], %r5
	.word 0xcf02e074  ! 745: LDF_I	ld	[%r11, 0x0074], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccd2e062  ! 746: LDSHA_I	ldsha	[%r11, + 0x0062] %asi, %r6
	.word 0xc642a004  ! 747: LDSW_I	ldsw	[%r10 + 0x0004], %r3
	.word 0xcbbaa010  ! 748: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
TH_LABEL750:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad91f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc3bae010  ! 752: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xd3bad81f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad8bf  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc39aa048  ! 759: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xd00aa022  ! 760: LDUB_I	ldub	[%r10 + 0x0022], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd282a01c  ! 762: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r9
	.word 0xd3f2901f  ! 763: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba991f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba993f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc48aa059  ! 767: LDUBA_I	lduba	[%r10, + 0x0059] %asi, %r2
	.word 0xd092a060  ! 768: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r8
	.word 0xc48ad15f  ! 769: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r2
	.word 0xc44aa028  ! 770: LDSB_I	ldsb	[%r10 + 0x0028], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd22c01f  ! 771: STF_R	st	%f6, [%r31, %r11]
	.word 0xcdba987f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc402801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc4da917f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
TH_LABEL775:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd102801f  ! 780: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d13f  ! 782: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad8bf  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc6caa03a  ! 786: LDSBA_I	ldsba	[%r10, + 0x003a] %asi, %r3
	.word 0xc4c2903f  ! 787: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r2
	.word 0xcbbad89f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41ac01f  ! 789: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
TH_LABEL790:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad8bf  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc65ae040  ! 794: LDX_I	ldx	[%r11 + 0x0040], %r3
	.word 0xc9e2d11f  ! 795: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bad81f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02a034  ! 799: LDF_I	ld	[%r10, 0x0034], %f5
	.word 0xce82d03f  ! 800: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc09aa010  ! 801: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r0
	.word 0xc59aa078  ! 802: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xd39ae060  ! 803: LDDFA_I	ldda	[%r11, 0x0060], %f9
	.word 0xcb22801f  ! 804: STF_R	st	%f5, [%r31, %r10]
	.word 0xcdba993f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba999f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd1baa068  ! 808: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xd28a911f  ! 809: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xcbe2d03f  ! 810: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad99f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd39aa040  ! 812: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad85f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc52801f  ! 815: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2913f  ! 816: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc842a044  ! 817: LDSW_I	ldsw	[%r10 + 0x0044], %r4
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd20aa008  ! 819: LDUB_I	ldub	[%r10 + 0x0008], %r9
	.word 0xcf22801f  ! 820: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba985f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9ae000  ! 823: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r6
	.word 0xc442801f  ! 824: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc9bad81f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd292905f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x82, %r9
	.word 0xc81ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcf9aa000  ! 828: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc902c01f  ! 829: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL830:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2d13f  ! 831: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad89f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 834: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0ca907f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r8
	.word 0xc6cae026  ! 837: LDSBA_I	ldsba	[%r11, + 0x0026] %asi, %r3
	.word 0xcfbad91f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc39aa038  ! 839: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xcdba985f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcec2a078  ! 843: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r7
	.word 0xca02801f  ! 844: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc522801f  ! 846: STF_R	st	%f2, [%r31, %r10]
	.word 0xc7ba989f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 849: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xd282901f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd012a00e  ! 851: LDUH_I	lduh	[%r10 + 0x000e], %r8
	.word 0xd1bad95f  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 853: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad8bf  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d03f  ! 859: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad81f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902801f  ! 861: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc3ba997f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd202801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xd0c2e008  ! 868: LDSWA_I	ldswa	[%r11, + 0x0008] %asi, %r8
	.word 0xc68a901f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba98bf  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd20ae016  ! 872: LDUB_I	ldub	[%r11 + 0x0016], %r9
	.word 0xca42801f  ! 873: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7ba98bf  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba981f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 877: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2903f  ! 880: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba989f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd102c01f  ! 884: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad85f  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc59aa010  ! 889: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xc7bad97f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7bad8bf  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcb22c01f  ! 894: STF_R	st	%f5, [%r31, %r11]
	.word 0xc5bad83f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad95f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad95f  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc212c01f  ! 900: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad81f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d13f  ! 904: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad85f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad95f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc65aa018  ! 908: LDX_I	ldx	[%r10 + 0x0018], %r3
	.word 0xcd22801f  ! 909: STF_R	st	%f6, [%r31, %r10]
	.word 0xd102e010  ! 910: LDF_I	ld	[%r11, 0x0010], %f8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbaa030  ! 911: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcec2a010  ! 913: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r7
	.word 0xc3ba993f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2903f  ! 916: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd08ad05f  ! 918: LDUBA_R	lduba	[%r11, %r31] 0x82, %r8
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba999f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb02801f  ! 921: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd212e026  ! 922: LDUH_I	lduh	[%r11 + 0x0026], %r9
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2913f  ! 925: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce12801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd1ba983f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc802e064  ! 928: LDUW_I	lduw	[%r11 + 0x0064], %r4
	.word 0xd3bad97f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc492e060  ! 931: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r2
	.word 0xc412a03c  ! 932: LDUH_I	lduh	[%r10 + 0x003c], %r2
	.word 0xd39aa038  ! 933: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xcdba991f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc692901f  ! 936: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xc3e2d13f  ! 937: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc68aa061  ! 938: LDUBA_I	lduba	[%r10, + 0x0061] %asi, %r3
	.word 0xd212a07e  ! 939: LDUH_I	lduh	[%r10 + 0x007e], %r9
	.word 0xc802a07c  ! 940: LDUW_I	lduw	[%r10 + 0x007c], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad91f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xcf02a038  ! 944: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad87f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc9bae070  ! 947: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xccc2a014  ! 948: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r6
	.word 0xcc8a907f  ! 949: LDUBA_R	lduba	[%r10, %r31] 0x83, %r6
	.word 0xc9ba997f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xced2a01a  ! 952: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r7
	.word 0xd102c01f  ! 953: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcfba995f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2913f  ! 957: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xd0cae03d  ! 958: LDSBA_I	ldsba	[%r11, + 0x003d] %asi, %r8
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc902e020  ! 960: LDF_I	ld	[%r11, 0x0020], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc922801f  ! 961: STF_R	st	%f4, [%r31, %r10]
	.word 0xd1ba997f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc302801f  ! 966: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc852a02e  ! 967: LDSH_I	ldsh	[%r10 + 0x002e], %r4
	.word 0xcfba981f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xce52a04a  ! 970: LDSH_I	ldsh	[%r10 + 0x004a], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba985f  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba981f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL975:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc89aa008  ! 977: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r4
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d01f  ! 979: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad95f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad95f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc52801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd1baa000  ! 983: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xd19ae048  ! 984: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xc3ba999f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2911f  ! 987: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba987f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc492901f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xd1ba98bf  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba987f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba999f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL1000:
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
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcb22c01f  ! 2: STF_R	st	%f5, [%r31, %r11]
	.word 0xcdba999f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba985f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa040  ! 7: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad89f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad91f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd042c01f  ! 13: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc8daa020  ! 14: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r4
	.word 0xcf22801f  ! 15: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad89f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc5baa058  ! 19: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xcb22c01f  ! 20: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd39aa030  ! 22: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xc892903f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x81, %r4
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc49aa010  ! 26: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8d2901f  ! 28: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xcbbaa068  ! 29: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba985f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba997f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922c01f  ! 34: STF_R	st	%f4, [%r31, %r11]
	.word 0xcbbad8bf  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc242801f  ! 36: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc302801f  ! 37: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xc902801f  ! 39: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd1ba983f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba995f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd20ae058  ! 43: LDUB_I	ldub	[%r11 + 0x0058], %r9
	.word 0xcbba981f  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbaa028  ! 46: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd0ca915f  ! 48: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xd3f2d01f  ! 49: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc99aa050  ! 50: LDDFA_I	ldda	[%r10, 0x0050], %f4
TH_LABEL50:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2d01f  ! 51: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad85f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d11f  ! 55: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0da913f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x89, %r8
	.word 0xcbe2d13f  ! 57: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad97f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc89ae010  ! 59: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r4
	.word 0xcfe2911f  ! 60: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba983f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf02a07c  ! 62: LDF_I	ld	[%r10, 0x007c], %f7
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba997f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc502801f  ! 65: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2913f  ! 66: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcac2901f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc5ba981f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcac2907f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r5
	.word 0xca8a903f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba983f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd102e030  ! 74: LDF_I	ld	[%r11, 0x0030], %f8
	.word 0xd292e054  ! 75: LDUHA_I	lduha	[%r11, + 0x0054] %asi, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc09ae078  ! 76: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r0
	.word 0xcbbad89f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd282d11f  ! 78: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r9
	.word 0xcfba995f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba999f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc45a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc41a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcac2a038  ! 84: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r5
	.word 0xc3baa028  ! 85: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad95f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca8a913f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x89, %r5
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2901f  ! 89: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba991f  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc242a02c  ! 91: LDSW_I	ldsw	[%r10 + 0x002c], %r1
	.word 0xc3f2911f  ! 92: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba999f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2911f  ! 99: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcb22801f  ! 100: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad99f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd05aa008  ! 105: LDX_I	ldx	[%r10 + 0x0008], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2901f  ! 106: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba991f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd00a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc1a801f  ! 111: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3ba981f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc442a070  ! 114: LDSW_I	ldsw	[%r10 + 0x0070], %r2
	.word 0xcdbaa038  ! 115: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc8c2e020  ! 116: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r4
	.word 0xce52c01f  ! 117: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xca52801f  ! 118: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xcd22c01f  ! 119: STF_R	st	%f6, [%r31, %r11]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba999f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd322801f  ! 122: STF_R	st	%f9, [%r31, %r10]
	.word 0xc212801f  ! 123: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc5ba99bf  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc9bae048  ! 125: STDFA_I	stda	%f4, [0x0048, %r11]
TH_LABEL125:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xced2e032  ! 126: LDSHA_I	ldsha	[%r11, + 0x0032] %asi, %r7
	.word 0xce82d01f  ! 127: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r7
	.word 0xc39aa018  ! 128: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xd3bad81f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc8da915f  ! 131: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r4
	.word 0xcdf2911f  ! 132: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc24aa077  ! 134: LDSB_I	ldsb	[%r10 + 0x0077], %r1
	.word 0xc9e2901f  ! 135: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba997f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc902e01c  ! 139: LDF_I	ld	[%r11, 0x001c], %f4
	.word 0xd01ae020  ! 140: LDD_I	ldd	[%r11 + 0x0020], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2913f  ! 141: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc702e064  ! 142: LDF_I	ld	[%r11, 0x0064], %f3
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xd19ae020  ! 144: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xcb02a020  ! 145: LDF_I	ld	[%r10, 0x0020], %f5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 148: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc5bae008  ! 150: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd02801f  ! 151: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc59aa078  ! 152: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcaca911f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcb02801f  ! 156: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba995f  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3bae038  ! 161: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xcfe2911f  ! 162: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba995f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba991f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc01a801f  ! 166: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc5bae020  ! 167: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xd102e04c  ! 168: LDF_I	ld	[%r11, 0x004c], %f8
	.word 0xcdf2901f  ! 169: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc502a01c  ! 170: LDF_I	ld	[%r10, 0x001c], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7bad81f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcb02a004  ! 174: LDF_I	ld	[%r10, 0x0004], %f5
	.word 0xd212a066  ! 175: LDUH_I	lduh	[%r10 + 0x0066], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bae060  ! 176: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd082a008  ! 178: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r8
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc302a03c  ! 180: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad89f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad95f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfbae060  ! 187: STDFA_I	stda	%f7, [0x0060, %r11]
	.word 0xc842801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba993f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2901f  ! 193: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd2c2903f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r9
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02c01f  ! 196: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad87f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 199: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
TH_LABEL200:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2d03f  ! 201: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcc02a02c  ! 202: LDUW_I	lduw	[%r10 + 0x002c], %r6
	.word 0xc5ba987f  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 204: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc802801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2901f  ! 206: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc702a06c  ! 207: LDF_I	ld	[%r10, 0x006c], %f3
	.word 0xc852c01f  ! 208: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xcfbad9bf  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd24a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc302801f  ! 216: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1e2903f  ! 217: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba985f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca4a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xca5ae018  ! 220: LDX_I	ldx	[%r11 + 0x0018], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9baa048  ! 221: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xd202e060  ! 222: LDUW_I	lduw	[%r11 + 0x0060], %r9
	.word 0xc902e074  ! 223: LDF_I	ld	[%r11, 0x0074], %f4
	.word 0xcbba987f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd2da917f  ! 227: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xd102801f  ! 228: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc302c01f  ! 230: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba98bf  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd0d2a078  ! 233: LDSHA_I	ldsha	[%r10, + 0x0078] %asi, %r8
	.word 0xc492a00e  ! 234: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r2
	.word 0xc3baa060  ! 235: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bae048  ! 236: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xc89aa010  ! 237: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xc302801f  ! 238: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc89aa070  ! 239: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r4
	.word 0xd3ba995f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2903f  ! 241: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd09ae038  ! 242: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r8
	.word 0xc5ba985f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 244: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc892a00a  ! 245: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba981f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68a915f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r3
	.word 0xcdbaa058  ! 248: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad81f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad9bf  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d03f  ! 253: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad93f  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL255:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad83f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc80a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba991f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc602e020  ! 264: LDUW_I	lduw	[%r11 + 0x0020], %r3
	.word 0xc5e2d13f  ! 265: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad99f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d03f  ! 269: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad95f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd9aa050  ! 271: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xcdbae000  ! 273: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xc44a801f  ! 274: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd1bad83f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf22801f  ! 276: STF_R	st	%f7, [%r31, %r10]
	.word 0xca82911f  ! 277: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r5
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcb9ae018  ! 279: LDDFA_I	ldda	[%r11, 0x0018], %f5
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba991f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc212a068  ! 284: LDUH_I	lduh	[%r10 + 0x0068], %r1
	.word 0xcdba997f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc8c2e030  ! 288: LDSWA_I	ldswa	[%r11, + 0x0030] %asi, %r4
	.word 0xcf9aa000  ! 289: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad99f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad97f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 297: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad93f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 299: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc502c01f  ! 300: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd302a014  ! 301: LDF_I	ld	[%r10, 0x0014], %f9
	.word 0xc4c2907f  ! 302: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r2
	.word 0xc682901f  ! 303: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xd0da911f  ! 304: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xd3bae028  ! 305: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba987f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02a050  ! 307: LDF_I	ld	[%r10, 0x0050], %f5
	.word 0xcfbaa010  ! 308: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xc9ba981f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd1baa040  ! 310: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba985f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd00ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1f2d11f  ! 314: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad95f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce12a00a  ! 316: LDUH_I	lduh	[%r10 + 0x000a], %r7
	.word 0xc702a05c  ! 317: LDF_I	ld	[%r10, 0x005c], %f3
	.word 0xd302801f  ! 318: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xce52a066  ! 320: LDSH_I	ldsh	[%r10 + 0x0066], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad89f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad81f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca0ac01f  ! 324: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcfba997f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba981f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd9ae000  ! 327: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xd1bad97f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce4ae04c  ! 329: LDSB_I	ldsb	[%r11 + 0x004c], %r7
	.word 0xc322801f  ! 330: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2911f  ! 332: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xcc1ac01f  ! 333: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc9ba983f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc252c01f  ! 335: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc302801f  ! 336: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc212801f  ! 337: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd3e2d13f  ! 338: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xc5baa078  ! 339: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xd1bad95f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad99f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 342: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd2cad13f  ! 343: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r9
	.word 0xc3ba985f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba981f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd012e002  ! 347: LDUH_I	lduh	[%r11 + 0x0002], %r8
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa030  ! 349: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc5ba991f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba999f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd322c01f  ! 353: STF_R	st	%f9, [%r31, %r11]
	.word 0xd1bad9bf  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad8bf  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad99f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc82901f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd0c2e014  ! 364: LDSWA_I	ldswa	[%r11, + 0x0014] %asi, %r8
	.word 0xd082d17f  ! 365: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad83f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 369: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad99f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc612a07a  ! 371: LDUH_I	lduh	[%r10 + 0x007a], %r3
	.word 0xcfe2911f  ! 372: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2901f  ! 373: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2901f  ! 374: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc302a040  ! 375: LDF_I	ld	[%r10, 0x0040], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc302e040  ! 376: LDF_I	ld	[%r11, 0x0040], %f1
	.word 0xcbf2901f  ! 377: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xce02c01f  ! 378: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcc0aa072  ! 379: LDUB_I	ldub	[%r10 + 0x0072], %r6
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502801f  ! 381: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc9e2903f  ! 382: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xce12c01f  ! 383: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xc7ba999f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc25ae018  ! 385: LDX_I	ldx	[%r11 + 0x0018], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d11f  ! 386: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xcf02e034  ! 387: LDF_I	ld	[%r11, 0x0034], %f7
	.word 0xc5ba999f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc722801f  ! 389: STF_R	st	%f3, [%r31, %r10]
	.word 0xc442a034  ! 390: LDSW_I	ldsw	[%r10 + 0x0034], %r2
TH_LABEL390:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba993f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 392: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcc9aa040  ! 393: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r6
	.word 0xc9bad89f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd002a070  ! 395: LDUW_I	lduw	[%r10 + 0x0070], %r8
TH_LABEL395:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xd04a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc5ba98bf  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80aa014  ! 399: LDUB_I	ldub	[%r10 + 0x0014], %r4
	.word 0xc3f2d11f  ! 400: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcccaa004  ! 401: LDSBA_I	ldsba	[%r10, + 0x0004] %asi, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce8ad17f  ! 406: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r7
	.word 0xc9bad83f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd292903f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xc9bae010  ! 410: STDFA_I	stda	%f4, [0x0010, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2903f  ! 411: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2901f  ! 416: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xd20a801f  ! 417: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc9bad97f  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd0c2911f  ! 419: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r8
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad81f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6d2d15f  ! 422: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r3
	.word 0xc3ba985f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 425: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca42c01f  ! 426: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc2d2917f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r1
	.word 0xcdf2901f  ! 428: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba995f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba997f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 435: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc652c01f  ! 436: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcc1aa028  ! 438: LDD_I	ldd	[%r10 + 0x0028], %r6
	.word 0xc4caa01c  ! 439: LDSBA_I	ldsba	[%r10, + 0x001c] %asi, %r2
	.word 0xcdba985f  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc282a018  ! 441: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r1
	.word 0xd0c2917f  ! 442: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xc7bad85f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc4ac01f  ! 445: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd102801f  ! 446: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcdba981f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 448: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcde2913f  ! 449: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba98bf  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc882907f  ! 452: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xd3ba98bf  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc802a040  ! 455: LDUW_I	lduw	[%r10 + 0x0040], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc7baa078  ! 457: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc45ae010  ! 458: LDX_I	ldx	[%r11 + 0x0010], %r2
	.word 0xd1ba987f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8aa00b  ! 460: LDUBA_I	lduba	[%r10, + 0x000b] %asi, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc502801f  ! 461: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcbba981f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02a064  ! 463: LDF_I	ld	[%r10, 0x0064], %f7
	.word 0xd122801f  ! 464: STF_R	st	%f8, [%r31, %r10]
	.word 0xcd9aa010  ! 465: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bae008  ! 466: STDFA_I	stda	%f3, [0x0008, %r11]
	.word 0xcbba989f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca02a070  ! 468: LDUW_I	lduw	[%r10 + 0x0070], %r5
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba987f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc4ae050  ! 472: LDSB_I	ldsb	[%r11 + 0x0050], %r6
	.word 0xd092901f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d01f  ! 475: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2d11f  ! 476: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcecae070  ! 478: LDSBA_I	ldsba	[%r11, + 0x0070] %asi, %r7
	.word 0xccdae070  ! 479: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r6
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL480:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4ca913f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xd2d2917f  ! 482: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r9
	.word 0xcfbad81f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce4aa067  ! 486: LDSB_I	ldsb	[%r10 + 0x0067], %r7
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc282a008  ! 488: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r1
	.word 0xcc0aa029  ! 489: LDUB_I	ldub	[%r10 + 0x0029], %r6
	.word 0xcd9aa078  ! 490: LDDFA_I	ldda	[%r10, 0x0078], %f6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba993f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc1ae060  ! 493: LDD_I	ldd	[%r11 + 0x0060], %r6
	.word 0xd2ca915f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xc99ae000  ! 495: LDDFA_I	ldda	[%r11, 0x0000], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bae048  ! 496: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xcbbad8bf  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 498: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd1baa008  ! 500: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2903f  ! 501: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba987f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd2dae058  ! 507: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r9
	.word 0xca92911f  ! 508: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad85f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3bad95f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd1baa028  ! 512: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xc3f2901f  ! 513: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba995f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa030  ! 515: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad97f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc9aa058  ! 518: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r6
	.word 0xd3baa040  ! 519: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xcc12801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2c2d05f  ! 521: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r9
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd39aa038  ! 523: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc292901f  ! 524: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xcbba981f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2d2a03e  ! 526: LDSHA_I	ldsha	[%r10, + 0x003e] %asi, %r9
	.word 0xcdba983f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 528: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xce4ae039  ! 529: LDSB_I	ldsb	[%r11 + 0x0039], %r7
	.word 0xd3bad81f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2d01f  ! 531: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xc65a801f  ! 533: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd0daa050  ! 534: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r8
	.word 0xcfba991f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba989f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 539: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba993f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc48aa01a  ! 541: LDUBA_I	lduba	[%r10, + 0x001a] %asi, %r2
	.word 0xcc1aa018  ! 542: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba991f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd052801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd25a801f  ! 547: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5bad81f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xd01aa000  ! 550: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb22c01f  ! 551: STF_R	st	%f5, [%r31, %r11]
	.word 0xd3bad85f  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0dad03f  ! 553: LDXA_R	ldxa	[%r11, %r31] 0x81, %r8
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
TH_LABEL555:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2913f  ! 556: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xcc4ac01f  ! 557: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc8cae008  ! 558: LDSBA_I	ldsba	[%r11, + 0x0008] %asi, %r4
	.word 0xd1ba997f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc852a06e  ! 560: LDSH_I	ldsh	[%r10 + 0x006e], %r4
TH_LABEL560:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba999f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba993f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02c01f  ! 566: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba991f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL570:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc65aa028  ! 571: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xc3ba981f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc202801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc7ba999f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL575:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc4ae078  ! 576: LDSB_I	ldsb	[%r11 + 0x0078], %r6
	.word 0xcc4a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xcd9ae078  ! 578: LDDFA_I	ldda	[%r11, 0x0078], %f6
	.word 0xc3bad95f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc80aa017  ! 583: LDUB_I	ldub	[%r10 + 0x0017], %r4
	.word 0xc692a024  ! 584: LDUHA_I	lduha	[%r10, + 0x0024] %asi, %r3
	.word 0xcff2911f  ! 585: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf9ae078  ! 586: LDDFA_I	ldda	[%r11, 0x0078], %f7
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd28a913f  ! 589: LDUBA_R	lduba	[%r10, %r31] 0x89, %r9
	.word 0xcbe2d03f  ! 590: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad9bf  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc80a801f  ! 592: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc3baa078  ! 593: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xc99aa050  ! 594: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc492901f  ! 597: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xce12801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc9f2913f  ! 599: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba983f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba989f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd322801f  ! 602: STF_R	st	%f9, [%r31, %r10]
	.word 0xc99aa068  ! 603: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xcf9ae058  ! 604: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xc7bad89f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd242e040  ! 606: LDSW_I	ldsw	[%r11 + 0x0040], %r9
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce92911f  ! 611: LDUHA_R	lduha	[%r10, %r31] 0x88, %r7
	.word 0xc502801f  ! 612: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca42801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcfba993f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc282a028  ! 615: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r1
TH_LABEL615:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc81a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba983f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xc812a068  ! 620: LDUH_I	lduh	[%r10 + 0x0068], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc81a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc85aa060  ! 622: LDX_I	ldx	[%r10 + 0x0060], %r4
	.word 0xc502a004  ! 623: LDF_I	ld	[%r10, 0x0004], %f2
	.word 0xcdba999f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc3baa060  ! 625: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbaa008  ! 626: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xc892911f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xce92e01a  ! 628: LDUHA_I	lduha	[%r11, + 0x001a] %asi, %r7
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd052a04e  ! 630: LDSH_I	ldsh	[%r10 + 0x004e], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba983f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2901f  ! 633: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2901f  ! 634: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba99bf  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL635:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba981f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41aa000  ! 637: LDD_I	ldd	[%r10 + 0x0000], %r2
	.word 0xc9bad95f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc4d2a01c  ! 639: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r2
	.word 0xcdba99bf  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba997f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc2caa061  ! 642: LDSBA_I	ldsba	[%r10, + 0x0061] %asi, %r1
	.word 0xd3ba983f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 645: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba989f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 649: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcdbaa028  ! 650: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbae030  ! 651: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd39aa050  ! 653: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xd28aa00c  ! 654: LDUBA_I	lduba	[%r10, + 0x000c] %asi, %r9
	.word 0xc9baa060  ! 655: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd02c01f  ! 656: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3f2913f  ! 657: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba999f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa040  ! 662: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xcc82a040  ! 663: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r6
	.word 0xcc9aa048  ! 664: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xd19aa078  ! 667: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xcbf2913f  ! 668: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL670:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xccd2a066  ! 671: LDSHA_I	ldsha	[%r10, + 0x0066] %asi, %r6
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad91f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 675: CASA_I	casa	[%r11] 0x80, %r31, %r1
TH_LABEL675:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc212801f  ! 676: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc20aa050  ! 677: LDUB_I	ldub	[%r10 + 0x0050], %r1
	.word 0xc3ba987f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcec2a040  ! 681: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r7
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd3baa028  ! 683: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xcbba981f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc722801f  ! 685: STF_R	st	%f3, [%r31, %r10]
TH_LABEL685:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd212a06e  ! 686: LDUH_I	lduh	[%r10 + 0x006e], %r9
	.word 0xcf02a034  ! 687: LDF_I	ld	[%r10, 0x0034], %f7
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba989f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xd01a801f  ! 693: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfba991f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09ae048  ! 696: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce5aa040  ! 698: LDX_I	ldx	[%r10 + 0x0040], %r7
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad97f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd102e004  ! 702: LDF_I	ld	[%r11, 0x0004], %f8
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xca52e06a  ! 704: LDSH_I	ldsh	[%r11 + 0x006a], %r5
	.word 0xc7bae070  ! 705: STDFA_I	stda	%f3, [0x0070, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad85f  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcfbaa000  ! 707: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xd05aa030  ! 708: LDX_I	ldx	[%r10 + 0x0030], %r8
	.word 0xc302801f  ! 709: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcfba991f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302801f  ! 711: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd01a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcdba981f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 715: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc9aa000  ! 716: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r6
	.word 0xc5ba987f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 720: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd082d01f  ! 721: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xcb22801f  ! 722: STF_R	st	%f5, [%r31, %r10]
	.word 0xcecad17f  ! 723: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r7
	.word 0xc01ac01f  ! 724: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xcfbad8bf  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc85a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba99bf  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf9ae020  ! 730: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc82a064  ! 731: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r6
	.word 0xc412a006  ! 732: LDUH_I	lduh	[%r10 + 0x0006], %r2
	.word 0xd102c01f  ! 733: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc302801f  ! 734: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba987f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd04ae00c  ! 739: LDSB_I	ldsb	[%r11 + 0x000c], %r8
	.word 0xc8dae028  ! 740: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r4
TH_LABEL740:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0d2901f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xc9bae070  ! 742: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xc3bad95f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc60ae040  ! 744: LDUB_I	ldub	[%r11 + 0x0040], %r3
	.word 0xcd02e020  ! 745: LDF_I	ld	[%r11, 0x0020], %f6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xced2e002  ! 746: LDSHA_I	ldsha	[%r11, + 0x0002] %asi, %r7
	.word 0xd242e030  ! 747: LDSW_I	ldsw	[%r11 + 0x0030], %r9
	.word 0xc3bae040  ! 748: STDFA_I	stda	%f1, [0x0040, %r11]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad83f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc9baa000  ! 752: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xd3bad97f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad85f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcb9aa078  ! 759: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xc60ae029  ! 760: LDUB_I	ldub	[%r11 + 0x0029], %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd082a034  ! 762: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r8
	.word 0xd3f2903f  ! 763: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba981f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL765:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba985f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd28ae059  ! 767: LDUBA_I	lduba	[%r11, + 0x0059] %asi, %r9
	.word 0xd092a034  ! 768: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r8
	.word 0xcc8a901f  ! 769: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xc44aa023  ! 770: LDSB_I	ldsb	[%r10 + 0x0023], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc722801f  ! 771: STF_R	st	%f3, [%r31, %r10]
	.word 0xcdba993f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc802801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc4dad07f  ! 775: LDXA_R	ldxa	[%r11, %r31] 0x83, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcb02801f  ! 780: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d01f  ! 782: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad83f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4cae05c  ! 786: LDSBA_I	ldsba	[%r11, + 0x005c] %asi, %r2
	.word 0xd0c2911f  ! 787: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r8
	.word 0xcbbad99f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc81a801f  ! 789: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad95f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce5aa020  ! 794: LDX_I	ldx	[%r10 + 0x0020], %r7
	.word 0xc9e2d13f  ! 795: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad9bf  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc702e044  ! 799: LDF_I	ld	[%r11, 0x0044], %f3
	.word 0xcc82917f  ! 800: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc89ae070  ! 801: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r4
	.word 0xd39aa058  ! 802: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xc79aa020  ! 803: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xd122801f  ! 804: STF_R	st	%f8, [%r31, %r10]
	.word 0xcdba997f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL805:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba985f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbae050  ! 808: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xca8ad01f  ! 809: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xcbe2d13f  ! 810: CASA_I	casa	[%r11] 0x89, %r31, %r5
TH_LABEL810:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad95f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcb9aa040  ! 812: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad93f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca52801f  ! 815: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2903f  ! 816: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc642a050  ! 817: LDSW_I	ldsw	[%r10 + 0x0050], %r3
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca0ae06c  ! 819: LDUB_I	ldub	[%r11 + 0x006c], %r5
	.word 0xc322801f  ! 820: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba999f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc49aa020  ! 823: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xca42801f  ! 824: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc9bad89f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce92913f  ! 826: LDUHA_R	lduha	[%r10, %r31] 0x89, %r7
	.word 0xcc1ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcb9aa008  ! 828: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xcb02801f  ! 829: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2d01f  ! 831: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad93f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 834: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2ca913f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xd0caa028  ! 837: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r8
	.word 0xcfbad81f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb9ae068  ! 839: LDDFA_I	ldda	[%r11, 0x0068], %f5
	.word 0xcdba987f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc4c2a024  ! 843: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r2
	.word 0xc402801f  ! 844: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
TH_LABEL845:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd322801f  ! 846: STF_R	st	%f9, [%r31, %r10]
	.word 0xc7ba983f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 849: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc482915f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r2
TH_LABEL850:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd212a074  ! 851: LDUH_I	lduh	[%r10 + 0x0074], %r9
	.word 0xd1bad9bf  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 853: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad85f  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 859: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad87f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd302801f  ! 861: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3ba98bf  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd202801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcec2a02c  ! 868: LDSWA_I	ldswa	[%r10, + 0x002c] %asi, %r7
	.word 0xc48a905f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x82, %r2
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd20aa06a  ! 872: LDUB_I	ldub	[%r10 + 0x006a], %r9
	.word 0xce42c01f  ! 873: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xc7ba983f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba98bf  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 877: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba985f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2903f  ! 880: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba997f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb02c01f  ! 884: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
TH_LABEL885:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad81f  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc79aa070  ! 889: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xc7bad99f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bad93f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc322801f  ! 894: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5bad97f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad91f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad9bf  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca12801f  ! 900: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad97f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d01f  ! 904: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad85f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad99f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc25ae020  ! 908: LDX_I	ldx	[%r11 + 0x0020], %r1
	.word 0xcf22801f  ! 909: STF_R	st	%f7, [%r31, %r10]
	.word 0xd102a02c  ! 910: LDF_I	ld	[%r10, 0x002c], %f8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bae040  ! 911: STDFA_I	stda	%f4, [0x0040, %r11]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd2c2a060  ! 913: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r9
	.word 0xc3ba981f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2901f  ! 916: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc8ad07f  ! 918: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba98bf  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc902c01f  ! 921: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcc12e026  ! 922: LDUH_I	lduh	[%r11 + 0x0026], %r6
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2911f  ! 925: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc812801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xd1ba98bf  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc202a020  ! 928: LDUW_I	lduw	[%r10 + 0x0020], %r1
	.word 0xd3bad81f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce92e04e  ! 931: LDUHA_I	lduha	[%r11, + 0x004e] %asi, %r7
	.word 0xd012a02a  ! 932: LDUH_I	lduh	[%r10 + 0x002a], %r8
	.word 0xcd9aa028  ! 933: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xcdba99bf  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc292913f  ! 936: LDUHA_R	lduha	[%r10, %r31] 0x89, %r1
	.word 0xc3e2d03f  ! 937: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd08ae070  ! 938: LDUBA_I	lduba	[%r11, + 0x0070] %asi, %r8
	.word 0xca12e014  ! 939: LDUH_I	lduh	[%r11 + 0x0014], %r5
	.word 0xc802a004  ! 940: LDUW_I	lduw	[%r10 + 0x0004], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad93f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xcd02a038  ! 944: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5bad8bf  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3baa060  ! 947: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xc8c2a070  ! 948: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r4
	.word 0xca8a911f  ! 949: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xc9ba993f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL950:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc4d2a038  ! 952: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r2
	.word 0xcb02801f  ! 953: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba987f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2901f  ! 957: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd0cae065  ! 958: LDSBA_I	ldsba	[%r11, + 0x0065] %asi, %r8
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xcf02e050  ! 960: LDF_I	ld	[%r11, 0x0050], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc322c01f  ! 961: STF_R	st	%f1, [%r31, %r11]
	.word 0xd1ba985f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba985f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf02801f  ! 966: LDF_R	ld	[%r10, %r31], %f7
	.word 0xca52a006  ! 967: LDSH_I	ldsh	[%r10 + 0x0006], %r5
	.word 0xcfba981f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xd052a030  ! 970: LDSH_I	ldsh	[%r10 + 0x0030], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba999f  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba995f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc49aa048  ! 977: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r2
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d01f  ! 979: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad87f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad81f  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd052801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xcfbaa038  ! 983: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xc79ae018  ! 984: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xc3ba98bf  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2913f  ! 987: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba999f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca92903f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x81, %r5
	.word 0xd1ba987f  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba993f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xc722801f  ! 2: STF_R	st	%f3, [%r31, %r10]
	.word 0xcdba997f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba981f  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc3baa078  ! 7: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad97f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad85f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc442801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc6daa068  ! 14: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r3
	.word 0xc722801f  ! 15: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad81f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc5bae050  ! 19: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xc722801f  ! 20: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc39ae050  ! 22: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xc292905f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc9ae050  ! 26: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r6
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xced2d15f  ! 28: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r7
	.word 0xc9baa020  ! 29: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba995f  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba987f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 34: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbbad97f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc442801f  ! 36: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc902801f  ! 37: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xd102c01f  ! 39: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd1ba985f  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba981f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc20ae057  ! 43: LDUB_I	ldub	[%r11 + 0x0057], %r1
	.word 0xcbba993f  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
TH_LABEL45:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbaa030  ! 46: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc4ca917f  ! 48: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xd3f2d01f  ! 49: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd19aa038  ! 50: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2d11f  ! 51: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad85f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d11f  ! 55: CASA_I	casa	[%r11] 0x88, %r31, %r3
TH_LABEL55:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2da915f  ! 56: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r1
	.word 0xcbe2d03f  ! 57: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad81f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc49aa058  ! 59: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xcfe2903f  ! 60: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba987f  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd02a07c  ! 62: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba997f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc902801f  ! 65: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2913f  ! 66: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc2c2d01f  ! 67: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r1
	.word 0xc5ba981f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6c2901f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xc68a917f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba985f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd102a020  ! 74: LDF_I	ld	[%r10, 0x0020], %f8
	.word 0xcc92a038  ! 75: LDUHA_I	lduha	[%r10, + 0x0038] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09aa020  ! 76: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xcbbad9bf  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc882d13f  ! 78: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r4
	.word 0xcfba995f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba991f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce5a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc41a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcec2e030  ! 84: LDSWA_I	ldswa	[%r11, + 0x0030] %asi, %r7
	.word 0xcfbaa068  ! 85: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad97f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca8ad03f  ! 87: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2913f  ! 89: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba981f  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca42e070  ! 91: LDSW_I	ldsw	[%r11 + 0x0070], %r5
	.word 0xc3f2901f  ! 92: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba995f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2913f  ! 99: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcf22801f  ! 100: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad83f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc25ae060  ! 105: LDX_I	ldx	[%r11 + 0x0060], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2901f  ! 106: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba993f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc20a801f  ! 110: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc1ac01f  ! 111: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd3ba991f  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc842e008  ! 114: LDSW_I	ldsw	[%r11 + 0x0008], %r4
	.word 0xc7baa068  ! 115: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6c2e048  ! 116: LDSWA_I	ldswa	[%r11, + 0x0048] %asi, %r3
	.word 0xc452801f  ! 117: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd052801f  ! 118: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc322c01f  ! 119: STF_R	st	%f1, [%r31, %r11]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba999f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 122: STF_R	st	%f4, [%r31, %r10]
	.word 0xc212c01f  ! 123: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc5ba981f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcbbaa000  ! 125: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6d2e034  ! 126: LDSHA_I	ldsha	[%r11, + 0x0034] %asi, %r3
	.word 0xc882903f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r4
	.word 0xc79aa048  ! 128: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xd3bad97f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6da911f  ! 131: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xcdf2911f  ! 132: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc64aa036  ! 134: LDSB_I	ldsb	[%r10 + 0x0036], %r3
	.word 0xc9e2901f  ! 135: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba981f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcf02e058  ! 139: LDF_I	ld	[%r11, 0x0058], %f7
	.word 0xd01ae018  ! 140: LDD_I	ldd	[%r11 + 0x0018], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2901f  ! 141: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc302a078  ! 142: LDF_I	ld	[%r10, 0x0078], %f1
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xc79aa078  ! 144: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xd102a034  ! 145: LDF_I	ld	[%r10, 0x0034], %f8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba983f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 148: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc3baa070  ! 150: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd302801f  ! 151: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcf9aa008  ! 152: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad89f  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0ca901f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc902c01f  ! 156: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcfba987f  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba983f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL160:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbaa058  ! 161: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xcfe2903f  ! 162: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba993f  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba991f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc81ac01f  ! 166: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc5baa068  ! 167: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xc502a040  ! 168: LDF_I	ld	[%r10, 0x0040], %f2
	.word 0xcdf2911f  ! 169: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd102e05c  ! 170: LDF_I	ld	[%r11, 0x005c], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad91f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd102a004  ! 174: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xca12a050  ! 175: LDUH_I	lduh	[%r10 + 0x0050], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5baa000  ! 176: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc682e000  ! 178: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r3
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd302e024  ! 180: LDF_I	ld	[%r11, 0x0024], %f9
TH_LABEL180:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad87f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad81f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd1baa058  ! 187: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc642801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL190:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba991f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2913f  ! 193: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xd0c2917f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302c01f  ! 196: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad91f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 199: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2d01f  ! 201: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc802e030  ! 202: LDUW_I	lduw	[%r11 + 0x0030], %r4
	.word 0xc5ba981f  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 204: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc602801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2911f  ! 206: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc302e050  ! 207: LDF_I	ld	[%r11, 0x0050], %f1
	.word 0xc852801f  ! 208: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcfbad83f  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd24a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc902801f  ! 216: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd1e2903f  ! 217: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba985f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc4a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xca5ae040  ! 220: LDX_I	ldx	[%r11 + 0x0040], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3baa030  ! 221: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xd202a034  ! 222: LDUW_I	lduw	[%r10 + 0x0034], %r9
	.word 0xcb02e00c  ! 223: LDF_I	ld	[%r11, 0x000c], %f5
	.word 0xcbba987f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce0a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc6da913f  ! 227: LDXA_R	ldxa	[%r10, %r31] 0x89, %r3
	.word 0xcb02c01f  ! 228: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc502801f  ! 230: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba991f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd2d2a022  ! 233: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r9
	.word 0xc492a030  ! 234: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r2
	.word 0xcfbaa008  ! 235: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3baa048  ! 236: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xc49ae038  ! 237: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r2
	.word 0xd102c01f  ! 238: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc49aa000  ! 239: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r2
	.word 0xd3ba987f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2911f  ! 241: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xcc9ae028  ! 242: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r6
	.word 0xc5ba985f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2913f  ! 244: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc292e00c  ! 245: LDUHA_I	lduha	[%r11, + 0x000c] %asi, %r1
TH_LABEL245:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba985f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd28ad01f  ! 247: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xd1baa018  ! 248: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad87f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad95f  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d03f  ! 253: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad9bf  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad83f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc60a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba991f  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc602a010  ! 264: LDUW_I	lduw	[%r10 + 0x0010], %r3
	.word 0xc5e2d03f  ! 265: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad9bf  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d03f  ! 269: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad83f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39aa020  ! 271: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd3bae068  ! 273: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xd24a801f  ! 274: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xd1bad81f  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc322c01f  ! 276: STF_R	st	%f1, [%r31, %r11]
	.word 0xce82d11f  ! 277: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r7
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc39ae038  ! 279: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba995f  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd012a048  ! 284: LDUH_I	lduh	[%r10 + 0x0048], %r8
	.word 0xcdba991f  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xccc2a05c  ! 288: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r6
	.word 0xcd9aa028  ! 289: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad93f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad83f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 297: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad91f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 299: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xcb02c01f  ! 300: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc902e078  ! 301: LDF_I	ld	[%r11, 0x0078], %f4
	.word 0xd2c2905f  ! 302: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r9
	.word 0xc882d03f  ! 303: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r4
	.word 0xccdad11f  ! 304: LDXA_R	ldxa	[%r11, %r31] 0x88, %r6
	.word 0xcdbaa018  ! 305: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba993f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902e02c  ! 307: LDF_I	ld	[%r11, 0x002c], %f4
	.word 0xd1bae048  ! 308: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xc9ba999f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3baa070  ! 310: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba981f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc80a801f  ! 313: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd1f2d01f  ! 314: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad99f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce12a05e  ! 316: LDUH_I	lduh	[%r10 + 0x005e], %r7
	.word 0xcb02e074  ! 317: LDF_I	ld	[%r11, 0x0074], %f5
	.word 0xcf02801f  ! 318: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd052e048  ! 320: LDSH_I	ldsh	[%r11 + 0x0048], %r8
TH_LABEL320:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad81f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad93f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd00a801f  ! 324: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcfba991f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba991f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc59aa028  ! 327: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xd1bad93f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd24ae055  ! 329: LDSB_I	ldsb	[%r11 + 0x0055], %r9
	.word 0xcf22801f  ! 330: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2901f  ! 331: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2911f  ! 332: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xd01ac01f  ! 333: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc9ba999f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca52801f  ! 335: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02801f  ! 336: LDF_R	ld	[%r10, %r31], %f7
	.word 0xca12c01f  ! 337: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xd3e2d03f  ! 338: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xc5baa078  ! 339: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xd1bad91f  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad83f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 342: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc2ca911f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r1
	.word 0xc3ba997f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba999f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc612e05c  ! 347: LDUH_I	lduh	[%r11 + 0x005c], %r3
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa018  ! 349: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xc5ba98bf  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba985f  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc922c01f  ! 353: STF_R	st	%f4, [%r31, %r11]
	.word 0xd1bad99f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad81f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL360:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad97f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca82913f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r5
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcac2e05c  ! 364: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r5
	.word 0xc282913f  ! 365: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d11f  ! 369: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad91f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL370:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc12e02a  ! 371: LDUH_I	lduh	[%r11 + 0x002a], %r6
	.word 0xcfe2903f  ! 372: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2901f  ! 373: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2901f  ! 374: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd102a02c  ! 375: LDF_I	ld	[%r10, 0x002c], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc702a004  ! 376: LDF_I	ld	[%r10, 0x0004], %f3
	.word 0xcbf2901f  ! 377: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xce02c01f  ! 378: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc40ae071  ! 379: LDUB_I	ldub	[%r11 + 0x0071], %r2
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd302801f  ! 381: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc9e2911f  ! 382: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc812801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc7ba987f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc85aa068  ! 385: LDX_I	ldx	[%r10 + 0x0068], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2d01f  ! 386: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc902e014  ! 387: LDF_I	ld	[%r11, 0x0014], %f4
	.word 0xc5ba995f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc722c01f  ! 389: STF_R	st	%f3, [%r31, %r11]
	.word 0xce42e068  ! 390: LDSW_I	ldsw	[%r11 + 0x0068], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba983f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 392: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcc9aa048  ! 393: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xc9bad8bf  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc402a050  ! 395: LDUW_I	lduw	[%r10 + 0x0050], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc64ac01f  ! 397: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc5ba98bf  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc40aa065  ! 399: LDUB_I	ldub	[%r10 + 0x0065], %r2
	.word 0xc3f2d03f  ! 400: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4caa002  ! 401: LDSBA_I	ldsba	[%r10, + 0x0002] %asi, %r2
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba98bf  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc48ad11f  ! 406: LDUBA_R	lduba	[%r11, %r31] 0x88, %r2
	.word 0xc9bad95f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc692901f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xd3baa020  ! 410: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2901f  ! 411: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2901f  ! 413: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2901f  ! 416: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xd00ac01f  ! 417: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc9bad9bf  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc4c2901f  ! 419: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3bad91f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccd2d07f  ! 422: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r6
	.word 0xc3ba981f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 425: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc42801f  ! 426: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xccd2d13f  ! 427: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r6
	.word 0xcdf2901f  ! 428: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba997f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba991f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba989f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 435: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce52801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xd01ae010  ! 438: LDD_I	ldd	[%r11 + 0x0010], %r8
	.word 0xcecaa021  ! 439: LDSBA_I	ldsba	[%r10, + 0x0021] %asi, %r7
	.word 0xcdba997f  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482a054  ! 441: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r2
	.word 0xd0c2d17f  ! 442: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r8
	.word 0xc7bad97f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc64a801f  ! 445: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb02801f  ! 446: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdba995f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcde2911f  ! 449: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcdba989f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc882905f  ! 452: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r4
	.word 0xd3ba98bf  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd002a064  ! 455: LDUW_I	lduw	[%r10 + 0x0064], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcbbaa030  ! 457: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xc85ae058  ! 458: LDX_I	ldx	[%r11 + 0x0058], %r4
	.word 0xd1ba997f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8aa041  ! 460: LDUBA_I	lduba	[%r10, + 0x0041] %asi, %r7
TH_LABEL460:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302801f  ! 461: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcbba985f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc502a014  ! 463: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xcf22801f  ! 464: STF_R	st	%f7, [%r31, %r10]
	.word 0xcf9aa060  ! 465: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9baa078  ! 466: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xcbba983f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc202a05c  ! 468: LDUW_I	lduw	[%r10 + 0x005c], %r1
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba989f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc84aa03f  ! 472: LDSB_I	ldsb	[%r10 + 0x003f], %r4
	.word 0xc892915f  ! 473: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xcfe2d01f  ! 474: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcff2d13f  ! 475: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2d01f  ! 476: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc6caa01b  ! 478: LDSBA_I	ldsba	[%r10, + 0x001b] %asi, %r3
	.word 0xcadae060  ! 479: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r5
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2cad13f  ! 481: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r9
	.word 0xc6d2901f  ! 482: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xcfbad81f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc64ae01b  ! 486: LDSB_I	ldsb	[%r11 + 0x001b], %r3
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc682e048  ! 488: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r3
	.word 0xd20aa028  ! 489: LDUB_I	ldub	[%r10 + 0x0028], %r9
	.word 0xd39ae050  ! 490: LDDFA_I	ldda	[%r11, 0x0050], %f9
TH_LABEL490:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba99bf  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc41ae028  ! 493: LDD_I	ldd	[%r11 + 0x0028], %r2
	.word 0xc8ca917f  ! 494: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xc79aa048  ! 495: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3baa020  ! 496: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xcbbad87f  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 498: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcdbaa020  ! 500: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2903f  ! 501: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba989f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0daa000  ! 507: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r8
	.word 0xc492d13f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad8bf  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad97f  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcbbae020  ! 512: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xc3f2911f  ! 513: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba985f  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa008  ! 515: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad91f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc89aa040  ! 518: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xc5bae040  ! 519: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xce12c01f  ! 520: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xccc2901f  ! 521: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc39ae008  ! 523: LDDFA_I	ldda	[%r11, 0x0008], %f1
	.word 0xca92901f  ! 524: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xcbba981f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc8d2a06e  ! 526: LDSHA_I	ldsha	[%r10, + 0x006e] %asi, %r4
	.word 0xcdba997f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 528: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xca4ae06c  ! 529: LDSB_I	ldsb	[%r11 + 0x006c], %r5
	.word 0xd3bad81f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2d13f  ! 531: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xc25ac01f  ! 533: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc2dae018  ! 534: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r1
	.word 0xcfba983f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba981f  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2911f  ! 539: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xce8aa03c  ! 541: LDUBA_I	lduba	[%r10, + 0x003c] %asi, %r7
	.word 0xcc1aa018  ! 542: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd252801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc65ac01f  ! 547: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc5bad93f  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc01aa010  ! 550: LDD_I	ldd	[%r10 + 0x0010], %r0
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc922c01f  ! 551: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3bad9bf  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0da903f  ! 553: LDXA_R	ldxa	[%r10, %r31] 0x81, %r8
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9f2913f  ! 556: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xce4ac01f  ! 557: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc4cae062  ! 558: LDSBA_I	ldsba	[%r11, + 0x0062] %asi, %r2
	.word 0xd1ba995f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc452a07e  ! 560: LDSH_I	ldsh	[%r10 + 0x007e], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba985f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba993f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce0a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02c01f  ! 566: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc5f2901f  ! 567: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba989f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd05aa070  ! 571: LDX_I	ldx	[%r10 + 0x0070], %r8
	.word 0xc3ba997f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc02c01f  ! 574: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc7ba995f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd04ae007  ! 576: LDSB_I	ldsb	[%r11 + 0x0007], %r8
	.word 0xcc4a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc99aa060  ! 578: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xc3bad85f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd20aa004  ! 583: LDUB_I	ldub	[%r10 + 0x0004], %r9
	.word 0xc692a04c  ! 584: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r3
	.word 0xcff2913f  ! 585: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc79aa060  ! 586: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xd28ad11f  ! 589: LDUBA_R	lduba	[%r11, %r31] 0x88, %r9
	.word 0xcbe2d01f  ! 590: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad8bf  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0ac01f  ! 592: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc5baa038  ! 593: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc39ae028  ! 594: LDDFA_I	ldda	[%r11, 0x0028], %f1
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc892d03f  ! 597: LDUHA_R	lduha	[%r11, %r31] 0x81, %r4
	.word 0xd012801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc9f2913f  ! 599: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba99bf  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba989f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc522c01f  ! 602: STF_R	st	%f2, [%r31, %r11]
	.word 0xcb9aa078  ! 603: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xcd9ae068  ! 604: LDDFA_I	ldda	[%r11, 0x0068], %f6
	.word 0xc7bad89f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd242a03c  ! 606: LDSW_I	ldsw	[%r10 + 0x003c], %r9
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad83f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc892d15f  ! 611: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r4
	.word 0xd102801f  ! 612: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc642801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xcfba983f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd082e018  ! 615: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc1a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba991f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xd212a006  ! 620: LDUH_I	lduh	[%r10 + 0x0006], %r9
TH_LABEL620:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc65ae010  ! 622: LDX_I	ldx	[%r11 + 0x0010], %r3
	.word 0xc902a038  ! 623: LDF_I	ld	[%r10, 0x0038], %f4
	.word 0xcdba987f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5baa058  ! 625: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bae048  ! 626: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xca92d01f  ! 627: LDUHA_R	lduha	[%r11, %r31] 0x80, %r5
	.word 0xc892a064  ! 628: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r4
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd052a058  ! 630: LDSH_I	ldsh	[%r10 + 0x0058], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba993f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2901f  ! 633: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2913f  ! 634: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba993f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba999f  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1ae050  ! 637: LDD_I	ldd	[%r11 + 0x0050], %r6
	.word 0xc9bad81f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6d2a04a  ! 639: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r3
	.word 0xcdba99bf  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdba991f  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcccae046  ! 642: LDSBA_I	ldsba	[%r11, + 0x0046] %asi, %r6
	.word 0xd3ba99bf  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 645: CASA_I	casa	[%r10] 0x81, %r31, %r9
TH_LABEL645:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba989f  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 649: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc3baa018  ! 650: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3baa010  ! 651: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd19aa038  ! 653: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xcc8aa072  ! 654: LDUBA_I	lduba	[%r10, + 0x0072] %asi, %r6
	.word 0xcfbaa068  ! 655: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502801f  ! 656: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd3f2911f  ! 657: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba993f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcfbaa028  ! 662: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xc882e078  ! 663: LDUWA_I	lduwa	[%r11, + 0x0078] %asi, %r4
	.word 0xd09ae070  ! 664: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r8
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xd19ae070  ! 667: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xcbf2913f  ! 668: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2d2a03e  ! 671: LDSHA_I	ldsha	[%r10, + 0x003e] %asi, %r9
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad85f  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 675: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc12c01f  ! 676: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xc60aa06b  ! 677: LDUB_I	ldub	[%r10 + 0x006b], %r3
	.word 0xc3ba985f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2e058  ! 681: LDSWA_I	ldswa	[%r11, + 0x0058] %asi, %r2
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd3baa078  ! 683: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xcbba989f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 685: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc212e07a  ! 686: LDUH_I	lduh	[%r11 + 0x007a], %r1
	.word 0xcf02a00c  ! 687: LDF_I	ld	[%r10, 0x000c], %f7
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba983f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xc81a801f  ! 693: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba987f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09ae020  ! 696: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd05aa008  ! 698: LDX_I	ldx	[%r10 + 0x0008], %r8
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad8bf  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc702a078  ! 702: LDF_I	ld	[%r10, 0x0078], %f3
	.word 0xd1e2901f  ! 703: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc252a052  ! 704: LDSH_I	ldsh	[%r10 + 0x0052], %r1
	.word 0xc3baa008  ! 705: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bad87f  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3bae068  ! 707: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xc65aa020  ! 708: LDX_I	ldx	[%r10 + 0x0020], %r3
	.word 0xcd02801f  ! 709: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcfba995f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb02c01f  ! 711: LDF_R	ld	[%r11, %r31], %f5
	.word 0xd01a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcdba98bf  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2903f  ! 715: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd09aa020  ! 716: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xc5ba981f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 720: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd082917f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xc322801f  ! 722: STF_R	st	%f1, [%r31, %r10]
	.word 0xceca913f  ! 723: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xc81a801f  ! 724: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfbad81f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc25ac01f  ! 726: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba989f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcd9aa048  ! 730: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd282a004  ! 731: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r9
	.word 0xca12e01e  ! 732: LDUH_I	lduh	[%r11 + 0x001e], %r5
	.word 0xcf02c01f  ! 733: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc302801f  ! 734: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba993f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc64aa03d  ! 739: LDSB_I	ldsb	[%r10 + 0x003d], %r3
	.word 0xccdaa000  ! 740: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcad2917f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r5
	.word 0xc9baa070  ! 742: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xc3bad9bf  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd20aa06d  ! 744: LDUB_I	ldub	[%r10 + 0x006d], %r9
	.word 0xcf02e01c  ! 745: LDF_I	ld	[%r11, 0x001c], %f7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xced2a042  ! 746: LDSHA_I	ldsha	[%r10, + 0x0042] %asi, %r7
	.word 0xca42a014  ! 747: LDSW_I	ldsw	[%r10 + 0x0014], %r5
	.word 0xc9baa018  ! 748: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad9bf  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcdbaa058  ! 752: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd3bad83f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL755:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bad85f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc79aa068  ! 759: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xd20aa003  ! 760: LDUB_I	ldub	[%r10 + 0x0003], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd282e010  ! 762: LDUWA_I	lduwa	[%r11, + 0x0010] %asi, %r9
	.word 0xd3f2901f  ! 763: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba98bf  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba985f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce8aa07c  ! 767: LDUBA_I	lduba	[%r10, + 0x007c] %asi, %r7
	.word 0xc492a032  ! 768: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r2
	.word 0xc88a901f  ! 769: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc64aa051  ! 770: LDSB_I	ldsb	[%r10 + 0x0051], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd322c01f  ! 771: STF_R	st	%f9, [%r31, %r11]
	.word 0xcdba999f  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc602801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xd2da917f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 778: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc502801f  ! 780: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d13f  ! 782: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad81f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcccaa02c  ! 786: LDSBA_I	ldsba	[%r10, + 0x002c] %asi, %r6
	.word 0xc6c2907f  ! 787: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r3
	.word 0xcbbad8bf  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc1a801f  ! 789: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad87f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce5ae008  ! 794: LDX_I	ldx	[%r11 + 0x0008], %r7
	.word 0xc9e2d13f  ! 795: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad85f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302a000  ! 799: LDF_I	ld	[%r10, 0x0000], %f9
	.word 0xc282d01f  ! 800: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc89aa060  ! 801: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xcd9aa050  ! 802: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xcb9ae010  ! 803: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xcf22801f  ! 804: STF_R	st	%f7, [%r31, %r10]
	.word 0xcdba981f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba993f  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa048  ! 808: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xce8a901f  ! 809: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcbe2d11f  ! 810: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad9bf  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcb9aa068  ! 812: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad91f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd252c01f  ! 815: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2911f  ! 816: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xc642a058  ! 817: LDSW_I	ldsw	[%r10 + 0x0058], %r3
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca0aa02d  ! 819: LDUB_I	ldub	[%r10 + 0x002d], %r5
	.word 0xd122801f  ! 820: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba997f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9aa070  ! 823: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xce42c01f  ! 824: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xc9bad89f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc92d03f  ! 826: LDUHA_R	lduha	[%r11, %r31] 0x81, %r6
	.word 0xc01a801f  ! 827: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc39aa008  ! 828: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xcd02801f  ! 829: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1e2d03f  ! 831: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad83f  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 834: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6ca913f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xcccaa062  ! 837: LDSBA_I	ldsba	[%r10, + 0x0062] %asi, %r6
	.word 0xcfbad99f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd19aa020  ! 839: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xcdba997f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc2c2a068  ! 843: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r1
	.word 0xc402801f  ! 844: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd122801f  ! 846: STF_R	st	%f8, [%r31, %r10]
	.word 0xc7ba98bf  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 849: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc82913f  ! 850: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc12e00e  ! 851: LDUH_I	lduh	[%r11 + 0x000e], %r6
	.word 0xd1bad8bf  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 853: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL855:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad99f  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d03f  ! 859: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad81f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc302801f  ! 861: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3ba993f  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca02801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc8c2a044  ! 868: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r4
	.word 0xd28a901f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba987f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca0ae076  ! 872: LDUB_I	ldub	[%r11 + 0x0076], %r5
	.word 0xc642801f  ! 873: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7ba991f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba997f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 877: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba993f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2903f  ! 880: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba997f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02c01f  ! 884: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad8bf  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd19ae008  ! 889: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xc7bad93f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bad91f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcf22801f  ! 894: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5bad89f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad89f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad93f  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce12801f  ! 900: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad93f  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d01f  ! 904: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad8bf  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad83f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd05aa028  ! 908: LDX_I	ldx	[%r10 + 0x0028], %r8
	.word 0xc922801f  ! 909: STF_R	st	%f4, [%r31, %r10]
	.word 0xd302a064  ! 910: LDF_I	ld	[%r10, 0x0064], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3baa038  ! 911: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc6c2e038  ! 913: LDSWA_I	ldswa	[%r11, + 0x0038] %asi, %r3
	.word 0xc3ba997f  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2913f  ! 916: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc8ad13f  ! 918: LDUBA_R	lduba	[%r11, %r31] 0x89, %r6
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba985f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL920:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502801f  ! 921: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd212a070  ! 922: LDUH_I	lduh	[%r10 + 0x0070], %r9
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2913f  ! 925: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce12801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd1ba997f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc02e028  ! 928: LDUW_I	lduw	[%r11 + 0x0028], %r6
	.word 0xd3bad83f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc292a050  ! 931: LDUHA_I	lduha	[%r10, + 0x0050] %asi, %r1
	.word 0xd212a068  ! 932: LDUH_I	lduh	[%r10 + 0x0068], %r9
	.word 0xc59aa008  ! 933: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xcdba981f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc292901f  ! 936: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xc3e2d11f  ! 937: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xca8aa046  ! 938: LDUBA_I	lduba	[%r10, + 0x0046] %asi, %r5
	.word 0xce12a05e  ! 939: LDUH_I	lduh	[%r10 + 0x005e], %r7
	.word 0xd202a06c  ! 940: LDUW_I	lduw	[%r10 + 0x006c], %r9
TH_LABEL940:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad87f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xc502e078  ! 944: LDF_I	ld	[%r11, 0x0078], %f2
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bad8bf  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcdbae000  ! 947: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xd0c2a078  ! 948: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r8
	.word 0xc48ad11f  ! 949: LDUBA_R	lduba	[%r11, %r31] 0x88, %r2
	.word 0xc9ba989f  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xccd2e020  ! 952: LDSHA_I	ldsha	[%r11, + 0x0020] %asi, %r6
	.word 0xcd02801f  ! 953: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcfba999f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2901f  ! 957: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcecae068  ! 958: LDSBA_I	ldsba	[%r11, + 0x0068] %asi, %r7
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd102a064  ! 960: LDF_I	ld	[%r10, 0x0064], %f8
TH_LABEL960:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc922c01f  ! 961: STF_R	st	%f4, [%r31, %r11]
	.word 0xd1ba995f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02801f  ! 966: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd252a044  ! 967: LDSH_I	ldsh	[%r10 + 0x0044], %r9
	.word 0xcfba991f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xc452a00e  ! 970: LDSH_I	ldsh	[%r10 + 0x000e], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba981f  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba991f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc49ae078  ! 977: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r2
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d01f  ! 979: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad97f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad9bf  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd052801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc3baa078  ! 983: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xc59aa048  ! 984: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xc3ba995f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2901f  ! 987: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba995f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd292917f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xd1ba993f  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba981f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xc83aa058  ! 1: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcd22801f  ! 2: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 4: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 5: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdba99bf  ! 6: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5bae028  ! 7: STDFA_I	stda	%f2, [0x0028, %r11]
	.word 0xc5f2e01f  ! 8: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad95f  ! 9: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 10: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2e01f  ! 11: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad83f  ! 12: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc242801f  ! 13: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xcedaa038  ! 14: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r7
	.word 0xc322c01f  ! 15: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad99f  ! 16: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 17: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 18: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd3baa078  ! 19: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xcf22801f  ! 20: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3a801f  ! 21: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd19aa008  ! 22: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xd292907f  ! 23: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xd3f2a01f  ! 24: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3f2a01f  ! 25: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc49ae060  ! 26: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r2
	.word 0xc7e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc6d2901f  ! 28: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xcbbaa018  ! 29: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xcbf2a01f  ! 30: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba99bf  ! 31: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa018  ! 32: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xcbba991f  ! 33: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb22c01f  ! 34: STF_R	st	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 35: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd042c01f  ! 36: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc702801f  ! 37: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc43aa018  ! 38: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xd102801f  ! 39: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba98bf  ! 40: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba995f  ! 41: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xca0aa073  ! 43: LDUB_I	ldub	[%r10 + 0x0073], %r5
	.word 0xcbba99bf  ! 44: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 45: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbaa078  ! 46: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xcfe2a01f  ! 47: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd2cad11f  ! 48: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r9
	.word 0xd3f2d11f  ! 49: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xc79ae010  ! 50: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7f2d11f  ! 51: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc43ac01f  ! 52: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad91f  ! 53: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 54: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d11f  ! 55: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcadad11f  ! 56: LDXA_R	ldxa	[%r11, %r31] 0x88, %r5
	.word 0xcbe2d01f  ! 57: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad99f  ! 58: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc9aa020  ! 59: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xcfe2901f  ! 60: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba98bf  ! 61: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd02a00c  ! 62: LDF_I	ld	[%r10, 0x000c], %f6
	.word 0xcc3aa008  ! 63: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcdba993f  ! 64: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcd02801f  ! 65: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2913f  ! 66: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc4c2913f  ! 67: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xc5ba985f  ! 68: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc2c2907f  ! 69: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r1
	.word 0xd28a917f  ! 70: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba981f  ! 71: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 73: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb02a05c  ! 74: LDF_I	ld	[%r10, 0x005c], %f5
	.word 0xd292a012  ! 75: LDUHA_I	lduha	[%r10, + 0x0012] %asi, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc89ae040  ! 76: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r4
	.word 0xcbbad97f  ! 77: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce82907f  ! 78: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r7
	.word 0xcfba981f  ! 79: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 80: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 81: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc65a801f  ! 82: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc81a801f  ! 83: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc2c2a000  ! 84: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r1
	.word 0xc9bae040  ! 85: STDFA_I	stda	%f4, [0x0040, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad91f  ! 86: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc28a905f  ! 87: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xc03a801f  ! 88: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3e2913f  ! 89: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba99bf  ! 90: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc242a014  ! 91: LDSW_I	ldsw	[%r10 + 0x0014], %r1
	.word 0xc3f2911f  ! 92: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03a801f  ! 93: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2a01f  ! 94: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 95: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba997f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa010  ! 98: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3f2901f  ! 99: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcf22c01f  ! 100: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad81f  ! 101: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 102: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 103: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 104: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca5aa008  ! 105: LDX_I	ldx	[%r10 + 0x0008], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2901f  ! 106: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba991f  ! 107: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 108: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 109: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca0ac01f  ! 110: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01a801f  ! 111: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd3ba99bf  ! 112: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc842a030  ! 114: LDSW_I	ldsw	[%r10 + 0x0030], %r4
	.word 0xc9bae078  ! 115: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2c2a07c  ! 116: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r9
	.word 0xc852c01f  ! 117: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xd252c01f  ! 118: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc922801f  ! 119: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 120: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba983f  ! 121: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 122: STF_R	st	%f7, [%r31, %r10]
	.word 0xc412801f  ! 123: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc5ba989f  ! 124: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5baa040  ! 125: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xced2e01a  ! 126: LDSHA_I	ldsha	[%r11, + 0x001a] %asi, %r7
	.word 0xc882901f  ! 127: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xd39ae078  ! 128: LDDFA_I	ldda	[%r11, 0x0078], %f9
	.word 0xd3bad89f  ! 129: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 130: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xccda911f  ! 131: LDXA_R	ldxa	[%r10, %r31] 0x88, %r6
	.word 0xcdf2911f  ! 132: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 133: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc84aa01b  ! 134: LDSB_I	ldsb	[%r10 + 0x001b], %r4
	.word 0xc9e2901f  ! 135: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba987f  ! 136: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 137: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa018  ! 138: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc702a030  ! 139: LDF_I	ld	[%r10, 0x0030], %f3
	.word 0xcc1aa010  ! 140: LDD_I	ldd	[%r10 + 0x0010], %r6
TH_LABEL140:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2903f  ! 141: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc702a028  ! 142: LDF_I	ld	[%r10, 0x0028], %f3
	.word 0xc43aa028  ! 143: STD_I	std	%r2, [%r10 + 0x0028]
	.word 0xcd9aa020  ! 144: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xcf02a030  ! 145: LDF_I	ld	[%r10, 0x0030], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 146: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 147: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 148: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 149: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd3baa038  ! 150: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02801f  ! 151: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc79ae028  ! 152: LDDFA_I	ldda	[%r11, 0x0028], %f3
	.word 0xc7f2e01f  ! 153: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 154: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xceca915f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
TH_LABEL155:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf02801f  ! 156: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba999f  ! 157: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 158: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 159: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 160: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbaa030  ! 161: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xcfe2901f  ! 162: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba99bf  ! 163: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 164: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 165: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc81a801f  ! 166: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9baa038  ! 167: STDFA_I	stda	%f4, [0x0038, %r10]
	.word 0xcd02a038  ! 168: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xcdf2903f  ! 169: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc702e020  ! 170: LDF_I	ld	[%r11, 0x0020], %f3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7bad87f  ! 171: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 172: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 173: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcd02a04c  ! 174: LDF_I	ld	[%r10, 0x004c], %f6
	.word 0xc812a070  ! 175: LDUH_I	lduh	[%r10 + 0x0070], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbaa048  ! 176: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xcc3a801f  ! 177: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc282a05c  ! 178: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r1
	.word 0xc3f2a01f  ! 179: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcf02e05c  ! 180: LDF_I	ld	[%r11, 0x005c], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad91f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 182: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad89f  ! 183: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 184: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 185: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3ac01f  ! 186: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbae030  ! 187: STDFA_I	stda	%f6, [0x0030, %r11]
	.word 0xc842801f  ! 188: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9f2a01f  ! 189: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83a801f  ! 190: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba995f  ! 191: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 192: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9f2913f  ! 193: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc8c2901f  ! 194: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xc9f2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb02c01f  ! 196: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc83ac01f  ! 197: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad87f  ! 198: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 199: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc83ac01f  ! 200: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2d13f  ! 201: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc402a038  ! 202: LDUW_I	lduw	[%r10 + 0x0038], %r2
	.word 0xc5ba99bf  ! 203: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 204: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc202801f  ! 205: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2901f  ! 206: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc302a000  ! 207: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xce52c01f  ! 208: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcfbad8bf  ! 209: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 210: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc4a801f  ! 211: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xcc3a801f  ! 212: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 213: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 214: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 215: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102801f  ! 216: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1e2913f  ! 217: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba983f  ! 218: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc64a801f  ! 219: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xca5ae018  ! 220: LDX_I	ldx	[%r11 + 0x0018], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7baa050  ! 221: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xcc02a014  ! 222: LDUW_I	lduw	[%r10 + 0x0014], %r6
	.word 0xcb02a010  ! 223: LDF_I	ld	[%r10, 0x0010], %f5
	.word 0xcbba989f  ! 224: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd00a801f  ! 225: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2a01f  ! 226: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc2dad01f  ! 227: LDXA_R	ldxa	[%r11, %r31] 0x80, %r1
	.word 0xc902c01f  ! 228: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc83ac01f  ! 229: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcd02801f  ! 230: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba997f  ! 231: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xccd2a032  ! 233: LDSHA_I	ldsha	[%r10, + 0x0032] %asi, %r6
	.word 0xc492a05e  ! 234: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r2
	.word 0xcdbaa040  ! 235: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3baa038  ! 236: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xcc9aa010  ! 237: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xc902801f  ! 238: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd09aa058  ! 239: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r8
	.word 0xd3ba995f  ! 240: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2901f  ! 241: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc49aa070  ! 242: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xc5ba985f  ! 243: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2911f  ! 244: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xd092a040  ! 245: LDUHA_I	lduha	[%r10, + 0x0040] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba999f  ! 246: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68a911f  ! 247: LDUBA_R	lduba	[%r10, %r31] 0x88, %r3
	.word 0xd1bae068  ! 248: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xd03ac01f  ! 249: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad87f  ! 250: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad8bf  ! 251: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 252: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2d11f  ! 253: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad83f  ! 254: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 255: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2e01f  ! 256: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd03ae068  ! 257: STD_I	std	%r8, [%r11 + 0x0068]
	.word 0xd03ac01f  ! 258: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad91f  ! 259: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc40a801f  ! 260: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43a801f  ! 261: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba98bf  ! 262: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 263: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc402e034  ! 264: LDUW_I	lduw	[%r11 + 0x0034], %r2
	.word 0xc5e2d13f  ! 265: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae030  ! 266: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad81f  ! 267: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 268: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad95f  ! 270: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc59ae018  ! 271: LDDFA_I	ldda	[%r11, 0x0018], %f2
	.word 0xc5f2e01f  ! 272: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc3bae038  ! 273: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xd04ac01f  ! 274: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xd1bad9bf  ! 275: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd122c01f  ! 276: STF_R	st	%f8, [%r31, %r11]
	.word 0xca82907f  ! 277: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xcbe2a01f  ! 278: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc59aa048  ! 279: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xc43aa048  ! 280: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43a801f  ! 281: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba98bf  ! 283: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc12a054  ! 284: LDUH_I	lduh	[%r10 + 0x0054], %r6
	.word 0xcdba98bf  ! 285: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa050  ! 286: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcc3aa050  ! 287: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd2c2e008  ! 288: LDSWA_I	ldswa	[%r11, + 0x0008] %asi, %r9
	.word 0xc39ae020  ! 289: LDDFA_I	ldda	[%r11, 0x0020], %f1
	.word 0xc03ae020  ! 290: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03ae020  ! 291: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc03ae020  ! 292: STD_I	std	%r0, [%r11 + 0x0020]
	.word 0xc3bad95f  ! 293: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 294: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 295: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad95f  ! 296: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d11f  ! 297: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad99f  ! 298: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d13f  ! 299: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xcb02801f  ! 300: LDF_R	ld	[%r10, %r31], %f5
TH_LABEL300:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd02a038  ! 301: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xc4c2901f  ! 302: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xcc82901f  ! 303: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xc2dad15f  ! 304: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r1
	.word 0xcfbaa038  ! 305: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba985f  ! 306: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702a01c  ! 307: LDF_I	ld	[%r10, 0x001c], %f3
	.word 0xc9baa030  ! 308: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc9ba983f  ! 309: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcfbaa050  ! 310: STDFA_I	stda	%f7, [0x0050, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba985f  ! 311: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 312: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd00ac01f  ! 313: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1f2d01f  ! 314: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad99f  ! 315: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc12a028  ! 316: LDUH_I	lduh	[%r10 + 0x0028], %r6
	.word 0xc702a024  ! 317: LDF_I	ld	[%r10, 0x0024], %f3
	.word 0xc302801f  ! 318: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3f2a01f  ! 319: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc852e018  ! 320: LDSH_I	ldsh	[%r11 + 0x0018], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad95f  ! 321: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae018  ! 322: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc9bad97f  ! 323: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0a801f  ! 324: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba995f  ! 325: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL325:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba993f  ! 326: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd19ae040  ! 327: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xd1bad81f  ! 328: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc44ae037  ! 329: LDSB_I	ldsb	[%r11 + 0x0037], %r2
	.word 0xc522801f  ! 330: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5e2903f  ! 331: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2903f  ! 332: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc81a801f  ! 333: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9ba993f  ! 334: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce52c01f  ! 335: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502801f  ! 336: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd212c01f  ! 337: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xd3e2d01f  ! 338: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd1bae028  ! 339: STDFA_I	stda	%f8, [0x0028, %r11]
	.word 0xd1bad9bf  ! 340: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad81f  ! 341: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 342: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc2ca907f  ! 343: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xc3ba985f  ! 344: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 345: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba999f  ! 346: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc412a064  ! 347: LDUH_I	lduh	[%r10 + 0x0064], %r2
	.word 0xc5e2a01f  ! 348: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa048  ! 349: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xc5ba981f  ! 350: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba98bf  ! 351: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 352: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd122c01f  ! 353: STF_R	st	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 354: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 355: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad93f  ! 356: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 357: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 358: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 359: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 360: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad99f  ! 361: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc682917f  ! 362: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r3
	.word 0xc43a801f  ! 363: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd0c2a018  ! 364: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r8
	.word 0xc282d15f  ! 365: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ae018  ! 366: STD_I	std	%r0, [%r11 + 0x0018]
	.word 0xc3e2e01f  ! 367: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad8bf  ! 368: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 369: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad81f  ! 370: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce12a046  ! 371: LDUH_I	lduh	[%r10 + 0x0046], %r7
	.word 0xcfe2911f  ! 372: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2901f  ! 373: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2903f  ! 374: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xd302e040  ! 375: LDF_I	ld	[%r11, 0x0040], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb02a01c  ! 376: LDF_I	ld	[%r10, 0x001c], %f5
	.word 0xcbf2911f  ! 377: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xc802801f  ! 378: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc60aa027  ! 379: LDUB_I	ldub	[%r10 + 0x0027], %r3
	.word 0xc43a801f  ! 380: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902801f  ! 381: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9e2901f  ! 382: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc612801f  ! 383: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba991f  ! 384: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc25ae030  ! 385: LDX_I	ldx	[%r11 + 0x0030], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2d11f  ! 386: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc502a048  ! 387: LDF_I	ld	[%r10, 0x0048], %f2
	.word 0xc5ba983f  ! 388: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb22801f  ! 389: STF_R	st	%f5, [%r31, %r10]
	.word 0xc242a020  ! 390: LDSW_I	ldsw	[%r10 + 0x0020], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba985f  ! 391: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 392: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc89ae020  ! 393: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r4
	.word 0xc9bad81f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc02a040  ! 395: LDUW_I	lduw	[%r10 + 0x0040], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3aa040  ! 396: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc44a801f  ! 397: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc5ba99bf  ! 398: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc20ae043  ! 399: LDUB_I	ldub	[%r11 + 0x0043], %r1
	.word 0xc3f2d01f  ! 400: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcccaa02f  ! 401: LDSBA_I	ldsba	[%r10, + 0x002f] %asi, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2a01f  ! 403: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 404: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 405: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc88ad03f  ! 406: LDUBA_R	lduba	[%r11, %r31] 0x81, %r4
	.word 0xc9bad97f  ! 407: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 408: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca92907f  ! 409: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xc5baa078  ! 410: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2903f  ! 411: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43a801f  ! 412: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2903f  ! 413: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba987f  ! 414: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 415: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2901f  ! 416: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc80ac01f  ! 417: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc9bad97f  ! 418: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc2c2d05f  ! 419: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r1
	.word 0xc3f2e01f  ! 420: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad99f  ! 421: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc2d2907f  ! 422: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r1
	.word 0xc3ba981f  ! 423: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 424: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 425: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce42c01f  ! 426: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xccd2917f  ! 427: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xcdf2911f  ! 428: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba981f  ! 429: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 430: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba997f  ! 431: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 432: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 433: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba989f  ! 434: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 435: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc652801f  ! 436: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc43aa078  ! 437: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcc1aa030  ! 438: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xcccaa03b  ! 439: LDSBA_I	ldsba	[%r10, + 0x003b] %asi, %r6
	.word 0xcdba98bf  ! 440: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL440:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca82a018  ! 441: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r5
	.word 0xc6c2d13f  ! 442: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r3
	.word 0xc7bad81f  ! 443: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 444: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc44a801f  ! 445: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd02801f  ! 446: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcdba997f  ! 447: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 448: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcde2913f  ! 449: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba981f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2a01f  ! 451: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xd282901f  ! 452: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r9
	.word 0xd3ba989f  ! 453: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 454: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd202e038  ! 455: LDUW_I	lduw	[%r11 + 0x0038], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2e01f  ! 456: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcdbaa058  ! 457: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd05aa000  ! 458: LDX_I	ldx	[%r10 + 0x0000], %r8
	.word 0xd1ba987f  ! 459: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd08aa055  ! 460: LDUBA_I	lduba	[%r10, + 0x0055] %asi, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcb02801f  ! 461: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcbba989f  ! 462: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc702a068  ! 463: LDF_I	ld	[%r10, 0x0068], %f3
	.word 0xd322c01f  ! 464: STF_R	st	%f9, [%r31, %r11]
	.word 0xc59ae000  ! 465: LDDFA_I	ldda	[%r11, 0x0000], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbaa010  ! 466: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xcbba993f  ! 467: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc402a00c  ! 468: LDUW_I	lduw	[%r10 + 0x000c], %r2
	.word 0xc43aa008  ! 469: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc5ba989f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 471: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc44aa078  ! 472: LDSB_I	ldsb	[%r10 + 0x0078], %r2
	.word 0xce92d01f  ! 473: LDUHA_R	lduha	[%r11, %r31] 0x80, %r7
	.word 0xcfe2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d03f  ! 475: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcff2d01f  ! 476: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcff2e01f  ! 477: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcecaa01e  ! 478: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r7
	.word 0xc8daa060  ! 479: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r4
	.word 0xc83a801f  ! 480: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2ca901f  ! 481: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xced2d03f  ! 482: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r7
	.word 0xcfbad81f  ! 483: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 484: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 485: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc4aa018  ! 486: LDSB_I	ldsb	[%r10 + 0x0018], %r6
	.word 0xcc3a801f  ! 487: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc82e024  ! 488: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r6
	.word 0xc40aa013  ! 489: LDUB_I	ldub	[%r10 + 0x0013], %r2
	.word 0xcf9aa028  ! 490: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba991f  ! 491: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 492: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc81aa010  ! 493: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xcccad17f  ! 494: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r6
	.word 0xd19aa008  ! 495: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbae018  ! 496: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xcbbad99f  ! 497: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 498: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 499: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc3baa028  ! 500: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2913f  ! 501: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc03aa028  ! 502: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xc3ba987f  ! 503: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 504: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 505: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcadae068  ! 507: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r5
	.word 0xc292d11f  ! 508: LDUHA_R	lduha	[%r11, %r31] 0x88, %r1
	.word 0xc3e2e01f  ! 509: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad99f  ! 510: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL510:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad9bf  ! 511: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3baa038  ! 512: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc3f2901f  ! 513: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba98bf  ! 514: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39ae008  ! 515: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03ac01f  ! 516: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 517: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc89aa058  ! 518: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xc5baa078  ! 519: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc812801f  ! 520: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8c2917f  ! 521: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xc83aa078  ! 522: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc39ae040  ! 523: LDDFA_I	ldda	[%r11, 0x0040], %f1
	.word 0xca92901f  ! 524: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xcbba991f  ! 525: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccd2a02a  ! 526: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r6
	.word 0xcdba983f  ! 527: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 528: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd24ae033  ! 529: LDSB_I	ldsb	[%r11 + 0x0033], %r9
	.word 0xd3bad91f  ! 530: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2d13f  ! 531: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae030  ! 532: STD_I	std	%r8, [%r11 + 0x0030]
	.word 0xcc5a801f  ! 533: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcedaa030  ! 534: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r7
	.word 0xcfba995f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL535:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba98bf  ! 536: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 537: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2903f  ! 539: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba987f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce8ae031  ! 541: LDUBA_I	lduba	[%r11, + 0x0031] %asi, %r7
	.word 0xd01aa028  ! 542: LDD_I	ldd	[%r10 + 0x0028], %r8
	.word 0xd03a801f  ! 543: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 544: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 545: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd252801f  ! 546: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc45ac01f  ! 547: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xc5bad8bf  ! 548: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae028  ! 549: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc81ae078  ! 550: LDD_I	ldd	[%r11 + 0x0078], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd322c01f  ! 551: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 552: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8da903f  ! 553: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xc83a801f  ! 554: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 555: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2903f  ! 556: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc84a801f  ! 557: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd0caa028  ! 558: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r8
	.word 0xd1ba985f  ! 559: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce52a00c  ! 560: LDSH_I	ldsh	[%r10 + 0x000c], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba983f  ! 561: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa008  ! 562: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xcfba987f  ! 563: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 564: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20a801f  ! 565: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502801f  ! 566: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5f2903f  ! 567: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba995f  ! 568: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 569: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 570: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc25aa030  ! 571: LDX_I	ldx	[%r10 + 0x0030], %r1
	.word 0xc3ba981f  ! 572: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 573: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc602801f  ! 574: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc7ba98bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd24aa009  ! 576: LDSB_I	ldsb	[%r10 + 0x0009], %r9
	.word 0xca4a801f  ! 577: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc39ae038  ! 578: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xc3bad95f  ! 579: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 580: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03ac01f  ! 581: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 582: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc80aa025  ! 583: LDUB_I	ldub	[%r10 + 0x0025], %r4
	.word 0xce92a05e  ! 584: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r7
	.word 0xcff2911f  ! 585: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59ae068  ! 586: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xc5e2e01f  ! 587: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 588: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xca8ad03f  ! 589: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xcbe2d03f  ! 590: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad99f  ! 591: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0ac01f  ! 592: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xd3baa048  ! 593: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xcd9aa040  ! 594: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xcdf2a01f  ! 595: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2a01f  ! 596: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd092d17f  ! 597: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r8
	.word 0xc812801f  ! 598: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc9f2901f  ! 599: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 600: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba999f  ! 601: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc522c01f  ! 602: STF_R	st	%f2, [%r31, %r11]
	.word 0xd19aa070  ! 603: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xc79ae040  ! 604: LDDFA_I	ldda	[%r11, 0x0040], %f3
	.word 0xc7bad81f  ! 605: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc442e03c  ! 606: LDSW_I	ldsw	[%r11 + 0x003c], %r2
	.word 0xc5f2e01f  ! 607: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 608: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 609: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 610: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca92d07f  ! 611: LDUHA_R	lduha	[%r11, %r31] 0x83, %r5
	.word 0xc702801f  ! 612: LDF_R	ld	[%r10, %r31], %f3
	.word 0xce42801f  ! 613: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcfba999f  ! 614: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd282a074  ! 615: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc41a801f  ! 616: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 617: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba995f  ! 618: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa070  ! 619: STD_I	std	%r2, [%r10 + 0x0070]
	.word 0xd212a036  ! 620: LDUH_I	lduh	[%r10 + 0x0036], %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01ac01f  ! 621: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xcc5aa008  ! 622: LDX_I	ldx	[%r10 + 0x0008], %r6
	.word 0xcd02a07c  ! 623: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xcdba997f  ! 624: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3bae048  ! 625: STDFA_I	stda	%f9, [0x0048, %r11]
TH_LABEL625:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bae008  ! 626: STDFA_I	stda	%f1, [0x0008, %r11]
	.word 0xc492905f  ! 627: LDUHA_R	lduha	[%r10, %r31] 0x82, %r2
	.word 0xd292a032  ! 628: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r9
	.word 0xd3e2a01f  ! 629: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc252a06e  ! 630: LDSH_I	ldsh	[%r10 + 0x006e], %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba999f  ! 631: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 632: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3e2913f  ! 633: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2901f  ! 634: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba981f  ! 635: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba98bf  ! 636: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ae020  ! 637: LDD_I	ldd	[%r11 + 0x0020], %r4
	.word 0xc9bad89f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccd2a02c  ! 639: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r6
	.word 0xcdba99bf  ! 640: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL640:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba98bf  ! 641: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2caa003  ! 642: LDSBA_I	ldsba	[%r10, + 0x0003] %asi, %r9
	.word 0xd3ba993f  ! 643: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 644: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 645: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa000  ! 646: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd03aa000  ! 647: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba99bf  ! 648: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 649: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xc7baa050  ! 650: STDFA_I	stda	%f3, [0x0050, %r10]
TH_LABEL650:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbaa008  ! 651: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xcbe2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc39aa070  ! 653: LDDFA_I	ldda	[%r10, 0x0070], %f1
	.word 0xd08aa028  ! 654: LDUBA_I	lduba	[%r10, + 0x0028] %asi, %r8
	.word 0xcbbae010  ! 655: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd302801f  ! 656: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3f2903f  ! 657: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 659: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 660: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba983f  ! 661: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcdbaa068  ! 662: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xc282a00c  ! 663: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r1
	.word 0xd09ae070  ! 664: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r8
	.word 0xd3e2e01f  ! 665: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03ae070  ! 666: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcb9aa008  ! 667: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xcbf2913f  ! 668: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 669: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 670: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2d2e04a  ! 671: LDSHA_I	ldsha	[%r11, + 0x004a] %asi, %r1
	.word 0xc3e2e01f  ! 672: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad9bf  ! 673: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 674: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 675: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 676: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc20aa061  ! 677: LDUB_I	ldub	[%r10 + 0x0061], %r1
	.word 0xc3ba993f  ! 678: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 679: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccc2a008  ! 681: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r6
	.word 0xcdf2a01f  ! 682: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcbbaa040  ! 683: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xcbba983f  ! 684: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc522c01f  ! 685: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd012a054  ! 686: LDUH_I	lduh	[%r10 + 0x0054], %r8
	.word 0xcf02a054  ! 687: LDF_I	ld	[%r10, 0x0054], %f7
	.word 0xcfe2a01f  ! 688: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 690: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba985f  ! 691: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc1a801f  ! 693: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba997f  ! 694: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 695: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc9aa058  ! 696: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r6
	.word 0xcc3a801f  ! 697: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd25ae078  ! 698: LDX_I	ldx	[%r11 + 0x0078], %r9
	.word 0xd3f2e01f  ! 699: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad93f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2e01f  ! 701: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd102a028  ! 702: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xd1e2911f  ! 703: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc252a044  ! 704: LDSH_I	ldsh	[%r10 + 0x0044], %r1
	.word 0xc5bae008  ! 705: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad8bf  ! 706: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc7baa038  ! 707: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xcc5ae048  ! 708: LDX_I	ldx	[%r11 + 0x0048], %r6
	.word 0xcf02801f  ! 709: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba981f  ! 710: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc702801f  ! 711: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcc1a801f  ! 712: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcdba985f  ! 713: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 714: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2911f  ! 715: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc49aa070  ! 716: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xc5ba995f  ! 717: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 718: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 719: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2913f  ! 720: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca82905f  ! 721: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xcf22c01f  ! 722: STF_R	st	%f7, [%r31, %r11]
	.word 0xc8cad15f  ! 723: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r4
	.word 0xcc1ac01f  ! 724: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfbad97f  ! 725: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc85a801f  ! 726: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc83a801f  ! 727: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba999f  ! 728: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 729: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd39ae040  ! 730: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc282a020  ! 731: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r1
	.word 0xd012a07c  ! 732: LDUH_I	lduh	[%r10 + 0x007c], %r8
	.word 0xc702c01f  ! 733: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcb02801f  ! 734: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc83a801f  ! 735: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba991f  ! 736: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 737: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 738: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd24aa01f  ! 739: LDSB_I	ldsb	[%r10 + 0x001f], %r9
	.word 0xcedae048  ! 740: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xced2901f  ! 741: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xc3bae000  ! 742: STDFA_I	stda	%f1, [0x0000, %r11]
	.word 0xc3bad85f  ! 743: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd20aa02d  ! 744: LDUB_I	ldub	[%r10 + 0x002d], %r9
	.word 0xcb02a02c  ! 745: LDF_I	ld	[%r10, 0x002c], %f5
TH_LABEL745:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2d2e036  ! 746: LDSHA_I	ldsha	[%r11, + 0x0036] %asi, %r1
	.word 0xc242a040  ! 747: LDSW_I	ldsw	[%r10 + 0x0040], %r1
	.word 0xcfbae038  ! 748: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 750: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad85f  ! 751: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3bae070  ! 752: STDFA_I	stda	%f9, [0x0070, %r11]
	.word 0xd3bad87f  ! 753: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 754: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 755: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad83f  ! 756: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 757: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd03ae070  ! 758: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc99aa030  ! 759: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xc20ae008  ! 760: LDUB_I	ldub	[%r11 + 0x0008], %r1
TH_LABEL760:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2e01f  ! 761: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd282a064  ! 762: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r9
	.word 0xd3f2901f  ! 763: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba985f  ! 764: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 765: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba983f  ! 766: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd28ae055  ! 767: LDUBA_I	lduba	[%r11, + 0x0055] %asi, %r9
	.word 0xc892e008  ! 768: LDUHA_I	lduha	[%r11, + 0x0008] %asi, %r4
	.word 0xc68a903f  ! 769: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xc64aa00a  ! 770: LDSB_I	ldsb	[%r10 + 0x000a], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd22801f  ! 771: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 772: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 773: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02801f  ! 774: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc4da911f  ! 775: LDXA_R	ldxa	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2a01f  ! 776: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 777: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 778: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc43a801f  ! 779: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc502c01f  ! 780: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2e01f  ! 781: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2d03f  ! 782: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad95f  ! 783: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 784: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 785: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2caa039  ! 786: LDSBA_I	ldsba	[%r10, + 0x0039] %asi, %r9
	.word 0xcac2d03f  ! 787: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r5
	.word 0xcbbad91f  ! 788: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc81ac01f  ! 789: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc9f2e01f  ! 790: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ae038  ! 791: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xc9bad83f  ! 792: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 793: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc85ae010  ! 794: LDX_I	ldx	[%r11 + 0x0010], %r4
	.word 0xc9e2d01f  ! 795: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad95f  ! 796: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 797: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 798: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102a04c  ! 799: LDF_I	ld	[%r10, 0x004c], %f8
	.word 0xcc82d07f  ! 800: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc89ae030  ! 801: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xc39ae050  ! 802: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xcd9aa068  ! 803: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcd22801f  ! 804: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 805: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba99bf  ! 806: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 807: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9baa058  ! 808: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xca8ad15f  ! 809: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r5
	.word 0xcbe2d01f  ! 810: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad95f  ! 811: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcd9ae000  ! 812: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xcde2e01f  ! 813: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad83f  ! 814: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca52801f  ! 815: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2901f  ! 816: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd042e06c  ! 817: LDSW_I	ldsw	[%r11 + 0x006c], %r8
	.word 0xd03ac01f  ! 818: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc20aa01e  ! 819: LDUB_I	ldub	[%r10 + 0x001e], %r1
	.word 0xc322801f  ! 820: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba997f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 822: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa040  ! 823: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r0
	.word 0xc842c01f  ! 824: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9bad9bf  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc92d13f  ! 826: LDUHA_R	lduha	[%r11, %r31] 0x89, %r6
	.word 0xcc1ac01f  ! 827: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd19aa020  ! 828: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xd102c01f  ! 829: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd03ac01f  ! 830: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2d01f  ! 831: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 832: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 833: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 834: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2e01f  ! 835: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xceca917f  ! 836: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r7
	.word 0xcecae077  ! 837: LDSBA_I	ldsba	[%r11, + 0x0077] %asi, %r7
	.word 0xcfbad81f  ! 838: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcd9aa048  ! 839: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcdba995f  ! 840: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2a01f  ! 841: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2a01f  ! 842: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc8c2e070  ! 843: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r4
	.word 0xc602c01f  ! 844: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 845: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc722801f  ! 846: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 847: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 849: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc682d07f  ! 850: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd012e032  ! 851: LDUH_I	lduh	[%r11 + 0x0032], %r8
	.word 0xd1bad95f  ! 852: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 853: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2e01f  ! 854: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 855: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2e01f  ! 856: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 857: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 858: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 859: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad87f  ! 860: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc302801f  ! 861: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3ba98bf  ! 862: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 863: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 864: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc03a801f  ! 865: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc202801f  ! 866: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3e2901f  ! 867: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc8c2a008  ! 868: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r4
	.word 0xd08a901f  ! 869: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xd03a801f  ! 870: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba981f  ! 871: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd00aa039  ! 872: LDUB_I	ldub	[%r10 + 0x0039], %r8
	.word 0xc642801f  ! 873: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7ba983f  ! 874: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 875: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba991f  ! 876: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 877: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba989f  ! 878: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 879: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2913f  ! 880: CASA_I	casa	[%r10] 0x89, %r31, %r3
TH_LABEL880:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa038  ! 881: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 882: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7ba995f  ! 883: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf02c01f  ! 884: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcfe2e01f  ! 885: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad91f  ! 886: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc3ac01f  ! 888: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc79ae050  ! 889: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xc7bad81f  ! 890: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bad97f  ! 891: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 892: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 893: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc522c01f  ! 894: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 895: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad81f  ! 896: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 897: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 898: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad9bf  ! 899: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca12c01f  ! 900: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad8bf  ! 901: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 902: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ae050  ! 903: STD_I	std	%r4, [%r11 + 0x0050]
	.word 0xcbf2d11f  ! 904: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad89f  ! 905: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad97f  ! 906: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 907: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc85aa078  ! 908: LDX_I	ldx	[%r10 + 0x0078], %r4
	.word 0xd122801f  ! 909: STF_R	st	%f8, [%r31, %r10]
	.word 0xcf02a008  ! 910: LDF_I	ld	[%r10, 0x0008], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7baa000  ! 911: STDFA_I	stda	%f3, [0x0000, %r10]
	.word 0xc7e2a01f  ! 912: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc2c2a010  ! 913: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r1
	.word 0xc3ba98bf  ! 914: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 915: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2911f  ! 916: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3f2a01f  ! 917: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc8a917f  ! 918: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xcc3aa010  ! 919: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcdba983f  ! 920: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302801f  ! 921: LDF_R	ld	[%r10, %r31], %f9
	.word 0xce12a000  ! 922: LDUH_I	lduh	[%r10 + 0x0000], %r7
	.word 0xcfe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3a801f  ! 924: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2901f  ! 925: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd012801f  ! 926: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd1ba999f  ! 927: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd202e028  ! 928: LDUW_I	lduw	[%r11 + 0x0028], %r9
	.word 0xd3bad91f  ! 929: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 930: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc492a034  ! 931: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r2
	.word 0xc412e03a  ! 932: LDUH_I	lduh	[%r11 + 0x003a], %r2
	.word 0xcd9aa048  ! 933: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcdba985f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 935: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc292d07f  ! 936: LDUHA_R	lduha	[%r11, %r31] 0x83, %r1
	.word 0xc3e2d01f  ! 937: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xd08ae07f  ! 938: LDUBA_I	lduba	[%r11, + 0x007f] %asi, %r8
	.word 0xc812a026  ! 939: LDUH_I	lduh	[%r10 + 0x0026], %r4
	.word 0xc402e018  ! 940: LDUW_I	lduw	[%r11 + 0x0018], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2e01f  ! 941: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 942: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae018  ! 943: STD_I	std	%r2, [%r11 + 0x0018]
	.word 0xc502e000  ! 944: LDF_I	ld	[%r11, 0x0000], %f2
	.word 0xc5f2e01f  ! 945: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad81f  ! 946: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcbbae060  ! 947: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xd2c2a014  ! 948: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r9
	.word 0xc88a901f  ! 949: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc9ba98bf  ! 950: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83aa010  ! 951: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcad2e022  ! 952: LDSHA_I	ldsha	[%r11, + 0x0022] %asi, %r5
	.word 0xcf02801f  ! 953: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba999f  ! 954: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2a01f  ! 956: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2903f  ! 957: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xc4caa008  ! 958: LDSBA_I	ldsba	[%r10, + 0x0008] %asi, %r2
	.word 0xc43aa008  ! 959: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xcb02e07c  ! 960: LDF_I	ld	[%r11, 0x007c], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd122801f  ! 961: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 963: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03a801f  ! 964: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba999f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd102801f  ! 966: LDF_R	ld	[%r10, %r31], %f8
	.word 0xce52a01e  ! 967: LDSH_I	ldsh	[%r10 + 0x001e], %r7
	.word 0xcfba983f  ! 968: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa018  ! 969: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xc852a02c  ! 970: LDSH_I	ldsh	[%r10 + 0x002c], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 971: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 972: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba99bf  ! 973: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa028  ! 974: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xc9ba995f  ! 975: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 976: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc9ae040  ! 977: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r6
	.word 0xcc3ae040  ! 978: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcfe2d11f  ! 979: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad95f  ! 980: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad8bf  ! 981: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc452801f  ! 982: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc9baa000  ! 983: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xc39aa068  ! 984: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xc3ba989f  ! 985: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2901f  ! 987: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba991f  ! 988: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd092913f  ! 989: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xd1ba99bf  ! 990: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2a01f  ! 991: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1e2a01f  ! 992: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba987f  ! 993: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa068  ! 994: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd03aa068  ! 995: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03a801f  ! 996: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 997: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 998: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 999: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 1000: STDFA_R	stda	%f8, [%r31, %r10]
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
.xword 0x3d256f343bcefa3a
.xword 0x5332de66ee6dcf11
.xword 0x3b63cfcecfea702e
.xword 0x0618e9abe11d6a19
.xword 0xbadc31d60da236ac
.xword 0xe72155dfa5684365
.xword 0xfb719be364c5003d
.xword 0x49c00f2d217967a2
.xword 0x31728ea635dc455b
.xword 0x884cc18240a37593
.xword 0x800c654458a81614
.xword 0x1f52f348414fbb95
.xword 0xb31ff0d05aad5153
.xword 0x10a87d6a755b8cfb
.xword 0x5723d0641b169e13
.xword 0x64510cc09cb99495
.xword 0xe8419d46b67b3440
.xword 0x1c3101a0425d6df5
.xword 0xff3cd304aeaad295
.xword 0xc072e783c11880be
.xword 0xc686c33441cf42ea
.xword 0xa4905b63a5eba3a6
.xword 0xb6bbb0cf8dd40745
.xword 0x37959abef62218e4
.xword 0xe2338464e9fe9d2d
.xword 0xe5958b1cc2060b1a
.xword 0x01086f8b401d3016
.xword 0xf0355350b39ec09e
.xword 0x54da5c3590da8231
.xword 0x627102f78c2b0e9a
.xword 0xb16dbaa92a7a7659
.xword 0xc85b458999714662



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
.xword 0xbbda2592fea95175

.xword 0xafb7b92e8b26ebee

.xword 0x1205e1c368b3d1f3

.xword 0x442c4d7514ea7f2d

.xword 0xaf76a0e3a659cb6e

.xword 0xb51abcaa9edf2c5e

.xword 0x752a8749de71460e

.xword 0x65d62ade5e7504ec

.xword 0x3f7d11a32f386365

.xword 0x2104cc11fc574d97

.xword 0x7426acadeff29e33

.xword 0xed3a805e0ae75ef0

.xword 0x5177a23e347bb34c

.xword 0x929360375c723f7c

.xword 0xa1726cde9a186532

.xword 0x3059cad21c869a62

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
.xword 0x7ffd4501197c6de4
.xword 0x648d9056ffc2243d
.xword 0x1b5f51944ddf2d4c
.xword 0x046f79b6cd558011
.xword 0xa00f88ce0f129fb2
.xword 0x89099f0f6f2981e4
.xword 0xe08c1914dca54c9c
.xword 0x9136d3cd1271888e
.xword 0xb530b327b8a31b2f




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
.xword 0x85862acbbb4bbffc
.xword 0x0e15fe49c829cef9
.xword 0xf4b8c4e753411651
.xword 0x7112967d87e75fb9
.xword 0xf81d78eb93eec76d
.xword 0x213d643fbfa6c316
.xword 0x351b3316bac242bd
.xword 0x749edf899e13d26e
.xword 0x3ec5fa8593ae4134




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
.xword 0xeccfbed79732fc70
.xword 0xc3052ab0b125288e
.xword 0x7130a5b9fb72c40a
.xword 0x9e491f22a5665a51
.xword 0xb71201e2d7e8c9a3
.xword 0x36dbf84525bb4bd7
.xword 0xe7dc222e7be8c9da
.xword 0x9815d22c4e2354b9
.xword 0xe08c3d684fd48386




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
.xword 0x2d0a758c3cbbcb58
.xword 0xe5d0b80f49aa0644
.xword 0x0fa0409f22c3e2a2
.xword 0xbd399800f231af96
.xword 0x735162d4e840c3f2
.xword 0xdbc5a4f7e90d48d3
.xword 0x434ccd319c9e1bf8
.xword 0xa0c12e01eb897e1a
.xword 0x2a101b0477c18cb0




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
.xword 0x9267864ea8068156
.xword 0x9fdb7bc276a74ce3
.xword 0x3841ee70de23fa4b
.xword 0x52c3baf2b461d860
.xword 0x8cabff7461aa4dd7
.xword 0x605dc374ab0ddf64
.xword 0xa0656e71e7bb5fc1
.xword 0xdc64c463b188df04
.xword 0xfb50e07d084a3347




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
.xword 0x332a8e98d4d39b47
.xword 0x71e5f31bfcbefffe
.xword 0x7809aef602a905b6
.xword 0x055317d13541ccca
.xword 0x1bfd74ba07cdc4a0
.xword 0x295825ce9d3a4f75
.xword 0x8b032df12877c0bb
.xword 0x1df38e80cd62919b
.xword 0x19d725e6b8f04f77




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
.xword 0x7688818c441cce02
.xword 0x42a9ea7c2701aa1d
.xword 0x1d9930df8c76f10a
.xword 0xa37bf16d7b066836
.xword 0x7c5b117f1cff62f7
.xword 0x9c38e77df224a56e
.xword 0x177fc23be510e5e2
.xword 0x73a1fb2665f80ea0
.xword 0x678e6af5eb059f2d






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
.xword 0xe688b609ca2dc30c

.xword 0x60f7bf0662bcefed

.xword 0x647e27ed630473fe

.xword 0xd5479f70f4816d4f

.xword 0x107fd9deef4da801

.xword 0xbeabd90ddacc9caf

.xword 0x0c811aafbcc0c2e9

.xword 0xa0c97e2c50e5a55b

.xword 0x79c24a09e26f14d1

.xword 0x4d76e632fd2e6143

.xword 0x2a0517432f166e2c

.xword 0xae12a918e58dd605

.xword 0xb8221b2ee625f85a

.xword 0x5718f0ccc74a425c

.xword 0x040995bde76b1f2d

.xword 0x7087b4c373d55100




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
.xword 0xd1e8ad851f0dbb11
.xword 0xa08776935a9ed257
.xword 0x23b3ad995aa9e3d8
.xword 0x432d85d39916b0c5
.xword 0x19d85188a18ce66d
.xword 0xa0261be94cd86a68
.xword 0x914a00896a833d6c
.xword 0x36370e3bbdb5b76d



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
.xword 0xc5f8c441991193a3
.xword 0x9c5b46d5849ecf5b
.xword 0x68f37da1e945a69a
.xword 0x732b8b9ca9932275
.xword 0x57d4ad5728b7e5b7
.xword 0x59b19baef5150ec0
.xword 0x1dbb818f7f6bbf24
.xword 0xeb458c52fb35ccf9



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
.xword 0x4ea6e9a2236e6935
.xword 0x538ae5195e83ce96
.xword 0x36032512c90a24fb
.xword 0x312f956001654803
.xword 0xc569d36665dbf7a7
.xword 0x12f84e89cd8e30bd
.xword 0xda602cbeb0271d57
.xword 0x410e4ff5d67fda8f



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
.xword 0x2c127b5d7cae658a
.xword 0xbbfa802d2b8db9db
.xword 0x127982c08e65c32b
.xword 0x500831d4ca3432a5
.xword 0xb91e1a0786d776ba
.xword 0x1055e5cb099044b5
.xword 0xb2495dbfb94ff1de
.xword 0x9b2f6534f7785154



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
.xword 0xba58e1d3718e4160
.xword 0xc80733cea5c0d869
.xword 0x97e71818ee281438
.xword 0xcfad04fbfe923db2
.xword 0xfee76466311962e2
.xword 0xd425cf75955552f2
.xword 0x53d12e3f966502b3
.xword 0xe70ef8d398d334d4



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
.xword 0xce9fe991c53a5b4a
.xword 0xc39aa1f551fa87c8
.xword 0x94a5c8c8ec99a93d
.xword 0x4a4cf12a5631cd24
.xword 0x2a1d461c873f6992
.xword 0x2d5bd1af29f1c16d
.xword 0xd5e74b68144a9c6d
.xword 0x7f0dada261ef77de



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
.xword 0x7cf9ba21b5be125e
.xword 0xb000e634dcb39c43
.xword 0x16e9384873ce7733
.xword 0x0fd34498b7ac8070
.xword 0x404db24915dc404c
.xword 0xdaa24605f3d8cec0
.xword 0x32463f0bc6a5be37
.xword 0x2e15fcd9d5679f1a





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
.xword 0x95a705dbd0ed0e17

.xword 0x06c2011656871ec2

.xword 0xde7b41eb1a10bc40

.xword 0x7298b481cc4aa530

.xword 0xe9cf69429fbb24b9

.xword 0x25a6a32033938130

.xword 0xae26ba13e63fb144

.xword 0x0973cd1e98d56d54

.xword 0x6415cd2c650aceae

.xword 0x8b79a0b52a7b80da

.xword 0xb180b7bf0760e835

.xword 0x0035a174c40e4009

.xword 0x758242c2b23a5ae2

.xword 0xddb5279a21f9ac5e

.xword 0x61a4ba6f98c2d700

.xword 0x88c896c4d4b4e2ad

.xword 0xb223afd58cf64b3d

.xword 0x7024d81624a1f68a

.xword 0x74db1caf4fec4caf

.xword 0xed4ff84cfb64fb2e

.xword 0x85d99c3b4b434c1e

.xword 0xf5f4e90c245757ff

.xword 0xa8c0c476f69ae868

.xword 0xd3b2b2a7748c02ca

.xword 0x9a1248ba1a070476

.xword 0xd5dfef2f59b839b9

.xword 0xd7f86c3139db6327

.xword 0x1e2f18a4ff86bf9c

.xword 0xcbf68da1261a6f06

.xword 0xa4583a044903a1e9

.xword 0x8ceff937b66ed5ad

.xword 0x951ba75efb18244a

.xword 0x4169cae3a537cbcd

.xword 0x8d43d5111439947f

.xword 0x12681141965c9c11

.xword 0xf2f0cbbf21bd951d

.xword 0x6bedb75b2e3278c3

.xword 0x311ab846dbab9541

.xword 0x87f7fd9d7702987d

.xword 0x28f5bac8e3a5b625

.xword 0xe01a88c8a79d945d

.xword 0xe2991fcd1e1a523b

.xword 0xca502721792ba8b4

.xword 0xb11deb01cbbc9801

.xword 0x85bae85684c77aff

.xword 0xa4fe0ad961890a12

.xword 0xdfe9c9b3bfb74a19

.xword 0x2ce2b9ccf66a70dc

.xword 0xee4c014b7d367368

.xword 0x6541be0d0d206754

.xword 0xcf10e415b2b31db3

.xword 0x014584ff9e79aba2

.xword 0xe8ee53a82903cc60

.xword 0xedfbde7fbba6f4a5

.xword 0xe1e4066aa43c7bf1

.xword 0x4aa280ce82269634

.xword 0xc436dc3da0f9cb72

.xword 0x83dc89385893b38c

.xword 0x04725cb2069ceea1

.xword 0x7bc4cf7761280838

.xword 0xf4f2cc863e16bbda

.xword 0x53f9ef3c5e4a9881

.xword 0xfd35e6bf5b5e1420

.xword 0xf41f027539b59ede

.xword 0x984fa8acc2149a47

.xword 0xbad6dc2abd9e98c6

.xword 0x39b90ddb61de67b5

.xword 0xe9fea2409edd0098

.xword 0x14f36260c005f6e5

.xword 0x506b36d47d61590a

.xword 0x43129e1253892bbf

.xword 0xbef448708aced5cc

.xword 0x615c01976c3be8a3

.xword 0xf0ec4ff55382bcc6

.xword 0x236ef4763e2f5f66

.xword 0x8b09c1a2fc3ae504

.xword 0xeebe9cd8aa54c3b2

.xword 0x8a83c755d1e4b744

.xword 0x223bd04af7698037

.xword 0xcca62b00ff9e726b

.xword 0x0e82d0261db5d25b

.xword 0x4e5ca73823ac79a0

.xword 0x0c0fd6deebef9c57

.xword 0x3e6270079d790c99

.xword 0xb66a5be5f50f1d7a

.xword 0x5cac5bcacfac7b34

.xword 0x2c4b171ca8904a7a

.xword 0xb72ec4cc6a5626a8

.xword 0x826cc93193c8d9d5

.xword 0x405bbce8949a09cc

.xword 0x0b9172183d067115

.xword 0x3c39f35f35958602

.xword 0x71a9bfe11de3568b

.xword 0x6232c3eb2017bd5d

.xword 0xafe6cfba5970fc9a

.xword 0xe0fedaac754fa7e7

.xword 0xf89adeb14c2b3047

.xword 0x0eff8b23171b7299

.xword 0x12e93d3637a7bebf

.xword 0x999834655f88af42

.xword 0x7d2f967289d3ef3c

.xword 0xb3f7ef7bff1ddb16

.xword 0x67b570ad26cdce65

.xword 0x93bd1ca1c20e09d4

.xword 0x184879bd61dd646a

.xword 0x45fe33ca8f99d6e3

.xword 0x453f0640ce07fb8f

.xword 0x0e5f8bd4518ffd56

.xword 0xcfb40f90544d1a62

.xword 0x778bc3b64a830bd2

.xword 0xcda1ca6941d85918

.xword 0x1f0e90bd6cb3b8ef

.xword 0x70223dedd434a185

.xword 0xc674211cba172cb6

.xword 0x6cb84b4ea6784e06

.xword 0x26131cb5f543e96c

.xword 0x413d7c433d42d93a

.xword 0x1c9bca6eccf3d979

.xword 0x13733429905f07d0

.xword 0x9f9370d6f372b686

.xword 0x00043dd0d02568ad

.xword 0xfcb841f8549cd053

.xword 0xd3bfa1333dbead6b

.xword 0x46b908194f439fe2

.xword 0xc7c63ca165e252d1

.xword 0xac688efd90c861a5

.xword 0xcece9d1cd9e17f3b

.xword 0x26c78a017ed951c7

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
