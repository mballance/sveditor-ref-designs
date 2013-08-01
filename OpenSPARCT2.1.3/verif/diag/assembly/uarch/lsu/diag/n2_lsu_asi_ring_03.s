/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_lsu_asi_ring_03.s
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
	setx 0x84fdea4764689665, %g1, %r2
	setx 0xb286c80fd420d609, %g1, %r3
	setx 0x61a82c0da26f4bbb, %g1, %r4
	setx 0x3da7bddbc417ddf8, %g1, %r5
	setx 0xb9a993c069991137, %g1, %r6
	setx 0xafefa488678d54b7, %g1, %r7
	setx 0x51968ec7d209e3f4, %g1, %r8

     mov %r2, %r1
ld_fast_deter_sync_ffffffff_0:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
st_fast_deter_nonsync_ffffffff_1:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 1: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_2:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_3:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 3: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_4:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 4: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd0502380  ! 5: LDSH_I	ldsh	[%r0 + 0x0380], %r8
ld_local_indet_sync_ffffffff_5:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 6: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd6302300  ! 7: STH_I	sth	%r11, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_6:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 8: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_7:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd2d84420  ! 9: LDXA_R	ldxa	[%r1, %r0] 0x21, %r9
ld_fast_deter_sync_ffffffff_8:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd2d84980  ! 10: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r9
ld_fast_indet_sync_ffffffff_9:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 11: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_10:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 12: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_11:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 13: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_12:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdad84860  ! 14: LDXA_R	ldxa	[%r1, %r0] 0x43, %r13
ld_local_deter_sync_ffffffff_13:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 15: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_local_indet_sync_ffffffff_14:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 16: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_15:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 17: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_16:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x58) 
	.word 0xdcd84b00  ! 18: LDXA_R	ldxa	[%r1, %r0] 0x58, %r14
st_fast_deter_nonsync_ffffffff_17:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 19: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_18:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 20: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_19:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 21: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
	.word 0xdc482380  ! 22: LDSB_I	ldsb	[%r0 + 0x0380], %r14
ld_local_indet_sync_ffffffff_20:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd0282300  ! 24: STB_I	stb	%r8, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_21:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 25: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xd2302380  ! 26: STH_I	sth	%r9, [%r0 + 0x0380]
ld_local_indet_sync_ffffffff_22:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 27: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_23:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
	.word 0xd4502380  ! 29: LDSH_I	ldsh	[%r0 + 0x0380], %r10
	.word 0xd2282300  ! 30: STB_I	stb	%r9, [%r0 + 0x0300]
ld_fast_deter_sync_ffffffff_24:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 31: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
st_fast_deter_nonsync_ffffffff_25:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 32: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_26:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 33: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_27:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 34: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_indet_sync_ffffffff_28:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 35: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xde482300  ! 36: LDSB_I	ldsb	[%r0 + 0x0300], %r15
ld_fast_deter_sync_ffffffff_29:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 37: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
st_fast_deter_nonsync_ffffffff_30:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 38: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
	.word 0xde502240  ! 39: LDSH_I	ldsh	[%r0 + 0x0240], %r15
st_fast_deter_nonsync_ffffffff_31:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 40: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
	.word 0xd0282200  ! 41: STB_I	stb	%r8, [%r0 + 0x0200]
ld_fast_indet_sync_ffffffff_32:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 42: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
	.word 0xda302300  ! 43: STH_I	sth	%r13, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_33:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 44: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_deter_sync_ffffffff_34:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xd8d84400  ! 45: LDXA_R	ldxa	[%r1, %r0] 0x20, %r12
ld_local_deter_sync_ffffffff_35:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 46: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
st_fast_deter_nonsync_ffffffff_36:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 47: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_37:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 48: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
	.word 0xd6502280  ! 49: LDSH_I	ldsh	[%r0 + 0x0280], %r11
ld_local_deter_sync_ffffffff_38:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 50: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_deter_sync_ffffffff_39:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 51: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
	.word 0xd6482200  ! 52: LDSB_I	ldsb	[%r0 + 0x0200], %r11
ld_fast_indet_sync_ffffffff_40:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 53: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xda502380  ! 54: LDSH_I	ldsh	[%r0 + 0x0380], %r13
st_fast_deter_nonsync_ffffffff_41:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 55: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 56: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xdc282300  ! 57: STB_I	stb	%r14, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_43:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 58: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
	.word 0xd63023c0  ! 59: STH_I	sth	%r11, [%r0 + 0x03c0]
	.word 0xd04823c0  ! 60: LDSB_I	ldsb	[%r0 + 0x03c0], %r8
ld_local_deter_sync_ffffffff_44:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 61: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_deter_sync_ffffffff_45:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 62: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_46:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 63: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
st_fast_deter_nonsync_ffffffff_47:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 64: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_48:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 65: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_49:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 66: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
ld_local_indet_sync_ffffffff_50:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 67: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd8302340  ! 68: STH_I	sth	%r12, [%r0 + 0x0340]
ld_fast_indet_sync_ffffffff_51:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 69: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_52:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xdc2822c0  ! 71: STB_I	stb	%r14, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_53:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 72: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_54:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 73: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xd05023c0  ! 74: LDSH_I	ldsh	[%r0 + 0x03c0], %r8
ld_local_indet_sync_ffffffff_55:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 75: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_56:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 76: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xdc4822c0  ! 77: LDSB_I	ldsb	[%r0 + 0x02c0], %r14
ld_fast_deter_sync_ffffffff_57:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 78: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
st_fast_deter_nonsync_ffffffff_58:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 79: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_59:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 80: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_fast_indet_sync_ffffffff_60:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 81: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_61:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 82: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_deter_sync_ffffffff_62:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 83: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
	.word 0xd4302340  ! 84: STH_I	sth	%r10, [%r0 + 0x0340]
	.word 0xda302300  ! 85: STH_I	sth	%r13, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_63:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 86: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_64:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 87: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd6482280  ! 88: LDSB_I	ldsb	[%r0 + 0x0280], %r11
ld_local_deter_sync_ffffffff_65:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 89: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_indet_sync_ffffffff_66:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 90: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_67:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 91: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_68:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 92: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
st_fast_deter_nonsync_ffffffff_69:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 93: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_70:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 94: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_71:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 95: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_72:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 96: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_local_indet_sync_ffffffff_73:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 97: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_74:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xded84a40  ! 98: LDXA_R	ldxa	[%r1, %r0] 0x52, %r15
ld_fast_indet_sync_ffffffff_75:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 99: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd6502300  ! 100: LDSH_I	ldsh	[%r0 + 0x0300], %r11
	.word 0xdc502200  ! 101: LDSH_I	ldsh	[%r0 + 0x0200], %r14
ld_local_indet_sync_ffffffff_76:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 102: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd03023c0  ! 103: STH_I	sth	%r8, [%r0 + 0x03c0]
ld_local_deter_sync_ffffffff_77:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 104: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_deter_sync_ffffffff_78:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 105: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
	.word 0xd2302300  ! 106: STH_I	sth	%r9, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_79:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 107: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_80:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xdad849e0  ! 108: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r13
	.word 0xd8482380  ! 109: LDSB_I	ldsb	[%r0 + 0x0380], %r12
ld_local_indet_sync_ffffffff_81:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 110: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_82:
	nop
	mov 0x218, %r1 	! (VA for ASI 0x52) 
	.word 0xd2d84a40  ! 111: LDXA_R	ldxa	[%r1, %r0] 0x52, %r9
ld_local_deter_sync_ffffffff_83:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 112: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_84:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 113: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_85:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 114: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_86:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 115: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_87:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 116: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_88:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 117: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_90:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 119: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xde282340  ! 120: STB_I	stb	%r15, [%r0 + 0x0340]
	.word 0xd4282280  ! 121: STB_I	stb	%r10, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_91:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 122: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
st_fast_deter_nonsync_ffffffff_92:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 123: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_93:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 124: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_94:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 125: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_95:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 126: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_local_deter_sync_ffffffff_96:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 127: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_indet_sync_ffffffff_97:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 128: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_98:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_99:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 130: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_indet_sync_ffffffff_100:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 131: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xde502200  ! 132: LDSH_I	ldsh	[%r0 + 0x0200], %r15
ld_local_deter_sync_ffffffff_101:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 133: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_102:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 134: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_103:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 135: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xd8302380  ! 136: STH_I	sth	%r12, [%r0 + 0x0380]
	.word 0xd84823c0  ! 137: LDSB_I	ldsb	[%r0 + 0x03c0], %r12
ld_local_indet_sync_ffffffff_104:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 138: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_105:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 139: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
	.word 0xdc4822c0  ! 140: LDSB_I	ldsb	[%r0 + 0x02c0], %r14
st_fast_deter_nonsync_ffffffff_106:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 141: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_107:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 142: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_108:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 143: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_109:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 144: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_110:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 145: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
	.word 0xd0302300  ! 146: STH_I	sth	%r8, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_111:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 147: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
	.word 0xd6482300  ! 148: LDSB_I	ldsb	[%r0 + 0x0300], %r11
ld_local_deter_sync_ffffffff_112:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 149: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_indet_sync_ffffffff_113:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 150: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_114:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 151: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_115:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 152: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_deter_sync_ffffffff_116:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xdcd84980  ! 153: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r14
ld_local_deter_sync_ffffffff_117:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 154: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_indet_sync_ffffffff_118:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 155: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd0282300  ! 156: STB_I	stb	%r8, [%r0 + 0x0300]
ld_fast_deter_sync_ffffffff_119:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xdcd848a0  ! 157: LDXA_R	ldxa	[%r1, %r0] 0x45, %r14
	.word 0xd2302200  ! 158: STH_I	sth	%r9, [%r0 + 0x0200]
ld_fast_indet_sync_ffffffff_120:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 159: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_121:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 160: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_122:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 161: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_indet_sync_ffffffff_123:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 162: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd4502340  ! 163: LDSH_I	ldsh	[%r0 + 0x0340], %r10
ld_fast_indet_sync_ffffffff_124:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 164: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_125:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 165: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_deter_sync_ffffffff_126:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 166: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
ld_fast_deter_sync_ffffffff_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd0d84e40  ! 167: LDXA_R	ldxa	[%r1, %r0] 0x72, %r8
	.word 0xda2822c0  ! 168: STB_I	stb	%r13, [%r0 + 0x02c0]
ld_local_deter_sync_ffffffff_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 169: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_local_indet_sync_ffffffff_129:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 170: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_130:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 171: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_131:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 172: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_132:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 173: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_133:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 174: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_134:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 175: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
st_fast_deter_nonsync_ffffffff_135:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 176: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_136:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 177: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_local_deter_sync_ffffffff_137:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 178: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_indet_sync_ffffffff_138:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 179: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd2502340  ! 180: LDSH_I	ldsh	[%r0 + 0x0340], %r9
ld_local_indet_sync_ffffffff_139:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 181: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd2502280  ! 182: LDSH_I	ldsh	[%r0 + 0x0280], %r9
	.word 0xdc302240  ! 183: STH_I	sth	%r14, [%r0 + 0x0240]
st_fast_deter_nonsync_ffffffff_140:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 184: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_141:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xdcd844a0  ! 185: LDXA_R	ldxa	[%r1, %r0] 0x25, %r14
	.word 0xdc282300  ! 186: STB_I	stb	%r14, [%r0 + 0x0300]
	.word 0xd8282300  ! 187: STB_I	stb	%r12, [%r0 + 0x0300]
	.word 0xda302200  ! 188: STH_I	sth	%r13, [%r0 + 0x0200]
	.word 0xd2502340  ! 189: LDSH_I	ldsh	[%r0 + 0x0340], %r9
ld_local_deter_sync_ffffffff_142:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 190: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_143:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 191: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_144:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 192: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_145:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 193: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_146:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 194: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
	.word 0xde282300  ! 195: STB_I	stb	%r15, [%r0 + 0x0300]
	.word 0xd63022c0  ! 196: STH_I	sth	%r11, [%r0 + 0x02c0]
ld_fast_deter_sync_ffffffff_147:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdad84e40  ! 197: LDXA_R	ldxa	[%r1, %r0] 0x72, %r13
st_fast_deter_nonsync_ffffffff_148:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 198: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_149:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 199: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_150:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 200: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xda502280  ! 201: LDSH_I	ldsh	[%r0 + 0x0280], %r13
ld_fast_indet_sync_ffffffff_151:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 202: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_152:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 203: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
st_fast_deter_nonsync_ffffffff_153:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 204: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_154:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 205: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_155:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 206: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_156:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 207: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_157:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 208: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_158:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 209: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_159:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 210: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_160:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 211: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
	.word 0xd6482200  ! 212: LDSB_I	ldsb	[%r0 + 0x0200], %r11
ld_fast_indet_sync_ffffffff_161:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 213: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_162:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 214: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_163:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 215: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_164:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 216: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_165:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 217: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_166:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 218: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xd6282300  ! 219: STB_I	stb	%r11, [%r0 + 0x0300]
ld_local_indet_sync_ffffffff_167:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 220: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_168:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 221: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_169:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 222: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_deter_sync_ffffffff_170:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 223: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_171:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 224: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
st_fast_deter_nonsync_ffffffff_172:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 225: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
	.word 0xde502300  ! 226: LDSH_I	ldsh	[%r0 + 0x0300], %r15
	.word 0xda5023c0  ! 227: LDSH_I	ldsh	[%r0 + 0x03c0], %r13
ld_local_indet_sync_ffffffff_173:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 228: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_174:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 229: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_indet_sync_ffffffff_175:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 230: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_176:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 231: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
	.word 0xd05023c0  ! 232: LDSH_I	ldsh	[%r0 + 0x03c0], %r8
ld_local_indet_sync_ffffffff_177:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 233: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_178:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 234: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_179:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 235: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_180:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 236: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_181:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 237: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_182:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 238: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_183:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 239: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
	.word 0xd2482200  ! 240: LDSB_I	ldsb	[%r0 + 0x0200], %r9
	.word 0xd4502280  ! 241: LDSH_I	ldsh	[%r0 + 0x0280], %r10
ld_fast_indet_sync_ffffffff_184:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 242: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd8502300  ! 243: LDSH_I	ldsh	[%r0 + 0x0300], %r12
ld_local_indet_sync_ffffffff_185:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 244: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_186:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 245: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_187:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 246: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
ld_fast_deter_sync_ffffffff_188:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 247: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
	.word 0xd2502300  ! 248: LDSH_I	ldsh	[%r0 + 0x0300], %r9
ld_fast_indet_sync_ffffffff_189:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 249: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_190:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 250: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd44823c0  ! 251: LDSB_I	ldsb	[%r0 + 0x03c0], %r10
ld_fast_indet_sync_ffffffff_191:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 252: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_192:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 253: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
	.word 0xd8482280  ! 254: LDSB_I	ldsb	[%r0 + 0x0280], %r12
