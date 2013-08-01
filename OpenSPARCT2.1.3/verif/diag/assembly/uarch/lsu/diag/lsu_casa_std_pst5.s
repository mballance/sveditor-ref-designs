/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst5.s
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
	setx 0xc5f1211fd176d471, %g1, %r2
	setx 0x707ef112ae8573bc, %g1, %r3
	setx 0xe44bfbc3b080fae7, %g1, %r4
	setx 0xba5ede7bd8d6e3fe, %g1, %r5
	setx 0x1a72cc969b828dcf, %g1, %r6
	setx 0x3537f6eff06b59e7, %g1, %r7
	setx 0xbbfe4ade57ea1c06, %g1, %r8

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
	.word 0xc492a03e  ! 1: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r2
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc482e07c  ! 4: LDUWA_I	lduwa	[%r11, + 0x007c] %asi, %r2
	.word 0xc7ba997f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc40a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd2d2901f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xcc5a801f  ! 8: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd3bad89f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc3baa058  ! 10: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad91f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8ca901f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xce52a038  ! 17: LDSH_I	ldsh	[%r10 + 0x0038], %r7
	.word 0xc5bae060  ! 18: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xc5ba99bf  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL20:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba99bf  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc8d2e048  ! 23: LDSHA_I	ldsha	[%r11, + 0x0048] %asi, %r4
	.word 0xc7ba981f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa020  ! 25: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba981f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9baa020  ! 28: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xca0ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc3e2d01f  ! 30: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad91f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd282a028  ! 33: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r9
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbad93f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca82d03f  ! 37: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r5
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc242e004  ! 39: LDSW_I	ldsw	[%r11 + 0x0004], %r1
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
TH_LABEL40:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba999f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302801f  ! 42: LDF_R	ld	[%r10, %r31], %f1
	.word 0xccdad01f  ! 43: LDXA_R	ldxa	[%r11, %r31] 0x80, %r6
	.word 0xc7ba999f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba981f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02a07c  ! 47: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xc6c2915f  ! 48: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r3
	.word 0xc25a801f  ! 49: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc5ba991f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbae070  ! 52: STDFA_I	stda	%f6, [0x0070, %r11]
	.word 0xc48ae04a  ! 53: LDUBA_I	lduba	[%r11, + 0x004a] %asi, %r2
	.word 0xc8daa078  ! 54: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r4
	.word 0xc9bad89f  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bad91f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 59: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcc52a042  ! 60: LDSH_I	ldsh	[%r10 + 0x0042], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2913f  ! 61: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba993f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc52801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcc82a068  ! 65: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc01aa008  ! 66: LDD_I	ldd	[%r10 + 0x0008], %r0
	.word 0xc302e028  ! 67: LDF_I	ld	[%r11, 0x0028], %f1
	.word 0xc3bae000  ! 68: STDFA_I	stda	%f1, [0x0000, %r11]
	.word 0xc3ba989f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc49ae040  ! 70: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r2
TH_LABEL70:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba989f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc522c01f  ! 72: STF_R	st	%f2, [%r31, %r11]
	.word 0xd002a010  ! 73: LDUW_I	lduw	[%r10 + 0x0010], %r8
	.word 0xcf02a028  ! 74: LDF_I	ld	[%r10, 0x0028], %f7
	.word 0xc502801f  ! 75: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba987f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba98bf  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba98bf  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc812801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcb9ae010  ! 83: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2901f  ! 85: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba987f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc202801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcc0ac01f  ! 92: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xca92907f  ! 94: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xcbbaa038  ! 95: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad87f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc8ae07e  ! 97: LDUBA_I	lduba	[%r11, + 0x007e] %asi, %r6
	.word 0xc2ca911f  ! 98: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r1
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xce12a008  ! 100: LDUH_I	lduh	[%r10 + 0x0008], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02a050  ! 101: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xc602c01f  ! 102: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc39aa058  ! 103: LDDFA_I	ldda	[%r10, 0x0058], %f1
	.word 0xc522801f  ! 104: STF_R	st	%f2, [%r31, %r10]
	.word 0xc502801f  ! 105: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02c01f  ! 106: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc302e014  ! 107: LDF_I	ld	[%r11, 0x0014], %f1
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc4d2917f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
TH_LABEL110:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba991f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba999f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca4aa05b  ! 115: LDSB_I	ldsb	[%r10 + 0x005b], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad91f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 120: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad9bf  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc412801f  ! 122: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc60ac01f  ! 123: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba995f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc45aa028  ! 128: LDX_I	ldx	[%r10 + 0x0028], %r2
	.word 0xc702a060  ! 129: LDF_I	ld	[%r10, 0x0060], %f3
	.word 0xd28ad13f  ! 130: LDUBA_R	lduba	[%r11, %r31] 0x89, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3f2913f  ! 131: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba999f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 134: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd28aa065  ! 135: LDUBA_I	lduba	[%r10, + 0x0065] %asi, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba991f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 137: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcf02801f  ! 138: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfe2d11f  ! 139: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d13f  ! 140: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad85f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad81f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
TH_LABEL145:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502e078  ! 146: LDF_I	ld	[%r11, 0x0078], %f2
	.word 0xcd02e008  ! 147: LDF_I	ld	[%r11, 0x0008], %f6
	.word 0xcbba985f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc4dae040  ! 149: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r2
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad97f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82a030  ! 152: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r6
	.word 0xc2c2917f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r1
	.word 0xc41ae068  ! 154: LDD_I	ldd	[%r11 + 0x0068], %r2
	.word 0xc882903f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d13f  ! 157: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad91f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd09ae040  ! 161: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r8
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc28a907f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xcb02a00c  ! 164: LDF_I	ld	[%r10, 0x000c], %f5
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba981f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc692905f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xd052801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd0caa000  ! 169: LDSBA_I	ldsba	[%r10, + 0x0000] %asi, %r8
	.word 0xc5ba983f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba981f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd25a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcdba999f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcec2a020  ! 175: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba995f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc2d2e078  ! 178: LDSHA_I	ldsha	[%r11, + 0x0078] %asi, %r1
	.word 0xd28a901f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
	.word 0xcfbaa070  ! 180: STDFA_I	stda	%f7, [0x0070, %r10]
TH_LABEL180:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2911f  ! 181: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xcd22801f  ! 182: STF_R	st	%f6, [%r31, %r10]
	.word 0xd322801f  ! 183: STF_R	st	%f9, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d11f  ! 185: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7baa078  ! 186: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xcbba989f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf9aa008  ! 188: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xcc12e070  ! 189: LDUH_I	lduh	[%r11 + 0x0070], %r6
	.word 0xcccad17f  ! 190: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r6
