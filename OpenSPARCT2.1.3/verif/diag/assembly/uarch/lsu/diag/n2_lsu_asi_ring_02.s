/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_lsu_asi_ring_02.s
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
#define PSTATE_CLE_MASK	0x200
#define PSTATE_TLE_MASK	0x100
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define PART0_NZ_RANOTPA_1 500000000
#define PART0_Z_RANOTPA_1 500000000
#define DISABLE_PART_LIMIT_CHECK
#define H_HT0_Hw_Corrected_Error_0x63
#define SUN_H_HT0_Hw_Corrected_Error_0x63 \
        ba HW_CORRECTED_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Data_Access_MMU_Error_0x72
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
        ba DATA_ACCESS_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop
# 360 "diag.j"
# include "hboot.s"
.text
.global main

main:

main_text_start:
    setx MEM_DATA3_START, %r4, %r10
    setx MEM_DATA7_START, %r4, %r11
    setx MEM_DATA11_START, %r4, %r12
    setx MEM_DATA15_START, %r4, %r13
    setx MEM_DATA19_START, %r4, %r14
    setx MEM_DATA23_START, %r4, %r15
    setx MEM_DATA27_START, %r4, %r16
    setx MEM_DATA31_START, %r4, %r17
    setx MEM_DATA0_START, %r4, %r18
    setx MEM_REAL_DATA0_START, %r4, %r23
    setx MEM_SEC_DATA0_START, %r4, %r24
# 380 "diag.j"
    setx 0x40, %r4, %r19
    setx 0x80, %r4, %r20
    setx 0x100, %r4, %r21
    setx 0x140, %r4, %r22
# 390 "diag.j"
	setx 0x0000000000004008, %r4, %r27

	mov %g0, %r28
	not %r28
	xor %r28, 0xf, %r28  

	mov %g0, %r29
	not %r29
	xor %r29, 0x3f, %r29  

	mov %g0, %r26

	mov 0x80, %g1
	wr %g1, %g0, %asi
    ta T_CHANGE_PRIV
    ta T_CHANGE_HPRIV
    rdpr %pstate, %g1
    and  %r1, 0xdff, %r1
    wrpr %g0, %r1, %pstate

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
	setx 0x120efda448597d6e, %g1, %r2
	setx 0x0f8be8f8b63bbb29, %g1, %r3
	setx 0x3c08aa2d3d2b3f8c, %g1, %r4
	setx 0x9d26e1c8932c417a, %g1, %r5
	setx 0x1f18a2439f8352fc, %g1, %r6
	setx 0x39d358db157fe3b9, %g1, %r7
	setx 0x75e261dbd98d1754, %g1, %r8

     mov %r2, %r1
ld_local_indet_sync_ffffffff_0:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4482200  ! 1: LDSB_I	ldsb	[%r0 + 0x0200], %r10
ld_fast_deter_sync_ffffffff_1:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xd0d84400  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x20, %r8
ld_fast_deter_sync_ffffffff_2:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd0d84e40  ! 3: LDXA_R	ldxa	[%r1, %r0] 0x72, %r8
	.word 0xd6502380  ! 4: LDSH_I	ldsh	[%r0 + 0x0380], %r11
ld_local_indet_sync_ffffffff_3:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 5: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd2282200  ! 6: STB_I	stb	%r9, [%r0 + 0x0200]
ld_fast_deter_sync_ffffffff_4:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 7: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
ld_local_indet_sync_ffffffff_5:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 8: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_6:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 9: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_deter_sync_ffffffff_7:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 10: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
ld_fast_deter_sync_ffffffff_8:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 11: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
ld_fast_indet_sync_ffffffff_9:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 12: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_10:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 13: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_indet_sync_ffffffff_11:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 14: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_12:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 15: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_13:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 16: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_14:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 17: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 18: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_16:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 19: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_17:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 20: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xda302380  ! 21: STH_I	sth	%r13, [%r0 + 0x0380]
st_fast_deter_nonsync_ffffffff_18:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 22: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_19:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_20:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 24: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_21:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 25: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_22:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 26: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_23:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xd2d84400  ! 27: LDXA_R	ldxa	[%r1, %r0] 0x20, %r9
ld_local_deter_sync_ffffffff_24:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
	.word 0xde482280  ! 29: LDSB_I	ldsb	[%r0 + 0x0280], %r15
ld_local_indet_sync_ffffffff_25:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 30: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_26:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 31: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_27:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_28:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 33: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd4482240  ! 34: LDSB_I	ldsb	[%r0 + 0x0240], %r10
ld_fast_deter_sync_ffffffff_29:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xdcd849e0  ! 35: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r14
ld_fast_deter_sync_ffffffff_30:
	nop
	mov 0x40, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 36: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
ld_fast_indet_sync_ffffffff_31:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 37: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_32:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 38: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd0482240  ! 39: LDSB_I	ldsb	[%r0 + 0x0240], %r8
	.word 0xde302380  ! 40: STH_I	sth	%r15, [%r0 + 0x0380]
st_fast_deter_nonsync_ffffffff_33:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 41: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_34:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 42: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xd4302340  ! 43: STH_I	sth	%r10, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_35:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 44: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xda2822c0  ! 45: STB_I	stb	%r13, [%r0 + 0x02c0]
ld_local_deter_sync_ffffffff_36:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 46: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xda5023c0  ! 47: LDSH_I	ldsh	[%r0 + 0x03c0], %r13
st_fast_deter_nonsync_ffffffff_37:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 48: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_38:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 49: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_39:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 50: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_40:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 51: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_41:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 52: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xd62822c0  ! 53: STB_I	stb	%r11, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_42:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 54: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xdc2822c0  ! 55: STB_I	stb	%r14, [%r0 + 0x02c0]
ld_fast_deter_sync_ffffffff_43:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xd6d84a40  ! 56: LDXA_R	ldxa	[%r1, %r0] 0x52, %r11
ld_local_deter_sync_ffffffff_44:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 57: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
	.word 0xd2282240  ! 58: STB_I	stb	%r9, [%r0 + 0x0240]
ld_local_indet_sync_ffffffff_45:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 59: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_46:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 60: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
st_fast_deter_nonsync_ffffffff_47:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 61: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
	.word 0xd04822c0  ! 62: LDSB_I	ldsb	[%r0 + 0x02c0], %r8
ld_local_deter_sync_ffffffff_48:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 63: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_49:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd4d84420  ! 64: LDXA_R	ldxa	[%r1, %r0] 0x21, %r10
ld_fast_deter_sync_ffffffff_50:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 65: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_indet_sync_ffffffff_51:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 66: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_52:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 67: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd63022c0  ! 68: STH_I	sth	%r11, [%r0 + 0x02c0]
	.word 0xd2482300  ! 69: LDSB_I	ldsb	[%r0 + 0x0300], %r9
ld_fast_deter_sync_ffffffff_53:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
ld_local_indet_sync_ffffffff_54:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 71: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd2502380  ! 72: LDSH_I	ldsh	[%r0 + 0x0380], %r9
	.word 0xd6282280  ! 73: STB_I	stb	%r11, [%r0 + 0x0280]
ld_local_deter_sync_ffffffff_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 74: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_indet_sync_ffffffff_56:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 75: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_57:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 76: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_58:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 77: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd84823c0  ! 78: LDSB_I	ldsb	[%r0 + 0x03c0], %r12
	.word 0xda302280  ! 79: STH_I	sth	%r13, [%r0 + 0x0280]
ld_local_deter_sync_ffffffff_59:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 80: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
	.word 0xd8502380  ! 81: LDSH_I	ldsh	[%r0 + 0x0380], %r12
ld_local_indet_sync_ffffffff_60:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 82: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_61:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 83: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
	.word 0xda2822c0  ! 84: STB_I	stb	%r13, [%r0 + 0x02c0]
ld_local_indet_sync_ffffffff_62:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 85: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_63:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 86: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_local_indet_sync_ffffffff_64:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 87: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd2282280  ! 88: STB_I	stb	%r9, [%r0 + 0x0280]
st_fast_deter_nonsync_ffffffff_65:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 89: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_66:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 90: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_67:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 91: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_68:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 92: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_69:
	nop
	mov 0x220, %r1 	! (VA for ASI 0x52) 
	.word 0xd6d84a40  ! 93: LDXA_R	ldxa	[%r1, %r0] 0x52, %r11
ld_fast_indet_sync_ffffffff_70:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 94: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_71:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 95: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_indet_sync_ffffffff_72:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 96: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xd82822c0  ! 97: STB_I	stb	%r12, [%r0 + 0x02c0]
ld_local_indet_sync_ffffffff_73:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 98: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_74:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 99: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_75:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 100: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_76:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 101: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
	.word 0xde502280  ! 102: LDSH_I	ldsh	[%r0 + 0x0280], %r15
ld_fast_indet_sync_ffffffff_77:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 103: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_78:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 104: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd4302280  ! 105: STH_I	sth	%r10, [%r0 + 0x0280]
	.word 0xd24823c0  ! 106: LDSB_I	ldsb	[%r0 + 0x03c0], %r9
ld_local_deter_sync_ffffffff_79:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 107: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_80:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 108: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_81:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 109: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
st_fast_deter_nonsync_ffffffff_82:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 110: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_83:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 111: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_local_indet_sync_ffffffff_84:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 112: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_85:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 113: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_86:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 114: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
st_fast_deter_nonsync_ffffffff_87:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 115: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 116: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_indet_sync_ffffffff_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 117: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_90:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_fast_deter_sync_ffffffff_91:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xdcd84420  ! 119: LDXA_R	ldxa	[%r1, %r0] 0x21, %r14
st_fast_deter_nonsync_ffffffff_92:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 120: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
	.word 0xd8502300  ! 121: LDSH_I	ldsh	[%r0 + 0x0300], %r12
ld_fast_indet_sync_ffffffff_93:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 122: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_94:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 123: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd6502240  ! 124: LDSH_I	ldsh	[%r0 + 0x0240], %r11
ld_fast_indet_sync_ffffffff_95:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 125: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_96:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xdcd844a0  ! 126: LDXA_R	ldxa	[%r1, %r0] 0x25, %r14
ld_fast_deter_sync_ffffffff_97:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 127: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
st_fast_deter_nonsync_ffffffff_98:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 128: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
	.word 0xdc302280  ! 129: STH_I	sth	%r14, [%r0 + 0x0280]
ld_fast_indet_sync_ffffffff_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 130: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_100:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 131: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_101:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 132: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_102:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 133: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xde302340  ! 134: STH_I	sth	%r15, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_103:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 135: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_104:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 136: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_indet_sync_ffffffff_105:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 137: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_106:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 138: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_107:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 139: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_108:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 140: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
	.word 0xde282340  ! 141: STB_I	stb	%r15, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_109:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 142: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_110:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 143: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_111:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 144: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_112:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 145: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
	.word 0xd6302200  ! 146: STH_I	sth	%r11, [%r0 + 0x0200]
	.word 0xdc502240  ! 147: LDSH_I	ldsh	[%r0 + 0x0240], %r14
ld_fast_indet_sync_ffffffff_113:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 148: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_114:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 149: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_115:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 150: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_116:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 151: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_117:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 152: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_deter_sync_ffffffff_118:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xdad84420  ! 153: LDXA_R	ldxa	[%r1, %r0] 0x21, %r13
ld_fast_indet_sync_ffffffff_119:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 154: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
	.word 0xd8502280  ! 155: LDSH_I	ldsh	[%r0 + 0x0280], %r12
st_fast_deter_nonsync_ffffffff_120:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 156: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_121:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 157: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_122:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 158: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_123:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 159: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_124:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 160: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_fast_deter_sync_ffffffff_125:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd8d84a00  ! 161: LDXA_R	ldxa	[%r1, %r0] 0x50, %r12
st_fast_deter_nonsync_ffffffff_126:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 162: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_127:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 163: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 164: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xda282300  ! 165: STB_I	stb	%r13, [%r0 + 0x0300]
ld_fast_indet_sync_ffffffff_129:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 166: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd0482340  ! 167: LDSB_I	ldsb	[%r0 + 0x0340], %r8
	.word 0xde482280  ! 168: LDSB_I	ldsb	[%r0 + 0x0280], %r15
ld_fast_indet_sync_ffffffff_130:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 169: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_131:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 170: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd6302200  ! 171: STH_I	sth	%r11, [%r0 + 0x0200]
	.word 0xd85022c0  ! 172: LDSH_I	ldsh	[%r0 + 0x02c0], %r12
	.word 0xd8302340  ! 173: STH_I	sth	%r12, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_132:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 174: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_133:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 175: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
	.word 0xda502380  ! 176: LDSH_I	ldsh	[%r0 + 0x0380], %r13
ld_local_deter_sync_ffffffff_134:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 177: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_local_deter_sync_ffffffff_135:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 178: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_deter_sync_ffffffff_136:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x54) 
	.word 0xded84a80  ! 179: LDXA_R	ldxa	[%r1, %r0] 0x54, %r15
st_fast_deter_nonsync_ffffffff_137:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 180: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_138:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 181: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_139:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 182: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_140:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 183: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_141:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 184: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_indet_sync_ffffffff_142:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 185: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_143:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 186: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_144:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 187: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_145:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 188: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
	.word 0xd6282340  ! 189: STB_I	stb	%r11, [%r0 + 0x0340]
st_fast_deter_nonsync_ffffffff_146:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 190: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_147:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xd8d84400  ! 191: LDXA_R	ldxa	[%r1, %r0] 0x20, %r12
st_fast_deter_nonsync_ffffffff_148:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 192: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_149:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 193: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_150:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 194: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
	.word 0xda482300  ! 195: LDSB_I	ldsb	[%r0 + 0x0300], %r13
ld_local_deter_sync_ffffffff_151:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 196: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_indet_sync_ffffffff_152:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 197: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xdc282240  ! 198: STB_I	stb	%r14, [%r0 + 0x0240]
ld_fast_indet_sync_ffffffff_153:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 199: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_154:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 200: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_155:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 201: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_156:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 202: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_157:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 203: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_indet_sync_ffffffff_158:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 204: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_159:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d84980  ! 205: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r10
ld_fast_deter_sync_ffffffff_160:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 206: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
ld_fast_deter_sync_ffffffff_161:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 207: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
	.word 0xd0282200  ! 208: STB_I	stb	%r8, [%r0 + 0x0200]
ld_local_deter_sync_ffffffff_162:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 209: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_deter_sync_ffffffff_163:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd4d848a0  ! 210: LDXA_R	ldxa	[%r1, %r0] 0x45, %r10
ld_fast_deter_sync_ffffffff_164:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 211: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_165:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 212: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_deter_sync_ffffffff_166:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 213: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
	.word 0xd8482340  ! 214: LDSB_I	ldsb	[%r0 + 0x0340], %r12
ld_local_indet_sync_ffffffff_167:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 215: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_168:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 216: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_169:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 217: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_170:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 218: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_171:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 219: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd8502340  ! 220: LDSH_I	ldsh	[%r0 + 0x0340], %r12
ld_local_indet_sync_ffffffff_172:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 221: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_173:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 222: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_174:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 223: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_175:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 224: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_176:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 225: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_177:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 226: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_local_indet_sync_ffffffff_178:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 227: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_179:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 228: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_180:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 229: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xde302340  ! 230: STH_I	sth	%r15, [%r0 + 0x0340]
	.word 0xda482340  ! 231: LDSB_I	ldsb	[%r0 + 0x0340], %r13
	.word 0xd4502380  ! 232: LDSH_I	ldsh	[%r0 + 0x0380], %r10
	.word 0xd2482240  ! 233: LDSB_I	ldsb	[%r0 + 0x0240], %r9
ld_fast_indet_sync_ffffffff_181:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 234: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_182:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 235: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_indet_sync_ffffffff_183:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 236: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_184:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 237: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_185:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 238: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
st_fast_deter_nonsync_ffffffff_186:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 239: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_187:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 240: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
	.word 0xdc5023c0  ! 241: LDSH_I	ldsh	[%r0 + 0x03c0], %r14
ld_local_indet_sync_ffffffff_188:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 242: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd6302280  ! 243: STH_I	sth	%r11, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_189:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 244: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
	.word 0xdc482340  ! 245: LDSB_I	ldsb	[%r0 + 0x0340], %r14
ld_fast_deter_sync_ffffffff_190:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd0d84980  ! 246: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r8
ld_local_deter_sync_ffffffff_191:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 247: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
	.word 0xde5022c0  ! 248: LDSH_I	ldsh	[%r0 + 0x02c0], %r15
ld_local_deter_sync_ffffffff_192:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 249: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_local_deter_sync_ffffffff_193:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 250: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_deter_sync_ffffffff_194:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 251: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
ld_local_indet_sync_ffffffff_195:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 252: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd8282280  ! 253: STB_I	stb	%r12, [%r0 + 0x0280]
ld_fast_indet_sync_ffffffff_196:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 254: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_197:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 255: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd2502340  ! 256: LDSH_I	ldsh	[%r0 + 0x0340], %r9
	.word 0xd0282200  ! 257: STB_I	stb	%r8, [%r0 + 0x0200]
st_fast_deter_nonsync_ffffffff_198:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 258: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_199:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 259: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_200:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 260: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_201:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 261: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
	.word 0xdc4822c0  ! 262: LDSB_I	ldsb	[%r0 + 0x02c0], %r14
ld_fast_indet_sync_ffffffff_202:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 263: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_203:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 264: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
	.word 0xd8482380  ! 265: LDSB_I	ldsb	[%r0 + 0x0380], %r12
	.word 0xdc502380  ! 266: LDSH_I	ldsh	[%r0 + 0x0380], %r14
ld_local_indet_sync_ffffffff_204:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 267: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_205:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 268: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_206:
	nop
	mov 0x40, %r1 	! (VA for ASI 0x58) 
	.word 0xdad84b00  ! 269: LDXA_R	ldxa	[%r1, %r0] 0x58, %r13
ld_local_deter_sync_ffffffff_207:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 270: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_indet_sync_ffffffff_208:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 271: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_209:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 272: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_fast_deter_sync_ffffffff_210:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 273: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
	.word 0xde502380  ! 274: LDSH_I	ldsh	[%r0 + 0x0380], %r15
ld_fast_deter_sync_ffffffff_211:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 275: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_fast_deter_sync_ffffffff_212:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 276: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
	.word 0xd4502340  ! 277: LDSH_I	ldsh	[%r0 + 0x0340], %r10
	.word 0xd8302200  ! 278: STH_I	sth	%r12, [%r0 + 0x0200]
st_fast_deter_nonsync_ffffffff_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 279: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_214:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 280: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_215:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 281: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_216:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 282: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
st_fast_deter_nonsync_ffffffff_217:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 283: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_218:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 284: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_219:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 285: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_220:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 286: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_221:
	nop
	mov 0x118, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 287: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_local_deter_sync_ffffffff_222:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 288: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd2502380  ! 289: LDSH_I	ldsh	[%r0 + 0x0380], %r9
ld_fast_deter_sync_ffffffff_223:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 290: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_fast_indet_sync_ffffffff_224:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 291: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_225:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 292: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_226:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 293: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
	.word 0xdc502300  ! 294: LDSH_I	ldsh	[%r0 + 0x0300], %r14
ld_local_deter_sync_ffffffff_227:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 295: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_deter_sync_ffffffff_228:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 296: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_indet_sync_ffffffff_229:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 297: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_230:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 298: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_231:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 299: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_232:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 300: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_233:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 301: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_234:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 302: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_235:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 303: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd6502380  ! 304: LDSH_I	ldsh	[%r0 + 0x0380], %r11
ld_local_indet_sync_ffffffff_236:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 305: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_237:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 306: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_238:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 307: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
st_fast_deter_nonsync_ffffffff_239:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 308: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xd0482200  ! 309: LDSB_I	ldsb	[%r0 + 0x0200], %r8
ld_local_indet_sync_ffffffff_240:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 310: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd4502280  ! 311: LDSH_I	ldsh	[%r0 + 0x0280], %r10
ld_local_indet_sync_ffffffff_241:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 312: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xda302340  ! 313: STH_I	sth	%r13, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_242:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 314: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_243:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 315: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_244:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 316: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_245:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 317: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_246:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 318: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_247:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 319: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
	.word 0xda502240  ! 320: LDSH_I	ldsh	[%r0 + 0x0240], %r13