ld_fast_deter_sync_ffffffff_193:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xd6d84a00  ! 255: LDXA_R	ldxa	[%r1, %r0] 0x50, %r11
ld_fast_indet_sync_ffffffff_194:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 256: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_195:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 257: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
	.word 0xd2282340  ! 258: STB_I	stb	%r9, [%r0 + 0x0340]
	.word 0xd44823c0  ! 259: LDSB_I	ldsb	[%r0 + 0x03c0], %r10
st_fast_deter_nonsync_ffffffff_196:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 260: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_197:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 261: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
st_fast_deter_nonsync_ffffffff_198:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 262: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_199:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd4d84420  ! 263: LDXA_R	ldxa	[%r1, %r0] 0x21, %r10
ld_fast_indet_sync_ffffffff_200:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 264: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_201:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 265: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xdc3022c0  ! 266: STH_I	sth	%r14, [%r0 + 0x02c0]
ld_local_indet_sync_ffffffff_202:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 267: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_203:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 268: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_fast_deter_sync_ffffffff_204:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xd4d84400  ! 269: LDXA_R	ldxa	[%r1, %r0] 0x20, %r10
ld_local_deter_sync_ffffffff_205:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 270: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xd8302340  ! 271: STH_I	sth	%r12, [%r0 + 0x0340]
ld_local_deter_sync_ffffffff_206:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 272: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
	.word 0xda2823c0  ! 273: STB_I	stb	%r13, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_207:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 274: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_208:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 275: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_209:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 276: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd05023c0  ! 277: LDSH_I	ldsh	[%r0 + 0x03c0], %r8
ld_fast_deter_sync_ffffffff_210:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 278: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_fast_deter_sync_ffffffff_211:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 279: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
st_fast_deter_nonsync_ffffffff_212:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 280: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_213:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 281: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_214:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 282: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_215:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 283: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_216:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 284: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
ld_local_deter_sync_ffffffff_217:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 285: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xda482300  ! 286: LDSB_I	ldsb	[%r0 + 0x0300], %r13
ld_fast_indet_sync_ffffffff_218:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 287: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_219:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 288: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_220:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd8d84ba0  ! 289: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r12
ld_fast_indet_sync_ffffffff_221:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 290: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_222:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 291: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_223:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 292: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd8282300  ! 293: STB_I	stb	%r12, [%r0 + 0x0300]
ld_fast_indet_sync_ffffffff_224:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 294: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd2302300  ! 295: STH_I	sth	%r9, [%r0 + 0x0300]
ld_local_deter_sync_ffffffff_225:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 296: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_226:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xd6d84400  ! 297: LDXA_R	ldxa	[%r1, %r0] 0x20, %r11
ld_fast_indet_sync_ffffffff_227:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 298: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd2482240  ! 299: LDSB_I	ldsb	[%r0 + 0x0240], %r9
	.word 0xd2282240  ! 300: STB_I	stb	%r9, [%r0 + 0x0240]
ld_local_indet_sync_ffffffff_228:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 301: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_229:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 302: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_indet_sync_ffffffff_230:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 303: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_231:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 304: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
	.word 0xd0282340  ! 305: STB_I	stb	%r8, [%r0 + 0x0340]
	.word 0xd0502240  ! 306: LDSH_I	ldsh	[%r0 + 0x0240], %r8
ld_local_deter_sync_ffffffff_232:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 307: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_233:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 308: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_234:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 309: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_235:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 310: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_236:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 311: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
	.word 0xda282200  ! 312: STB_I	stb	%r13, [%r0 + 0x0200]
ld_fast_deter_sync_ffffffff_237:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 313: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
st_fast_deter_nonsync_ffffffff_238:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 314: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
	.word 0xd0282240  ! 315: STB_I	stb	%r8, [%r0 + 0x0240]
ld_fast_deter_sync_ffffffff_239:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 316: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_local_indet_sync_ffffffff_240:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 317: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_241:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 318: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_indet_sync_ffffffff_242:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 319: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
	.word 0xd24822c0  ! 320: LDSB_I	ldsb	[%r0 + 0x02c0], %r9
ld_local_indet_sync_ffffffff_243:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 321: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_244:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 322: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_245:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 323: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_246:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 324: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_247:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 325: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd2502340  ! 326: LDSH_I	ldsh	[%r0 + 0x0340], %r9
ld_local_indet_sync_ffffffff_248:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 327: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_249:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 328: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_local_deter_sync_ffffffff_250:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 329: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_251:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xdcd848a0  ! 330: LDXA_R	ldxa	[%r1, %r0] 0x45, %r14
ld_local_indet_sync_ffffffff_252:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 331: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xd6282280  ! 332: STB_I	stb	%r11, [%r0 + 0x0280]
ld_local_indet_sync_ffffffff_253:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 333: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_254:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 334: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_255:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 335: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_256:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xded84860  ! 336: LDXA_R	ldxa	[%r1, %r0] 0x43, %r15
ld_local_deter_sync_ffffffff_257:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 337: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_local_deter_sync_ffffffff_258:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 338: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xd6282280  ! 339: STB_I	stb	%r11, [%r0 + 0x0280]
ld_local_indet_sync_ffffffff_259:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 340: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_260:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 341: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_261:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 342: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_262:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 343: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_263:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 344: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
st_fast_deter_nonsync_ffffffff_264:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 345: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_265:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 346: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_266:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 347: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_267:
	nop
	mov 0x218, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 348: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
ld_fast_indet_sync_ffffffff_268:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 349: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_269:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 350: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd8482200  ! 351: LDSB_I	ldsb	[%r0 + 0x0200], %r12
st_fast_deter_nonsync_ffffffff_270:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 352: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_271:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 353: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_272:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 354: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd6302300  ! 355: STH_I	sth	%r11, [%r0 + 0x0300]
	.word 0xde502200  ! 356: LDSH_I	ldsh	[%r0 + 0x0200], %r15
ld_local_indet_sync_ffffffff_273:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 357: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_274:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 358: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xdc502340  ! 359: LDSH_I	ldsh	[%r0 + 0x0340], %r14
st_fast_deter_nonsync_ffffffff_275:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 360: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_276:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 361: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_277:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 362: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_indet_sync_ffffffff_278:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 363: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_279:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 364: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_280:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 365: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_deter_sync_ffffffff_281:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 366: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
	.word 0xdc282200  ! 367: STB_I	stb	%r14, [%r0 + 0x0200]
ld_local_deter_sync_ffffffff_282:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 368: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_deter_sync_ffffffff_283:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 369: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_284:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 370: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
ld_fast_indet_sync_ffffffff_285:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 371: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_286:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xdcd84420  ! 372: LDXA_R	ldxa	[%r1, %r0] 0x21, %r14
	.word 0xd6502280  ! 373: LDSH_I	ldsh	[%r0 + 0x0280], %r11
st_fast_deter_nonsync_ffffffff_287:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 374: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_288:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 375: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_deter_sync_ffffffff_289:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xd0d849e0  ! 376: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r8
ld_local_deter_sync_ffffffff_290:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 377: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xdc282280  ! 378: STB_I	stb	%r14, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_291:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xd2d84400  ! 379: LDXA_R	ldxa	[%r1, %r0] 0x20, %r9
ld_local_deter_sync_ffffffff_292:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 380: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_293:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd6d84a00  ! 381: LDXA_R	ldxa	[%r1, %r0] 0x50, %r11
	.word 0xdc482240  ! 382: LDSB_I	ldsb	[%r0 + 0x0240], %r14
ld_fast_indet_sync_ffffffff_294:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 383: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_295:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 384: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
ld_fast_indet_sync_ffffffff_296:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 385: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_297:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xdcd84a00  ! 386: LDXA_R	ldxa	[%r1, %r0] 0x50, %r14
ld_local_deter_sync_ffffffff_298:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 387: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_deter_sync_ffffffff_299:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 388: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
st_fast_deter_nonsync_ffffffff_300:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 389: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_301:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 390: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_deter_sync_ffffffff_302:
	nop
	mov 0x50, %r1 	! (VA for ASI 0x54) 
	.word 0xd8d84a80  ! 391: LDXA_R	ldxa	[%r1, %r0] 0x54, %r12
ld_local_indet_sync_ffffffff_303:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 392: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_304:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 393: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_deter_sync_ffffffff_305:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 394: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xd0302380  ! 395: STH_I	sth	%r8, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_306:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 396: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_307:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 397: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_308:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xd6d849e0  ! 398: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r11
ld_fast_indet_sync_ffffffff_309:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 399: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
	.word 0xdc482200  ! 400: LDSB_I	ldsb	[%r0 + 0x0200], %r14
st_fast_deter_nonsync_ffffffff_310:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 401: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xde502340  ! 402: LDSH_I	ldsh	[%r0 + 0x0340], %r15
	.word 0xdc2823c0  ! 403: STB_I	stb	%r14, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_311:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 404: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_312:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 405: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_313:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 406: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_314:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xdad84420  ! 407: LDXA_R	ldxa	[%r1, %r0] 0x21, %r13
ld_local_indet_sync_ffffffff_315:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 408: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xda302240  ! 409: STH_I	sth	%r13, [%r0 + 0x0240]
ld_local_indet_sync_ffffffff_316:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 410: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_317:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 411: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_local_deter_sync_ffffffff_318:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 412: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_319:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 413: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
ld_local_indet_sync_ffffffff_320:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 414: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_321:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 415: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_indet_sync_ffffffff_322:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 416: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_323:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 417: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
	.word 0xd6502240  ! 418: LDSH_I	ldsh	[%r0 + 0x0240], %r11
ld_fast_deter_sync_ffffffff_324:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd4d84420  ! 419: LDXA_R	ldxa	[%r1, %r0] 0x21, %r10
	.word 0xd24822c0  ! 420: LDSB_I	ldsb	[%r0 + 0x02c0], %r9
st_fast_deter_nonsync_ffffffff_325:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 421: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_326:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 422: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_327:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 423: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_328:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 424: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_329:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 425: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_330:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 426: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_331:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 427: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd05022c0  ! 428: LDSH_I	ldsh	[%r0 + 0x02c0], %r8
ld_local_indet_sync_ffffffff_332:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 429: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_333:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 430: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_334:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 431: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
	.word 0xd64823c0  ! 432: LDSB_I	ldsb	[%r0 + 0x03c0], %r11
ld_fast_deter_sync_ffffffff_335:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 433: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
ld_fast_indet_sync_ffffffff_336:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 434: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_337:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 435: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
	.word 0xd2282380  ! 436: STB_I	stb	%r9, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_338:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 437: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
	.word 0xd83023c0  ! 438: STH_I	sth	%r12, [%r0 + 0x03c0]
ld_fast_deter_sync_ffffffff_339:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 439: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
	.word 0xda282300  ! 440: STB_I	stb	%r13, [%r0 + 0x0300]
	.word 0xde302200  ! 441: STH_I	sth	%r15, [%r0 + 0x0200]
	.word 0xd65022c0  ! 442: LDSH_I	ldsh	[%r0 + 0x02c0], %r11
ld_local_indet_sync_ffffffff_340:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 443: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_341:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 444: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
	.word 0xd0502280  ! 445: LDSH_I	ldsh	[%r0 + 0x0280], %r8
ld_local_indet_sync_ffffffff_342:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 446: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_343:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 447: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_indet_sync_ffffffff_344:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 448: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_345:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 449: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
ld_fast_indet_sync_ffffffff_346:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 450: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_347:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 451: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd23022c0  ! 452: STH_I	sth	%r9, [%r0 + 0x02c0]
ld_local_deter_sync_ffffffff_348:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 453: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_indet_sync_ffffffff_349:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 454: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_350:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 455: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_351:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd4d84ba0  ! 456: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r10
ld_local_deter_sync_ffffffff_352:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 457: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_353:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 458: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xd2482300  ! 459: LDSB_I	ldsb	[%r0 + 0x0300], %r9
	.word 0xde2823c0  ! 460: STB_I	stb	%r15, [%r0 + 0x03c0]
ld_local_indet_sync_ffffffff_354:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 461: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_355:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 462: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_356:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 463: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_357:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 464: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_indet_sync_ffffffff_358:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_359:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 466: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd8482280  ! 467: LDSB_I	ldsb	[%r0 + 0x0280], %r12
ld_local_deter_sync_ffffffff_360:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 468: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_local_indet_sync_ffffffff_361:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 469: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_362:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 470: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_363:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 471: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_deter_sync_ffffffff_364:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd6d84a00  ! 472: LDXA_R	ldxa	[%r1, %r0] 0x50, %r11
ld_local_indet_sync_ffffffff_365:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 473: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_366:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 474: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xda5023c0  ! 475: LDSH_I	ldsh	[%r0 + 0x03c0], %r13
	.word 0xd23022c0  ! 476: STH_I	sth	%r9, [%r0 + 0x02c0]
ld_fast_indet_sync_ffffffff_367:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 477: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_368:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 478: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_369:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 479: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
ld_local_indet_sync_ffffffff_370:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 480: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xde282300  ! 481: STB_I	stb	%r15, [%r0 + 0x0300]
ld_local_indet_sync_ffffffff_371:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 482: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_372:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 483: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
ld_local_indet_sync_ffffffff_373:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 484: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_374:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 485: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_375:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 486: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_deter_sync_ffffffff_376:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd8d84a00  ! 487: LDXA_R	ldxa	[%r1, %r0] 0x50, %r12
ld_fast_deter_sync_ffffffff_377:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 488: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_deter_sync_ffffffff_378:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 489: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_379:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 490: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_380:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 491: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_381:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 492: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd4282380  ! 493: STB_I	stb	%r10, [%r0 + 0x0380]
ld_local_deter_sync_ffffffff_382:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 494: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd2282300  ! 495: STB_I	stb	%r9, [%r0 + 0x0300]
ld_fast_deter_sync_ffffffff_383:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 496: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_local_indet_sync_ffffffff_384:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 497: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_385:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 498: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_386:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 499: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
st_fast_deter_nonsync_ffffffff_387:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 500: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_388:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 501: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_389:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 502: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
	.word 0xd8482380  ! 503: LDSB_I	ldsb	[%r0 + 0x0380], %r12
st_fast_deter_nonsync_ffffffff_390:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 504: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_391:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 505: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_392:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 506: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_393:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 507: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_394:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 508: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_395:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 509: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_396:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 510: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_397:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 511: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_398:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 512: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_399:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 513: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_400:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 514: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_deter_sync_ffffffff_401:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 515: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_deter_sync_ffffffff_402:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 516: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
st_fast_deter_nonsync_ffffffff_403:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 517: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_404:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 518: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
st_fast_deter_nonsync_ffffffff_405:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 519: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
	.word 0xde502380  ! 520: LDSH_I	ldsh	[%r0 + 0x0380], %r15