TH_LABEL190:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc802c01f  ! 192: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc9ba981f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc92a028  ! 194: LDUHA_I	lduha	[%r10, + 0x0028] %asi, %r6
	.word 0xd012801f  ! 195: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc09aa028  ! 198: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r0
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL200:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccc2e070  ! 201: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r6
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 205: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba981f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2903f  ! 209: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba993f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL210:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7f2903f  ! 211: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xca8ae00f  ! 212: LDUBA_I	lduba	[%r11, + 0x000f] %asi, %r5
	.word 0xca82e068  ! 213: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r5
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad97f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad85f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc12c01f  ! 217: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xc7ba981f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd09aa010  ! 220: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba981f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc6d2903f  ! 223: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r3
	.word 0xcdba987f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 225: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc322c01f  ! 226: STF_R	st	%f1, [%r31, %r11]
	.word 0xd212e01e  ! 227: LDUH_I	lduh	[%r11 + 0x001e], %r9
	.word 0xcf22801f  ! 228: STF_R	st	%f7, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc402e064  ! 230: LDUW_I	lduw	[%r11 + 0x0064], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba983f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb22801f  ! 232: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3ba981f  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf02801f  ! 234: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad91f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc252801f  ! 242: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc892915f  ! 243: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xd1bad81f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2d2d01f  ! 245: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd102801f  ! 246: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcbbaa030  ! 247: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xc3ba987f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc852801f  ! 249: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcfbaa050  ! 250: STDFA_I	stda	%f7, [0x0050, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad93f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc852a026  ! 254: LDSH_I	ldsh	[%r10 + 0x0026], %r4
	.word 0xc7ba993f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL255:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc522801f  ! 256: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbe2901f  ! 257: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba993f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4cae03e  ! 261: LDSBA_I	ldsba	[%r11, + 0x003e] %asi, %r2
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d01f  ! 263: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd082d07f  ! 267: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r8
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d03f  ! 269: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad9bf  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc79aa020  ! 271: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xd1bad83f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xd212a076  ! 275: LDUH_I	lduh	[%r10 + 0x0076], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad81f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd292917f  ! 279: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2901f  ! 281: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc852a056  ! 284: LDSH_I	ldsh	[%r10 + 0x0056], %r4
	.word 0xc20ae07b  ! 285: LDUB_I	ldub	[%r11 + 0x007b], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc6d2903f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r3
	.word 0xc9ba987f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 289: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3f2d13f  ! 290: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6da905f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x82, %r3
	.word 0xc842801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc902801f  ! 293: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9ba985f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7bae028  ! 295: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc09aa038  ! 296: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r0
	.word 0xc5bad8bf  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcdbae030  ! 299: STDFA_I	stda	%f6, [0x0030, %r11]
	.word 0xcbba981f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd2cad13f  ! 303: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r9
	.word 0xcbe2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 305: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc81ac01f  ! 306: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc24ac01f  ! 307: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad85f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad99f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d13f  ! 313: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad93f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80ae053  ! 315: LDUB_I	ldub	[%r11 + 0x0053], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba983f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc642a044  ! 318: LDSW_I	ldsw	[%r10 + 0x0044], %r3
	.word 0xd122801f  ! 319: STF_R	st	%f8, [%r31, %r10]
	.word 0xcf22801f  ! 320: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2901f  ! 321: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc722801f  ! 323: STF_R	st	%f3, [%r31, %r10]
	.word 0xc242e014  ! 324: LDSW_I	ldsw	[%r11 + 0x0014], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad89f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2daa008  ! 328: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r9
	.word 0xcfba987f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba997f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd292d15f  ! 332: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r9
	.word 0xc9f2901f  ! 333: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc442801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc39aa040  ! 335: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302a024  ! 336: LDF_I	ld	[%r10, 0x0024], %f1
	.word 0xc492a00c  ! 337: LDUHA_I	lduha	[%r10, + 0x000c] %asi, %r2
	.word 0xd3bad95f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d11f  ! 339: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad81f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad9bf  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad95f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcb9ae058  ! 344: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xced2e050  ! 345: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r7
TH_LABEL345:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc59aa020  ! 346: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc502801f  ! 348: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcbbae060  ! 350: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcfbaa010  ! 357: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xcdba983f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc902801f  ! 360: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad81f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02801f  ! 362: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc642801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9ba997f  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc92901f  ! 366: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad97f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad81f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca12a012  ! 371: LDUH_I	lduh	[%r10 + 0x0012], %r5
	.word 0xc9f2913f  ! 372: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xd3baa048  ! 373: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xd09ae048  ! 374: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
	.word 0xd102801f  ! 375: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce92e04c  ! 376: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r7
	.word 0xd082a014  ! 377: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r8
	.word 0xd122801f  ! 378: STF_R	st	%f8, [%r31, %r10]
	.word 0xc39aa010  ! 379: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcfba981f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba987f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc302801f  ! 382: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc322801f  ! 383: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5bad93f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad91f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d01f  ! 389: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc802a058  ! 390: LDUW_I	lduw	[%r10 + 0x0058], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc922801f  ! 391: STF_R	st	%f4, [%r31, %r10]
	.word 0xcf22801f  ! 392: STF_R	st	%f7, [%r31, %r10]
	.word 0xd1ba995f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292e004  ! 395: LDUHA_I	lduha	[%r11, + 0x0004] %asi, %r9
TH_LABEL395:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb9aa030  ! 396: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xc59ae058  ! 397: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba989f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4d2a010  ! 400: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd28a915f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r9
	.word 0xc5baa010  ! 402: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xc5e2901f  ! 403: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc41a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3bad83f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bad8bf  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc12801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7bad97f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc452c01f  ! 411: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc4c2911f  ! 412: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
	.word 0xc81ac01f  ! 413: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd0ca911f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xc722801f  ! 415: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd08ad03f  ! 416: LDUBA_R	lduba	[%r11, %r31] 0x81, %r8
	.word 0xd302a030  ! 417: LDF_I	ld	[%r10, 0x0030], %f9
	.word 0xcfbad95f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 420: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1baa030  ! 421: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba981f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc09aa050  ! 424: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r0
	.word 0xcecaa04b  ! 425: LDSBA_I	ldsba	[%r10, + 0x004b] %asi, %r7
TH_LABEL425:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba981f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 427: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc3e2911f  ! 428: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc4d2a054  ! 429: LDSHA_I	ldsha	[%r10, + 0x0054] %asi, %r2
	.word 0xc9bad97f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad91f  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc802e034  ! 433: LDUW_I	lduw	[%r11 + 0x0034], %r4
	.word 0xc4cae062  ! 434: LDSBA_I	ldsba	[%r11, + 0x0062] %asi, %r2
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bae038  ! 436: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xd1e2d13f  ! 437: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xcad2907f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r5
	.word 0xcfba999f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc8da911f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2c2903f  ! 445: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd9ae068  ! 446: LDDFA_I	ldda	[%r11, 0x0068], %f6
	.word 0xc412801f  ! 447: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd19ae000  ! 449: LDDFA_I	ldda	[%r11, 0x0000], %f8
	.word 0xcdba999f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc20a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2901f  ! 454: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcf9aa008  ! 455: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4caa026  ! 456: LDSBA_I	ldsba	[%r10, + 0x0026] %asi, %r2
	.word 0xc302a04c  ! 457: LDF_I	ld	[%r10, 0x004c], %f1
	.word 0xcc5aa030  ! 458: LDX_I	ldx	[%r10 + 0x0030], %r6
	.word 0xcc8ad01f  ! 459: LDUBA_R	lduba	[%r11, %r31] 0x80, %r6
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb9aa068  ! 461: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xc99aa060  ! 462: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xcdf2d03f  ! 463: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad91f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd0d2917f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r8
	.word 0xcbbaa040  ! 467: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xd3f2d01f  ! 468: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc212c01f  ! 469: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xcde2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc41aa018  ! 472: LDD_I	ldd	[%r10 + 0x0018], %r2
	.word 0xc99ae008  ! 473: LDDFA_I	ldda	[%r11, 0x0008], %f4
	.word 0xcdba993f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc5ac01f  ! 477: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcbbaa020  ! 478: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xcb02e038  ! 479: LDF_I	ld	[%r11, 0x0038], %f5
	.word 0xd1bad81f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc01a801f  ! 482: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc4c2905f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xcfba98bf  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc3baa040  ! 485: STDFA_I	stda	%f1, [0x0040, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd242c01f  ! 486: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xd28a907f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x83, %r9
	.word 0xc3ba981f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 489: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcb9aa060  ! 490: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbad8bf  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbae000  ! 494: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xce4a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc20a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xce4ac01f  ! 499: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc7e2d01f  ! 500: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd242a030  ! 501: LDSW_I	ldsw	[%r10 + 0x0030], %r9
	.word 0xce8a911f  ! 502: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xd08ad15f  ! 503: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r8
	.word 0xc452801f  ! 504: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5e2911f  ! 505: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc482903f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r2
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba983f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc09ae070  ! 510: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r0
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba987f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd322c01f  ! 517: STF_R	st	%f9, [%r31, %r11]
	.word 0xc5bad85f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xceda917f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r7
	.word 0xc6daa078  ! 522: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r3
	.word 0xcbe2901f  ! 523: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba989f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba993f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd102801f  ! 527: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfba999f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20a801f  ! 529: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd1bad95f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc852e03a  ! 531: LDSH_I	ldsh	[%r11 + 0x003a], %r4
	.word 0xd1f2d03f  ! 532: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xcf9ae000  ! 533: LDDFA_I	ldda	[%r11, 0x0000], %f7
	.word 0xc9ba98bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 536: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcbe2903f  ! 537: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc302e070  ! 538: LDF_I	ld	[%r11, 0x0070], %f1
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2903f  ! 541: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba983f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa070  ! 544: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xc7ba985f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd39aa060  ! 546: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xca02801f  ! 547: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd1bad89f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc44ac01f  ! 550: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbe2d13f  ! 551: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad87f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
TH_LABEL555:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce8ae042  ! 556: LDUBA_I	lduba	[%r11, + 0x0042] %asi, %r7
	.word 0xc7ba993f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc252a07a  ! 559: LDSH_I	ldsh	[%r10 + 0x007a], %r1
	.word 0xc892917f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba983f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 562: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd28a917f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba991f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9ae000  ! 567: LDDFA_I	ldda	[%r11, 0x0000], %f7
	.word 0xce5a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba981f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba981f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd0caa01e  ! 572: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r8
	.word 0xcc42e05c  ! 573: LDSW_I	ldsw	[%r11 + 0x005c], %r6
	.word 0xc7ba987f  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd19aa050  ! 575: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd39aa078  ! 576: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xd1ba985f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 578: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba991f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba995f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd28aa018  ! 583: LDUBA_I	lduba	[%r10, + 0x0018] %asi, %r9
	.word 0xc39ae050  ! 584: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xc302801f  ! 585: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc482e034  ! 587: LDUWA_I	lduwa	[%r11, + 0x0034] %asi, %r2
	.word 0xd3ba981f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 590: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba99bf  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba981f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd292907f  ! 595: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702e070  ! 596: LDF_I	ld	[%r11, 0x0070], %f3
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba993f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc99aa040  ! 600: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc64aa010  ! 601: LDSB_I	ldsb	[%r10 + 0x0010], %r3
	.word 0xc45ac01f  ! 602: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad97f  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccda903f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x81, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba981f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca02a058  ! 607: LDUW_I	lduw	[%r10 + 0x0058], %r5
	.word 0xd1ba989f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba98bf  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9aa038  ! 614: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xcc5a801f  ! 615: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19ae040  ! 616: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xcedad11f  ! 617: LDXA_R	ldxa	[%r11, %r31] 0x88, %r7
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba985f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102e074  ! 620: LDF_I	ld	[%r11, 0x0074], %f8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba985f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2903f  ! 625: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2903f  ! 626: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba983f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xcd02c01f  ! 630: LDF_R	ld	[%r11, %r31], %f6
TH_LABEL630:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd282903f  ! 631: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r9
	.word 0xc6ca911f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r3
	.word 0xd1ba993f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc892d13f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x89, %r4
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
TH_LABEL635:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad8bf  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2d01f  ! 641: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad9bf  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 647: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xd092a074  ! 648: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r8
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca82a030  ! 650: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2911f  ! 651: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba981f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xcedae040  ! 655: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba983f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca4ac01f  ! 660: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca02801f  ! 662: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xccc2d13f  ! 663: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc682a04c  ! 666: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r3
	.word 0xcfbaa020  ! 667: STDFA_I	stda	%f7, [0x0020, %r10]
	.word 0xcdbad97f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc8c2915f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc99ae050  ! 671: LDDFA_I	ldda	[%r11, 0x0050], %f4
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc202801f  ! 674: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d11f  ! 677: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad83f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd01a801f  ! 679: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc1a801f  ! 681: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc7f2d13f  ! 682: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad81f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1aa040  ! 684: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc892e00a  ! 686: LDUHA_I	lduha	[%r11, + 0x000a] %asi, %r4
	.word 0xcd22801f  ! 687: STF_R	st	%f6, [%r31, %r10]
	.word 0xc612e03c  ! 688: LDUH_I	lduh	[%r11 + 0x003c], %r3
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba981f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc3baa058  ! 692: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xc6dae028  ! 693: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r3
	.word 0xc3ba989f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd322c01f  ! 696: STF_R	st	%f9, [%r31, %r11]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc59aa048  ! 698: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xc7bad89f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc902c01f  ! 700: LDF_R	ld	[%r11, %r31], %f4
TH_LABEL700:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad95f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc8caa075  ! 703: LDSBA_I	ldsba	[%r10, + 0x0075] %asi, %r4
	.word 0xc5baa000  ! 704: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc202a060  ! 706: LDUW_I	lduw	[%r10 + 0x0060], %r1
	.word 0xc59ae060  ! 707: LDDFA_I	ldda	[%r11, 0x0060], %f2
	.word 0xc2c2901f  ! 708: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc8a903f  ! 710: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc52a034  ! 716: LDSH_I	ldsh	[%r10 + 0x0034], %r6
	.word 0xc79aa058  ! 717: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc48ad01f  ! 720: LDUBA_R	lduba	[%r11, %r31] 0x80, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc44aa076  ! 722: LDSB_I	ldsb	[%r10 + 0x0076], %r2
	.word 0xcbf2d11f  ! 723: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL725:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 728: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcf02e00c  ! 729: LDF_I	ld	[%r11, 0x000c], %f7
	.word 0xc322801f  ! 730: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba981f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2d2913f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r9
	.word 0xc5ba987f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba981f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0daa038  ! 737: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xc9e2d01f  ! 738: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad95f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 742: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad95f  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc4dad07f  ! 744: LDXA_R	ldxa	[%r11, %r31] 0x83, %r2
	.word 0xd3bad8bf  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL745:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2d11f  ! 746: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc652a078  ! 748: LDSH_I	ldsh	[%r10 + 0x0078], %r3
	.word 0xcdbad89f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 750: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2d01f  ! 751: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xd1bae068  ! 754: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
TH_LABEL755:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 758: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad85f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad8bf  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcbbaa030  ! 765: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba989f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2901f  ! 768: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 769: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba993f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd39aa020  ! 772: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xc5ba98bf  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcfbae030  ! 774: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xcbba993f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcad2901f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba98bf  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6d2a014  ! 781: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r3
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc40ac01f  ! 784: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc522801f  ! 785: STF_R	st	%f2, [%r31, %r10]
TH_LABEL785:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc522c01f  ! 786: STF_R	st	%f2, [%r31, %r11]
	.word 0xc7ba981f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc852801f  ! 789: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad8bf  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xcc5a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd0c2a030  ! 794: LDSWA_I	ldswa	[%r10, + 0x0030] %asi, %r8
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
TH_LABEL795:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc01ae048  ! 796: LDD_I	ldd	[%r11 + 0x0048], %r0
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcf22c01f  ! 798: STF_R	st	%f7, [%r31, %r11]
	.word 0xd3bad95f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xccda903f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x81, %r6
	.word 0xcfba999f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd012a054  ! 805: LDUH_I	lduh	[%r10 + 0x0054], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba993f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc8aa05f  ! 807: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r6
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc40a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd3ba997f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2901f  ! 811: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc41a801f  ! 812: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc402a000  ! 813: LDUW_I	lduw	[%r10 + 0x0000], %r2
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc842801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc482e068  ! 818: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r2
	.word 0xc5f2d11f  ! 819: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc292905f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba983f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc79aa008  ! 826: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xc322801f  ! 827: STF_R	st	%f1, [%r31, %r10]
	.word 0xc7ba985f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca92a04c  ! 829: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r5
	.word 0xd302a048  ! 830: LDF_I	ld	[%r10, 0x0048], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba98bf  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 832: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba985f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL835:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2901f  ! 836: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xd252801f  ! 837: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc89ae030  ! 838: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xcb9aa050  ! 839: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xcb02a06c  ! 840: LDF_I	ld	[%r10, 0x006c], %f5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2903f  ! 841: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xd01a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc9e2901f  ! 843: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcf02e07c  ! 844: LDF_I	ld	[%r11, 0x007c], %f7
	.word 0xcc0aa031  ! 845: LDUB_I	ldub	[%r10 + 0x0031], %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba987f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd22c01f  ! 851: STF_R	st	%f6, [%r31, %r11]
	.word 0xc9baa040  ! 852: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba991f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba98bf  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd9ae058  ! 857: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba993f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc212c01f  ! 861: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcdbaa040  ! 864: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc28a901f  ! 865: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcad2905f  ! 866: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xc602801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba983f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4dad01f  ! 872: LDXA_R	ldxa	[%r11, %r31] 0x80, %r2
	.word 0xcb02801f  ! 873: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc502a01c  ! 875: LDF_I	ld	[%r10, 0x001c], %f2
TH_LABEL875:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc52a010  ! 876: LDSH_I	ldsh	[%r10 + 0x0010], %r6
	.word 0xc3bad99f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd0d2d17f  ! 879: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r8
	.word 0xc7ba993f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc40ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd102e020  ! 882: LDF_I	ld	[%r11, 0x0020], %f8
	.word 0xc48ad15f  ! 883: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r2
	.word 0xccd2d07f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r6
	.word 0xd3e2d03f  ! 885: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad95f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd24ae024  ! 888: LDSB_I	ldsb	[%r11 + 0x0024], %r9
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc81aa038  ! 892: LDD_I	ldd	[%r10 + 0x0038], %r4
	.word 0xd3ba985f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45aa030  ! 894: LDX_I	ldx	[%r10 + 0x0030], %r2
	.word 0xd302e01c  ! 895: LDF_I	ld	[%r11, 0x001c], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xccc2913f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xcd02c01f  ! 897: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcff2901f  ! 898: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba997f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba989f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc02801f  ! 903: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcb22801f  ! 905: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc28a905f  ! 906: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc6daa010  ! 908: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r3
	.word 0xcde2d01f  ! 909: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad87f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad91f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc212a034  ! 912: LDUH_I	lduh	[%r10 + 0x0034], %r1
	.word 0xd1f2d01f  ! 913: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad81f  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce92913f  ! 915: LDUHA_R	lduha	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2d03f  ! 916: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xccdaa000  ! 917: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r6
	.word 0xc7bad99f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcdbae000  ! 920: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce82a01c  ! 921: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r7
	.word 0xcf02a030  ! 922: LDF_I	ld	[%r10, 0x0030], %f7
	.word 0xc3ba987f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba991f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc40a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2901f  ! 927: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xca42801f  ! 929: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7ba987f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce12801f  ! 931: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7bad87f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad9bf  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd1bae040  ! 935: STDFA_I	stda	%f8, [0x0040, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba989f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc65ac01f  ! 938: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc522801f  ! 939: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bad87f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc2ca907f  ! 942: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xd1f2d01f  ! 943: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad99f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xceda901f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x80, %r7
	.word 0xc9ba981f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba999f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 954: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce82a04c  ! 956: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r7
	.word 0xcfba995f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc8caa07f  ! 959: LDSBA_I	ldsba	[%r10, + 0x007f] %asi, %r4
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcd02e070  ! 963: LDF_I	ld	[%r11, 0x0070], %f6
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2903f  ! 965: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba98bf  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb9aa060  ! 968: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xd052e07c  ! 969: LDSH_I	ldsh	[%r11 + 0x007c], %r8
	.word 0xd1ba999f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba999f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc7baa078  ! 972: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc6d2a04a  ! 973: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r3
	.word 0xd1ba983f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
TH_LABEL975:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2903f  ! 976: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xcf02a050  ! 977: LDF_I	ld	[%r10, 0x0050], %f7
	.word 0xce52c01f  ! 978: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc5ba99bf  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba98bf  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
TH_LABEL985:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc682a048  ! 986: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r3
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc502a034  ! 988: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xca52a032  ! 989: LDSH_I	ldsh	[%r10 + 0x0032], %r5
	.word 0xc6daa038  ! 990: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcff2903f  ! 991: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xc2c2d07f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r1
	.word 0xd3bad93f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcec2e02c  ! 994: LDSWA_I	ldswa	[%r11, + 0x002c] %asi, %r7
	.word 0xc6ca913f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba987f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc322801f  ! 997: STF_R	st	%f1, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d13f  ! 999: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad97f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
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
	.word 0xcc92a06c  ! 1: LDUHA_I	lduha	[%r10, + 0x006c] %asi, %r6
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc82e004  ! 4: LDUWA_I	lduwa	[%r11, + 0x0004] %asi, %r6
	.word 0xc7ba983f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL5:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc20ac01f  ! 6: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd0d2911f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r8
	.word 0xc85ac01f  ! 8: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd3bad81f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1baa020  ! 10: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad85f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad81f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2ca915f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r1
	.word 0xca52a02a  ! 17: LDSH_I	ldsh	[%r10 + 0x002a], %r5
	.word 0xd3baa038  ! 18: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xc5ba985f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba989f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0d2e048  ! 23: LDSHA_I	ldsha	[%r11, + 0x0048] %asi, %r8
	.word 0xc7ba981f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa050  ! 25: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba995f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa018  ! 28: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xc40ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc3e2d01f  ! 30: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad99f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xce82e048  ! 33: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r7
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad81f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc482d15f  ! 37: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r2
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc642e014  ! 39: LDSW_I	ldsw	[%r11 + 0x0014], %r3
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba991f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302c01f  ! 42: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc2da907f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x83, %r1
	.word 0xc7ba98bf  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba989f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd302e014  ! 47: LDF_I	ld	[%r11, 0x0014], %f9
	.word 0xd2c2d01f  ! 48: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xd25a801f  ! 49: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5ba981f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcfbae000  ! 52: STDFA_I	stda	%f7, [0x0000, %r11]
	.word 0xca8aa00b  ! 53: LDUBA_I	lduba	[%r10, + 0x000b] %asi, %r5
	.word 0xc6dae010  ! 54: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r3
	.word 0xc9bad8bf  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad87f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 59: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xce52a07e  ! 60: LDSH_I	ldsh	[%r10 + 0x007e], %r7
TH_LABEL60:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2911f  ! 61: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba999f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd252801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc282e040  ! 65: LDUWA_I	lduwa	[%r11, + 0x0040] %asi, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc1ae008  ! 66: LDD_I	ldd	[%r11 + 0x0008], %r6
	.word 0xcb02e078  ! 67: LDF_I	ld	[%r11, 0x0078], %f5
	.word 0xc7bae000  ! 68: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xc3ba995f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9aa010  ! 70: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba993f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd322c01f  ! 72: STF_R	st	%f9, [%r31, %r11]
	.word 0xd002a04c  ! 73: LDUW_I	lduw	[%r10 + 0x004c], %r8
	.word 0xcb02a07c  ! 74: LDF_I	ld	[%r10, 0x007c], %f5
	.word 0xd102c01f  ! 75: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba991f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba987f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba995f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce12801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd19ae020  ! 83: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2911f  ! 85: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
TH_LABEL85:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba987f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
TH_LABEL90:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd002801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc40ac01f  ! 92: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xca92901f  ! 94: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xd3bae040  ! 95: STDFA_I	stda	%f9, [0x0040, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad93f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc88aa075  ! 97: LDUBA_I	lduba	[%r10, + 0x0075] %asi, %r4
	.word 0xc4ca913f  ! 98: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xca12a02c  ! 100: LDUH_I	lduh	[%r10 + 0x002c], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc702a020  ! 101: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xce02801f  ! 102: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcd9aa010  ! 103: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xcf22801f  ! 104: STF_R	st	%f7, [%r31, %r10]
	.word 0xcf02801f  ! 105: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb02801f  ! 106: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc702e058  ! 107: LDF_I	ld	[%r11, 0x0058], %f3
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xccd2d05f  ! 110: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba999f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce4aa01c  ! 115: LDSB_I	ldsb	[%r10 + 0x001c], %r7
TH_LABEL115:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad95f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 120: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad81f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc12801f  ! 122: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd20a801f  ! 123: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xce52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba983f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xca5ae028  ! 128: LDX_I	ldx	[%r11 + 0x0028], %r5
	.word 0xd102a01c  ! 129: LDF_I	ld	[%r10, 0x001c], %f8
	.word 0xc68a917f  ! 130: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3f2901f  ! 131: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba991f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 134: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xce8aa07b  ! 135: LDUBA_I	lduba	[%r10, + 0x007b] %asi, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba989f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 137: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xc702801f  ! 138: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfe2d01f  ! 139: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcff2d03f  ! 140: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
TH_LABEL140:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad8bf  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad85f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc302a050  ! 146: LDF_I	ld	[%r10, 0x0050], %f1
	.word 0xd302e004  ! 147: LDF_I	ld	[%r11, 0x0004], %f9
	.word 0xcbba989f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcedae008  ! 149: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r7
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad87f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce82a028  ! 152: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r7
	.word 0xc6c2913f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r3
	.word 0xc01aa010  ! 154: LDD_I	ldd	[%r10 + 0x0010], %r0
	.word 0xca82907f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d13f  ! 157: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad95f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd09aa078  ! 161: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc48a917f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xcb02e018  ! 164: LDF_I	ld	[%r11, 0x0018], %f5
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL165:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba981f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc92901f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xc852801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xd2cae023  ! 169: LDSBA_I	ldsba	[%r11, + 0x0023] %asi, %r9
	.word 0xc5ba985f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba993f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd25ac01f  ! 173: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcdba991f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcac2e040  ! 175: LDSWA_I	ldswa	[%r11, + 0x0040] %asi, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba987f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xccd2a040  ! 178: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r6
	.word 0xc48a903f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x81, %r2
	.word 0xc7baa058  ! 180: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2903f  ! 181: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc522801f  ! 182: STF_R	st	%f2, [%r31, %r10]
	.word 0xcf22c01f  ! 183: STF_R	st	%f7, [%r31, %r11]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d01f  ! 185: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
TH_LABEL185:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3baa008  ! 186: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xcbba985f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf9aa020  ! 188: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xce12a058  ! 189: LDUH_I	lduh	[%r10 + 0x0058], %r7
	.word 0xcccad15f  ! 190: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2903f  ! 191: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xc602801f  ! 192: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc9ba981f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce92e004  ! 194: LDUHA_I	lduha	[%r11, + 0x0004] %asi, %r7
	.word 0xc212801f  ! 195: LDUH_R	lduh	[%r10 + %r31], %r1
TH_LABEL195:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xd09ae020  ! 198: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0c2e010  ! 201: LDSWA_I	ldswa	[%r11, + 0x0010] %asi, %r8
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba995f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 205: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba983f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2901f  ! 209: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2901f  ! 211: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc88aa012  ! 212: LDUBA_I	lduba	[%r10, + 0x0012] %asi, %r4
	.word 0xc282a058  ! 213: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r1
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad89f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc412801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc7ba997f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcc9aa048  ! 220: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba987f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xced2907f  ! 223: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r7
	.word 0xcdba989f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 225: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
TH_LABEL225:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb22c01f  ! 226: STF_R	st	%f5, [%r31, %r11]
	.word 0xca12a02a  ! 227: LDUH_I	lduh	[%r10 + 0x002a], %r5
	.word 0xd122801f  ! 228: STF_R	st	%f8, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc602a018  ! 230: LDUW_I	lduw	[%r10 + 0x0018], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba997f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 232: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3ba987f  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc502801f  ! 234: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad9bf  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd052801f  ! 242: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc492907f  ! 243: LDUHA_R	lduha	[%r10, %r31] 0x83, %r2
	.word 0xd1bad81f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd2d2d07f  ! 245: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r9
TH_LABEL245:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd102801f  ! 246: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc7baa040  ! 247: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xc3ba981f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca52801f  ! 249: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc7baa078  ! 250: STDFA_I	stda	%f3, [0x0078, %r10]
TH_LABEL250:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc252a070  ! 254: LDSH_I	ldsh	[%r10 + 0x0070], %r1
	.word 0xc7ba993f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb22c01f  ! 256: STF_R	st	%f5, [%r31, %r11]
	.word 0xcbe2901f  ! 257: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba987f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc2cae07b  ! 261: LDSBA_I	ldsba	[%r11, + 0x007b] %asi, %r1
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d01f  ! 263: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xce82d15f  ! 267: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r7
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d13f  ! 269: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad95f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc59aa010  ! 271: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xd1bad97f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xc812a004  ! 275: LDUH_I	lduh	[%r10 + 0x0004], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbad93f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc292915f  ! 279: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2903f  ! 281: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba989f  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd252a024  ! 284: LDSH_I	ldsh	[%r10 + 0x0024], %r9
	.word 0xcc0aa07f  ! 285: LDUB_I	ldub	[%r10 + 0x007f], %r6
TH_LABEL285:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd0d2d03f  ! 287: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r8
	.word 0xc9ba981f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc522801f  ! 289: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3f2d03f  ! 290: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcada901f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x80, %r5
	.word 0xc242801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xcd02c01f  ! 293: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc9ba985f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbae060  ! 295: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd09ae030  ! 296: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r8
	.word 0xc5bad91f  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcfbaa078  ! 299: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xcbba989f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc6ca917f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xcbe2913f  ! 304: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2903f  ! 305: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41a801f  ! 306: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc24a801f  ! 307: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad83f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad83f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d13f  ! 313: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad95f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80aa03b  ! 315: LDUB_I	ldub	[%r10 + 0x003b], %r4
TH_LABEL315:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba99bf  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242e078  ! 318: LDSW_I	ldsw	[%r11 + 0x0078], %r9
	.word 0xc922c01f  ! 319: STF_R	st	%f4, [%r31, %r11]
	.word 0xc922801f  ! 320: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2901f  ! 321: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcd22801f  ! 323: STF_R	st	%f6, [%r31, %r10]
	.word 0xc242a02c  ! 324: LDSW_I	ldsw	[%r10 + 0x002c], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad81f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcedae078  ! 328: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r7
	.word 0xcfba991f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba995f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd292905f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x82, %r9
	.word 0xc9f2913f  ! 333: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xca42c01f  ! 334: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xcf9aa060  ! 335: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02a050  ! 336: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xc492a060  ! 337: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r2
	.word 0xd3bad89f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 339: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad97f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad91f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad99f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc39ae058  ! 344: LDDFA_I	ldda	[%r11, 0x0058], %f1
	.word 0xc2d2a032  ! 345: LDSHA_I	ldsha	[%r10, + 0x0032] %asi, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf9aa000  ! 346: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc302c01f  ! 348: LDF_R	ld	[%r11, %r31], %f1
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd1bae020  ! 350: STDFA_I	stda	%f8, [0x0020, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad87f  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL355:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7baa048  ! 357: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xcdba989f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc902801f  ! 360: LDF_R	ld	[%r10, %r31], %f4
TH_LABEL360:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad85f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102801f  ! 362: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc642801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9ba99bf  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca92901f  ! 366: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad83f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad97f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce12e068  ! 371: LDUH_I	lduh	[%r11 + 0x0068], %r7
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc3baa000  ! 373: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xc09aa048  ! 374: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r0
	.word 0xc302801f  ! 375: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca92e04a  ! 376: LDUHA_I	lduha	[%r11, + 0x004a] %asi, %r5
	.word 0xca82a018  ! 377: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r5
	.word 0xc522c01f  ! 378: STF_R	st	%f2, [%r31, %r11]
	.word 0xd39aa048  ! 379: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xcfba993f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba993f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902801f  ! 382: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcd22c01f  ! 383: STF_R	st	%f6, [%r31, %r11]
	.word 0xc5bad85f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d01f  ! 389: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xd002e00c  ! 390: LDUW_I	lduw	[%r11 + 0x000c], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf22c01f  ! 391: STF_R	st	%f7, [%r31, %r11]
	.word 0xcd22801f  ! 392: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1ba981f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc892a054  ! 395: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd39aa070  ! 396: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xd19aa068  ! 397: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba991f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8d2e040  ! 400: LDSHA_I	ldsha	[%r11, + 0x0040] %asi, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc68a901f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xcfbaa008  ! 402: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xc5e2901f  ! 403: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc01a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd3bad85f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad85f  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xce12801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7bad97f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc852c01f  ! 411: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc6c2d01f  ! 412: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xc41a801f  ! 413: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xceca901f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xc922c01f  ! 415: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc28a917f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r1
	.word 0xd302e078  ! 417: LDF_I	ld	[%r11, 0x0078], %f9
	.word 0xcfbad81f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 420: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbae050  ! 421: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba989f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc89aa048  ! 424: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r4
	.word 0xc4caa01c  ! 425: LDSBA_I	ldsba	[%r10, + 0x001c] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba99bf  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 427: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc3e2911f  ! 428: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc8d2a00c  ! 429: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r4
	.word 0xc9bad93f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL430:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad8bf  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc802a064  ! 433: LDUW_I	lduw	[%r10 + 0x0064], %r4
	.word 0xcecae048  ! 434: LDSBA_I	ldsba	[%r11, + 0x0048] %asi, %r7
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7baa020  ! 436: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xd1e2d11f  ! 437: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xccd2905f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r6
	.word 0xcfba983f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc4da917f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r2
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba999f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2d05f  ! 445: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
TH_LABEL445:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19ae068  ! 446: LDDFA_I	ldda	[%r11, 0x0068], %f8
	.word 0xcc12801f  ! 447: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcf9ae008  ! 449: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xcdba993f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca0a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2911f  ! 454: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xc39aa028  ! 455: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2caa054  ! 456: LDSBA_I	ldsba	[%r10, + 0x0054] %asi, %r9
	.word 0xc502a034  ! 457: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xce5aa048  ! 458: LDX_I	ldx	[%r10 + 0x0048], %r7
	.word 0xd08a905f  ! 459: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcb9ae030  ! 461: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xcf9aa050  ! 462: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xcdf2d01f  ! 463: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad8bf  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcad2d13f  ! 466: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r5
	.word 0xd1baa048  ! 467: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xd3f2d01f  ! 468: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd212801f  ! 469: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xcde2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc1aa030  ! 472: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xcb9aa068  ! 473: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xcdba987f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc85ac01f  ! 477: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1baa058  ! 478: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc502a020  ! 479: LDF_I	ld	[%r10, 0x0020], %f2
	.word 0xd1bad99f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc01a801f  ! 482: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd0c2905f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r8
	.word 0xcfba995f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd3bae000  ! 485: STDFA_I	stda	%f9, [0x0000, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc642801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc68a901f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc3ba98bf  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 489: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc39aa020  ! 490: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad89f  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcbbaa010  ! 494: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xca4a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd20a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc44a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc7e2d03f  ! 500: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc842e014  ! 501: LDSW_I	ldsw	[%r11 + 0x0014], %r4
	.word 0xca8ad01f  ! 502: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xd08a911f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
	.word 0xce52c01f  ! 504: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc5e2911f  ! 505: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd082915f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba997f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc49aa040  ! 510: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r2
TH_LABEL510:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba985f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL515:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2903f  ! 516: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc922c01f  ! 517: STF_R	st	%f4, [%r31, %r11]
	.word 0xc5bad81f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4da915f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r2
	.word 0xcedae060  ! 522: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r7
	.word 0xcbe2901f  ! 523: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba997f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba985f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302801f  ! 527: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba997f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc20a801f  ! 529: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd1bad93f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca52a06c  ! 531: LDSH_I	ldsh	[%r10 + 0x006c], %r5
	.word 0xd1f2d01f  ! 532: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd19aa020  ! 533: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xc9ba993f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL535:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd012c01f  ! 536: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xcbe2903f  ! 537: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcf02e058  ! 538: LDF_I	ld	[%r11, 0x0058], %f7
	.word 0xc9e2911f  ! 539: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2903f  ! 541: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba99bf  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3baa030  ! 544: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xc7ba981f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd39aa030  ! 546: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xc602c01f  ! 547: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xd1bad81f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd24ac01f  ! 550: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbe2d03f  ! 551: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad89f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc88aa048  ! 556: LDUBA_I	lduba	[%r10, + 0x0048] %asi, %r4
	.word 0xc7ba993f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xce52e04c  ! 559: LDSH_I	ldsh	[%r11 + 0x004c], %r7
	.word 0xc292901f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba989f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 562: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcc8a913f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x89, %r6
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba983f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59ae050  ! 567: LDDFA_I	ldda	[%r11, 0x0050], %f2
	.word 0xcc5a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba99bf  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba997f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc4cae02d  ! 572: LDSBA_I	ldsba	[%r11, + 0x002d] %asi, %r2
	.word 0xcc42a008  ! 573: LDSW_I	ldsw	[%r10 + 0x0008], %r6
	.word 0xc7ba995f  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf9ae018  ! 575: LDDFA_I	ldda	[%r11, 0x0018], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc59aa020  ! 576: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xd1ba995f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 578: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba98bf  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8aa03d  ! 583: LDUBA_I	lduba	[%r10, + 0x003d] %asi, %r7
	.word 0xc59aa070  ! 584: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xcf02801f  ! 585: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd282a064  ! 587: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r9
	.word 0xd3ba993f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 590: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba997f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba981f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692d13f  ! 595: LDUHA_R	lduha	[%r11, %r31] 0x89, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02a060  ! 596: LDF_I	ld	[%r10, 0x0060], %f6
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba997f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9ae028  ! 600: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc64ae077  ! 601: LDSB_I	ldsb	[%r11 + 0x0077], %r3
	.word 0xd05a801f  ! 602: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad95f  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccda917f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba98bf  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc202a054  ! 607: LDUW_I	lduw	[%r10 + 0x0054], %r1
	.word 0xd1ba981f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba98bf  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc59aa060  ! 614: LDDFA_I	ldda	[%r10, 0x0060], %f2
	.word 0xc85a801f  ! 615: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae030  ! 616: LDDFA_I	ldda	[%r11, 0x0030], %f1
	.word 0xd0dad01f  ! 617: LDXA_R	ldxa	[%r11, %r31] 0x80, %r8
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba991f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02a058  ! 620: LDF_I	ld	[%r10, 0x0058], %f6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba997f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2913f  ! 625: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2901f  ! 626: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xc902c01f  ! 630: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca82905f  ! 631: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xc8ca901f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xd1ba981f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc292901f  ! 634: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad85f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2d01f  ! 641: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad99f  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 647: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc692e02c  ! 648: LDUHA_I	lduha	[%r11, + 0x002c] %asi, %r3
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xce82a004  ! 650: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r7
TH_LABEL650:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba995f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xcadaa018  ! 655: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd04ac01f  ! 660: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc802801f  ! 662: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcec2d11f  ! 663: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad9bf  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL665:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca82a064  ! 666: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r5
	.word 0xc3bae070  ! 667: STDFA_I	stda	%f1, [0x0070, %r11]
	.word 0xcdbad97f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcec2911f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb9aa058  ! 671: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xce02c01f  ! 674: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d11f  ! 677: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad81f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc1a801f  ! 679: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc01ac01f  ! 681: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xc7f2d13f  ! 682: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad99f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1aa020  ! 684: LDD_I	ldd	[%r10 + 0x0020], %r6
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
TH_LABEL685:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca92e00e  ! 686: LDUHA_I	lduha	[%r11, + 0x000e] %asi, %r5
	.word 0xc522801f  ! 687: STF_R	st	%f2, [%r31, %r10]
	.word 0xcc12e00c  ! 688: LDUH_I	lduh	[%r11 + 0x000c], %r6
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba98bf  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcbbae060  ! 692: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xc8dae058  ! 693: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r4
	.word 0xc3ba993f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc922c01f  ! 696: STF_R	st	%f4, [%r31, %r11]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd9aa048  ! 698: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xc7bad81f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcd02801f  ! 700: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad8bf  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd2caa072  ! 703: LDSBA_I	ldsba	[%r10, + 0x0072] %asi, %r9
	.word 0xc5baa000  ! 704: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc202a05c  ! 706: LDUW_I	lduw	[%r10 + 0x005c], %r1
	.word 0xc99aa030  ! 707: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xc4c2d03f  ! 708: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r2
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc48ad15f  ! 710: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xd012c01f  ! 715: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc852a07e  ! 716: LDSH_I	ldsh	[%r10 + 0x007e], %r4
	.word 0xd39ae040  ! 717: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68ad05f  ! 720: LDUBA_R	lduba	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd24aa078  ! 722: LDSB_I	ldsb	[%r10 + 0x0078], %r9
	.word 0xcbf2d03f  ! 723: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad89f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 728: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc302a078  ! 729: LDF_I	ld	[%r10, 0x0078], %f1
	.word 0xcd22c01f  ! 730: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdba999f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc4d2911f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r2
	.word 0xc5ba997f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba983f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcedaa040  ! 737: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r7
	.word 0xc9e2d13f  ! 738: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad81f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 742: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad8bf  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcada903f  ! 744: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xd3bad87f  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d13f  ! 746: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcc52a024  ! 748: LDSH_I	ldsh	[%r10 + 0x0024], %r6
	.word 0xcdbad95f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 750: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2d11f  ! 751: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcbbaa000  ! 754: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad97f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d03f  ! 758: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad89f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad81f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1bae010  ! 765: STDFA_I	stda	%f8, [0x0010, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba991f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2911f  ! 768: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2911f  ! 769: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba983f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL770:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcb9ae030  ! 772: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc5ba999f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc3baa058  ! 774: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xcbba987f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccd2907f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r6
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba98bf  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2a022  ! 781: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r2
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba989f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc80a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc522801f  ! 785: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf22c01f  ! 786: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba985f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc652c01f  ! 789: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bad9bf  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xca5a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xc2c2a010  ! 794: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r1
	.word 0xc7f2903f  ! 795: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc1ae070  ! 796: LDD_I	ldd	[%r11 + 0x0070], %r6
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd122c01f  ! 798: STF_R	st	%f8, [%r31, %r11]
	.word 0xd3bad81f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc2da913f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x89, %r1
	.word 0xcfba997f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce12a036  ! 805: LDUH_I	lduh	[%r10 + 0x0036], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba985f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc48ae03a  ! 807: LDUBA_I	lduba	[%r11, + 0x003a] %asi, %r2
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc40ac01f  ! 809: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd3ba985f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2913f  ! 811: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc81a801f  ! 812: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xce02e050  ! 813: LDUW_I	lduw	[%r11 + 0x0050], %r7
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc42c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xce82e060  ! 818: LDUWA_I	lduwa	[%r11, + 0x0060] %asi, %r7
	.word 0xc5f2d03f  ! 819: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc292d15f  ! 822: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r1
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba987f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf9aa050  ! 826: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xc922801f  ! 827: STF_R	st	%f4, [%r31, %r10]
	.word 0xc7ba991f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd292a04c  ! 829: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r9
	.word 0xd102e034  ! 830: LDF_I	ld	[%r11, 0x0034], %f8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba997f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 832: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba987f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2901f  ! 836: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xce52c01f  ! 837: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc89aa068  ! 838: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xc59aa010  ! 839: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xc302e044  ! 840: LDF_I	ld	[%r11, 0x0044], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2901f  ! 841: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xd01a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc9e2913f  ! 843: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc502a06c  ! 844: LDF_I	ld	[%r10, 0x006c], %f2
	.word 0xce0aa029  ! 845: LDUB_I	ldub	[%r10 + 0x0029], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba999f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcf22801f  ! 851: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7baa070  ! 852: STDFA_I	stda	%f3, [0x0070, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba989f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba981f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc99aa060  ! 857: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba983f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce12801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba999f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa028  ! 864: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xd08ad05f  ! 865: LDUBA_R	lduba	[%r11, %r31] 0x82, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2d15f  ! 866: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r2
	.word 0xca02801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba981f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6da911f  ! 872: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xd302801f  ! 873: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc502e030  ! 875: LDF_I	ld	[%r11, 0x0030], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc452a01e  ! 876: LDSH_I	ldsh	[%r10 + 0x001e], %r2
	.word 0xc3bad95f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd0d2d13f  ! 879: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r8
	.word 0xc7ba997f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd20a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xcb02a048  ! 882: LDF_I	ld	[%r10, 0x0048], %f5
	.word 0xc88a917f  ! 883: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xcad2d03f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r5
	.word 0xd3e2d03f  ! 885: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad91f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcc4ae015  ! 888: LDSB_I	ldsb	[%r11 + 0x0015], %r6
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc41aa030  ! 892: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xd3ba999f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce5aa048  ! 894: LDX_I	ldx	[%r10 + 0x0048], %r7
	.word 0xc702a028  ! 895: LDF_I	ld	[%r10, 0x0028], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd0c2d05f  ! 896: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
	.word 0xcd02801f  ! 897: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcff2901f  ! 898: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba987f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd002c01f  ! 903: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcb22c01f  ! 905: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd28ad01f  ! 906: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xcedaa070  ! 908: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r7
	.word 0xcde2d03f  ! 909: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad93f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL910:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad87f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc812e008  ! 912: LDUH_I	lduh	[%r11 + 0x0008], %r4
	.word 0xd1f2d13f  ! 913: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad8bf  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce92901f  ! 915: LDUHA_R	lduha	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2d03f  ! 916: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xcedaa058  ! 917: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r7
	.word 0xc7bad81f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd1baa058  ! 920: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc682a060  ! 921: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r3
	.word 0xcd02a010  ! 922: LDF_I	ld	[%r10, 0x0010], %f6
	.word 0xc3ba995f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba989f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc40a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2913f  ! 927: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xca42c01f  ! 929: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc7ba987f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd212c01f  ! 931: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc7bad81f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad97f  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcbbaa048  ! 935: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba983f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45a801f  ! 938: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd122c01f  ! 939: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad85f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc2cad05f  ! 942: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r1
	.word 0xd1f2d13f  ! 943: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad81f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2da917f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r1
	.word 0xc9ba981f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba989f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 954: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd282a064  ! 956: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r9
	.word 0xcfba981f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc4caa073  ! 959: LDSBA_I	ldsba	[%r10, + 0x0073] %asi, %r2
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf02a038  ! 963: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2901f  ! 965: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba993f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa050  ! 968: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xc652e000  ! 969: LDSH_I	ldsh	[%r11 + 0x0000], %r3
	.word 0xd1ba997f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba997f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc3baa058  ! 972: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xc6d2a066  ! 973: LDSHA_I	ldsha	[%r10, + 0x0066] %asi, %r3
	.word 0xd1ba995f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2901f  ! 976: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcf02e060  ! 977: LDF_I	ld	[%r11, 0x0060], %f7
	.word 0xd252c01f  ! 978: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc5ba995f  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba989f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482a070  ! 986: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r2
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc302a01c  ! 988: LDF_I	ld	[%r10, 0x001c], %f1
	.word 0xcc52a02a  ! 989: LDSH_I	ldsh	[%r10 + 0x002a], %r6
	.word 0xcadaa028  ! 990: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2901f  ! 991: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xccc2d11f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r6
	.word 0xd3bad81f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2e050  ! 994: LDSWA_I	ldswa	[%r11, + 0x0050] %asi, %r2
	.word 0xceca915f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba99bf  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc322c01f  ! 997: STF_R	st	%f1, [%r31, %r11]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d13f  ! 999: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad91f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xc492a006  ! 1: LDUHA_I	lduha	[%r10, + 0x0006] %asi, %r2
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd282e01c  ! 4: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r9
	.word 0xc7ba98bf  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca0a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xced2d05f  ! 7: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r7
	.word 0xc65ac01f  ! 8: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd3bad87f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc3baa048  ! 10: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad9bf  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad85f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcacad17f  ! 16: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r5
	.word 0xc252a07a  ! 17: LDSH_I	ldsh	[%r10 + 0x007a], %r1
	.word 0xd3baa050  ! 18: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xc5ba981f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba99bf  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcad2a01c  ! 23: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r5
	.word 0xc7ba989f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa010  ! 25: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba98bf  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3bae030  ! 28: STDFA_I	stda	%f9, [0x0030, %r11]
	.word 0xce0ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc3e2d03f  ! 30: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad87f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xcc82e018  ! 33: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r6
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL35:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad93f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce82913f  ! 37: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r7
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc642a028  ! 39: LDSW_I	ldsw	[%r10 + 0x0028], %r3
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba99bf  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02801f  ! 42: LDF_R	ld	[%r10, %r31], %f7
	.word 0xccdad03f  ! 43: LDXA_R	ldxa	[%r11, %r31] 0x81, %r6
	.word 0xc7ba991f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba989f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc702e03c  ! 47: LDF_I	ld	[%r11, 0x003c], %f3
	.word 0xc2c2905f  ! 48: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xc65ac01f  ! 49: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc5ba987f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd1baa070  ! 52: STDFA_I	stda	%f8, [0x0070, %r10]
	.word 0xc28aa07d  ! 53: LDUBA_I	lduba	[%r10, + 0x007d] %asi, %r1
	.word 0xd2daa038  ! 54: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r9
	.word 0xc9bad81f  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad97f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 59: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc652a012  ! 60: LDSH_I	ldsh	[%r10 + 0x0012], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2911f  ! 61: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba985f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc652801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc682e014  ! 65: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc81aa000  ! 66: LDD_I	ldd	[%r10 + 0x0000], %r4
	.word 0xc702a044  ! 67: LDF_I	ld	[%r10, 0x0044], %f3
	.word 0xd3baa048  ! 68: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xc3ba981f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9ae008  ! 70: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba989f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd122801f  ! 72: STF_R	st	%f8, [%r31, %r10]
	.word 0xce02a034  ! 73: LDUW_I	lduw	[%r10 + 0x0034], %r7
	.word 0xd102e04c  ! 74: LDF_I	ld	[%r11, 0x004c], %f8
	.word 0xc702c01f  ! 75: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba98bf  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba983f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc12801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc79aa070  ! 83: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2901f  ! 85: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba983f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc402801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc20a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xce92905f  ! 94: LDUHA_R	lduha	[%r10, %r31] 0x82, %r7
	.word 0xc5baa068  ! 95: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad85f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc48aa012  ! 97: LDUBA_I	lduba	[%r10, + 0x0012] %asi, %r2
	.word 0xcccad01f  ! 98: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r6
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc812a006  ! 100: LDUH_I	lduh	[%r10 + 0x0006], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd102a03c  ! 101: LDF_I	ld	[%r10, 0x003c], %f8
	.word 0xce02801f  ! 102: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc39ae050  ! 103: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xcf22801f  ! 104: STF_R	st	%f7, [%r31, %r10]
	.word 0xcd02801f  ! 105: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd02c01f  ! 106: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcb02a06c  ! 107: LDF_I	ld	[%r10, 0x006c], %f5
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcad2913f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba987f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba991f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc84aa077  ! 115: LDSB_I	ldsb	[%r10 + 0x0077], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad81f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 120: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad97f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd212801f  ! 122: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd20ac01f  ! 123: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc252801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba987f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc5ae008  ! 128: LDX_I	ldx	[%r11 + 0x0008], %r6
	.word 0xd102e03c  ! 129: LDF_I	ld	[%r11, 0x003c], %f8
	.word 0xd08ad01f  ! 130: LDUBA_R	lduba	[%r11, %r31] 0x80, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2911f  ! 131: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba999f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 134: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xce8aa064  ! 135: LDUBA_I	lduba	[%r10, + 0x0064] %asi, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba993f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 137: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc702801f  ! 138: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfe2d01f  ! 139: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcff2d03f  ! 140: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad91f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad89f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102e040  ! 146: LDF_I	ld	[%r11, 0x0040], %f8
	.word 0xd102a07c  ! 147: LDF_I	ld	[%r10, 0x007c], %f8
	.word 0xcbba997f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd0daa038  ! 149: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad91f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82a078  ! 152: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r6
	.word 0xccc2913f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xcc1aa078  ! 154: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xce82907f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d03f  ! 157: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad91f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc09aa028  ! 161: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r0
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xce8ad17f  ! 163: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r7
	.word 0xc702e000  ! 164: LDF_I	ld	[%r11, 0x0000], %f3
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba993f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292907f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xd252801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc8caa059  ! 169: LDSBA_I	ldsba	[%r10, + 0x0059] %asi, %r4
	.word 0xc5ba993f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba983f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc45a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcdba999f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcac2e054  ! 175: LDSWA_I	ldswa	[%r11, + 0x0054] %asi, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba987f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xccd2a076  ! 178: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r6
	.word 0xd08a917f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r8
	.word 0xcbbaa018  ! 180: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2911f  ! 181: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd122c01f  ! 182: STF_R	st	%f8, [%r31, %r11]
	.word 0xcb22801f  ! 183: STF_R	st	%f5, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d03f  ! 185: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3baa028  ! 186: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xcbba993f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa028  ! 188: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xc212a058  ! 189: LDUH_I	lduh	[%r10 + 0x0058], %r1
	.word 0xd2ca907f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xc802801f  ! 192: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc9ba997f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc692a040  ! 194: LDUHA_I	lduha	[%r10, + 0x0040] %asi, %r3
	.word 0xca12c01f  ! 195: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xcc9aa060  ! 198: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r6
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcac2a02c  ! 201: LDSWA_I	ldswa	[%r10, + 0x002c] %asi, %r5
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba993f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 205: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba98bf  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2913f  ! 209: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba997f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7f2913f  ! 211: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc28aa027  ! 212: LDUBA_I	lduba	[%r10, + 0x0027] %asi, %r1
	.word 0xc882e044  ! 213: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r4
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bad99f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc612c01f  ! 217: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc7ba98bf  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd09ae048  ! 220: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
TH_LABEL220:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba989f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd01a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc6d2911f  ! 223: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r3
	.word 0xcdba99bf  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 225: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc322c01f  ! 226: STF_R	st	%f1, [%r31, %r11]
	.word 0xc612e056  ! 227: LDUH_I	lduh	[%r11 + 0x0056], %r3
	.word 0xc522c01f  ! 228: STF_R	st	%f2, [%r31, %r11]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcc02e060  ! 230: LDUW_I	lduw	[%r11 + 0x0060], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba997f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 232: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3ba99bf  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd02c01f  ! 234: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad95f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc852c01f  ! 242: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc492907f  ! 243: LDUHA_R	lduha	[%r10, %r31] 0x83, %r2
	.word 0xd1bad9bf  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8d2913f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502801f  ! 246: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfbae058  ! 247: STDFA_I	stda	%f7, [0x0058, %r11]
	.word 0xc3ba999f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc652801f  ! 249: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcfbaa058  ! 250: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad85f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc252e046  ! 254: LDSH_I	ldsh	[%r11 + 0x0046], %r1
	.word 0xc7ba98bf  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc922c01f  ! 256: STF_R	st	%f4, [%r31, %r11]
	.word 0xcbe2911f  ! 257: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba985f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0caa01e  ! 261: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r8
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d01f  ! 263: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xca82d07f  ! 267: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r5
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad8bf  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd9ae008  ! 271: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xd1bad81f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xca12a072  ! 275: LDUH_I	lduh	[%r10 + 0x0072], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad83f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xce92d17f  ! 279: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r7
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1e2901f  ! 281: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba98bf  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc452e016  ! 284: LDSH_I	ldsh	[%r11 + 0x0016], %r2
	.word 0xd00ae05f  ! 285: LDUB_I	ldub	[%r11 + 0x005f], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcad2901f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc9ba983f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922c01f  ! 289: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3f2d01f  ! 290: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd2da903f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x81, %r9
	.word 0xce42801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xd102801f  ! 293: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc9ba983f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd1baa078  ! 295: STDFA_I	stda	%f8, [0x0078, %r10]
TH_LABEL295:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc49ae068  ! 296: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r2
	.word 0xc5bad8bf  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcbbaa000  ! 299: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xcbba985f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd2ca913f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xcbe2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2911f  ! 305: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1ac01f  ! 306: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xca4ac01f  ! 307: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad95f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad81f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d01f  ! 313: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad81f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0ae074  ! 315: LDUB_I	ldub	[%r11 + 0x0074], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba985f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242a000  ! 318: LDSW_I	ldsw	[%r10 + 0x0000], %r9
	.word 0xcd22801f  ! 319: STF_R	st	%f6, [%r31, %r10]
	.word 0xcd22c01f  ! 320: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2901f  ! 321: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc722801f  ! 323: STF_R	st	%f3, [%r31, %r10]
	.word 0xc242a024  ! 324: LDSW_I	ldsw	[%r10 + 0x0024], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad97f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcedaa020  ! 328: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r7
	.word 0xcfba997f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
TH_LABEL330:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba999f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc892d17f  ! 332: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r4
	.word 0xc9f2901f  ! 333: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc842801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc79ae028  ! 335: LDDFA_I	ldda	[%r11, 0x0028], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf02e02c  ! 336: LDF_I	ld	[%r11, 0x002c], %f7
	.word 0xc292a028  ! 337: LDUHA_I	lduha	[%r10, + 0x0028] %asi, %r1
	.word 0xd3bad87f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 339: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad81f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad99f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad97f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc99aa078  ! 344: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xd2d2a040  ! 345: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd39aa060  ! 346: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd302801f  ! 348: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd1bae070  ! 350: STDFA_I	stda	%f8, [0x0070, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcbbae068  ! 357: STDFA_I	stda	%f5, [0x0068, %r11]
	.word 0xcdba999f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc302c01f  ! 360: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad81f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc702801f  ! 362: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc842c01f  ! 363: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9ba99bf  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc692907f  ! 366: LDUHA_R	lduha	[%r10, %r31] 0x83, %r3
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad93f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad93f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd012e05a  ! 371: LDUH_I	lduh	[%r11 + 0x005a], %r8
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc5baa078  ! 373: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc89aa078  ! 374: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r4
	.word 0xcf02801f  ! 375: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc892e01c  ! 376: LDUHA_I	lduha	[%r11, + 0x001c] %asi, %r4
	.word 0xc282a044  ! 377: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r1
	.word 0xd122c01f  ! 378: STF_R	st	%f8, [%r31, %r11]
	.word 0xc79ae040  ! 379: LDDFA_I	ldda	[%r11, 0x0040], %f3
	.word 0xcfba99bf  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL380:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba983f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502801f  ! 382: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc522801f  ! 383: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5bad89f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL385:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad95f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d01f  ! 389: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc802a064  ! 390: LDUW_I	lduw	[%r10 + 0x0064], %r4
TH_LABEL390:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd22801f  ! 391: STF_R	st	%f6, [%r31, %r10]
	.word 0xcd22c01f  ! 392: STF_R	st	%f6, [%r31, %r11]
	.word 0xd1ba995f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc292a034  ! 395: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd9ae058  ! 396: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xc39ae000  ! 397: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba987f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xced2a030  ! 400: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc88ad01f  ! 401: LDUBA_R	lduba	[%r11, %r31] 0x80, %r4
	.word 0xcbbaa070  ! 402: STDFA_I	stda	%f5, [0x0070, %r10]
	.word 0xc5e2901f  ! 403: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc01a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd3bad8bf  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad9bf  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd212801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc7bad81f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce52c01f  ! 411: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcac2913f  ! 412: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xcc1a801f  ! 413: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcaca907f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r5
	.word 0xd322c01f  ! 415: STF_R	st	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc8a901f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xcb02a068  ! 417: LDF_I	ld	[%r10, 0x0068], %f5
	.word 0xcfbad87f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 420: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bae020  ! 421: STDFA_I	stda	%f8, [0x0020, %r11]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba995f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc9ae038  ! 424: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r6
	.word 0xd0caa039  ! 425: LDSBA_I	ldsba	[%r10, + 0x0039] %asi, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba985f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 427: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc3e2911f  ! 428: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xd2d2e078  ! 429: LDSHA_I	ldsha	[%r11, + 0x0078] %asi, %r9
	.word 0xc9bad87f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc202e05c  ! 433: LDUW_I	lduw	[%r11 + 0x005c], %r1
	.word 0xc2caa078  ! 434: LDSBA_I	ldsba	[%r10, + 0x0078] %asi, %r1
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL435:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbaa048  ! 436: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xd1e2d01f  ! 437: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc8d2917f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r4
	.word 0xcfba997f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2da905f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2915f  ! 445: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb9ae030  ! 446: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc212c01f  ! 447: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcb9aa048  ! 449: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xcdba999f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc60a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2901f  ! 454: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc79aa070  ! 455: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcacaa024  ! 456: LDSBA_I	ldsba	[%r10, + 0x0024] %asi, %r5
	.word 0xc302a050  ! 457: LDF_I	ld	[%r10, 0x0050], %f1
	.word 0xc85aa060  ! 458: LDX_I	ldx	[%r10 + 0x0060], %r4
	.word 0xc68a905f  ! 459: LDUBA_R	lduba	[%r10, %r31] 0x82, %r3
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc59aa018  ! 461: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcf9aa010  ! 462: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xcdf2d13f  ! 463: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad81f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccd2905f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r6
	.word 0xd3baa058  ! 467: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xd3f2d11f  ! 468: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd212c01f  ! 469: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xcde2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc01aa020  ! 472: LDD_I	ldd	[%r10 + 0x0020], %r0
	.word 0xc99ae040  ! 473: LDDFA_I	ldda	[%r11, 0x0040], %f4
	.word 0xcdba987f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc85a801f  ! 477: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc5bae068  ! 478: STDFA_I	stda	%f2, [0x0068, %r11]
	.word 0xcb02e040  ! 479: LDF_I	ld	[%r11, 0x0040], %f5
	.word 0xd1bad89f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL480:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc81ac01f  ! 482: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc8c2917f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xcfba99bf  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa028  ! 485: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc242801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xd08a905f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xc3ba995f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 489: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcb9aa000  ! 490: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad81f  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd1baa018  ! 494: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xc24a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r1
TH_LABEL495:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd20a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd24a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc7e2d11f  ! 500: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc842a06c  ! 501: LDSW_I	ldsw	[%r10 + 0x006c], %r4
	.word 0xcc8a911f  ! 502: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xca8a911f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xcc52c01f  ! 504: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc5e2901f  ! 505: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc82915f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba999f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc9aa020  ! 510: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba995f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd322801f  ! 517: STF_R	st	%f9, [%r31, %r10]
	.word 0xc5bad99f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL520:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2da903f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x81, %r1
	.word 0xd0dae030  ! 522: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r8
	.word 0xcbe2913f  ! 523: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbba981f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba995f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 527: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfba999f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc80a801f  ! 529: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd1bad91f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd052a022  ! 531: LDSH_I	ldsh	[%r10 + 0x0022], %r8
	.word 0xd1f2d01f  ! 532: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd19aa000  ! 533: LDDFA_I	ldda	[%r10, 0x0000], %f8
	.word 0xc9ba99bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc612801f  ! 536: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcbe2901f  ! 537: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc502e058  ! 538: LDF_I	ld	[%r11, 0x0058], %f2
	.word 0xc9e2903f  ! 539: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba991f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa060  ! 544: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xc7ba99bf  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc99aa048  ! 546: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xca02801f  ! 547: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd1bad9bf  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc44a801f  ! 550: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2d13f  ! 551: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad93f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc68aa073  ! 556: LDUBA_I	lduba	[%r10, + 0x0073] %asi, %r3
	.word 0xc7ba995f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc252a030  ! 559: LDSH_I	ldsh	[%r10 + 0x0030], %r1
	.word 0xc692913f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba99bf  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 562: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd08a907f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba993f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa078  ! 567: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xc25a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba98bf  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba981f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcecae012  ! 572: LDSBA_I	ldsba	[%r11, + 0x0012] %asi, %r7
	.word 0xcc42a04c  ! 573: LDSW_I	ldsw	[%r10 + 0x004c], %r6
	.word 0xc7ba98bf  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa028  ! 575: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb9aa040  ! 576: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xd1ba993f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 578: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba985f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8aa02f  ! 583: LDUBA_I	lduba	[%r10, + 0x002f] %asi, %r7
	.word 0xcf9aa028  ! 584: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xc902c01f  ! 585: LDF_R	ld	[%r11, %r31], %f4
TH_LABEL585:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc282a060  ! 587: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r1
	.word 0xd3ba997f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 590: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba989f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba985f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc892913f  ! 595: LDUHA_R	lduha	[%r10, %r31] 0x89, %r4
TH_LABEL595:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb02a024  ! 596: LDF_I	ld	[%r10, 0x0024], %f5
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba981f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39aa048  ! 600: LDDFA_I	ldda	[%r10, 0x0048], %f9
TH_LABEL600:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc4aa02b  ! 601: LDSB_I	ldsb	[%r10 + 0x002b], %r6
	.word 0xc25a801f  ! 602: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6da905f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x82, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba983f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd002a070  ! 607: LDUW_I	lduw	[%r10 + 0x0070], %r8
	.word 0xd1ba999f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc39aa048  ! 614: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xcc5a801f  ! 615: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd9aa020  ! 616: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xc6da915f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r3
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba993f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302a00c  ! 620: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba981f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2901f  ! 625: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2901f  ! 626: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba989f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xc902801f  ! 630: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc682915f  ! 631: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r3
	.word 0xccca901f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xd1ba99bf  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292d07f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x83, %r9
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad99f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2d01f  ! 641: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 647: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc692e078  ! 648: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r3
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd082a020  ! 650: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2903f  ! 651: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba981f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd2daa050  ! 655: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc64ac01f  ! 660: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc202c01f  ! 662: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc8c2d13f  ! 663: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r4
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad83f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc82a020  ! 666: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r6
	.word 0xcfbae050  ! 667: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xcdbad95f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc8c2915f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc39ae000  ! 671: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc602c01f  ! 674: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d11f  ! 677: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad85f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41ac01f  ! 679: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc1a801f  ! 681: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc7f2d01f  ! 682: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad8bf  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc81ae010  ! 684: LDD_I	ldd	[%r11 + 0x0010], %r4
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc692e06c  ! 686: LDUHA_I	lduha	[%r11, + 0x006c] %asi, %r3
	.word 0xd322801f  ! 687: STF_R	st	%f9, [%r31, %r10]
	.word 0xc412e02a  ! 688: LDUH_I	lduh	[%r11 + 0x002a], %r2
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba999f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc3bae070  ! 692: STDFA_I	stda	%f1, [0x0070, %r11]
	.word 0xcedaa060  ! 693: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r7
	.word 0xc3ba981f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd322801f  ! 696: STF_R	st	%f9, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcb9aa070  ! 698: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc7bad97f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc302801f  ! 700: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad97f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcacae047  ! 703: LDSBA_I	ldsba	[%r11, + 0x0047] %asi, %r5
	.word 0xd3bae060  ! 704: STDFA_I	stda	%f9, [0x0060, %r11]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc02a020  ! 706: LDUW_I	lduw	[%r10 + 0x0020], %r6
	.word 0xcd9ae028  ! 707: LDDFA_I	ldda	[%r11, 0x0028], %f6
	.word 0xc6c2901f  ! 708: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd08a913f  ! 710: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2903f  ! 714: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xd212801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc52e04e  ! 716: LDSH_I	ldsh	[%r11 + 0x004e], %r6
	.word 0xc99aa020  ! 717: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba98bf  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8a901f  ! 720: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc4ae005  ! 722: LDSB_I	ldsb	[%r11 + 0x0005], %r6
	.word 0xcbf2d01f  ! 723: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad93f  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad97f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 728: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcd02e018  ! 729: LDF_I	ld	[%r11, 0x0018], %f6
	.word 0xc322801f  ! 730: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba983f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8d2d01f  ! 733: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r4
	.word 0xc5ba981f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba987f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0daa048  ! 737: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r8
	.word 0xc9e2d01f  ! 738: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad99f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 742: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad91f  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccda911f  ! 744: LDXA_R	ldxa	[%r10, %r31] 0x88, %r6
	.word 0xd3bad97f  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2d13f  ! 746: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xca52a072  ! 748: LDSH_I	ldsh	[%r10 + 0x0072], %r5
	.word 0xcdbad85f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d03f  ! 750: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2d13f  ! 751: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xd1baa048  ! 754: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad99f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 758: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad85f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad99f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbae008  ! 765: STDFA_I	stda	%f7, [0x0008, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba98bf  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2901f  ! 768: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 769: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcb9aa050  ! 772: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xc5ba98bf  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcfbae070  ! 774: STDFA_I	stda	%f7, [0x0070, %r11]
	.word 0xcbba981f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8d2901f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba99bf  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0d2e002  ! 781: LDSHA_I	ldsha	[%r11, + 0x0002] %asi, %r8
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc60a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc922801f  ! 785: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf22801f  ! 786: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7ba981f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xd252c01f  ! 789: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad81f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc45ac01f  ! 793: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xcec2a068  ! 794: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r7
	.word 0xc7f2911f  ! 795: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc1aa040  ! 796: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc522c01f  ! 798: STF_R	st	%f2, [%r31, %r11]
	.word 0xd3bad9bf  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcada901f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x80, %r5
	.word 0xcfba985f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce12a008  ! 805: LDUH_I	lduh	[%r10 + 0x0008], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba983f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd28aa05d  ! 807: LDUBA_I	lduba	[%r10, + 0x005d] %asi, %r9
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc80a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd3ba981f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL810:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2903f  ! 811: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc81ac01f  ! 812: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc402a028  ! 813: LDUW_I	lduw	[%r10 + 0x0028], %r2
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc242801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc682a030  ! 818: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r3
	.word 0xc5f2d13f  ! 819: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
TH_LABEL820:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xd092917f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba981f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa048  ! 826: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xcd22801f  ! 827: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7ba981f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd092a054  ! 829: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r8
	.word 0xcb02e03c  ! 830: LDF_I	ld	[%r11, 0x003c], %f5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba991f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 832: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba981f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2911f  ! 836: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xd252801f  ! 837: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcc9aa028  ! 838: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r6
	.word 0xd39aa028  ! 839: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xd102a018  ! 840: LDF_I	ld	[%r10, 0x0018], %f8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2913f  ! 841: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc41a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9e2913f  ! 843: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xd102a018  ! 844: LDF_I	ld	[%r10, 0x0018], %f8
	.word 0xcc0aa050  ! 845: LDUB_I	ldub	[%r10 + 0x0050], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba989f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd22801f  ! 851: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7baa060  ! 852: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba983f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba985f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd39aa078  ! 857: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba985f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc812801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc3baa030  ! 864: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xc48ad11f  ! 865: LDUBA_R	lduba	[%r11, %r31] 0x88, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc8d2d13f  ! 866: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r4
	.word 0xc802801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba98bf  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6da901f  ! 872: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xd102c01f  ! 873: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcf02a054  ! 875: LDF_I	ld	[%r10, 0x0054], %f7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd052e04e  ! 876: LDSH_I	ldsh	[%r11 + 0x004e], %r8
	.word 0xc3bad8bf  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xccd2901f  ! 879: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xc7ba997f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca0a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xc302e054  ! 882: LDF_I	ld	[%r11, 0x0054], %f1
	.word 0xd28ad17f  ! 883: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r9
	.word 0xd0d2d17f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r8
	.word 0xd3e2d01f  ! 885: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad89f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc64aa05e  ! 888: LDSB_I	ldsb	[%r10 + 0x005e], %r3
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcc1aa038  ! 892: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xd3ba993f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce5aa038  ! 894: LDX_I	ldx	[%r10 + 0x0038], %r7
	.word 0xc702a00c  ! 895: LDF_I	ld	[%r10, 0x000c], %f3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcec2917f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r7
	.word 0xd102c01f  ! 897: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcff2901f  ! 898: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba983f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL900:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba983f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc802801f  ! 903: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd322801f  ! 905: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8a903f  ! 906: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xcadaa060  ! 908: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r5
	.word 0xcde2d13f  ! 909: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad99f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad81f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca12a002  ! 912: LDUH_I	lduh	[%r10 + 0x0002], %r5
	.word 0xd1f2d01f  ! 913: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad8bf  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc492d05f  ! 915: LDUHA_R	lduha	[%r11, %r31] 0x82, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2d01f  ! 916: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xccdaa000  ! 917: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r6
	.word 0xc7bad91f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcfbae038  ! 920: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc282e074  ! 921: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r1
	.word 0xcb02a040  ! 922: LDF_I	ld	[%r10, 0x0040], %f5
	.word 0xc3ba983f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba993f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd20ac01f  ! 926: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc5e2901f  ! 927: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd242c01f  ! 929: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc7ba993f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc12c01f  ! 931: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xc7bad87f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad83f  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc5baa000  ! 935: STDFA_I	stda	%f2, [0x0000, %r10]
TH_LABEL935:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba995f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45a801f  ! 938: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc322801f  ! 939: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad83f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd2cad01f  ! 942: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xd1f2d13f  ! 943: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad9bf  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xccdad01f  ! 946: LDXA_R	ldxa	[%r11, %r31] 0x80, %r6
	.word 0xc9ba99bf  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba983f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 954: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc482e054  ! 956: LDUWA_I	lduwa	[%r11, + 0x0054] %asi, %r2
	.word 0xcfba993f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc4caa067  ! 959: LDSBA_I	ldsba	[%r10, + 0x0067] %asi, %r2
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL960:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd102e000  ! 963: LDF_I	ld	[%r11, 0x0000], %f8
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2913f  ! 965: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba993f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb9ae070  ! 968: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xc452e06c  ! 969: LDSH_I	ldsh	[%r11 + 0x006c], %r2
	.word 0xd1ba981f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL970:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba985f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc5bae070  ! 972: STDFA_I	stda	%f2, [0x0070, %r11]
	.word 0xced2a068  ! 973: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r7
	.word 0xd1ba997f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2901f  ! 976: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd302a060  ! 977: LDF_I	ld	[%r10, 0x0060], %f9
	.word 0xc852801f  ! 978: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc5ba993f  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba989f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc82e01c  ! 986: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r6
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc502a050  ! 988: LDF_I	ld	[%r10, 0x0050], %f2
	.word 0xc452e076  ! 989: LDSH_I	ldsh	[%r11 + 0x0076], %r2
	.word 0xc6daa048  ! 990: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcff2901f  ! 991: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc4c2d03f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r2
	.word 0xd3bad8bf  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6c2a074  ! 994: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r3
	.word 0xc2cad05f  ! 995: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba997f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc722801f  ! 997: STF_R	st	%f3, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d03f  ! 999: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad95f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL1000:
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
	.word 0xd292a07c  ! 1: LDUHA_I	lduha	[%r10, + 0x007c] %asi, %r9
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc482e064  ! 4: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r2
	.word 0xc7ba997f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd20a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xcad2905f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xd05a801f  ! 8: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd3bad83f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1baa030  ! 10: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad81f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2ca907f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r9
	.word 0xc252a07e  ! 17: LDSH_I	ldsh	[%r10 + 0x007e], %r1
	.word 0xc7bae000  ! 18: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xc5ba995f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba987f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xced2e020  ! 23: LDSHA_I	ldsha	[%r11, + 0x0020] %asi, %r7
	.word 0xc7ba983f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79ae038  ! 25: LDDFA_I	ldda	[%r11, 0x0038], %f3
TH_LABEL25:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba993f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3baa078  ! 28: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xca0ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc3e2d11f  ! 30: CASA_I	casa	[%r11] 0x88, %r31, %r1
TH_LABEL30:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad91f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc682a04c  ! 33: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r3
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad93f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca82d11f  ! 37: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r5
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc242e058  ! 39: LDSW_I	ldsw	[%r11 + 0x0058], %r1
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba985f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 42: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc8da905f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xc7ba997f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL45:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba999f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc302a014  ! 47: LDF_I	ld	[%r10, 0x0014], %f1
	.word 0xccc2913f  ! 48: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xc85ac01f  ! 49: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xc5ba989f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd3bae078  ! 52: STDFA_I	stda	%f9, [0x0078, %r11]
	.word 0xc28aa035  ! 53: LDUBA_I	lduba	[%r10, + 0x0035] %asi, %r1
	.word 0xc2dae068  ! 54: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r1
	.word 0xc9bad99f  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad95f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 59: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcc52a03c  ! 60: LDSH_I	ldsh	[%r10 + 0x003c], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2903f  ! 61: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba987f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd252c01f  ! 64: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xce82a058  ! 65: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc1ae068  ! 66: LDD_I	ldd	[%r11 + 0x0068], %r6
	.word 0xcb02a050  ! 67: LDF_I	ld	[%r10, 0x0050], %f5
	.word 0xcfbae038  ! 68: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xc3ba981f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc49aa068  ! 70: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba99bf  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc922801f  ! 72: STF_R	st	%f4, [%r31, %r10]
	.word 0xc802a010  ! 73: LDUW_I	lduw	[%r10 + 0x0010], %r4
	.word 0xd302a024  ! 74: LDF_I	ld	[%r10, 0x0024], %f9
	.word 0xcd02801f  ! 75: LDF_R	ld	[%r10, %r31], %f6
TH_LABEL75:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba985f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba993f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba98bf  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL80:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc812801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc99aa010  ! 83: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2901f  ! 85: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba993f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xca02801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc20a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc492d13f  ! 94: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xcbbaa018  ! 95: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7bad83f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc88aa070  ! 97: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r4
	.word 0xccca911f  ! 98: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r6
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xd212e060  ! 100: LDUH_I	lduh	[%r11 + 0x0060], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf02a00c  ! 101: LDF_I	ld	[%r10, 0x000c], %f7
	.word 0xcc02801f  ! 102: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xd19aa000  ! 103: LDDFA_I	ldda	[%r10, 0x0000], %f8
	.word 0xd122c01f  ! 104: STF_R	st	%f8, [%r31, %r11]
	.word 0xc702c01f  ! 105: LDF_R	ld	[%r11, %r31], %f3
TH_LABEL105:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502c01f  ! 106: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc702a034  ! 107: LDF_I	ld	[%r10, 0x0034], %f3
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc4d2901f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba991f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba981f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce4aa000  ! 115: LDSB_I	ldsb	[%r10 + 0x0000], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad83f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad83f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd012c01f  ! 122: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xcc0ac01f  ! 123: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xce52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba981f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xce5ae070  ! 128: LDX_I	ldx	[%r11 + 0x0070], %r7
	.word 0xc902e078  ! 129: LDF_I	ld	[%r11, 0x0078], %f4
	.word 0xd28ad01f  ! 130: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2901f  ! 131: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba987f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 134: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc68ae02b  ! 135: LDUBA_I	lduba	[%r11, + 0x002b] %asi, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 137: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc502801f  ! 138: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfe2d11f  ! 139: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcff2d11f  ! 140: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad9bf  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad93f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc302a014  ! 146: LDF_I	ld	[%r10, 0x0014], %f1
	.word 0xc502a02c  ! 147: LDF_I	ld	[%r10, 0x002c], %f2
	.word 0xcbba98bf  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcedae058  ! 149: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r7
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad99f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82e070  ! 152: LDUWA_I	lduwa	[%r11, + 0x0070] %asi, %r6
	.word 0xd0c2905f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r8
	.word 0xcc1aa010  ! 154: LDD_I	ldd	[%r10 + 0x0010], %r6
	.word 0xd282d17f  ! 155: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 157: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad91f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
TH_LABEL160:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc9ae008  ! 161: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc28a913f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x89, %r1
	.word 0xcf02a020  ! 164: LDF_I	ld	[%r10, 0x0020], %f7
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba987f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc92901f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xc852801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc4caa05e  ! 169: LDSBA_I	ldsba	[%r10, + 0x005e] %asi, %r2
	.word 0xc5ba997f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba989f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd25a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcdba995f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcec2a068  ! 175: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba989f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc4d2a03a  ! 178: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r2
	.word 0xc48a917f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xd1baa068  ! 180: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2903f  ! 181: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xd322801f  ! 182: STF_R	st	%f9, [%r31, %r10]
	.word 0xc522801f  ! 183: STF_R	st	%f2, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d03f  ! 185: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bae058  ! 186: STDFA_I	stda	%f3, [0x0058, %r11]
	.word 0xcbba997f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa018  ! 188: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xca12a07c  ! 189: LDUH_I	lduh	[%r10 + 0x007c], %r5
	.word 0xc6ca911f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xcc02801f  ! 192: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc9ba995f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc692a04c  ! 194: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r3
	.word 0xc412c01f  ! 195: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xd09aa078  ! 198: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8c2a054  ! 201: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r4
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba995f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 205: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba989f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2913f  ! 209: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba983f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7f2901f  ! 211: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc28aa022  ! 212: LDUBA_I	lduba	[%r10, + 0x0022] %asi, %r1
	.word 0xc282a058  ! 213: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r1
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad95f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad81f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc12801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7ba985f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc09aa048  ! 220: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r0
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba983f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd01a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd0d2901f  ! 223: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xcdba983f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 225: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc922801f  ! 226: STF_R	st	%f4, [%r31, %r10]
	.word 0xc812a048  ! 227: LDUH_I	lduh	[%r10 + 0x0048], %r4
	.word 0xcb22801f  ! 228: STF_R	st	%f5, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca02a00c  ! 230: LDUW_I	lduw	[%r10 + 0x000c], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba987f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 232: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3ba983f  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd02801f  ! 234: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad95f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcc52c01f  ! 242: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xce92d11f  ! 243: LDUHA_R	lduha	[%r11, %r31] 0x88, %r7
	.word 0xd1bad85f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xced2915f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc502c01f  ! 246: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc3bae020  ! 247: STDFA_I	stda	%f1, [0x0020, %r11]
	.word 0xc3ba987f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc852c01f  ! 249: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xd3baa068  ! 250: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc52a05e  ! 254: LDSH_I	ldsh	[%r10 + 0x005e], %r6
	.word 0xc7ba981f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd122c01f  ! 256: STF_R	st	%f8, [%r31, %r11]
	.word 0xcbe2913f  ! 257: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba995f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6caa01f  ! 261: LDSBA_I	ldsba	[%r10, + 0x001f] %asi, %r3
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d11f  ! 263: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
TH_LABEL265:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd082911f  ! 267: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r8
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d11f  ! 269: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad97f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd19aa018  ! 271: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xd1bad81f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xcc12a00a  ! 275: LDUH_I	lduh	[%r10 + 0x000a], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbad8bf  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xca92d07f  ! 279: LDUHA_R	lduha	[%r11, %r31] 0x83, %r5
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2901f  ! 281: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba983f  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc452a018  ! 284: LDSH_I	ldsh	[%r10 + 0x0018], %r2
	.word 0xd00ae061  ! 285: LDUB_I	ldub	[%r11 + 0x0061], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xccd2903f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc9ba999f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc722801f  ! 289: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3f2d11f  ! 290: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2da917f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xce42c01f  ! 292: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xcf02c01f  ! 293: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc9ba995f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbaa028  ! 295: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc89aa028  ! 296: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xc5bad8bf  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bae008  ! 299: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xcbba99bf  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL300:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xceca913f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xcbe2901f  ! 304: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 305: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01a801f  ! 306: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xca4ac01f  ! 307: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad87f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL310:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bad91f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d03f  ! 313: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad9bf  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0aa06e  ! 315: LDUB_I	ldub	[%r10 + 0x006e], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba981f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce42a018  ! 318: LDSW_I	ldsw	[%r10 + 0x0018], %r7
	.word 0xc922801f  ! 319: STF_R	st	%f4, [%r31, %r10]
	.word 0xcb22c01f  ! 320: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2901f  ! 321: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc922801f  ! 323: STF_R	st	%f4, [%r31, %r10]
	.word 0xcc42a00c  ! 324: LDSW_I	ldsw	[%r10 + 0x000c], %r6
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad81f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc8dae010  ! 328: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r4
	.word 0xcfba985f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba99bf  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc892901f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xc9f2901f  ! 333: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xce42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcb9aa068  ! 335: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc902a048  ! 336: LDF_I	ld	[%r10, 0x0048], %f4
	.word 0xc292a03e  ! 337: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r1
	.word 0xd3bad85f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d03f  ! 339: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad97f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad83f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad91f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc59aa008  ! 344: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xcad2a074  ! 345: LDSHA_I	ldsha	[%r10, + 0x0074] %asi, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd19aa038  ! 346: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc502c01f  ! 348: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdbaa060  ! 350: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcbbae030  ! 357: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xcdba997f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcf02801f  ! 360: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad91f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc702801f  ! 362: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc842801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9ba98bf  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc92915f  ! 366: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad9bf  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad91f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd212e03a  ! 371: LDUH_I	lduh	[%r11 + 0x003a], %r9
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9bae008  ! 373: STDFA_I	stda	%f4, [0x0008, %r11]
	.word 0xc89ae048  ! 374: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r4
	.word 0xd102801f  ! 375: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce92a036  ! 376: LDUHA_I	lduha	[%r10, + 0x0036] %asi, %r7
	.word 0xc282a014  ! 377: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r1
	.word 0xc322801f  ! 378: STF_R	st	%f1, [%r31, %r10]
	.word 0xcb9ae078  ! 379: LDDFA_I	ldda	[%r11, 0x0078], %f5
	.word 0xcfba993f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba987f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102801f  ! 382: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd122801f  ! 383: STF_R	st	%f8, [%r31, %r10]
	.word 0xc5bad97f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad95f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d01f  ! 389: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc202e064  ! 390: LDUW_I	lduw	[%r11 + 0x0064], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd122801f  ! 391: STF_R	st	%f8, [%r31, %r10]
	.word 0xcd22801f  ! 392: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1ba999f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292a04a  ! 395: LDUHA_I	lduha	[%r10, + 0x004a] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb9aa028  ! 396: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xc99aa070  ! 397: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba99bf  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2d2e050  ! 400: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc8ad15f  ! 401: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r6
	.word 0xc3bae030  ! 402: STDFA_I	stda	%f1, [0x0030, %r11]
	.word 0xc5e2901f  ! 403: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcc1a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3bad81f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad83f  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd212801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc7bad95f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc252801f  ! 411: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xd0c2d03f  ! 412: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r8
	.word 0xc41ac01f  ! 413: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc2ca907f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xcd22801f  ! 415: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc68a901f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xcf02a068  ! 417: LDF_I	ld	[%r10, 0x0068], %f7
	.word 0xcfbad93f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d03f  ! 420: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3baa070  ! 421: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba981f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd09aa020  ! 424: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xd0caa01b  ! 425: LDSBA_I	ldsba	[%r10, + 0x001b] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba99bf  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81a801f  ! 427: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc3e2903f  ! 428: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xcad2a03c  ! 429: LDSHA_I	ldsha	[%r10, + 0x003c] %asi, %r5
	.word 0xc9bad93f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad9bf  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc402a004  ! 433: LDUW_I	lduw	[%r10 + 0x0004], %r2
	.word 0xcacae071  ! 434: LDSBA_I	ldsba	[%r11, + 0x0071] %asi, %r5
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3baa038  ! 436: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xd1e2d01f  ! 437: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xcad2d03f  ! 438: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r5
	.word 0xcfba985f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc4dad15f  ! 442: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r2
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2d15f  ! 445: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa028  ! 446: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xca12c01f  ! 447: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc99aa070  ! 449: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xcdba99bf  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc60ac01f  ! 452: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xcf9ae058  ! 455: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2caa042  ! 456: LDSBA_I	ldsba	[%r10, + 0x0042] %asi, %r9
	.word 0xc502a01c  ! 457: LDF_I	ld	[%r10, 0x001c], %f2
	.word 0xce5ae028  ! 458: LDX_I	ldx	[%r11 + 0x0028], %r7
	.word 0xc48ad03f  ! 459: LDUBA_R	lduba	[%r11, %r31] 0x81, %r2
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc59aa018  ! 461: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcf9aa008  ! 462: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xcdf2d11f  ! 463: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad87f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2d2913f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r9
	.word 0xc3baa030  ! 467: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xd3f2d13f  ! 468: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xca12801f  ! 469: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcde2901f  ! 470: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc81aa070  ! 472: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xcf9aa028  ! 473: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xcdba985f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xce5a801f  ! 477: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd3bae058  ! 478: STDFA_I	stda	%f9, [0x0058, %r11]
	.word 0xcf02e01c  ! 479: LDF_I	ld	[%r11, 0x001c], %f7
	.word 0xd1bad83f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xcc1a801f  ! 482: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xccc2901f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xcfba981f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc3baa050  ! 485: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc842801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcc8ad07f  ! 487: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xc3ba981f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 489: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc99aa040  ! 490: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad9bf  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd3bae008  ! 494: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xd04a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc40a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcc4a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc7e2d01f  ! 500: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd242a078  ! 501: LDSW_I	ldsw	[%r10 + 0x0078], %r9
	.word 0xc68a913f  ! 502: LDUBA_R	lduba	[%r10, %r31] 0x89, %r3
	.word 0xd08a907f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
	.word 0xc852801f  ! 504: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc5e2901f  ! 505: CASA_I	casa	[%r10] 0x80, %r31, %r2
TH_LABEL505:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc682911f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r3
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba983f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc49ae008  ! 510: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdba985f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2903f  ! 516: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd122801f  ! 517: STF_R	st	%f8, [%r31, %r10]
	.word 0xc5bad9bf  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd2dad03f  ! 521: LDXA_R	ldxa	[%r11, %r31] 0x81, %r9
	.word 0xc8dae048  ! 522: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r4
	.word 0xcbe2901f  ! 523: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba995f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba981f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc502801f  ! 527: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfba993f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd00ac01f  ! 529: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1bad9bf  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc452e04e  ! 531: LDSH_I	ldsh	[%r11 + 0x004e], %r2
	.word 0xd1f2d01f  ! 532: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xc59aa078  ! 533: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xc9ba989f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd012801f  ! 536: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xcbe2903f  ! 537: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc302e008  ! 538: LDF_I	ld	[%r11, 0x0008], %f1
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL540:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba993f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9baa008  ! 544: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xc7ba997f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79aa058  ! 546: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc402c01f  ! 547: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xd1bad87f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc4ac01f  ! 550: LDSB_R	ldsb	[%r11 + %r31], %r6
TH_LABEL550:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2d03f  ! 551: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad81f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd08aa025  ! 556: LDUBA_I	lduba	[%r10, + 0x0025] %asi, %r8
	.word 0xc7ba98bf  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xcc52e046  ! 559: LDSH_I	ldsh	[%r11 + 0x0046], %r6
	.word 0xca92905f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba991f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 562: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc68a907f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x83, %r3
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba993f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa078  ! 567: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xc45ac01f  ! 568: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba985f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba993f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcecaa06b  ! 572: LDSBA_I	ldsba	[%r10, + 0x006b] %asi, %r7
	.word 0xd242a05c  ! 573: LDSW_I	ldsw	[%r10 + 0x005c], %r9
	.word 0xc7ba985f  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9ae028  ! 575: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc99ae030  ! 576: LDDFA_I	ldda	[%r11, 0x0030], %f4
	.word 0xd1ba997f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 578: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba995f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc48aa023  ! 583: LDUBA_I	lduba	[%r10, + 0x0023] %asi, %r2
	.word 0xcf9aa068  ! 584: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xc502c01f  ! 585: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc482a01c  ! 587: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r2
	.word 0xd3ba981f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 590: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba999f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba985f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce92d03f  ! 595: LDUHA_R	lduha	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd302a00c  ! 596: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba985f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc99aa040  ! 600: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc64aa076  ! 601: LDSB_I	ldsb	[%r10 + 0x0076], %r3
	.word 0xc25a801f  ! 602: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad99f  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6da901f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba981f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc602e030  ! 607: LDUW_I	lduw	[%r11 + 0x0030], %r3
	.word 0xd1ba995f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc79aa028  ! 614: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xc65a801f  ! 615: LDX_R	ldx	[%r10 + %r31], %r3
TH_LABEL615:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9aa070  ! 616: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc8da913f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x89, %r4
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba981f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc702e070  ! 620: LDF_I	ld	[%r11, 0x0070], %f3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba981f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba987f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2901f  ! 625: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2901f  ! 626: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba98bf  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xc502801f  ! 630: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd082d01f  ! 631: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xc6cad03f  ! 632: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r3
	.word 0xd1ba993f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92d03f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x81, %r5
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad81f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2d01f  ! 641: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 647: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcc92a07e  ! 648: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r6
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd082e024  ! 650: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba995f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd0dae010  ! 655: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca4a801f  ! 660: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca02c01f  ! 662: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xd0c2917f  ! 663: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad81f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd082a07c  ! 666: LDUWA_I	lduwa	[%r10, + 0x007c] %asi, %r8
	.word 0xc5bae020  ! 667: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xcdbad87f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc4c2911f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
TH_LABEL670:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc59aa010  ! 671: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd202c01f  ! 674: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
TH_LABEL675:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d01f  ! 677: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad81f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc81a801f  ! 679: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc1ac01f  ! 681: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc7f2d01f  ! 682: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad87f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc81aa048  ! 684: LDD_I	ldd	[%r10 + 0x0048], %r4
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc692a05c  ! 686: LDUHA_I	lduha	[%r10, + 0x005c] %asi, %r3
	.word 0xcd22c01f  ! 687: STF_R	st	%f6, [%r31, %r11]
	.word 0xd012a06c  ! 688: LDUH_I	lduh	[%r10 + 0x006c], %r8
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba989f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc3baa038  ! 692: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc4daa038  ! 693: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r2
	.word 0xc3ba989f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf22801f  ! 696: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd9aa020  ! 698: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xc7bad87f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcb02801f  ! 700: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad95f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc2cae06c  ! 703: LDSBA_I	ldsba	[%r11, + 0x006c] %asi, %r1
	.word 0xc9baa020  ! 704: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd202a018  ! 706: LDUW_I	lduw	[%r10 + 0x0018], %r9
	.word 0xcf9ae030  ! 707: LDDFA_I	ldda	[%r11, 0x0030], %f7
	.word 0xcec2903f  ! 708: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc48a917f  ! 710: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
TH_LABEL710:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2911f  ! 714: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc412801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc452a01e  ! 716: LDSH_I	ldsh	[%r10 + 0x001e], %r2
	.word 0xc99aa040  ! 717: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba999f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd28a901f  ! 720: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
TH_LABEL720:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc84aa021  ! 722: LDSB_I	ldsb	[%r10 + 0x0021], %r4
	.word 0xcbf2d13f  ! 723: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad83f  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 728: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xc902a040  ! 729: LDF_I	ld	[%r10, 0x0040], %f4
	.word 0xc922801f  ! 730: STF_R	st	%f4, [%r31, %r10]
TH_LABEL730:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba999f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcad2d01f  ! 733: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xc5ba989f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba991f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcadae058  ! 737: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r5
	.word 0xc9e2d01f  ! 738: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad93f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 742: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad81f  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2da913f  ! 744: LDXA_R	ldxa	[%r10, %r31] 0x89, %r9
	.word 0xd3bad93f  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2d01f  ! 746: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc852a05c  ! 748: LDSH_I	ldsh	[%r10 + 0x005c], %r4
	.word 0xcdbad83f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 750: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2d01f  ! 751: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcbbae000  ! 754: STDFA_I	stda	%f5, [0x0000, %r11]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad93f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 758: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad83f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad93f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1bae028  ! 765: STDFA_I	stda	%f8, [0x0028, %r11]
TH_LABEL765:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba981f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2901f  ! 768: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 769: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc39aa060  ! 772: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc5ba989f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcbbaa060  ! 774: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcbba995f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL775:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccd2901f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba985f  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL780:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcad2e048  ! 781: LDSHA_I	ldsha	[%r11, + 0x0048] %asi, %r5
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc80a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xcf22801f  ! 785: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb22801f  ! 786: STF_R	st	%f5, [%r31, %r10]
	.word 0xc7ba993f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xd052801f  ! 789: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad89f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc65a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd0c2e000  ! 794: LDSWA_I	ldswa	[%r11, + 0x0000] %asi, %r8
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc41aa060  ! 796: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc522801f  ! 798: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3bad95f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcada911f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xcfba981f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd212a00e  ! 805: LDUH_I	lduh	[%r10 + 0x000e], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba981f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc48aa050  ! 807: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r2
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xca0a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd3ba981f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2913f  ! 811: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd01ac01f  ! 812: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xce02a008  ! 813: LDUW_I	lduw	[%r10 + 0x0008], %r7
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd042c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd282a044  ! 818: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r9
	.word 0xc5f2d01f  ! 819: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xcc92d13f  ! 822: LDUHA_R	lduha	[%r11, %r31] 0x89, %r6
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba991f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd39aa050  ! 826: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xcf22c01f  ! 827: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba995f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd292a014  ! 829: LDUHA_I	lduha	[%r10, + 0x0014] %asi, %r9
	.word 0xc702e054  ! 830: LDF_I	ld	[%r11, 0x0054], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba98bf  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 832: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba995f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfe2903f  ! 836: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xc652801f  ! 837: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc09aa000  ! 838: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r0
	.word 0xd19ae040  ! 839: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xc902a038  ! 840: LDF_I	ld	[%r10, 0x0038], %f4
TH_LABEL840:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2901f  ! 841: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xcc1ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc9e2913f  ! 843: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc902a04c  ! 844: LDF_I	ld	[%r10, 0x004c], %f4
	.word 0xd20aa018  ! 845: LDUB_I	ldub	[%r10 + 0x0018], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba993f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb22801f  ! 851: STF_R	st	%f5, [%r31, %r10]
	.word 0xc5baa048  ! 852: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba993f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba981f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc99ae040  ! 857: LDDFA_I	ldda	[%r11, 0x0040], %f4
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba993f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL860:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd012801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba991f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5bae048  ! 864: STDFA_I	stda	%f2, [0x0048, %r11]
	.word 0xc68a915f  ! 865: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd0d2d05f  ! 866: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r8
	.word 0xcc02c01f  ! 867: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd0dad17f  ! 872: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r8
	.word 0xc702801f  ! 873: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcd02a04c  ! 875: LDF_I	ld	[%r10, 0x004c], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc852a022  ! 876: LDSH_I	ldsh	[%r10 + 0x0022], %r4
	.word 0xc3bad93f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc8d2903f  ! 879: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r4
	.word 0xc7ba981f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc80a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc502e074  ! 882: LDF_I	ld	[%r11, 0x0074], %f2
	.word 0xc68ad03f  ! 883: LDUBA_R	lduba	[%r11, %r31] 0x81, %r3
	.word 0xc2d2d11f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r1
	.word 0xd3e2d03f  ! 885: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad81f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca4aa039  ! 888: LDSB_I	ldsb	[%r10 + 0x0039], %r5
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc41ae000  ! 892: LDD_I	ldd	[%r11 + 0x0000], %r2
	.word 0xd3ba995f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd05aa020  ! 894: LDX_I	ldx	[%r10 + 0x0020], %r8
	.word 0xd302a01c  ! 895: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2c2917f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r1
	.word 0xcb02c01f  ! 897: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcff2901f  ! 898: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba983f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce02801f  ! 903: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcb22801f  ! 905: STF_R	st	%f5, [%r31, %r10]
TH_LABEL905:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd28a903f  ! 906: LDUBA_R	lduba	[%r10, %r31] 0x81, %r9
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc8daa068  ! 908: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r4
	.word 0xcde2d01f  ! 909: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad91f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad85f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce12e01c  ! 912: LDUH_I	lduh	[%r11 + 0x001c], %r7
	.word 0xd1f2d13f  ! 913: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad91f  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc492911f  ! 915: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2d11f  ! 916: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc6dae020  ! 917: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r3
	.word 0xc7bad93f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc5baa070  ! 920: STDFA_I	stda	%f2, [0x0070, %r10]
TH_LABEL920:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc482e024  ! 921: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r2
	.word 0xc902a018  ! 922: LDF_I	ld	[%r10, 0x0018], %f4
	.word 0xc3ba981f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba993f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce0a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc5e2913f  ! 927: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc842c01f  ! 929: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc7ba99bf  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc812c01f  ! 931: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc7bad91f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad85f  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc3baa048  ! 935: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba989f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd05a801f  ! 938: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc922801f  ! 939: STF_R	st	%f4, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad89f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xccca905f  ! 942: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xd1f2d11f  ! 943: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad95f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8da911f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xc9ba98bf  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
TH_LABEL950:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba981f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 954: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc882a04c  ! 956: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r4
	.word 0xcfba985f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc8cae013  ! 959: LDSBA_I	ldsba	[%r11, + 0x0013] %asi, %r4
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc702a060  ! 963: LDF_I	ld	[%r10, 0x0060], %f3
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2901f  ! 965: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba98bf  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd39aa030  ! 968: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xcc52a07e  ! 969: LDSH_I	ldsh	[%r10 + 0x007e], %r6
	.word 0xd1ba989f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba993f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc9baa048  ! 972: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xc2d2a05c  ! 973: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r1
	.word 0xd1ba999f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2901f  ! 976: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcb02e018  ! 977: LDF_I	ld	[%r11, 0x0018], %f5
	.word 0xc452801f  ! 978: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5ba98bf  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
TH_LABEL980:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba981f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc682a05c  ! 986: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r3
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd302e010  ! 988: LDF_I	ld	[%r11, 0x0010], %f9
	.word 0xc852e060  ! 989: LDSH_I	ldsh	[%r11 + 0x0060], %r4
	.word 0xc4daa008  ! 990: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2901f  ! 991: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xccc2911f  ! 992: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xd3bad91f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcec2a040  ! 994: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r7
	.word 0xc6ca913f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
TH_LABEL995:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba993f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb22801f  ! 997: STF_R	st	%f5, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d01f  ! 999: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad91f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xc892e066  ! 1: LDUHA_I	lduha	[%r11, + 0x0066] %asi, %r4
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc482a078  ! 4: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r2
	.word 0xc7ba983f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca0a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xced2d17f  ! 7: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r7
	.word 0xc65a801f  ! 8: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd3bad81f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbae078  ! 10: STDFA_I	stda	%f7, [0x0078, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bad85f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad81f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc4ca905f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r2
	.word 0xd252a07a  ! 17: LDSH_I	ldsh	[%r10 + 0x007a], %r9
	.word 0xcfbaa030  ! 18: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xc5ba98bf  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba999f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0d2a04a  ! 23: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r8
	.word 0xc7ba985f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd39aa048  ! 25: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba993f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5baa038  ! 28: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc80ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc3e2d01f  ! 30: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad91f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xcc82a070  ! 33: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r6
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbad89f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc82901f  ! 37: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc242a044  ! 39: LDSW_I	ldsw	[%r10 + 0x0044], %r1
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba98bf  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302801f  ! 42: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd2da915f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xc7ba981f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba98bf  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502a074  ! 47: LDF_I	ld	[%r10, 0x0074], %f2
	.word 0xcac2d15f  ! 48: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r5
	.word 0xc45a801f  ! 49: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5ba98bf  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd3baa048  ! 52: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xc28ae00b  ! 53: LDUBA_I	lduba	[%r11, + 0x000b] %asi, %r1
	.word 0xcadae048  ! 54: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r5
	.word 0xc9bad8bf  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad97f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 59: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc652a040  ! 60: LDSH_I	ldsh	[%r10 + 0x0040], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2901f  ! 61: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba985f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc852801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc682a000  ! 65: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc1ae030  ! 66: LDD_I	ldd	[%r11 + 0x0030], %r6
	.word 0xcf02a034  ! 67: LDF_I	ld	[%r10, 0x0034], %f7
	.word 0xcdbaa020  ! 68: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xc3ba995f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa020  ! 70: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r0
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba995f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf22801f  ! 72: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc02a048  ! 73: LDUW_I	lduw	[%r10 + 0x0048], %r6
	.word 0xc902a07c  ! 74: LDF_I	ld	[%r10, 0x007c], %f4
	.word 0xcd02801f  ! 75: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba981f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba987f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba993f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc212c01f  ! 81: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd39aa058  ! 83: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2913f  ! 85: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba983f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc02801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc20a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xd292d05f  ! 94: LDUHA_R	lduha	[%r11, %r31] 0x82, %r9
	.word 0xc7baa028  ! 95: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7bad9bf  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc8aa04f  ! 97: LDUBA_I	lduba	[%r10, + 0x004f] %asi, %r6
	.word 0xc2cad11f  ! 98: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r1
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc812a034  ! 100: LDUH_I	lduh	[%r10 + 0x0034], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02a048  ! 101: LDF_I	ld	[%r10, 0x0048], %f6
	.word 0xc402801f  ! 102: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc79ae010  ! 103: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xd322c01f  ! 104: STF_R	st	%f9, [%r31, %r11]
	.word 0xc502801f  ! 105: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc702c01f  ! 106: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc902a018  ! 107: LDF_I	ld	[%r10, 0x0018], %f4
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc6d2913f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba98bf  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc44aa066  ! 115: LDSB_I	ldsb	[%r10 + 0x0066], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad81f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad95f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc412801f  ! 122: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xce0ac01f  ! 123: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xce52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba993f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd05aa048  ! 128: LDX_I	ldx	[%r10 + 0x0048], %r8
	.word 0xc302a078  ! 129: LDF_I	ld	[%r10, 0x0078], %f1
	.word 0xd28a913f  ! 130: LDUBA_R	lduba	[%r10, %r31] 0x89, %r9
TH_LABEL130:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2903f  ! 131: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba98bf  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 134: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xcc8aa032  ! 135: LDUBA_I	lduba	[%r10, + 0x0032] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba983f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 137: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc302801f  ! 138: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcfe2d01f  ! 139: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcff2d03f  ! 140: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad85f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad97f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd102a00c  ! 146: LDF_I	ld	[%r10, 0x000c], %f8
	.word 0xc702a024  ! 147: LDF_I	ld	[%r10, 0x0024], %f3
	.word 0xcbba993f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc4dae078  ! 149: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r2
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad81f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82e00c  ! 152: LDUWA_I	lduwa	[%r11, + 0x000c] %asi, %r6
	.word 0xcec2915f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xc41aa038  ! 154: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xc682913f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 157: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad93f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd09ae078  ! 161: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r8
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc28ad05f  ! 163: LDUBA_R	lduba	[%r11, %r31] 0x82, %r1
	.word 0xcf02a068  ! 164: LDF_I	ld	[%r10, 0x0068], %f7
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba991f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492905f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x82, %r2
	.word 0xc252c01f  ! 168: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc4caa007  ! 169: LDSBA_I	ldsba	[%r10, + 0x0007] %asi, %r2
	.word 0xc5ba999f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba983f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd05ac01f  ! 173: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xcdba98bf  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd0c2a050  ! 175: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba98bf  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd0d2a022  ! 178: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r8
	.word 0xc68a917f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xc7baa018  ! 180: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcb22c01f  ! 182: STF_R	st	%f5, [%r31, %r11]
	.word 0xc922801f  ! 183: STF_R	st	%f4, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d01f  ! 185: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bae058  ! 186: STDFA_I	stda	%f3, [0x0058, %r11]
	.word 0xcbba98bf  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc79aa068  ! 188: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xca12a03a  ! 189: LDUH_I	lduh	[%r10 + 0x003a], %r5
	.word 0xd0ca917f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2913f  ! 191: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xcc02c01f  ! 192: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc9ba985f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc492a04c  ! 194: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r2
	.word 0xc812c01f  ! 195: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc49aa020  ! 198: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcec2a018  ! 201: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r7
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 205: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba987f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2901f  ! 209: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2911f  ! 211: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc88ae07a  ! 212: LDUBA_I	lduba	[%r11, + 0x007a] %asi, %r4
	.word 0xc282a030  ! 213: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r1
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad83f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad89f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc12801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7ba981f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc49aa010  ! 220: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba999f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc6d2d15f  ! 223: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r3
	.word 0xcdba981f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 225: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd22801f  ! 226: STF_R	st	%f6, [%r31, %r10]
	.word 0xd212e006  ! 227: LDUH_I	lduh	[%r11 + 0x0006], %r9
	.word 0xc722801f  ! 228: STF_R	st	%f3, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca02a074  ! 230: LDUW_I	lduw	[%r10 + 0x0074], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba99bf  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22c01f  ! 232: STF_R	st	%f7, [%r31, %r11]
	.word 0xd3ba99bf  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb02801f  ! 234: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad89f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc652801f  ! 242: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc492d17f  ! 243: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r2
	.word 0xd1bad81f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2d2913f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf02c01f  ! 246: LDF_R	ld	[%r11, %r31], %f7
	.word 0xd1baa008  ! 247: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xc3ba995f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc452801f  ! 249: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd1bae060  ! 250: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad9bf  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xce52a002  ! 254: LDSH_I	ldsh	[%r10 + 0x0002], %r7
	.word 0xc7ba995f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf22c01f  ! 256: STF_R	st	%f7, [%r31, %r11]
	.word 0xcbe2901f  ! 257: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba995f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2cae00e  ! 261: LDSBA_I	ldsba	[%r11, + 0x000e] %asi, %r9
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d01f  ! 263: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xce82907f  ! 267: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r7
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d03f  ! 269: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad83f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL270:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc39aa048  ! 271: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xd1bad8bf  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xd212e050  ! 275: LDUH_I	lduh	[%r11 + 0x0050], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad99f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc92d17f  ! 279: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r6
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
TH_LABEL280:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2911f  ! 281: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba995f  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc852a068  ! 284: LDSH_I	ldsh	[%r10 + 0x0068], %r4
	.word 0xd20ae02c  ! 285: LDUB_I	ldub	[%r11 + 0x002c], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcad2915f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r5
	.word 0xc9ba99bf  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf22c01f  ! 289: STF_R	st	%f7, [%r31, %r11]
	.word 0xd3f2d01f  ! 290: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
TH_LABEL290:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2da901f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xc842801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc902801f  ! 293: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9ba981f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcbbae060  ! 295: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc89aa040  ! 296: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xc5bad93f  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcbbaa018  ! 299: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xcbba995f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc2ca905f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xcbe2903f  ! 304: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2913f  ! 305: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc41ac01f  ! 306: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xd24a801f  ! 307: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad99f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad81f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d13f  ! 312: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc9e2d01f  ! 313: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad99f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0aa024  ! 315: LDUB_I	ldub	[%r10 + 0x0024], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba983f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42a028  ! 318: LDSW_I	ldsw	[%r10 + 0x0028], %r6
	.word 0xc922c01f  ! 319: STF_R	st	%f4, [%r31, %r11]
	.word 0xcd22801f  ! 320: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2911f  ! 321: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb22801f  ! 323: STF_R	st	%f5, [%r31, %r10]
	.word 0xc242a078  ! 324: LDSW_I	ldsw	[%r10 + 0x0078], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad93f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcedae020  ! 328: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r7
	.word 0xcfba995f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba991f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce92917f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xc9f2911f  ! 333: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xd242c01f  ! 334: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xd19ae040  ! 335: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf02a030  ! 336: LDF_I	ld	[%r10, 0x0030], %f7
	.word 0xc292e04e  ! 337: LDUHA_I	lduha	[%r11, + 0x004e] %asi, %r1
	.word 0xd3bad95f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 339: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad81f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL340:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad81f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad87f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc39aa060  ! 344: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xd0d2e07c  ! 345: LDSHA_I	ldsha	[%r11, + 0x007c] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc59ae020  ! 346: LDDFA_I	ldda	[%r11, 0x0020], %f2
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc702c01f  ! 348: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc7baa030  ! 350: STDFA_I	stda	%f3, [0x0030, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7baa010  ! 357: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xcdba99bf  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcb02801f  ! 360: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad99f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc902c01f  ! 362: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcc42801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9ba981f  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL365:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc892d13f  ! 366: LDUHA_R	lduha	[%r11, %r31] 0x89, %r4
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad81f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad99f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL370:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc612a00a  ! 371: LDUH_I	lduh	[%r10 + 0x000a], %r3
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc7baa058  ! 373: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xd09aa010  ! 374: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r8
	.word 0xcd02c01f  ! 375: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc292e03c  ! 376: LDUHA_I	lduha	[%r11, + 0x003c] %asi, %r1
	.word 0xc682a038  ! 377: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r3
	.word 0xc922801f  ! 378: STF_R	st	%f4, [%r31, %r10]
	.word 0xcd9aa008  ! 379: LDDFA_I	ldda	[%r10, 0x0008], %f6
	.word 0xcfba993f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102801f  ! 382: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc522801f  ! 383: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5bad87f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad87f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d11f  ! 389: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc802e064  ! 390: LDUW_I	lduw	[%r11 + 0x0064], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb22801f  ! 391: STF_R	st	%f5, [%r31, %r10]
	.word 0xc322c01f  ! 392: STF_R	st	%f1, [%r31, %r11]
	.word 0xd1ba995f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492a078  ! 395: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc99aa078  ! 396: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xc39aa060  ! 397: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba999f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcad2e024  ! 400: LDSHA_I	ldsha	[%r11, + 0x0024] %asi, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc68a905f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x82, %r3
	.word 0xcbbae008  ! 402: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xc5e2913f  ! 403: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc81a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd3bad81f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad97f  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca12c01f  ! 407: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc7bad95f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd052801f  ! 411: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc4c2907f  ! 412: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r2
	.word 0xcc1ac01f  ! 413: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcccad15f  ! 414: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r6
	.word 0xc722c01f  ! 415: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc68a913f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x89, %r3
	.word 0xd302a034  ! 417: LDF_I	ld	[%r10, 0x0034], %f9
	.word 0xcfbad9bf  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d11f  ! 420: CASA_I	casa	[%r11] 0x88, %r31, %r7
TH_LABEL420:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbae070  ! 421: STDFA_I	stda	%f6, [0x0070, %r11]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba993f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc9aa008  ! 424: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xc8caa020  ! 425: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba987f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81a801f  ! 427: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc3e2913f  ! 428: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc4d2a006  ! 429: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r2
	.word 0xc9bad93f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad87f  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc202e018  ! 433: LDUW_I	lduw	[%r11 + 0x0018], %r1
	.word 0xcacae06b  ! 434: LDSBA_I	ldsba	[%r11, + 0x006b] %asi, %r5
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa058  ! 436: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd1e2d11f  ! 437: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd0d2905f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
	.word 0xcfba981f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc6dad11f  ! 442: LDXA_R	ldxa	[%r11, %r31] 0x88, %r3
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2c2d03f  ! 445: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb9aa030  ! 446: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xca12c01f  ! 447: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc59aa000  ! 449: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcdba991f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL450:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd20a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc39aa010  ! 455: LDDFA_I	ldda	[%r10, 0x0010], %f1
TH_LABEL455:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2cae01e  ! 456: LDSBA_I	ldsba	[%r11, + 0x001e] %asi, %r9
	.word 0xc702e000  ! 457: LDF_I	ld	[%r11, 0x0000], %f3
	.word 0xd05ae020  ! 458: LDX_I	ldx	[%r11 + 0x0020], %r8
	.word 0xd28a917f  ! 459: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc59aa040  ! 461: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xcf9aa028  ! 462: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xcdf2d03f  ! 463: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad97f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc8d2d17f  ! 466: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r4
	.word 0xd3baa018  ! 467: STDFA_I	stda	%f9, [0x0018, %r10]
	.word 0xd3f2d11f  ! 468: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xcc12c01f  ! 469: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xcde2911f  ! 470: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc1ae028  ! 472: LDD_I	ldd	[%r11 + 0x0028], %r6
	.word 0xcf9aa058  ! 473: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xcdba983f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL475:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc45a801f  ! 477: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcfbae010  ! 478: STDFA_I	stda	%f7, [0x0010, %r11]
	.word 0xcd02e074  ! 479: LDF_I	ld	[%r11, 0x0074], %f6
	.word 0xd1bad89f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc81ac01f  ! 482: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc8c2917f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xcfba999f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9baa020  ! 485: STDFA_I	stda	%f4, [0x0020, %r10]
TH_LABEL485:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc42801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcc8a917f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xc3ba999f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 489: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcd9aa008  ! 490: LDDFA_I	ldda	[%r10, 0x0008], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad9bf  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc5baa070  ! 494: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xcc4a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc20a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc44a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc7e2d01f  ! 500: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842a024  ! 501: LDSW_I	ldsw	[%r10 + 0x0024], %r4
	.word 0xc48ad01f  ! 502: LDUBA_R	lduba	[%r11, %r31] 0x80, %r2
	.word 0xc88ad15f  ! 503: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r4
	.word 0xce52801f  ! 504: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc5e2913f  ! 505: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc882d01f  ! 506: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r4
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba987f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc9aa070  ! 510: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba99bf  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcf22801f  ! 517: STF_R	st	%f7, [%r31, %r10]
	.word 0xc5bad97f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccda915f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r6
	.word 0xd2dae028  ! 522: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r9
	.word 0xcbe2901f  ! 523: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba981f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302801f  ! 527: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba983f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc80ac01f  ! 529: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xd1bad91f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc452e026  ! 531: LDSH_I	ldsh	[%r11 + 0x0026], %r2
	.word 0xd1f2d01f  ! 532: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xcd9ae048  ! 533: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xc9ba98bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc12801f  ! 536: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcbe2903f  ! 537: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc302a04c  ! 538: LDF_I	ld	[%r10, 0x004c], %f1
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba995f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5baa010  ! 544: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xc7ba999f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd19aa028  ! 546: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xcc02c01f  ! 547: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xd1bad9bf  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc84a801f  ! 550: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2d13f  ! 551: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbad91f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc68aa056  ! 556: LDUBA_I	lduba	[%r10, + 0x0056] %asi, %r3
	.word 0xc7ba989f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xd052a04c  ! 559: LDSH_I	ldsh	[%r10 + 0x004c], %r8
	.word 0xd092d01f  ! 560: LDUHA_R	lduha	[%r11, %r31] 0x80, %r8
TH_LABEL560:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba995f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 562: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcc8a901f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba983f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa030  ! 567: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xc65a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba987f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL570:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba987f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8caa03d  ! 572: LDSBA_I	ldsba	[%r10, + 0x003d] %asi, %r4
	.word 0xca42a030  ! 573: LDSW_I	ldsw	[%r10 + 0x0030], %r5
	.word 0xc7ba991f  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd19ae060  ! 575: LDDFA_I	ldda	[%r11, 0x0060], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf9ae018  ! 576: LDDFA_I	ldda	[%r11, 0x0018], %f7
	.word 0xd1ba991f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 578: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba989f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba997f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8aa033  ! 583: LDUBA_I	lduba	[%r10, + 0x0033] %asi, %r7
	.word 0xcb9aa050  ! 584: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xd102c01f  ! 585: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc82a00c  ! 587: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r6
	.word 0xd3ba99bf  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 590: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba987f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba999f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc492d13f  ! 595: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02e01c  ! 596: LDF_I	ld	[%r11, 0x001c], %f6
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba987f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd19aa048  ! 600: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc44aa01e  ! 601: LDSB_I	ldsb	[%r10 + 0x001e], %r2
	.word 0xc65a801f  ! 602: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad87f  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccdad17f  ! 605: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba983f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd202e018  ! 607: LDUW_I	lduw	[%r11 + 0x0018], %r9
	.word 0xd1ba981f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba985f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd39aa060  ! 614: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xd05ac01f  ! 615: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc99ae068  ! 616: LDDFA_I	ldda	[%r11, 0x0068], %f4
	.word 0xcada915f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r5
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba995f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02a058  ! 620: LDF_I	ld	[%r10, 0x0058], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba987f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2911f  ! 625: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2913f  ! 626: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba993f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xc702c01f  ! 630: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd082d01f  ! 631: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xd0ca901f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xd1ba991f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292d11f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x88, %r9
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad87f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2d13f  ! 641: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d11f  ! 647: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc692a04c  ! 648: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r3
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd082e074  ! 650: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba989f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd2daa030  ! 655: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba985f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce4a801f  ! 660: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd202801f  ! 662: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc4c2913f  ! 663: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad99f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc82e018  ! 666: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r6
	.word 0xc9baa030  ! 667: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xcdbad89f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc8c2901f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc39aa020  ! 671: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc402801f  ! 674: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d01f  ! 677: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad81f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41ac01f  ! 679: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL680:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc81a801f  ! 681: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc7f2d13f  ! 682: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad81f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1aa038  ! 684: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce92a03c  ! 686: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r7
	.word 0xd122c01f  ! 687: STF_R	st	%f8, [%r31, %r11]
	.word 0xc812a03c  ! 688: LDUH_I	lduh	[%r10 + 0x003c], %r4
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL690:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba997f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa040  ! 692: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc4daa058  ! 693: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r2
	.word 0xc3ba989f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc922801f  ! 696: STF_R	st	%f4, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc79aa070  ! 698: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xc7bad81f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc502c01f  ! 700: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad87f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd2caa048  ! 703: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r9
	.word 0xc7baa078  ! 704: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL705:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd202a078  ! 706: LDUW_I	lduw	[%r10 + 0x0078], %r9
	.word 0xcf9aa018  ! 707: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc4c2d15f  ! 708: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r2
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xce8ad15f  ! 710: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc812801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc652a018  ! 716: LDSH_I	ldsh	[%r10 + 0x0018], %r3
	.word 0xd39aa030  ! 717: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba99bf  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca8ad05f  ! 720: LDUBA_R	lduba	[%r11, %r31] 0x82, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc44aa04f  ! 722: LDSB_I	ldsb	[%r10 + 0x004f], %r2
	.word 0xcbf2d03f  ! 723: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad93f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 728: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xd302a074  ! 729: LDF_I	ld	[%r10, 0x0074], %f9
	.word 0xd122c01f  ! 730: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba989f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8d2901f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xc5ba989f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL735:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba987f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd2daa060  ! 737: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r9
	.word 0xc9e2d01f  ! 738: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad93f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
TH_LABEL740:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 742: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad99f  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc2dad07f  ! 744: LDXA_R	ldxa	[%r11, %r31] 0x83, %r1
	.word 0xd3bad97f  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2d01f  ! 746: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc452a00c  ! 748: LDSH_I	ldsh	[%r10 + 0x000c], %r2
	.word 0xcdbad8bf  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d03f  ! 750: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcde2d13f  ! 751: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcbbaa060  ! 754: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad85f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d11f  ! 758: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad99f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad8bf  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbaa060  ! 765: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba991f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2901f  ! 768: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 769: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd19aa028  ! 772: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xc5ba989f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcdbaa038  ! 774: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcbba989f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc6d2905f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r3
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba993f  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcad2a01c  ! 781: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r5
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc40ac01f  ! 784: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xcd22c01f  ! 785: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd22801f  ! 786: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7ba985f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc652801f  ! 789: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad95f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xca5a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcac2a04c  ! 794: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r5
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc81aa068  ! 796: LDD_I	ldd	[%r10 + 0x0068], %r4
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc322801f  ! 798: STF_R	st	%f1, [%r31, %r10]
	.word 0xd3bad93f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2da911f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x88, %r9
	.word 0xcfba981f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd212a06c  ! 805: LDUH_I	lduh	[%r10 + 0x006c], %r9
TH_LABEL805:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba997f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc48ae062  ! 807: LDUBA_I	lduba	[%r11, + 0x0062] %asi, %r2
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xce0a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd3ba981f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2901f  ! 811: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc41a801f  ! 812: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc202a018  ! 813: LDUW_I	lduw	[%r10 + 0x0018], %r1
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
TH_LABEL815:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc842801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc882a054  ! 818: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r4
	.word 0xc5f2d11f  ! 819: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xcc92915f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba99bf  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9aa020  ! 826: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xc322801f  ! 827: STF_R	st	%f1, [%r31, %r10]
	.word 0xc7ba995f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce92e04c  ! 829: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r7
	.word 0xd102e040  ! 830: LDF_I	ld	[%r11, 0x0040], %f8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 832: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba99bf  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2911f  ! 836: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xca52c01f  ! 837: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcc9aa000  ! 838: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r6
	.word 0xc99aa020  ! 839: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xcb02e004  ! 840: LDF_I	ld	[%r11, 0x0004], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2901f  ! 841: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc01a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc9e2911f  ! 843: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc302a054  ! 844: LDF_I	ld	[%r10, 0x0054], %f1
	.word 0xd00aa01c  ! 845: LDUB_I	ldub	[%r10 + 0x001c], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba981f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf22801f  ! 851: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7baa020  ! 852: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba983f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL855:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba98bf  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd9aa068  ! 857: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba98bf  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd212801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba995f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd1baa078  ! 864: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xce8ad01f  ! 865: LDUBA_R	lduba	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0d2913f  ! 866: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r8
	.word 0xc802801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba993f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4dad13f  ! 872: LDXA_R	ldxa	[%r11, %r31] 0x89, %r2
	.word 0xc302c01f  ! 873: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcb02e04c  ! 875: LDF_I	ld	[%r11, 0x004c], %f5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc452e010  ! 876: LDSH_I	ldsh	[%r11 + 0x0010], %r2
	.word 0xc3bad85f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xccd2903f  ! 879: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc7ba981f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca0ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xd102e040  ! 882: LDF_I	ld	[%r11, 0x0040], %f8
	.word 0xc68a907f  ! 883: LDUBA_R	lduba	[%r10, %r31] 0x83, %r3
	.word 0xc4d2915f  ! 884: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r2
	.word 0xd3e2d01f  ! 885: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad99f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc84aa06e  ! 888: LDSB_I	ldsb	[%r10 + 0x006e], %r4
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
TH_LABEL890:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc41aa038  ! 892: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xd3ba983f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45ae010  ! 894: LDX_I	ldx	[%r11 + 0x0010], %r2
	.word 0xc502e048  ! 895: LDF_I	ld	[%r11, 0x0048], %f2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6c2903f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xc502801f  ! 897: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcff2903f  ! 898: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba993f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba993f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc202c01f  ! 903: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc922801f  ! 905: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc48ad17f  ! 906: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r2
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xcedae018  ! 908: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r7
	.word 0xcde2d03f  ! 909: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad97f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad81f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc612a07c  ! 912: LDUH_I	lduh	[%r10 + 0x007c], %r3
	.word 0xd1f2d03f  ! 913: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad81f  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce92d05f  ! 915: LDUHA_R	lduha	[%r11, %r31] 0x82, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9f2d11f  ! 916: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc8dae018  ! 917: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r4
	.word 0xc7bad93f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd1baa008  ! 920: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca82a04c  ! 921: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r5
	.word 0xc302a060  ! 922: LDF_I	ld	[%r10, 0x0060], %f1
	.word 0xc3ba98bf  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba987f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd20ac01f  ! 926: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc5e2901f  ! 927: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xce42801f  ! 929: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc7ba989f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc12801f  ! 931: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7bad9bf  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad95f  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcdbaa028  ! 935: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba995f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45ac01f  ! 938: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd122801f  ! 939: STF_R	st	%f8, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad89f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc4ca905f  ! 942: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r2
	.word 0xd1f2d13f  ! 943: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad81f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd0dad05f  ! 946: LDXA_R	ldxa	[%r11, %r31] 0x82, %r8
	.word 0xc9ba985f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba993f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 954: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
TH_LABEL955:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd282a010  ! 956: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r9
	.word 0xcfba987f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcacaa020  ! 959: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r5
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc702a014  ! 963: LDF_I	ld	[%r10, 0x0014], %f3
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2903f  ! 965: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba993f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd39aa018  ! 968: LDDFA_I	ldda	[%r10, 0x0018], %f9
	.word 0xce52a058  ! 969: LDSH_I	ldsh	[%r10 + 0x0058], %r7
	.word 0xd1ba989f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba989f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1bae000  ! 972: STDFA_I	stda	%f8, [0x0000, %r11]
	.word 0xccd2a01c  ! 973: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r6
	.word 0xd1ba987f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2913f  ! 976: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc502a040  ! 977: LDF_I	ld	[%r10, 0x0040], %f2
	.word 0xc452801f  ! 978: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5ba995f  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba99bf  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd082a020  ! 986: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r8
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcd02a018  ! 988: LDF_I	ld	[%r10, 0x0018], %f6
	.word 0xcc52e062  ! 989: LDSH_I	ldsh	[%r11 + 0x0062], %r6
	.word 0xc2daa050  ! 990: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2901f  ! 991: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcec2d11f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xd3bad91f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcac2a050  ! 994: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r5
	.word 0xcaca905f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba983f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 997: STF_R	st	%f9, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d11f  ! 999: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad8bf  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	subcc %r30, 1, %r30
	bnz  TH3_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	add	%g0,	0x1,	%r30
TH2_LOOP_START:
	.word 0xce92e06e  ! 1: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r7
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc882e030  ! 4: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r4
	.word 0xc7ba98bf  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd00a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc8d2907f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r4
	.word 0xc65a801f  ! 8: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd3bad99f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1baa008  ! 10: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad81f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad99f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL15:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcaca903f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xd052a078  ! 17: LDSH_I	ldsh	[%r10 + 0x0078], %r8
	.word 0xcbbae020  ! 18: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xc5ba989f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba987f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc8d2a050  ! 23: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r4
	.word 0xc7ba981f  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd19aa040  ! 25: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba983f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa020  ! 28: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xc60a801f  ! 29: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc3e2d01f  ! 30: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3bad8bf  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc882a04c  ! 33: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r4
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad89f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc882901f  ! 37: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd242a050  ! 39: LDSW_I	ldsw	[%r10 + 0x0050], %r9
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba985f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 42: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc4da905f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x82, %r2
	.word 0xc7ba997f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba993f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc902a00c  ! 47: LDF_I	ld	[%r10, 0x000c], %f4
	.word 0xcac2901f  ! 48: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc45ac01f  ! 49: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xc5ba985f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbae058  ! 52: STDFA_I	stda	%f6, [0x0058, %r11]
	.word 0xc68aa057  ! 53: LDUBA_I	lduba	[%r10, + 0x0057] %asi, %r3
	.word 0xc2dae020  ! 54: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r1
	.word 0xc9bad81f  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad85f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 59: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc452e01e  ! 60: LDSH_I	ldsh	[%r11 + 0x001e], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2913f  ! 61: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba991f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd252801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc682e000  ! 65: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc41aa040  ! 66: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xc302e078  ! 67: LDF_I	ld	[%r11, 0x0078], %f1
	.word 0xd3baa028  ! 68: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xc3ba993f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc9ae078  ! 70: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba999f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd22801f  ! 72: STF_R	st	%f6, [%r31, %r10]
	.word 0xcc02e010  ! 73: LDUW_I	lduw	[%r11 + 0x0010], %r6
	.word 0xd102e07c  ! 74: LDF_I	ld	[%r11, 0x007c], %f8
	.word 0xc502801f  ! 75: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba995f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba989f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba997f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd012801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc39aa050  ! 83: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2901f  ! 85: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba983f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd002c01f  ! 91: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc20a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc492913f  ! 94: LDUHA_R	lduha	[%r10, %r31] 0x89, %r2
	.word 0xd3baa028  ! 95: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7bad93f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc8ae07e  ! 97: LDUBA_I	lduba	[%r11, + 0x007e] %asi, %r6
	.word 0xd2cad01f  ! 98: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc412e042  ! 100: LDUH_I	lduh	[%r11 + 0x0042], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02a044  ! 101: LDF_I	ld	[%r10, 0x0044], %f6
	.word 0xce02c01f  ! 102: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcd9ae020  ! 103: LDDFA_I	ldda	[%r11, 0x0020], %f6
	.word 0xcd22c01f  ! 104: STF_R	st	%f6, [%r31, %r11]
	.word 0xcf02c01f  ! 105: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd302801f  ! 106: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd302a03c  ! 107: LDF_I	ld	[%r10, 0x003c], %f9
	.word 0xcbbad81f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd2d2901f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdba999f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba983f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc44aa06c  ! 115: LDSB_I	ldsb	[%r10 + 0x006c], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad99f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad9bf  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc412c01f  ! 122: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xcc0a801f  ! 123: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba991f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc5aa060  ! 128: LDX_I	ldx	[%r10 + 0x0060], %r6
	.word 0xd102a050  ! 129: LDF_I	ld	[%r10, 0x0050], %f8
	.word 0xd08a907f  ! 130: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2901f  ! 131: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba983f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 134: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xca8ae072  ! 135: LDUBA_I	lduba	[%r11, + 0x0072] %asi, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba999f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 137: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc702801f  ! 138: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfe2d13f  ! 139: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcff2d13f  ! 140: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad83f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad99f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf02a020  ! 146: LDF_I	ld	[%r10, 0x0020], %f7
	.word 0xc702e010  ! 147: LDF_I	ld	[%r11, 0x0010], %f3
	.word 0xcbba98bf  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc6daa070  ! 149: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r3
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad81f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc882a008  ! 152: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r4
	.word 0xc2c2915f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xc81aa010  ! 154: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xce82901f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
TH_LABEL155:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 157: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad93f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc9aa070  ! 161: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd08a901f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xcd02a054  ! 164: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba995f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc92917f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r6
	.word 0xca52801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc2cae074  ! 169: LDSBA_I	ldsba	[%r11, + 0x0074] %asi, %r1
	.word 0xc5ba989f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba983f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce5a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcdba99bf  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc2c2e020  ! 175: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r1
TH_LABEL175:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba981f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc2d2e074  ! 178: LDSHA_I	ldsha	[%r11, + 0x0074] %asi, %r1
	.word 0xce8a917f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r7
	.word 0xcbbaa048  ! 180: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc322801f  ! 182: STF_R	st	%f1, [%r31, %r10]
	.word 0xc922801f  ! 183: STF_R	st	%f4, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d01f  ! 185: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbaa030  ! 186: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xcbba991f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc59ae058  ! 188: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xc212a026  ! 189: LDUH_I	lduh	[%r10 + 0x0026], %r1
	.word 0xd2ca915f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xcc02c01f  ! 192: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc9ba981f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc492a04e  ! 194: LDUHA_I	lduha	[%r10, + 0x004e] %asi, %r2
	.word 0xc212801f  ! 195: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc49aa010  ! 198: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4c2a048  ! 201: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r2
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 205: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba991f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2913f  ! 209: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba999f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2913f  ! 211: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xca8aa003  ! 212: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r5
	.word 0xd082a008  ! 213: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r8
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad85f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc612801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba989f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc49aa010  ! 220: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba983f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd01ac01f  ! 222: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xccd2d13f  ! 223: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r6
	.word 0xcdba989f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 225: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc522c01f  ! 226: STF_R	st	%f2, [%r31, %r11]
	.word 0xca12e046  ! 227: LDUH_I	lduh	[%r11 + 0x0046], %r5
	.word 0xcb22801f  ! 228: STF_R	st	%f5, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xce02a000  ! 230: LDUW_I	lduw	[%r10 + 0x0000], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba993f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 232: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3ba995f  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc502801f  ! 234: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad93f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd052801f  ! 242: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd292d01f  ! 243: LDUHA_R	lduha	[%r11, %r31] 0x80, %r9
	.word 0xd1bad99f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xced2913f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302801f  ! 246: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7bae040  ! 247: STDFA_I	stda	%f3, [0x0040, %r11]
	.word 0xc3ba989f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc252c01f  ! 249: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd1baa060  ! 250: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xca52a004  ! 254: LDSH_I	ldsh	[%r10 + 0x0004], %r5
	.word 0xc7ba995f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd22801f  ! 256: STF_R	st	%f6, [%r31, %r10]
	.word 0xcbe2901f  ! 257: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba98bf  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4caa04b  ! 261: LDSBA_I	ldsba	[%r10, + 0x004b] %asi, %r2
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d01f  ! 263: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc282907f  ! 267: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r1
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad87f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc79aa030  ! 271: LDDFA_I	ldda	[%r10, 0x0030], %f3
	.word 0xd1bad99f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xd212e068  ! 275: LDUH_I	lduh	[%r11 + 0x0068], %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbad93f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc492d13f  ! 279: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2903f  ! 281: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba99bf  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc652e024  ! 284: LDSH_I	ldsh	[%r11 + 0x0024], %r3
	.word 0xc20ae00b  ! 285: LDUB_I	ldub	[%r11 + 0x000b], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd0d2905f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
	.word 0xc9ba999f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 289: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3f2d13f  ! 290: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcadad03f  ! 291: LDXA_R	ldxa	[%r11, %r31] 0x81, %r5
	.word 0xd042801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc302c01f  ! 293: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc9ba987f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa008  ! 295: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc89aa028  ! 296: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xc5bad8bf  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc9baa018  ! 299: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xcbba999f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xceca911f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xcbe2913f  ! 304: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2903f  ! 305: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
TH_LABEL305:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc81ac01f  ! 306: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc64a801f  ! 307: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad89f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bad85f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d13f  ! 313: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad81f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd20aa018  ! 315: LDUB_I	ldub	[%r10 + 0x0018], %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba985f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42a03c  ! 318: LDSW_I	ldsw	[%r10 + 0x003c], %r6
	.word 0xcb22801f  ! 319: STF_R	st	%f5, [%r31, %r10]
	.word 0xc722801f  ! 320: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3e2913f  ! 321: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc322801f  ! 323: STF_R	st	%f1, [%r31, %r10]
	.word 0xc242e060  ! 324: LDSW_I	ldsw	[%r11 + 0x0060], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
TH_LABEL325:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad89f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6dae048  ! 328: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r3
	.word 0xcfba985f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba989f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc892901f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xc9f2913f  ! 333: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc442801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc79aa018  ! 335: LDDFA_I	ldda	[%r10, 0x0018], %f3
TH_LABEL335:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd302a03c  ! 336: LDF_I	ld	[%r10, 0x003c], %f9
	.word 0xc492e02c  ! 337: LDUHA_I	lduha	[%r11, + 0x002c] %asi, %r2
	.word 0xd3bad85f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d03f  ! 339: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad83f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad95f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcb9aa070  ! 344: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xccd2a020  ! 345: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd39ae030  ! 346: LDDFA_I	ldda	[%r11, 0x0030], %f9
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc502801f  ! 348: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd1baa048  ! 350: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad95f  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc3baa020  ! 357: STDFA_I	stda	%f1, [0x0020, %r10]
	.word 0xcdba987f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd302801f  ! 360: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad8bf  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc502801f  ! 362: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcc42801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9ba981f  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc92913f  ! 366: LDUHA_R	lduha	[%r10, %r31] 0x89, %r6
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad89f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad83f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc412a00c  ! 371: LDUH_I	lduh	[%r10 + 0x000c], %r2
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9baa038  ! 373: STDFA_I	stda	%f4, [0x0038, %r10]
	.word 0xcc9ae028  ! 374: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r6
	.word 0xc302c01f  ! 375: LDF_R	ld	[%r11, %r31], %f1
TH_LABEL375:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd092e034  ! 376: LDUHA_I	lduha	[%r11, + 0x0034] %asi, %r8
	.word 0xc882a00c  ! 377: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r4
	.word 0xd322801f  ! 378: STF_R	st	%f9, [%r31, %r10]
	.word 0xc99aa068  ! 379: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xcfba991f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba989f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102c01f  ! 382: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd322801f  ! 383: STF_R	st	%f9, [%r31, %r10]
	.word 0xc5bad99f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad83f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d13f  ! 389: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xca02e008  ! 390: LDUW_I	lduw	[%r11 + 0x0008], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd122801f  ! 391: STF_R	st	%f8, [%r31, %r10]
	.word 0xc922801f  ! 392: STF_R	st	%f4, [%r31, %r10]
	.word 0xd1ba98bf  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce92a00a  ! 395: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd39aa040  ! 396: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xc59aa040  ! 397: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba999f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcad2a048  ! 400: LDSHA_I	ldsha	[%r10, + 0x0048] %asi, %r5
TH_LABEL400:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd28ad05f  ! 401: LDUBA_R	lduba	[%r11, %r31] 0x82, %r9
	.word 0xcbbae018  ! 402: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xc5e2913f  ! 403: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc01a801f  ! 404: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd3bad81f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad81f  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc612801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7bad89f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc52801f  ! 411: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd0c2d01f  ! 412: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xd01ac01f  ! 413: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc2cad17f  ! 414: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xc722801f  ! 415: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc68a903f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xd102a05c  ! 417: LDF_I	ld	[%r10, 0x005c], %f8
	.word 0xcfbad9bf  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d01f  ! 420: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5baa028  ! 421: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba997f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc49aa068  ! 424: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xcccaa021  ! 425: LDSBA_I	ldsba	[%r10, + 0x0021] %asi, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba981f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc01ac01f  ! 427: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xc3e2913f  ! 428: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc4d2a01a  ! 429: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r2
	.word 0xc9bad95f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad9bf  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc402a028  ! 433: LDUW_I	lduw	[%r10 + 0x0028], %r2
	.word 0xc2cae056  ! 434: LDSBA_I	ldsba	[%r11, + 0x0056] %asi, %r1
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bae038  ! 436: STDFA_I	stda	%f4, [0x0038, %r11]
	.word 0xd1e2d01f  ! 437: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc6d2915f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r3
	.word 0xcfba999f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2da903f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x81, %r1
	.word 0xc9f2903f  ! 443: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba985f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2901f  ! 445: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf9aa018  ! 446: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc212801f  ! 447: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcf9aa078  ! 449: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcdba987f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc60a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2901f  ! 454: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc79ae050  ! 455: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcccaa037  ! 456: LDSBA_I	ldsba	[%r10, + 0x0037] %asi, %r6
	.word 0xc902a05c  ! 457: LDF_I	ld	[%r10, 0x005c], %f4
	.word 0xd25aa050  ! 458: LDX_I	ldx	[%r10 + 0x0050], %r9
	.word 0xc88ad05f  ! 459: LDUBA_R	lduba	[%r11, %r31] 0x82, %r4
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcf9ae008  ! 461: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xcd9aa018  ! 462: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xcdf2d01f  ! 463: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad81f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
TH_LABEL465:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccd2905f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r6
	.word 0xc9baa058  ! 467: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xd3f2d13f  ! 468: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xcc12801f  ! 469: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcde2913f  ! 470: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd01aa060  ! 472: LDD_I	ldd	[%r10 + 0x0060], %r8
	.word 0xc99aa058  ! 473: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xcdba987f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc85a801f  ! 477: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc7baa060  ! 478: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc902a004  ! 479: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xd1bad8bf  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xcc1a801f  ! 482: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd0c2d11f  ! 483: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r8
	.word 0xcfba999f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc3baa038  ! 485: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca42801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcc8ad03f  ! 487: LDUBA_R	lduba	[%r11, %r31] 0x81, %r6
	.word 0xc3ba989f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 489: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd19aa040  ! 490: LDDFA_I	ldda	[%r10, 0x0040], %f8
TH_LABEL490:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad9bf  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcbbaa048  ! 494: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xca4a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd00ac01f  ! 498: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc64a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7e2d01f  ! 500: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca42e014  ! 501: LDSW_I	ldsw	[%r11 + 0x0014], %r5
	.word 0xcc8a915f  ! 502: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r6
	.word 0xc88a911f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xd052c01f  ! 504: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xc5e2901f  ! 505: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc82913f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r6
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba983f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc89aa020  ! 510: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba981f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2913f  ! 516: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcb22801f  ! 517: STF_R	st	%f5, [%r31, %r10]
	.word 0xc5bad99f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6da905f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x82, %r3
	.word 0xc8daa000  ! 522: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r4
	.word 0xcbe2911f  ! 523: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba987f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba98bf  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc702c01f  ! 527: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcfba993f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc20ac01f  ! 529: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd1bad8bf  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd252a052  ! 531: LDSH_I	ldsh	[%r10 + 0x0052], %r9
	.word 0xd1f2d03f  ! 532: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xc99aa058  ! 533: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xc9ba991f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc12c01f  ! 536: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xcbe2913f  ! 537: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xd102a004  ! 538: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2911f  ! 541: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba981f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa060  ! 544: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xc7ba989f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd19aa008  ! 546: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xc402801f  ! 547: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd1bad97f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca4a801f  ! 550: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2d11f  ! 551: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad9bf  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc48aa02f  ! 556: LDUBA_I	lduba	[%r10, + 0x002f] %asi, %r2
	.word 0xc7ba991f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc852e040  ! 559: LDSH_I	ldsh	[%r11 + 0x0040], %r4
	.word 0xc292915f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba995f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 562: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc88a907f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba997f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd39aa040  ! 567: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xc85a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba991f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba985f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc2cae00e  ! 572: LDSBA_I	ldsba	[%r11, + 0x000e] %asi, %r1
	.word 0xc642a04c  ! 573: LDSW_I	ldsw	[%r10 + 0x004c], %r3
	.word 0xc7ba98bf  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd39ae078  ! 575: LDDFA_I	ldda	[%r11, 0x0078], %f9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd19aa048  ! 576: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xd1ba981f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 578: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba983f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba98bf  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88aa070  ! 583: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r4
	.word 0xcd9ae038  ! 584: LDDFA_I	ldda	[%r11, 0x0038], %f6
	.word 0xd302801f  ! 585: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xce82a038  ! 587: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r7
	.word 0xd3ba989f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 590: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba981f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba981f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca92901f  ! 595: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc502a00c  ! 596: LDF_I	ld	[%r10, 0x000c], %f2
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba995f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9ae028  ! 600: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd24ae010  ! 601: LDSB_I	ldsb	[%r11 + 0x0010], %r9
	.word 0xce5a801f  ! 602: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad85f  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xceda901f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba981f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc402a030  ! 607: LDUW_I	lduw	[%r10 + 0x0030], %r2
	.word 0xd1ba983f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba991f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba99bf  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb9aa030  ! 614: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xce5ac01f  ! 615: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf9aa050  ! 616: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xc4da901f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba997f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc902a064  ! 620: LDF_I	ld	[%r10, 0x0064], %f4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba991f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba987f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2901f  ! 625: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2913f  ! 626: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba981f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd102801f  ! 630: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc282d03f  ! 631: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r1
	.word 0xd2ca917f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xd1ba991f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc92915f  ! 634: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad8bf  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL640:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2d11f  ! 641: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 647: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xd092a054  ! 648: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r8
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc282a060  ! 650: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2911f  ! 651: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba981f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xc4daa008  ! 655: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r2
TH_LABEL655:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba997f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd24a801f  ! 660: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca02801f  ! 662: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcec2913f  ! 663: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r7
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad93f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82a038  ! 666: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r6
	.word 0xc3baa058  ! 667: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xcdbad83f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc2c2d15f  ! 670: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae000  ! 671: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc402801f  ! 674: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d03f  ! 677: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad91f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc41ac01f  ! 679: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd01a801f  ! 681: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc7f2d11f  ! 682: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad89f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc01aa068  ! 684: LDD_I	ldd	[%r10 + 0x0068], %r0
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd292a060  ! 686: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r9
	.word 0xd322801f  ! 687: STF_R	st	%f9, [%r31, %r10]
	.word 0xca12a07c  ! 688: LDUH_I	lduh	[%r10 + 0x007c], %r5
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba995f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa020  ! 692: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xd2daa030  ! 693: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r9
	.word 0xc3ba98bf  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL695:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc922801f  ! 696: STF_R	st	%f4, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd9aa018  ! 698: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xc7bad93f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd102c01f  ! 700: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad93f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd2caa061  ! 703: LDSBA_I	ldsba	[%r10, + 0x0061] %asi, %r9
	.word 0xc5baa038  ! 704: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc02a048  ! 706: LDUW_I	lduw	[%r10 + 0x0048], %r6
	.word 0xd19aa028  ! 707: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xd2c2901f  ! 708: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xce8ad11f  ! 710: LDUBA_R	lduba	[%r11, %r31] 0x88, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc412801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r2
TH_LABEL715:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc652a074  ! 716: LDSH_I	ldsh	[%r10 + 0x0074], %r3
	.word 0xc59aa008  ! 717: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xd1e2911f  ! 718: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba98bf  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68a917f  ! 720: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca4ae001  ! 722: LDSB_I	ldsb	[%r11 + 0x0001], %r5
	.word 0xcbf2d11f  ! 723: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad97f  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 728: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcd02a054  ! 729: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xc522801f  ! 730: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba989f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8d2917f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r4
	.word 0xc5ba993f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba995f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd2daa070  ! 737: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r9
	.word 0xc9e2d11f  ! 738: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad99f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 742: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad8bf  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc2da907f  ! 744: LDXA_R	ldxa	[%r10, %r31] 0x83, %r1
	.word 0xd3bad9bf  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d01f  ! 746: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc852e01e  ! 748: LDSH_I	ldsh	[%r11 + 0x001e], %r4
	.word 0xcdbad87f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d11f  ! 750: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2d13f  ! 751: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcfbaa000  ! 754: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad9bf  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 758: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad8bf  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL760:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad99f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcbbaa048  ! 765: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba989f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2913f  ! 768: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2913f  ! 769: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba999f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd19aa018  ! 772: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xc5ba997f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcfbaa020  ! 774: STDFA_I	stda	%f7, [0x0020, %r10]
	.word 0xcbba987f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xccd2917f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba999f  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcad2a022  ! 781: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r5
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba993f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd00a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc522801f  ! 785: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc522c01f  ! 786: STF_R	st	%f2, [%r31, %r11]
	.word 0xc7ba99bf  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xca52801f  ! 789: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bad81f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc85a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcac2e078  ! 794: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r5
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc1aa078  ! 796: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc722801f  ! 798: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3bad8bf  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8da915f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r4
	.word 0xcfba989f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca12a018  ! 805: LDUH_I	lduh	[%r10 + 0x0018], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba981f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc68aa062  ! 807: LDUBA_I	lduba	[%r10, + 0x0062] %asi, %r3
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc60ac01f  ! 809: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd3ba999f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2913f  ! 811: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc41a801f  ! 812: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xce02e058  ! 813: LDUW_I	lduw	[%r11 + 0x0058], %r7
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc842801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xce82a020  ! 818: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r7
	.word 0xc5f2d03f  ! 819: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc892903f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x81, %r4
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba999f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL825:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd9ae000  ! 826: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xc322801f  ! 827: STF_R	st	%f1, [%r31, %r10]
	.word 0xc7ba981f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd292a020  ! 829: LDUHA_I	lduha	[%r10, + 0x0020] %asi, %r9
	.word 0xc502a014  ! 830: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba993f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 832: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba981f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfe2901f  ! 836: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xd252c01f  ! 837: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc49ae058  ! 838: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r2
	.word 0xcb9aa010  ! 839: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xd102e010  ! 840: LDF_I	ld	[%r11, 0x0010], %f8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2911f  ! 841: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc01a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc9e2903f  ! 843: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcb02e018  ! 844: LDF_I	ld	[%r11, 0x0018], %f5
	.word 0xcc0aa04c  ! 845: LDUB_I	ldub	[%r10 + 0x004c], %r6
TH_LABEL845:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba989f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL850:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc322801f  ! 851: STF_R	st	%f1, [%r31, %r10]
	.word 0xc9baa058  ! 852: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba997f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba981f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf9ae028  ! 857: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba989f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc412801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc7bae058  ! 864: STDFA_I	stda	%f3, [0x0058, %r11]
	.word 0xc48a917f  ! 865: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc8d2d05f  ! 866: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r4
	.word 0xc802801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba985f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL870:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcada915f  ! 872: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r5
	.word 0xc902c01f  ! 873: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcd02a00c  ! 875: LDF_I	ld	[%r10, 0x000c], %f6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc852e06c  ! 876: LDSH_I	ldsh	[%r11 + 0x006c], %r4
	.word 0xc3bad87f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xccd2901f  ! 879: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xc7ba98bf  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc20ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xc502a000  ! 882: LDF_I	ld	[%r10, 0x0000], %f2
	.word 0xcc8a911f  ! 883: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xced2903f  ! 884: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xd3e2d11f  ! 885: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad81f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc24ae032  ! 888: LDSB_I	ldsb	[%r11 + 0x0032], %r1
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd01ae068  ! 892: LDD_I	ldd	[%r11 + 0x0068], %r8
	.word 0xd3ba981f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45aa030  ! 894: LDX_I	ldx	[%r10 + 0x0030], %r2
	.word 0xcf02a064  ! 895: LDF_I	ld	[%r10, 0x0064], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2c2d03f  ! 896: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r1
	.word 0xcd02801f  ! 897: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcff2903f  ! 898: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba98bf  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba991f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd202801f  ! 903: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcb22c01f  ! 905: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd08a901f  ! 906: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xd2dae008  ! 908: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r9
	.word 0xcde2d03f  ! 909: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad81f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad89f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc12a026  ! 912: LDUH_I	lduh	[%r10 + 0x0026], %r6
	.word 0xd1f2d13f  ! 913: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad8bf  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca92917f  ! 915: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2d03f  ! 916: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xd0daa040  ! 917: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r8
	.word 0xc7bad9bf  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc5baa050  ! 920: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc482e030  ! 921: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r2
	.word 0xc302e028  ! 922: LDF_I	ld	[%r11, 0x0028], %f1
	.word 0xc3ba993f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba981f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL925:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce0a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc5e2901f  ! 927: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcc42801f  ! 929: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc7ba995f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL930:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 931: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7bad85f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad8bf  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc3baa030  ! 935: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba997f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce5a801f  ! 938: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc922801f  ! 939: STF_R	st	%f4, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad81f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc2ca905f  ! 942: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xd1f2d03f  ! 943: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1bad97f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4da905f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x82, %r2
	.word 0xc9ba983f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba981f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 954: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce82e040  ! 956: LDUWA_I	lduwa	[%r11, + 0x0040] %asi, %r7
	.word 0xcfba983f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcacae053  ! 959: LDSBA_I	ldsba	[%r11, + 0x0053] %asi, %r5
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf02a04c  ! 963: LDF_I	ld	[%r10, 0x004c], %f7
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2911f  ! 965: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
TH_LABEL965:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba983f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc79ae060  ! 968: LDDFA_I	ldda	[%r11, 0x0060], %f3
	.word 0xc452e02e  ! 969: LDSH_I	ldsh	[%r11 + 0x002e], %r2
	.word 0xd1ba99bf  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba987f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcbbae028  ! 972: STDFA_I	stda	%f5, [0x0028, %r11]
	.word 0xced2e024  ! 973: LDSHA_I	ldsha	[%r11, + 0x0024] %asi, %r7
	.word 0xd1ba989f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2911f  ! 976: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd302e00c  ! 977: LDF_I	ld	[%r11, 0x000c], %f9
	.word 0xce52c01f  ! 978: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc5ba98bf  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba993f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc282a048  ! 986: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r1
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd102a068  ! 988: LDF_I	ld	[%r10, 0x0068], %f8
	.word 0xc852a064  ! 989: LDSH_I	ldsh	[%r10 + 0x0064], %r4
	.word 0xcedaa058  ! 990: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r7
TH_LABEL990:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcff2913f  ! 991: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc6c2d13f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r3
	.word 0xd3bad91f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2a044  ! 994: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r2
	.word 0xd0ca913f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba991f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 997: STF_R	st	%f6, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d03f  ! 999: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad95f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xc492e036  ! 1: LDUHA_I	lduha	[%r11, + 0x0036] %asi, %r2
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc282a038  ! 4: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r1
	.word 0xc7ba985f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc0a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc4d2913f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xc45a801f  ! 8: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd3bad85f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bae008  ! 10: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad85f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad99f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8ca901f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xc652a016  ! 17: LDSH_I	ldsh	[%r10 + 0x0016], %r3
	.word 0xcdbaa048  ! 18: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xc5ba997f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba991f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd0d2a00c  ! 23: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r8
	.word 0xc7ba99bf  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd19aa008  ! 25: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba987f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5baa058  ! 28: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xc20ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xc3e2d11f  ! 30: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad81f  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc682a058  ! 33: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r3
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad8bf  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce82913f  ! 37: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r7
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xca42a040  ! 39: LDSW_I	ldsw	[%r10 + 0x0040], %r5
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba991f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 42: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc2da913f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x89, %r1
	.word 0xc7ba989f  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba985f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc902e03c  ! 47: LDF_I	ld	[%r11, 0x003c], %f4
	.word 0xcac2d03f  ! 48: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r5
	.word 0xc65ac01f  ! 49: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc5ba991f  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL50:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc3baa058  ! 52: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xc28aa02c  ! 53: LDUBA_I	lduba	[%r10, + 0x002c] %asi, %r1
	.word 0xc2daa078  ! 54: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r1
	.word 0xc9bad8bf  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL55:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad89f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 59: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc452a078  ! 60: LDSH_I	ldsh	[%r10 + 0x0078], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2911f  ! 61: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba983f  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc852c01f  ! 64: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xca82a048  ! 65: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r5
TH_LABEL65:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01ae010  ! 66: LDD_I	ldd	[%r11 + 0x0010], %r8
	.word 0xcd02a02c  ! 67: LDF_I	ld	[%r10, 0x002c], %f6
	.word 0xd3baa038  ! 68: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xc3ba98bf  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa050  ! 70: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r0
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba981f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd122801f  ! 72: STF_R	st	%f8, [%r31, %r10]
	.word 0xce02e024  ! 73: LDUW_I	lduw	[%r11 + 0x0024], %r7
	.word 0xd102a078  ! 74: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xc702801f  ! 75: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba999f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba98bf  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba997f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc612801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcb9aa068  ! 83: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2911f  ! 85: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba981f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc602801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xd20a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xd092917f  ! 94: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xc9baa020  ! 95: STDFA_I	stda	%f4, [0x0020, %r10]
TH_LABEL95:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bad81f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd08aa05e  ! 97: LDUBA_I	lduba	[%r10, + 0x005e] %asi, %r8
	.word 0xcecad03f  ! 98: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r7
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xce12a040  ! 100: LDUH_I	lduh	[%r10 + 0x0040], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb02e04c  ! 101: LDF_I	ld	[%r11, 0x004c], %f5
	.word 0xcc02801f  ! 102: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcd9ae058  ! 103: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xc322801f  ! 104: STF_R	st	%f1, [%r31, %r10]
	.word 0xcf02c01f  ! 105: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd02801f  ! 106: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc502e078  ! 107: LDF_I	ld	[%r11, 0x0078], %f2
	.word 0xcbbad93f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc2d2903f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba995f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba985f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc44aa06b  ! 115: LDSB_I	ldsb	[%r10 + 0x006b], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad8bf  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad97f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r5
TH_LABEL120:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad81f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc812c01f  ! 122: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc40a801f  ! 123: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca52801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba991f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd25aa008  ! 128: LDX_I	ldx	[%r10 + 0x0008], %r9
	.word 0xc502a070  ! 129: LDF_I	ld	[%r10, 0x0070], %f2
	.word 0xc88a907f  ! 130: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2901f  ! 131: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 134: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc28ae008  ! 135: LDUBA_I	lduba	[%r11, + 0x0008] %asi, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba99bf  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 137: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xc902801f  ! 138: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfe2d01f  ! 139: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcff2d01f  ! 140: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad97f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad8bf  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcb02a060  ! 146: LDF_I	ld	[%r10, 0x0060], %f5
	.word 0xc902a078  ! 147: LDF_I	ld	[%r10, 0x0078], %f4
	.word 0xcbba991f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc4dae000  ! 149: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r2
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
TH_LABEL150:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad91f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd282a030  ! 152: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r9
	.word 0xcac2911f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r5
	.word 0xd01ae058  ! 154: LDD_I	ldd	[%r11 + 0x0058], %r8
	.word 0xd082917f  ! 155: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 157: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad8bf  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc49aa070  ! 161: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xd08a901f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xc702a028  ! 164: LDF_I	ld	[%r10, 0x0028], %f3
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba98bf  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce92915f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xca52c01f  ! 168: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc8cae066  ! 169: LDSBA_I	ldsba	[%r11, + 0x0066] %asi, %r4
	.word 0xc5ba98bf  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba989f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc45a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcdba987f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2c2a074  ! 175: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba997f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xced2e00c  ! 178: LDSHA_I	ldsha	[%r11, + 0x000c] %asi, %r7
	.word 0xca8a901f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xd3bae018  ! 180: STDFA_I	stda	%f9, [0x0018, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2911f  ! 181: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xcd22801f  ! 182: STF_R	st	%f6, [%r31, %r10]
	.word 0xcf22801f  ! 183: STF_R	st	%f7, [%r31, %r10]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d01f  ! 185: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3baa038  ! 186: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xcbba99bf  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc99aa068  ! 188: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xd012e056  ! 189: LDUH_I	lduh	[%r11 + 0x0056], %r8
	.word 0xd2ca915f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xce02801f  ! 192: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc9ba987f  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc92a026  ! 194: LDUHA_I	lduha	[%r10, + 0x0026] %asi, %r6
	.word 0xc212801f  ! 195: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc09aa000  ! 198: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r0
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4c2e03c  ! 201: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r2
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 205: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
TH_LABEL205:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba999f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2903f  ! 209: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba995f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2901f  ! 211: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc68aa01a  ! 212: LDUBA_I	lduba	[%r10, + 0x001a] %asi, %r3
	.word 0xd282e014  ! 213: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r9
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bad81f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca12801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7ba985f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd09ae060  ! 220: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba989f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81a801f  ! 222: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xccd2d07f  ! 223: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r6
	.word 0xcdba987f  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 225: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc322c01f  ! 226: STF_R	st	%f1, [%r31, %r11]
	.word 0xc812a068  ! 227: LDUH_I	lduh	[%r10 + 0x0068], %r4
	.word 0xc922801f  ! 228: STF_R	st	%f4, [%r31, %r10]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc802a014  ! 230: LDUW_I	lduw	[%r10 + 0x0014], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba985f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922c01f  ! 232: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3ba98bf  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc902801f  ! 234: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad81f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
TH_LABEL240:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd052c01f  ! 242: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xc692915f  ! 243: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xd1bad81f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6d2901f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc502c01f  ! 246: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcbbae070  ! 247: STDFA_I	stda	%f5, [0x0070, %r11]
	.word 0xc3ba997f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd252c01f  ! 249: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd3baa078  ! 250: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc252a06c  ! 254: LDSH_I	ldsh	[%r10 + 0x006c], %r1
	.word 0xc7ba983f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc922801f  ! 256: STF_R	st	%f4, [%r31, %r10]
	.word 0xcbe2903f  ! 257: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba989f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
TH_LABEL260:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4caa018  ! 261: LDSBA_I	ldsba	[%r10, + 0x0018] %asi, %r2
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d03f  ! 263: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc882d07f  ! 267: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r4
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad95f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd19aa028  ! 271: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xd1bad89f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xcc12a070  ! 275: LDUH_I	lduh	[%r10 + 0x0070], %r6
TH_LABEL275:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad97f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xce92907f  ! 279: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1e2911f  ! 281: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba985f  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd052a034  ! 284: LDSH_I	ldsh	[%r10 + 0x0034], %r8
	.word 0xd20ae072  ! 285: LDUB_I	ldub	[%r11 + 0x0072], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc4d2905f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xc9ba98bf  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc722c01f  ! 289: STF_R	st	%f3, [%r31, %r11]
	.word 0xd3f2d11f  ! 290: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2da917f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xc242801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc902801f  ! 293: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9ba993f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbaa000  ! 295: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc49aa078  ! 296: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xc5bad95f  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3baa028  ! 299: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xcbba989f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd2ca905f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r9
	.word 0xcbe2913f  ! 304: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2901f  ! 305: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc01a801f  ! 306: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc64a801f  ! 307: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad95f  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad93f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d11f  ! 312: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc9e2d11f  ! 313: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad81f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0aa02b  ! 315: LDUB_I	ldub	[%r10 + 0x002b], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba993f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce42e04c  ! 318: LDSW_I	ldsw	[%r11 + 0x004c], %r7
	.word 0xd122c01f  ! 319: STF_R	st	%f8, [%r31, %r11]
	.word 0xd322801f  ! 320: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2913f  ! 321: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd122c01f  ! 323: STF_R	st	%f8, [%r31, %r11]
	.word 0xc242a004  ! 324: LDSW_I	ldsw	[%r10 + 0x0004], %r1
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad87f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcadaa030  ! 328: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r5
	.word 0xcfba981f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba997f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca92915f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r5
	.word 0xc9f2901f  ! 333: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc442c01f  ! 334: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xcf9aa070  ! 335: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc302e05c  ! 336: LDF_I	ld	[%r11, 0x005c], %f1
	.word 0xc692a01a  ! 337: LDUHA_I	lduha	[%r10, + 0x001a] %asi, %r3
	.word 0xd3bad95f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d11f  ! 339: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad93f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad99f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad93f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc39aa078  ! 344: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xd2d2e002  ! 345: LDSHA_I	ldsha	[%r11, + 0x0002] %asi, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd9aa028  ! 346: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcd02801f  ! 348: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd1bae008  ! 350: STDFA_I	stda	%f8, [0x0008, %r11]
TH_LABEL350:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad8bf  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcfbaa058  ! 357: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xcdba987f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc302801f  ! 360: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad8bf  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102c01f  ! 362: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc842c01f  ! 363: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9ba995f  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce92d01f  ! 366: LDUHA_R	lduha	[%r11, %r31] 0x80, %r7
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad93f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad85f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc412e004  ! 371: LDUH_I	lduh	[%r11 + 0x0004], %r2
	.word 0xc9f2901f  ! 372: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc7bae060  ! 373: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xc49aa028  ! 374: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r2
	.word 0xcd02c01f  ! 375: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd292e07a  ! 376: LDUHA_I	lduha	[%r11, + 0x007a] %asi, %r9
	.word 0xd082a014  ! 377: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r8
	.word 0xcd22801f  ! 378: STF_R	st	%f6, [%r31, %r10]
	.word 0xcf9aa010  ! 379: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xcfba98bf  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba995f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502c01f  ! 382: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc522c01f  ! 383: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad8bf  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d11f  ! 389: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xd002a044  ! 390: LDUW_I	lduw	[%r10 + 0x0044], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc722c01f  ! 391: STF_R	st	%f3, [%r31, %r11]
	.word 0xcd22801f  ! 392: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1ba989f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492e060  ! 395: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc39aa010  ! 396: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcb9ae000  ! 397: LDDFA_I	ldda	[%r11, 0x0000], %f5
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba987f  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0d2a076  ! 400: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc88a903f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x81, %r4
	.word 0xd1baa048  ! 402: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xc5e2913f  ! 403: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xd01ac01f  ! 404: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd3bad8bf  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad83f  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc812801f  ! 407: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc7bad93f  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
TH_LABEL410:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd252801f  ! 411: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc4c2917f  ! 412: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r2
	.word 0xc01a801f  ! 413: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc8ca905f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r4
	.word 0xc522801f  ! 415: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc28a917f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r1
	.word 0xc902a060  ! 417: LDF_I	ld	[%r10, 0x0060], %f4
	.word 0xcfbad87f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d13f  ! 420: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbae068  ! 421: STDFA_I	stda	%f6, [0x0068, %r11]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba989f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc9ae008  ! 424: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xcacae04e  ! 425: LDSBA_I	ldsba	[%r11, + 0x004e] %asi, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba983f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1a801f  ! 427: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc3e2913f  ! 428: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc4d2a028  ! 429: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r2
	.word 0xc9bad85f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad95f  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc402a01c  ! 433: LDUW_I	lduw	[%r10 + 0x001c], %r2
	.word 0xc8caa07a  ! 434: LDSBA_I	ldsba	[%r10, + 0x007a] %asi, %r4
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bae020  ! 436: STDFA_I	stda	%f8, [0x0020, %r11]
	.word 0xd1e2d03f  ! 437: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xc2d2d05f  ! 438: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r1
	.word 0xcfba987f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc8da901f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc9f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba999f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2905f  ! 445: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd39aa078  ! 446: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xca12801f  ! 447: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc99ae040  ! 449: LDDFA_I	ldda	[%r11, 0x0040], %f4
	.word 0xcdba981f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc20ac01f  ! 452: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xcf9aa018  ! 455: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4caa05c  ! 456: LDSBA_I	ldsba	[%r10, + 0x005c] %asi, %r2
	.word 0xd102a034  ! 457: LDF_I	ld	[%r10, 0x0034], %f8
	.word 0xca5aa000  ! 458: LDX_I	ldx	[%r10 + 0x0000], %r5
	.word 0xce8ad03f  ! 459: LDUBA_R	lduba	[%r11, %r31] 0x81, %r7
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
TH_LABEL460:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc79aa078  ! 461: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xc39ae010  ! 462: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xcdf2d03f  ! 463: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad85f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4d2903f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xd3bae058  ! 467: STDFA_I	stda	%f9, [0x0058, %r11]
	.word 0xd3f2d13f  ! 468: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xce12c01f  ! 469: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xcde2901f  ! 470: CASA_I	casa	[%r10] 0x80, %r31, %r6
TH_LABEL470:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd01aa040  ! 472: LDD_I	ldd	[%r10 + 0x0040], %r8
	.word 0xcf9ae040  ! 473: LDDFA_I	ldda	[%r11, 0x0040], %f7
	.word 0xcdba99bf  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc85ac01f  ! 477: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xcbbae018  ! 478: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xcb02a014  ! 479: LDF_I	ld	[%r10, 0x0014], %f5
	.word 0xd1bad81f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc81a801f  ! 482: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd2c2d17f  ! 483: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r9
	.word 0xcfba985f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbae060  ! 485: STDFA_I	stda	%f7, [0x0060, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca42c01f  ! 486: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xd08a915f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xc3ba997f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 489: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcb9ae028  ! 490: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad9bf  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc9baa058  ! 494: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc84a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xd00a801f  ! 498: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcc4a801f  ! 499: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc7e2d13f  ! 500: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc442a048  ! 501: LDSW_I	ldsw	[%r10 + 0x0048], %r2
	.word 0xc28ad07f  ! 502: LDUBA_R	lduba	[%r11, %r31] 0x83, %r1
	.word 0xd08a907f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
	.word 0xc852c01f  ! 504: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc5e2911f  ! 505: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd082d05f  ! 506: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r8
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba981f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc89aa038  ! 510: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba997f  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba989f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2911f  ! 516: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd122801f  ! 517: STF_R	st	%f8, [%r31, %r10]
	.word 0xc5bad97f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2dad03f  ! 521: LDXA_R	ldxa	[%r11, %r31] 0x81, %r9
	.word 0xc4dae068  ! 522: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r2
	.word 0xcbe2901f  ! 523: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba98bf  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
TH_LABEL525:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba999f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc702801f  ! 527: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfba981f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20ac01f  ! 529: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xd1bad91f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL530:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc852e05c  ! 531: LDSH_I	ldsh	[%r11 + 0x005c], %r4
	.word 0xd1f2d13f  ! 532: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xc99aa058  ! 533: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xc9ba991f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc212c01f  ! 536: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xcbe2911f  ! 537: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xd302e05c  ! 538: LDF_I	ld	[%r11, 0x005c], %f9
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2911f  ! 541: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba981f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5bae000  ! 544: STDFA_I	stda	%f2, [0x0000, %r11]
	.word 0xc7ba987f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd19aa030  ! 546: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xcc02801f  ! 547: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xd1bad81f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc44ac01f  ! 550: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2d11f  ! 551: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad91f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce8aa015  ! 556: LDUBA_I	lduba	[%r10, + 0x0015] %asi, %r7
	.word 0xc7ba993f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xd252e026  ! 559: LDSH_I	ldsh	[%r11 + 0x0026], %r9
	.word 0xd092901f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba983f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 562: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc68ad15f  ! 564: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r3
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba993f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb9aa070  ! 567: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc65a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba981f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba999f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcacaa05d  ! 572: LDSBA_I	ldsba	[%r10, + 0x005d] %asi, %r5
	.word 0xca42e050  ! 573: LDSW_I	ldsw	[%r11 + 0x0050], %r5
	.word 0xc7ba981f  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79ae060  ! 575: LDDFA_I	ldda	[%r11, 0x0060], %f3
TH_LABEL575:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39aa038  ! 576: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xd1ba981f  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 578: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba995f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8ae049  ! 583: LDUBA_I	lduba	[%r11, + 0x0049] %asi, %r6
	.word 0xcf9aa068  ! 584: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xd102801f  ! 585: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd282e020  ! 587: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r9
	.word 0xd3ba991f  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 590: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba997f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba989f  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd092913f  ! 595: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf02a038  ! 596: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba999f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcb9ae000  ! 600: LDDFA_I	ldda	[%r11, 0x0000], %f5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc64ae047  ! 601: LDSB_I	ldsb	[%r11 + 0x0047], %r3
	.word 0xc85ac01f  ! 602: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2da911f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x88, %r1
TH_LABEL605:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba997f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd002e018  ! 607: LDUW_I	lduw	[%r11 + 0x0018], %r8
	.word 0xd1ba98bf  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba999f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9ae000  ! 614: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xd25a801f  ! 615: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb9aa058  ! 616: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xc6da907f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba985f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc902a004  ! 620: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba99bf  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2901f  ! 625: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
TH_LABEL625:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2903f  ! 626: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba99bf  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd102c01f  ! 630: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce82913f  ! 631: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r7
	.word 0xd0ca917f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xd1ba981f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92d05f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x82, %r5
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad87f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2d03f  ! 641: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad8bf  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 647: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc692e006  ! 648: LDUHA_I	lduha	[%r11, + 0x0006] %asi, %r3
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca82a07c  ! 650: LDUWA_I	lduwa	[%r10, + 0x007c] %asi, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2903f  ! 651: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba991f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xccdaa048  ! 655: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba987f  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd04ac01f  ! 660: LDSB_R	ldsb	[%r11 + %r31], %r8
TH_LABEL660:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc402c01f  ! 662: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc2c2905f  ! 663: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad9bf  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc82e01c  ! 666: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r6
	.word 0xcdbaa010  ! 667: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xcdbad83f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcac2d11f  ! 670: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc39aa018  ! 671: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd002801f  ! 674: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d11f  ! 677: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad81f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc1ac01f  ! 679: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc81a801f  ! 681: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc7f2d13f  ! 682: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad85f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc81ae058  ! 684: LDD_I	ldd	[%r11 + 0x0058], %r4
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd292e048  ! 686: LDUHA_I	lduha	[%r11, + 0x0048] %asi, %r9
	.word 0xcf22c01f  ! 687: STF_R	st	%f7, [%r31, %r11]
	.word 0xcc12e02c  ! 688: LDUH_I	lduh	[%r11 + 0x002c], %r6
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba983f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9bae028  ! 692: STDFA_I	stda	%f4, [0x0028, %r11]
	.word 0xccdae050  ! 693: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xc3ba981f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd322801f  ! 696: STF_R	st	%f9, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd19ae050  ! 698: LDDFA_I	ldda	[%r11, 0x0050], %f8
	.word 0xc7bad85f  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcd02801f  ! 700: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad93f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcacae05d  ! 703: LDSBA_I	ldsba	[%r11, + 0x005d] %asi, %r5
	.word 0xd3bae000  ! 704: STDFA_I	stda	%f9, [0x0000, %r11]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc802a010  ! 706: LDUW_I	lduw	[%r10 + 0x0010], %r4
	.word 0xc59ae018  ! 707: LDDFA_I	ldda	[%r11, 0x0018], %f2
	.word 0xd2c2d11f  ! 708: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r9
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd08a915f  ! 710: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xca12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc52a048  ! 716: LDSH_I	ldsh	[%r10 + 0x0048], %r6
	.word 0xc59ae048  ! 717: LDDFA_I	ldda	[%r11, 0x0048], %f2
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd28ad01f  ! 720: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc24aa048  ! 722: LDSB_I	ldsb	[%r10 + 0x0048], %r1
	.word 0xcbf2d01f  ! 723: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad8bf  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 728: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcd02a018  ! 729: LDF_I	ld	[%r10, 0x0018], %f6
	.word 0xc922801f  ! 730: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba981f  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xced2901f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xc5ba995f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba989f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6dae048  ! 737: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r3
	.word 0xc9e2d11f  ! 738: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad8bf  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d11f  ! 742: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad8bf  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xccda901f  ! 744: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xd3bad99f  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2d01f  ! 746: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc452a078  ! 748: LDSH_I	ldsh	[%r10 + 0x0078], %r2
	.word 0xcdbad99f  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d13f  ! 750: CASA_I	casa	[%r11] 0x89, %r31, %r6
TH_LABEL750:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcde2d01f  ! 751: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xd3bae030  ! 754: STDFA_I	stda	%f9, [0x0030, %r11]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad81f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 758: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad99f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad93f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbae028  ! 765: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba993f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2911f  ! 768: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2911f  ! 769: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba995f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd19aa058  ! 772: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xc5ba981f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd1bae058  ! 774: STDFA_I	stda	%f8, [0x0058, %r11]
	.word 0xcbba98bf  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2d2905f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r9
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba991f  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2d2a04c  ! 781: LDSHA_I	ldsha	[%r10, + 0x004c] %asi, %r9
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd00a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc322801f  ! 785: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf22c01f  ! 786: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba991f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xd052801f  ! 789: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad95f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc85a801f  ! 793: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd0c2a01c  ! 794: LDSWA_I	ldswa	[%r10, + 0x001c] %asi, %r8
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc1aa068  ! 796: LDD_I	ldd	[%r10 + 0x0068], %r6
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb22801f  ! 798: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3bad87f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd2da913f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x89, %r9
	.word 0xcfba991f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd012a07e  ! 805: LDUH_I	lduh	[%r10 + 0x007e], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba981f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc88aa039  ! 807: LDUBA_I	lduba	[%r10, + 0x0039] %asi, %r4
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc40a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd3ba987f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2903f  ! 811: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xcc1a801f  ! 812: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc602a074  ! 813: LDUW_I	lduw	[%r10 + 0x0074], %r3
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xce42c01f  ! 817: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd282a034  ! 818: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r9
	.word 0xc5f2d01f  ! 819: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc292905f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba985f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd39aa038  ! 826: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc922801f  ! 827: STF_R	st	%f4, [%r31, %r10]
	.word 0xc7ba981f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc92e042  ! 829: LDUHA_I	lduha	[%r11, + 0x0042] %asi, %r6
	.word 0xc302e050  ! 830: LDF_I	ld	[%r11, 0x0050], %f1
TH_LABEL830:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba981f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 832: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba993f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2903f  ! 836: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xd052801f  ! 837: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd09aa020  ! 838: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xc79aa058  ! 839: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc302a000  ! 840: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2903f  ! 841: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xd01ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc9e2903f  ! 843: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc902a050  ! 844: LDF_I	ld	[%r10, 0x0050], %f4
	.word 0xca0ae038  ! 845: LDUB_I	ldub	[%r11 + 0x0038], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba999f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd22801f  ! 851: STF_R	st	%f6, [%r31, %r10]
	.word 0xc9baa040  ! 852: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba981f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba989f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc39aa078  ! 857: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba999f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc212801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd1baa028  ! 864: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xd08a907f  ! 865: LDUBA_R	lduba	[%r10, %r31] 0x83, %r8
TH_LABEL865:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xced2905f  ! 866: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r7
	.word 0xd202801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba989f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd2da915f  ! 872: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xcd02801f  ! 873: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcd02a04c  ! 875: LDF_I	ld	[%r10, 0x004c], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc52a022  ! 876: LDSH_I	ldsh	[%r10 + 0x0022], %r6
	.word 0xc3bad85f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc2d2d17f  ! 879: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r1
	.word 0xc7ba99bf  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc80a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc702e044  ! 882: LDF_I	ld	[%r11, 0x0044], %f3
	.word 0xc28ad13f  ! 883: LDUBA_R	lduba	[%r11, %r31] 0x89, %r1
	.word 0xc8d2d05f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r4
	.word 0xd3e2d11f  ! 885: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad95f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcc4aa017  ! 888: LDSB_I	ldsb	[%r10 + 0x0017], %r6
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc81aa008  ! 892: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xd3ba981f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd05aa060  ! 894: LDX_I	ldx	[%r10 + 0x0060], %r8
	.word 0xd302e008  ! 895: LDF_I	ld	[%r11, 0x0008], %f9
TH_LABEL895:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0c2915f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xc502801f  ! 897: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcff2901f  ! 898: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba989f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc602c01f  ! 903: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc522801f  ! 905: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc8a915f  ! 906: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r6
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xcadae058  ! 908: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r5
	.word 0xcde2d01f  ! 909: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad8bf  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad93f  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc412a042  ! 912: LDUH_I	lduh	[%r10 + 0x0042], %r2
	.word 0xd1f2d11f  ! 913: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad87f  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc492d11f  ! 915: LDUHA_R	lduha	[%r11, %r31] 0x88, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2d01f  ! 916: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc4daa058  ! 917: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r2
	.word 0xc7bad9bf  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc9baa018  ! 920: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc82e07c  ! 921: LDUWA_I	lduwa	[%r11, + 0x007c] %asi, %r6
	.word 0xc902a06c  ! 922: LDF_I	ld	[%r10, 0x006c], %f4
	.word 0xc3ba999f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba983f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc40a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2911f  ! 927: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd242c01f  ! 929: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc7ba999f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc412801f  ! 931: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc7bad81f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad8bf  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7baa060  ! 935: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba999f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc85ac01f  ! 938: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xc722801f  ! 939: STF_R	st	%f3, [%r31, %r10]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad83f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc2ca901f  ! 942: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r1
	.word 0xd1f2d01f  ! 943: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad81f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0da911f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xc9ba983f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba997f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 954: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc682a000  ! 956: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r3
	.word 0xcfba991f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcecae029  ! 959: LDSBA_I	ldsba	[%r11, + 0x0029] %asi, %r7
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcd02a06c  ! 963: LDF_I	ld	[%r10, 0x006c], %f6
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2911f  ! 965: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba995f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd9aa070  ! 968: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xce52e000  ! 969: LDSH_I	ldsh	[%r11 + 0x0000], %r7
	.word 0xd1ba991f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba989f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcfbaa068  ! 972: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xd0d2a01a  ! 973: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r8
	.word 0xd1ba981f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2903f  ! 976: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xcb02a008  ! 977: LDF_I	ld	[%r10, 0x0008], %f5
	.word 0xcc52801f  ! 978: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc5ba999f  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba989f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca82a034  ! 986: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r5
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc902a030  ! 988: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xc452a046  ! 989: LDSH_I	ldsh	[%r10 + 0x0046], %r2
	.word 0xc4dae010  ! 990: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcff2913f  ! 991: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc8c2907f  ! 992: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r4
	.word 0xd3bad95f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0c2a000  ! 994: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r8
	.word 0xcecad11f  ! 995: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba981f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922801f  ! 997: STF_R	st	%f4, [%r31, %r10]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d03f  ! 999: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad91f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xcc92a01a  ! 1: LDUHA_I	lduha	[%r10, + 0x001a] %asi, %r6
	.word 0xcdf2a01f  ! 2: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 3: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc682a054  ! 4: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r3
	.word 0xc7ba983f  ! 5: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc60a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xcad2905f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xd25ac01f  ! 8: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd3bad91f  ! 9: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1bae060  ! 10: STDFA_I	stda	%f8, [0x0060, %r11]
TH_LABEL10:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad99f  ! 11: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 12: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 13: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad81f  ! 15: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc2ca907f  ! 16: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xc652a06e  ! 17: LDSH_I	ldsh	[%r10 + 0x006e], %r3
	.word 0xc5baa070  ! 18: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xc5ba995f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba999f  ! 21: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 22: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6d2a012  ! 23: LDSHA_I	ldsha	[%r10, + 0x0012] %asi, %r3
	.word 0xc7ba98bf  ! 24: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc99aa020  ! 25: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 26: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba983f  ! 27: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcbbae030  ! 28: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xc20ac01f  ! 29: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xc3e2d11f  ! 30: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad9bf  ! 31: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 32: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xcc82e020  ! 33: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r6
	.word 0xcdf2e01f  ! 34: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdf2e01f  ! 35: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad83f  ! 36: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc282903f  ! 37: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r1
	.word 0xc3f2a01f  ! 38: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xca42a038  ! 39: LDSW_I	ldsw	[%r10 + 0x0038], %r5
	.word 0xc83aa038  ! 40: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba993f  ! 41: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc502c01f  ! 42: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc6da907f  ! 43: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc7ba99bf  ! 44: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 45: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba981f  ! 46: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc702a01c  ! 47: LDF_I	ld	[%r10, 0x001c], %f3
	.word 0xccc2911f  ! 48: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xc45a801f  ! 49: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5ba98bf  ! 50: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2a01f  ! 51: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa030  ! 52: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xc68aa032  ! 53: LDUBA_I	lduba	[%r10, + 0x0032] %asi, %r3
	.word 0xc8dae058  ! 54: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r4
	.word 0xc9bad89f  ! 55: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad85f  ! 56: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 59: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xd052a078  ! 60: LDSH_I	ldsh	[%r10 + 0x0078], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2901f  ! 61: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba98bf  ! 62: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 63: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc452801f  ! 64: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc482a068  ! 65: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc41aa000  ! 66: LDD_I	ldd	[%r10 + 0x0000], %r2
	.word 0xcd02a024  ! 67: LDF_I	ld	[%r10, 0x0024], %f6
	.word 0xc3baa068  ! 68: STDFA_I	stda	%f1, [0x0068, %r10]
	.word 0xc3ba997f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc09aa020  ! 70: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r0
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba981f  ! 71: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc522801f  ! 72: STF_R	st	%f2, [%r31, %r10]
	.word 0xc802a01c  ! 73: LDUW_I	lduw	[%r10 + 0x001c], %r4
	.word 0xc902a07c  ! 74: LDF_I	ld	[%r10, 0x007c], %f4
	.word 0xcb02801f  ! 75: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba981f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 77: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 78: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa078  ! 79: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbba987f  ! 80: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd012801f  ! 81: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd1e2a01f  ! 82: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc79aa050  ! 83: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xc43aa050  ! 84: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc7f2911f  ! 85: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba981f  ! 86: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 87: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 88: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 89: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 90: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc602801f  ! 91: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc80a801f  ! 92: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc83aa050  ! 93: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc492d01f  ! 94: LDUHA_R	lduha	[%r11, %r31] 0x80, %r2
	.word 0xc7bae018  ! 95: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad81f  ! 96: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd08aa069  ! 97: LDUBA_I	lduba	[%r10, + 0x0069] %asi, %r8
	.word 0xc6ca903f  ! 98: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r3
	.word 0xc43aa068  ! 99: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc812a014  ! 100: LDUH_I	lduh	[%r10 + 0x0014], %r4
TH_LABEL100:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd102e01c  ! 101: LDF_I	ld	[%r11, 0x001c], %f8
	.word 0xd002c01f  ! 102: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcb9aa010  ! 103: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xc922801f  ! 104: STF_R	st	%f4, [%r31, %r10]
	.word 0xc902801f  ! 105: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02c01f  ! 106: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcb02e06c  ! 107: LDF_I	ld	[%r11, 0x006c], %f5
	.word 0xcbbad83f  ! 108: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 109: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xccd2901f  ! 110: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba995f  ! 111: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 112: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 113: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba995f  ! 114: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca4ae076  ! 115: LDSB_I	ldsb	[%r11 + 0x0076], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad85f  ! 116: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 117: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 118: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad87f  ! 119: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad93f  ! 121: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd012c01f  ! 122: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xc60ac01f  ! 123: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 124: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc452801f  ! 125: LDSH_R	ldsh	[%r10 + %r31], %r2
TH_LABEL125:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba999f  ! 126: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 127: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xce5ae040  ! 128: LDX_I	ldx	[%r11 + 0x0040], %r7
	.word 0xc502a034  ! 129: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xd28a917f  ! 130: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2913f  ! 131: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba991f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 133: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 134: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xce8aa060  ! 135: LDUBA_I	lduba	[%r10, + 0x0060] %asi, %r7
TH_LABEL135:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba993f  ! 136: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 137: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcf02c01f  ! 138: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcfe2d13f  ! 139: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcff2d01f  ! 140: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad87f  ! 141: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae060  ! 142: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xcfbad91f  ! 143: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 144: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 145: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02a038  ! 146: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xcb02a008  ! 147: LDF_I	ld	[%r10, 0x0008], %f5
	.word 0xcbba995f  ! 148: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcadae008  ! 149: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r5
	.word 0xcbe2e01f  ! 150: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad93f  ! 151: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82e038  ! 152: LDUWA_I	lduwa	[%r11, + 0x0038] %asi, %r6
	.word 0xd0c2913f  ! 153: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xcc1aa038  ! 154: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xce82d13f  ! 155: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae038  ! 156: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d11f  ! 157: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad81f  ! 158: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 159: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ac01f  ! 160: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc49aa050  ! 161: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xc43aa050  ! 162: STD_I	std	%r2, [%r10 + 0x0050]
	.word 0xc28a917f  ! 163: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r1
	.word 0xd102a078  ! 164: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xd03a801f  ! 165: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba981f  ! 166: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492903f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x81, %r2
	.word 0xc652801f  ! 168: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc4caa02b  ! 169: LDSBA_I	ldsba	[%r10, + 0x002b] %asi, %r2
	.word 0xc5ba989f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL170:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba981f  ! 171: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 172: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc5a801f  ! 173: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcdba985f  ! 174: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc2c2a06c  ! 175: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba989f  ! 176: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 177: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc8d2e040  ! 178: LDSHA_I	ldsha	[%r11, + 0x0040] %asi, %r4
	.word 0xcc8a913f  ! 179: LDUBA_R	lduba	[%r10, %r31] 0x89, %r6
	.word 0xc9baa018  ! 180: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2903f  ! 181: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcf22801f  ! 182: STF_R	st	%f7, [%r31, %r10]
	.word 0xd122c01f  ! 183: STF_R	st	%f8, [%r31, %r11]
	.word 0xd03ae018  ! 184: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd1f2d11f  ! 185: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbaa068  ! 186: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xcbba993f  ! 187: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd9ae028  ! 188: LDDFA_I	ldda	[%r11, 0x0028], %f6
	.word 0xca12a042  ! 189: LDUH_I	lduh	[%r10 + 0x0042], %r5
	.word 0xd2ca901f  ! 190: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2913f  ! 191: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xc802801f  ! 192: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc9ba99bf  ! 193: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce92a040  ! 194: LDUHA_I	lduha	[%r10, + 0x0040] %asi, %r7
	.word 0xce12801f  ! 195: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcff2a01f  ! 196: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa040  ! 197: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xc89aa058  ! 198: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xc9f2a01f  ! 199: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 200: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6c2a008  ! 201: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r3
	.word 0xc43a801f  ! 202: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 203: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 204: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 205: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa008  ! 206: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba981f  ! 207: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa008  ! 208: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7e2913f  ! 209: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba991f  ! 210: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7f2901f  ! 211: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc48aa003  ! 212: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r2
	.word 0xc682e00c  ! 213: LDUWA_I	lduwa	[%r11, + 0x000c] %asi, %r3
	.word 0xc7f2e01f  ! 214: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 215: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL215:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad97f  ! 216: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc612801f  ! 217: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba999f  ! 218: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 219: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc89aa010  ! 220: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba983f  ! 221: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1ac01f  ! 222: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xccd2911f  ! 223: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r6
	.word 0xcdba99bf  ! 224: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 225: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc522c01f  ! 226: STF_R	st	%f2, [%r31, %r11]
	.word 0xc812a076  ! 227: LDUH_I	lduh	[%r10 + 0x0076], %r4
	.word 0xd122c01f  ! 228: STF_R	st	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 229: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca02a074  ! 230: LDUW_I	lduw	[%r10 + 0x0074], %r5
TH_LABEL230:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba989f  ! 231: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 232: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 233: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb02c01f  ! 234: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc83ae070  ! 235: STD_I	std	%r4, [%r11 + 0x0070]
TH_LABEL235:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83ae070  ! 236: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xcbbad93f  ! 237: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 238: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 239: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbe2e01f  ! 240: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2e01f  ! 241: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd052c01f  ! 242: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd092d01f  ! 243: LDUHA_R	lduha	[%r11, %r31] 0x80, %r8
	.word 0xd1bad95f  ! 244: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd0d2915f  ! 245: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02801f  ! 246: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc3baa030  ! 247: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xc3ba995f  ! 248: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd252801f  ! 249: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc9bae078  ! 250: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2e01f  ! 251: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad91f  ! 252: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 253: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc652a010  ! 254: LDSH_I	ldsh	[%r10 + 0x0010], %r3
	.word 0xc7ba999f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb22801f  ! 256: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 257: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2a01f  ! 258: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 260: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2cae039  ! 261: LDSBA_I	ldsba	[%r11, + 0x0039] %asi, %r9
	.word 0xd3e2e01f  ! 262: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3e2d13f  ! 263: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 264: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 265: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2e01f  ! 266: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xce82d07f  ! 267: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r7
	.word 0xcc3ae038  ! 268: STD_I	std	%r6, [%r11 + 0x0038]
	.word 0xcfe2d01f  ! 269: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad87f  ! 270: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd19ae000  ! 271: LDDFA_I	ldda	[%r11, 0x0000], %f8
	.word 0xd1bad91f  ! 272: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 273: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae000  ! 274: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xcc12e05a  ! 275: LDUH_I	lduh	[%r11 + 0x005a], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad89f  ! 276: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae058  ! 277: STD_I	std	%r6, [%r11 + 0x0058]
	.word 0xcc3ac01f  ! 278: STD_R	std	%r6, [%r11 + %r31]
	.word 0xd092917f  ! 279: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xd1f2a01f  ! 280: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2903f  ! 281: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba99bf  ! 282: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa058  ! 283: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc452a004  ! 284: LDSH_I	ldsh	[%r10 + 0x0004], %r2
	.word 0xc60ae043  ! 285: LDUB_I	ldub	[%r11 + 0x0043], %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43ac01f  ! 286: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc8d2907f  ! 287: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r4
	.word 0xc9ba98bf  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd322c01f  ! 289: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 290: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xceda905f  ! 291: LDXA_R	ldxa	[%r10, %r31] 0x82, %r7
	.word 0xc642801f  ! 292: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc902801f  ! 293: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9ba993f  ! 294: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbaa058  ! 295: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc49ae018  ! 296: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r2
	.word 0xc5bad99f  ! 297: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 298: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcbbaa078  ! 299: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xcbba981f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 301: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc83aa078  ! 302: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcaca901f  ! 303: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xcbe2903f  ! 304: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2911f  ! 305: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01a801f  ! 306: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc84ac01f  ! 307: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xc83ac01f  ! 308: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad8bf  ! 309: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 310: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad85f  ! 311: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2d01f  ! 312: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d01f  ! 313: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad83f  ! 314: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80aa040  ! 315: LDUB_I	ldub	[%r10 + 0x0040], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba991f  ! 316: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 317: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc242a040  ! 318: LDSW_I	ldsw	[%r10 + 0x0040], %r1
	.word 0xc522801f  ! 319: STF_R	st	%f2, [%r31, %r10]
	.word 0xd322801f  ! 320: STF_R	st	%f9, [%r31, %r10]
TH_LABEL320:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2901f  ! 321: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 322: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd122c01f  ! 323: STF_R	st	%f8, [%r31, %r11]
	.word 0xc842e04c  ! 324: LDSW_I	ldsw	[%r11 + 0x004c], %r4
	.word 0xc83ac01f  ! 325: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad93f  ! 326: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 327: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcedaa030  ! 328: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r7
	.word 0xcfba999f  ! 329: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa030  ! 330: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba989f  ! 331: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc892907f  ! 332: LDUHA_R	lduha	[%r10, %r31] 0x83, %r4
	.word 0xc9f2901f  ! 333: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc842c01f  ! 334: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc79aa058  ! 335: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc502a074  ! 336: LDF_I	ld	[%r10, 0x0074], %f2
	.word 0xd292e024  ! 337: LDUHA_I	lduha	[%r11, + 0x0024] %asi, %r9
	.word 0xd3bad81f  ! 338: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 339: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad81f  ! 340: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad85f  ! 341: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 342: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad93f  ! 343: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcd9ae008  ! 344: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xc4d2a030  ! 345: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc39ae008  ! 346: LDDFA_I	ldda	[%r11, 0x0008], %f1
	.word 0xc3f2e01f  ! 347: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcf02801f  ! 348: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcc3a801f  ! 349: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc7bae078  ! 350: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ac01f  ! 351: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7f2e01f  ! 352: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 353: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 354: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 355: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2e01f  ! 356: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcdbaa048  ! 357: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xcdba989f  ! 358: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 359: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc902c01f  ! 360: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad95f  ! 361: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02801f  ! 362: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc842801f  ! 363: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9ba999f  ! 364: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 365: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc892d07f  ! 366: LDUHA_R	lduha	[%r11, %r31] 0x83, %r4
	.word 0xc9f2e01f  ! 367: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc9bad81f  ! 368: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 369: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad81f  ! 370: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc812a00a  ! 371: LDUH_I	lduh	[%r10 + 0x000a], %r4
	.word 0xc9f2911f  ! 372: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9bae058  ! 373: STDFA_I	stda	%f4, [0x0058, %r11]
	.word 0xc89aa058  ! 374: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xc502801f  ! 375: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc292e052  ! 376: LDUHA_I	lduha	[%r11, + 0x0052] %asi, %r1
	.word 0xc482a068  ! 377: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r2
	.word 0xd322801f  ! 378: STF_R	st	%f9, [%r31, %r10]
	.word 0xcf9aa060  ! 379: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xcfba997f  ! 380: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba993f  ! 381: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902801f  ! 382: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc522c01f  ! 383: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 384: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 385: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5e2e01f  ! 386: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad83f  ! 387: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ae060  ! 388: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc5f2d03f  ! 389: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xca02e004  ! 390: LDUW_I	lduw	[%r11 + 0x0004], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf22801f  ! 391: STF_R	st	%f7, [%r31, %r10]
	.word 0xd122801f  ! 392: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 393: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 394: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc892a02a  ! 395: LDUHA_I	lduha	[%r10, + 0x002a] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc79aa008  ! 396: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xc39aa050  ! 397: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xc3f2a01f  ! 398: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba98bf  ! 399: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xced2e036  ! 400: LDSHA_I	ldsha	[%r11, + 0x0036] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd28ad07f  ! 401: LDUBA_R	lduba	[%r11, %r31] 0x83, %r9
	.word 0xc5baa040  ! 402: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xc5e2901f  ! 403: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd01ac01f  ! 404: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd3bad89f  ! 405: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL405:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad8bf  ! 406: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc612c01f  ! 407: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc7bad8bf  ! 408: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ac01f  ! 410: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca52801f  ! 411: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xccc2d01f  ! 412: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r6
	.word 0xcc1a801f  ! 413: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd2ca915f  ! 414: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xd322c01f  ! 415: STF_R	st	%f9, [%r31, %r11]
TH_LABEL415:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc8a901f  ! 416: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xcf02e010  ! 417: LDF_I	ld	[%r11, 0x0010], %f7
	.word 0xcfbad91f  ! 418: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2d13f  ! 420: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9baa050  ! 421: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xc83aa050  ! 422: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba995f  ! 423: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc89ae060  ! 424: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r4
	.word 0xc2caa00f  ! 425: LDSBA_I	ldsba	[%r10, + 0x000f] %asi, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba993f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc01a801f  ! 427: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc3e2913f  ! 428: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc8d2e068  ! 429: LDSHA_I	ldsha	[%r11, + 0x0068] %asi, %r4
	.word 0xc9bad99f  ! 430: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 431: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad87f  ! 432: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc202a01c  ! 433: LDUW_I	lduw	[%r10 + 0x001c], %r1
	.word 0xd0caa034  ! 434: LDSBA_I	ldsba	[%r10, + 0x0034] %asi, %r8
	.word 0xd03a801f  ! 435: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bae048  ! 436: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xd1e2d13f  ! 437: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xced2901f  ! 438: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xcfba991f  ! 439: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 440: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL440:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2a01f  ! 441: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc8da901f  ! 442: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc9f2913f  ! 443: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba995f  ! 444: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2d01f  ! 445: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae070  ! 446: LDDFA_I	ldda	[%r11, 0x0070], %f1
	.word 0xc412c01f  ! 447: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc43ac01f  ! 448: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcd9aa010  ! 449: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xcdba997f  ! 450: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd00a801f  ! 452: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd03a801f  ! 453: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1f2913f  ! 454: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd39aa058  ! 455: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcccae02d  ! 456: LDSBA_I	ldsba	[%r11, + 0x002d] %asi, %r6
	.word 0xcf02e02c  ! 457: LDF_I	ld	[%r11, 0x002c], %f7
	.word 0xd25aa010  ! 458: LDX_I	ldx	[%r10 + 0x0010], %r9
	.word 0xca8a913f  ! 459: LDUBA_R	lduba	[%r10, %r31] 0x89, %r5
	.word 0xc83aa010  ! 460: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd9aa030  ! 461: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xcd9ae060  ! 462: LDDFA_I	ldda	[%r11, 0x0060], %f6
	.word 0xcdf2d01f  ! 463: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad81f  ! 464: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae060  ! 465: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2d2903f  ! 466: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xd3bae008  ! 467: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xd3f2d03f  ! 468: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xcc12801f  ! 469: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcde2903f  ! 470: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 471: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd01aa000  ! 472: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xcd9aa038  ! 473: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xcdba985f  ! 474: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 475: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3aa038  ! 476: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xca5a801f  ! 477: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcdbaa038  ! 478: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xd102e058  ! 479: LDF_I	ld	[%r11, 0x0058], %f8
	.word 0xd1bad87f  ! 480: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ae058  ! 481: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xc41ac01f  ! 482: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xcec2901f  ! 483: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xcfba993f  ! 484: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5baa040  ! 485: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842801f  ! 486: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc28a917f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r1
	.word 0xc3ba981f  ! 488: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 489: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xcd9ae000  ! 490: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad83f  ! 491: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcbbae008  ! 494: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xc44a801f  ! 495: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2a01f  ! 496: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa008  ! 497: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xce0ac01f  ! 498: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc64ac01f  ! 499: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc7e2d01f  ! 500: CASA_I	casa	[%r11] 0x80, %r31, %r3
TH_LABEL500:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd042a01c  ! 501: LDSW_I	ldsw	[%r10 + 0x001c], %r8
	.word 0xc48a903f  ! 502: LDUBA_R	lduba	[%r10, %r31] 0x81, %r2
	.word 0xc68a901f  ! 503: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc452801f  ! 504: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5e2911f  ! 505: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce82917f  ! 506: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r7
	.word 0xcc3aa018  ! 507: STD_I	std	%r6, [%r10 + 0x0018]
	.word 0xcfba997f  ! 508: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 509: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc9aa070  ! 510: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba98bf  ! 511: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 512: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 513: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 514: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 515: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2903f  ! 516: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc522c01f  ! 517: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 518: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 519: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 520: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcada903f  ! 521: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xcadaa008  ! 522: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r5
	.word 0xcbe2911f  ! 523: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba993f  ! 524: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba983f  ! 526: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02801f  ! 527: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba999f  ! 528: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd00ac01f  ! 529: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1bad95f  ! 530: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd052e00a  ! 531: LDSH_I	ldsh	[%r11 + 0x000a], %r8
	.word 0xd1f2d11f  ! 532: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xc99aa078  ! 533: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xc9ba98bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca12801f  ! 536: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcbe2913f  ! 537: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xc902a050  ! 538: LDF_I	ld	[%r10, 0x0050], %f4
	.word 0xc9e2901f  ! 539: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2a01f  ! 540: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2903f  ! 541: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc83aa050  ! 542: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc9ba987f  ! 543: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc7baa018  ! 544: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xc7ba98bf  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL545:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd9aa078  ! 546: LDDFA_I	ldda	[%r10, 0x0078], %f6
	.word 0xd002c01f  ! 547: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1bad95f  ! 548: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 549: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca4ac01f  ! 550: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbe2d03f  ! 551: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbad85f  ! 552: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 553: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 554: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2e01f  ! 555: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc68aa020  ! 556: LDUBA_I	lduba	[%r10, + 0x0020] %asi, %r3
	.word 0xc7ba985f  ! 557: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa020  ! 558: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xd252a05c  ! 559: LDSH_I	ldsh	[%r10 + 0x005c], %r9
	.word 0xc692905f  ! 560: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba98bf  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 562: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc43a801f  ! 563: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd28a903f  ! 564: LDUBA_R	lduba	[%r10, %r31] 0x81, %r9
	.word 0xd03a801f  ! 565: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL565:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba989f  ! 566: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa058  ! 567: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xd05a801f  ! 568: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd03aa058  ! 569: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1ba987f  ! 570: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba993f  ! 571: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcacaa00f  ! 572: LDSBA_I	ldsba	[%r10, + 0x000f] %asi, %r5
	.word 0xc642a07c  ! 573: LDSW_I	ldsw	[%r10 + 0x007c], %r3
	.word 0xc7ba99bf  ! 574: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc39aa040  ! 575: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd19aa040  ! 576: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xd1ba98bf  ! 577: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 578: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba997f  ! 579: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 580: CASXA_R	casxa	[%r10]%asi, %r31, %r8
TH_LABEL580:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 581: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 582: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc28aa004  ! 583: LDUBA_I	lduba	[%r10, + 0x0004] %asi, %r1
	.word 0xd19aa030  ! 584: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xcb02801f  ! 585: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 586: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd282a018  ! 587: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r9
	.word 0xd3ba99bf  ! 588: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 589: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 590: CASA_I	casa	[%r10] 0x88, %r31, %r9
TH_LABEL590:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba997f  ! 591: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 592: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa018  ! 593: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xd3ba98bf  ! 594: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc692903f  ! 595: LDUHA_R	lduha	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc302a038  ! 596: LDF_I	ld	[%r10, 0x0038], %f1
	.word 0xc3f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3f2a01f  ! 598: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba997f  ! 599: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59ae038  ! 600: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc24aa06c  ! 601: LDSB_I	ldsb	[%r10 + 0x006c], %r1
	.word 0xd05ac01f  ! 602: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xd1f2e01f  ! 603: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad8bf  ! 604: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6da901f  ! 605: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba983f  ! 606: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd002a014  ! 607: LDUW_I	lduw	[%r10 + 0x0014], %r8
	.word 0xd1ba997f  ! 608: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba985f  ! 610: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL610:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03a801f  ! 611: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 612: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 613: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc59ae020  ! 614: LDDFA_I	ldda	[%r11, 0x0020], %f2
	.word 0xca5ac01f  ! 615: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd9aa058  ! 616: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xc4da901f  ! 617: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc43aa058  ! 618: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5ba983f  ! 619: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302a02c  ! 620: LDF_I	ld	[%r10, 0x002c], %f9
TH_LABEL620:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba987f  ! 621: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 622: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba985f  ! 623: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2911f  ! 625: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2903f  ! 626: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba987f  ! 627: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 628: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa028  ! 629: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xcb02c01f  ! 630: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd082907f  ! 631: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r8
	.word 0xd0ca915f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xd1ba989f  ! 633: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc892d17f  ! 634: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r4
	.word 0xc9e2e01f  ! 635: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad97f  ! 636: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 637: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 638: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 639: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 640: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2d01f  ! 641: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2e01f  ! 642: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad8bf  ! 643: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 644: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 645: CASA_R	casa	[%r11] %asi, %r31, %r4
TH_LABEL645:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2e01f  ! 646: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 647: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xd092e064  ! 648: LDUHA_I	lduha	[%r11, + 0x0064] %asi, %r8
	.word 0xd03ac01f  ! 649: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd082a06c  ! 650: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 652: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 653: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa068  ! 654: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xcedaa050  ! 655: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3a801f  ! 656: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 657: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfe2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 659: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc84a801f  ! 660: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83a801f  ! 661: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc802801f  ! 662: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xd2c2d01f  ! 663: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xd3e2e01f  ! 664: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad93f  ! 665: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd082a018  ! 666: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r8
	.word 0xcdbae040  ! 667: STDFA_I	stda	%f6, [0x0040, %r11]
	.word 0xcdbad81f  ! 668: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 669: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc6c2913f  ! 670: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc79ae068  ! 671: LDDFA_I	ldda	[%r11, 0x0068], %f3
	.word 0xc43ac01f  ! 672: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 673: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca02c01f  ! 674: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xcbf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83ae068  ! 676: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xcbf2d11f  ! 677: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbbad81f  ! 678: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc01a801f  ! 679: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc3f2a01f  ! 680: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc41ac01f  ! 681: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc7f2d11f  ! 682: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad81f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd01ae058  ! 684: LDD_I	ldd	[%r11 + 0x0058], %r8
	.word 0xd03ae058  ! 685: STD_I	std	%r8, [%r11 + 0x0058]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc292e074  ! 686: LDUHA_I	lduha	[%r11, + 0x0074] %asi, %r1
	.word 0xcf22801f  ! 687: STF_R	st	%f7, [%r31, %r10]
	.word 0xd212a034  ! 688: LDUH_I	lduh	[%r10 + 0x0034], %r9
	.word 0xd3e2a01f  ! 689: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 690: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba997f  ! 691: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa010  ! 692: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc2daa068  ! 693: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r1
	.word 0xc3ba989f  ! 694: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 695: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc722801f  ! 696: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 697: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc79ae000  ! 698: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xc7bad8bf  ! 699: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd102c01f  ! 700: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad97f  ! 701: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 702: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd2caa062  ! 703: LDSBA_I	ldsba	[%r10, + 0x0062] %asi, %r9
	.word 0xc9baa068  ! 704: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc83a801f  ! 705: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd202e014  ! 706: LDUW_I	lduw	[%r11 + 0x0014], %r9
	.word 0xcf9ae000  ! 707: LDDFA_I	ldda	[%r11, 0x0000], %f7
	.word 0xccc2903f  ! 708: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r6
	.word 0xcdf2a01f  ! 709: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc68a901f  ! 710: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43aa000  ! 711: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43a801f  ! 712: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7e2a01f  ! 713: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xd012801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc652a066  ! 716: LDSH_I	ldsh	[%r10 + 0x0066], %r3
	.word 0xd19aa038  ! 717: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xd1e2901f  ! 718: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8a915f  ! 720: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2a01f  ! 721: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca4ae025  ! 722: LDSB_I	ldsb	[%r11 + 0x0025], %r5
	.word 0xcbf2d01f  ! 723: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 724: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 725: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2e01f  ! 726: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 728: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xd102a038  ! 729: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xcd22801f  ! 730: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba98bf  ! 731: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 732: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc4d2903f  ! 733: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xc5ba989f  ! 734: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 735: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba987f  ! 736: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc8dae040  ! 737: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r4
	.word 0xc9e2d03f  ! 738: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad85f  ! 739: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ae040  ! 740: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2e01f  ! 741: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 742: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad9bf  ! 743: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2dad01f  ! 744: LDXA_R	ldxa	[%r11, %r31] 0x80, %r9
	.word 0xd3bad9bf  ! 745: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d01f  ! 746: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 747: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcc52e04e  ! 748: LDSH_I	ldsh	[%r11 + 0x004e], %r6
	.word 0xcdbad8bf  ! 749: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 750: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2d13f  ! 751: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcde2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdf2e01f  ! 753: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xd3bae020  ! 754: STDFA_I	stda	%f9, [0x0020, %r11]
	.word 0xd3f2e01f  ! 755: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2e01f  ! 756: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad99f  ! 757: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d11f  ! 758: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad97f  ! 759: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 760: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad87f  ! 761: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 762: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 763: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 764: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc9baa010  ! 765: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba989f  ! 766: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9e2913f  ! 768: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2901f  ! 769: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 771: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc59aa008  ! 772: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xc5ba991f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcbbaa060  ! 774: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcbba991f  ! 775: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4d2903f  ! 776: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xc43a801f  ! 777: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa060  ! 778: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc5ba987f  ! 779: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 780: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6d2a046  ! 781: LDSHA_I	ldsha	[%r10, + 0x0046] %asi, %r3
	.word 0xc7f2a01f  ! 782: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 783: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc80a801f  ! 784: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc522c01f  ! 785: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc722801f  ! 786: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 787: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa040  ! 788: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc452c01f  ! 789: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc5e2e01f  ! 790: CASA_R	casa	[%r11] %asi, %r31, %r2
TH_LABEL790:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad81f  ! 791: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 792: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xce5ac01f  ! 793: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xc6c2a044  ! 794: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r3
	.word 0xc7f2901f  ! 795: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd01aa018  ! 796: LDD_I	ldd	[%r10 + 0x0018], %r8
	.word 0xd03a801f  ! 797: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd322c01f  ! 798: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 799: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 800: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL800:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xceda913f  ! 801: LDXA_R	ldxa	[%r10, %r31] 0x89, %r7
	.word 0xcfba981f  ! 802: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 803: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 804: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca12a038  ! 805: LDUH_I	lduh	[%r10 + 0x0038], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba985f  ! 806: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc48aa069  ! 807: LDUBA_I	lduba	[%r10, + 0x0069] %asi, %r2
	.word 0xc43aa068  ! 808: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xd20a801f  ! 809: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd3ba983f  ! 810: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2911f  ! 811: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc41ac01f  ! 812: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc202e008  ! 813: LDUW_I	lduw	[%r11 + 0x0008], %r1
	.word 0xc03ae008  ! 814: STD_I	std	%r0, [%r11 + 0x0008]
	.word 0xc3e2e01f  ! 815: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ac01f  ! 816: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc642801f  ! 817: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc482e044  ! 818: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r2
	.word 0xc5f2d11f  ! 819: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc43ac01f  ! 820: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2e01f  ! 821: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc492901f  ! 822: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xc43aa040  ! 823: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 824: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba989f  ! 825: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc99ae078  ! 826: LDDFA_I	ldda	[%r11, 0x0078], %f4
	.word 0xc722801f  ! 827: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 828: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce92a03a  ! 829: LDUHA_I	lduha	[%r10, + 0x003a] %asi, %r7
	.word 0xcf02a060  ! 830: LDF_I	ld	[%r10, 0x0060], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba999f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 832: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 833: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba983f  ! 834: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 835: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2913f  ! 836: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc52801f  ! 837: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc49ae050  ! 838: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r2
	.word 0xc39ae020  ! 839: LDDFA_I	ldda	[%r11, 0x0020], %f1
	.word 0xc702a04c  ! 840: LDF_I	ld	[%r10, 0x004c], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2901f  ! 841: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc81a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9e2901f  ! 843: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcd02e058  ! 844: LDF_I	ld	[%r11, 0x0058], %f6
	.word 0xc60aa013  ! 845: LDUB_I	ldub	[%r10 + 0x0013], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43a801f  ! 846: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa010  ! 847: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc7ba991f  ! 848: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 850: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc322801f  ! 851: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5baa050  ! 852: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc5e2a01f  ! 853: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba985f  ! 854: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 855: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba983f  ! 856: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc59aa020  ! 857: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xc43a801f  ! 858: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5f2a01f  ! 859: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba983f  ! 860: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce12801f  ! 861: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba995f  ! 863: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5baa008  ! 864: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xc68ad01f  ! 865: LDUBA_R	lduba	[%r11, %r31] 0x80, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8d2901f  ! 866: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xca02801f  ! 867: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcbf2a01f  ! 868: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbe2a01f  ! 869: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 870: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 871: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc8da917f  ! 872: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r4
	.word 0xc902801f  ! 873: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9e2a01f  ! 874: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc502e060  ! 875: LDF_I	ld	[%r11, 0x0060], %f2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc252e05a  ! 876: LDSH_I	ldsh	[%r11 + 0x005a], %r1
	.word 0xc3bad81f  ! 877: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 878: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc6d2903f  ! 879: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r3
	.word 0xc7ba983f  ! 880: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL880:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd20a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd302a030  ! 882: LDF_I	ld	[%r10, 0x0030], %f9
	.word 0xcc8ad05f  ! 883: LDUBA_R	lduba	[%r11, %r31] 0x82, %r6
	.word 0xd2d2d15f  ! 884: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r9
	.word 0xd3e2d13f  ! 885: CASA_I	casa	[%r11] 0x89, %r31, %r9
TH_LABEL885:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad83f  ! 886: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 887: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc44aa026  ! 888: LDSB_I	ldsb	[%r10 + 0x0026], %r2
	.word 0xc5e2a01f  ! 889: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc43aa020  ! 890: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43a801f  ! 891: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd01aa000  ! 892: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xd3ba999f  ! 893: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc65aa068  ! 894: LDX_I	ldx	[%r10 + 0x0068], %r3
	.word 0xc502a030  ! 895: LDF_I	ld	[%r10, 0x0030], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2c2905f  ! 896: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xcf02801f  ! 897: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcff2903f  ! 898: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 899: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 900: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba989f  ! 901: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 902: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc402801f  ! 903: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc5f2a01f  ! 904: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc722801f  ! 905: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc28ad17f  ! 906: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r1
	.word 0xc03ae030  ! 907: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xccdae028  ! 908: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r6
	.word 0xcde2d11f  ! 909: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad87f  ! 910: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad9bf  ! 911: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd012e040  ! 912: LDUH_I	lduh	[%r11 + 0x0040], %r8
	.word 0xd1f2d01f  ! 913: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad87f  ! 914: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc892d03f  ! 915: LDUHA_R	lduha	[%r11, %r31] 0x81, %r4
TH_LABEL915:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2d01f  ! 916: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc6dae010  ! 917: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r3
	.word 0xc7bad91f  ! 918: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 919: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcbbae038  ! 920: STDFA_I	stda	%f5, [0x0038, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc682e078  ! 921: LDUWA_I	lduwa	[%r11, + 0x0078] %asi, %r3
	.word 0xc302a030  ! 922: LDF_I	ld	[%r10, 0x0030], %f1
	.word 0xc3ba983f  ! 923: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa030  ! 924: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba989f  ! 925: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc40a801f  ! 926: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2901f  ! 927: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 928: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc642801f  ! 929: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7ba981f  ! 930: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc612c01f  ! 931: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc7bad89f  ! 932: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2e01f  ! 933: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad85f  ! 934: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd3baa000  ! 935: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa000  ! 936: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3ba987f  ! 937: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce5a801f  ! 938: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc522c01f  ! 939: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 940: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL940:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bad89f  ! 941: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd0cad01f  ! 942: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r8
	.word 0xd1f2d13f  ! 943: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad95f  ! 944: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 945: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL945:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8da905f  ! 946: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xc9ba993f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 948: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 949: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 950: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba985f  ! 951: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 952: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 953: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 954: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2a01f  ! 955: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce82a074  ! 956: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r7
	.word 0xcfba997f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa070  ! 958: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc8caa052  ! 959: LDSBA_I	ldsba	[%r10, + 0x0052] %asi, %r4
	.word 0xc83a801f  ! 960: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83aa050  ! 961: STD_I	std	%r4, [%r10 + 0x0050]
	.word 0xc83a801f  ! 962: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcb02a05c  ! 963: LDF_I	ld	[%r10, 0x005c], %f5
	.word 0xc83aa058  ! 964: STD_I	std	%r4, [%r10 + 0x0058]
	.word 0xcbf2901f  ! 965: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba991f  ! 966: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 967: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc79ae018  ! 968: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xd052a02a  ! 969: LDSH_I	ldsh	[%r10 + 0x002a], %r8
	.word 0xd1ba995f  ! 970: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 971: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1baa020  ! 972: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xd0d2a038  ! 973: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r8
	.word 0xd1ba991f  ! 974: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 975: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2911f  ! 976: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xcd02e040  ! 977: LDF_I	ld	[%r11, 0x0040], %f6
	.word 0xc452801f  ! 978: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5ba989f  ! 979: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 980: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba985f  ! 981: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 982: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 983: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa040  ! 984: STD_I	std	%r2, [%r10 + 0x0040]
	.word 0xc5f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd082e040  ! 986: LDUWA_I	lduwa	[%r11, + 0x0040] %asi, %r8
	.word 0xd03ac01f  ! 987: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcb02e02c  ! 988: LDF_I	ld	[%r11, 0x002c], %f5
	.word 0xc252a060  ! 989: LDSH_I	ldsh	[%r10 + 0x0060], %r1
	.word 0xcedaa000  ! 990: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcff2901f  ! 991: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd2c2d15f  ! 992: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r9
	.word 0xd3bad85f  ! 993: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2e048  ! 994: LDSWA_I	ldswa	[%r11, + 0x0048] %asi, %r2
	.word 0xcaca907f  ! 995: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba987f  ! 996: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322c01f  ! 997: STF_R	st	%f9, [%r31, %r11]
	.word 0xd03ae048  ! 998: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3e2d01f  ! 999: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad83f  ! 1000: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
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
.xword 0x5819dd6e52cb1aa8
.xword 0x1589033095cc581b
.xword 0xafba71c4556eeefc
.xword 0xae800f3c7da2a91f
.xword 0xf2c04e0ec473597e
.xword 0x1232a0242f139223
.xword 0xf2a4a48d91ef472c
.xword 0x5433a6a9653101bf
.xword 0x0bd57be9712e845f
.xword 0x2098c486afa1950a
.xword 0xda90bd49c337d488
.xword 0x25c36f4fd94d6cc3
.xword 0x7532e01042d019dd
.xword 0xe041e23014c7e2b2
.xword 0x188289f913ba939e
.xword 0x6414dd8f77fafcca
.xword 0xd29c8f7d26dfd3a0
.xword 0xf55f8aee97325810
.xword 0xc5ffd6a4cae2d96e
.xword 0x3c97dc8f8ca3685c
.xword 0xe9dafa487abed0f4
.xword 0xebd4fa9898f93bee
.xword 0x73c9ea8cf83ccec1
.xword 0x6f5a931ffb4a3b33
.xword 0x64ac46bfdb6f169f
.xword 0x2db771e70cec9f4b
.xword 0xa7ae3fc493839182
.xword 0x3ff2b2a2dfeda874
.xword 0x3ce7e9e50be2d78e
.xword 0x07ebd62ed1189d4a
.xword 0x354631dbbd64ce29
.xword 0xa6203386c7e106ac



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
.xword 0x1851899ccb3d6857

.xword 0x826cb9ffb4fdf196

.xword 0x2b8c59d28d7f5d5d

.xword 0x27d8e9d92c2b0c61

.xword 0x54980c89a39fc9a6

.xword 0x2ab68c314d0af619

.xword 0xb68ae987427dfb1a

.xword 0x3a3653072d5b7e91

.xword 0x12c6e2ef17c085cc

.xword 0xd50dea927c7542d4

.xword 0xfb519fd7c164ec5e

.xword 0x04b8322781b53f43

.xword 0x1d22c728535cd994

.xword 0x18f309136ad61869

.xword 0x490494f5da688385

.xword 0x630e8c458c97a256

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
.xword 0x8d80a3554ee53bbf
.xword 0x60e817fc6c4219c0
.xword 0xc221f1d2abc8d05f
.xword 0x75615c4e2bce7591
.xword 0x9f1c0530ed0b232d
.xword 0x3058b00d4e878b17
.xword 0xaf819280a3adda94
.xword 0x04e6f850cdf488b0
.xword 0x7b05e55f49a504e6




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
.xword 0x621d2e5c89b858ca
.xword 0x453749190b1dcdf2
.xword 0x50222d729623fdfd
.xword 0x041676b6ab125ff7
.xword 0x5f7b2f77e0369639
.xword 0x08ab2133e1f997df
.xword 0x40bc77a17df9d23e
.xword 0xf12de18ceaaa6c42
.xword 0xa1992d1ab95fce96




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
.xword 0x194516db3ef35c88
.xword 0x292f7bd1e2b5e3f7
.xword 0x09ae9819a4b104df
.xword 0x82b7d04836dbd193
.xword 0xec88873f529a812b
.xword 0x0a3fa1be17b65660
.xword 0xbc9b1270c23d030a
.xword 0x6cfea8b5f5cf63f3
.xword 0x43e790140db83f3f




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
.xword 0x7bfd2f33044cabf6
.xword 0x9ba3fff1ba7fc716
.xword 0xe92d2f4c544db01e
.xword 0x4021078c8376d3b2
.xword 0x8620b272eb0c8039
.xword 0x8138bda712d7951d
.xword 0x558956363a40fc3b
.xword 0xedc0996644af3ed4
.xword 0xf4842c47e4c1dc91




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
.xword 0xac2faa8349eb6a20
.xword 0x56fd665003698d47
.xword 0xdf89447b4bcc5510
.xword 0xe6e6f9667dc1e408
.xword 0x73e8cefb0bf296a7
.xword 0x48d87be24ecfa5b3
.xword 0x0c24e2c53c77597e
.xword 0xe01333c76bb75a71
.xword 0xad7a6e6d3c9d6aa9




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
.xword 0xe9f2cba7c35852a6
.xword 0x146d7d2a81f557a3
.xword 0x22b45bca123e4f4c
.xword 0xade543958e59975b
.xword 0xb6eb76586152af78
.xword 0x1b0e8225405caacd
.xword 0x7dd1ed0ec22819b8
.xword 0xdb0cd4717ccb4a40
.xword 0x6c7f34032263896c




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
.xword 0x09265b6424f3700a
.xword 0xee67b93291309de7
.xword 0x758675b1aff8ae61
.xword 0xe2d08c8b16565a7a
.xword 0xebcaa73533f28764
.xword 0x7016993677ec6687
.xword 0xa7b55835df20ea39
.xword 0x92ae84e3de5c5a66
.xword 0x009d8c5c4435aa55






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
.xword 0x4629065c8a8a7df2

.xword 0xd0d0cbca4198e2b2

.xword 0xf308d7b80ab3ea44

.xword 0x3d4aac3a71f3cf79

.xword 0xb18a10f5c12ebe9e

.xword 0x4397782c46de90ba

.xword 0x6fba10eedaf63794

.xword 0x99654552dc3906a9

.xword 0x7f63004c667105ae

.xword 0x651cc9cce2b2715a

.xword 0xf6cb4b4c2f5dd94d

.xword 0xa8d474ba97567688

.xword 0xb75bef428871f599

.xword 0x74264b75e5a85a1f

.xword 0xea2362f94270cb44

.xword 0x878c1aea231a3d4e




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
.xword 0xa0482b9d99f8b58e
.xword 0x882c7a61ca568fcf
.xword 0x5ae03241f5b8025d
.xword 0x2ea0fe873b2a7f0f
.xword 0xdb1e9d36055c9aa1
.xword 0x38755243cf4741f6
.xword 0xdadb218ff9793e86
.xword 0xde86a9564a2555c4



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
.xword 0x143586fbe742be39
.xword 0x0be971bd27d54d99
.xword 0xab4409746629b30f
.xword 0x5f2a26104ef8e82d
.xword 0xba112788a2bd56c4
.xword 0x7008ff87fedcac24
.xword 0x0f550bcca45b4d0a
.xword 0x29a56a82fc358ce2



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
.xword 0x1f45ec1742a147a0
.xword 0xef81f454202d2b81
.xword 0x6a979371795263fa
.xword 0x52120b4100b31102
.xword 0xa9749278844e3288
.xword 0xc047bbb41a102208
.xword 0x0ea12f7a8624d64c
.xword 0x31da436bf54f2d2a



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
.xword 0x7a6f8536b304d1cb
.xword 0x665865abc3cc9405
.xword 0x6791e5cb2771f2db
.xword 0xec9c85a1daff50a5
.xword 0xe105c4e6f10658e6
.xword 0x857f83fd4cf8fa55
.xword 0x345039d8326ae464
.xword 0x960328e95b2298d4



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
.xword 0x9a7e2cc234c6bdfe
.xword 0x0a47f97d8c7cdd94
.xword 0xe1c100d10148f8c8
.xword 0xe39e54deb0507abf
.xword 0x80bc9b0c566b9e53
.xword 0x005cd175e035510c
.xword 0x207d8ee65a5d3b48
.xword 0xca852a9614cdf558



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
.xword 0x65d3318d2cd03f70
.xword 0x3eb7e76fb1ea9af4
.xword 0x87a2a22ac977413c
.xword 0x5f7ed4258ff5b845
.xword 0xbdb77ece1026b634
.xword 0x7960625fa28cc3de
.xword 0x6cc0cfd5fdc596e9
.xword 0xf246bf9021a06647



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
.xword 0xc780b2e7aecd0d46
.xword 0x3dbe5ad0c21387f9
.xword 0x4f682b4ee860567d
.xword 0x5e3e7ac2a534dea5
.xword 0xdc68aeb8f794f7dd
.xword 0x7d4ab273a844dbc0
.xword 0xf10074eec1012b71
.xword 0xf903046338230d3d





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
.xword 0xd817c89a4307693f

.xword 0x275d9824a5d2d459

.xword 0xd46613de33fa42e5

.xword 0x4db667d084e3c3b0

.xword 0x8859fd181034b4e1

.xword 0x3fca77c977c5dfbb

.xword 0x904f47ac054fb976

.xword 0x0bbc21b2db9a82cb

.xword 0x7eaaf5f23bc7e7c4

.xword 0x3cc3a40d7d32265c

.xword 0x01e47354f3f7e8a3

.xword 0x25e0e5acd9d73fc7

.xword 0xd13a12412cc57660

.xword 0x38fdc75c65ed6774

.xword 0x1859554f2523d3c3

.xword 0x8b6a5616d41de58f

.xword 0x6b3abc15f1c043b3

.xword 0x88802422b163ca81

.xword 0x5b2dfffde69f2e02

.xword 0xc9ff0e61943c04c9

.xword 0xe8b69ca06359933e

.xword 0xabbfd27bf74df362

.xword 0xf3c7a25ff1d58797

.xword 0x11fa8ae8713f2862

.xword 0x409b16ba43c40929

.xword 0x907fc36652bc892c

.xword 0xd538358f45941fa0

.xword 0x1e90e1ae9c351825

.xword 0x05d4e354acc4e04e

.xword 0x6533fd9c1b0e4d88

.xword 0x7fd7d1dcfa876abb

.xword 0x84c47c1407df147a

.xword 0x22bf75c6d0ae3c1f

.xword 0x5fe40bc6e1ecd65c

.xword 0x16fa09264113ea81

.xword 0x6c5b6500eec899ff

.xword 0xc24d54017f8a036b

.xword 0xc09eb5d97e2287b7

.xword 0x8d88116a86dd9db0

.xword 0x84def0e705c3f7a5

.xword 0xc5cd68ee656a559d

.xword 0x722bbadc33d76887

.xword 0x6c93b4c284d938a5

.xword 0x5d8cd503cc979bf5

.xword 0x6e21e4819f7fdcfa

.xword 0x0525db5975dc1012

.xword 0x2f9911b67aab4b62

.xword 0xae4f4181ce9deca3

.xword 0xb923bf298efa14c8

.xword 0x08e64cfbe25376ba

.xword 0x3c4603eb15c7cf85

.xword 0x68812bc737ce3216

.xword 0xdf6a228f0b3f0a04

.xword 0x948a1dbac0a7b6fa

.xword 0x264719701ce0d54d

.xword 0x2daad4eb48250538

.xword 0x8e48a287f4134d2f

.xword 0xb2833d194b8e6cfb

.xword 0x2cdeb2a315d5f65f

.xword 0x7590d051fed84fe7

.xword 0xbe24169c74a83cd0

.xword 0x06deb73d14eb7c67

.xword 0x561ead91e0c94e66

.xword 0xa9150d648619a5f3

.xword 0xc9597879a157979f

.xword 0xf62a141ea486598b

.xword 0x6a955fafa02100a9

.xword 0x4364192e4a06f054

.xword 0xe816985c361002f6

.xword 0x6d5ef230384268b7

.xword 0xc6e6d12759c3f1c2

.xword 0x43be24c0fd391820

.xword 0x68836eccafea8055

.xword 0xe9a38413eeb27768

.xword 0xfdff22bf6fc02fb0

.xword 0x497ec34ddd7c0f82

.xword 0x36613dc2c22fda1f

.xword 0x24d9f45d8b5f9129

.xword 0xaa4ddd9f503b5577

.xword 0xecdb8d0f117068d2

.xword 0xdf239079a9e768a3

.xword 0xcd79cbd4ad87463f

.xword 0x8f2cdbf136034c7c

.xword 0x35eb97443bed5709

.xword 0xea4c75a013a16cfb

.xword 0xe4205d4181ebe897

.xword 0x95ff054d3d7c6722

.xword 0x79ae4f6c9a935582

.xword 0xeee7c612c876ade6

.xword 0xac0a6ebd7fbea217

.xword 0xaa1301343c389a7f

.xword 0x9914fd4f37d3bf0d

.xword 0x2ad303a40e078c18

.xword 0x748f920bb584169c

.xword 0x0fa7d5e04960daeb

.xword 0x9df05d563cb6700f

.xword 0x046e72f1de654d99

.xword 0x7f796de04a26fc55

.xword 0xa0af13f00a413752

.xword 0xb3518f08489d5d25

.xword 0x7e2be74f80bc2d8b

.xword 0x961eef04a754c4bb

.xword 0x8975f29672b07880

.xword 0x162c94d69b0ea644

.xword 0xdbcd9f2e5e11b096

.xword 0xdd47525127256a4e

.xword 0xe0ab6b4f61e174d9

.xword 0x766f24bec443a9a2

.xword 0xea6c9a33540e6e5e

.xword 0x47913ddc19b63f1b

.xword 0x62b5bc32a54cbe35

.xword 0x2462e8f3e1d0fc50

.xword 0xadf70c7acb8a533f

.xword 0x4eb29a0c99a09982

.xword 0xf53ad5432b29799b

.xword 0xa3875aaed5a7d029

.xword 0x6c60b27dc336ce0f

.xword 0xae3ac4924bc2f5a8

.xword 0x966c46d777f29fbf

.xword 0xd5425d3165f2aa33

.xword 0x79a576adab0f511a

.xword 0xdcde8b030e4b1c78

.xword 0x098bffef797ccecc

.xword 0xd92606ba04b4344f

.xword 0xd884bd0d6a06f3d7

.xword 0xed6865f71e3cc76d

.xword 0xd66290a1b4c8ef16

.xword 0xb6c68e065d7d29f9

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