st_fast_deter_nonsync_ffffffff_248:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 321: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_249:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xded84860  ! 322: LDXA_R	ldxa	[%r1, %r0] 0x43, %r15
ld_local_deter_sync_ffffffff_250:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 323: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xda502240  ! 324: LDSH_I	ldsh	[%r0 + 0x0240], %r13
ld_local_indet_sync_ffffffff_251:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 325: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_252:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 326: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xde482340  ! 327: LDSB_I	ldsb	[%r0 + 0x0340], %r15
ld_local_deter_sync_ffffffff_253:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 328: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
st_fast_deter_nonsync_ffffffff_254:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 329: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_255:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 330: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_256:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 331: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd6282280  ! 332: STB_I	stb	%r11, [%r0 + 0x0280]
ld_local_deter_sync_ffffffff_257:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 333: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_258:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 334: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_259:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 335: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_260:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 336: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
	.word 0xd83023c0  ! 337: STH_I	sth	%r12, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_261:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 338: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd44822c0  ! 339: LDSB_I	ldsb	[%r0 + 0x02c0], %r10
ld_local_indet_sync_ffffffff_262:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 340: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_263:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 341: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd0502380  ! 342: LDSH_I	ldsh	[%r0 + 0x0380], %r8
ld_fast_indet_sync_ffffffff_264:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 343: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_265:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 344: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_deter_sync_ffffffff_266:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 345: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_local_indet_sync_ffffffff_267:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 346: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd6502200  ! 347: LDSH_I	ldsh	[%r0 + 0x0200], %r11
ld_fast_indet_sync_ffffffff_268:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 348: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd03023c0  ! 349: STH_I	sth	%r8, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_269:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 350: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_270:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 351: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_271:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 352: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
	.word 0xd4302240  ! 353: STH_I	sth	%r10, [%r0 + 0x0240]
	.word 0xda302300  ! 354: STH_I	sth	%r13, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_272:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 355: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_273:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 356: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xde4823c0  ! 357: LDSB_I	ldsb	[%r0 + 0x03c0], %r15
ld_local_deter_sync_ffffffff_274:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 358: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
	.word 0xd22823c0  ! 359: STB_I	stb	%r9, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_275:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 360: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_276:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd0d84e40  ! 361: LDXA_R	ldxa	[%r1, %r0] 0x72, %r8
ld_fast_indet_sync_ffffffff_277:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 362: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_278:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 363: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
	.word 0xd2482200  ! 364: LDSB_I	ldsb	[%r0 + 0x0200], %r9
	.word 0xd6482240  ! 365: LDSB_I	ldsb	[%r0 + 0x0240], %r11
ld_local_deter_sync_ffffffff_279:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 366: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_280:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 367: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_281:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 368: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
	.word 0xd0502300  ! 369: LDSH_I	ldsh	[%r0 + 0x0300], %r8
ld_local_indet_sync_ffffffff_282:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 370: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd6482340  ! 371: LDSB_I	ldsb	[%r0 + 0x0340], %r11
st_fast_deter_nonsync_ffffffff_283:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 372: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
	.word 0xd8482380  ! 373: LDSB_I	ldsb	[%r0 + 0x0380], %r12
ld_local_indet_sync_ffffffff_284:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 374: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_285:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x52) 
	.word 0xd6d84a40  ! 375: LDXA_R	ldxa	[%r1, %r0] 0x52, %r11
ld_fast_deter_sync_ffffffff_286:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd4d848a0  ! 376: LDXA_R	ldxa	[%r1, %r0] 0x45, %r10
ld_local_indet_sync_ffffffff_287:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 377: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_288:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 378: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_289:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 379: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_290:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 380: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_local_deter_sync_ffffffff_291:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 381: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
	.word 0xd8502340  ! 382: LDSH_I	ldsh	[%r0 + 0x0340], %r12
ld_fast_indet_sync_ffffffff_292:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 383: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
	.word 0xd2482300  ! 384: LDSB_I	ldsb	[%r0 + 0x0300], %r9
st_fast_deter_nonsync_ffffffff_293:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 385: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_294:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 386: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_295:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 387: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_296:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 388: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_297:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 389: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_298:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 390: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_299:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 391: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_300:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 392: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_301:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 393: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_302:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 394: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd2302300  ! 395: STH_I	sth	%r9, [%r0 + 0x0300]
	.word 0xd0282380  ! 396: STB_I	stb	%r8, [%r0 + 0x0380]
st_fast_deter_nonsync_ffffffff_303:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 397: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_304:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 398: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_305:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 399: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_local_deter_sync_ffffffff_306:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 400: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
st_fast_deter_nonsync_ffffffff_307:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 401: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_308:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 402: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xd82823c0  ! 403: STB_I	stb	%r12, [%r0 + 0x03c0]
ld_local_deter_sync_ffffffff_309:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 404: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_310:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 405: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_311:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 406: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
	.word 0xd4302380  ! 407: STH_I	sth	%r10, [%r0 + 0x0380]
	.word 0xd8502340  ! 408: LDSH_I	ldsh	[%r0 + 0x0340], %r12
	.word 0xd4482380  ! 409: LDSB_I	ldsb	[%r0 + 0x0380], %r10
	.word 0xd0482240  ! 410: LDSB_I	ldsb	[%r0 + 0x0240], %r8
	.word 0xda302280  ! 411: STH_I	sth	%r13, [%r0 + 0x0280]
st_fast_deter_nonsync_ffffffff_312:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 412: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_313:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 413: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_314:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 414: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_315:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 415: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_316:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 416: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_317:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 417: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xd62822c0  ! 418: STB_I	stb	%r11, [%r0 + 0x02c0]
ld_fast_deter_sync_ffffffff_318:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 419: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_319:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 420: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
	.word 0xdc282340  ! 421: STB_I	stb	%r14, [%r0 + 0x0340]
st_fast_deter_nonsync_ffffffff_320:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 422: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_321:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 423: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
ld_local_deter_sync_ffffffff_322:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 424: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_deter_sync_ffffffff_323:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 425: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_local_deter_sync_ffffffff_324:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 426: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_deter_sync_ffffffff_325:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 427: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
st_fast_deter_nonsync_ffffffff_326:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 428: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_327:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 429: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_328:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 430: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_329:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 431: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
	.word 0xd2282240  ! 432: STB_I	stb	%r9, [%r0 + 0x0240]
ld_local_deter_sync_ffffffff_330:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 433: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_indet_sync_ffffffff_331:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 434: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_332:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 435: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_333:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 436: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_334:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 437: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_335:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 438: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_336:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 439: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_337:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 440: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
st_fast_deter_nonsync_ffffffff_338:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 441: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_339:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 442: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_340:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 443: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_341:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 444: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_indet_sync_ffffffff_342:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 445: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_343:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 446: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd6302200  ! 447: STH_I	sth	%r11, [%r0 + 0x0200]
	.word 0xd4482200  ! 448: LDSB_I	ldsb	[%r0 + 0x0200], %r10
	.word 0xda3023c0  ! 449: STH_I	sth	%r13, [%r0 + 0x03c0]
st_fast_deter_nonsync_ffffffff_344:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 450: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_345:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 451: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd83023c0  ! 452: STH_I	sth	%r12, [%r0 + 0x03c0]
	.word 0xd6482340  ! 453: LDSB_I	ldsb	[%r0 + 0x0340], %r11
ld_fast_deter_sync_ffffffff_346:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdad84860  ! 454: LDXA_R	ldxa	[%r1, %r0] 0x43, %r13
ld_local_indet_sync_ffffffff_347:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 455: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_348:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 456: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
st_fast_deter_nonsync_ffffffff_349:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 457: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_350:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 458: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_351:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 459: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_352:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 460: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_353:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 461: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_354:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 462: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_355:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 463: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
	.word 0xd85023c0  ! 464: LDSH_I	ldsh	[%r0 + 0x03c0], %r12
ld_local_indet_sync_ffffffff_356:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_357:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 466: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd2302200  ! 467: STH_I	sth	%r9, [%r0 + 0x0200]
st_fast_deter_nonsync_ffffffff_358:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 468: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_359:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 469: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_360:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 470: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
ld_fast_deter_sync_ffffffff_361:
	nop
	mov 0x48, %r1 	! (VA for ASI 0x54) 
	.word 0xd8d84a80  ! 471: LDXA_R	ldxa	[%r1, %r0] 0x54, %r12
ld_fast_deter_sync_ffffffff_362:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 472: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_local_indet_sync_ffffffff_363:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 473: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_364:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 474: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
st_fast_deter_nonsync_ffffffff_365:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 475: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_366:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 476: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
	.word 0xd25023c0  ! 477: LDSH_I	ldsh	[%r0 + 0x03c0], %r9
ld_local_indet_sync_ffffffff_367:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 478: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd05023c0  ! 479: LDSH_I	ldsh	[%r0 + 0x03c0], %r8
ld_fast_indet_sync_ffffffff_368:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 480: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_369:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 481: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_370:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 482: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_371:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 483: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_372:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd2d848a0  ! 484: LDXA_R	ldxa	[%r1, %r0] 0x45, %r9
ld_local_indet_sync_ffffffff_373:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 485: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_374:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 486: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_375:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 487: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
	.word 0xd2482380  ! 488: LDSB_I	ldsb	[%r0 + 0x0380], %r9
ld_fast_indet_sync_ffffffff_376:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 489: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd04823c0  ! 490: LDSB_I	ldsb	[%r0 + 0x03c0], %r8
ld_local_deter_sync_ffffffff_377:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 491: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_indet_sync_ffffffff_378:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 492: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_379:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 493: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_380:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 494: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_381:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 495: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_382:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 496: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_383:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x54) 
	.word 0xdad84a80  ! 497: LDXA_R	ldxa	[%r1, %r0] 0x54, %r13
ld_local_indet_sync_ffffffff_384:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 498: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_385:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 499: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_386:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 500: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_387:
	nop
	mov 0x40, %r1 	! (VA for ASI 0x54) 
	.word 0xd6d84a80  ! 501: LDXA_R	ldxa	[%r1, %r0] 0x54, %r11
	.word 0xd65022c0  ! 502: LDSH_I	ldsh	[%r0 + 0x02c0], %r11
ld_local_indet_sync_ffffffff_388:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 503: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_389:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 504: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_390:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 505: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xda482300  ! 506: LDSB_I	ldsb	[%r0 + 0x0300], %r13
ld_fast_deter_sync_ffffffff_391:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x54) 
	.word 0xded84a80  ! 507: LDXA_R	ldxa	[%r1, %r0] 0x54, %r15
	.word 0xd6502380  ! 508: LDSH_I	ldsh	[%r0 + 0x0380], %r11
	.word 0xd62823c0  ! 509: STB_I	stb	%r11, [%r0 + 0x03c0]
ld_local_indet_sync_ffffffff_392:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 510: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_393:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 511: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
st_fast_deter_nonsync_ffffffff_394:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 512: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
	.word 0xda482280  ! 513: LDSB_I	ldsb	[%r0 + 0x0280], %r13
	.word 0xd4302300  ! 514: STH_I	sth	%r10, [%r0 + 0x0300]
ld_fast_indet_sync_ffffffff_395:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 515: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_396:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 516: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_397:
	nop
	mov 0x50, %r1 	! (VA for ASI 0x54) 
	.word 0xded84a80  ! 517: LDXA_R	ldxa	[%r1, %r0] 0x54, %r15
st_fast_deter_nonsync_ffffffff_398:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 518: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xde302340  ! 519: STH_I	sth	%r15, [%r0 + 0x0340]
ld_local_indet_sync_ffffffff_399:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 520: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_400:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 521: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_401:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 522: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_indet_sync_ffffffff_402:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 523: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_403:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 524: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_404:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 525: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_405:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 526: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_406:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 527: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_407:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 528: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_408:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 529: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_409:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 530: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
	.word 0xde502380  ! 531: LDSH_I	ldsh	[%r0 + 0x0380], %r15
ld_local_indet_sync_ffffffff_410:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 532: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_411:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 533: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_412:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 534: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_deter_sync_ffffffff_413:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd2d84ba0  ! 535: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r9
ld_local_deter_sync_ffffffff_414:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 536: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_415:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 537: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_416:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xded84420  ! 538: LDXA_R	ldxa	[%r1, %r0] 0x21, %r15
ld_fast_indet_sync_ffffffff_417:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 539: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd6502380  ! 540: LDSH_I	ldsh	[%r0 + 0x0380], %r11
ld_fast_deter_sync_ffffffff_418:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 541: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ld_fast_deter_sync_ffffffff_419:
	nop
	mov 0x218, %r1 	! (VA for ASI 0x52) 
	.word 0xd6d84a40  ! 542: LDXA_R	ldxa	[%r1, %r0] 0x52, %r11
ld_fast_deter_sync_ffffffff_420:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 543: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
st_fast_deter_nonsync_ffffffff_421:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 544: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_422:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 545: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_423:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xd2d84a40  ! 546: LDXA_R	ldxa	[%r1, %r0] 0x52, %r9
	.word 0xd4482200  ! 547: LDSB_I	ldsb	[%r0 + 0x0200], %r10
st_fast_deter_nonsync_ffffffff_424:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 548: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_425:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 549: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_426:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 550: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
ld_local_deter_sync_ffffffff_427:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 551: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_428:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 552: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_429:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 553: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_430:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd2d84420  ! 554: LDXA_R	ldxa	[%r1, %r0] 0x21, %r9
ld_local_deter_sync_ffffffff_431:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 555: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_deter_sync_ffffffff_432:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 556: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_433:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 557: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_434:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 558: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_435:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 559: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_local_indet_sync_ffffffff_436:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 560: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_437:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 561: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xdc302380  ! 562: STH_I	sth	%r14, [%r0 + 0x0380]
st_fast_deter_nonsync_ffffffff_438:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 563: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_439:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 564: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_440:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 565: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd44823c0  ! 566: LDSB_I	ldsb	[%r0 + 0x03c0], %r10
ld_local_indet_sync_ffffffff_441:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 567: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_442:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 568: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_443:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 569: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_444:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 570: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_445:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 571: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd2282240  ! 572: STB_I	stb	%r9, [%r0 + 0x0240]
ld_local_indet_sync_ffffffff_446:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 573: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_447:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 574: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xde502300  ! 575: LDSH_I	ldsh	[%r0 + 0x0300], %r15
ld_local_indet_sync_ffffffff_448:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 576: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_449:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 577: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_450:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xdcd84420  ! 578: LDXA_R	ldxa	[%r1, %r0] 0x21, %r14
st_fast_deter_nonsync_ffffffff_451:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 579: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_452:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 580: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_453:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 581: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_454:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 582: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xd0502380  ! 583: LDSH_I	ldsh	[%r0 + 0x0380], %r8
ld_fast_indet_sync_ffffffff_455:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 584: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_456:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 585: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
ld_local_indet_sync_ffffffff_457:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 586: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_458:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 587: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_459:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 588: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_460:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 589: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_461:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 590: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_deter_sync_ffffffff_462:
	nop
	mov 0x218, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 591: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_local_deter_sync_ffffffff_463:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 592: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_indet_sync_ffffffff_464:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 593: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd85023c0  ! 594: LDSH_I	ldsh	[%r0 + 0x03c0], %r12
	.word 0xd4302380  ! 595: STH_I	sth	%r10, [%r0 + 0x0380]
	.word 0xd4282380  ! 596: STB_I	stb	%r10, [%r0 + 0x0380]
ld_local_deter_sync_ffffffff_465:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 597: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_indet_sync_ffffffff_466:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 598: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_467:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 599: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
	.word 0xd2502200  ! 600: LDSH_I	ldsh	[%r0 + 0x0200], %r9
ld_fast_indet_sync_ffffffff_468:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 601: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_469:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 602: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_470:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x58) 
	.word 0xd8d84b00  ! 603: LDXA_R	ldxa	[%r1, %r0] 0x58, %r12
ld_fast_deter_sync_ffffffff_471:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 604: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
	.word 0xd6282240  ! 605: STB_I	stb	%r11, [%r0 + 0x0240]
ld_local_deter_sync_ffffffff_472:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 606: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_deter_sync_ffffffff_473:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 607: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_474:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 608: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
ld_fast_deter_sync_ffffffff_475:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 609: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
ld_local_deter_sync_ffffffff_476:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 610: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_477:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdcd84e40  ! 611: LDXA_R	ldxa	[%r1, %r0] 0x72, %r14
ld_local_deter_sync_ffffffff_478:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 612: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_indet_sync_ffffffff_479:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 613: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_480:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 614: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_481:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xded84ba0  ! 615: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r15
st_fast_deter_nonsync_ffffffff_482:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 616: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_483:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 617: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_484:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 618: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_indet_sync_ffffffff_485:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 619: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_486:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 620: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_487:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 621: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_488:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x54) 
	.word 0xd8d84a80  ! 622: LDXA_R	ldxa	[%r1, %r0] 0x54, %r12
	.word 0xd8482300  ! 623: LDSB_I	ldsb	[%r0 + 0x0300], %r12
ld_local_deter_sync_ffffffff_489:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 624: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_deter_sync_ffffffff_490:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 625: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_indet_sync_ffffffff_491:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 626: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_492:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 627: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_493:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 628: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
	.word 0xd04822c0  ! 629: LDSB_I	ldsb	[%r0 + 0x02c0], %r8
ld_local_deter_sync_ffffffff_494:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 630: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_495:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 631: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
	.word 0xde482240  ! 632: LDSB_I	ldsb	[%r0 + 0x0240], %r15
	.word 0xdc2823c0  ! 633: STB_I	stb	%r14, [%r0 + 0x03c0]
	.word 0xd6502340  ! 634: LDSH_I	ldsh	[%r0 + 0x0340], %r11
	.word 0xd4282340  ! 635: STB_I	stb	%r10, [%r0 + 0x0340]
ld_local_indet_sync_ffffffff_496:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 636: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xdc482240  ! 637: LDSB_I	ldsb	[%r0 + 0x0240], %r14
st_fast_deter_nonsync_ffffffff_497:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 638: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_498:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 639: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_499:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 640: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
	.word 0xd6482380  ! 641: LDSB_I	ldsb	[%r0 + 0x0380], %r11
ld_fast_indet_sync_ffffffff_500:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 642: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_501:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 643: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
ld_local_indet_sync_ffffffff_502:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 644: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_503:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 645: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_504:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 646: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_505:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 647: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xdc482280  ! 648: LDSB_I	ldsb	[%r0 + 0x0280], %r14
ld_fast_deter_sync_ffffffff_506:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd2d84ba0  ! 649: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r9
ld_local_deter_sync_ffffffff_507:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 650: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_deter_sync_ffffffff_508:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 651: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
	.word 0xd6302300  ! 652: STH_I	sth	%r11, [%r0 + 0x0300]
ld_fast_deter_sync_ffffffff_509:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 653: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xde302300  ! 654: STH_I	sth	%r15, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_510:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 655: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
	.word 0xd0482300  ! 656: LDSB_I	ldsb	[%r0 + 0x0300], %r8
ld_local_deter_sync_ffffffff_511:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 657: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
st_fast_deter_nonsync_ffffffff_512:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 658: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_513:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 659: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ld_fast_indet_sync_ffffffff_514:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 660: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_515:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 661: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xd8482380  ! 662: LDSB_I	ldsb	[%r0 + 0x0380], %r12
st_fast_deter_nonsync_ffffffff_516:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 663: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_517:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 664: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_518:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 665: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_519:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 666: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_520:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 667: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_521:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 668: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_522:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 669: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_523:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 670: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_524:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 671: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_525:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 672: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_deter_sync_ffffffff_526:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 673: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
st_fast_deter_nonsync_ffffffff_527:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 674: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_528:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 675: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xd42823c0  ! 676: STB_I	stb	%r10, [%r0 + 0x03c0]
ld_local_indet_sync_ffffffff_529:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 677: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_530:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 678: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_531:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 679: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_532:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdcd84e40  ! 680: LDXA_R	ldxa	[%r1, %r0] 0x72, %r14
ld_fast_deter_sync_ffffffff_533:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xd0d84400  ! 681: LDXA_R	ldxa	[%r1, %r0] 0x20, %r8
st_fast_deter_nonsync_ffffffff_534:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 682: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_535:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 683: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_536:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 684: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_537:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 685: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xd8502280  ! 686: LDSH_I	ldsh	[%r0 + 0x0280], %r12
ld_fast_deter_sync_ffffffff_538:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x58) 
	.word 0xdad84b00  ! 687: LDXA_R	ldxa	[%r1, %r0] 0x58, %r13