ld_fast_deter_sync_ffffffff_406:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 521: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_local_deter_sync_ffffffff_407:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 522: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_deter_sync_ffffffff_408:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 523: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_deter_sync_ffffffff_409:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 524: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_local_indet_sync_ffffffff_410:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 525: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_411:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 526: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_412:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 527: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_413:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 528: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_414:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 529: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_415:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 530: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_fast_deter_sync_ffffffff_416:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xdad849e0  ! 531: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r13
ld_local_indet_sync_ffffffff_417:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 532: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_418:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 533: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
	.word 0xda4823c0  ! 534: LDSB_I	ldsb	[%r0 + 0x03c0], %r13
ld_fast_deter_sync_ffffffff_419:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 535: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_420:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 536: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_421:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 537: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xd8482300  ! 538: LDSB_I	ldsb	[%r0 + 0x0300], %r12
ld_local_indet_sync_ffffffff_422:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 539: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_423:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 540: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
	.word 0xda302340  ! 541: STH_I	sth	%r13, [%r0 + 0x0340]
	.word 0xd8302380  ! 542: STH_I	sth	%r12, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_424:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 543: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd0482300  ! 544: LDSB_I	ldsb	[%r0 + 0x0300], %r8
ld_fast_deter_sync_ffffffff_425:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 545: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_fast_indet_sync_ffffffff_426:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 546: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_427:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 547: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
	.word 0xde282380  ! 548: STB_I	stb	%r15, [%r0 + 0x0380]
	.word 0xd03023c0  ! 549: STH_I	sth	%r8, [%r0 + 0x03c0]
	.word 0xda4822c0  ! 550: LDSB_I	ldsb	[%r0 + 0x02c0], %r13
	.word 0xde3022c0  ! 551: STH_I	sth	%r15, [%r0 + 0x02c0]
ld_fast_indet_sync_ffffffff_428:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 552: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_429:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 553: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_430:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 554: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_431:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 555: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_432:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 556: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_indet_sync_ffffffff_433:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 557: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_434:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 558: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_fast_deter_sync_ffffffff_435:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 559: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
	.word 0xd2282380  ! 560: STB_I	stb	%r9, [%r0 + 0x0380]
ld_local_deter_sync_ffffffff_436:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 561: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
	.word 0xdc502280  ! 562: LDSH_I	ldsh	[%r0 + 0x0280], %r14
ld_fast_deter_sync_ffffffff_437:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xd0d849e0  ! 563: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r8
ld_local_deter_sync_ffffffff_438:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 564: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_439:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 565: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_440:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 566: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_441:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 567: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
ld_local_indet_sync_ffffffff_442:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 568: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd6482240  ! 569: LDSB_I	ldsb	[%r0 + 0x0240], %r11
	.word 0xd4502200  ! 570: LDSH_I	ldsh	[%r0 + 0x0200], %r10
ld_local_indet_sync_ffffffff_443:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 571: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_444:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 572: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_445:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 573: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_446:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xded84860  ! 574: LDXA_R	ldxa	[%r1, %r0] 0x43, %r15
ld_fast_indet_sync_ffffffff_447:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 575: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_448:
	nop
	mov 0x118, %r1 	! (VA for ASI 0x52) 
	.word 0xdcd84a40  ! 576: LDXA_R	ldxa	[%r1, %r0] 0x52, %r14
ld_fast_deter_sync_ffffffff_449:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 577: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
st_fast_deter_nonsync_ffffffff_450:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 578: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_451:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 579: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_452:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 580: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_453:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 581: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_454:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 582: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_455:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 583: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_456:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 584: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_indet_sync_ffffffff_457:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 585: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_458:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 586: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_459:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 587: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_460:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 588: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_461:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 589: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_462:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 590: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
	.word 0xd6302200  ! 591: STH_I	sth	%r11, [%r0 + 0x0200]
	.word 0xde3022c0  ! 592: STH_I	sth	%r15, [%r0 + 0x02c0]
ld_fast_indet_sync_ffffffff_463:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 593: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_464:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xd2d84400  ! 594: LDXA_R	ldxa	[%r1, %r0] 0x20, %r9
st_fast_deter_nonsync_ffffffff_465:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 595: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_466:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 596: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_467:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 597: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_468:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 598: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_469:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 599: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_470:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 600: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xda2822c0  ! 601: STB_I	stb	%r13, [%r0 + 0x02c0]
st_fast_deter_nonsync_ffffffff_471:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 602: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_472:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 603: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
	.word 0xda482200  ! 604: LDSB_I	ldsb	[%r0 + 0x0200], %r13
st_fast_deter_nonsync_ffffffff_473:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 605: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_474:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 606: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_indet_sync_ffffffff_475:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 607: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_476:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 608: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
ld_fast_indet_sync_ffffffff_477:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 609: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_478:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 610: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_479:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 611: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xde282280  ! 612: STB_I	stb	%r15, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_480:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 613: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
ld_local_indet_sync_ffffffff_481:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 614: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
	.word 0xd02823c0  ! 615: STB_I	stb	%r8, [%r0 + 0x03c0]
st_fast_deter_nonsync_ffffffff_482:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 616: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_483:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 617: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_indet_sync_ffffffff_484:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 618: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
	.word 0xda482240  ! 619: LDSB_I	ldsb	[%r0 + 0x0240], %r13
st_fast_deter_nonsync_ffffffff_485:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 620: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_486:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 621: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_487:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 622: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_488:
	nop
	mov 0x88, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 623: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_fast_deter_sync_ffffffff_489:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 624: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_fast_deter_sync_ffffffff_490:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 625: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
ld_local_deter_sync_ffffffff_491:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 626: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_492:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 627: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
	.word 0xd4502280  ! 628: LDSH_I	ldsh	[%r0 + 0x0280], %r10
st_fast_deter_nonsync_ffffffff_493:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 629: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_494:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 630: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_495:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 631: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_496:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 632: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_497:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 633: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_deter_sync_ffffffff_498:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xd0d84980  ! 634: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r8
ld_fast_indet_sync_ffffffff_499:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 635: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_500:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 636: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_501:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 637: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_502:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 638: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
st_fast_deter_nonsync_ffffffff_503:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 639: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_504:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 640: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd2302240  ! 641: STH_I	sth	%r9, [%r0 + 0x0240]
st_fast_deter_nonsync_ffffffff_505:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 642: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_506:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 643: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_507:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 644: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_508:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 645: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_509:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 646: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
	.word 0xd8502200  ! 647: LDSH_I	ldsh	[%r0 + 0x0200], %r12
ld_fast_deter_sync_ffffffff_510:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd6d84980  ! 648: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r11
ld_local_deter_sync_ffffffff_511:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 649: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd63023c0  ! 650: STH_I	sth	%r11, [%r0 + 0x03c0]
ld_fast_indet_sync_ffffffff_512:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 651: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_513:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 652: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xdc482380  ! 653: LDSB_I	ldsb	[%r0 + 0x0380], %r14
st_fast_deter_nonsync_ffffffff_514:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 654: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
	.word 0xda482300  ! 655: LDSB_I	ldsb	[%r0 + 0x0300], %r13
st_fast_deter_nonsync_ffffffff_515:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 656: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_516:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 657: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_517:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 658: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
	.word 0xda4823c0  ! 659: LDSB_I	ldsb	[%r0 + 0x03c0], %r13
	.word 0xd0302380  ! 660: STH_I	sth	%r8, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_518:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 661: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_519:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 662: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_520:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 663: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_indet_sync_ffffffff_521:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 664: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_522:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 665: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
st_fast_deter_nonsync_ffffffff_523:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 666: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_524:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 667: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_525:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 668: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_indet_sync_ffffffff_526:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 669: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd4502380  ! 670: LDSH_I	ldsh	[%r0 + 0x0380], %r10
st_fast_deter_nonsync_ffffffff_527:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 671: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_528:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 672: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_529:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 673: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
	.word 0xd8482300  ! 674: LDSB_I	ldsb	[%r0 + 0x0300], %r12
	.word 0xd4502280  ! 675: LDSH_I	ldsh	[%r0 + 0x0280], %r10
ld_fast_deter_sync_ffffffff_530:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 676: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
st_fast_deter_nonsync_ffffffff_531:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 677: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
	.word 0xd0302200  ! 678: STH_I	sth	%r8, [%r0 + 0x0200]
ld_local_indet_sync_ffffffff_532:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 679: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_533:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 680: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_534:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 681: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
st_fast_deter_nonsync_ffffffff_535:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 682: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_536:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 683: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_537:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 684: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_538:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 685: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
	.word 0xd8282280  ! 686: STB_I	stb	%r12, [%r0 + 0x0280]
ld_local_indet_sync_ffffffff_539:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 687: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd2502340  ! 688: LDSH_I	ldsh	[%r0 + 0x0340], %r9
ld_fast_deter_sync_ffffffff_540:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 689: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
ld_local_deter_sync_ffffffff_541:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 690: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_542:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 691: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
ld_local_indet_sync_ffffffff_543:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 692: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_544:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 693: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
st_fast_deter_nonsync_ffffffff_545:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 694: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_546:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 695: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_547:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 696: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_548:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 697: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_deter_sync_ffffffff_549:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 698: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_550:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 699: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_551:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 700: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_552:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 701: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_553:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 702: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
	.word 0xdc302280  ! 703: STH_I	sth	%r14, [%r0 + 0x0280]
	.word 0xda502380  ! 704: LDSH_I	ldsh	[%r0 + 0x0380], %r13
ld_local_indet_sync_ffffffff_554:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 705: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_555:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 706: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_556:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 707: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_557:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 708: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_558:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 709: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_559:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd4d84ba0  ! 710: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r10
ld_local_deter_sync_ffffffff_560:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 711: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
	.word 0xd22823c0  ! 712: STB_I	stb	%r9, [%r0 + 0x03c0]
	.word 0xdc482340  ! 713: LDSB_I	ldsb	[%r0 + 0x0340], %r14
st_fast_deter_nonsync_ffffffff_561:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 714: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_562:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 715: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_563:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 716: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_564:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 717: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_565:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 718: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_indet_sync_ffffffff_566:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 719: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_567:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 720: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_568:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 721: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_569:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 722: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_570:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 723: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_indet_sync_ffffffff_571:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 724: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_572:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd2d848a0  ! 725: LDXA_R	ldxa	[%r1, %r0] 0x45, %r9
	.word 0xd0502240  ! 726: LDSH_I	ldsh	[%r0 + 0x0240], %r8
st_fast_deter_nonsync_ffffffff_573:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 727: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_574:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 728: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xde4822c0  ! 729: LDSB_I	ldsb	[%r0 + 0x02c0], %r15
ld_fast_deter_sync_ffffffff_575:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd2d84980  ! 730: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r9
ld_local_indet_sync_ffffffff_576:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 731: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_577:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 732: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
ld_fast_indet_sync_ffffffff_578:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 733: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_579:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 734: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_580:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 735: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_581:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 736: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
ld_local_indet_sync_ffffffff_582:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 737: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_583:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 738: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
	.word 0xdc302380  ! 739: STH_I	sth	%r14, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_584:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 740: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_585:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 741: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_586:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 742: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
	.word 0xda482280  ! 743: LDSB_I	ldsb	[%r0 + 0x0280], %r13
ld_fast_deter_sync_ffffffff_587:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xdcd84400  ! 744: LDXA_R	ldxa	[%r1, %r0] 0x20, %r14
ld_fast_indet_sync_ffffffff_588:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 745: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_589:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 746: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_590:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 747: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
ld_fast_deter_sync_ffffffff_591:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdcd84ba0  ! 748: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r14
ld_fast_indet_sync_ffffffff_592:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 749: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_593:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 750: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_594:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd4d848a0  ! 751: LDXA_R	ldxa	[%r1, %r0] 0x45, %r10
ld_local_deter_sync_ffffffff_595:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 752: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_596:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 753: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
	.word 0xd0482300  ! 754: LDSB_I	ldsb	[%r0 + 0x0300], %r8
st_fast_deter_nonsync_ffffffff_597:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 755: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_598:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 756: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_599:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 757: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_600:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 758: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_601:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 759: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
st_fast_deter_nonsync_ffffffff_602:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 760: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_603:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 761: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_604:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 762: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_indet_sync_ffffffff_605:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 763: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_606:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 764: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_607:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 765: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
	.word 0xd8302300  ! 766: STH_I	sth	%r12, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_608:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 767: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
	.word 0xd83022c0  ! 768: STH_I	sth	%r12, [%r0 + 0x02c0]
ld_fast_indet_sync_ffffffff_609:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 769: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_610:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 770: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
st_fast_deter_nonsync_ffffffff_611:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 771: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_612:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 772: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xd2482300  ! 773: LDSB_I	ldsb	[%r0 + 0x0300], %r9
st_fast_deter_nonsync_ffffffff_613:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 774: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_614:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 775: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_615:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 776: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_616:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 777: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_617:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 778: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_618:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xd2d84420  ! 779: LDXA_R	ldxa	[%r1, %r0] 0x21, %r9
ld_fast_deter_sync_ffffffff_619:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xdad849e0  ! 780: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r13
	.word 0xda482340  ! 781: LDSB_I	ldsb	[%r0 + 0x0340], %r13
ld_fast_indet_sync_ffffffff_620:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 782: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
	.word 0xd4282300  ! 783: STB_I	stb	%r10, [%r0 + 0x0300]
st_fast_deter_nonsync_ffffffff_621:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 784: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_622:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 785: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
	.word 0xda482300  ! 786: LDSB_I	ldsb	[%r0 + 0x0300], %r13
ld_local_deter_sync_ffffffff_623:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 787: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_indet_sync_ffffffff_624:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 788: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_625:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 789: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
st_fast_deter_nonsync_ffffffff_626:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 790: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
	.word 0xdc502200  ! 791: LDSH_I	ldsh	[%r0 + 0x0200], %r14
ld_local_indet_sync_ffffffff_627:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 792: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xde482300  ! 793: LDSB_I	ldsb	[%r0 + 0x0300], %r15
st_fast_deter_nonsync_ffffffff_628:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 794: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_629:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 795: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
	.word 0xd4502240  ! 796: LDSH_I	ldsh	[%r0 + 0x0240], %r10
ld_local_indet_sync_ffffffff_630:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 797: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_631:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 798: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_632:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 799: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_633:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 800: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
	.word 0xde5022c0  ! 801: LDSH_I	ldsh	[%r0 + 0x02c0], %r15
ld_fast_indet_sync_ffffffff_634:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 802: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_635:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 803: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
	.word 0xd8502200  ! 804: LDSH_I	ldsh	[%r0 + 0x0200], %r12
ld_local_indet_sync_ffffffff_636:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 805: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_637:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 806: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_deter_sync_ffffffff_638:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 807: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_639:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 808: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
	.word 0xde302240  ! 809: STH_I	sth	%r15, [%r0 + 0x0240]
ld_fast_deter_sync_ffffffff_640:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xd8d84400  ! 810: LDXA_R	ldxa	[%r1, %r0] 0x20, %r12
ld_local_deter_sync_ffffffff_641:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 811: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_642:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 812: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_643:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 813: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
	.word 0xda5022c0  ! 814: LDSH_I	ldsh	[%r0 + 0x02c0], %r13
	.word 0xda3022c0  ! 815: STH_I	sth	%r13, [%r0 + 0x02c0]
ld_local_indet_sync_ffffffff_644:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 816: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_645:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 817: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_646:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 818: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_647:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 819: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
st_fast_deter_nonsync_ffffffff_648:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 820: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_649:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 821: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_deter_sync_ffffffff_650:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 822: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_local_deter_sync_ffffffff_651:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 823: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
	.word 0xde502200  ! 824: LDSH_I	ldsh	[%r0 + 0x0200], %r15
	.word 0xd82823c0  ! 825: STB_I	stb	%r12, [%r0 + 0x03c0]
ld_local_deter_sync_ffffffff_652:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 826: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_deter_sync_ffffffff_653:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd4d84ba0  ! 827: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r10
ld_fast_indet_sync_ffffffff_654:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 828: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
	.word 0xda282380  ! 829: STB_I	stb	%r13, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_655:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 830: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_656:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 831: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
st_fast_deter_nonsync_ffffffff_657:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 832: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_658:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 833: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_659:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 834: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_660:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 835: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
	.word 0xd85022c0  ! 836: LDSH_I	ldsh	[%r0 + 0x02c0], %r12
ld_fast_deter_sync_ffffffff_661:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 837: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
st_fast_deter_nonsync_ffffffff_662:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 838: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_663:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 839: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
st_fast_deter_nonsync_ffffffff_664:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 840: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_665:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 841: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
st_fast_deter_nonsync_ffffffff_666:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 842: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_667:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 843: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd62823c0  ! 844: STB_I	stb	%r11, [%r0 + 0x03c0]
ld_local_indet_sync_ffffffff_668:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 845: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_669:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 846: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_670:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 847: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_671:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 848: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
ld_fast_indet_sync_ffffffff_672:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 849: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_673:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 850: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_indet_sync_ffffffff_674:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 851: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_675:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 852: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_676:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 853: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_677:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 854: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
	.word 0xde2822c0  ! 855: STB_I	stb	%r15, [%r0 + 0x02c0]
	.word 0xd6482300  ! 856: LDSB_I	ldsb	[%r0 + 0x0300], %r11
ld_fast_deter_sync_ffffffff_678:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xdcd84400  ! 857: LDXA_R	ldxa	[%r1, %r0] 0x20, %r14
	.word 0xd4302300  ! 858: STH_I	sth	%r10, [%r0 + 0x0300]
ld_fast_deter_sync_ffffffff_679:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdcd84a00  ! 859: LDXA_R	ldxa	[%r1, %r0] 0x50, %r14
ld_fast_indet_sync_ffffffff_680:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 860: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_681:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 861: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
ld_fast_deter_sync_ffffffff_682:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 862: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_local_deter_sync_ffffffff_683:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 863: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
	.word 0xda482280  ! 864: LDSB_I	ldsb	[%r0 + 0x0280], %r13
	.word 0xde482340  ! 865: LDSB_I	ldsb	[%r0 + 0x0340], %r15
ld_fast_deter_sync_ffffffff_684:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 866: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_local_indet_sync_ffffffff_685:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 867: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_686:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 868: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_687:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 869: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_688:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 870: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_689:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 871: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_690:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 872: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_691:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 873: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
	.word 0xd6282240  ! 874: STB_I	stb	%r11, [%r0 + 0x0240]
	.word 0xde5022c0  ! 875: LDSH_I	ldsh	[%r0 + 0x02c0], %r15
	.word 0xdc2822c0  ! 876: STB_I	stb	%r14, [%r0 + 0x02c0]
ld_local_indet_sync_ffffffff_692:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 877: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_693:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 878: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_deter_sync_ffffffff_694:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 879: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_695:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 880: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_696:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 881: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_697:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 882: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
	.word 0xd8482300  ! 883: LDSB_I	ldsb	[%r0 + 0x0300], %r12
ld_fast_indet_sync_ffffffff_698:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 884: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_699:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 885: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xde282340  ! 886: STB_I	stb	%r15, [%r0 + 0x0340]
ld_local_indet_sync_ffffffff_700:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 887: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_701:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 888: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_702:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 889: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_703:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 890: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd8502240  ! 891: LDSH_I	ldsh	[%r0 + 0x0240], %r12
ld_fast_deter_sync_ffffffff_704:
	nop
	mov 0x88, %r1 	! (VA for ASI 0x54) 
	.word 0xdad84a80  ! 892: LDXA_R	ldxa	[%r1, %r0] 0x54, %r13
	.word 0xd8302340  ! 893: STH_I	sth	%r12, [%r0 + 0x0340]
ld_fast_deter_sync_ffffffff_705:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 894: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_fast_indet_sync_ffffffff_706:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 895: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_707:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 896: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
st_fast_deter_nonsync_ffffffff_708:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 897: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_709:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 898: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
	.word 0xd4282380  ! 899: STB_I	stb	%r10, [%r0 + 0x0380]
ld_fast_indet_sync_ffffffff_710:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 900: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_711:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 901: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xd23023c0  ! 902: STH_I	sth	%r9, [%r0 + 0x03c0]
ld_local_indet_sync_ffffffff_712:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 903: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_713:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 904: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
	.word 0xd4302300  ! 905: STH_I	sth	%r10, [%r0 + 0x0300]
ld_local_indet_sync_ffffffff_714:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 906: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
	.word 0xd8282340  ! 907: STB_I	stb	%r12, [%r0 + 0x0340]
ld_local_deter_sync_ffffffff_715:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 908: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
st_fast_deter_nonsync_ffffffff_716:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 909: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_717:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xded84980  ! 910: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r15
ld_fast_indet_sync_ffffffff_718:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 911: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_719:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 912: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
st_fast_deter_nonsync_ffffffff_720:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 913: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_721:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 914: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_722:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 915: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_723:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 916: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_local_deter_sync_ffffffff_724:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 917: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
st_fast_deter_nonsync_ffffffff_725:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 918: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_726:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 919: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_727:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 920: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_728:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 921: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_indet_sync_ffffffff_729:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 922: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_730:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 923: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
	.word 0xd4302200  ! 924: STH_I	sth	%r10, [%r0 + 0x0200]
st_fast_deter_nonsync_ffffffff_731:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 925: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_732:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 926: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_fast_indet_sync_ffffffff_733:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 927: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_734:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 928: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_735:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 929: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_736:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 930: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_737:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdad84e40  ! 931: LDXA_R	ldxa	[%r1, %r0] 0x72, %r13
ld_local_indet_sync_ffffffff_738:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 932: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_739:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 933: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_740:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 934: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_741:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 935: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_742:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 936: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
	.word 0xd8302280  ! 937: STH_I	sth	%r12, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_743:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x54) 
	.word 0xd4d84a80  ! 938: LDXA_R	ldxa	[%r1, %r0] 0x54, %r10
st_fast_deter_nonsync_ffffffff_744:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 939: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_745:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 940: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
	.word 0xdc302240  ! 941: STH_I	sth	%r14, [%r0 + 0x0240]
ld_fast_deter_sync_ffffffff_746:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd6d84ba0  ! 942: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r11
ld_fast_indet_sync_ffffffff_747:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 943: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_748:
	nop
	mov 0x120, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 944: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
	.word 0xda502380  ! 945: LDSH_I	ldsh	[%r0 + 0x0380], %r13
st_fast_deter_nonsync_ffffffff_749:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 946: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_750:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xd2d849e0  ! 947: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r9
ld_local_deter_sync_ffffffff_751:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 948: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_indet_sync_ffffffff_752:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 949: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_753:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 950: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_754:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 951: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_755:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 952: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_756:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 953: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
st_fast_deter_nonsync_ffffffff_757:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 954: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_758:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 955: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_759:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 956: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_local_indet_sync_ffffffff_760:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 957: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_761:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 958: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_762:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 959: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_indet_sync_ffffffff_763:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 960: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_764:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xd6d84420  ! 961: LDXA_R	ldxa	[%r1, %r0] 0x21, %r11
ld_local_deter_sync_ffffffff_765:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 962: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
st_fast_deter_nonsync_ffffffff_766:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 963: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_767:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 964: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_768:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 965: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
ld_local_deter_sync_ffffffff_769:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 966: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
	.word 0xd6482200  ! 967: LDSB_I	ldsb	[%r0 + 0x0200], %r11
	.word 0xd2502300  ! 968: LDSH_I	ldsh	[%r0 + 0x0300], %r9
	.word 0xd6302280  ! 969: STH_I	sth	%r11, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_770:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 970: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
	.word 0xd43022c0  ! 971: STH_I	sth	%r10, [%r0 + 0x02c0]
	.word 0xde2823c0  ! 972: STB_I	stb	%r15, [%r0 + 0x03c0]
ld_fast_deter_sync_ffffffff_771:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 973: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
ld_fast_indet_sync_ffffffff_772:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 974: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_773:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 975: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_774:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 976: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
st_fast_deter_nonsync_ffffffff_775:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 977: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
	.word 0xdc282340  ! 978: STB_I	stb	%r14, [%r0 + 0x0340]
ld_local_indet_sync_ffffffff_776:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 979: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_777:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 980: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ld_local_indet_sync_ffffffff_778:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 981: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_779:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 982: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
	.word 0xd45022c0  ! 983: LDSH_I	ldsh	[%r0 + 0x02c0], %r10
ld_local_indet_sync_ffffffff_780:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 984: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_781:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 985: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_782:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 986: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_783:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 987: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
	.word 0xda282280  ! 988: STB_I	stb	%r13, [%r0 + 0x0280]
ld_fast_deter_sync_ffffffff_784:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 989: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
ld_fast_deter_sync_ffffffff_785:
	nop
	mov 0x58, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 990: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
ld_fast_indet_sync_ffffffff_786:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 991: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
	.word 0xd6482240  ! 992: LDSB_I	ldsb	[%r0 + 0x0240], %r11
st_fast_deter_nonsync_ffffffff_787:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 993: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_788:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 994: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_789:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 995: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_790:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 996: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_791:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 997: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_792:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 998: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
	.word 0xde302240  ! 999: STH_I	sth	%r15, [%r0 + 0x0240]
	.word 0xde2822c0  ! 1000: STB_I	stb	%r15, [%r0 + 0x02c0]
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop
# include "err_handlers.s"

main_data_start:
.xword 0xb5b89773481772ca
.xword 0x72e1771d6a24ab0a
.xword 0x2a597925db6b1a0d
.xword 0x796f6ad757bc1e44
.xword 0xf16f6e0e845844c0
.xword 0xcf9a0fe1cd83709b
.xword 0xf35a066ed71dba1d
.xword 0x2341b119b89f139b
.xword 0x446461eef8ba032c
.xword 0x9bff25151f67089d
.xword 0x36903b1407805807
.xword 0xab386627599eb603
.xword 0xcf1151b1adbb70d8
.xword 0x0d8adf05576b0b26
.xword 0x3fc7dfa8c78b533e
.xword 0x57a717cd27c9d096
.xword 0x2ec34996002dae0f
.xword 0x0060fefe77b0b928
.xword 0x4016881a5bfbc466
.xword 0xb66f61ac916595f4
.xword 0x6bb5ba92865b0c70
.xword 0x2109135288f3383c
.xword 0x37e4dd9416b1fc2d
.xword 0x64c09fa507f28aac
.xword 0xf0fac9adfd4d5d55
.xword 0x3b64dfa7a6b9d16c
.xword 0xbd60d8347536e9ca
.xword 0x2de473f21c5170e3
.xword 0xad883a39f9a90315
.xword 0xccda9d6abf3a183a
.xword 0xdcc7d33c7c13514b
.xword 0x68e8a3a684a5b004
.xword 0x0b64daa2ed45d0bb
.xword 0xa4001052ad7dd320
.xword 0xa86d42181d399a1f
.xword 0xeaf22e7ed5636fb5
.xword 0xb93bda965e1712e0
.xword 0xd14ca0f7c4b1da6f
.xword 0x5757225fa483f057
.xword 0xb0a95d0abc75d3df
.xword 0xf82afb369dd190ff
.xword 0xbda3c1bb5f8b1568
.xword 0x5dcfa76743b61441
.xword 0x2112baf0e030f60a
.xword 0xadfac98f54546624
.xword 0x5a69d5e21355b80f
.xword 0x591f986c0d134643
.xword 0xd8f9278f4e853a97
.xword 0x6862f2637fe96897
.xword 0x97f01f6e256a3225
.xword 0xa07e49c23613a2fc
.xword 0x2b567e94755ce2ba
.xword 0x460bd1803b7897e0
.xword 0x278b1a798e564bea
.xword 0x5dbacdd9cf731450
.xword 0xaa7842a814b4d67a
.xword 0x7b8b14884b83e3cf
.xword 0x915db93cfec91d50
.xword 0x4478f777985b4abd
.xword 0x6d5016449eec4c81
.xword 0xa52a3aa46ab55e6b
.xword 0x7e5093747240bcaa
.xword 0x2124dfdda07b303a
.xword 0xb02458106bda4b2b
.xword 0xfeb3998c72773a8b
.xword 0xdf89193f32ca9490
.xword 0x7841c5fcd436219b
.xword 0x85dd3d479186f98d
.xword 0x90bd968755943f7b
.xword 0xa28e4cfd670ce355
.xword 0x6ce2d57f8290b07e
.xword 0xef8a21749fe4bdb2
.xword 0xcb2794b880142152
.xword 0xa8017a3465c5065f
.xword 0x03e2304cb2201c22
.xword 0xd7965a02258efa15
.xword 0x244517bfa6107de6
.xword 0xd14da847b7cb2ab8
.xword 0x3028cf34646cec21
.xword 0xb555780b46a56f1a
.xword 0x45aab85cd5871e1e
.xword 0xb2a97411bf8e97d6
.xword 0x11741ff73d35501d
.xword 0x552d98a7eb5988f7
.xword 0x0dcf54a0a07f6745
.xword 0xe7784babf621c633
.xword 0x91189cc6c0df6edc
.xword 0xda9ca9e1840d5240
.xword 0x38a522547cfd6ff6
.xword 0x3715699845ec7e41
.xword 0x2312d2780bef9d8c
.xword 0xfad794cb7139ff57
.xword 0xb37f0c917fe76994
.xword 0x7299b7565e6be580
.xword 0x01b7980f89837c29
.xword 0xb13addfbd03c91c3



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
.global MEM_DATA0_START
MEM_DATA0_START:
.xword 0x76275b7088e55f55

.xword 0x4f65e1f89d11bebf

.xword 0x444880843d2a94c5

.xword 0xa0912a11263dd111

.xword 0xe74e3d5e8e08549b

.xword 0x67e333286a96a7ad

.xword 0xfb18bc58278b727b

.xword 0xd890307a7c65142f

.xword 0xeb4942be8c8c4147