st_fast_deter_nonsync_ffffffff_539:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 688: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_540:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 689: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_541:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 690: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_indet_sync_ffffffff_542:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 691: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_543:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 692: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_544:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 693: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_545:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 694: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
	.word 0xde502240  ! 695: LDSH_I	ldsh	[%r0 + 0x0240], %r15
ld_local_indet_sync_ffffffff_546:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 696: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_547:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 697: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_548:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 698: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_549:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 699: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xdc502200  ! 700: LDSH_I	ldsh	[%r0 + 0x0200], %r14
ld_fast_deter_sync_ffffffff_550:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xdcd84980  ! 701: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r14
st_fast_deter_nonsync_ffffffff_551:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 702: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_552:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 703: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd6282200  ! 704: STB_I	stb	%r11, [%r0 + 0x0200]
ld_fast_deter_sync_ffffffff_553:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 705: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
ld_local_indet_sync_ffffffff_554:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 706: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_555:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 707: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_556:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 708: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_indet_sync_ffffffff_557:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 709: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_558:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 710: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_deter_sync_ffffffff_559:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 711: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_560:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 712: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_561:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 713: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
	.word 0xd2282280  ! 714: STB_I	stb	%r9, [%r0 + 0x0280]
ld_fast_indet_sync_ffffffff_562:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 715: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xd62822c0  ! 716: STB_I	stb	%r11, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_563:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 717: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_564:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 718: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_565:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 719: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_566:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 720: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_567:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 721: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_568:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 722: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd8482280  ! 723: LDSB_I	ldsb	[%r0 + 0x0280], %r12
ld_local_indet_sync_ffffffff_569:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 724: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_570:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 725: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_deter_sync_ffffffff_571:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 726: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_572:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 727: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
	.word 0xd83022c0  ! 728: STH_I	sth	%r12, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_573:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 729: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_574:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 730: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
	.word 0xd23022c0  ! 731: STH_I	sth	%r9, [%r0 + 0x02c0]
ld_fast_deter_sync_ffffffff_575:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 732: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_fast_indet_sync_ffffffff_576:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 733: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_577:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 734: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
ld_local_indet_sync_ffffffff_578:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 735: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_579:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 736: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
st_fast_deter_nonsync_ffffffff_580:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 737: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_581:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 738: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_deter_sync_ffffffff_582:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 739: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
	.word 0xd0482340  ! 740: LDSB_I	ldsb	[%r0 + 0x0340], %r8
ld_fast_indet_sync_ffffffff_583:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 741: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_584:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 742: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_585:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 743: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_586:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 744: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_deter_sync_ffffffff_587:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 745: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_deter_sync_ffffffff_588:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 746: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_589:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 747: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
	.word 0xdc482200  ! 748: LDSB_I	ldsb	[%r0 + 0x0200], %r14
ld_fast_indet_sync_ffffffff_590:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 749: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xd0482380  ! 750: LDSB_I	ldsb	[%r0 + 0x0380], %r8
	.word 0xda5023c0  ! 751: LDSH_I	ldsh	[%r0 + 0x03c0], %r13
ld_local_deter_sync_ffffffff_591:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 752: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_indet_sync_ffffffff_592:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 753: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_593:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 754: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_594:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 755: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xd42822c0  ! 756: STB_I	stb	%r10, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_595:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 757: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_596:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 758: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_597:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 759: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_598:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 760: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_599:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xded84980  ! 761: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r15
ld_fast_indet_sync_ffffffff_600:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 762: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_601:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 763: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_602:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 764: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_603:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 765: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_fast_indet_sync_ffffffff_604:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 766: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_605:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 767: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_local_deter_sync_ffffffff_606:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 768: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_local_deter_sync_ffffffff_607:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 769: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_deter_sync_ffffffff_608:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 770: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_deter_sync_ffffffff_609:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 771: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
st_fast_deter_nonsync_ffffffff_610:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 772: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
	.word 0xd45023c0  ! 773: LDSH_I	ldsh	[%r0 + 0x03c0], %r10
	.word 0xdc502380  ! 774: LDSH_I	ldsh	[%r0 + 0x0380], %r14
	.word 0xd2302340  ! 775: STH_I	sth	%r9, [%r0 + 0x0340]
st_fast_deter_nonsync_ffffffff_611:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 776: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_612:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 777: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_613:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 778: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_614:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 779: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_615:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xd8d849e0  ! 780: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r12
st_fast_deter_nonsync_ffffffff_616:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 781: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
	.word 0xdc302300  ! 782: STH_I	sth	%r14, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_617:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 783: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_deter_sync_ffffffff_618:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 784: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_local_deter_sync_ffffffff_619:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 785: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_indet_sync_ffffffff_620:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 786: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_621:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 787: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
	.word 0xd44822c0  ! 788: LDSB_I	ldsb	[%r0 + 0x02c0], %r10
	.word 0xd6282340  ! 789: STB_I	stb	%r11, [%r0 + 0x0340]
	.word 0xdc502300  ! 790: LDSH_I	ldsh	[%r0 + 0x0300], %r14
	.word 0xd0302340  ! 791: STH_I	sth	%r8, [%r0 + 0x0340]
ld_local_indet_sync_ffffffff_622:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 792: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_623:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 793: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_624:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 794: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
st_fast_deter_nonsync_ffffffff_625:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 795: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_626:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 796: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_627:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 797: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_628:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 798: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xd0502300  ! 799: LDSH_I	ldsh	[%r0 + 0x0300], %r8
st_fast_deter_nonsync_ffffffff_629:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 800: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_630:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 801: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_631:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 802: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_632:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 803: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
	.word 0xd64822c0  ! 804: LDSB_I	ldsb	[%r0 + 0x02c0], %r11
ld_local_indet_sync_ffffffff_633:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 805: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_634:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 806: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
	.word 0xd6282200  ! 807: STB_I	stb	%r11, [%r0 + 0x0200]
ld_local_indet_sync_ffffffff_635:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 808: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xdc482240  ! 809: LDSB_I	ldsb	[%r0 + 0x0240], %r14
ld_local_indet_sync_ffffffff_636:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 810: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_637:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 811: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xd6302380  ! 812: STH_I	sth	%r11, [%r0 + 0x0380]
st_fast_deter_nonsync_ffffffff_638:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 813: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xda502240  ! 814: LDSH_I	ldsh	[%r0 + 0x0240], %r13
	.word 0xda2823c0  ! 815: STB_I	stb	%r13, [%r0 + 0x03c0]
st_fast_deter_nonsync_ffffffff_639:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 816: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_640:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 817: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd24822c0  ! 818: LDSB_I	ldsb	[%r0 + 0x02c0], %r9
ld_local_deter_sync_ffffffff_641:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 819: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_indet_sync_ffffffff_642:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 820: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_643:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 821: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_644:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 822: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_645:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 823: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
	.word 0xd25022c0  ! 824: LDSH_I	ldsh	[%r0 + 0x02c0], %r9
st_fast_deter_nonsync_ffffffff_646:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 825: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_647:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 826: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_648:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 827: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_deter_sync_ffffffff_649:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 828: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
ld_fast_deter_sync_ffffffff_650:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xdcd84a00  ! 829: LDXA_R	ldxa	[%r1, %r0] 0x50, %r14
	.word 0xdc482200  ! 830: LDSB_I	ldsb	[%r0 + 0x0200], %r14
	.word 0xd4482240  ! 831: LDSB_I	ldsb	[%r0 + 0x0240], %r10
ld_fast_deter_sync_ffffffff_651:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 832: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_fast_deter_sync_ffffffff_652:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd6d84ba0  ! 833: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r11
ld_local_deter_sync_ffffffff_653:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 834: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_654:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 835: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_local_deter_sync_ffffffff_655:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 836: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd2482340  ! 837: LDSB_I	ldsb	[%r0 + 0x0340], %r9
ld_local_indet_sync_ffffffff_656:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 838: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_657:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 839: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_658:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 840: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_659:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 841: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
	.word 0xda302300  ! 842: STH_I	sth	%r13, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_660:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 843: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_661:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 844: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_662:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 845: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_663:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdad84860  ! 846: LDXA_R	ldxa	[%r1, %r0] 0x43, %r13
ld_fast_deter_sync_ffffffff_664:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xded84420  ! 847: LDXA_R	ldxa	[%r1, %r0] 0x21, %r15
ld_fast_deter_sync_ffffffff_665:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd6d84ba0  ! 848: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r11
ld_fast_deter_sync_ffffffff_666:
	nop
	mov 0x220, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 849: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
st_fast_deter_nonsync_ffffffff_667:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 850: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_668:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 851: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_669:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xdcd84980  ! 852: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r14
ld_local_deter_sync_ffffffff_670:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 853: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_671:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xded84e40  ! 854: LDXA_R	ldxa	[%r1, %r0] 0x72, %r15
	.word 0xd0302280  ! 855: STH_I	sth	%r8, [%r0 + 0x0280]
st_fast_deter_nonsync_ffffffff_672:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 856: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_673:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 857: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
ld_local_deter_sync_ffffffff_674:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 858: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_675:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xdcd84420  ! 859: LDXA_R	ldxa	[%r1, %r0] 0x21, %r14
st_fast_deter_nonsync_ffffffff_676:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 860: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_677:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 861: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_678:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 862: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_679:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 863: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_680:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 864: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
ld_local_indet_sync_ffffffff_681:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 865: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
st_fast_deter_nonsync_ffffffff_682:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 866: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_683:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 867: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_684:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 868: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
st_fast_deter_nonsync_ffffffff_685:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 869: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_686:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 870: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_687:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 871: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
ld_local_indet_sync_ffffffff_688:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 872: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xdc282240  ! 873: STB_I	stb	%r14, [%r0 + 0x0240]
ld_local_deter_sync_ffffffff_689:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 874: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_690:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 875: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_indet_sync_ffffffff_691:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 876: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd8482200  ! 877: LDSB_I	ldsb	[%r0 + 0x0200], %r12
ld_local_indet_sync_ffffffff_692:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 878: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_693:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 879: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_694:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 880: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_695:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xd6d84400  ! 881: LDXA_R	ldxa	[%r1, %r0] 0x20, %r11
ld_local_deter_sync_ffffffff_696:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 882: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
	.word 0xdc482280  ! 883: LDSB_I	ldsb	[%r0 + 0x0280], %r14
ld_fast_deter_sync_ffffffff_697:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 884: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
ld_fast_indet_sync_ffffffff_698:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 885: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_699:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdcd84a00  ! 886: LDXA_R	ldxa	[%r1, %r0] 0x50, %r14
ld_fast_indet_sync_ffffffff_700:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 887: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_701:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 888: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xd0302280  ! 889: STH_I	sth	%r8, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_702:
	nop
	mov 0x118, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 890: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
st_fast_deter_nonsync_ffffffff_703:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 891: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_704:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd8d84b00  ! 892: LDXA_R	ldxa	[%r1, %r0] 0x58, %r12
	.word 0xd6282380  ! 893: STB_I	stb	%r11, [%r0 + 0x0380]
	.word 0xd8482200  ! 894: LDSB_I	ldsb	[%r0 + 0x0200], %r12
	.word 0xdc502200  ! 895: LDSH_I	ldsh	[%r0 + 0x0200], %r14
ld_fast_indet_sync_ffffffff_705:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 896: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_706:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 897: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_707:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 898: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_708:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 899: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_deter_sync_ffffffff_709:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdcd84e40  ! 900: LDXA_R	ldxa	[%r1, %r0] 0x72, %r14
ld_fast_deter_sync_ffffffff_710:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x54) 
	.word 0xd6d84a80  ! 901: LDXA_R	ldxa	[%r1, %r0] 0x54, %r11
st_fast_deter_nonsync_ffffffff_711:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 902: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_712:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 903: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xde502240  ! 904: LDSH_I	ldsh	[%r0 + 0x0240], %r15
	.word 0xd2482240  ! 905: LDSB_I	ldsb	[%r0 + 0x0240], %r9
ld_local_indet_sync_ffffffff_713:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 906: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_714:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 907: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_715:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 908: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_716:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 909: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
ld_local_indet_sync_ffffffff_717:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 910: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xda282340  ! 911: STB_I	stb	%r13, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_718:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 912: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_719:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 913: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_720:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 914: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_721:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 915: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xdc302200  ! 916: STH_I	sth	%r14, [%r0 + 0x0200]
ld_fast_deter_sync_ffffffff_722:
	nop
	mov 0x58, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 917: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
ld_local_deter_sync_ffffffff_723:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 918: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
st_fast_deter_nonsync_ffffffff_724:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 919: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_725:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xdcd849e0  ! 920: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r14
ld_fast_indet_sync_ffffffff_726:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 921: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_727:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 922: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_728:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd8d84a00  ! 923: LDXA_R	ldxa	[%r1, %r0] 0x50, %r12
	.word 0xd8302340  ! 924: STH_I	sth	%r12, [%r0 + 0x0340]
st_fast_deter_nonsync_ffffffff_729:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 925: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_730:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 926: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xda282200  ! 927: STB_I	stb	%r13, [%r0 + 0x0200]
	.word 0xdc282200  ! 928: STB_I	stb	%r14, [%r0 + 0x0200]
ld_fast_indet_sync_ffffffff_731:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 929: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd4282300  ! 930: STB_I	stb	%r10, [%r0 + 0x0300]
	.word 0xd0282340  ! 931: STB_I	stb	%r8, [%r0 + 0x0340]
ld_fast_deter_sync_ffffffff_732:
	nop
	mov 0x70, %r1 	! (VA for ASI 0x54) 
	.word 0xdad84a80  ! 932: LDXA_R	ldxa	[%r1, %r0] 0x54, %r13
ld_fast_deter_sync_ffffffff_733:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd4d844a0  ! 933: LDXA_R	ldxa	[%r1, %r0] 0x25, %r10
	.word 0xd8482280  ! 934: LDSB_I	ldsb	[%r0 + 0x0280], %r12
ld_local_indet_sync_ffffffff_734:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 935: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_735:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 936: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_736:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 937: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xda482340  ! 938: LDSB_I	ldsb	[%r0 + 0x0340], %r13
ld_local_deter_sync_ffffffff_737:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 939: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_738:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 940: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
ld_fast_indet_sync_ffffffff_739:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 941: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xde282200  ! 942: STB_I	stb	%r15, [%r0 + 0x0200]
ld_fast_indet_sync_ffffffff_740:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 943: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_741:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 944: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_local_deter_sync_ffffffff_742:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 945: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_local_indet_sync_ffffffff_743:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 946: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd0282240  ! 947: STB_I	stb	%r8, [%r0 + 0x0240]
ld_fast_indet_sync_ffffffff_744:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 948: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_745:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 949: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_746:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 950: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_747:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 951: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_748:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 952: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
ld_fast_deter_sync_ffffffff_749:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 953: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
	.word 0xdc482240  ! 954: LDSB_I	ldsb	[%r0 + 0x0240], %r14
ld_fast_deter_sync_ffffffff_750:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd6d848a0  ! 955: LDXA_R	ldxa	[%r1, %r0] 0x45, %r11
	.word 0xd6482300  ! 956: LDSB_I	ldsb	[%r0 + 0x0300], %r11
ld_local_deter_sync_ffffffff_751:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 957: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_752:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 958: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_753:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 959: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xda482200  ! 960: LDSB_I	ldsb	[%r0 + 0x0200], %r13
	.word 0xd0282200  ! 961: STB_I	stb	%r8, [%r0 + 0x0200]
ld_local_indet_sync_ffffffff_754:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 962: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_755:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 963: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_756:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 964: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_757:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 965: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd6282200  ! 966: STB_I	stb	%r11, [%r0 + 0x0200]
	.word 0xdc4823c0  ! 967: LDSB_I	ldsb	[%r0 + 0x03c0], %r14
ld_local_indet_sync_ffffffff_758:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 968: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_759:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 969: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_indet_sync_ffffffff_760:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 970: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_761:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 971: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
	.word 0xd23023c0  ! 972: STH_I	sth	%r9, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_762:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 973: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_763:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 974: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_764:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 975: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd8482380  ! 976: LDSB_I	ldsb	[%r0 + 0x0380], %r12
st_fast_deter_nonsync_ffffffff_765:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 977: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_766:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 978: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_767:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 979: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_768:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 980: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
ld_local_deter_sync_ffffffff_769:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 981: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
st_fast_deter_nonsync_ffffffff_770:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 982: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_771:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 983: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_772:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 984: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xd6502280  ! 985: LDSH_I	ldsh	[%r0 + 0x0280], %r11
st_fast_deter_nonsync_ffffffff_773:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 986: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
	.word 0xd2302300  ! 987: STH_I	sth	%r9, [%r0 + 0x0300]
ld_fast_indet_sync_ffffffff_774:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 988: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_775:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 989: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_776:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 990: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_777:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 991: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd8302380  ! 992: STH_I	sth	%r12, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_778:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 993: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_779:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 994: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_780:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 995: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
st_fast_deter_nonsync_ffffffff_781:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 996: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_782:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 997: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_783:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 998: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_784:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 999: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_785:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 1000: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop
# include "err_handlers.s"

main_data_start:
.xword 0xc2e8dd9a13daa8d9
.xword 0x11d5b9d95ba19c1f
.xword 0x1b9537ba6720d7d0
.xword 0x31c77c82ad37af49
.xword 0x9315405a490b1d6a
.xword 0x3cfe56f256ab60bf
.xword 0x97fa454ab5276bc5
.xword 0xc088948caffabbfa
.xword 0xa39972596f944a13
.xword 0x7adc0a75163aae35
.xword 0x2e00bf0ad842901d
.xword 0xad2ffc52c3aef388
.xword 0xb5dc0ce755ee7a9d
.xword 0x04406f0ce77c2fdc
.xword 0x9782a3501f8c228c
.xword 0x4546d807e854cc92
.xword 0x20ffe892c6d88b6a
.xword 0x826ff1ca8042e473
.xword 0xb39bf3e8f714e67c
.xword 0xa8749bbcceb48cf6
.xword 0xb334ac13d56e5d51
.xword 0xafa2a9fb00334e9c
.xword 0x89617e8bc1103b62
.xword 0x072cd80a23f65ecf
.xword 0x1897f64694f488c5
.xword 0x982dfdd6f2359df9
.xword 0x76fca687553cf49a
.xword 0x5b81870bb1721b89
.xword 0x6082153a0bc495fb
.xword 0x74126e60757f3bd9
.xword 0x9e345ce41bbfdcd0
.xword 0x677b55f116ebe1b9
.xword 0x94b924223428f7cd
.xword 0x8a6d5218b3556ede
.xword 0xad0afaa6a85ac1ee
.xword 0x4509f6ea2b3216ef
.xword 0x5de8e8be988c465e
.xword 0xbb28f616b4368c9c
.xword 0x83a56feaca3a35c3
.xword 0x125a80fa45b0dac3
.xword 0x6d185620258be685
.xword 0xd06e4c9b32073007
.xword 0xa4f6b003152e3424
.xword 0x6dc32679f7a46bd1
.xword 0x0ff9e51934c2e7b5
.xword 0x6a384ded3c928aed
.xword 0x2798237569a4bd0f
.xword 0x7bc19952fc0d18ae
.xword 0x48570e636f01d392
.xword 0x886486eb67eb1e56
.xword 0x4bf6ea2e562f188f
.xword 0xde5ed7402d3c148d
.xword 0x8189494572b1e609
.xword 0xa398f0f4dc24478f
.xword 0x08b627c98f8cfdb5
.xword 0x5beb07da86726630
.xword 0x2c72c74eec9d288a
.xword 0x77b6439ea0433792
.xword 0x5af1e51d0df3e35e
.xword 0x67657943a4cbd875
.xword 0x7c79d527db94822c
.xword 0xde3971b12eb59738
.xword 0xb4c0f0556825daa5
.xword 0x8f5c7a0597861c62
.xword 0xee371443ef6f3b6a
.xword 0xd1a9260055d30246
.xword 0xdfe968e8a6c82aa6
.xword 0x5ec13bd4a2bca8b4
.xword 0x5e1ac88bb99f6b90
.xword 0xe50f21461c137457
.xword 0xb444f0cf66913db6
.xword 0xd76435a751f46ae6
.xword 0xc928c87a6aee95d8
.xword 0x83de6ad76794532a
.xword 0x71eb93c5aed5a5e6
.xword 0x6835e66b4c0ad691
.xword 0xddf9a9c0cbede149
.xword 0x221f040f0bf0a362
.xword 0x2e60f969d789375d
.xword 0xbd5565e34ba26e93
.xword 0x29ef13ef5e0a6a15
.xword 0x5e8c2004a4a610db
.xword 0xdd21ae6156f65ef0
.xword 0xe53d0e7b47c4848f
.xword 0xefce9c415a3f86e0
.xword 0xca380e55aaf01f3b
.xword 0xc9d5a9c6b8b2a26f
.xword 0xd93af09fbd98a959
.xword 0x868673a77f4942c6
.xword 0xbc44503d7ad295fb
.xword 0xb2447409e9a0b57f
.xword 0x1a3fc0f9270754b5
.xword 0xf17f5a1d5b0371d3
.xword 0x2d9568988afba50b
.xword 0x75b062991e36e778
.xword 0x763d9e09b8dc5a5b