.xword 0x8f5ba8b1275a5cb5

.xword 0x81a7c6142128d970

.xword 0x12ea8a068ca2f485

.xword 0x72be81709669c3c5

.xword 0xa025dee6e06671b2

.xword 0xd3d52c986dffe4f3

.xword 0xb0069287e2f06623

.xword 0x150aad34132d0f09

.xword 0xbbc6628687b04625

.xword 0xe0525645e155c395

.xword 0xf1502ded1c65f0f6

.xword 0x46245480d2887cbf

.xword 0x5e10b2f1aa182fb1

.xword 0x256f1cbf65b01bd3

.xword 0xb4af2667296aa667

.xword 0x1bcd682a3f80da54

.xword 0x55bfcbdf5bad8900

.xword 0x776cc658d2509ce7

.xword 0xd86a49fd645fc37d

.xword 0x9008b6fcc2129cbe

.xword 0x3a0bb1bbef36049b

.xword 0xaa0193c85174493a

.xword 0x48cf7bf42fee5024




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
.global MEM_DATA1_START
MEM_DATA1_START:
.xword 0xf6d9dc57ca62f09c
.xword 0xf5d4569e3754559a
.xword 0xab96fb5a1d136b7e
.xword 0xed823600a0c964d3
.xword 0x601f10e350aa22b6
.xword 0x51b0f73b72571e0b
.xword 0xd58cc4c823641f40
.xword 0x72f669a4ae90ce95
.xword 0x617bab8a1ebe3409




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

.data
.global MEM_DATA2_START
MEM_DATA2_START:
.xword 0x27cdb7ed21650592
.xword 0x322d1f71f5342353
.xword 0x932e703223f72bb3
.xword 0x4bf9a0cab5b373fc
.xword 0x4ac31b2bcb9fc934
.xword 0xffba39837b60dd56
.xword 0x1dca04e279c92467
.xword 0xdb7bcc2baa2800e6
.xword 0x8a8fb2c8667512bf




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
.global MEM_DATA3_START
MEM_DATA3_START:
.xword 0xc21253b3f7e73660
.xword 0xd29499d8cb6d49c0
.xword 0x29291724ad7bdd8d
.xword 0x0458dc1cdbb4cb33
.xword 0x2a8fc935ca973e3b
.xword 0x40f2cd58f2443935
.xword 0x468eddd1b829f10a
.xword 0xa429a93de17cacd4
.xword 0xcc1a7e4c921e2e22




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
.global MEM_DATA4_START
MEM_DATA4_START:
.xword 0x1dc3cf929c6969fb
.xword 0xf7a8c13abcaa533c
.xword 0x332a56d3ce7d9b28
.xword 0x63395241f8f81ba2
.xword 0x2439aeeb969e4c67
.xword 0x2b77dc0977deeb0c
.xword 0x17ae664f62f98e84
.xword 0x46498e23aec5279a
.xword 0x4ea54d2284cdaafa




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
.global MEM_DATA5_START
MEM_DATA5_START:
.xword 0x30feaf1a8ee4d0ca
.xword 0x3bc0b02eb7b0bd52
.xword 0xf24edc0d2041c10e
.xword 0xef6f48dc770f55d6
.xword 0x3f04ce40ab3776a1
.xword 0xdebef7ab92b53a5d
.xword 0xfc7d0a490e4a3b78
.xword 0xd8725fe80a70dfb1
.xword 0xfb7ab93e163518af




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
	TTE_W	 = 0
}

.data
.global MEM_DATA6_START
MEM_DATA6_START:
.xword 0x6986b222df8951c0
.xword 0xd8669a47dbca9062
.xword 0x5602711e5ffaa3f4
.xword 0xdfd2653b5e3ef830
.xword 0x83a750216fa824db
.xword 0x6f78d8df3b7e585c
.xword 0x7c4b7bccbe4bde64
.xword 0x29aeb042c9859e9a
.xword 0x6d2ead36d90709f4




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
.global MEM_DATA7_START
MEM_DATA7_START:
.xword 0x22085d9daac132b2
.xword 0xf9ca9acc8de5a894
.xword 0x12be6b10e3a0539d
.xword 0x001ad0b3b138835e
.xword 0x952e8aee002fe5e6
.xword 0xaeae439a645bacd9
.xword 0x9521461e98711466
.xword 0xddd79d1dc5751ec1
.xword 0x6cb01204a93d72f3




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
.global MEM_DATA8_START
MEM_DATA8_START:
.xword 0x43eb56462770062e
.xword 0xc7ccc81a490638b8
.xword 0xd2deceebafa22a3e
.xword 0xff00f250df0b29a4
.xword 0xfabb9bb9af51db67
.xword 0x4f27d15490a364c2
.xword 0x2838e705c978f480
.xword 0xc8008c74dedefff0
.xword 0xf3f7a67a9936b46b




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
.global MEM_DATA9_START
MEM_DATA9_START:
.xword 0xf2202ed05d3e3ff4
.xword 0x0c18b275b7a9ea41
.xword 0x8053b51622076105
.xword 0x2e67bff6c04f598e
.xword 0xf273226cf52f4213
.xword 0x4b1bc0eea1156072
.xword 0x5d4e24069a525990
.xword 0xed47e6326c4f18ee
.xword 0x355a58f05c9d57fc




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
	TTE_W	 = 0
}

.data
.global MEM_DATA10_START
MEM_DATA10_START:
.xword 0x7591740a2e783bf0
.xword 0xe260a3f26c01c938
.xword 0x27996aeb7ece3ad7
.xword 0xa80c5913834fe72c
.xword 0x7b5f2f1805c61ccd
.xword 0x5237682f24e0b758
.xword 0x23917bf523e27210
.xword 0x25e13f288d4ebf99
.xword 0x772fdfea5efb4264




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
.global MEM_DATA11_START
MEM_DATA11_START:
.xword 0xeea33d0acba597d9
.xword 0xe6442062d8cfc287
.xword 0xa96f6549804ff665
.xword 0x0e61e22f213b040a
.xword 0x5cf3872b985babee
.xword 0x9e2f86e121ff1c4d
.xword 0xc107484bb3b59908
.xword 0xd610477bfd87c5c2
.xword 0xf2c06461bc498c40




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
.global MEM_DATA12_START
MEM_DATA12_START:
.xword 0x9c618452d78badb3
.xword 0xf8986690f36726c0
.xword 0x58afc9b1b5970769
.xword 0x84fb0b64ced1f892
.xword 0x55aea7add7be4f93
.xword 0x3a09db99c618df00
.xword 0x25b1721c31c45918
.xword 0xbb85facbee170928
.xword 0x8c559d26390b70f1




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
.global MEM_DATA13_START
MEM_DATA13_START:
.xword 0x811bc4a05d677a0d
.xword 0xd788d089c5f39799
.xword 0xa855514aee6dbba7
.xword 0x49b4153d5025d272
.xword 0x62855d0ecc253bcb
.xword 0xb1131ce69ecb674e
.xword 0x95bd1cc72c60a49b
.xword 0x7b9f2e7e6cf0c7ef
.xword 0x8a7f851fdc9c7685




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
.global MEM_DATA14_START
MEM_DATA14_START:
.xword 0x84198d9afa53812d
.xword 0xc85d2a834e6e1b33
.xword 0x86d21477556e0621
.xword 0x3e4c4e8d152f4eb5
.xword 0x8ce415b072d0a806
.xword 0x34f6e6c6c0deeef8
.xword 0x1033f8858d9c31fe
.xword 0x009363ff20f66a09
.xword 0xc943db902d2cc351




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
.global MEM_DATA15_START
MEM_DATA15_START:
.xword 0x3ebe030be7f9f746
.xword 0xccd410ece6b82539
.xword 0xf7a0e8f5904bff6d
.xword 0x2f906a95a40e4bd7
.xword 0x3fb79456c966d500
.xword 0xc1fdc15c1524bf86
.xword 0x3d32ffc18bb0ef3c
.xword 0x8e31981caa69aafc
.xword 0x512dabd51631eeab




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
.global MEM_DATA16_START
MEM_DATA16_START:
.xword 0x77131e9c18e8755a
.xword 0x579bd483514c8185
.xword 0x204d72f4b279b625
.xword 0xd1283705b6928a02
.xword 0x50bd0ee64c6b1d52
.xword 0x18b2ab7c055733e2
.xword 0x44de4e5b092225bf
.xword 0x6039fd82fca54aff
.xword 0xba39ef49e94b7efb




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
.xword 0x88754e223b108b57
.xword 0x032ade15b2dd8757
.xword 0xb68c664f2042fd59
.xword 0xf91d343d33d9d594
.xword 0x6f7f740f2d358e28
.xword 0x789424b39598b48a
.xword 0x70dfc6de7cf50f1a
.xword 0x21bf922cb44139c2
.xword 0x5a27e299a08e61bc




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
.global MEM_DATA18_START
MEM_DATA18_START:
.xword 0x9625bb1c3d4d48ad
.xword 0x0e7edce1672ad89d
.xword 0x41215a87b7179484
.xword 0x6baf9a6bf5c4fb02
.xword 0xf7ed6aa2773f269c
.xword 0x34f68e228dc0c056
.xword 0x421980500e6c714d
.xword 0x33edc84f59281dbf
.xword 0x5090bfb31574dd23




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
	TTE_W	 = 0
}

.data
.global MEM_DATA19_START
MEM_DATA19_START:
.xword 0x5a99658ae4b99833
.xword 0x39ce3044d26430fb
.xword 0x5107b2b11a67fa9d
.xword 0xcd08eb98d298db64
.xword 0xd178f8a7c8cde098
.xword 0xe498dc3a941b03c3
.xword 0x8f2f9077eb59839b
.xword 0xf32dfc6e2cfef223
.xword 0x2d11fd3fd1df743d




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
.global MEM_DATA20_START
MEM_DATA20_START:
.xword 0xe73d1e8ff892574d
.xword 0xeb3e6c55ca66dc61
.xword 0x2c38421e53359867
.xword 0x5a832315fb8ffa59
.xword 0x8f7fcf11e79abb11
.xword 0xd20ec92cabd9c88f
.xword 0x7bce718b4f509084
.xword 0x5a1804eeb47f952e
.xword 0x87e7924a466983fe




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
.xword 0x0487652278bb534a
.xword 0x55ba8bca3ff7b6e9
.xword 0x69fb0416c2ee9a36
.xword 0xb37e9a775ba73e21
.xword 0xca3077eaa1b58e5d
.xword 0x789eeab3c84a2e07
.xword 0xcf8597c025b441fd
.xword 0xb7edc916761fa83d
.xword 0x067ccfb25cfc98ad




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

.data
.global MEM_DATA22_START
MEM_DATA22_START:
.xword 0x190a2aabb88c521d
.xword 0x198be26e86c623dc
.xword 0xc9f7c421bf2441b2
.xword 0x6f78af1dfddff0f2
.xword 0xdcbbeb33cd7dd9b5
.xword 0xb6517d954dc9eba4
.xword 0xd59a516246a8733d
.xword 0x2c6c41ab4cbf6b87
.xword 0x7b1610654a1b675d




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
.global MEM_DATA23_START
MEM_DATA23_START:
.xword 0x636bca8a42b6d31e
.xword 0xb90192ce4558e276
.xword 0x23acb84cdc2a7e15
.xword 0x8527ab2fce3ce49a
.xword 0xa1305b443210ef5f
.xword 0x1f6deef90616996d
.xword 0x87337567ebe6ce7f
.xword 0x0dcdfec5d6e9f6ac
.xword 0x330869a1535ad5d6




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
.global MEM_DATA24_START
MEM_DATA24_START:
.xword 0xfd2cfdaba4ab2c7c
.xword 0xd0a74cb262dab2f7
.xword 0x001f48cf939a9ab7
.xword 0xbef9ab4d961b2a24
.xword 0x91b6e93d5e3fdb44
.xword 0x5c3369dd9b997c98
.xword 0x0daf3d1fe32d5c21
.xword 0x79932307402647a1
.xword 0xd998f3bf59836a6a




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
.global MEM_DATA25_START
MEM_DATA25_START:
.xword 0x0b669574db8c9eed
.xword 0xf0f2cdee06d43909
.xword 0x39efa46b5bab406b
.xword 0xb6ee7c7cd3ae0cad
.xword 0x646717c2261298ba
.xword 0x0f53d45474e7a289
.xword 0x6cb3ee2267a0f331
.xword 0x6ebdafcef3e92ba2
.xword 0xc6b56db754ce255a




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
.global MEM_DATA26_START
MEM_DATA26_START:
.xword 0x14e859c7783386d0
.xword 0x20a8d98176541a16
.xword 0x842e39dd802779b3
.xword 0x5a7865e17d8e01ba
.xword 0xb5d061e508f6c48c
.xword 0x119666fdbd8f7213
.xword 0x2904d8d28151cbd2
.xword 0xa6759527eceacbdf
.xword 0x7d5ebbc8c8fba4e5




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
.global MEM_DATA27_START
MEM_DATA27_START:
.xword 0xeefb01c3f03fe405
.xword 0x9d6aeabc91301775
.xword 0x263decb8aeced739
.xword 0x3c050ee4662e529a
.xword 0xf1f8eaad5ca4decb
.xword 0xbf896f60366308da
.xword 0x0bc34c00cc60b74d
.xword 0x4817ef13dee1e80f
.xword 0x766ab4adc48cae93




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
.global MEM_DATA28_START
MEM_DATA28_START:
.xword 0xf9778d3cbf89f924
.xword 0x0f4fbfe7b35634b8
.xword 0x9ee46e33902caa59
.xword 0x6780f8a566553a5b
.xword 0x1392ecc7b6dbfdfc
.xword 0x3cf983b9eecd4b6f
.xword 0x44592ec41339023d
.xword 0x44c724370a05d0ae
.xword 0xf8166e6dc055db76




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA29_START
MEM_DATA29_START:
.xword 0x3e1efea61e6653e4
.xword 0x3ccc37f2abe8c4fa
.xword 0x550eda3a073a998a
.xword 0x0eeb1e126c465d32
.xword 0xc6ec9389cbcec53f
.xword 0x253dc383e04c30d6
.xword 0xb43e794a8bc207c0
.xword 0xf44790a2500b7404
.xword 0xeeae826f65670741




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA30_START
MEM_DATA30_START:
.xword 0xe4f122fa0b0296e0
.xword 0xa79eedf672a49043
.xword 0x9be60ff572254813
.xword 0x1c2bc0622d308f6f
.xword 0xf3a18617f7e71296
.xword 0x2248a149faad6b06
.xword 0x965f1582e2937417
.xword 0x183c997efd8b262a
.xword 0x3a6fc3f6d4302767




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
.global MEM_DATA31_START
MEM_DATA31_START:
.xword 0x9c705e94d29817d6
.xword 0xc2f9fc196b854abe
.xword 0x070da51edaef3f09
.xword 0x19a8d393ec0068bc
.xword 0xdc67b75073f3cb26
.xword 0x7633cf7c93fbf48a
.xword 0xa50c2de099d00c9e
.xword 0xf3c5bd0b71796072
.xword 0x290b6933635c00f0






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

.xword 0xe4214b60f8d18c1b
.xword 0xd2c439749b19068f
.xword 0xaf73c1bebcc066f3
.xword 0xd49a55ea00190928
.xword 0x351798ab509330c1
.xword 0x8ca533411494db0b
.xword 0xa6936333edc4a55a
.xword 0xc14dd86fbe3b2e9a



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

.xword 0xc1d769592c6828a7
.xword 0x12da0cb78f6ced19
.xword 0x97a6bc20c17ce342
.xword 0x86af2e3c8714c649
.xword 0x1d3a4df24da276f2
.xword 0xaf9525bbc0d30f79
.xword 0xc0a3cf83be90443a
.xword 0xafd4972ffdce4d95



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

.xword 0x72bfabd61c81b42b
.xword 0x69f7237070a40649
.xword 0xa51a6fabd4bcd22a
.xword 0x93b5affe65f2fe48
.xword 0x53646d6ae410b93c
.xword 0x33151f208f27310e
.xword 0x487f22ff60936772
.xword 0x329f1b43b626f361



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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x39c224313e6751e2
.xword 0xe49a78d73dca18ce
.xword 0x4a8c04a36ecc8a0a
.xword 0xf031f638b907ccfe
.xword 0xaca766d5e3d12403
.xword 0xa22cea235d105152
.xword 0xcc1b9a0da47b75d2
.xword 0x8a25bc0ed85717d6



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
	TTE_IE	 = 0,
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

.xword 0xd739f33a7e76e84c
.xword 0x7307e6c581b58838
.xword 0x1d2788b0931fe568
.xword 0x13dc9294a401dffd
.xword 0x94b17b8949f7b63c
.xword 0xac1caaf6816ba4e6
.xword 0xae8400d749af59c6
.xword 0x79321d4d47df80c5



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x1955bb3a82111d4e
.xword 0x50fbcdfeac42bc15
.xword 0xe353c8bcb11792c7
.xword 0xdf5a525b995e7dfc
.xword 0xd571789aad0b9d44
.xword 0x71596eb582d4cad4
.xword 0xe9c76ac12d5224d2
.xword 0xae402d96beddde46



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

.xword 0x34672b8c81b1d58d
.xword 0x8b0e0c2d8741b619
.xword 0x07c9612703808f5c
.xword 0x9fe8c0325a8bc32b
.xword 0xca3f256e06345502
.xword 0xb603b5e21cbf2662
.xword 0x86ba3b5cc8f03bc0
.xword 0x6e3da6984d0970c6



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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xd16b7401db5f1e1a
.xword 0x8755ec86226a1ec8
.xword 0x7e59820eb73a6586
.xword 0x2e3984c368b24971
.xword 0x4b83108141fdcd88
.xword 0xb262b46a05d0051d
.xword 0xf82cb08c1bf815a6
.xword 0x35e9806fb5edb07e



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

.xword 0x1f990d2f5004f1db
.xword 0x4b6020566dc8be2e
.xword 0x7b918eabc490e5fb
.xword 0x01a16ca9bbbb2c5b
.xword 0x0d716cf368ccb4bd
.xword 0xcedcfb4bdeeb8c66
.xword 0x87b0df10ec745cf0
.xword 0x8ec4d00e14e47125



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x5ec5bf596b1601e5
.xword 0x4ba5d18448de6a67
.xword 0x5b85c143d9533823
.xword 0x79adc084605a708a
.xword 0xce26b84c39ba9215
.xword 0x9f27af91acf27992
.xword 0xba4ff24472e85914
.xword 0xc0b89b16d0aa041c



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x6e6553fabde5689a
.xword 0x6b6d0afea341eb88
.xword 0x1438d211364b8110
.xword 0x04e6a9463716b1fa
.xword 0x452dc4ca604f6f0c
.xword 0x52cf8bd773038164
.xword 0x3f4dd99eb5dd8b0f
.xword 0x83919287f57233ae



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

.xword 0xa325aa312270a9d6
.xword 0xdebbedab577763fd
.xword 0x752d736796a0e880
.xword 0x6e5187dec84039e3
.xword 0x868ef25dd04e28f2
.xword 0x666325b308579f95
.xword 0xa28baf38b3eea2a4
.xword 0x249efc08934df6e9



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

.xword 0xcd6e45b90a61806e
.xword 0x6eddc17d26f86e8d
.xword 0x41a0c98727e34e26
.xword 0xc14203b7f774ad58
.xword 0xa1bba56df0a747f4
.xword 0x61e095648afb1bdc
.xword 0xca5d01bcd6f32f4d
.xword 0xe06a767a7a7e59c9



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
	TTE_W	 = 0
}

.xword 0x4a1c6aa031cd3d1d
.xword 0x26371d61fec41e07
.xword 0xb11a76284a562c07
.xword 0xc3e27dcb2c4b27f1
.xword 0xaae4949b339f4a62
.xword 0xadaf3ae4b0b8a1fa
.xword 0x796092a8c7c6daa9
.xword 0xf4bb9a1d57426fa7



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

.xword 0x120aef047fefd4c9
.xword 0xc58731d84bd50f18
.xword 0xe84896448813dfee
.xword 0x675df2e965d73cf8
.xword 0xbd0519bb7b3d71b9
.xword 0xce1e995f1e9c3397
.xword 0x6bceb77fc4d7e15e
.xword 0xd819247bbf4b282e



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

.xword 0x69a5315281560c7b
.xword 0x7dfd97cbe280da99
.xword 0x5f7e959ce57ca10d
.xword 0xfe9203e21c43592d
.xword 0xf7e2c72eeaba7e7e
.xword 0x3e4f836d5e396a70
.xword 0xc8588e7424349f4c
.xword 0x31332730d5979c60



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

.xword 0xad4fc67e5158b693
.xword 0x2959908a8c7a5089
.xword 0xeaebfe1e411ea85f
.xword 0x1044eb503fc845b1
.xword 0x075e2e8ff09fd57e
.xword 0x71f78f5b0409d724
.xword 0x97f856ae801092e1
.xword 0x809de5a6b40388f0



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

.xword 0x65e98739fccdc6de
.xword 0x4ec29ca4f1c8ddb5
.xword 0x0aee27e047e821d6
.xword 0xf93ac051a364dce9
.xword 0x06340e0d6b0fa8a5
.xword 0x80280fd85b27d190
.xword 0x949890aa4464660b
.xword 0x1ea08a5f2e636af3



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

.xword 0xd08aa4ff69f7506c
.xword 0xdbef4d114b6a9e5d
.xword 0xcaf495e2258c4470
.xword 0xefc4dfca092386a6
.xword 0xe85f4110500ea514
.xword 0x911a205434599921
.xword 0xf7f300416c743c24
.xword 0x99b69c3ddbb6e67d



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

.xword 0xa272724571ae106a
.xword 0xf87d071adf8134e3
.xword 0xad95b1b1964da86d
.xword 0x0f365c114571db3f
.xword 0x4443b66c72a1698a
.xword 0x9b610b336accd2ed
.xword 0x1fdcbd3994b47ed0
.xword 0x63acd4a7851a01f9



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

.xword 0xdc3f72b29bafc811
.xword 0x7e3bbc4ef1a4f1a0
.xword 0x711fadb730eebc29
.xword 0xc79a7d896560df09
.xword 0xe52685b60f5df0fb
.xword 0x72e496b65cbf803b
.xword 0x6e45c859a8bb6f87
.xword 0x75029a847041b782



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x2dd5c883bfd50920
.xword 0xa77691db03a5e1e0
.xword 0x9fa07d16800727de
.xword 0x95b01ef275f8042a
.xword 0x2eac6ba05de7121e
.xword 0x11eda966a30490cd
.xword 0xcaf072b4e12b16ca
.xword 0xf0c6a832c9c59bb4



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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xb0e4265c43aad0b3
.xword 0xf8863b64c978deeb
.xword 0x29200d06b4aef29b
.xword 0x396d268e481b6115
.xword 0xc947b9b2ba592a3d
.xword 0x0e342d440d20e481
.xword 0xfd1a81f5af1f4a38
.xword 0x8d8a91a571a6171c



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
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
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

.xword 0x8e680ef4a2ceaf9f
.xword 0x8da239720be91f46
.xword 0x5728f336aa5ef71d
.xword 0x5eaaccfe6acc4f55
.xword 0xd948543c14cd29bd
.xword 0xf05d89b9295bf237
.xword 0xf35d774c0fb52b08
.xword 0xb0787b1534ebdf3b



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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x85f279b15259f880
.xword 0x1aef02cc3b8ab13e
.xword 0x5f901134220b8709
.xword 0x645d0a8718fe68a4
.xword 0x088f15695eccc5f1
.xword 0xd82188d3af64cd0e
.xword 0xcceb77885df20f3f
.xword 0xcc6d7c72266d5ee2



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

.xword 0x73a95a19585b174e
.xword 0xc5042fe733597d5a
.xword 0x014556971ab2cffa
.xword 0x838d49e2c9e8ce25
.xword 0x7e63ebb201972ce2
.xword 0xbf442c9a2397fc98
.xword 0x33a7fd27fa3a4c53
.xword 0xf869c012185c7d7f



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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x55860cef4006eb3d
.xword 0x3002af0bb74b4647
.xword 0xe702ff04de37ef74
.xword 0xead3871a1100bdc6
.xword 0x062573566f65fef4
.xword 0x10665600c973a429
.xword 0x5aef940b49f3de47
.xword 0x5cfc268542298c76



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
	TTE_W	 = 0
}

.xword 0x68892193fafc988b
.xword 0xf8447be04e0861aa
.xword 0x82f75b6122b75783
.xword 0x3f7fa93b4cebf254
.xword 0x9a5def82319d7332
.xword 0x270fbeeb1b404119
.xword 0x14a3187457603da8
.xword 0x24258d149491ec42



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

.xword 0x8fa9fef1787f3af8
.xword 0xfa966aeb18e106af
.xword 0xc394d05762111bf3
.xword 0xbb65159a80954722
.xword 0x068241bd211d919d
.xword 0x03f39b5c9f9cc101
.xword 0xa94c98cf039d8682
.xword 0xd7e8a8edb43a756e



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

.xword 0x1cc334a6600b8673
.xword 0xd19c9ae77d5415ad
.xword 0xbd49a57a3864ef26
.xword 0xd544e971ba72838a
.xword 0x652064093a12097f
.xword 0xc971d91ee34d045c
.xword 0x40efea06162dbeac
.xword 0x523cc7b64b768c37



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

.xword 0x3b65071489597752
.xword 0xda5240eaee17f63e
.xword 0x41edfcc565511bad
.xword 0x255c44fb8cc38d95
.xword 0xce9ef712924bfcec
.xword 0x84852f76c099dd07
.xword 0x7ff421fd2ba36bda
.xword 0x9d646f5d4a473a72



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x6a9df1a51c732c88
.xword 0x0794932bd82456fb
.xword 0xa772f89d34689b6b
.xword 0x7298d076cf2de25f
.xword 0x9dc63dab52938c8f
.xword 0xf4a749a581aaae07
.xword 0xf56b41e0e9aab324
.xword 0x18f604df3da6f5f9





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
.global MEM_SEC_DATA0_START
MEM_SEC_DATA0_START:
.xword 0xd5eff335a4495ef8
.xword 0x4689bbeb757d103a
.xword 0x92cc3d565a082da3
.xword 0xf7066435ef6850dc
.xword 0xdd8754f3bc130081
.xword 0x444476ee9d576e63
.xword 0xc406f1cd6622594c
.xword 0x5f009027bfacd234
.xword 0xb568f128da9879f0
.xword 0xcd369fc13e7d18e2
.xword 0x40ec0317c1ca387e
.xword 0x992f1284ff5327db
.xword 0x5dfdbd9c2b9becf1
.xword 0x1f7cea1b9536c94c
.xword 0x8496b44a451d329b
.xword 0x96170eb76dbd5b00
.xword 0xacb94039fc731354
.xword 0x3b1682c79558eadb
.xword 0x9cdcbfee24739a85
.xword 0xbe86c942a5497cef
.xword 0x7ca45406ed7d3fc7
.xword 0x68bf04b0a243aaac
.xword 0x1d33ba4d79bf6a52
.xword 0x10af3f0e0f931ad6
.xword 0x0ea7bd6d8b7bb920
.xword 0xbf3274e257e833fc
.xword 0xa2376d8e1129f304
.xword 0x74bb962839e3ce2b
.xword 0x556bd82ea26293a7
.xword 0x47e687320e5444e4
.xword 0x0025239cbac93d72
.xword 0x8ad6eb4bc00e0552
.xword 0x5a91b0bfb52ed49b
.xword 0xdf1f9ee3200777ca
.xword 0x5ac85d93feca5b55
.xword 0xf97b9faf0d3e9297
.xword 0x27ada540f039dc7e
.xword 0xd9b81f7d0c76df01
.xword 0x988e571e2e86d9d5
.xword 0x58f6465087b1ca98




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
.global MEM_SEC_DATA1_START
MEM_SEC_DATA1_START:
.xword 0x3260f4d20c9b70fb
.xword 0xfe7819bd814d8420
.xword 0x494ac1a4f04a642e
.xword 0x099fce0d267684b5
.xword 0x133ac3b5fb41f09c
.xword 0x293e422fcf4b10ae
.xword 0x18741b9a44152933
.xword 0xd653f86c00cb9ea7
.xword 0x4871bd351e8e4b69
.xword 0xfec19618056e944f
.xword 0x1835348c5312db4a
.xword 0xb02de583f400d468
.xword 0x87a07a4e4e45aa51
.xword 0x0af85d9393e72977
.xword 0xa27aad36c145a187
.xword 0x2e6c0cf521443928
.xword 0xc8a42639f4f87f6c




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
.global MEM_SEC_DATA2_START
MEM_SEC_DATA2_START:
.xword 0xf61c1164a35bad30
.xword 0x7692193123c42a98
.xword 0x10d516f6db12168c
.xword 0x1bdb592d88d7f562
.xword 0x2e499d5676bf7a71
.xword 0x527b6d70577cf2bf
.xword 0x7a40e5aef16e91e9
.xword 0x8c43989c450f2d21
.xword 0x0f9e5ce24433d83e
.xword 0x6e1d1ae171eb604d
.xword 0x123230bca5ea1de5
.xword 0x32e76b55a0032a04
.xword 0xed15e02659b1f857
.xword 0x99f184aaf544b4cd
.xword 0x042c0d20eeedd587
.xword 0xe02e4ea2c5163773
.xword 0x75100b5c0b15a54e




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
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA3_START
MEM_SEC_DATA3_START:
.xword 0xc4403618a9a47bd2
.xword 0x89921e84940560af
.xword 0xe4e02253c9740cd5
.xword 0xa80d77702ecc42fe
.xword 0x1af7eb781f87cdb4
.xword 0xf2361fd1385b8b46
.xword 0x400f6fd9d9176b85
.xword 0x3e713eb5455cc5d8
.xword 0x88de168ffe66f0ae
.xword 0xae0997dc5a218a1e
.xword 0x816efc0e28f23b39
.xword 0xb1db3119e383aab3
.xword 0xce498cfd35730358
.xword 0x502d9dca11ab7b46
.xword 0xb4d34676b3260b6b
.xword 0x562a8624f0ef4469
.xword 0x3190a0793394494e




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
.global MEM_SEC_DATA4_START
MEM_SEC_DATA4_START:
.xword 0x2b73436dc92c3d0c
.xword 0xb30494543c843021
.xword 0x66eaddc74d6c8fb2
.xword 0x3c15a71c1314d1b9
.xword 0xfdf5f44c133089cc
.xword 0xe7d422e9f6839153
.xword 0x35561d8528aeee24
.xword 0xf2b322aee6face2a
.xword 0x4c14a5be6552cbc9
.xword 0x3478c64b621b3e37
.xword 0x8978d4ceef25e15b
.xword 0x6f93e45787507fa8
.xword 0x5255fbb61501c08f
.xword 0x2016707ea61c7cf3
.xword 0x021ad57c9a733b35
.xword 0x10e241636a95ba2a
.xword 0x85332e921e85a021




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
.global MEM_SEC_DATA5_START
MEM_SEC_DATA5_START:
.xword 0xc1408d8b2bc73155
.xword 0xb4eb91edf7f38cb3
.xword 0xe693bbda309d83d5
.xword 0xdf7047726321bdd8
.xword 0x87bd39920c9af84b
.xword 0xe488546416af9d9c
.xword 0x8768f91fc00e3952
.xword 0x13cc703f3d524fb2
.xword 0x67cb6b63200be29b
.xword 0x6f5ab1ef2df80e7b
.xword 0x47fc306f60fc983c
.xword 0x909df78a105bded2
.xword 0xd9dfa628ea36b805
.xword 0x5efa2569ff9e92d3
.xword 0x80cf5b2d57122074
.xword 0x988e82f22f4b2dca
.xword 0xb3d07b27dd3b486f




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
.global MEM_SEC_DATA6_START
MEM_SEC_DATA6_START:
.xword 0x4e2c3415116d17ee
.xword 0xbd5c8dfc3106e3d1
.xword 0x45942e653e62cd8d
.xword 0xc472bafd19f9d795
.xword 0x40a18606642d1c00
.xword 0x2b0fb404ccd2af11
.xword 0xef50c643632dc4a8
.xword 0xe3dc14b573288b04
.xword 0x4acaf3cf348f6d7b
.xword 0x6c707e3d3cdf5cfd
.xword 0xa6a490161870ab6c
.xword 0x6f814beacb68be9b
.xword 0x3216c8ae99f481b6
.xword 0xc37893483512df94
.xword 0x0bebcc3308f58023
.xword 0x18b3762b11a03794
.xword 0x100f0a77cc4a2378




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA7_START
MEM_SEC_DATA7_START:
.xword 0x3e44e14be872c686
.xword 0x62a138d16788de60
.xword 0x254fe4b993ce8fc4
.xword 0x1d424dd3924ad099
.xword 0xc87e097f68e8b925
.xword 0x6289446fd21af944
.xword 0xd75a2d155ed16c13
.xword 0x38a555f0375091c5
.xword 0xa68a541632d613fc
.xword 0x6a2a090fc43e1b86
.xword 0xb55a6c824e415277
.xword 0x016755fe3305b4e2
.xword 0x5cb107770f64d874
.xword 0xd72fc2cd7c8acebc
.xword 0x8b54dc846c849c2d
.xword 0x21042b14c87bf2b4
.xword 0xde3a4c999f9eb45b






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