SECTION .PRIM_SEG_0 DATA_VA = 0x0000005abcc00000
attr_data {
	Name	 = .PRIM_SEG_0,
	VA	 = 0x0000005abcc00000,
	RA	 = 0x0000005abcc00000,
	PA	 = ra2pa(0x0000005abcc00000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA0_START
MEM_DATA0_START:
.xword 0xd9aeea57e9a93c82

.xword 0x1ac20df3c01d1c81

.xword 0x2a13de27d7b527a3

.xword 0x01edf1081c1eb889

.xword 0x7cf665259305f54d

.xword 0xf3eadf5110218d1a

.xword 0x5e88a7a261a7193a

.xword 0xfb4571b99b1fe188

.xword 0x376e02496af50251

.xword 0x03bba86462b9f674

.xword 0x75ae7ab103872ffa

.xword 0x6bbad894ffc2a025

.xword 0xd1a5d8dcbe740532

.xword 0xae621d493e219452

.xword 0x72bda3ff51ae0c96

.xword 0x5de6571ea7e199bb

.xword 0x1887bff3bc4353b8

.xword 0xbf3a4e73813a3eb7

.xword 0x91b2a89a8f975fe3

.xword 0xce3fa33d4d763e6f

.xword 0x27d8e6c3a5ad804c

.xword 0x3fbfd3be4a2e4af6

.xword 0x8417fb9ed9499b5c

.xword 0xf10ad709de134782

.xword 0x86c097a5ee4dfbfb

.xword 0x96d2974b400baa1d

.xword 0xc0816b9a9596659c

.xword 0xd46f88f2bc26eb9e

.xword 0x4db8ff87f8f33771

.xword 0xdb5c57bec8183024

.xword 0xdac60d052a73caae

.xword 0x73799c6c1ee20948




SECTION .PRIM_SEG_1 DATA_VA = 0x0000005abcc04000
attr_data {
	Name	 = .PRIM_SEG_1,
	VA	 = 0x0000005abcc04000,
	RA	 = 0x0000005abcc04000,
	PA	 = ra2pa(0x0000005abcc04000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA1_START
MEM_DATA1_START:
.xword 0x66a2755b65dfa00b
.xword 0xcbd03d128d1ec47d
.xword 0xed5cfb5e914d4dcf
.xword 0x26e8de584a1b6204
.xword 0xe195ae26fb9a66db
.xword 0x75ae598091aa9408
.xword 0x0b727221649f893f
.xword 0xcff3d932d3db563d
.xword 0x749184b171a44989




SECTION .PRIM_SEG_2 DATA_VA = 0x0000005abcc08000
attr_data {
	Name	 = .PRIM_SEG_2,
	VA	 = 0x0000005abcc08000,
	RA	 = 0x0000005abcc08000,
	PA	 = ra2pa(0x0000005abcc08000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA2_START
MEM_DATA2_START:
.xword 0x139cd74eade34f5c
.xword 0xdf45685e8d21b13e
.xword 0xf3829b85d55ed52b
.xword 0x34f29e235c7cc7e0
.xword 0x545a0730dca83305
.xword 0x5386db00dc7f9346
.xword 0x46fcebb51d00428a
.xword 0x5db6c82646ef1711
.xword 0x1ab8d3c56ade1b1d




SECTION .PRIM_SEG_3 DATA_VA = 0x0000005abcc0c000
attr_data {
	Name	 = .PRIM_SEG_3,
	VA	 = 0x0000005abcc0c000,
	RA	 = 0x0000005abcc0c000,
	PA	 = ra2pa(0x0000005abcc0c000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA3_START
MEM_DATA3_START:
.xword 0x53635a26fe8609a3
.xword 0x57647bf7ae0a091d
.xword 0x6d3122e2a5f62079
.xword 0x1900bb8210f1595a
.xword 0x3e9fe534f9e167d4
.xword 0x1dbd6765d034e1e5
.xword 0xb170a2d52fd1b492
.xword 0x1b11c5bbc075a541
.xword 0xf351273e48c193e0




SECTION .PRIM_SEG_4 DATA_VA = 0x0000005abcc10000
attr_data {
	Name	 = .PRIM_SEG_4,
	VA	 = 0x0000005abcc10000,
	RA	 = 0x0000005abcc10000,
	PA	 = ra2pa(0x0000005abcc10000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA4_START
MEM_DATA4_START:
.xword 0x6318f2613357717f
.xword 0xf1ff9f82179e53b6
.xword 0x070673985d1b5511
.xword 0x0f7f8b267f0dfab9
.xword 0xb46a978f91f8a4b1
.xword 0xb6c7492c5ff79d76
.xword 0x82bbf23687e65e20
.xword 0x96a4379f8faa65cf
.xword 0x3c08229ed0931691




SECTION .PRIM_SEG_5 DATA_VA = 0x0000005abcc14000
attr_data {
	Name	 = .PRIM_SEG_5,
	VA	 = 0x0000005abcc14000,
	RA	 = 0x0000005abcc14000,
	PA	 = ra2pa(0x0000005abcc14000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA5_START
MEM_DATA5_START:
.xword 0xd50c6fd5ef9e43ef
.xword 0x9cb87c223f16bb9b
.xword 0x25cb6348a2cddafe
.xword 0x0379ee5d907ca27d
.xword 0x8bf705288999e9c3
.xword 0xe6554b5c8b82446c
.xword 0xfe0a76283e44280e
.xword 0x0baf6c429402a303
.xword 0xd16ac02210dbfe1b




SECTION .PRIM_SEG_6 DATA_VA = 0x0000005abcc18000
attr_data {
	Name	 = .PRIM_SEG_6,
	VA	 = 0x0000005abcc18000,
	RA	 = 0x0000005abcc18000,
	PA	 = ra2pa(0x0000005abcc18000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA6_START
MEM_DATA6_START:
.xword 0xfbbb9fb01ac2033e
.xword 0x014445aa64ff4d0d
.xword 0x15fbed565de96d36
.xword 0x1fa95a8904951116
.xword 0xe840240e4005c7a7
.xword 0xeabf74b65628f29b
.xword 0x99eea0a61d1a1e54
.xword 0xb4abcf417eaa3a83
.xword 0x9977d50a088aaafe




SECTION .PRIM_SEG_7 DATA_VA = 0x0000005abcc1c000
attr_data {
	Name	 = .PRIM_SEG_7,
	VA	 = 0x0000005abcc1c000,
	RA	 = 0x0000005abcc1c000,
	PA	 = ra2pa(0x0000005abcc1c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA7_START
MEM_DATA7_START:
.xword 0x139a9beb303b9780
.xword 0x11c5b73049fc9b27
.xword 0xb8a8da9562260524
.xword 0x8959c1cc601f428a
.xword 0x6f5a98f15b68caa1
.xword 0x113330721d5be5ee
.xword 0xb0e048750ecbd679
.xword 0xfbd1383456b4b909
.xword 0x2edec2b9a67f12e2




SECTION .PRIM_SEG_8 DATA_VA = 0x0000005abcc20000
attr_data {
	Name	 = .PRIM_SEG_8,
	VA	 = 0x0000005abcc20000,
	RA	 = 0x0000005abcc20000,
	PA	 = ra2pa(0x0000005abcc20000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA8_START
MEM_DATA8_START:
.xword 0x37580e67d82f0b69
.xword 0xc50bce18c35b1f42
.xword 0xcd455adaa18f2ca1
.xword 0x88a47478ac1b1e47
.xword 0x9d462db3392eaeb2
.xword 0xf42d5a5733d525c2
.xword 0x9ad0d32f315e23c7
.xword 0x63ff84e734ab22a7
.xword 0x8ab1ca4fd58475a4




SECTION .PRIM_SEG_9 DATA_VA = 0x0000005abcc24000
attr_data {
	Name	 = .PRIM_SEG_9,
	VA	 = 0x0000005abcc24000,
	RA	 = 0x0000005abcc24000,
	PA	 = ra2pa(0x0000005abcc24000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA9_START
MEM_DATA9_START:
.xword 0x97b201967f09c545
.xword 0x26e1e07e58d0b685
.xword 0x97e83f45fb4c0862
.xword 0x63d849bc37ce10c1
.xword 0x573708f63d64a64b
.xword 0xbf828548df5c57cd
.xword 0xc0253b7bef03b620
.xword 0x9693bddc542c0b35
.xword 0x5a2b1459846374f9




SECTION .PRIM_SEG_10 DATA_VA = 0x0000005abcc28000
attr_data {
	Name	 = .PRIM_SEG_10,
	VA	 = 0x0000005abcc28000,
	RA	 = 0x0000005abcc28000,
	PA	 = ra2pa(0x0000005abcc28000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA10_START
MEM_DATA10_START:
.xword 0x0070b3850b4fd3b1
.xword 0x8b9546895a2fbacc
.xword 0xc6f03d16fd6dd2e1
.xword 0xf4ad13628cd2cfa4
.xword 0xcf0cddd247471ab8
.xword 0x5424c23d86fbb9bd
.xword 0x881d3a96c7e6ecc2
.xword 0x11bd799143c914da
.xword 0x42cced4762a34bf4




SECTION .PRIM_SEG_11 DATA_VA = 0x0000005abcc2c000
attr_data {
	Name	 = .PRIM_SEG_11,
	VA	 = 0x0000005abcc2c000,
	RA	 = 0x0000005abcc2c000,
	PA	 = ra2pa(0x0000005abcc2c000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA11_START
MEM_DATA11_START:
.xword 0xb77cd92d12c65e65
.xword 0x80ea3c5667db2970
.xword 0xdb42af327397137e
.xword 0xa9f1abedc3911099
.xword 0xf92632bd2303fcd6
.xword 0xba732024efe54f7d
.xword 0xe1baf9bd20cb2936
.xword 0x2284b55a988ae5f2
.xword 0xb03d2810d5170d86




SECTION .PRIM_SEG_12 DATA_VA = 0x0000005abcc30000
attr_data {
	Name	 = .PRIM_SEG_12,
	VA	 = 0x0000005abcc30000,
	RA	 = 0x0000005abcc30000,
	PA	 = ra2pa(0x0000005abcc30000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA12_START
MEM_DATA12_START:
.xword 0x144ccb90d5750631
.xword 0x5af50d6517d13fe5
.xword 0x027b09ed90aa2c44
.xword 0x0dc765a853269e5c
.xword 0x737832dd186d6225
.xword 0x4ce6b4044d964bc4
.xword 0x09229e5d1f5bcbb1
.xword 0xa631dc5fd5ecb6df
.xword 0x7df403a6614f9d75




SECTION .PRIM_SEG_13 DATA_VA = 0x0000005abcc34000
attr_data {
	Name	 = .PRIM_SEG_13,
	VA	 = 0x0000005abcc34000,
	RA	 = 0x0000005abcc34000,
	PA	 = ra2pa(0x0000005abcc34000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA13_START
MEM_DATA13_START:
.xword 0x3acffdad34db54c2
.xword 0x8f0768d052027b48
.xword 0xd1eaedc1ba3d8cb6
.xword 0xcfd54f796955a762
.xword 0xe451b5e40d24c872
.xword 0x13920caa8b3a8925
.xword 0x6205a08800d5eed9
.xword 0x5ee50d1deb54dda1
.xword 0xb0bfa519a53da144




SECTION .PRIM_SEG_14 DATA_VA = 0x0000005abcc38000
attr_data {
	Name	 = .PRIM_SEG_14,
	VA	 = 0x0000005abcc38000,
	RA	 = 0x0000005abcc38000,
	PA	 = ra2pa(0x0000005abcc38000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA14_START
MEM_DATA14_START:
.xword 0xb0ffb3fb6cb121af
.xword 0xd2310c31aed2dec6
.xword 0xea3a2ca9c7dd2171
.xword 0x1fbf9ee7206a6069
.xword 0x686d894a41a972fb
.xword 0xa5177c50e035fd62
.xword 0x7f8508563a411ce6
.xword 0xb6617e03d3ab8afc
.xword 0x05a5462079241451




SECTION .PRIM_SEG_15 DATA_VA = 0x0000005abcc3c000
attr_data {
	Name	 = .PRIM_SEG_15,
	VA	 = 0x0000005abcc3c000,
	RA	 = 0x0000005abcc3c000,
	PA	 = ra2pa(0x0000005abcc3c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA15_START
MEM_DATA15_START:
.xword 0x7c9bed5816795f7c
.xword 0x3292b52252a21235
.xword 0x34e0a3f868c6de06
.xword 0xed8ab3fcf95456f4
.xword 0xabba49f99ca7c14c
.xword 0x509cb17812f0d28f
.xword 0xeda647e67dbcc023
.xword 0x620a1dd085c7a540
.xword 0x5fbada1e9485f220




SECTION .PRIM_SEG_16 DATA_VA = 0x0000005abcc40000
attr_data {
	Name	 = .PRIM_SEG_16,
	VA	 = 0x0000005abcc40000,
	RA	 = 0x0000005abcc40000,
	PA	 = ra2pa(0x0000005abcc40000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA16_START
MEM_DATA16_START:
.xword 0x2a7ea22d4159184e
.xword 0xed424b8b01f093cc
.xword 0xf1b100ba479e37a8
.xword 0x3a9d945d524b12c6
.xword 0x21193e0ce5a261ff
.xword 0xae2da6bf6a16858c
.xword 0x6014b4d6e7ea9e43
.xword 0xcb8c183c9e3aba62
.xword 0x92cc252d25f13735




SECTION .PRIM_SEG_17 DATA_VA = 0x0000005abcc44000
attr_data {
	Name	 = .PRIM_SEG_17,
	VA	 = 0x0000005abcc44000,
	RA	 = 0x0000005abcc44000,
	PA	 = ra2pa(0x0000005abcc44000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA17_START
MEM_DATA17_START:
.xword 0xab08ae8d2fb26bcf
.xword 0xfb561cb746e6d543
.xword 0xaf92b22c298ed779
.xword 0x42be9368749cd8b7
.xword 0xc199f03c84c729c2
.xword 0xf39796d709e6066f
.xword 0xdfe9564483319b43
.xword 0x4e0592f8b78a6eda
.xword 0x9f540ef5f78700fb




SECTION .PRIM_SEG_18 DATA_VA = 0x0000005abcc48000
attr_data {
	Name	 = .PRIM_SEG_18,
	VA	 = 0x0000005abcc48000,
	RA	 = 0x0000005abcc48000,
	PA	 = ra2pa(0x0000005abcc48000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA18_START
MEM_DATA18_START:
.xword 0x1418a9480ff3cdc4
.xword 0x5a9be9004aa322c0
.xword 0xf284eea781325849
.xword 0xe4e8f7e16a4c1d05
.xword 0x2da9f1c9114523eb
.xword 0x0f2711b09f90d8cc
.xword 0x6c895952fa13b0c1
.xword 0x1336557a17f27f8a
.xword 0x0d8e52fbcd10afcd




SECTION .PRIM_SEG_19 DATA_VA = 0x0000005abcc4c000
attr_data {
	Name	 = .PRIM_SEG_19,
	VA	 = 0x0000005abcc4c000,
	RA	 = 0x0000005abcc4c000,
	PA	 = ra2pa(0x0000005abcc4c000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA19_START
MEM_DATA19_START:
.xword 0xe0f854e8641fcb40
.xword 0x85cad724f351c693
.xword 0xa2a4180463288909
.xword 0x2514d951e700f91d
.xword 0x2f92c86a3436c53e
.xword 0x4f63d18eaa3770c8
.xword 0x266cf9b5a7aa5c1b
.xword 0x9bae8b2c182107d0
.xword 0xec88ea9e251d6c35




SECTION .PRIM_SEG_20 DATA_VA = 0x0000005abcc50000
attr_data {
	Name	 = .PRIM_SEG_20,
	VA	 = 0x0000005abcc50000,
	RA	 = 0x0000005abcc50000,
	PA	 = ra2pa(0x0000005abcc50000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA20_START
MEM_DATA20_START:
.xword 0xad6ec43c06c98ef0
.xword 0xadd6d43deffcbe32
.xword 0x29cc7b60fc03d208
.xword 0x0927fa55fbb63d9c
.xword 0x14e8e4975c97633f
.xword 0x00a25404e51bec9a
.xword 0xeed784188f1f184e
.xword 0x36b51f9f1c26a7f7
.xword 0xabb170951cc0b0bc




SECTION .PRIM_SEG_21 DATA_VA = 0x0000005abcc54000
attr_data {
	Name	 = .PRIM_SEG_21,
	VA	 = 0x0000005abcc54000,
	RA	 = 0x0000005abcc54000,
	PA	 = ra2pa(0x0000005abcc54000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA21_START
MEM_DATA21_START:
.xword 0xd882320e6c1b5d60
.xword 0x8eb2ba8bb153ea81
.xword 0xf4749f99db26b886
.xword 0xe8b6f825056db874
.xword 0xf60d04485bc75b09
.xword 0x6718b5e300bbf220
.xword 0x1428547ec62088a3
.xword 0x3f33a8515adabe9a
.xword 0x197dd1f370c29d2f




SECTION .PRIM_SEG_22 DATA_VA = 0x0000005abcc58000
attr_data {
	Name	 = .PRIM_SEG_22,
	VA	 = 0x0000005abcc58000,
	RA	 = 0x0000005abcc58000,
	PA	 = ra2pa(0x0000005abcc58000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA22_START
MEM_DATA22_START:
.xword 0x2874189b8742274f
.xword 0xcf3a19552854d7a0
.xword 0x6adc1522cb54a0a0
.xword 0x1d29cc5c0d7959e6
.xword 0x8e1ddf71b18c9843
.xword 0x095d9defc732f83a
.xword 0x99a06cf75a8156f3
.xword 0x9acff393272d2c23
.xword 0xbd315ca317f1a317




SECTION .PRIM_SEG_23 DATA_VA = 0x0000005abcc5c000
attr_data {
	Name	 = .PRIM_SEG_23,
	VA	 = 0x0000005abcc5c000,
	RA	 = 0x0000005abcc5c000,
	PA	 = ra2pa(0x0000005abcc5c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA23_START
MEM_DATA23_START:
.xword 0xb6fa7fd6e047827a
.xword 0xcf9198119e142a40
.xword 0x9222b7e3f8a2f76a
.xword 0x13def620459f2c70
.xword 0xd00652df29d1cbe8
.xword 0x8f6442cf33423cfe
.xword 0x96b3c1344e255ac0
.xword 0xd918577673f9444b
.xword 0x33fdd34a8f1c063e




SECTION .PRIM_SEG_24 DATA_VA = 0x0000005abcc60000
attr_data {
	Name	 = .PRIM_SEG_24,
	VA	 = 0x0000005abcc60000,
	RA	 = 0x0000005abcc60000,
	PA	 = ra2pa(0x0000005abcc60000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA24_START
MEM_DATA24_START:
.xword 0x6ea023aab6c1906d
.xword 0x7ef4414fdff4ff28
.xword 0xbdb49441dac09877
.xword 0x9b9bf5609e411d0c
.xword 0x96236018f8d6a485
.xword 0xa8bab8c010785b67
.xword 0xcdab55947036e04b
.xword 0xe6a8f3f20627db63
.xword 0x652835317096b5d6




SECTION .PRIM_SEG_25 DATA_VA = 0x0000005abcc64000
attr_data {
	Name	 = .PRIM_SEG_25,
	VA	 = 0x0000005abcc64000,
	RA	 = 0x0000005abcc64000,
	PA	 = ra2pa(0x0000005abcc64000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA25_START
MEM_DATA25_START:
.xword 0x057b19eecd40e332
.xword 0xc51df8a5c1363263
.xword 0x16cf4ce4d3d18ade
.xword 0xb37caae136ddc6d5
.xword 0x234ec806461fea28
.xword 0xd77c0fbbc73a35b3
.xword 0x170d3eb5b50500b5
.xword 0x6deb59c63e95df41
.xword 0x2340abf6d32afa9c




SECTION .PRIM_SEG_26 DATA_VA = 0x0000005abcc68000
attr_data {
	Name	 = .PRIM_SEG_26,
	VA	 = 0x0000005abcc68000,
	RA	 = 0x0000005abcc68000,
	PA	 = ra2pa(0x0000005abcc68000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA26_START
MEM_DATA26_START:
.xword 0x1c716b5fd6fc686c
.xword 0x77babde01297ea0e
.xword 0x7d6a48edc0a9673a
.xword 0x91f75ce5a3cd724b
.xword 0x2ed032bf04af322b
.xword 0x38ef2ecc259b3014
.xword 0xffb780551c5dd8d1
.xword 0xccc7b294f65017aa
.xword 0xb3c541ac4ac90729




SECTION .PRIM_SEG_27 DATA_VA = 0x0000005abcc6c000
attr_data {
	Name	 = .PRIM_SEG_27,
	VA	 = 0x0000005abcc6c000,
	RA	 = 0x0000005abcc6c000,
	PA	 = ra2pa(0x0000005abcc6c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA27_START
MEM_DATA27_START:
.xword 0xd5ec7ebbcadffe26
.xword 0xa0c5a5686ee5a8f4
.xword 0x7d26af1ef17d100c
.xword 0x05cfdc58f1109596
.xword 0x69ed660150b8b570
.xword 0x8a735c357b421dc8
.xword 0x0d1157029a1737ad
.xword 0x554dbe22acca2d74
.xword 0x99f531550984abeb




SECTION .PRIM_SEG_28 DATA_VA = 0x0000005abcc70000
attr_data {
	Name	 = .PRIM_SEG_28,
	VA	 = 0x0000005abcc70000,
	RA	 = 0x0000005abcc70000,
	PA	 = ra2pa(0x0000005abcc70000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA28_START
MEM_DATA28_START:
.xword 0x9ed3e1ebc16c768e
.xword 0x7360806402cfe974
.xword 0x47475fa6a0061def
.xword 0x7452b00059e31781
.xword 0x29080bf89ba14df4
.xword 0xf4bcc139097c81c1
.xword 0x4efc39b8d1152117
.xword 0xb06eac2ce7cf6b6e
.xword 0xacf9e9aca018771d




SECTION .PRIM_SEG_29 DATA_VA = 0x0000005abcc74000
attr_data {
	Name	 = .PRIM_SEG_29,
	VA	 = 0x0000005abcc74000,
	RA	 = 0x0000005abcc74000,
	PA	 = ra2pa(0x0000005abcc74000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA29_START
MEM_DATA29_START:
.xword 0x1942d293ec9b7b3c
.xword 0xe787612f7ad5c147
.xword 0xd112e76a13729cf7
.xword 0xb6273623967b019b
.xword 0xd39a03104bbc1bad
.xword 0x4a87836e78999bfd
.xword 0x3281406ed52c9f01
.xword 0x12b920c1122dc288
.xword 0x3395ee809b5e24c6




SECTION .PRIM_SEG_30 DATA_VA = 0x0000005abcc78000
attr_data {
	Name	 = .PRIM_SEG_30,
	VA	 = 0x0000005abcc78000,
	RA	 = 0x0000005abcc78000,
	PA	 = ra2pa(0x0000005abcc78000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA30_START
MEM_DATA30_START:
.xword 0x146196781b5e580c
.xword 0xaeee3ed7d27f42fd
.xword 0x0702b940d5586356
.xword 0x8ae53179e3de34bf
.xword 0x08697dcaad7f8bf3
.xword 0xf31966c70518677c
.xword 0x1a7549b40cefc983
.xword 0x0d5b3682174a5c49
.xword 0x00c5cb4386e2e83e




SECTION .PRIM_SEG_31 DATA_VA = 0x0000005abcc7c000
attr_data {
	Name	 = .PRIM_SEG_31,
	VA	 = 0x0000005abcc7c000,
	RA	 = 0x0000005abcc7c000,
	PA	 = ra2pa(0x0000005abcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA31_START
MEM_DATA31_START:
.xword 0xdb0dca82b8bd295a
.xword 0xeac3699be996c8ca
.xword 0xd5a03703cb5b382c
.xword 0xe659f8d5b5c0ce3f
.xword 0x6c4d9ed1586c71bc
.xword 0x140f44fa152d0bcd
.xword 0x6788fcb29b6fc5ff
.xword 0xcb19a9509fb0ecf3
.xword 0x73b0debf13c5379e






SECTION .NCPRI_SEG_0 DATA_VA = 0x0000006def080000
attr_data {
	Name	 = .NCPRI_SEG_0,
	VA	 = 0x0000006def080000,
	RA	 = 0x0000004123400000,
	PA	 = ra2pa(0x0000004123400000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x4197b50fe0beea53
.xword 0x7df1bd0ac29a7199
.xword 0xe23b6eed39ed80e4
.xword 0x86e7cc545fe360f4
.xword 0xa4514b98a0a71315
.xword 0x15ecad95a811c6b3
.xword 0x98d734b64659c2ac
.xword 0x92c2d9570a9e6b40



SECTION .NCPRI_SEG_1 DATA_VA = 0x0000006def084000
attr_data {
	Name	 = .NCPRI_SEG_1,
	VA	 = 0x0000006def084000,
	RA	 = 0x0000004123402000,
	PA	 = ra2pa(0x0000004123402000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x67380a06659da220
.xword 0x03474ebbc4aab08c
.xword 0x5e3deaf006fe8b98
.xword 0xeeb030d556cf139c
.xword 0x95c3d89222923425
.xword 0x2f4983985c492156
.xword 0x435a942b85e38250
.xword 0x838dd12573bdaeb7



SECTION .NCPRI_SEG_2 DATA_VA = 0x0000006def088000
attr_data {
	Name	 = .NCPRI_SEG_2,
	VA	 = 0x0000006def088000,
	RA	 = 0x0000004123404000,
	PA	 = ra2pa(0x0000004123404000,0),
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

.xword 0xc69d52f365603ea8
.xword 0xb5605461a1e4b5d4
.xword 0x5c4ea71fa6984559
.xword 0x6f5be84a171430b3
.xword 0xe527592cd39c8d38
.xword 0x38eb3dda4416c962
.xword 0xdefc25f23c816926
.xword 0x19a875a1b0adb9b6



SECTION .NCPRI_SEG_3 DATA_VA = 0x0000006def08c000
attr_data {
	Name	 = .NCPRI_SEG_3,
	VA	 = 0x0000006def08c000,
	RA	 = 0x0000004123406000,
	PA	 = ra2pa(0x0000004123406000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xe7570dc25f4671ee
.xword 0x09c9de5751da5c5e
.xword 0xb0522dd93f31f0fa
.xword 0x5272aa0b62926ba7
.xword 0xf857355e656f0f24
.xword 0x236af514da5ce750
.xword 0xfcf563a9e612c4be
.xword 0xd606039f47345c9b



SECTION .NCPRI_SEG_4 DATA_VA = 0x0000006def090000
attr_data {
	Name	 = .NCPRI_SEG_4,
	VA	 = 0x0000006def090000,
	RA	 = 0x0000004123408000,
	PA	 = ra2pa(0x0000004123408000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x82773028ec1b345f
.xword 0xe33db3f9ea1831ae
.xword 0x19841c80244e4dd4
.xword 0x5ec9d7df783bebf7
.xword 0xc18bb977b8137560
.xword 0x61a5e8b4a19b4108
.xword 0xb3c419f54f392239
.xword 0x2fa579b8c5ed781c



SECTION .NCPRI_SEG_5 DATA_VA = 0x0000006def094000
attr_data {
	Name	 = .NCPRI_SEG_5,
	VA	 = 0x0000006def094000,
	RA	 = 0x000000412340a000,
	PA	 = ra2pa(0x000000412340a000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x4aacb8aac4568ceb
.xword 0x88e48faa918ecb53
.xword 0x862011b9063e1641
.xword 0x132142fefe677d1d
.xword 0x364827d4a49c7a76
.xword 0xa920a3d00e2d44ed
.xword 0x4306054b0bd106a1
.xword 0x324d1386d384fab3



SECTION .NCPRI_SEG_6 DATA_VA = 0x0000006def098000
attr_data {
	Name	 = .NCPRI_SEG_6,
	VA	 = 0x0000006def098000,
	RA	 = 0x000000412340c000,
	PA	 = ra2pa(0x000000412340c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x65c73eea30098a84
.xword 0x736b17233286cb9a
.xword 0xd4c24bd956f216cc
.xword 0x5fdd581f4e81021b
.xword 0x19187ee76ca70272
.xword 0x2595872ca121f016
.xword 0xbddb1a7adf22ce7c
.xword 0x283c0d9b5973ca05



SECTION .NCPRI_SEG_7 DATA_VA = 0x0000006def09c000
attr_data {
	Name	 = .NCPRI_SEG_7,
	VA	 = 0x0000006def09c000,
	RA	 = 0x000000412340e000,
	PA	 = ra2pa(0x000000412340e000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x55c7c321361d612a
.xword 0x8e2f790c3ba3093d
.xword 0x7a6434da1c671a45
.xword 0xbb7e2ece4c39a2bb
.xword 0x95eab8c27f1f6412
.xword 0xdff7f3860f80b6d3
.xword 0x10efe45b4601d9e0
.xword 0xe7f7a9c6cd9d6d8e



SECTION .NCPRI_SEG_8 DATA_VA = 0x0000006def0a0000
attr_data {
	Name	 = .NCPRI_SEG_8,
	VA	 = 0x0000006def0a0000,
	RA	 = 0x0000004123410000,
	PA	 = ra2pa(0x0000004123410000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x7f7df6641a0f89fb
.xword 0x8fc9eb882e59fd13
.xword 0x2d9756ff39d887d1
.xword 0x58dce0af7925b4bf
.xword 0xcdf4725df357bb7f
.xword 0xdc4e0aae808fe0c1
.xword 0xd8cdc2b7c9189680
.xword 0x054aa5b017b0472e



SECTION .NCPRI_SEG_9 DATA_VA = 0x0000006def0a4000
attr_data {
	Name	 = .NCPRI_SEG_9,
	VA	 = 0x0000006def0a4000,
	RA	 = 0x0000004123412000,
	PA	 = ra2pa(0x0000004123412000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xce0c18b2f5894407
.xword 0x55453a5b950a58d7
.xword 0x4c5938719fff0375
.xword 0xbfd919b3f1c0959a
.xword 0xd0cf6a697556eb59
.xword 0xcbe9d0f87f28193d
.xword 0x8511c797f0be3dfa
.xword 0x7aefcad85f58dd8d



SECTION .NCPRI_SEG_10 DATA_VA = 0x0000006def0a8000
attr_data {
	Name	 = .NCPRI_SEG_10,
	VA	 = 0x0000006def0a8000,
	RA	 = 0x0000004123414000,
	PA	 = ra2pa(0x0000004123414000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x43cb826973d2ff25
.xword 0x7e5f668b81fb5a6d
.xword 0x9f63c28771a8a488
.xword 0x0a6726a2a1c3a81d
.xword 0x04b3f24b1659ae55
.xword 0x1dbd74d13e655f3b
.xword 0x40e57fe0872f83c2
.xword 0xe4c13ec4c84aafec



SECTION .NCPRI_SEG_11 DATA_VA = 0x0000006def0ac000
attr_data {
	Name	 = .NCPRI_SEG_11,
	VA	 = 0x0000006def0ac000,
	RA	 = 0x0000004123416000,
	PA	 = ra2pa(0x0000004123416000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xa6459aedb157b2cd
.xword 0xe5cc5fb174f97d1d
.xword 0x50f23afe768bf574
.xword 0x1740bcfed94d6f0c
.xword 0x236454d139b639fc
.xword 0x8188f726a375de28
.xword 0x4c616d7fc30ad3a1
.xword 0x1180a0433cee5400



SECTION .NCPRI_SEG_12 DATA_VA = 0x0000006def0b0000
attr_data {
	Name	 = .NCPRI_SEG_12,
	VA	 = 0x0000006def0b0000,
	RA	 = 0x0000004123418000,
	PA	 = ra2pa(0x0000004123418000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x13783e058bde9b70
.xword 0x645adc540ab2d091
.xword 0x8ac62b8459d7d019
.xword 0xc5c02ac21e37fd0a
.xword 0xb1e3c601d783fef3
.xword 0x754a5edb53a3ed49
.xword 0x0718888fb65d8cb8
.xword 0x70f9734fb780a47e



SECTION .NCPRI_SEG_13 DATA_VA = 0x0000006def0b4000
attr_data {
	Name	 = .NCPRI_SEG_13,
	VA	 = 0x0000006def0b4000,
	RA	 = 0x000000412341a000,
	PA	 = ra2pa(0x000000412341a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xeee46083ff5e71db
.xword 0xf5f5cbe04f6e6b93
.xword 0xe6f6329680de0415
.xword 0x8cfcff406652c7a9
.xword 0x97acd9d51d53e1a1
.xword 0x5bc689c7f5a6b867
.xword 0x56a132686fbf08c4
.xword 0x848cd8632287b6ed



SECTION .NCPRI_SEG_14 DATA_VA = 0x0000006def0b8000
attr_data {
	Name	 = .NCPRI_SEG_14,
	VA	 = 0x0000006def0b8000,
	RA	 = 0x000000412341c000,
	PA	 = ra2pa(0x000000412341c000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x96007b383e734c7d
.xword 0x4040020d67ceb5bf
.xword 0xb0d39e109c4952c3
.xword 0x6a20f3e4e652c39d
.xword 0xa1af0440f1ba09c4
.xword 0xac99c020bbdd83f2
.xword 0x26861676a19f5c12
.xword 0x4f052383e4400328



SECTION .NCPRI_SEG_15 DATA_VA = 0x0000006def0bc000
attr_data {
	Name	 = .NCPRI_SEG_15,
	VA	 = 0x0000006def0bc000,
	RA	 = 0x000000412341e000,
	PA	 = ra2pa(0x000000412341e000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x381917a868d29a94
.xword 0xa1f2dbbe3568e6a3
.xword 0x22411ef186d27cde
.xword 0x128c3e5b2de60131
.xword 0x08a652cbec591d21
.xword 0x63a19cef80426ebf
.xword 0xb128095f6bf45127
.xword 0x4392671e72ec9188



SECTION .NCPRI_SEG_16 DATA_VA = 0x0000006def0c0000
attr_data {
	Name	 = .NCPRI_SEG_16,
	VA	 = 0x0000006def0c0000,
	RA	 = 0x0000004123420000,
	PA	 = ra2pa(0x0000004123420000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5b08af62d804a83b
.xword 0x57b63992f0d705f0
.xword 0xc862ee068398324a
.xword 0x1c0e2d082502884e
.xword 0x09a249335d35ccd9
.xword 0x9093374c339984d6
.xword 0x2e923d8d285feebd
.xword 0xc3130cbe7d620c2d



SECTION .NCPRI_SEG_17 DATA_VA = 0x0000006def0c4000
attr_data {
	Name	 = .NCPRI_SEG_17,
	VA	 = 0x0000006def0c4000,
	RA	 = 0x0000004123422000,
	PA	 = ra2pa(0x0000004123422000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x4547a36e601b3848
.xword 0x595f624882651dd1
.xword 0xca4a6d9ccf003f4a
.xword 0x0a070bc9b9b7c1f6
.xword 0x1bb913764d3e2f80
.xword 0x588c9c950c825d72
.xword 0x4db98298e9a773d5
.xword 0xfae1b1c669b82bd6



SECTION .NCPRI_SEG_18 DATA_VA = 0x0000006def0c8000
attr_data {
	Name	 = .NCPRI_SEG_18,
	VA	 = 0x0000006def0c8000,
	RA	 = 0x0000004123424000,
	PA	 = ra2pa(0x0000004123424000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
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

.xword 0xd204a55d2c4f27e0
.xword 0xeb42906fbfe57656
.xword 0x0026023f7f67d507
.xword 0x28bd20f6e3167d81
.xword 0x5d62a228c8379758
.xword 0x33999975a3b99f2e
.xword 0xbb8c52b3c285c235
.xword 0x69f73f8f8a4d65d7



SECTION .NCPRI_SEG_19 DATA_VA = 0x0000006def0cc000
attr_data {
	Name	 = .NCPRI_SEG_19,
	VA	 = 0x0000006def0cc000,
	RA	 = 0x0000004123426000,
	PA	 = ra2pa(0x0000004123426000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x39b656c818e90b6e
.xword 0x943541f61eccc9c8
.xword 0xc13b34d80795b230
.xword 0x371fd1fed7cc5828
.xword 0xa45d5dba73b0e405
.xword 0x505f27ae36790d62
.xword 0x58b599dcde1d00a8
.xword 0xf6e410282770e4f7



SECTION .NCPRI_SEG_20 DATA_VA = 0x0000006def0d0000
attr_data {
	Name	 = .NCPRI_SEG_20,
	VA	 = 0x0000006def0d0000,
	RA	 = 0x0000004123428000,
	PA	 = ra2pa(0x0000004123428000,0),
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
	TTE_W	 = 0
}

.xword 0xc89416f9ef75ba02
.xword 0xe7f84eb4dfd5cff8
.xword 0x6ada019ff5434140
.xword 0x91d21945dffc7905
.xword 0x4a62d222c650fc34
.xword 0x9094d4abeda87208
.xword 0xa5812a7b26f3b6dc
.xword 0xaa1fd472b617e986



SECTION .NCPRI_SEG_21 DATA_VA = 0x0000006def0d4000
attr_data {
	Name	 = .NCPRI_SEG_21,
	VA	 = 0x0000006def0d4000,
	RA	 = 0x000000412342a000,
	PA	 = ra2pa(0x000000412342a000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x0eb103a8ae16d110
.xword 0x541663f4853af93a
.xword 0xacf09779c82de37c
.xword 0x0a3ee178e8a2c7b2
.xword 0x17ae943f0ac83f93
.xword 0x5d5ad3025d292a1f
.xword 0x6162ad3fac5e63ac
.xword 0x3ffd985db535cf8c



SECTION .NCPRI_SEG_22 DATA_VA = 0x0000006def0d8000
attr_data {
	Name	 = .NCPRI_SEG_22,
	VA	 = 0x0000006def0d8000,
	RA	 = 0x000000412342c000,
	PA	 = ra2pa(0x000000412342c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x4eecf85285287a66
.xword 0xff5a5ddaad2274b6
.xword 0x5e370239d3d8ac9f
.xword 0x59a7b65f7e1cc30b
.xword 0xde6cda9fee08f4f2
.xword 0x58b5a0a5f43018f2
.xword 0x015e704f46b65e11
.xword 0x7015d3b79a78f32a



SECTION .NCPRI_SEG_23 DATA_VA = 0x0000006def0dc000
attr_data {
	Name	 = .NCPRI_SEG_23,
	VA	 = 0x0000006def0dc000,
	RA	 = 0x000000412342e000,
	PA	 = ra2pa(0x000000412342e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xf8efb5b1327bfb16
.xword 0x971213ba9c468d59
.xword 0x3512edddfbcfeece
.xword 0x94e5e18a40df15aa
.xword 0x84f2c3dd21a35ee8
.xword 0x30a109a52c65cb57
.xword 0x562525a490272ba7
.xword 0x952c3da71d18cf78



SECTION .NCPRI_SEG_24 DATA_VA = 0x0000006def0e0000
attr_data {
	Name	 = .NCPRI_SEG_24,
	VA	 = 0x0000006def0e0000,
	RA	 = 0x0000004123430000,
	PA	 = ra2pa(0x0000004123430000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x71157a1211353bcf
.xword 0x22f1f44f779c0864
.xword 0x2d873eb265b71f45
.xword 0xce0f1c10c89c7cde
.xword 0xecc3cec1818f187b
.xword 0xc895e592e63e5db5
.xword 0x649bb42310fb6a9a
.xword 0xb1b2e2aa5f5e4345



SECTION .NCPRI_SEG_25 DATA_VA = 0x0000006def0e4000
attr_data {
	Name	 = .NCPRI_SEG_25,
	VA	 = 0x0000006def0e4000,
	RA	 = 0x0000004123432000,
	PA	 = ra2pa(0x0000004123432000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xab55f5ded4ce7170
.xword 0xa5201c44b7660534
.xword 0x82fee4777ec30c4e
.xword 0x04cb34616e7476f6
.xword 0x32bad02c9715df36
.xword 0x560cf2db88cf958b
.xword 0x07b0f2e61c644ce6
.xword 0xee5d272e61418cf9



SECTION .NCPRI_SEG_26 DATA_VA = 0x0000006def0e8000
attr_data {
	Name	 = .NCPRI_SEG_26,
	VA	 = 0x0000006def0e8000,
	RA	 = 0x0000004123434000,
	PA	 = ra2pa(0x0000004123434000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x35d7a2df445fe281
.xword 0x5f8e07c5f72ec4fc
.xword 0x75ee3b5e817c20fa
.xword 0xc3950c5f2c3f42e2
.xword 0xe5581ccfc42f503d
.xword 0x21ad1bf114470951
.xword 0xf7cf412d7bbf2fde
.xword 0xa29c7f460af0f690



SECTION .NCPRI_SEG_27 DATA_VA = 0x0000006def0ec000
attr_data {
	Name	 = .NCPRI_SEG_27,
	VA	 = 0x0000006def0ec000,
	RA	 = 0x0000004123436000,
	PA	 = ra2pa(0x0000004123436000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x9f8bb74e55883c9b
.xword 0xe0999a6ef25ebcc0
.xword 0x84b4d10b36f9f45e
.xword 0x160e9eeced86a973
.xword 0x5c33f0b64ecbd0bd
.xword 0x3b57081161f76d02
.xword 0x3ca989293ddd9e98
.xword 0x1cec8f536cafb9b3



SECTION .NCPRI_SEG_28 DATA_VA = 0x0000006def0f0000
attr_data {
	Name	 = .NCPRI_SEG_28,
	VA	 = 0x0000006def0f0000,
	RA	 = 0x0000004123438000,
	PA	 = ra2pa(0x0000004123438000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x5ebbdd03329d7e2d
.xword 0x924094c6f3cd7eec
.xword 0xa921262a8a318859
.xword 0x628218df525ab974
.xword 0xbcfffe0d8939caad
.xword 0x642c82835b3691f1
.xword 0x018c0135176bbee5
.xword 0xb997cc301a0d9642



SECTION .NCPRI_SEG_29 DATA_VA = 0x0000006def0f4000
attr_data {
	Name	 = .NCPRI_SEG_29,
	VA	 = 0x0000006def0f4000,
	RA	 = 0x000000412343a000,
	PA	 = ra2pa(0x000000412343a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x14d6e303b0a5a691
.xword 0xde0e1b6b60792258
.xword 0x84657164f362fcee
.xword 0x966e44b847a14087
.xword 0x051f366745195c34
.xword 0x7135082a52249c1e
.xword 0xc22babce62ec37f3
.xword 0xb8a6c6b13cdaa005



SECTION .NCPRI_SEG_30 DATA_VA = 0x0000006def0f8000
attr_data {
	Name	 = .NCPRI_SEG_30,
	VA	 = 0x0000006def0f8000,
	RA	 = 0x000000412343c000,
	PA	 = ra2pa(0x000000412343c000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x98cb187e5675f00f
.xword 0xc639e031fdffe327
.xword 0x51b24de643731b7a
.xword 0xef96595ae44e7dec
.xword 0x711bc72829da7db1
.xword 0x5fbbf7e4728827da
.xword 0xdbdc22bb051f7598
.xword 0x9c88d282aa0c7216



SECTION .NCPRI_SEG_31 DATA_VA = 0x0000006def0fc000
attr_data {
	Name	 = .NCPRI_SEG_31,
	VA	 = 0x0000006def0fc000,
	RA	 = 0x000000412343e000,
	PA	 = ra2pa(0x000000412343e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x31abc77d6a7178ab
.xword 0xd1cfe7f7d3b1a0a6
.xword 0x2927eddcd63feaca
.xword 0x5faf756859fff61e
.xword 0x52f5c730f21a3f64
.xword 0x536db116bfffa113
.xword 0x082d2d08cdd6fc8a
.xword 0xf33f46a38146871b





SECTION .CPSEC_SEG_0 DATA_VA = 0x0000007123500000
attr_data {
	Name	 = .CPSEC_SEG_0,
	VA	 = 0x0000007123500000,
	RA	 = 0x0000006789aa0000,
	PA	 = ra2pa(0x0000006789aa0000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA0_START
MEM_SEC_DATA0_START:
.xword 0xd219ed1d5285fcde
.xword 0xe99be76c737e57bd
.xword 0x09c1a11839193013
.xword 0xdf5fbe5b8f94e47e
.xword 0x049b5c647dc9678d
.xword 0x0742144b296859f3
.xword 0x616959f85c4e4a4e
.xword 0x643198936a32112b
.xword 0x71263c8e10349759
.xword 0x313becd4a5c18be7
.xword 0x2bcee761ad19c94d
.xword 0xb01536c3d0c457e2
.xword 0xb1a9bc85bf14a5b6
.xword 0x5c98707d5f89bb40
.xword 0x06b85c3409f26fd7
.xword 0xecc59adc43f393b7
.xword 0xc287c679f5a054b0
.xword 0xc5f7acd7e0b68db5
.xword 0x16356f77a1b2d0db
.xword 0xe39eeef2e86d3696
.xword 0x2f816e171d139804
.xword 0x931922461a1a7d2a
.xword 0xfd926efaf79e381c
.xword 0xffe5d50b92b1e0d1
.xword 0x2cd1cb3953cb6d4a
.xword 0x6ed0567e591af96b
.xword 0x39ce6cb80428686c
.xword 0xb512441d4e7421a7
.xword 0x9a443748db63f570
.xword 0x1eace00cce081220
.xword 0xbe20617ca988c4d1
.xword 0x06e5390a40e259ac
.xword 0x5ec2ef4a33f75fca
.xword 0xa700d62ac9e9b363
.xword 0xebd4fdb835ef5267
.xword 0x0a5c133e836a7723
.xword 0xa9f62598776c258f
.xword 0xee3ebd2126b50189
.xword 0x3fd9ce1161bf9307
.xword 0xde5f3d2f3ccbe358




SECTION .CPSEC_SEG_1 DATA_VA = 0x0000007123504000
attr_data {
	Name	 = .CPSEC_SEG_1,
	VA	 = 0x0000007123504000,
	RA	 = 0x0000006789aa2000,
	PA	 = ra2pa(0x0000006789aa2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA1_START
MEM_SEC_DATA1_START:
.xword 0x384d44a719ed47df
.xword 0x75ae6128e44168d7
.xword 0x59632870ccaa2466
.xword 0x378a49f4e883dbd6
.xword 0x602f1666fe0bcf0d
.xword 0x19ea2344a0177f61
.xword 0xd72e1c51db1aab86
.xword 0x6dea4b2be286abd9
.xword 0x2f507f7f0a16a9db
.xword 0x09013e9f1245c1fc
.xword 0x0b111420e5e66a5a
.xword 0x2793dde4423b308d
.xword 0x83017d648f25e5c6
.xword 0x72921ec54761d785
.xword 0xa4bfdfbc5c769435
.xword 0x631a3797d2cad228
.xword 0xdff71b79013348e2




SECTION .CPSEC_SEG_2 DATA_VA = 0x0000007123508000
attr_data {
	Name	 = .CPSEC_SEG_2,
	VA	 = 0x0000007123508000,
	RA	 = 0x0000006789aa4000,
	PA	 = ra2pa(0x0000006789aa4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA2_START
MEM_SEC_DATA2_START:
.xword 0x28e124847e0b0c93
.xword 0x240f9ce14a5ab492
.xword 0x8e6befb10d1ff3e0
.xword 0x15fd2c39671eb211
.xword 0x3dd0d5c6ce0ad0a8
.xword 0x81fb1944c51bb4de
.xword 0xaa7e7ff237be4722
.xword 0xf0d531d4769cd977
.xword 0x98ac88feef8250b5
.xword 0x99b1508102ab0615
.xword 0x979c6e965e7ab813
.xword 0xed5c58e00c32ca82
.xword 0xf39b808fdee9c12d
.xword 0x0fbdecf979984263
.xword 0xc4761448b786761a
.xword 0xf68198f44674f18e
.xword 0x135bad154664d37f




SECTION .CPSEC_SEG_3 DATA_VA = 0x000000712350c000
attr_data {
	Name	 = .CPSEC_SEG_3,
	VA	 = 0x000000712350c000,
	RA	 = 0x0000006789aa6000,
	PA	 = ra2pa(0x0000006789aa6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA3_START
MEM_SEC_DATA3_START:
.xword 0x4d7dff0e13fcb4f6
.xword 0x256942c143ddac2c
.xword 0x7a91ec0102ff9835
.xword 0xa6547358817dde26
.xword 0xb1f0e24eb5684b03
.xword 0x3ec9bb575d5e4b79
.xword 0x44700dfb708f7235
.xword 0xf4bc985d68ca25a4
.xword 0x23b934c5b7db5dcf
.xword 0x5ada29b7c309c13b
.xword 0x936a3da1a4129489
.xword 0x9d6bde60adcce931
.xword 0xc5645cccf16aec47
.xword 0x0ada5e6f0085e2e8
.xword 0x52d7f3391370d930
.xword 0x848e742c059aaeae
.xword 0x7562d011c064cead




SECTION .CPSEC_SEG_4 DATA_VA = 0x0000007123510000
attr_data {
	Name	 = .CPSEC_SEG_4,
	VA	 = 0x0000007123510000,
	RA	 = 0x0000006789aa8000,
	PA	 = ra2pa(0x0000006789aa8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA4_START
MEM_SEC_DATA4_START:
.xword 0x6974305afeb60f3f
.xword 0xab55fb2dd1bf8d69
.xword 0xea37250046aa86c7
.xword 0x6ab2628694644b7b
.xword 0xa7c97ee95b632d99
.xword 0xfd29598db8793ead
.xword 0x2b4d1ced28d2dc0d
.xword 0x0237ff7e11abc9aa
.xword 0x63a0b17d0d8ce4c7
.xword 0x35c59ca6205766f2
.xword 0x61e358b84e4864a5
.xword 0x143150cc8acf9d6c
.xword 0x41a81d30aeb4d593
.xword 0xbdee83a32995ae8e
.xword 0x3c040f8793b3edea
.xword 0x8549fcbfbbc11250
.xword 0x9feb53de9a0864c6




SECTION .CPSEC_SEG_5 DATA_VA = 0x0000007123514000
attr_data {
	Name	 = .CPSEC_SEG_5,
	VA	 = 0x0000007123514000,
	RA	 = 0x0000006789aaa000,
	PA	 = ra2pa(0x0000006789aaa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA5_START
MEM_SEC_DATA5_START:
.xword 0xd093b0a8cdda514c
.xword 0xc723e8a53f6bff41
.xword 0xf5dfbe987755b791
.xword 0x4a134b7297b3c7d2
.xword 0xe90b3006fec150fe
.xword 0x0d22d57a78fb2b77
.xword 0xa897e2445b8b7d63
.xword 0x73df9dc2632b3ea6
.xword 0x77fccf4659d77ba4
.xword 0xed69c650d568dfc4
.xword 0x57c3f85eda590cb4
.xword 0xc35f60d383cb85b5
.xword 0x55d9bbc839542107
.xword 0x57ea38f81e8a758d
.xword 0xcff5429129310fb6
.xword 0x25c37f9d9e655a6c
.xword 0x53742d2b00be53b4




SECTION .CPSEC_SEG_6 DATA_VA = 0x0000007123518000
attr_data {
	Name	 = .CPSEC_SEG_6,
	VA	 = 0x0000007123518000,
	RA	 = 0x0000006789aac000,
	PA	 = ra2pa(0x0000006789aac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA6_START
MEM_SEC_DATA6_START:
.xword 0xddaac6bbb6be46e3
.xword 0x41ba0d58fa496ee8
.xword 0xebf48b810c246f7a
.xword 0x3e931745cec9e9bd
.xword 0x03b25cf01b574686
.xword 0x05eaa4a06c864c1b
.xword 0xa55816a4996bc6d2
.xword 0xe5faf73c150c6f5f
.xword 0xae55ac4dc868291d
.xword 0x241dfce77388954e
.xword 0x775d0bfc33425961
.xword 0x4ba686a9ad8a4e03
.xword 0x6552a05f3aaf0c64
.xword 0xa88221d17c7c2d73
.xword 0x9aa57d3613247959
.xword 0xd4354c6c4c0e1e06
.xword 0x6a3e6aaf0cc63661




SECTION .CPSEC_SEG_7 DATA_VA = 0x000000712351c000
attr_data {
	Name	 = .CPSEC_SEG_7,
	VA	 = 0x000000712351c000,
	RA	 = 0x0000006789aae000,
	PA	 = ra2pa(0x0000006789aae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA7_START
MEM_SEC_DATA7_START:
.xword 0x57c2243d5a170ca1
.xword 0xf6f17df53cec8bf1
.xword 0x858bdf6b8fc83390
.xword 0xf78cc5545e8766e9
.xword 0xda14093e858c1520
.xword 0x89a5b85985e79f23
.xword 0xf83b16760e32f446
.xword 0x3d878544ab098738
.xword 0x5395f2ae94970c20
.xword 0x7d2d743fd6f8cacf
.xword 0x3001a8b34f76d4a2
.xword 0xc5d4d1e5349f0b3c
.xword 0xf3cb04d649eefb58
.xword 0x32d6d25496bda774
.xword 0x67cdc6ac163db0ca
.xword 0xeceb04800de9d0ec
.xword 0x0c395c9ebc99ba64






SECTION .NCSEC_SEG_0 DATA_VA = 0x0000004567980000
attr_data {
	Name	 = .NCSEC_SEG_0,
	VA	 = 0x0000004567980000,
	RA	 = 0x0000004567880000,
	PA	 = ra2pa(0x0000004567880000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xd16672fb85e98cdf
.xword 0x5c7c74729d2edea0
.xword 0x43651ffbcf507145
.xword 0x6486177419e22ff1
.xword 0x1cb7bf5f520995ed
.xword 0x2acbde0dc8fa5cc4
.xword 0x22bd4fb29b2190f2
.xword 0x4f37e8abe6715d96




SECTION .NCSEC_SEG_1 DATA_VA = 0x0000004567984000
attr_data {
	Name	 = .NCSEC_SEG_1,
	VA	 = 0x0000004567984000,
	RA	 = 0x0000004567882000,
	PA	 = ra2pa(0x0000004567882000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xa14a1af208157226
.xword 0x5d2f0e51c0dd3ad8
.xword 0x2feb03dd438a2780
.xword 0x07387c7c00888287
.xword 0x9ab864847e0d7c5d
.xword 0xcc74c1ce83d0445e
.xword 0xfe3dac41ddc3ab1e
.xword 0x44af866d739b9724




SECTION .NCSEC_SEG_2 DATA_VA = 0x0000004567988000
attr_data {
	Name	 = .NCSEC_SEG_2,
	VA	 = 0x0000004567988000,
	RA	 = 0x0000004567884000,
	PA	 = ra2pa(0x0000004567884000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xed0936694fcee094
.xword 0x7ab27ffe7e7ed435
.xword 0x7a172b6d7d3fe26f
.xword 0x7c4a76ee7177290b
.xword 0x970715eea24df6ed
.xword 0x83ae36c7b3b72b69
.xword 0xb76e0328f6ce924c
.xword 0x36fe016542ba1476




SECTION .NCSEC_SEG_3 DATA_VA = 0x000000456798c000
attr_data {
	Name	 = .NCSEC_SEG_3,
	VA	 = 0x000000456798c000,
	RA	 = 0x0000004567886000,
	PA	 = ra2pa(0x0000004567886000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xc967e3711558d649
.xword 0x374046d061ffb1ff
.xword 0x30ff64d3f161deb9
.xword 0x97d66b168158ea43
.xword 0x05894e6cbd70bc99
.xword 0x46a642056aac07ef
.xword 0x66348d87ee23916b
.xword 0x095685e33664efa7




SECTION .NCSEC_SEG_4 DATA_VA = 0x0000004567990000
attr_data {
	Name	 = .NCSEC_SEG_4,
	VA	 = 0x0000004567990000,
	RA	 = 0x0000004567888000,
	PA	 = ra2pa(0x0000004567888000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x54fd8b8051427947
.xword 0x33ae57909f374502
.xword 0x82df80321b9c9f89
.xword 0x06a92bd33d89e067
.xword 0xdfe3f69e3279379e
.xword 0x3263e6d141abf2ef
.xword 0x8e46298150ddc870
.xword 0x70ae77488a6139bf




SECTION .NCSEC_SEG_5 DATA_VA = 0x0000004567994000
attr_data {
	Name	 = .NCSEC_SEG_5,
	VA	 = 0x0000004567994000,
	RA	 = 0x000000456788a000,
	PA	 = ra2pa(0x000000456788a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xb4d9278a1c75bd60
.xword 0xd4e0ee35c14001a5
.xword 0xcf21cb5137041bf7
.xword 0xa0aeca3999cbb117
.xword 0x73d2070452886515
.xword 0xb9f50f781db6b6f4
.xword 0x6878598de4f78d41
.xword 0x8b3d68437beef015




SECTION .NCSEC_SEG_6 DATA_VA = 0x0000004567998000
attr_data {
	Name	 = .NCSEC_SEG_6,
	VA	 = 0x0000004567998000,
	RA	 = 0x000000456788c000,
	PA	 = ra2pa(0x000000456788c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_W	 = 0
}

.xword 0x411d3af79df5199b
.xword 0x7266e176d0ecd9ba
.xword 0xaae345a34b669a60
.xword 0xe1cc58c7bfa1d996
.xword 0x2ee1c1c63763381e
.xword 0x99180924650eef6c
.xword 0x0d0f8f9fdf158399
.xword 0x426eb95e10216f95




SECTION .NCSEC_SEG_7 DATA_VA = 0x000000456799c000
attr_data {
	Name	 = .NCSEC_SEG_7,
	VA	 = 0x000000456799c000,
	RA	 = 0x000000456788e000,
	PA	 = ra2pa(0x000000456788e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x7459c7b871361ecf
.xword 0xfd5b088c7d514317
.xword 0x07bedf6ec4090e57
.xword 0xd5d3f9786ebaea95
.xword 0x03f166b060b392ba
.xword 0x8f95f5af98e8ab86
.xword 0xa381cc94e7239d0f
.xword 0xb3fc2b4df33eb307






SECTION .CPNUC_SEG_0 DATA_VA = 0x00000019aba00000
attr_data {
	Name	 = .CPNUC_SEG_0,
	VA	 = 0x00000019aba00000,
	RA	 = 0x00000069debc0000,
	PA	 = ra2pa(0x00000069debc0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x0614bfaffe30b438
.xword 0x38b207f3b9a580bf
.xword 0xcbe4170356ce669c
.xword 0x45663c5dd3dd29c7
.xword 0x4ca669e2062ade7d
.xword 0x5eb2cdf9b6b6c75f
.xword 0x73b3f5b70e14ed36
.xword 0x1631753b20a6895f




SECTION .CPNUC_SEG_1 DATA_VA = 0x00000019aba04000
attr_data {
	Name	 = .CPNUC_SEG_1,
	VA	 = 0x00000019aba04000,
	RA	 = 0x00000069debc2000,
	PA	 = ra2pa(0x00000069debc2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x43b776cf499b1036
.xword 0x1bcb5c84e57f56b6
.xword 0xc1e29967c1ac4762
.xword 0x87a203b8071addfb
.xword 0x45f92fc10c59ee6f
.xword 0x7fb7033e8c38af86
.xword 0x17d1bef772e64ea9
.xword 0x7a950063b9b71c41




SECTION .CPNUC_SEG_2 DATA_VA = 0x00000019aba08000
attr_data {
	Name	 = .CPNUC_SEG_2,
	VA	 = 0x00000019aba08000,
	RA	 = 0x00000069debc4000,
	PA	 = ra2pa(0x00000069debc4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x6eb2ba8fa6ca76ad
.xword 0xab3fc12308ec7702
.xword 0xd58bc26baef9c1a9
.xword 0x8ebe5fd83a68341a
.xword 0x042d3bc18686034c
.xword 0x88dd4bf4d2f03e57
.xword 0x1598605289788bb5
.xword 0xe1f1019a698a45ea




SECTION .CPNUC_SEG_3 DATA_VA = 0x00000019aba0c000
attr_data {
	Name	 = .CPNUC_SEG_3,
	VA	 = 0x00000019aba0c000,
	RA	 = 0x00000069debc6000,
	PA	 = ra2pa(0x00000069debc6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x650e69ffa6a031a2
.xword 0x1e916638a007c918
.xword 0xc0db9cc8d2eca151
.xword 0x5ad9528180b64d15
.xword 0x0414d47e88d28d7b
.xword 0x6ef844946becb6f1
.xword 0x12035f9eff71918c
.xword 0xe6ea9427c4719464




SECTION .CPNUC_SEG_4 DATA_VA = 0x00000019aba10000
attr_data {
	Name	 = .CPNUC_SEG_4,
	VA	 = 0x00000019aba10000,
	RA	 = 0x00000069debc8000,
	PA	 = ra2pa(0x00000069debc8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x6bd716b1adc656ed
.xword 0xf6546144567e09b0
.xword 0x76d09acd5f7d7511
.xword 0xcd4bfcf8ec23c9bc
.xword 0x19d05f58588858b0
.xword 0xebcc248baa9c9076
.xword 0x62d53d21391d414f
.xword 0xf7ca0b51e715463d




SECTION .CPNUC_SEG_5 DATA_VA = 0x00000019aba14000
attr_data {
	Name	 = .CPNUC_SEG_5,
	VA	 = 0x00000019aba14000,
	RA	 = 0x00000069debca000,
	PA	 = ra2pa(0x00000069debca000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x27e6ea3f5807431a
.xword 0x1252ddd6a432be5d
.xword 0x86ffb0454ce04884
.xword 0xc60d6356db4910cb
.xword 0x181c73d7772e896f
.xword 0x3d191f83430bd423
.xword 0x8b01e702f01612b2
.xword 0xde4ce4196bd1bf7b




SECTION .CPNUC_SEG_6 DATA_VA = 0x00000019aba18000
attr_data {
	Name	 = .CPNUC_SEG_6,
	VA	 = 0x00000019aba18000,
	RA	 = 0x00000069debcc000,
	PA	 = ra2pa(0x00000069debcc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x2d819f2aa81b5d0e
.xword 0x6d3d28912e5d0318
.xword 0xde23d77bd300ccb5
.xword 0xf102744a34c5e76a
.xword 0x633ada5040cace9c
.xword 0x16059b02676b6528
.xword 0xce8b48d4472ddd87
.xword 0xc299eed9b162d387




SECTION .CPNUC_SEG_7 DATA_VA = 0x00000019aba1c000
attr_data {
	Name	 = .CPNUC_SEG_7,
	VA	 = 0x00000019aba1c000,
	RA	 = 0x00000069debce000,
	PA	 = ra2pa(0x00000069debce000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x064fd418d020e88b
.xword 0x4c051e5e879b9b62
.xword 0x65cd864c5813a9a0
.xword 0xd4f2382386d84a75
.xword 0xd82069219b722ffb
.xword 0xf5391126ed98f995
.xword 0x1e6aefbec7ed996f
.xword 0xe4592a2089e8fa90






SECTION .NCNUC_SEG_0 DATA_VA = 0x0000004def280000
attr_data {
	Name	 = .NCNUC_SEG_0,
	VA	 = 0x0000004def280000,
	RA	 = 0x00000049abcd0000,
	PA	 = ra2pa(0x00000049abcd0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x29987f0a7e01e1f1
.xword 0x0ec014b507422c01
.xword 0xd95c152b1b526bee
.xword 0x573762835e6f42bd
.xword 0xb503658603de5995
.xword 0x4fe997a588a6d870
.xword 0xa248c3862094db3b
.xword 0xf1fb075aed036244




SECTION .NCNUC_SEG_1 DATA_VA = 0x0000004def284000
attr_data {
	Name	 = .NCNUC_SEG_1,
	VA	 = 0x0000004def284000,
	RA	 = 0x00000049abcd2000,
	PA	 = ra2pa(0x00000049abcd2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5875e9ebda4c5d4b
.xword 0xd781c8340791277b
.xword 0x9da651bc5f0f58f2
.xword 0xe13d5a275a0f5d6f
.xword 0x653578a2d4834d45
.xword 0x390750e7a110a921
.xword 0x237577b5eeed7f8b
.xword 0xccb3b8b42368ce6c




SECTION .NCNUC_SEG_2 DATA_VA = 0x0000004def288000
attr_data {
	Name	 = .NCNUC_SEG_2,
	VA	 = 0x0000004def288000,
	RA	 = 0x00000049abcd4000,
	PA	 = ra2pa(0x00000049abcd4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x6919fb07d0ca3e36
.xword 0x58e580c52f14ad80
.xword 0x71c631c2d2ba4d3b
.xword 0x6adfb490282d2657
.xword 0x40ae10715aa6e791
.xword 0x200c3e5855f036f4
.xword 0x59165de3bfea627a
.xword 0xa6a11d93581572ea




SECTION .NCNUC_SEG_3 DATA_VA = 0x0000004def28c000
attr_data {
	Name	 = .NCNUC_SEG_3,
	VA	 = 0x0000004def28c000,
	RA	 = 0x00000049abcd6000,
	PA	 = ra2pa(0x00000049abcd6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x9a778b36afc37a9f
.xword 0x2cfdd8ca7288fc2b
.xword 0x4b5f37d904e57904
.xword 0x831fb6763bcae7c5
.xword 0x849df36135a9a6fb
.xword 0x37fbac0cfcdee250
.xword 0xe2f10e7a68066781
.xword 0x24615335652b5f4f




SECTION .NCNUC_SEG_4 DATA_VA = 0x0000004def290000
attr_data {
	Name	 = .NCNUC_SEG_4,
	VA	 = 0x0000004def290000,
	RA	 = 0x00000049abcd8000,
	PA	 = ra2pa(0x00000049abcd8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xfd4dc4ee9aaa972e
.xword 0x5c238ae4ce3e67dc
.xword 0x9294cc0de69d40fb
.xword 0x2ff4f4bbb94c5de1
.xword 0xefa0b8e27d092ff6
.xword 0x8920a4f6ca3ca324
.xword 0x945d83080da776ff
.xword 0x905ab85321d33da2




SECTION .NCNUC_SEG_5 DATA_VA = 0x0000004def294000
attr_data {
	Name	 = .NCNUC_SEG_5,
	VA	 = 0x0000004def294000,
	RA	 = 0x00000049abcda000,
	PA	 = ra2pa(0x00000049abcda000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x0f164aac0e6ea2ae
.xword 0xa6b7a39430d7e750
.xword 0x916a0a4a828e7bc0
.xword 0x2e856023626369e1
.xword 0xddbb16b9b621aa4c
.xword 0xfe104b53387bac73
.xword 0x6ceb15821656051b
.xword 0x25ef93bb0f3639c4




SECTION .NCNUC_SEG_6 DATA_VA = 0x0000004def298000
attr_data {
	Name	 = .NCNUC_SEG_6,
	VA	 = 0x0000004def298000,
	RA	 = 0x00000049abcdc000,
	PA	 = ra2pa(0x00000049abcdc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xd53071d6f0d01c96
.xword 0xc05061517b0bd6f0
.xword 0xbcbd2d97913aade4
.xword 0xb42b656254a03f6c
.xword 0x5023bc4634310e4f
.xword 0x2a457b63cb7734ce
.xword 0x9ef12fb6f6683e25
.xword 0xc0a350ba09271bef




SECTION .NCNUC_SEG_7 DATA_VA = 0x0000004def29c000
attr_data {
	Name	 = .NCNUC_SEG_7,
	VA	 = 0x0000004def29c000,
	RA	 = 0x00000049abcde000,
	PA	 = ra2pa(0x00000049abcde000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xc8ed72a4ee5ad6be
.xword 0x0d712b89214231e5
.xword 0x11caeaec136c7e0b
.xword 0x7edc3dad20c5d327
.xword 0x3d8b450203141e0e
.xword 0x66c15e53ffa939c4
.xword 0xc1a4a8baa11ca0bf
.xword 0x49e5ed8f0f6c3cfe






SECTION .CP_REAL_MEM_SEG_0 DATA_VA = 0x0000007def300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_0,
	VA	 = 0x0000007def300000,
	RA	 = 0x0000007def300000,
	PA	 = ra2pa(0x0000007def300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA0_START
MEM_REAL_DATA0_START:
.xword 0x3d3c220c43106919
.xword 0xabea23f6628e629f
.xword 0x2b89d1f12ee4d54c
.xword 0xa4123ef32c7f94de
.xword 0x8aac7f732925dfd4
.xword 0x67edc40ef174242f
.xword 0xe599668a8bb36ba4
.xword 0x251ba6a67ccb8ca7
.xword 0xeca4a4e16ccf1598
.xword 0x5c0b8e1ce188d0b1
.xword 0x0d115b0269e281e9
.xword 0xdaa627fdff49c0f8
.xword 0xbe7b00d779687cd8
.xword 0x825b7df494a031f3
.xword 0x2d06a0a36bbbb1d5
.xword 0x0dacde3c2b4fa593
.xword 0x10fd97306d4df31e
.xword 0x37abc68a8d25a4a0
.xword 0x59723f1ba0dc14fb
.xword 0xe3e47b14fb0d6e47
.xword 0x3485cbb848b0855d
.xword 0x23d755d1173906df
.xword 0xcd768173f975689c
.xword 0xc4fc2975c9e1d4dd
.xword 0x15b1780dfdb51419
.xword 0xc9b16ade5297ec1d
.xword 0x293f032a0eea0888
.xword 0x27f39afc25fd586d
.xword 0x18162da9d9b248d9
.xword 0x2f97a84042ec95c8
.xword 0xe9e44f58b9b9461e
.xword 0xe80010095d62135a



SECTION .CP_REAL_MEM_SEG_1 DATA_VA = 0x0000007def304000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_1,
	VA	 = 0x0000007def304000,
	RA	 = 0x0000007def304000,
	PA	 = ra2pa(0x0000007def304000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA1_START
MEM_REAL_DATA1_START:
.xword 0x894cbcafd8c481f2
.xword 0x3e361d60b56e3efb
.xword 0xc563b5ee2d5c0e9d
.xword 0x85311fc43593c983
.xword 0x628fadb1778ddb6f
.xword 0x79c41f0db5736531
.xword 0x802def57aaaa8958
.xword 0x716d8fa408e0d027
.xword 0x4d1fc610c75383c7



SECTION .CP_REAL_MEM_SEG_2 DATA_VA = 0x0000007def308000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_2,
	VA	 = 0x0000007def308000,
	RA	 = 0x0000007def308000,
	PA	 = ra2pa(0x0000007def308000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA2_START
MEM_REAL_DATA2_START:
.xword 0xe4dfe5a9db54d1b0
.xword 0x9c9bb01b83a3043a
.xword 0x62ef38ed92864a4c
.xword 0xb388c0406a1da8d3
.xword 0xa92cfcdd6661428a
.xword 0x6bac1ed08400a61f
.xword 0xdb73e7421a6a234f
.xword 0xfdbde4f6e3e3d2b6
.xword 0x439d46b29382852d



SECTION .CP_REAL_MEM_SEG_3 DATA_VA = 0x0000007def30c000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_3,
	VA	 = 0x0000007def30c000,
	RA	 = 0x0000007def30c000,
	PA	 = ra2pa(0x0000007def30c000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA3_START
MEM_REAL_DATA3_START:
.xword 0x2f9a1015c09ddd60
.xword 0xa01319d99f53d0d9
.xword 0x74c6048ae62918e8
.xword 0xa6780f73efb8e2b1
.xword 0x596e68defcfa3df2
.xword 0xdb22ff7162fec409
.xword 0x0d5935017a901288
.xword 0x5ffb652507ec3233
.xword 0x471acc6086d6c157



SECTION .CP_REAL_MEM_SEG_4 DATA_VA = 0x0000007def310000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_4,
	VA	 = 0x0000007def310000,
	RA	 = 0x0000007def310000,
	PA	 = ra2pa(0x0000007def310000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA4_START
MEM_REAL_DATA4_START:
.xword 0xc8f9c8ea0d9132f7
.xword 0x5fcb326f851f89d8
.xword 0xd56a3992f131e9e7
.xword 0xa2f728106544559f
.xword 0x1ea1c353fc581eba
.xword 0xd86b30291ab2c219
.xword 0x05e9a019f7f20df4
.xword 0x2595e5da0814abaf
.xword 0x6a203452bfb15e60



SECTION .CP_REAL_MEM_SEG_5 DATA_VA = 0x0000007def314000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_5,
	VA	 = 0x0000007def314000,
	RA	 = 0x0000007def314000,
	PA	 = ra2pa(0x0000007def314000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA5_START
MEM_REAL_DATA5_START:
.xword 0x4bde7cd54baaabb2
.xword 0x7f40a3b055ae801f
.xword 0xef1cd605b61d4e32
.xword 0x5d92159b7e972001
.xword 0x71fd557dea004825
.xword 0x950d3a9cc33b761d
.xword 0x9b69e4852a6b1f2d
.xword 0x8f12466c0f1df98b
.xword 0x2a66fad73f7db8e2



SECTION .CP_REAL_MEM_SEG_6 DATA_VA = 0x0000007def318000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_6,
	VA	 = 0x0000007def318000,
	RA	 = 0x0000007def318000,
	PA	 = ra2pa(0x0000007def318000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA6_START
MEM_REAL_DATA6_START:
.xword 0xe2d58cba9906fa6e
.xword 0xb9cffaccb082a0ee
.xword 0x7104084745bf3095
.xword 0x8b30dcb5bc04d0ee
.xword 0x15fc927e427a22d3
.xword 0xc71425229a8d52da
.xword 0x64a32b8bcb782c5f
.xword 0x441ab6c4d216b082
.xword 0xe4a8deb67619aebb



SECTION .CP_REAL_MEM_SEG_7 DATA_VA = 0x0000007def31c000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_7,
	VA	 = 0x0000007def31c000,
	RA	 = 0x0000007def31c000,
	PA	 = ra2pa(0x0000007def31c000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA7_START
MEM_REAL_DATA7_START:
.xword 0x7a8486cd0ef580a1
.xword 0x29fdb8b60d2d9807
.xword 0x16e14dfeef85e902
.xword 0xaedadaee446313d8
.xword 0x24f905469b79ab3e
.xword 0xcdabad94a7c3166d
.xword 0x6188bd717c523c35
.xword 0x2e77aecda9b659c8
.xword 0x2b50fa25343df42b





SECTION .NC_REAL_IO_SEG_0 DATA_VA = 0x0000004ef03a0000
attr_data {
	Name	 = .NC_REAL_IO_SEG_0,
	VA	 = 0x0000004ef03a0000,
	RA	 = 0x0000004ef03a0000,
	PA	 = ra2pa(0x0000004ef03a0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xff5229eee2fb5436
.xword 0x2a840fb32bb945f1
.xword 0x03e8621f2a308f5f
.xword 0xc72d0b9ff7c3d2aa
.xword 0xa7fb44f0cb01af70
.xword 0x1692f81e2925c9c7
.xword 0x1e7327e866e24520
.xword 0x661e060d5ef1e43c




SECTION .NC_REAL_IO_SEG_1 DATA_VA = 0x0000004ef03a4000
attr_data {
	Name	 = .NC_REAL_IO_SEG_1,
	VA	 = 0x0000004ef03a4000,
	RA	 = 0x0000004ef03a4000,
	PA	 = ra2pa(0x0000004ef03a4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x19363de41a2070c4
.xword 0x3fb4374b7a71bca6
.xword 0x7959367586f943f9
.xword 0xa54c1e69a5655cd6
.xword 0x22df883f5fdb1528
.xword 0x177116ece8583e87
.xword 0xd7720e2c001a7325
.xword 0x161550822aef2780




SECTION .NC_REAL_IO_SEG_2 DATA_VA = 0x0000004ef03a8000
attr_data {
	Name	 = .NC_REAL_IO_SEG_2,
	VA	 = 0x0000004ef03a8000,
	RA	 = 0x0000004ef03a8000,
	PA	 = ra2pa(0x0000004ef03a8000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x6ce3d1c3e2a4ff9a
.xword 0x0bce38eb5b1d571a
.xword 0x77a85526e9fd43bf
.xword 0x1e9265126c990e87
.xword 0x959da4e0932d5612
.xword 0xd1a3b0bcbf15f5e8
.xword 0x542afc748256555e
.xword 0x6fe04550b4c39adf




SECTION .NC_REAL_IO_SEG_3 DATA_VA = 0x0000004ef03ac000
attr_data {
	Name	 = .NC_REAL_IO_SEG_3,
	VA	 = 0x0000004ef03ac000,
	RA	 = 0x0000004ef03ac000,
	PA	 = ra2pa(0x0000004ef03ac000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5dd41eb5cd7e3bef
.xword 0x94364df3a93c67e2
.xword 0x53f909897983eaae
.xword 0xcfd855b3cd756306
.xword 0x20607943a05d17ff
.xword 0xf3ac26f0e699dfe4
.xword 0x10281b83bd8e1d3f
.xword 0x10859898e0c72ba4




SECTION .NC_REAL_IO_SEG_4 DATA_VA = 0x0000004ef03b0000
attr_data {
	Name	 = .NC_REAL_IO_SEG_4,
	VA	 = 0x0000004ef03b0000,
	RA	 = 0x0000004ef03b0000,
	PA	 = ra2pa(0x0000004ef03b0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xa4cb3624c11f5311
.xword 0xc1027011536d4f52
.xword 0x98250056cc7f7446
.xword 0xb10fcb355c877fb3
.xword 0x28d981f59789b067
.xword 0x7f69ec60e151a3d4
.xword 0xa8058ec9ca36603e
.xword 0x4cf70a9c3addb210




SECTION .NC_REAL_IO_SEG_5 DATA_VA = 0x0000004ef03b4000
attr_data {
	Name	 = .NC_REAL_IO_SEG_5,
	VA	 = 0x0000004ef03b4000,
	RA	 = 0x0000004ef03b4000,
	PA	 = ra2pa(0x0000004ef03b4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xa57ad47320dabb0d
.xword 0xeaa6e2bd43c3d1f4
.xword 0x1006b498eca413b4
.xword 0xe915dc82a6d1d222
.xword 0x2a4bee7b79f11875
.xword 0x12763cae12304546
.xword 0xe096d714fc9327dd
.xword 0x91d20ac3e6cc3138




SECTION .NC_REAL_IO_SEG_6 DATA_VA = 0x0000004ef03b8000
attr_data {
	Name	 = .NC_REAL_IO_SEG_6,
	VA	 = 0x0000004ef03b8000,
	RA	 = 0x0000004ef03b8000,
	PA	 = ra2pa(0x0000004ef03b8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xbbab38900701cadb
.xword 0x9779ca1e8903ca09
.xword 0x49575135c93d7986
.xword 0xa54bd356d5838f2b
.xword 0x010eb2a6bba56068
.xword 0xfff07d2b8cacfd3d
.xword 0xe865b55028a8144e
.xword 0xa83604542591c8e8




SECTION .NC_REAL_IO_SEG_7 DATA_VA = 0x0000004ef03bc000
attr_data {
	Name	 = .NC_REAL_IO_SEG_7,
	VA	 = 0x0000004ef03bc000,
	RA	 = 0x0000004ef03bc000,
	PA	 = ra2pa(0x0000004ef03bc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x9a7581e1007479e4
.xword 0x968d2735ba07e08f
.xword 0x070a203160488689
.xword 0x6f6ec6f3a7b8117b
.xword 0xe6a1433c0177ac73
.xword 0xbff996624641f873
.xword 0xf857aa7d5e56eb94
.xword 0x571a8fef60ea2611






SECTION .CP_AIUP_SEG_0 DATA_VA = 0x0000002123502000
attr_data {
	Name	 = .CP_AIUP_SEG_0,
	VA	 = 0x0000002123502000,
	RA	 = 0x0000004a5a550000,
	PA	 = ra2pa(0x0000004a5a550000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x70b88663398a2406
.xword 0x52ea08f728415cdc
.xword 0xe6c984654d4fdcf2
.xword 0x3228c17a5875b553
.xword 0x8568aa3288a67b2b
.xword 0xe5b9e71dbabbfd21
.xword 0x2f7e885e97d9a170
.xword 0xd851c8808d927061




SECTION .CP_AIUP_SEG_1 DATA_VA = 0x0000002123506000
attr_data {
	Name	 = .CP_AIUP_SEG_1,
	VA	 = 0x0000002123506000,
	RA	 = 0x0000004a5a552000,
	PA	 = ra2pa(0x0000004a5a552000,0),
	part_0_ctx_nonzero_tsb_config_1,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd6cb4cc87ee999a1
.xword 0x6a3b9570eda0ea12
.xword 0x8415eb2fc7d01150
.xword 0xb708342a0217720f
.xword 0xf4fdc98e25441797
.xword 0x0e4f2411e080bdb5
.xword 0x6395cafa67f8bf6a
.xword 0x0fadb1153f93e3d8




SECTION .CP_AIUP_SEG_2 DATA_VA = 0x000000212350a000
attr_data {
	Name	 = .CP_AIUP_SEG_2,
	VA	 = 0x000000212350a000,
	RA	 = 0x0000004a5a554000,
	PA	 = ra2pa(0x0000004a5a554000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x0b9dfed6a686998a
.xword 0xdab379b61eb233e3
.xword 0xb171b6c8dbede1ce
.xword 0x8bd7a50965f1ce45
.xword 0xe1c5188422de6a22
.xword 0x5d746b7260a534e2
.xword 0x9b0c974738536b0c
.xword 0xcc5e0d0455b67c68




SECTION .CP_AIUP_SEG_3 DATA_VA = 0x000000212350e000
attr_data {
	Name	 = .CP_AIUP_SEG_3,
	VA	 = 0x000000212350e000,
	RA	 = 0x0000004a5a556000,
	PA	 = ra2pa(0x0000004a5a556000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xf3c9d05040535785
.xword 0x79835d8feb7f0024
.xword 0xec0bf72ae7755bd8
.xword 0x1ecc0ee4df680ea1
.xword 0x01c6a0ac00eb798d
.xword 0xb5aec79a860caf23
.xword 0x97bc21bab28ccb60
.xword 0x0971a30fb52da946




SECTION .CP_AIUP_SEG_4 DATA_VA = 0x0000002123512000
attr_data {
	Name	 = .CP_AIUP_SEG_4,
	VA	 = 0x0000002123512000,
	RA	 = 0x0000004a5a558000,
	PA	 = ra2pa(0x0000004a5a558000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x21e00f3dfdd70ace
.xword 0x2f855f815cad481c
.xword 0x369a9f3792a63b47
.xword 0x49388cc173d1e910
.xword 0xb503698ae6a03c52
.xword 0xbc8bb7a914d04fd6
.xword 0x3f6f7bdc61ce3a27
.xword 0x74b07b7690e9b6fc




SECTION .CP_AIUP_SEG_5 DATA_VA = 0x0000002123516000
attr_data {
	Name	 = .CP_AIUP_SEG_5,
	VA	 = 0x0000002123516000,
	RA	 = 0x0000004a5a55a000,
	PA	 = ra2pa(0x0000004a5a55a000,0),
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xc0e1a75ae735a1a7
.xword 0x31e1f9568d7bc7f0
.xword 0x7f904f58394a9c62
.xword 0x70184ad948235845
.xword 0x986577632332a346
.xword 0xac3271853db3f62b
.xword 0xfa4e862134908bfc
.xword 0x5e2b0223431c3e84




SECTION .CP_AIUP_SEG_6 DATA_VA = 0x000000212351a000
attr_data {
	Name	 = .CP_AIUP_SEG_6,
	VA	 = 0x000000212351a000,
	RA	 = 0x0000004a5a55c000,
	PA	 = ra2pa(0x0000004a5a55c000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xf7ff6f532c59982c
.xword 0x6609ffa93590877a
.xword 0xef834f85c667e8f7
.xword 0x31e9e08a9a50c00c
.xword 0x53a209fbbb519d7e
.xword 0xefbd088f73580512
.xword 0xa2ce7c44f5a5c258
.xword 0x433d5a374daedca5




SECTION .CP_AIUP_SEG_7 DATA_VA = 0x000000212351e000
attr_data {
	Name	 = .CP_AIUP_SEG_7,
	VA	 = 0x000000212351e000,
	RA	 = 0x0000004a5a55e000,
	PA	 = ra2pa(0x0000004a5a55e000,0),
	part_0_ctx_nonzero_tsb_config_1,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x27d60cd9a59c289d
.xword 0xa0342cca6223b673
.xword 0x54a663a24b69c5e0
.xword 0x1e9b808d41dfb54d
.xword 0x613fed994f4ef72b
.xword 0x8346bdfddf9dba12
.xword 0x9af82d33ce816d06
.xword 0xd3171540b58ea7df






SECTION .NC_AIUP_SEG_0 DATA_VA = 0x00000045254a0000
attr_data {
	Name	 = .NC_AIUP_SEG_0,
	VA	 = 0x00000045254a0000,
	RA	 = 0x00000045256a0000,
	PA	 = ra2pa(0x00000045256a0000,0),
	part_0_ctx_nonzero_tsb_config_1,
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
	TTE_W	 = 0
}

.xword 0xd4c836467d18d666
.xword 0x04c57319d2780191
.xword 0x4932ca667fbad5eb
.xword 0x3df412a947e6af94
.xword 0xf5ec8171054af207
.xword 0xa2c00d13c4d33d80
.xword 0x1ee54616c96d982d
.xword 0xf339a45cbbc4fa1f




SECTION .NC_AIUP_SEG_1 DATA_VA = 0x00000045254a2000
attr_data {
	Name	 = .NC_AIUP_SEG_1,
	VA	 = 0x00000045254a2000,
	RA	 = 0x00000045256a2000,
	PA	 = ra2pa(0x00000045256a2000,0),
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xd952970402390fe1
.xword 0x83e34364c03e6692
.xword 0x6697f34112efb111
.xword 0xa046b1e2054deddd
.xword 0xeeb85d652c655c6d
.xword 0x96cf6baf7938a09f
.xword 0xe5eb47e2e689262d
.xword 0xb385e25ce1d584d4




SECTION .NC_AIUP_SEG_2 DATA_VA = 0x00000045254a4000
attr_data {
	Name	 = .NC_AIUP_SEG_2,
	VA	 = 0x00000045254a4000,
	RA	 = 0x00000045256a4000,
	PA	 = ra2pa(0x00000045256a4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb350adb2d9b5b60e
.xword 0x978020ecc92bd84d
.xword 0x7b0e354665f24a76
.xword 0xa34e4d1027363e51
.xword 0xb53622769ea60c57
.xword 0xe69bc51a3ce23064
.xword 0xb567491a1c805047
.xword 0xf57c4371b18e12c1




SECTION .NC_AIUP_SEG_3 DATA_VA = 0x00000045254a6000
attr_data {
	Name	 = .NC_AIUP_SEG_3,
	VA	 = 0x00000045254a6000,
	RA	 = 0x00000045256a6000,
	PA	 = ra2pa(0x00000045256a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x0cd2d9dff4e23ddc
.xword 0xaffaa53b1211ea59
.xword 0xc7d19cb96f25ac3f
.xword 0x7a0b67663f2ad597
.xword 0xe3320541772dcc20
.xword 0xd7b5005e567267d3
.xword 0xf1aa8fca17140dee
.xword 0x41b91d378ede7465




SECTION .NC_AIUP_SEG_4 DATA_VA = 0x00000045254a8000
attr_data {
	Name	 = .NC_AIUP_SEG_4,
	VA	 = 0x00000045254a8000,
	RA	 = 0x00000045256a8000,
	PA	 = ra2pa(0x00000045256a8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
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

.xword 0xd8b156ef1f8fe623
.xword 0x0a9e6a41ce798d89
.xword 0xad836eb79ee33f1d
.xword 0x11ee24d18ec8cb40
.xword 0xdaf1dbf6940d3a78
.xword 0x50d5da77cfd46fff
.xword 0xc3e851574d21084f
.xword 0xedbdb902761beda2




SECTION .NC_AIUP_SEG_5 DATA_VA = 0x00000045254aa000
attr_data {
	Name	 = .NC_AIUP_SEG_5,
	VA	 = 0x00000045254aa000,
	RA	 = 0x00000045256aa000,
	PA	 = ra2pa(0x00000045256aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xa0778584daed2e57
.xword 0x7a281f1f428b1ab7
.xword 0x4a62ac2d64646986
.xword 0xec2ed66a63d02e67
.xword 0x0b0ea7f54e25c42d
.xword 0xc6579a3b397c4429
.xword 0x97da8da3f049ee0c
.xword 0x45862a0ee5347d51




SECTION .NC_AIUP_SEG_6 DATA_VA = 0x00000045254ac000
attr_data {
	Name	 = .NC_AIUP_SEG_6,
	VA	 = 0x00000045254ac000,
	RA	 = 0x00000045256ac000,
	PA	 = ra2pa(0x00000045256ac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x3da0899f5557ffd1
.xword 0x2ef16ff03d86ce5d
.xword 0x454f5d9b11714758
.xword 0x80fd4bb1e20e7558
.xword 0x7c7d461c582d9c5b
.xword 0xd70afeef6256c693
.xword 0x6389194ea0eee3c8
.xword 0x8257591a5abd36bb




SECTION .NC_AIUP_SEG_7 DATA_VA = 0x00000045254ae000
attr_data {
	Name	 = .NC_AIUP_SEG_7,
	VA	 = 0x00000045254ae000,
	RA	 = 0x00000045256ae000,
	PA	 = ra2pa(0x00000045256ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x982e5c67283dc32b
.xword 0xfa957d58dd2fb89f
.xword 0x48d97efdbbb0a3fe
.xword 0x0742af92e8c88041
.xword 0x7434d45a5aff7df5
.xword 0x3169f088a793b679
.xword 0xefe6dcd79d9c0f7f
.xword 0x29bcb62b32516fb3






SECTION .CP_AIUS_SEG_0 DATA_VA = 0x00000049abc12000
attr_data {
	Name	 = .CP_AIUS_SEG_0,
	VA	 = 0x00000049abc12000,
	RA	 = 0x00000049abc12000,
	PA	 = ra2pa(0x00000049abc12000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x477061abf1ce5d2a
.xword 0x6e1d2675706de7e5
.xword 0x14a5bfb27dfb2c84
.xword 0x03f92695c23cede7
.xword 0xe2c205ecc2fcf3ba
.xword 0x545c56ad7ae28a87
.xword 0x9470661e3265ef07
.xword 0x5aa39f1b40ee0a1a




SECTION .CP_AIUS_SEG_1 DATA_VA = 0x00000049abc16000
attr_data {
	Name	 = .CP_AIUS_SEG_1,
	VA	 = 0x00000049abc16000,
	RA	 = 0x00000049abc16000,
	PA	 = ra2pa(0x00000049abc16000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x112105e05fedfd65
.xword 0x22a2823e17271dab
.xword 0x44c62e68319c21af
.xword 0x7bee8623e63c0266
.xword 0xb1df489665fcc8cf
.xword 0x114903a4133a8075
.xword 0xa69de8ad4266a454
.xword 0xfc3108bf8d673836




SECTION .CP_AIUS_SEG_2 DATA_VA = 0x00000049abc1a000
attr_data {
	Name	 = .CP_AIUS_SEG_2,
	VA	 = 0x00000049abc1a000,
	RA	 = 0x00000049abc1a000,
	PA	 = ra2pa(0x00000049abc1a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x44e1d57cbab2f979
.xword 0x3060e2943de5eea9
.xword 0x0f813fdc0d1c164d
.xword 0xb95cdaa4b8556971
.xword 0x21bdaf814871e603
.xword 0xf7946b352e9a62ca
.xword 0xc688ae29299dd739
.xword 0xa7cd7d21ff954a1c




SECTION .CP_AIUS_SEG_3 DATA_VA = 0x00000049abc1e000
attr_data {
	Name	 = .CP_AIUS_SEG_3,
	VA	 = 0x00000049abc1e000,
	RA	 = 0x00000049abc1e000,
	PA	 = ra2pa(0x00000049abc1e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xc7e2907774f920ff
.xword 0xbdd0a19be97d0ab2
.xword 0xb3380b0066d2aace
.xword 0x07e5a2a2a0b14946
.xword 0xd3c0fbd79878a30c
.xword 0x1726264c646f8f47
.xword 0x67a9152816d337e3
.xword 0x5316fb0d456a4abd






SECTION .NC_AIUS_SEG_0 DATA_VA = 0x0000004def1a2000
attr_data {
	Name	 = .NC_AIUS_SEG_0,
	VA	 = 0x0000004def1a2000,
	RA	 = 0x0000004def1a2000,
	PA	 = ra2pa(0x0000004def1a2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd20af01ea71556a7
.xword 0xc21b254b1b190f84
.xword 0x3712d85cc4a9e15e
.xword 0x038d1154f393de26
.xword 0xd14a9874245d39e8
.xword 0xd9509f7c71fb3cfe
.xword 0x1412e2daf8ea6b79
.xword 0xa3570d94279107f1




SECTION .NC_AIUS_SEG_1 DATA_VA = 0x0000004def1a6000
attr_data {
	Name	 = .NC_AIUS_SEG_1,
	VA	 = 0x0000004def1a6000,
	RA	 = 0x0000004def1a6000,
	PA	 = ra2pa(0x0000004def1a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xabf49ac819c9553c
.xword 0x67ebddeab73c5363
.xword 0x0c26565b765344b9
.xword 0x7dbb94a675d3174a
.xword 0x58f7da466f5ae5a3
.xword 0x378c581a8d49cd51
.xword 0x5f7b94a98dfee616
.xword 0xcbd71bc7fb89507c




SECTION .NC_AIUS_SEG_2 DATA_VA = 0x0000004def1aa000
attr_data {
	Name	 = .NC_AIUS_SEG_2,
	VA	 = 0x0000004def1aa000,
	RA	 = 0x0000004def1aa000,
	PA	 = ra2pa(0x0000004def1aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x477a328708304e77
.xword 0x9091a9618bca04d5
.xword 0x280b63b79f127ed3
.xword 0x20be3a9962b17f78
.xword 0xecb53e2fd3cec019
.xword 0xf35c9ae6d19a8568
.xword 0x39728df16f04a5a7
.xword 0xb7eaa053a0df9991




SECTION .NC_AIUS_SEG_3 DATA_VA = 0x0000004def1ae000
attr_data {
	Name	 = .NC_AIUS_SEG_3,
	VA	 = 0x0000004def1ae000,
	RA	 = 0x0000004def1ae000,
	PA	 = ra2pa(0x0000004def1ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x603884de29b31569
.xword 0xbc614fdc81406987
.xword 0xe8b44197acbaedbc
.xword 0x902971946c3cf827
.xword 0x769c790e9587d3f6
.xword 0xb442e634c98a73cb
.xword 0x2364ce20ca78b31f
.xword 0x21d42fe29175056b




SECTION .NC_AIUS_SEG_4 DATA_VA = 0x0000004def1b2000
attr_data {
	Name	 = .NC_AIUS_SEG_4,
	VA	 = 0x0000004def1b2000,
	RA	 = 0x0000004def1b2000,
	PA	 = ra2pa(0x0000004def1b2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x23493f540202458f
.xword 0x1b83a12a09b1ef95
.xword 0x0abfaab5bd2a32b6
.xword 0x05bb5852ff957179
.xword 0x214ec8afb4d75be8
.xword 0x69f6f416d2b1bd61
.xword 0x5cd64efa5a440d8f
.xword 0xc3f8da804d8ca337




SECTION .NC_AIUS_SEG_5 DATA_VA = 0x0000004def1b6000
attr_data {
	Name	 = .NC_AIUS_SEG_5,
	VA	 = 0x0000004def1b6000,
	RA	 = 0x0000004def1b6000,
	PA	 = ra2pa(0x0000004def1b6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x8f868d4a31415b07
.xword 0x7a9a2345bee22744
.xword 0x914d21ca9530dc01
.xword 0x44e122ea6458657e
.xword 0x7e4c439fcd97a8b7
.xword 0x5fef46d7c4040064
.xword 0xed92d436dfc3bd85
.xword 0x284992215d079595




SECTION .NC_AIUS_SEG_6 DATA_VA = 0x0000004def1ba000
attr_data {
	Name	 = .NC_AIUS_SEG_6,
	VA	 = 0x0000004def1ba000,
	RA	 = 0x0000004def1ba000,
	PA	 = ra2pa(0x0000004def1ba000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xaa977386220973df
.xword 0x9b7307d865ae61c8
.xword 0x9262f80b5ff26d17
.xword 0x60148bea1577259d
.xword 0x2d4d41853a293210
.xword 0x6f3e5b28072bdfb6
.xword 0x67cdcb13b9f987d0
.xword 0x83d44e54b98e7321




SECTION .NC_AIUS_SEG_7 DATA_VA = 0x0000004def1be000
attr_data {
	Name	 = .NC_AIUS_SEG_7,
	VA	 = 0x0000004def1be000,
	RA	 = 0x0000004def1be000,
	PA	 = ra2pa(0x0000004def1be000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x4104ef615a2a7eb6
.xword 0x6f7916c040e25cf7
.xword 0xd3690dbe93706d35
.xword 0xd105d066d1d760a1
.xword 0xd6dd3eb6aa0362c3
.xword 0xb3e9b77db9f6282a
.xword 0xede629d7da88e1f8
.xword 0x24bf4db7afb3e52e




#if 0
#endif