.xword 0x1a5aa521becb914e
.xword 0xbb577bfbe77a4205
.xword 0x8c4a2672dbc93895
.xword 0x958f680e27a3eb61
.xword 0x89271bed52aa5fd0
.xword 0x85ba8a9b10b8f24f
.xword 0x39ad3a9686afff2a
.xword 0xbb4a5663c25ca57e




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

.xword 0xb0cfd2ca496ca789
.xword 0x26ee8bf8dcb4931d
.xword 0x514d477024f02715
.xword 0x56aaf25c3c440043
.xword 0x6dee06884af61977
.xword 0xb31f129f4f18984e
.xword 0x02d93d84d6c9377b
.xword 0x2185864c7171d8ea




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

.xword 0xd2fe05a018efb508
.xword 0xf52c051a8c6fef70
.xword 0x7228ba7810480e1f
.xword 0xfeb97759aeec1758
.xword 0xc4c28f63b417e18c
.xword 0x86494c0271700293
.xword 0xa4111547378ca798
.xword 0xcbdf3d636c19411d




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
	TTE_NFO	 = 0,
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

.xword 0x2fb279bb30281a8e
.xword 0x055ff4ba38750bc0
.xword 0x927b93724458dc89
.xword 0x4cf1de0bdfe3e4fc
.xword 0x0fea3eeb2c9206f5
.xword 0x1f09de96d0f79b70
.xword 0x4c4ebb355b94b3c0
.xword 0x58ea32661f7a7c59




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

.xword 0xa35467446f99d52e
.xword 0x612f9c88ec8111af
.xword 0x93e87cd9584637ca
.xword 0x228442937b9c68cd
.xword 0x490fec1e02d5cb52
.xword 0xfb79125899c84d73
.xword 0xac135c0586a30129
.xword 0x8ae88bf9f9febdc2




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

.xword 0xc93b2b40e5e9e699
.xword 0xc1bf608a9b987699
.xword 0xb7ebe4f36e724c98
.xword 0x45b7859b3b60a3dc
.xword 0x9054cfed5862ea91
.xword 0xe4fed7c6da16f6c2
.xword 0xed2ac8e06cdc4d8e
.xword 0x0c829e6d8d75d353




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

.xword 0x580d9f6a63bbbda0
.xword 0xf152dc7dd5ac473b
.xword 0x50b2d15221d156b1
.xword 0xba8ddb54835504e3
.xword 0xd92352201ea8af84
.xword 0xaa3b31072623e4ca
.xword 0xfc1e4c0fb1caba2a
.xword 0x3ea5638685fda3d0




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

.xword 0xa0322bd4b9cfd5a0
.xword 0xdb9e746bdb5c3939
.xword 0x6c4fcb33e20b27c4
.xword 0x8aa55ca7538830bf
.xword 0x5016de06cc3b046f
.xword 0x7c3a392f311d7f40
.xword 0x648e92230a24b578
.xword 0xc6556b9cb9fcd425






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

.xword 0xecb463741d2e129b
.xword 0x855278d0e0900444
.xword 0x53631d69edb987f8
.xword 0x843ec7f6cf832d67
.xword 0xe036dbc14959161d
.xword 0x2c8dbcf776cca122
.xword 0x1f7466dca6d0234b
.xword 0x88d23903f6fa2dea




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x48a2d81ee0f864f0
.xword 0x5012a27dcf1073ed
.xword 0x5988892528fd91f6
.xword 0x5ce3d600df6a51c8
.xword 0xb474e1ac5a28a7f0
.xword 0xadefc850bcde34be
.xword 0x88d0107653af3ae4
.xword 0x3a88c480681a7193




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

.xword 0x4d85c50225bf80b9
.xword 0x9f78def11619c8ed
.xword 0x3ac247b2bef4d23c
.xword 0x23e716947a8d0513
.xword 0xd8fb779ad8ae61d7
.xword 0x30b796b278f07b41
.xword 0x64d0fff8c5cfb768
.xword 0xc1f718c78a75a8c2




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x6a51b8cfa157ee6f
.xword 0x807093ade1434a69
.xword 0x877a1d1599d1fd3b
.xword 0x3c07da3ef597f318
.xword 0x476b5a06f9a9b1a0
.xword 0xf2a4ca978cb81e41
.xword 0xa32dbb2045e08bbb
.xword 0x57b00de3d6114217




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

.xword 0xa48b2ba1ba8c523c
.xword 0x612b76d85af02585
.xword 0xce0f29316fbf53ad
.xword 0xb6d4d08845b414c3
.xword 0xafe84424f8cc7cab
.xword 0x85f966d5396ddf63
.xword 0x5a578e7b7f30c139
.xword 0xf2135af74d143d23




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

.xword 0x842e5fd041b8f077
.xword 0xed9279c5e5d5df25
.xword 0xe49fec9c04e7a4f9
.xword 0x547118f12bfe7815
.xword 0xa4c265a53a0ef3e0
.xword 0x9419ce5200673dc8
.xword 0x2611df32f597b758
.xword 0x12c638d8785801e7




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

.xword 0x4677401ef424e3b5
.xword 0xf3edbc29b8fdaaff
.xword 0xdacbd2f6f2478b4a
.xword 0xa5bc44705536ba34
.xword 0x7ee00e45a47726b4
.xword 0x26efaf0b00aadae9
.xword 0xf7d9eb3ccd4dfdf0
.xword 0xebf15ca52665e76a




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

.xword 0xcb8a745db2417beb
.xword 0xb9348c56ce0e4fbb
.xword 0xfb9efcbc35889d6c
.xword 0xad5214f776c4e428
.xword 0x06103c251ad8dc76
.xword 0xea78828030403abb
.xword 0xd3f36be864d593fe
.xword 0x3a49c7ebd8f14a36






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

.xword 0x3edf7857f6fae54a
.xword 0x7b64306218b317e5
.xword 0x1a544ab646269db8
.xword 0x16a1a8867aeae126
.xword 0x969f221ea0691b29
.xword 0x018f0b8b4e891758
.xword 0x1329e8a6c244cfa8
.xword 0xc7fca2180bce20a6




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
	TTE_IE	 = 1,
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

.xword 0x0e6668b717b0b4ab
.xword 0x314919e0d8b9c35f
.xword 0xe7e4c6fef71c8781
.xword 0x6323da1202652860
.xword 0x1dcbf9a3e69856ec
.xword 0x4ccf59d13dfab2f1
.xword 0xd71a27e6e40304d5
.xword 0xff9864081252f275




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

.xword 0x083a42e7c9029f3f
.xword 0x4cc8ad7c430c1cb0
.xword 0x4d5bbfe3aa2bac67
.xword 0xce0533e33e63a4b8
.xword 0x2a97da60a3e5bce6
.xword 0xdcdf7c663edafd71
.xword 0x11125ed38ae881d9
.xword 0x72a1ba67b0076ba0




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
	TTE_W	 = 0
}

.xword 0xc2d7ec5e7f0be6a6
.xword 0xbd8cf2f725744280
.xword 0x5ab390743b1f89c7
.xword 0x566e141427273448
.xword 0xc65c7adde09d3694
.xword 0x1746daa5710fb25a
.xword 0x86573072c59dd433
.xword 0x43d5e96c095be3dc




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

.xword 0xfb37b5ec836577ad
.xword 0x5b6ce0e3f0da2cc8
.xword 0xc3bdfa01e488f3e0
.xword 0x55458ec355f0c52c
.xword 0xedbab5f6e89e8b39
.xword 0x7cdf09ff820a58f2
.xword 0x4b9d8792adced9be
.xword 0x3f5869ad08a94362




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xda552d76a6e9beb3
.xword 0x50fa27f8f7c3d772
.xword 0x2826e904a9ec8c43
.xword 0x790322158561b88e
.xword 0xd60ab742466ebd84
.xword 0x2524a18e236976c5
.xword 0x0bd661e01e1a69d3
.xword 0xc357dd13af26d7aa




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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xfdba0dedbcb33947
.xword 0x58e1405d1c2674b1
.xword 0xae7b343f1db5095d
.xword 0x989a1878bbb47288
.xword 0xc2af67927c6d00f3
.xword 0x0685f3609420eee0
.xword 0xb01e189ce3e0341c
.xword 0x818a080c58d12010




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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x95617d985be0c826
.xword 0xcd7f7dd494545df1
.xword 0x972c264f2ae36f85
.xword 0x3bfa5daaa9323b16
.xword 0xf990f4878da159aa
.xword 0xaa40f77f97ab132b
.xword 0xeac9ae0eb16db659
.xword 0x8cc088561ea5a009






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
.global MEM_REAL_DATA0_START
MEM_REAL_DATA0_START:
.xword 0xe8fb51060d24aef8
.xword 0x465620ca8e34dd5f
.xword 0xc04a4434cacde780
.xword 0x97a727f1518ddac3
.xword 0x139b9c2122bc35ce
.xword 0x391b673ad7d806d9
.xword 0x0df06209e053d79f
.xword 0x046fbcde3bb1b9fc
.xword 0x1b909723ca3144a1
.xword 0xe9f1d5d8102fda7a
.xword 0x1fb42f7751c4a4d5
.xword 0x072d68c9d05cbd83
.xword 0x986ba39952ca0229
.xword 0x3e92b1f88c06d1cd
.xword 0x8488bbd6c712d58d
.xword 0xb6ddc1d2cf76e1e9
.xword 0x65ea5201b3c0980e
.xword 0xd51623d42be85eed
.xword 0x07bdb184da85e814
.xword 0x43344e0f3937b439
.xword 0xa02913be4b60b578
.xword 0x06398593df3f863c
.xword 0xf4eb8af38070e9af
.xword 0xafb74a4bc1a7abab
.xword 0xa8fe0a5a4bd410ef
.xword 0x0dcd7e32139fae27
.xword 0xa39c13bd45eb7016
.xword 0xd9324969b800fc1a
.xword 0xf60792542ba4aa65
.xword 0xdf21169ca6ca8c66
.xword 0xa0db5b29bdad7bbb
.xword 0xbc5e62bec1a52826



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
.xword 0x7f6895528011ad78
.xword 0xdc672afd9b8fd7d6
.xword 0xea4e044d53d7b329
.xword 0x1a24d2933eeddad3
.xword 0xad7f65aa29057022
.xword 0x5ac011662ae0999d
.xword 0x2a3cb331abcef7c7
.xword 0xf01821ca275b653b
.xword 0xbb94a60add31a0bc



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
.global MEM_REAL_DATA2_START
MEM_REAL_DATA2_START:
.xword 0x6d6379ed2752f970
.xword 0x04795e4bd9b097eb
.xword 0x96fa832c1478e29a
.xword 0xe8cdd2ef98585c3c
.xword 0xa583fee6b1d9f386
.xword 0xdb5599c5a7e6d919
.xword 0xcf23b8285631c0aa
.xword 0x09e50de81529acba
.xword 0xb353bf67b7b00bd9



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
.global MEM_REAL_DATA3_START
MEM_REAL_DATA3_START:
.xword 0x2254dbcfd3e7c6d3
.xword 0x1eaf2438a5457f7d
.xword 0xb1a9e8e7589ce668
.xword 0x026768ac6d37db87
.xword 0x3f6bf6688091c492
.xword 0x5888c2d8195d3f12
.xword 0x4422edf75ec89adc
.xword 0x1b3d0368ffefd5ab
.xword 0x1c24f11fd521049a



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
.xword 0x5cb42c997cf75a6c
.xword 0xc944f52d4e576146
.xword 0xceb39d50187db62d
.xword 0x5743c2aaac125a7f
.xword 0x2af22834b5e92e61
.xword 0x99f66f28d24022cc
.xword 0xaed48a12bcd5edad
.xword 0xaafc273b07050f24
.xword 0xe7a7e3d0f214b609



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
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA5_START
MEM_REAL_DATA5_START:
.xword 0x81717e565e82c4b1
.xword 0xcb374cd8c30a0eb1
.xword 0x2327d3ef728a9f30
.xword 0x5e0b443711189250
.xword 0x2d6b0d79f29acbdc
.xword 0x78ee9f7d3226c68c
.xword 0xafc2435453bdca3d
.xword 0x67d2bb6cb6def1c9
.xword 0x806b5f050837e41e



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

.data
.global MEM_REAL_DATA6_START
MEM_REAL_DATA6_START:
.xword 0x35d867d9f267444f
.xword 0x3494c67193b32443
.xword 0x328e0c92407decc1
.xword 0x1459a413a38bd047
.xword 0xc70a466028a4bfc3
.xword 0xbe1700a01299d858
.xword 0x1adc190f46cb2379
.xword 0x05368e074c5902f6
.xword 0xba870d6facc1ae1c



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
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA7_START
MEM_REAL_DATA7_START:
.xword 0x44f2d5bdf4445003
.xword 0xda72e4b6b892d790
.xword 0x4cc9c8e9af64abdd
.xword 0xcf540586e7cbb8ee
.xword 0x9907d77d00d8ff02
.xword 0xa20fadf7a1b5d4c0
.xword 0x477493d869567050
.xword 0x55d9c0e8aeb583d4
.xword 0xa3a06fcb5239d59d





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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xb82a68a10c818be5
.xword 0x7909e2ca0c0b6aa2
.xword 0x55f8e17c6d035675
.xword 0x414a72fe4ae070f5
.xword 0xb2360c20274b7c6d
.xword 0x80a779217458e9f3
.xword 0xa0ef205069d8d234
.xword 0x62e71a69bfbc0e53




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

.xword 0x4a9d35468efcf6f4
.xword 0xab554a4115add907
.xword 0x1e1dac48813cc49c
.xword 0x3252cbda6f83816e
.xword 0x5ae6e473cb0ab57b
.xword 0xd3300d04adf51018
.xword 0x98f8642838676a00
.xword 0x3334e287e63337ec




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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xdf08e2a8bb0c0036
.xword 0x6ee0722620551177
.xword 0x0c617f11df1d7a89
.xword 0x59dc003ac951f558
.xword 0xb15f94c9179354ff
.xword 0x3bed4397fe9d1434
.xword 0x768ab2828c94342f
.xword 0xf320757069109417




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

.xword 0x449a8b6ddcd3cd6e
.xword 0x8cf001aa3395d813
.xword 0x06625b72bdea223f
.xword 0x7a21c06cf4466a2d
.xword 0xd04688f5dde201c7
.xword 0xa8f7e36a2b6d091e
.xword 0x695433f503c88ce3
.xword 0x058ec4c539423179




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

.xword 0x422a61a19b08b418
.xword 0xbce3890baf471b5a
.xword 0xcef8f5cbbdf19a5b
.xword 0x3762713591d64f39
.xword 0x9fcb329071859524
.xword 0xb89f1dedc1cb8fb4
.xword 0x844dd710ccab9ee6
.xword 0xae51b5070d321bdb




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
	TTE_W	 = 1
}

.xword 0xd45a9bb58601b07b
.xword 0x05f93e7e6abbe12b
.xword 0x9049c9014b15f360
.xword 0x55c1645470520a17
.xword 0xd39a8687844804ed
.xword 0x5b6ddedeef651646
.xword 0xf5bc5c809038fd9b
.xword 0x9a76521360e31f88




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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xfe8fd3ebd1b5201d
.xword 0xdb05047b0909dfa7
.xword 0x8d0125e2a2f1e40e
.xword 0x2bac8793741b3d2f
.xword 0xf4b12cf045883bb9
.xword 0xaf4afce06cbf1a61
.xword 0x8e030b27dd3dcf82
.xword 0x1c9b1dc90b6fd1ec




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
	TTE_IE	 = 0,
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

.xword 0x1536c30df35c3988
.xword 0x01f3488609785645
.xword 0xd6ea189c7afa60ae
.xword 0x4f8b7eed01f9007b
.xword 0xa7360c3bfca29ea2
.xword 0x54e31551349bd3d2
.xword 0x9c128c3bf40e304c
.xword 0x798ad8e2bdfb1fce






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

.xword 0xec29bb3cb2227c10
.xword 0x0c75136e16f0d8e7
.xword 0x6f7a297b87351fd0
.xword 0x7d65f575317a8f46
.xword 0x9c5375efb3b635ca
.xword 0xeeda14b63defb676
.xword 0x58225c641418fe6d
.xword 0x34aacfc138f3c7b8




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

.xword 0x8b0586f0c4cc6b0e
.xword 0x4f44a0ebbedd6348
.xword 0x054c0cc75f1f8667
.xword 0x5e31ba853e271590
.xword 0x8cc7c81ebd16d1fe
.xword 0xc3092959488a91df
.xword 0xd1b28c2f536d6809
.xword 0x0ff0302ada9fe584




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

.xword 0xd50d13293cb1c3e4
.xword 0xf38cde185f5f5859
.xword 0x75b902c15332d068
.xword 0x1daae62da65362cb
.xword 0xef56235100e79e4b
.xword 0x45f51d7b5c827408
.xword 0x116b6e1fdf2413e7
.xword 0xe792e363331b7e4b




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

.xword 0x79dbcec95db11cd9
.xword 0x6ffd17c0ca12f6e7
.xword 0x445cb3d4f187e98f
.xword 0x780e41ad119c8584
.xword 0x39c8569633e14d6e
.xword 0xda9fc869f8601004
.xword 0xc91d21a2345dedea
.xword 0x1bc5c6b04f16c5ed




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

.xword 0x6633a7602b9cb821
.xword 0x86d7602ee4c7209e
.xword 0x29b20974657e4889
.xword 0xc5c92fd923622853
.xword 0x9cca266a99452355
.xword 0xdc20c5b430aca6e7
.xword 0xc52399fe75140c48
.xword 0xb9045c7c0977d3de




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
	TTE_W	 = 0
}

.xword 0x9c9d68617a695083
.xword 0x358443194a762a5b
.xword 0xfd548a2a570fb189
.xword 0x50a74b9d9a8f19fc
.xword 0x82648488a0add1f3
.xword 0x01ae08ce5f4b0442
.xword 0x51a34fc1f5f3fccc
.xword 0x487a3eeb6f055053




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

.xword 0x11cd5420f3b3a102
.xword 0x3f81dce8ca4e5466
.xword 0x520813f3f888e7e6
.xword 0x6577701408474ff9
.xword 0xa581b60a0d640e82
.xword 0xe124686f32c5fc1b
.xword 0xa4fdab15d884e03f
.xword 0x29241df513d7cb7a




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
	TTE_W	 = 0
}

.xword 0xa373e04e7d317c8a
.xword 0xe337b8c9447f7bd8
.xword 0xcd3361c72dc2cb1c
.xword 0xdc02c5e2af5c8a17
.xword 0x491e963c7738b164
.xword 0x2746bd871838b864
.xword 0xbbbb3686864884dd
.xword 0xdaa8e949ea436a57






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

.xword 0x03370e66e70caa5b
.xword 0x493e8bf52b970410
.xword 0xabfae633095126d4
.xword 0x4e52943e0809cfae
.xword 0xbf6db6c887c0579a
.xword 0x683b849d46cb051d
.xword 0xdf07b05c47215e44
.xword 0x5f8e902820a012be




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xc8977f227590bbfb
.xword 0xa6f5606d1f063dd7
.xword 0x5ceef7bde613162f
.xword 0x1738b8af1f231670
.xword 0xce897dea80f57d80
.xword 0x114b906c811ea31d
.xword 0xc9b610a5605df3e5
.xword 0x1d72901b018b75fd




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

.xword 0x48e330d3022f5ee7
.xword 0x95962a6fcb0dd2cc
.xword 0xaba1c3eb539dd469
.xword 0xb5d88f5fbdd85df9
.xword 0x94cdf748f517da6f
.xword 0x8064cb592f06829e
.xword 0xa4ff02a026c2de9f
.xword 0xb275e2392e172f27




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
	TTE_W	 = 0
}

.xword 0xb98c6dd30df45bc2
.xword 0xa11a914e438024b5
.xword 0xba74000c496468ab
.xword 0x3fbfac7085fa105f
.xword 0xc9f2490536ea7cec
.xword 0x07c1eb790cb83539
.xword 0x153ea7e9ee49643f
.xword 0xb44e2ca1c3feffef




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

.xword 0xff7b189b321527d3
.xword 0x9e99f41711517bac
.xword 0x6cf775980e8f10b1
.xword 0x0813c04303eee4b2
.xword 0xfb5c47162af1b390
.xword 0xad42e528267397b2
.xword 0x9f0fbfcdcb6efa04
.xword 0x2fd6a36aa957a243




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

.xword 0xec41ce0658f24c40
.xword 0x71f43297af40d6e8
.xword 0x141781e850401d7f
.xword 0x03bfa8ddb47f7ad5
.xword 0x986003a938ea13ef
.xword 0xea9e04bae4cc3a38
.xword 0x9aef779d27d5680f
.xword 0xcceb313f3d34d790




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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd8d86ce0a1f7d9be
.xword 0x71eb2b7fe4ad9e13
.xword 0xb4982e49b8387224
.xword 0xadf9ff26ecf2f2a4
.xword 0x47d919901f805e1c
.xword 0xffb9756d2bff9946
.xword 0xe958ba577c4c3e2b
.xword 0xf18a80e0baac3e17




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

.xword 0x5b7b1b6f5efb0573
.xword 0x955978a628d5067c
.xword 0x6358381c1063e51d
.xword 0x4574fb670fb66da7
.xword 0xbbb6a12f4557e53e
.xword 0xafdf2f33edb2b9a9
.xword 0x10079c56cfac84a7
.xword 0x9abd12f10c6a7a2f






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

.xword 0x516d00bbf215d333
.xword 0x3e4f27b5b1eba571
.xword 0x52874aaae66da1d5
.xword 0xa7a6a38b6cf50a2e
.xword 0xda8eae27e8a071c5
.xword 0x85ffed7b6ac34a35
.xword 0x1411587d6fc364cd
.xword 0x7764d8d23c4e2a39




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

.xword 0x3783250dfbed7c37
.xword 0x5a64fc2addb93413
.xword 0x3b0492e53669162f
.xword 0x87e748b8547de2ce
.xword 0x103aa1b38e428608
.xword 0xb3c03bf91553542a
.xword 0x418eb47d21f346cc
.xword 0xf8e053e11e04b96f




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

.xword 0x650a2f5c8a7887f1
.xword 0xd0e7a1054e8f4d7a
.xword 0xa8373c95bfec60f6
.xword 0x41e42f55af97c7c5
.xword 0x4b0d0d6b90adc799
.xword 0xc761782ef26c4521
.xword 0x991833bc37e86993
.xword 0xeff2e642710c212d




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

.xword 0xd76810d1615cad3d
.xword 0x897752b8ba7b651a
.xword 0x0620965430f0a3ad
.xword 0xb31769735ea4a988
.xword 0x4e64b6d1ed10976c
.xword 0xa25bd485824133a0
.xword 0xc81329fed12fbfde
.xword 0x7046acd7dcd6600c






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
	TTE_W	 = 0
}

.xword 0x363e357d0432d863
.xword 0x62f4fec329daf28d
.xword 0x8cd6c1c5d40bfc7b
.xword 0xcdc9ba81e7007249
.xword 0xa95686ae55fa5d8c
.xword 0x027fd7f40b992b0c
.xword 0x8a6c343e523c6dd6
.xword 0x8522039c78bbfcd4




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

.xword 0xc0db4ef230bfb020
.xword 0xd8df84b44faa95f3
.xword 0x18abfd57299dfa18
.xword 0x4aa8387c3b324146
.xword 0xa35a5e23fc89741c
.xword 0x6347a78d4f12e3d4
.xword 0x94b357188d925c55
.xword 0x14f309e8cce1e467




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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x2100f91f83602b44
.xword 0xbfde8dc229276c3d
.xword 0x026c7ecd42ff7848
.xword 0x7859cf46bbe70d7c
.xword 0x843a87997d59158f
.xword 0x59201a4b652a4abf
.xword 0xa250db6f81bb83e9
.xword 0x770d15dc0645b879




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb695a8d83d1d1263
.xword 0x391a0d0f221e50e7
.xword 0xe70c6a28fb072435
.xword 0x5d9970701a9336f7
.xword 0xfbe4480a89fa1f82
.xword 0x70e5f1b791a03cdb
.xword 0x0fce258148995d31
.xword 0x045498c6bda76a8d




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

.xword 0xdf181af6c49f8e8f
.xword 0x5ae1cda9aef9b57b
.xword 0x2c2920c0fafa0104
.xword 0xa9d486815abe9bff
.xword 0x6b6a6058aa414919
.xword 0x7888510f67e8396c
.xword 0x8759351dc78602f6
.xword 0x1fa3300a9c51d724




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

.xword 0x71953ece415ae726
.xword 0x877938a95fef898c
.xword 0x6a6bfdcb1293e743
.xword 0x57d043df34639bba
.xword 0x760f7768c557a2e3
.xword 0x3386535ad8b1d508
.xword 0xfbd61b773fd8a4c4
.xword 0x91be770bc3b79e09




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
	TTE_W	 = 1
}

.xword 0xd27444ea0011b045
.xword 0xe9b4ba0aaf6d9dd6
.xword 0x57d9d15eeb36681a
.xword 0xfc7245cc9e97c3dd
.xword 0xbec984ccccbcb352
.xword 0x0b2d6ce65fe4966d
.xword 0xd3840e8e064608b6
.xword 0x8d1bc3816fd2ad82




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
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x9eb2acca12b7d9eb
.xword 0xcc4ecc26d0e92632
.xword 0xa81c80f87020dc5e
.xword 0xc8192ea271b5af4a
.xword 0x6db126d7a0da4226
.xword 0x9a7dc228618eb8e2
.xword 0xed3b200ff6095018
.xword 0xb7b1deba5ac657c9




#if 0
#endif
