/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_lsu_asi_ring_01.s
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
# 313 "diag.j"
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
# 333 "diag.j"
    setx 0x40, %r4, %r19
    setx 0x80, %r4, %r20
    setx 0x100, %r4, %r21
    setx 0x140, %r4, %r22
# 343 "diag.j"
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
	setx 0x10263d3a77feea79, %g1, %r2
	setx 0xb83ea77e2890721c, %g1, %r3
	setx 0x8a694a955316215c, %g1, %r4
	setx 0x71b67e5793885986, %g1, %r5
	setx 0x6faf276051a6ec44, %g1, %r6
	setx 0x2cb6476f8a981e06, %g1, %r7
	setx 0x8d388de7c3b29de4, %g1, %r8

     mov %r2, %r1
st_fast_deter_nonsync_ffffffff_0:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
ld_fast_deter_sync_ffffffff_1:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x54) 
	.word 0xd4d84a80  ! 1: LDXA_R	ldxa	[%r1, %r0] 0x54, %r10
ld_fast_indet_sync_ffffffff_2:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_3:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 3: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_deter_sync_ffffffff_4:
	nop
	mov 0x70, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 4: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_local_deter_sync_ffffffff_5:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 5: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_6:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 6: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_fast_indet_sync_ffffffff_7:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 7: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_8:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 8: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_9:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 9: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_10:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 10: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_11:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 11: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
ld_fast_indet_sync_ffffffff_12:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 12: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_13:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 13: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_indet_sync_ffffffff_14:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 14: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_15:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 15: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_indet_sync_ffffffff_16:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 16: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_17:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 17: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd8d84ba0  ! 18: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r12
ld_fast_indet_sync_ffffffff_19:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 19: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_20:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 20: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_21:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 21: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_indet_sync_ffffffff_22:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 22: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_23:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_24:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 24: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_25:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdcd84e40  ! 25: LDXA_R	ldxa	[%r1, %r0] 0x72, %r14
ld_local_deter_sync_ffffffff_26:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 26: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
st_fast_deter_nonsync_ffffffff_27:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 27: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_28:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
st_fast_deter_nonsync_ffffffff_29:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 29: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_30:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 30: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_fast_indet_sync_ffffffff_31:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 31: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_32:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 32: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_33:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 33: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_34:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 34: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_35:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xdcd84e40  ! 35: LDXA_R	ldxa	[%r1, %r0] 0x72, %r14
ld_local_indet_sync_ffffffff_36:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 36: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_37:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 37: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_indet_sync_ffffffff_38:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 38: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_39:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 39: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_40:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd2d848a0  ! 40: LDXA_R	ldxa	[%r1, %r0] 0x45, %r9
ld_fast_indet_sync_ffffffff_41:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 41: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 42: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_43:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xded849e0  ! 43: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r15
st_fast_deter_nonsync_ffffffff_44:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 44: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_45:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 45: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_deter_sync_ffffffff_46:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 46: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_local_deter_sync_ffffffff_47:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 47: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_deter_sync_ffffffff_48:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 48: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_indet_sync_ffffffff_49:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 49: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_50:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 50: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_51:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 51: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_52:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 52: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_53:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 53: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_54:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xdad848a0  ! 54: LDXA_R	ldxa	[%r1, %r0] 0x45, %r13
ld_local_deter_sync_ffffffff_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 55: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_local_deter_sync_ffffffff_56:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 56: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_indet_sync_ffffffff_57:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 57: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_58:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 58: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_59:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 59: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_60:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 60: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_61:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 61: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_62:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 62: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_63:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd2d84980  ! 63: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r9
ld_local_indet_sync_ffffffff_64:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 64: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_65:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 65: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_66:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 66: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_67:
	nop
	mov 0x120, %r1 	! (VA for ASI 0x52) 
	.word 0xd0d84a40  ! 67: LDXA_R	ldxa	[%r1, %r0] 0x52, %r8
ld_local_indet_sync_ffffffff_68:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 68: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_69:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 69: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_70:
	nop
	mov 0x58, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_fast_indet_sync_ffffffff_71:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 71: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_72:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 72: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_73:
	nop
	mov 0x50, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 73: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
ld_local_indet_sync_ffffffff_74:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 74: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_75:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 75: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_76:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 76: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_77:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 77: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
st_fast_deter_nonsync_ffffffff_78:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 78: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_79:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 79: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_80:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 80: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_81:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 81: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_82:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 82: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_83:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 83: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_84:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 84: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_85:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 85: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
st_fast_deter_nonsync_ffffffff_86:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 86: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_87:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 87: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_88:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 88: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd2d84e40  ! 89: LDXA_R	ldxa	[%r1, %r0] 0x72, %r9
ld_local_indet_sync_ffffffff_90:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 90: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_91:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 91: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
ld_fast_indet_sync_ffffffff_92:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 92: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 93: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_94:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 94: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_95:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 95: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_deter_sync_ffffffff_96:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 96: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
ld_local_deter_sync_ffffffff_97:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 97: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_indet_sync_ffffffff_98:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 98: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 99: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_100:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 100: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_deter_sync_ffffffff_101:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 101: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_indet_sync_ffffffff_102:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 102: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_103:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 103: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_indet_sync_ffffffff_104:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 104: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_105:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 105: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_106:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 106: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_107:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xdcd848a0  ! 107: LDXA_R	ldxa	[%r1, %r0] 0x45, %r14
ld_fast_deter_sync_ffffffff_108:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x52) 
	.word 0xd0d84a40  ! 108: LDXA_R	ldxa	[%r1, %r0] 0x52, %r8
ld_fast_deter_sync_ffffffff_109:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 109: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
st_fast_deter_nonsync_ffffffff_110:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 110: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_111:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 111: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_112:
	nop
	mov 0x208, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 112: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
st_fast_deter_nonsync_ffffffff_113:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 113: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_114:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd2d84860  ! 114: LDXA_R	ldxa	[%r1, %r0] 0x43, %r9
st_fast_deter_nonsync_ffffffff_115:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 115: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_116:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 116: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_117:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 117: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_118:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_119:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 119: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_120:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 120: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_121:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 121: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_122:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 122: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_123:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 123: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_deter_sync_ffffffff_124:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x58) 
	.word 0xdad84b00  ! 124: LDXA_R	ldxa	[%r1, %r0] 0x58, %r13
ld_fast_indet_sync_ffffffff_125:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 125: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_126:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 126: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
st_fast_deter_nonsync_ffffffff_127:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 127: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_128:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 128: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_129:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_130:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 130: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_131:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 131: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_132:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 132: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_133:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 133: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_134:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 134: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
st_fast_deter_nonsync_ffffffff_135:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 135: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_136:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 136: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_deter_sync_ffffffff_137:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x54) 
	.word 0xdad84a80  ! 137: LDXA_R	ldxa	[%r1, %r0] 0x54, %r13
ld_fast_deter_sync_ffffffff_138:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 138: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_fast_indet_sync_ffffffff_139:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 139: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_140:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 140: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_141:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 141: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_142:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 142: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_143:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 143: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_144:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 144: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_145:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 145: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_146:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 146: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_147:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 147: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
st_fast_deter_nonsync_ffffffff_148:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 148: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_149:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 149: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_150:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 150: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_151:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 151: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
st_fast_deter_nonsync_ffffffff_152:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 152: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_153:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xdad84420  ! 153: LDXA_R	ldxa	[%r1, %r0] 0x21, %r13
st_fast_deter_nonsync_ffffffff_154:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 154: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_155:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 155: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_156:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 156: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_157:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd2d84420  ! 157: LDXA_R	ldxa	[%r1, %r0] 0x21, %r9
ld_local_indet_sync_ffffffff_158:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 158: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_159:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 159: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_160:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 160: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_local_indet_sync_ffffffff_161:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 161: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_162:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 162: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_163:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 163: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_164:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 164: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_165:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 165: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_166:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd0d84e40  ! 166: LDXA_R	ldxa	[%r1, %r0] 0x72, %r8
ld_fast_deter_sync_ffffffff_167:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 167: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
ld_local_indet_sync_ffffffff_168:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 168: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_169:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 169: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_deter_sync_ffffffff_170:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 170: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
ld_fast_deter_sync_ffffffff_171:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 171: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_local_deter_sync_ffffffff_172:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 172: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_deter_sync_ffffffff_173:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd2d84ba0  ! 173: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r9
ld_fast_indet_sync_ffffffff_174:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 174: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_175:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 175: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_176:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 176: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_177:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 177: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_178:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 178: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_179:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 179: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_indet_sync_ffffffff_180:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 180: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_181:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 181: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_182:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 182: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_183:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 183: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_deter_sync_ffffffff_184:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x54) 
	.word 0xd2d84a80  ! 184: LDXA_R	ldxa	[%r1, %r0] 0x54, %r9
ld_fast_deter_sync_ffffffff_185:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xded84980  ! 185: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r15
ld_fast_deter_sync_ffffffff_186:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd8d848a0  ! 186: LDXA_R	ldxa	[%r1, %r0] 0x45, %r12
ld_fast_deter_sync_ffffffff_187:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xd2d849e0  ! 187: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r9
st_fast_deter_nonsync_ffffffff_188:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 188: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_189:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd8d84860  ! 189: LDXA_R	ldxa	[%r1, %r0] 0x43, %r12
ld_local_deter_sync_ffffffff_190:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 190: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_191:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 191: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_192:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 192: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_193:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 193: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_194:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 194: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_indet_sync_ffffffff_195:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 195: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_196:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 196: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_197:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 197: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_198:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x54) 
	.word 0xd6d84a80  ! 198: LDXA_R	ldxa	[%r1, %r0] 0x54, %r11
st_fast_deter_nonsync_ffffffff_199:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 199: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_200:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 200: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_201:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 201: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_202:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 202: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_indet_sync_ffffffff_203:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 203: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_204:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 204: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
st_fast_deter_nonsync_ffffffff_205:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 205: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_206:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 206: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_207:
	nop
	mov 0x48, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 207: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
ld_local_indet_sync_ffffffff_208:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 208: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_209:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 209: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_210:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdcd84ba0  ! 210: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r14
ld_local_indet_sync_ffffffff_211:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 211: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_212:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xd2d849e0  ! 212: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r9
ld_local_deter_sync_ffffffff_213:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 213: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_214:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 214: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_indet_sync_ffffffff_215:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 215: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_216:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 216: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_deter_sync_ffffffff_217:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 217: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_deter_sync_ffffffff_218:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 218: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_local_indet_sync_ffffffff_219:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 219: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_220:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 220: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
ld_fast_indet_sync_ffffffff_221:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 221: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_222:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 222: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_223:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 223: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_224:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 224: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
st_fast_deter_nonsync_ffffffff_225:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 225: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_226:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 226: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_deter_sync_ffffffff_227:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xded84e40  ! 227: LDXA_R	ldxa	[%r1, %r0] 0x72, %r15
st_fast_deter_nonsync_ffffffff_228:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 228: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_229:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 229: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_230:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 230: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_231:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 231: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_232:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 232: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_indet_sync_ffffffff_233:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 233: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_234:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 234: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_235:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 235: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_236:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 236: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_237:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 237: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_238:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xd8d84b00  ! 238: LDXA_R	ldxa	[%r1, %r0] 0x58, %r12
ld_fast_indet_sync_ffffffff_239:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 239: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_240:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 240: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
st_fast_deter_nonsync_ffffffff_241:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 241: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_242:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xdcd84400  ! 242: LDXA_R	ldxa	[%r1, %r0] 0x20, %r14
ld_fast_indet_sync_ffffffff_243:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 243: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_244:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 244: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_245:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x58) 
	.word 0xd8d84b00  ! 245: LDXA_R	ldxa	[%r1, %r0] 0x58, %r12
ld_fast_indet_sync_ffffffff_246:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 246: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_247:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 247: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
st_fast_deter_nonsync_ffffffff_248:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 248: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_249:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 249: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_250:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 250: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
st_fast_deter_nonsync_ffffffff_251:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 251: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_252:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 252: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_indet_sync_ffffffff_253:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 253: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_254:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 254: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_255:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 255: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_256:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 256: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_257:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 257: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_258:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 258: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_259:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 259: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_260:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 260: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_indet_sync_ffffffff_261:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 261: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_262:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 262: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_263:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 263: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_264:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 264: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_265:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xded84420  ! 265: LDXA_R	ldxa	[%r1, %r0] 0x21, %r15
ld_fast_indet_sync_ffffffff_266:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 266: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_267:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 267: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_268:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 268: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_269:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 269: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_270:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 270: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_271:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 271: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_272:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 272: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_273:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 273: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_274:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 274: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_275:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 275: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_276:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 276: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_deter_sync_ffffffff_277:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 277: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_278:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 278: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_deter_sync_ffffffff_279:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 279: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_indet_sync_ffffffff_280:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 280: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_281:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 281: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_282:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 282: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
st_fast_deter_nonsync_ffffffff_283:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 283: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_284:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 284: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_285:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 285: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_286:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 286: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_287:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd4d844a0  ! 287: LDXA_R	ldxa	[%r1, %r0] 0x25, %r10
ld_fast_indet_sync_ffffffff_288:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 288: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_289:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 289: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_290:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 290: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_291:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 291: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_292:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 292: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_293:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 293: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_294:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 294: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_295:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 295: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_296:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 296: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_297:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 297: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_298:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 298: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_299:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 299: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_300:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 300: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_301:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 301: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_302:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 302: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
ld_local_deter_sync_ffffffff_303:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 303: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_304:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 304: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_305:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 305: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_306:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 306: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_307:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 307: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
st_fast_deter_nonsync_ffffffff_308:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 308: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_309:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 309: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_310:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 310: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_311:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 311: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_312:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x54) 
	.word 0xd2d84a80  ! 312: LDXA_R	ldxa	[%r1, %r0] 0x54, %r9
ld_local_deter_sync_ffffffff_313:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 313: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_314:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 314: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_315:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 315: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_316:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 316: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_317:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 317: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_318:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 318: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_deter_sync_ffffffff_319:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 319: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
ld_fast_indet_sync_ffffffff_320:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 320: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_321:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 321: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_322:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 322: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_323:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 323: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_324:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 324: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_325:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 325: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_326:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 326: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_327:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 327: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_328:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xd4d844a0  ! 328: LDXA_R	ldxa	[%r1, %r0] 0x25, %r10
ld_local_deter_sync_ffffffff_329:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 329: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_deter_sync_ffffffff_330:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x52) 
	.word 0xd6d84a40  ! 330: LDXA_R	ldxa	[%r1, %r0] 0x52, %r11
ld_fast_deter_sync_ffffffff_331:
	nop
	mov 0x218, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 331: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
ld_fast_indet_sync_ffffffff_332:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 332: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_333:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x52) 
	.word 0xded84a40  ! 333: LDXA_R	ldxa	[%r1, %r0] 0x52, %r15
ld_local_indet_sync_ffffffff_334:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 334: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_335:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 335: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
st_fast_deter_nonsync_ffffffff_336:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 336: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_337:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 337: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_deter_sync_ffffffff_338:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 338: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_339:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 339: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_indet_sync_ffffffff_340:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 340: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_341:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 341: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_342:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 342: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_343:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 343: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_344:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 344: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
st_fast_deter_nonsync_ffffffff_345:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 345: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_346:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 346: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_347:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 347: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_348:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd4d84b00  ! 348: LDXA_R	ldxa	[%r1, %r0] 0x58, %r10
ld_fast_deter_sync_ffffffff_349:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 349: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
ld_fast_deter_sync_ffffffff_350:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x58) 
	.word 0xdcd84b00  ! 350: LDXA_R	ldxa	[%r1, %r0] 0x58, %r14
ld_fast_deter_sync_ffffffff_351:
	nop
	mov 0x220, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 351: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_fast_deter_sync_ffffffff_352:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 352: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_fast_indet_sync_ffffffff_353:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 353: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_354:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 354: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_355:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 355: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_356:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 356: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_357:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xded84980  ! 357: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r15
ld_local_deter_sync_ffffffff_358:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 358: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_local_indet_sync_ffffffff_359:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 359: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_360:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 360: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_361:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xded84420  ! 361: LDXA_R	ldxa	[%r1, %r0] 0x21, %r15
ld_fast_deter_sync_ffffffff_362:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd2d84e40  ! 362: LDXA_R	ldxa	[%r1, %r0] 0x72, %r9
st_fast_deter_nonsync_ffffffff_363:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 363: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_364:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 364: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
st_fast_deter_nonsync_ffffffff_365:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 365: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_366:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 366: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
ld_local_deter_sync_ffffffff_367:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 367: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
st_fast_deter_nonsync_ffffffff_368:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 368: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_369:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 369: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_370:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xded84a00  ! 370: LDXA_R	ldxa	[%r1, %r0] 0x50, %r15
ld_local_deter_sync_ffffffff_371:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 371: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_deter_sync_ffffffff_372:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 372: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
st_fast_deter_nonsync_ffffffff_373:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 373: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_374:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 374: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_375:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 375: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_376:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xded84980  ! 376: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r15
st_fast_deter_nonsync_ffffffff_377:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 377: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_378:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 378: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
st_fast_deter_nonsync_ffffffff_379:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 379: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_380:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 380: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_381:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 381: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_indet_sync_ffffffff_382:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 382: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_383:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 383: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_384:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 384: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_deter_sync_ffffffff_385:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 385: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_indet_sync_ffffffff_386:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 386: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_387:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 387: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_388:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xd0d849e0  ! 388: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r8
ld_local_indet_sync_ffffffff_389:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 389: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_390:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 390: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_391:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 391: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_392:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 392: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
st_fast_deter_nonsync_ffffffff_393:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 393: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_394:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 394: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_395:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 395: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_indet_sync_ffffffff_396:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 396: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_397:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 397: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_398:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 398: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_399:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd4d84ba0  ! 399: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r10
ld_fast_indet_sync_ffffffff_400:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 400: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_401:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 401: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_402:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 402: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_403:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 403: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_404:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 404: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
ld_fast_indet_sync_ffffffff_405:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 405: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_406:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd2d84e40  ! 406: LDXA_R	ldxa	[%r1, %r0] 0x72, %r9
ld_local_indet_sync_ffffffff_407:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 407: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_408:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 408: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_deter_sync_ffffffff_409:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 409: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
ld_local_indet_sync_ffffffff_410:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 410: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_411:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 411: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_412:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 412: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
st_fast_deter_nonsync_ffffffff_413:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 413: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_414:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 414: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_415:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 415: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_deter_sync_ffffffff_416:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 416: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
ld_fast_indet_sync_ffffffff_417:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 417: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_418:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 418: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_419:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 419: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_420:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 420: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_421:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 421: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_422:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 422: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_423:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 423: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_424:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 424: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_425:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 425: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_indet_sync_ffffffff_426:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 426: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_427:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 427: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_428:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 428: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_indet_sync_ffffffff_429:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 429: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_430:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd0d84b00  ! 430: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
ld_local_indet_sync_ffffffff_431:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 431: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_432:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 432: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_433:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 433: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
ld_local_indet_sync_ffffffff_434:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 434: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_435:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 435: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
ld_local_indet_sync_ffffffff_436:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 436: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_437:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 437: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_local_indet_sync_ffffffff_438:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 438: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_439:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 439: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_indet_sync_ffffffff_440:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 440: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_441:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 441: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_local_deter_sync_ffffffff_442:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 442: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_deter_sync_ffffffff_443:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 443: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
st_fast_deter_nonsync_ffffffff_444:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 444: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_445:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xd4d84400  ! 445: LDXA_R	ldxa	[%r1, %r0] 0x20, %r10
ld_local_indet_sync_ffffffff_446:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 446: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_447:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 447: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_448:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 448: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_449:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 449: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_450:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 450: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_indet_sync_ffffffff_451:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 451: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_452:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 452: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_453:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 453: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_454:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 454: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_455:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 455: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_456:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xd6d84420  ! 456: LDXA_R	ldxa	[%r1, %r0] 0x21, %r11
ld_fast_indet_sync_ffffffff_457:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 457: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_458:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 458: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_459:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 459: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_460:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 460: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_461:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 461: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_462:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 462: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_463:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd6d844a0  ! 463: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
ld_local_deter_sync_ffffffff_464:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 464: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_465:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 465: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_466:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd4d84860  ! 466: LDXA_R	ldxa	[%r1, %r0] 0x43, %r10
st_fast_deter_nonsync_ffffffff_467:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 467: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_468:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 468: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_469:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 469: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_470:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 470: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_fast_indet_sync_ffffffff_471:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 471: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_472:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 472: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_473:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 473: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_474:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 474: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_475:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 475: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_476:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd6d84420  ! 476: LDXA_R	ldxa	[%r1, %r0] 0x21, %r11
ld_fast_deter_sync_ffffffff_477:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d84980  ! 477: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r10
ld_fast_indet_sync_ffffffff_478:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 478: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_479:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 479: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_deter_sync_ffffffff_480:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 480: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_481:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 481: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_fast_indet_sync_ffffffff_482:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 482: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_483:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 483: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_deter_sync_ffffffff_484:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xd8d849e0  ! 484: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r12
ld_local_deter_sync_ffffffff_485:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 485: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_486:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 486: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_487:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 487: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_488:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 488: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_489:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 489: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_fast_indet_sync_ffffffff_490:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 490: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_491:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 491: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_492:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 492: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_indet_sync_ffffffff_493:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 493: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_494:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 494: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_495:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 495: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
st_fast_deter_nonsync_ffffffff_496:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 496: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_497:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 497: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_498:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 498: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_499:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 499: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_local_indet_sync_ffffffff_500:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 500: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_501:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 501: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_502:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 502: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
ld_local_indet_sync_ffffffff_503:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 503: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_504:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xded844a0  ! 504: LDXA_R	ldxa	[%r1, %r0] 0x25, %r15
st_fast_deter_nonsync_ffffffff_505:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 505: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_506:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 506: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_507:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 507: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_deter_sync_ffffffff_508:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 508: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_509:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xdad84ba0  ! 509: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r13
ld_local_deter_sync_ffffffff_510:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 510: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_local_deter_sync_ffffffff_511:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 511: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_indet_sync_ffffffff_512:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 512: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_513:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xd2d84420  ! 513: LDXA_R	ldxa	[%r1, %r0] 0x21, %r9
st_fast_deter_nonsync_ffffffff_514:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 514: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_515:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 515: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_516:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 516: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_517:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 517: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_518:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 518: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_519:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 519: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_520:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 520: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_521:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 521: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_522:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 522: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_deter_sync_ffffffff_523:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xdcd84a00  ! 523: LDXA_R	ldxa	[%r1, %r0] 0x50, %r14
ld_fast_deter_sync_ffffffff_524:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd2d84e40  ! 524: LDXA_R	ldxa	[%r1, %r0] 0x72, %r9
st_fast_deter_nonsync_ffffffff_525:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 525: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_526:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 526: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_527:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 527: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_528:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 528: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_529:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 529: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_local_indet_sync_ffffffff_530:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 530: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_531:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 531: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_deter_sync_ffffffff_532:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 532: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_deter_sync_ffffffff_533:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 533: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_indet_sync_ffffffff_534:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 534: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_535:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 535: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_536:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 536: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_fast_indet_sync_ffffffff_537:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 537: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_538:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 538: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_fast_deter_sync_ffffffff_539:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 539: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_fast_deter_sync_ffffffff_540:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xd2d849e0  ! 540: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r9
ld_local_deter_sync_ffffffff_541:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 541: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_542:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 542: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_local_indet_sync_ffffffff_543:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 543: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_544:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 544: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_545:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xd6d84400  ! 545: LDXA_R	ldxa	[%r1, %r0] 0x20, %r11
ld_fast_deter_sync_ffffffff_546:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xded84420  ! 546: LDXA_R	ldxa	[%r1, %r0] 0x21, %r15
ld_local_indet_sync_ffffffff_547:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 547: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_548:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 548: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_deter_sync_ffffffff_549:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 549: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_fast_indet_sync_ffffffff_550:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 550: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_551:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 551: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_552:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 552: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_indet_sync_ffffffff_553:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 553: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_554:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 554: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_555:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 555: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_556:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 556: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_557:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd2d84860  ! 557: LDXA_R	ldxa	[%r1, %r0] 0x43, %r9
ld_local_indet_sync_ffffffff_558:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 558: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_559:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 559: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_560:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 560: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_561:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 561: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_562:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 562: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_563:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 563: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_564:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x54) 
	.word 0xd0d84a80  ! 564: LDXA_R	ldxa	[%r1, %r0] 0x54, %r8
ld_local_deter_sync_ffffffff_565:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 565: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_indet_sync_ffffffff_566:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 566: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_567:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 567: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_fast_indet_sync_ffffffff_568:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 568: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_569:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 569: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_570:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 570: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_571:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 571: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_572:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 572: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_573:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 573: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
st_fast_deter_nonsync_ffffffff_574:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 574: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_575:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 575: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_deter_sync_ffffffff_576:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 576: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
st_fast_deter_nonsync_ffffffff_577:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 577: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_578:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 578: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_deter_sync_ffffffff_579:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 579: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_580:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 580: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_581:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 581: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_582:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 582: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_583:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 583: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_584:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 584: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_indet_sync_ffffffff_585:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 585: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_586:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 586: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_587:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 587: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_588:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xded84ba0  ! 588: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r15
ld_local_indet_sync_ffffffff_589:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 589: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_590:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 590: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
st_fast_deter_nonsync_ffffffff_591:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 591: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_592:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 592: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_593:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 593: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_594:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 594: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_595:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xdcd849e0  ! 595: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r14
ld_local_deter_sync_ffffffff_596:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 596: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_indet_sync_ffffffff_597:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 597: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_598:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 598: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_599:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 599: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_deter_sync_ffffffff_600:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xdcd848a0  ! 600: LDXA_R	ldxa	[%r1, %r0] 0x45, %r14
ld_fast_indet_sync_ffffffff_601:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 601: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_602:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 602: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_603:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 603: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_604:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 604: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
ld_fast_deter_sync_ffffffff_605:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x54) 
	.word 0xd8d84a80  ! 605: LDXA_R	ldxa	[%r1, %r0] 0x54, %r12
ld_fast_indet_sync_ffffffff_606:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 606: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_607:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 607: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_608:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 608: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_609:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 609: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_610:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x52) 
	.word 0xd0d84a40  ! 610: LDXA_R	ldxa	[%r1, %r0] 0x52, %r8
ld_local_indet_sync_ffffffff_611:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 611: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_612:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 612: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_613:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 613: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_614:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 614: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_615:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 615: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_616:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 616: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
ld_fast_deter_sync_ffffffff_617:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd2d848a0  ! 617: LDXA_R	ldxa	[%r1, %r0] 0x45, %r9
st_fast_deter_nonsync_ffffffff_618:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 618: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_619:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 619: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_deter_sync_ffffffff_620:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 620: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_deter_sync_ffffffff_621:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 621: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_fast_deter_sync_ffffffff_622:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd2d84860  ! 622: LDXA_R	ldxa	[%r1, %r0] 0x43, %r9
ld_fast_deter_sync_ffffffff_623:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd0d84860  ! 623: LDXA_R	ldxa	[%r1, %r0] 0x43, %r8
ld_local_deter_sync_ffffffff_624:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 624: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_fast_indet_sync_ffffffff_625:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 625: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_626:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 626: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_deter_sync_ffffffff_627:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 627: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_fast_indet_sync_ffffffff_628:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 628: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_629:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 629: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_630:
	nop
	mov 0x40, %r1 	! (VA for ASI 0x58) 
	.word 0xd2d84b00  ! 630: LDXA_R	ldxa	[%r1, %r0] 0x58, %r9
ld_fast_indet_sync_ffffffff_631:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 631: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_632:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 632: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_633:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 633: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_634:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 634: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
st_fast_deter_nonsync_ffffffff_635:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 635: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_636:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 636: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
ld_local_indet_sync_ffffffff_637:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 637: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_638:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 638: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_639:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 639: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ld_fast_deter_sync_ffffffff_640:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 640: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
ld_fast_deter_sync_ffffffff_641:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 641: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
ld_fast_indet_sync_ffffffff_642:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 642: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_643:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 643: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_644:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 644: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
st_fast_deter_nonsync_ffffffff_645:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 645: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_646:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd2d84e40  ! 646: LDXA_R	ldxa	[%r1, %r0] 0x72, %r9
ld_local_indet_sync_ffffffff_647:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 647: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_648:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 648: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_649:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 649: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_650:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 650: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
ld_fast_deter_sync_ffffffff_651:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd2d84860  ! 651: LDXA_R	ldxa	[%r1, %r0] 0x43, %r9
ld_local_deter_sync_ffffffff_652:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 652: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_local_indet_sync_ffffffff_653:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 653: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_654:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 654: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_655:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 655: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_656:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 656: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_657:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 657: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_658:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 658: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_659:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 659: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_indet_sync_ffffffff_660:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 660: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_local_indet_sync_ffffffff_661:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 661: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_662:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 662: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_663:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 663: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_664:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 664: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_665:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 665: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_666:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 666: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_indet_sync_ffffffff_667:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 667: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_deter_sync_ffffffff_668:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd6d848a0  ! 668: LDXA_R	ldxa	[%r1, %r0] 0x45, %r11
ld_fast_indet_sync_ffffffff_669:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 669: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_670:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 670: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_671:
	nop
	mov 0x88, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 671: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
st_fast_deter_nonsync_ffffffff_672:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 672: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_673:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 673: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_674:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 674: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_675:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 675: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_676:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 676: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_677:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd0d84980  ! 677: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r8
ld_local_deter_sync_ffffffff_678:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 678: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
st_fast_deter_nonsync_ffffffff_679:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 679: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_680:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 680: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_681:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 681: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_682:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 682: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_indet_sync_ffffffff_683:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 683: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_684:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 684: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_685:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 685: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_686:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 686: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_687:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 687: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_deter_sync_ffffffff_688:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 688: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
st_fast_deter_nonsync_ffffffff_689:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 689: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_690:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 690: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_691:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 691: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_692:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 692: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_693:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 693: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
st_fast_deter_nonsync_ffffffff_694:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 694: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_695:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 695: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_696:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 696: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
ld_fast_indet_sync_ffffffff_697:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 697: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_698:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 698: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_fast_indet_sync_ffffffff_699:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 699: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_700:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 700: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_deter_sync_ffffffff_701:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 701: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_local_indet_sync_ffffffff_702:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 702: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_703:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x58) 
	.word 0xd6d84b00  ! 703: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
ld_local_deter_sync_ffffffff_704:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 704: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_indet_sync_ffffffff_705:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 705: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_indet_sync_ffffffff_706:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 706: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_707:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 707: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_708:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 708: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_709:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 709: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_710:
	nop
	mov 0x70, %r1 	! (VA for ASI 0x54) 
	.word 0xd2d84a80  ! 710: LDXA_R	ldxa	[%r1, %r0] 0x54, %r9
ld_local_indet_sync_ffffffff_711:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 711: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_712:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 712: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_713:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 713: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_fast_indet_sync_ffffffff_714:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 714: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_deter_sync_ffffffff_715:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xdcd84400  ! 715: LDXA_R	ldxa	[%r1, %r0] 0x20, %r14
ld_fast_indet_sync_ffffffff_716:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 716: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
st_fast_deter_nonsync_ffffffff_717:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 717: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_718:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 718: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_fast_indet_sync_ffffffff_719:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 719: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_720:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 720: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_721:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd8d84e40  ! 721: LDXA_R	ldxa	[%r1, %r0] 0x72, %r12
ld_fast_deter_sync_ffffffff_722:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 722: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_indet_sync_ffffffff_723:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 723: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_indet_sync_ffffffff_724:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 724: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_725:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 725: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_726:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 726: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_indet_sync_ffffffff_727:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 727: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_fast_indet_sync_ffffffff_728:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 728: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_729:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 729: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
st_fast_deter_nonsync_ffffffff_730:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 730: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_731:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 731: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_732:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 732: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_fast_indet_sync_ffffffff_733:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 733: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_fast_indet_sync_ffffffff_734:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 734: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_735:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 735: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_local_indet_sync_ffffffff_736:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 736: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
st_fast_deter_nonsync_ffffffff_737:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 737: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_738:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 738: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_739:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 739: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_local_indet_sync_ffffffff_740:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 740: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_741:
	nop
	mov 0x58, %r1 	! (VA for ASI 0x54) 
	.word 0xded84a80  ! 741: LDXA_R	ldxa	[%r1, %r0] 0x54, %r15
ld_fast_indet_sync_ffffffff_742:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 742: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_743:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 743: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_fast_indet_sync_ffffffff_744:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 744: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_745:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 745: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_746:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 746: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_747:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 747: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_deter_sync_ffffffff_748:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xdad848a0  ! 748: LDXA_R	ldxa	[%r1, %r0] 0x45, %r13
ld_fast_deter_sync_ffffffff_749:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x45) 
	.word 0xd2d848a0  ! 749: LDXA_R	ldxa	[%r1, %r0] 0x45, %r9
ld_local_deter_sync_ffffffff_750:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 750: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_indet_sync_ffffffff_751:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 751: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_752:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 752: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_753:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 753: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_indet_sync_ffffffff_754:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 754: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_deter_sync_ffffffff_755:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 755: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
ld_fast_deter_sync_ffffffff_756:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 756: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
ld_fast_indet_sync_ffffffff_757:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 757: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_deter_sync_ffffffff_758:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 758: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_fast_deter_sync_ffffffff_759:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 759: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ld_local_indet_sync_ffffffff_760:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 760: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_761:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xdcd84980  ! 761: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r14
st_fast_deter_nonsync_ffffffff_762:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 762: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_763:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 763: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_764:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 764: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_765:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 765: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_766:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 766: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_767:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 767: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_768:
	nop
	mov 0x68, %r1 	! (VA for ASI 0x54) 
	.word 0xd4d84a80  ! 768: LDXA_R	ldxa	[%r1, %r0] 0x54, %r10
ld_local_deter_sync_ffffffff_769:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 769: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
st_fast_deter_nonsync_ffffffff_770:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 770: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_771:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xe2f04400  ! 771: STXA_R	stxa	%r17, [%r1 + %r0] 0x20
ld_fast_deter_sync_ffffffff_772:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd0d84ba0  ! 772: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r8
ld_fast_deter_sync_ffffffff_773:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xded848a0  ! 773: LDXA_R	ldxa	[%r1, %r0] 0x45, %r15
ld_local_deter_sync_ffffffff_774:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 774: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_deter_sync_ffffffff_775:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xdcd84400  ! 775: LDXA_R	ldxa	[%r1, %r0] 0x20, %r14
st_fast_deter_nonsync_ffffffff_776:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 776: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_777:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 777: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_indet_sync_ffffffff_778:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 778: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_779:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 779: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_local_deter_sync_ffffffff_780:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 780: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_local_indet_sync_ffffffff_781:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 781: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_782:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xded849c0  ! 782: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r15
ld_fast_indet_sync_ffffffff_783:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 783: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_784:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 784: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_785:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 785: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
ld_local_deter_sync_ffffffff_786:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd2d849c0  ! 786: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r9
ld_local_deter_sync_ffffffff_787:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 787: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
st_fast_deter_nonsync_ffffffff_788:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xe6f04400  ! 788: STXA_R	stxa	%r19, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_789:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 789: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_deter_sync_ffffffff_790:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x58) 
	.word 0xded84b00  ! 790: LDXA_R	ldxa	[%r1, %r0] 0x58, %r15
ld_local_indet_sync_ffffffff_791:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 791: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
ld_fast_indet_sync_ffffffff_792:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 792: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
st_fast_deter_nonsync_ffffffff_793:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 793: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_794:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 794: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
st_fast_deter_nonsync_ffffffff_795:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 795: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_796:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 796: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_deter_sync_ffffffff_797:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd2d84980  ! 797: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r9
ld_local_deter_sync_ffffffff_798:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 798: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
st_fast_deter_nonsync_ffffffff_799:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 799: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_800:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 800: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
ld_fast_indet_sync_ffffffff_801:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 801: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_deter_sync_ffffffff_802:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 802: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
ld_local_indet_sync_ffffffff_803:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 803: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
st_fast_deter_nonsync_ffffffff_804:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 804: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_805:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 805: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_806:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 806: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_deter_sync_ffffffff_807:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 807: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
st_fast_deter_nonsync_ffffffff_808:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 808: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_809:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 809: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_810:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 810: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_811:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 811: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
ld_fast_indet_sync_ffffffff_812:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 812: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_813:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x54) 
	.word 0xdad84a80  ! 813: LDXA_R	ldxa	[%r1, %r0] 0x54, %r13
ld_fast_indet_sync_ffffffff_814:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 814: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_815:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 815: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
st_fast_deter_nonsync_ffffffff_816:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xeaf049e0  ! 816: STXA_R	stxa	%r21, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_817:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5d) 
	.word 0xd4d84ba0  ! 817: LDXA_R	ldxa	[%r1, %r0] 0x5d, %r10
ld_local_indet_sync_ffffffff_818:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 818: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_indet_sync_ffffffff_819:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 819: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_indet_sync_ffffffff_820:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 820: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_indet_sync_ffffffff_821:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 821: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_822:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xdcd84860  ! 822: LDXA_R	ldxa	[%r1, %r0] 0x43, %r14
st_fast_deter_nonsync_ffffffff_823:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 823: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_824:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 824: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_825:
	nop
	mov 0x120, %r1 	! (VA for ASI 0x52) 
	.word 0xd4d84a40  ! 825: LDXA_R	ldxa	[%r1, %r0] 0x52, %r10
st_fast_deter_nonsync_ffffffff_826:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 826: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_827:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 827: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_828:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 828: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_deter_sync_ffffffff_829:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xded84e40  ! 829: LDXA_R	ldxa	[%r1, %r0] 0x72, %r15
ld_local_deter_sync_ffffffff_830:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 830: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_indet_sync_ffffffff_831:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 831: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_832:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdad84aa0  ! 832: LDXA_R	ldxa	[%r1, %r0] 0x55, %r13
st_fast_deter_nonsync_ffffffff_833:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xecf04400  ! 833: STXA_R	stxa	%r22, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_834:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 834: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_835:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 835: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_836:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 836: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
st_fast_deter_nonsync_ffffffff_837:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 837: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_838:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd2d84840  ! 838: LDXA_R	ldxa	[%r1, %r0] 0x42, %r9
ld_local_indet_sync_ffffffff_839:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd2d84aa0  ! 839: LDXA_R	ldxa	[%r1, %r0] 0x55, %r9
ld_local_indet_sync_ffffffff_840:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 840: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_local_deter_sync_ffffffff_841:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 841: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_deter_sync_ffffffff_842:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 842: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_843:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 843: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_844:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 844: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_845:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 845: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_846:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 846: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_847:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 847: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_848:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 848: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_local_indet_sync_ffffffff_849:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 849: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_850:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xd4d849e0  ! 850: LDXA_R	ldxa	[%r1, %r0] 0x4f, %r10
ld_local_deter_sync_ffffffff_851:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 851: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_local_indet_sync_ffffffff_852:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 852: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_853:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 853: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_854:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd4d84c60  ! 854: LDXA_R	ldxa	[%r1, %r0] 0x63, %r10
ld_fast_indet_sync_ffffffff_855:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 855: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_indet_sync_ffffffff_856:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 856: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_857:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 857: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_858:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 858: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
ld_fast_indet_sync_ffffffff_859:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 859: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
st_fast_deter_nonsync_ffffffff_860:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 860: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_861:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 861: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_local_deter_sync_ffffffff_862:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 862: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_local_deter_sync_ffffffff_863:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 863: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_864:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 864: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
st_fast_deter_nonsync_ffffffff_865:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 865: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_866:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 866: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_fast_deter_sync_ffffffff_867:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 867: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
ld_local_indet_sync_ffffffff_868:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 868: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_869:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 869: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
ld_fast_indet_sync_ffffffff_870:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 870: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_indet_sync_ffffffff_871:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 871: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_fast_indet_sync_ffffffff_872:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 872: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_fast_deter_sync_ffffffff_873:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xd8d84a40  ! 873: LDXA_R	ldxa	[%r1, %r0] 0x52, %r12
ld_fast_indet_sync_ffffffff_874:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd0d84b20  ! 874: LDXA_R	ldxa	[%r1, %r0] 0x59, %r8
ld_local_deter_sync_ffffffff_875:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 875: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_fast_deter_sync_ffffffff_876:
	nop
	mov 0x60, %r1 	! (VA for ASI 0x54) 
	.word 0xded84a80  ! 876: LDXA_R	ldxa	[%r1, %r0] 0x54, %r15
ld_local_deter_sync_ffffffff_877:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 877: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_878:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 878: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_local_deter_sync_ffffffff_879:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd6d849c0  ! 879: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r11
st_fast_deter_nonsync_ffffffff_880:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 880: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_881:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdad84840  ! 881: LDXA_R	ldxa	[%r1, %r0] 0x42, %r13
ld_fast_indet_sync_ffffffff_882:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 882: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_883:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe0f04400  ! 883: STXA_R	stxa	%r16, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_884:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 884: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_885:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 885: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_fast_indet_sync_ffffffff_886:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 886: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
st_fast_deter_nonsync_ffffffff_887:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 887: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_888:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xdcd848a0  ! 888: LDXA_R	ldxa	[%r1, %r0] 0x45, %r14
ld_fast_indet_sync_ffffffff_889:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 889: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_890:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 890: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_891:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xdad84c60  ! 891: LDXA_R	ldxa	[%r1, %r0] 0x63, %r13
ld_fast_indet_sync_ffffffff_892:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 892: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_893:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 893: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_fast_indet_sync_ffffffff_894:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdcd84b20  ! 894: LDXA_R	ldxa	[%r1, %r0] 0x59, %r14
ld_local_indet_sync_ffffffff_895:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd4d84aa0  ! 895: LDXA_R	ldxa	[%r1, %r0] 0x55, %r10
ld_fast_indet_sync_ffffffff_896:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 896: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_deter_sync_ffffffff_897:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 897: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
st_fast_deter_nonsync_ffffffff_898:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 898: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_899:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 899: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_deter_sync_ffffffff_900:
	nop
	mov 0x210, %r1 	! (VA for ASI 0x52) 
	.word 0xdad84a40  ! 900: LDXA_R	ldxa	[%r1, %r0] 0x52, %r13
ld_fast_deter_sync_ffffffff_901:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 901: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
ld_local_deter_sync_ffffffff_902:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd4d849c0  ! 902: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r10
ld_local_deter_sync_ffffffff_903:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd0d849c0  ! 903: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r8
ld_local_deter_sync_ffffffff_904:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 904: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_deter_sync_ffffffff_905:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 905: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_fast_deter_sync_ffffffff_906:
	nop
	mov 0x58, %r1 	! (VA for ASI 0x54) 
	.word 0xd6d84a80  ! 906: LDXA_R	ldxa	[%r1, %r0] 0x54, %r11
ld_local_indet_sync_ffffffff_907:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 907: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_908:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 908: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_fast_indet_sync_ffffffff_909:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 909: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_910:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 910: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
st_fast_deter_nonsync_ffffffff_911:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4f) 
	.word 0xe0f049e0  ! 911: STXA_R	stxa	%r16, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_912:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 912: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_913:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 913: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_indet_sync_ffffffff_914:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 914: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_915:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xdcd84c60  ! 915: LDXA_R	ldxa	[%r1, %r0] 0x63, %r14
ld_fast_deter_sync_ffffffff_916:
	nop
	mov 0x60, %r1 	! (VA for ASI 0x54) 
	.word 0xd8d84a80  ! 916: LDXA_R	ldxa	[%r1, %r0] 0x54, %r12
ld_local_deter_sync_ffffffff_917:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 917: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_918:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 918: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_local_deter_sync_ffffffff_919:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd2d84c60  ! 919: LDXA_R	ldxa	[%r1, %r0] 0x63, %r9
ld_fast_indet_sync_ffffffff_920:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 920: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_921:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 921: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_922:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 922: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_923:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 923: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_924:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 924: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_indet_sync_ffffffff_925:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd8d84b20  ! 925: LDXA_R	ldxa	[%r1, %r0] 0x59, %r12
ld_local_deter_sync_ffffffff_926:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xdcd84840  ! 926: LDXA_R	ldxa	[%r1, %r0] 0x42, %r14
ld_local_indet_sync_ffffffff_927:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 927: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
st_fast_deter_nonsync_ffffffff_928:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x20) 
	.word 0xe8f04400  ! 928: STXA_R	stxa	%r20, [%r1 + %r0] 0x20
st_fast_deter_nonsync_ffffffff_929:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 929: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_930:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 930: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_deter_sync_ffffffff_931:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xd2d844a0  ! 931: LDXA_R	ldxa	[%r1, %r0] 0x25, %r9
ld_fast_deter_sync_ffffffff_932:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x20) 
	.word 0xd8d84400  ! 932: LDXA_R	ldxa	[%r1, %r0] 0x20, %r12
ld_fast_deter_sync_ffffffff_933:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd6d84e40  ! 933: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
st_fast_deter_nonsync_ffffffff_934:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 934: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_935:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x20) 
	.word 0xeef04400  ! 935: STXA_R	stxa	%r23, [%r1 + %r0] 0x20
ld_local_indet_sync_ffffffff_936:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 936: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_deter_sync_ffffffff_937:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 937: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_938:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xe4f04400  ! 938: STXA_R	stxa	%r18, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_939:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 939: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_indet_sync_ffffffff_940:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 940: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_941:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xded84840  ! 941: LDXA_R	ldxa	[%r1, %r0] 0x42, %r15
ld_local_deter_sync_ffffffff_942:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdcd849c0  ! 942: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r14
ld_local_indet_sync_ffffffff_943:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 943: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_944:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd2d84980  ! 944: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r9
st_fast_deter_nonsync_ffffffff_945:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 945: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_local_indet_sync_ffffffff_946:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 946: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_947:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd0d84c60  ! 947: LDXA_R	ldxa	[%r1, %r0] 0x63, %r8
st_fast_deter_nonsync_ffffffff_948:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe2f049e0  ! 948: STXA_R	stxa	%r17, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_949:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd0d84840  ! 949: LDXA_R	ldxa	[%r1, %r0] 0x42, %r8
ld_fast_deter_sync_ffffffff_950:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd2d84860  ! 950: LDXA_R	ldxa	[%r1, %r0] 0x43, %r9
ld_fast_deter_sync_ffffffff_951:
	nop
	mov 0x80, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 951: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_fast_deter_sync_ffffffff_952:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd6d84c60  ! 952: LDXA_R	ldxa	[%r1, %r0] 0x63, %r11
ld_local_deter_sync_ffffffff_953:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xd8d849c0  ! 953: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r12
st_fast_deter_nonsync_ffffffff_954:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 954: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_955:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 955: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
st_fast_deter_nonsync_ffffffff_956:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4f) 
	.word 0xe6f049e0  ! 956: STXA_R	stxa	%r19, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_957:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x43) 
	.word 0xd6d84860  ! 957: LDXA_R	ldxa	[%r1, %r0] 0x43, %r11
ld_fast_deter_sync_ffffffff_958:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xdcd84980  ! 958: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r14
ld_local_indet_sync_ffffffff_959:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 959: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_indet_sync_ffffffff_960:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 960: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_961:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x54) 
	.word 0xdcd84a80  ! 961: LDXA_R	ldxa	[%r1, %r0] 0x54, %r14
ld_local_deter_sync_ffffffff_962:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 962: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_indet_sync_ffffffff_963:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 963: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_deter_sync_ffffffff_964:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xded84c60  ! 964: LDXA_R	ldxa	[%r1, %r0] 0x63, %r15
ld_fast_indet_sync_ffffffff_965:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xded84b20  ! 965: LDXA_R	ldxa	[%r1, %r0] 0x59, %r15
ld_local_deter_sync_ffffffff_966:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 966: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_fast_indet_sync_ffffffff_967:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 967: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_deter_sync_ffffffff_968:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4e) 
	.word 0xdad849c0  ! 968: LDXA_R	ldxa	[%r1, %r0] 0x4e, %r13
ld_fast_indet_sync_ffffffff_969:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 969: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
st_fast_deter_nonsync_ffffffff_970:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 970: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
ld_fast_deter_sync_ffffffff_971:
	nop
	mov 0x108, %r1 	! (VA for ASI 0x21) 
	.word 0xd8d84420  ! 971: LDXA_R	ldxa	[%r1, %r0] 0x21, %r12
st_fast_deter_nonsync_ffffffff_972:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xe4f049e0  ! 972: STXA_R	stxa	%r18, [%r1 + %r0] 0x4f
st_fast_deter_nonsync_ffffffff_973:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x4f) 
	.word 0xecf049e0  ! 973: STXA_R	stxa	%r22, [%r1 + %r0] 0x4f
ld_fast_indet_sync_ffffffff_974:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd4d84b20  ! 974: LDXA_R	ldxa	[%r1, %r0] 0x59, %r10
ld_local_indet_sync_ffffffff_975:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 975: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_local_indet_sync_ffffffff_976:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 976: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_local_deter_sync_ffffffff_977:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd8d84840  ! 977: LDXA_R	ldxa	[%r1, %r0] 0x42, %r12
ld_fast_deter_sync_ffffffff_978:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xdcd844a0  ! 978: LDXA_R	ldxa	[%r1, %r0] 0x25, %r14
ld_local_deter_sync_ffffffff_979:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd4d84840  ! 979: LDXA_R	ldxa	[%r1, %r0] 0x42, %r10
ld_fast_deter_sync_ffffffff_980:
	nop
	mov 0x120, %r1 	! (VA for ASI 0x52) 
	.word 0xd0d84a40  ! 980: LDXA_R	ldxa	[%r1, %r0] 0x52, %r8
ld_fast_indet_sync_ffffffff_981:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xdad84b20  ! 981: LDXA_R	ldxa	[%r1, %r0] 0x59, %r13
ld_local_indet_sync_ffffffff_982:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xdcd84aa0  ! 982: LDXA_R	ldxa	[%r1, %r0] 0x55, %r14
ld_fast_indet_sync_ffffffff_983:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 983: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_fast_deter_sync_ffffffff_984:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x21) 
	.word 0xd0d84420  ! 984: LDXA_R	ldxa	[%r1, %r0] 0x21, %r8
ld_local_indet_sync_ffffffff_985:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xded84aa0  ! 985: LDXA_R	ldxa	[%r1, %r0] 0x55, %r15
ld_local_indet_sync_ffffffff_986:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd0d84aa0  ! 986: LDXA_R	ldxa	[%r1, %r0] 0x55, %r8
ld_local_deter_sync_ffffffff_987:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 987: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
ld_local_indet_sync_ffffffff_988:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x55) 
	.word 0xd8d84aa0  ! 988: LDXA_R	ldxa	[%r1, %r0] 0x55, %r12
ld_fast_deter_sync_ffffffff_989:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x21) 
	.word 0xd4d84420  ! 989: LDXA_R	ldxa	[%r1, %r0] 0x21, %r10
ld_fast_deter_sync_ffffffff_990:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x45) 
	.word 0xd0d848a0  ! 990: LDXA_R	ldxa	[%r1, %r0] 0x45, %r8
ld_fast_indet_sync_ffffffff_991:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 991: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
ld_local_indet_sync_ffffffff_992:
	nop
	mov 0x400, %r1 	! (VA for ASI 0x55) 
	.word 0xd6d84aa0  ! 992: LDXA_R	ldxa	[%r1, %r0] 0x55, %r11
ld_fast_deter_sync_ffffffff_993:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xd8d844a0  ! 993: LDXA_R	ldxa	[%r1, %r0] 0x25, %r12
st_fast_deter_nonsync_ffffffff_994:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x20) 
	.word 0xeaf04400  ! 994: STXA_R	stxa	%r21, [%r1 + %r0] 0x20
ld_fast_indet_sync_ffffffff_995:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd6d84b20  ! 995: LDXA_R	ldxa	[%r1, %r0] 0x59, %r11
ld_local_deter_sync_ffffffff_996:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x42) 
	.word 0xd6d84840  ! 996: LDXA_R	ldxa	[%r1, %r0] 0x42, %r11
ld_fast_indet_sync_ffffffff_997:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x59) 
	.word 0xd2d84b20  ! 997: LDXA_R	ldxa	[%r1, %r0] 0x59, %r9
st_fast_deter_nonsync_ffffffff_998:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xe8f049e0  ! 998: STXA_R	stxa	%r20, [%r1 + %r0] 0x4f
ld_local_deter_sync_ffffffff_999:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x63) 
	.word 0xd8d84c60  ! 999: LDXA_R	ldxa	[%r1, %r0] 0x63, %r12
st_fast_deter_nonsync_ffffffff_1000:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x4f) 
	.word 0xeef049e0  ! 1000: STXA_R	stxa	%r23, [%r1 + %r0] 0x4f
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop
# include "err_handlers.s"

main_data_start:
.xword 0x3c58a8893047fe9a
.xword 0x98754e49b6990ab9
.xword 0x16223eb0692b2727
.xword 0x3e26d6c8a2502758
.xword 0x80bd8f140a99bcb3
.xword 0x9ea08a558ef4c2ee
.xword 0x5a6fea09fd7dc437
.xword 0xb1419f18f2aeb9ab
.xword 0x0bd423ce37d8e4d2
.xword 0xead239ccf1761141
.xword 0x5ed48153a29ef98d
.xword 0x752f134a1c3e237e
.xword 0x5d49147f5d6cbe32
.xword 0xf0b175b17184be58
.xword 0x9a8c4ea48fe17929
.xword 0x3c2bcbd47dfb7835
.xword 0x798f70427074f971
.xword 0x37d10bf3164372a3
.xword 0x690753b31ecce613
.xword 0xe80bc4a895f870f4
.xword 0xe5e2abab3be5ce74
.xword 0x92e6dc46fe421ae1
.xword 0x2f84e1d55ca6671d
.xword 0xfac7dbecdb9926bb
.xword 0x6fcb9f6f78fddbe5
.xword 0x6f5be5b0051ce89e
.xword 0xd87e1b6cc547f5a9
.xword 0xc471fa154c531d43
.xword 0x69bb904da746e6da
.xword 0x37b7deaadcc51979
.xword 0x3616aae33ca9e74a
.xword 0xa320bb4f82791f55
.xword 0xc192cdd57b23cefe
.xword 0x9d507f2258801217
.xword 0x9eddb059f5202ad2
.xword 0x47dc14db5ffcc369
.xword 0x0cacf49d0a5e3163
.xword 0x84426f002b626f8d
.xword 0x6532f9bd926f5144
.xword 0x5b4435bceddf6cf8
.xword 0xbe69b5e6e4b07d46
.xword 0x895f9826e337368a
.xword 0xa00308dc2c5f2174
.xword 0x01354182b3984fd8
.xword 0x6784dcb96b340b81
.xword 0x3dace4f8242a7425
.xword 0xb8bdb57d12d8fb00
.xword 0xdf0897faa1e605a2
.xword 0x4019082a708d76c5
.xword 0x6941d6958b2e2557
.xword 0xafd73bf14fd7e464
.xword 0x952ce18157e71d53
.xword 0x2bd9cf365fdcb3a1
.xword 0x54e2aa4bc47d7a8d
.xword 0x010a09c02a79c9a0
.xword 0xb341d4cf799128d6
.xword 0xb6b254081fe124c2
.xword 0x1cee6bfd3d1deae3
.xword 0x1b624087303e1691
.xword 0x5182fb802847e257
.xword 0x1a1f6dbdc74171be
.xword 0x14936341c8cb59cf
.xword 0x1cddef90a4b5bfc4
.xword 0xecdf9c390a31737d
.xword 0x28469d3a91a21020
.xword 0xcfe3827ca4160ecd
.xword 0x44ac9a4768ddb66f
.xword 0x7f886551312c3406
.xword 0xac6e1d32c4563259
.xword 0xdade0d5610002430
.xword 0xc759146f4c01bfe2
.xword 0x80fa9188e3023322
.xword 0xfe30216c59330424
.xword 0xfa0ed5e9b9aabcb0
.xword 0x02da5ecd8f7ecceb
.xword 0xc6738eec41913c42
.xword 0xa4a261c8e1bb6055
.xword 0x89748d1aeacba4aa
.xword 0xc0abe9438b6654a0
.xword 0x4d7d40ac14af9853
.xword 0xb74da3e0aa1bfd56
.xword 0x6729f917e83bd364
.xword 0x95aaa1a93099d743
.xword 0x772aad347c2cb445
.xword 0xe206dbf602325483
.xword 0xc6d971a66d56516f
.xword 0xa3eae71332b5b42b
.xword 0xc689d480b9bef3c4
.xword 0xb20996d43685cbf0
.xword 0x90a1fbd58799446e
.xword 0xa8da7ba5d2ed14d9
.xword 0x88ead658b7fb5d0d
.xword 0x7cfd086aac7db48c
.xword 0xb62ffd4fb0bff72d
.xword 0x966380c2e0a0e2de
.xword 0x235b10e0e87c5785



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
.global MEM_DATA0_START
MEM_DATA0_START:
.xword 0x1a4c40bff74d1eb7

.xword 0x209fe3a647ea32e6

.xword 0x4ebb64b1db3a0806

.xword 0xc3d01f629697aad2

.xword 0xec260ea85616ce1d

.xword 0x3ca1300f846b55ae

.xword 0x61bd2d7d09f85163

.xword 0x9ec5a6862000990d

.xword 0x21ef0fe4d55b8a19

.xword 0xbbcebc52b6f81cd0

.xword 0x1386e8a10782609d

.xword 0x609c9b5f93a2a4fb

.xword 0x9e895866878c57f7

.xword 0x10ff1625aa5cbf52

.xword 0x18dc8df54251ebeb

.xword 0x63891cb95bef9689

.xword 0x45195770a689a894

.xword 0xdc04160b352aacf5

.xword 0x68672c113a71a6a0

.xword 0x7e372abc2ca51a70

.xword 0xca4c4656c031385e

.xword 0xed0ac430c54ee8bd

.xword 0xf2778b30fb8e0487

.xword 0x10d766287461cd69

.xword 0x7aa9604a83dde5a5

.xword 0x6d65a21d5e8e2943

.xword 0x148e2a7dd2dbf423

.xword 0x43a51ba76d5fcbd4

.xword 0xc0fe47bf4fbcc799

.xword 0x1c5e2911ba8e0fc0

.xword 0x8d5ab177a7505ee4

.xword 0xb7dbadd019d0c3e4




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA1_START
MEM_DATA1_START:
.xword 0x95505cf9f6361996
.xword 0xfacfdceda47ed1f8
.xword 0x5e7e0c78a6ae7b23
.xword 0x48b5632e6be6d4db
.xword 0xee687eb5b91ab059
.xword 0xe5800a9a928e4531
.xword 0x5a3e192c9af3b93b
.xword 0x506b5f7eb4e72174
.xword 0x16ee323f1fcf2b8b




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
.global MEM_DATA2_START
MEM_DATA2_START:
.xword 0xe912de797e8accb6
.xword 0x8227a8df4b8cde00
.xword 0xde2bf0c3e40ec55a
.xword 0x58333be2121e9877
.xword 0x8ace3dfabee57f05
.xword 0x9bd27cf87efd7d7e
.xword 0x7aeab09c529b83bc
.xword 0xe6db248c35e632d7
.xword 0x1f434d878fc916d4




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
.global MEM_DATA3_START
MEM_DATA3_START:
.xword 0xb3f042807e981824
.xword 0x48a490ffb5318b92
.xword 0xee555c40e9575dd4
.xword 0x57d04112b5d3eb7d
.xword 0x65cdcc9dce655636
.xword 0x4a4a0af6ea9f1e8e
.xword 0x06886ff9c9a085c7
.xword 0xdb00c68d134f29c8
.xword 0x7b72a9f5d65c99c3




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
.xword 0xf797206299801a3e
.xword 0xd6eddf36d1fdc42d
.xword 0xc6875eef235399f1
.xword 0xd7e5e8f1b14af90a
.xword 0x835b0c7a2da9e9ca
.xword 0xf9145d0119a2f88d
.xword 0xe673c63b314560a5
.xword 0xb44c5397b9f02ca0
.xword 0xf5fdc9c97bc6b3e3




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA5_START
MEM_DATA5_START:
.xword 0xf932d2ee71099718
.xword 0x29a22c9175fecadb
.xword 0x81d99e0a22d69b0f
.xword 0xaf6bc161b90ad871
.xword 0xa0f989c60618794e
.xword 0x277f83c20455080c
.xword 0xf41caa257641a6e2
.xword 0xeddab5026768b12b
.xword 0xa8435cf27f13035f




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
.global MEM_DATA6_START
MEM_DATA6_START:
.xword 0x1eae04005e7ca07b
.xword 0x1c22e1cd380b4701
.xword 0xae99720d6a8e1b8a
.xword 0xf6fbf1f038da3f9a
.xword 0x4eab1581ed246475
.xword 0x68748ca10442b75a
.xword 0x6671ed9326511c13
.xword 0xb8420a7ef894f280
.xword 0x9a03f7fc1fd5d6dc




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
	TTE_W	 = 0
}

.data
.global MEM_DATA7_START
MEM_DATA7_START:
.xword 0xea76787d74c3e8da
.xword 0xf1e9081f0183f2bf
.xword 0x0fa6b0e119197bbf
.xword 0x2b148a83c282f03a
.xword 0xee296c952d3ce36b
.xword 0xa4549b283b8fa130
.xword 0x6f57a2f471dfc38f
.xword 0x817efdfb11ee4fe7
.xword 0x3ba60c5792b36c5e




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
	TTE_W	 = 0
}

.data
.global MEM_DATA8_START
MEM_DATA8_START:
.xword 0xc13f309907c788b9
.xword 0xa7097ee5ad8094c4
.xword 0x866277e63731f94e
.xword 0x290a730c073f122f
.xword 0x0f56e5e3abd7588e
.xword 0x0a2899fc37876934
.xword 0x499b430bb41d38b4
.xword 0x9140f152d51a6448
.xword 0x7eb576205bf1faae




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA9_START
MEM_DATA9_START:
.xword 0x6734cdf2418ac326
.xword 0x870f63550b0b034b
.xword 0xe8ec1792bbdf62a5
.xword 0xbe5c70ed09f47f12
.xword 0x592bf330c555d0f1
.xword 0x331208a16f3c4943
.xword 0x608212cc4f933337
.xword 0x1553d865eb72c987
.xword 0xa5056d5c7877dce0




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
.global MEM_DATA10_START
MEM_DATA10_START:
.xword 0xb1a0dccb1d1d0013
.xword 0x32eec1f2d77ad8e9
.xword 0xe2a059ec5cac8691
.xword 0xd5a4fe17e87d3b8f
.xword 0x81766ea66c176282
.xword 0xc5a7291870e36ec6
.xword 0x82a554f1e194e401
.xword 0xec740d1ae34a2e47
.xword 0xe0d6438c90eebf17




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
	TTE_W	 = 0
}

.data
.global MEM_DATA11_START
MEM_DATA11_START:
.xword 0xf1fc3b1d45cd9ce4
.xword 0x8dd823f39ce163b2
.xword 0x269a2db4cc451442
.xword 0x074030973366fbdb
.xword 0x5a6ed749e40340db
.xword 0xdcc85c2a213dd399
.xword 0x0ce114797abcf218
.xword 0x58f1dbc0dcc4ffe7
.xword 0x088fd0af7fdda0db




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA12_START
MEM_DATA12_START:
.xword 0xf3dc768b1c6f73d1
.xword 0x76986b9689c8ad14
.xword 0xa08a455f342e5475
.xword 0x95795a147a485860
.xword 0x6e71ca2d395a5b56
.xword 0x6555fb7b11852ccc
.xword 0x55997634865b12fd
.xword 0xdb1f2410da581eda
.xword 0x5af32b7d83424fe3




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
.global MEM_DATA13_START
MEM_DATA13_START:
.xword 0x1848c8ede882ebdc
.xword 0x9921998cb94cbfbe
.xword 0x7ca2a24e7bb47626
.xword 0x155ff47868c36a0a
.xword 0x362c14188a75083c
.xword 0xec8a42c5f6b0f831
.xword 0x5ae8dae89dde6b1f
.xword 0x018a7c807d99b460
.xword 0xa47026c6b1768abf




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA14_START
MEM_DATA14_START:
.xword 0xa52b5f565e313f3a
.xword 0x193f55e04e6af3aa
.xword 0x182f5c420bdbafcb
.xword 0x92b67e5663001d77
.xword 0x43285b166eaff5f3
.xword 0xf423c538e1c94965
.xword 0x9c9c40380899ef8f
.xword 0x8a13c7252c0a806e
.xword 0x9171add1f21c1b21




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
.xword 0xca0ff85b4a79f917
.xword 0xa03fb32f8736f561
.xword 0xb4cae9fa5668048a
.xword 0xf818c687bf06ab4b
.xword 0x8ab61b77cd9724b6
.xword 0x682ec5188744ed9b
.xword 0x9ed1a6409ecaafbc
.xword 0xca023c5bab7d1fea
.xword 0xaf1b917cc779963d




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA16_START
MEM_DATA16_START:
.xword 0x1067878276378db6
.xword 0xda8b9e5d3ae7c20b
.xword 0x61f9c6aa3e686538
.xword 0x05d074996a68894a
.xword 0x2fc57b9c4de7b2b1
.xword 0x6133a7f912fafa13
.xword 0xed44138e7b374558
.xword 0xd27963fa064ddd10
.xword 0xea86b8fd6eacf99b




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
.global MEM_DATA17_START
MEM_DATA17_START:
.xword 0xde5f4d346ad8b222
.xword 0xfc930991544269c5
.xword 0x0714b73d0e632b00
.xword 0x5c7d58e2f093fd28
.xword 0xcff91af0c0342ce7
.xword 0xab152f25a489897c
.xword 0xe25bd1705f71e65a
.xword 0x93035b2f025e0e2a
.xword 0xb78af1d4114b4c23




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_DATA18_START
MEM_DATA18_START:
.xword 0xa8002b026d7879e4
.xword 0x682c1acd7f5b0229
.xword 0x186e0e717cbac9b2
.xword 0x99641d19f2714185
.xword 0x937c8b9e678456dc
.xword 0x09bc56703db8d9a9
.xword 0x459143bba65324d4
.xword 0x0ce1fc57b1712c94
.xword 0x8df28da26a12f924




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
.global MEM_DATA19_START
MEM_DATA19_START:
.xword 0x86854b8f0a505c5a
.xword 0x5a0880a329f3110a
.xword 0x543637d733a608c8
.xword 0x5f5be20220c898f3
.xword 0x300bb48f61681549
.xword 0x04af2d86468b3625
.xword 0x0c77b223364ef6f2
.xword 0xae61297f7c6e1ea9
.xword 0x9a24812eedb8ec31




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA20_START
MEM_DATA20_START:
.xword 0x665ca5e3c90a59dd
.xword 0x366a33217360ff1f
.xword 0x63ac5719030787af
.xword 0x8a24a4dc02257f0f
.xword 0x7931a5a371d993fe
.xword 0x3df89de3055272d6
.xword 0x14c9dd8be3e6a94f
.xword 0xc76f584d55b562b9
.xword 0x5aeef9c0b9244319




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_DATA21_START
MEM_DATA21_START:
.xword 0x1b0827a323c91b9c
.xword 0x1ccba30382b546c6
.xword 0x79a97ae8811a8ec3
.xword 0x8ee4b005651aae19
.xword 0x884b88c035ac5e72
.xword 0x6bee1f686c8d3b3a
.xword 0x3767fda5b60496f5
.xword 0xdd71f6e6b5a65a04
.xword 0x12ae10001ec0d39d




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
.global MEM_DATA22_START
MEM_DATA22_START:
.xword 0xf000377629297527
.xword 0x640e005d20c415c8
.xword 0xf5159fb3178f2e63
.xword 0xc05f1bee0e8dc7d9
.xword 0x3b693b7331a1d014
.xword 0x4b752bf38152ba91
.xword 0x8f02a75809436c9a
.xword 0xf6c97de5062d5d2d
.xword 0x8d5c0d31352cb45e




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
.global MEM_DATA23_START
MEM_DATA23_START:
.xword 0xe4129968ef6d6aeb
.xword 0x788527f0bf69d6a5
.xword 0xbe0fc78f2824d568
.xword 0x0fe9032c145bbee5
.xword 0x091ed98dcb60e9c7
.xword 0x9ad6cfd1af1434dd
.xword 0xa8cb4c998524419d
.xword 0x3d0636f3ecf06c56
.xword 0x0abcb7add6ed823e




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
.xword 0x79a8d4e8d38a516a
.xword 0x95924eee1de9d0b8
.xword 0xef996b60ec1a06f8
.xword 0x6a1961686e61bc5c
.xword 0x8536dee7ee34ac9c
.xword 0xa0958e58176696df
.xword 0xa45cc2b5c788c794
.xword 0x00da1de5bff8a023
.xword 0x7090dfc383111488




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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_DATA25_START
MEM_DATA25_START:
.xword 0x8a93563568a61572
.xword 0xf2cf4bac1ed2b4ac
.xword 0xd546422ab09408e2
.xword 0x4f05bb9d967f9fc8
.xword 0xbf41f53ce4d62eb3
.xword 0x5d15eeced40b2190
.xword 0x58ba4adf978d6222
.xword 0x7a3a508fb0c16b35
.xword 0xcda38c9cc19c687d




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
.global MEM_DATA26_START
MEM_DATA26_START:
.xword 0xe7bb9fea49def5bd
.xword 0xa8d26dbadf29f2b1
.xword 0xb104115a4c6bf2d5
.xword 0xa6c747095570d748
.xword 0x3239ad7051d0d689
.xword 0x1887358091475d27
.xword 0x7ff2a67d44c0f0ef
.xword 0xafe044f6691c6211
.xword 0x296a626381826cb1




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
.global MEM_DATA27_START
MEM_DATA27_START:
.xword 0xc2b1a541cb978a12
.xword 0x144bd6b482743e3f
.xword 0x206c3133b5be1af3
.xword 0xcb0270b2da2d2ffb
.xword 0x87d694def28712b0
.xword 0xcdb82401cd8f9989
.xword 0x447ba6442f9f0769
.xword 0xd2d2fa466da8b9ee
.xword 0xb2ad15d60dbe0569




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
.global MEM_DATA28_START
MEM_DATA28_START:
.xword 0xc18605ef553d929d
.xword 0xd83b890b39e1d45b
.xword 0xb5182e26d0b3e24c
.xword 0x9e0fd58160e631a0
.xword 0x73fcf5f044d63626
.xword 0xf046d3b22b9a144b
.xword 0xccac81c06a4aa081
.xword 0xce6bcd25b4e2d9de
.xword 0x8563e6e8105baaf5




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
	TTE_W	 = 0
}

.data
.global MEM_DATA29_START
MEM_DATA29_START:
.xword 0x10a2286e8b3bf263
.xword 0x6bc1a9b494e58a70
.xword 0xfe7a8c0bab55310c
.xword 0x526cc456dfbf979a
.xword 0x101d66bf6b43cd95
.xword 0x39afdfd78267fb81
.xword 0x6e442bf8cd125e99
.xword 0x6ac4b3a4c7f25c5a
.xword 0xb56ac41850aff5fd




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
.xword 0x8747811c7b377d94
.xword 0xbda51668a467d4dd
.xword 0xf0b2a7eec95e66ee
.xword 0x4cedf0e3a22bc4da
.xword 0xf53bd3a7e9d803f2
.xword 0x54f6a09f459b56b0
.xword 0x40196de616f46d3f
.xword 0xf17bbe91403d058b
.xword 0xf666746290cfdfdc




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
.xword 0xc1e53245a7b9f960
.xword 0x3302f6ae35819d64
.xword 0x69fe700b3ce19efd
.xword 0x9a6b90076cec79fa
.xword 0x29dd7ffe35c04c95
.xword 0xe8464693d0fad1ae
.xword 0x705a645df1698f8f
.xword 0xfb314326e6085b09
.xword 0xd03c8617c2ab347c






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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x6423c57c0c96d512
.xword 0x13080f625fad445d
.xword 0x64e1508967bbc3ac
.xword 0x0c7cc337fff0f5d6
.xword 0x16946c609cd0512b
.xword 0x61d6c48d4e18d67a
.xword 0x403e22db5186b645
.xword 0xda8636b214c2adf7



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

.xword 0xb815e21f4794f7de
.xword 0x81d05c4ed178396c
.xword 0x140130140d072df2
.xword 0x223b1b54788537be
.xword 0x9296781ea7b26818
.xword 0x9666d5c44eba0f9d
.xword 0xb384d4a23344dba3
.xword 0xe320d1b38904f802



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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd1a938bcf2e2782e
.xword 0x99aafcbd9392aae2
.xword 0xf01f04cb2becc7d1
.xword 0x576d9f55e4a7af2e
.xword 0x4a052a31f8dc92cb
.xword 0xc7cdfa92da8b37a2
.xword 0x1e7c4dac9264e153
.xword 0x11f8af4a149b8e25



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

.xword 0xef59cc99334c302a
.xword 0x957cd476f8f09b88
.xword 0x4e8818b06bf5be79
.xword 0xc53743cfca1ebabf
.xword 0xc455a14ac713f881
.xword 0xc3f03fc176189301
.xword 0xc0d410ce08962029
.xword 0x00f7f07c2d0a9fd5



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

.xword 0x41deb1237214f3f4
.xword 0x6b2c23d633f53500
.xword 0xd175f7098efff6f9
.xword 0xd7def3164ac97193
.xword 0x68b6a1a7c56cfd5e
.xword 0x78232204780a8f19
.xword 0x1ea3b75c36efc2fd
.xword 0x57d557a86139bce3



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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xd657c0a66ba6410d
.xword 0x33ff7317fdf600c9
.xword 0xeb099df6c1266044
.xword 0x6c20c0a213ecabd2
.xword 0xa5b2aad73ba16348
.xword 0xe02fcb595463b148
.xword 0x55c4ee7031edb516
.xword 0xdae25d15bb719b44



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

.xword 0xc26779de06a069bc
.xword 0xfa90ca0084bc44e1
.xword 0xb3ecd2373bbdd3cd
.xword 0x2e4a10e921a6abf0
.xword 0xb0bdcbab77da763e
.xword 0xe9c402ec3f36a278
.xword 0x96fedec1fc6dc04f
.xword 0x1f664a43c68e124c



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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xbc2afcc66716c630
.xword 0x8e1729fce06b2ea9
.xword 0x62023bd8d97c4f31
.xword 0xb49bd65b1961e3b3
.xword 0x4c0fee0aef8d3a1f
.xword 0x3f6511ae11e6623b
.xword 0x2cba349bcf07a1d3
.xword 0x939ee89bab30d242



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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x924b68f6d8d60d1a
.xword 0xe3e160df47e6722d
.xword 0x0551d9ab4c190daf
.xword 0x79f04ec3fc4c219a
.xword 0xe3a0daa2f3d6c737
.xword 0x23dc87ab3badebcb
.xword 0x67ad51d9895ceb7c
.xword 0x43c98a8de385b5ec



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
	TTE_W	 = 0
}

.xword 0x29b0ab6dbe04ae17
.xword 0xe37468283b678128
.xword 0x15e0f21c66290e53
.xword 0xf348f20dd91e8a47
.xword 0x5ea14eacce0d4a39
.xword 0xeb94c8c814c59e6c
.xword 0xa73a28170b0cfa7f
.xword 0x343c64d72aa1c577



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

.xword 0x11aa08dcd29a684a
.xword 0x100017d35f649344
.xword 0x71f6b1a57f5ba148
.xword 0x4dc7ea0301ed83d2
.xword 0xd81d96300cbdef14
.xword 0xd3b9dfdd7904d619
.xword 0x84ba8c280da197f2
.xword 0x7568fe06a090a635



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
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xc4f19c29cbe084f6
.xword 0x1cfc4829580f4108
.xword 0x46fc99a55f642e48
.xword 0xddd1cd1a2c271ece
.xword 0xe88f9a9712c9f40e
.xword 0x53d849ea5a738c59
.xword 0x6a77184b09a2e7cc
.xword 0x27e2e77510cb1c1b



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xfd8772586d98eb16
.xword 0xb54a26c546e27c4f
.xword 0x4d6d634eb30db891
.xword 0xd4b07b8d0a371be8
.xword 0x3bac134d7cbe9762
.xword 0x2833c8149c4a9f12
.xword 0xdaeb9c5994a3cb2e
.xword 0x6de25146a2d5b870



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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x8b4da946b42cc389
.xword 0xd0f4353fd0831ee5
.xword 0x496fa5fc705653b8
.xword 0xfb49b42f748fa8eb
.xword 0x2809eda95d3e98f0
.xword 0xfea59f4b839ca923
.xword 0xced9136171fc2275
.xword 0xe3dce49d39c62d98



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

.xword 0x5f2b44c839bec688
.xword 0xc06ca2ac574bbbc6
.xword 0x57f15cd9e1df29a7
.xword 0xdb14ca226f102f0e
.xword 0x0faac87aef746a04
.xword 0xb601a1aff3b290bc
.xword 0xf68cce3128f7cb62
.xword 0x393695790e386bc0



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xc61eb387c174f553
.xword 0xc30b9d4ba8574dd6
.xword 0x99099161791fa8ef
.xword 0xd9daa7f75dd88212
.xword 0xeb20853935d0daf6
.xword 0x2621e47c1874bf87
.xword 0xd6240b2427993cc4
.xword 0x5ed67a8527a46a9d



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

.xword 0x1bfd26a056b9d710
.xword 0xaddea4f2b5841109
.xword 0x696a7a9a374e3c79
.xword 0xcd3d22b88fd7e581
.xword 0x4366d77ba9fccbd2
.xword 0x30e588444ab29e6d
.xword 0x7790b09b7b21dfb7
.xword 0xc323a036ad215c5d



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
	TTE_W	 = 0
}

.xword 0x9af0be08c7039ba7
.xword 0x75f33f293202ad5b
.xword 0xf4c3aa333a34175c
.xword 0x671a3e7e17fd6f97
.xword 0xc10213c4cf8d28a3
.xword 0x87522c1a6e8a0eb3
.xword 0xc7972258d89d74f8
.xword 0x2bb9a5e9ce9d8d48



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

.xword 0x3c82c6ecc21c655b
.xword 0x07df08774c0e6ad0
.xword 0xbb9a4dfd57a6c89e
.xword 0xcc6654696a836616
.xword 0xd2f5ad4b7c031910
.xword 0xaed8ac0e5783fc2c
.xword 0xfd4d383c7561db4f
.xword 0x0ad337fd3c64633e



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x7ebc04ae44344f09
.xword 0x86b5aa20d4ca143c
.xword 0x65eabc10a30e3f57
.xword 0x2cbbe5e5f2bf8f71
.xword 0xafe793941a7d7689
.xword 0x0a8adb3bdc717ef7
.xword 0x4020a1cfdcd069cf
.xword 0xd2f83a8fc5a1dce0



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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x27ace17157cf82e2
.xword 0x0936da50172265d2
.xword 0x1fbbedf702117c90
.xword 0xeaf7ab3607baf65b
.xword 0xa475af39c6d73a6f
.xword 0xb3fcf27604a61c01
.xword 0x47574862212d5955
.xword 0xc5cb2380132df6ce



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

.xword 0xecc8f73d1068a83d
.xword 0xc6bf6cd4fc88b7cf
.xword 0xbc4b049e6689efaa
.xword 0xc7aafe57085c1dec
.xword 0xf45f925a5df9c4e3
.xword 0xc72911a6a0b00604
.xword 0xb2fe8ea5d244548a
.xword 0x00d9f7f85508072a



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x71bb2e9c4c5d56d2
.xword 0xb624d04b89603768
.xword 0x9f55d06030d07230
.xword 0xe453e9942f3bf446
.xword 0xf20cee28eb9f5823
.xword 0xf9904cd446917e78
.xword 0xf6527e768aab7fcc
.xword 0x405d9184f80c409a



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

.xword 0x863282c24bc7a96a
.xword 0x00592195434bc9b0
.xword 0x9366b52223868e8b
.xword 0xf8f988f48a3f3aba
.xword 0xb8ab428e50ed7091
.xword 0x125311734c013350
.xword 0xc0694efa29765a53
.xword 0x3aefa29e4e718872



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

.xword 0x7421278e429f57c6
.xword 0x2e441d88bed37718
.xword 0x7351d308b3659ae0
.xword 0xad7aed7c320a5747
.xword 0x4cf426c88a07d1bf
.xword 0x7d83d0543c57dc79
.xword 0xede3d66ae3824d6a
.xword 0x27b91800f3bcf4ca



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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x052376fdacf17dc7
.xword 0xa6cd499466aefd72
.xword 0x6232bd772b3a0c11
.xword 0xe50d6ebbe6c982aa
.xword 0x12023835e8d1726c
.xword 0x46089c305fef0bd7
.xword 0xe3f5a0fad94f55f9
.xword 0xbf6059dea8d95eb8



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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x86c5538eb5eed75e
.xword 0xfe96a276c87fc867
.xword 0xab91c3737cb27e6a
.xword 0x10a31ea82f354c69
.xword 0x802694a1ff91d68d
.xword 0x40947b4911af97bd
.xword 0x5956579666605e3f
.xword 0x1c5728de765d2d9f



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

.xword 0x0ebc927b6d6cc5b2
.xword 0xf1706354d4c4bb32
.xword 0x7c671316fe0199a1
.xword 0xb32f9662c321bba7
.xword 0x83f7fd923fcf137e
.xword 0xae8570ab6bea86de
.xword 0x9fe718fe21d042b6
.xword 0x706b3d4dc65fcdbc



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
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
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

.xword 0x539f153cb1451071
.xword 0xe13e424945509bb0
.xword 0x41edf87907ce404c
.xword 0x37595e7b089567b0
.xword 0xc5dad145431fdf1e
.xword 0x9f07c64f0e0d87ea
.xword 0xd27c316e6c4a1fdb
.xword 0x5b00005f2e8a6a10



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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x46f563979816daad
.xword 0xcc144534f6df76d1
.xword 0x6033b5b569c93bbc
.xword 0x5d9767b8f5f49c72
.xword 0xcde5318af976263c
.xword 0x41fae3aec4d71159
.xword 0x4ed37fa6b6a99a45
.xword 0x87f299c238c4128e



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

.xword 0x8bf322de1391027c
.xword 0x7e7bc30804e8246e
.xword 0xf53c023bc192bc3a
.xword 0xda411d45fb6eee5d
.xword 0xca620cb4552a1062
.xword 0xddee4692e51a3e78
.xword 0x530554ea6d257209
.xword 0x61c1dc9da7dc6e23



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
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
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

.xword 0x8081a74fbfcc2d39
.xword 0xca6bbb213eaa6d83
.xword 0x5ac9aaa6c3fef4b2
.xword 0xdb5bce2350b2f548
.xword 0x3ea794bc69e69fac
.xword 0x0f6a058b2c95ed5f
.xword 0x258207dbcebed594
.xword 0x5f9756a1cf5df2c9





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
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA0_START
MEM_SEC_DATA0_START:
.xword 0x04d6a05e768978d8
.xword 0x98c859f1330a2e3c
.xword 0xead0c2b116a5d0c2
.xword 0xcda0185f793156bf
.xword 0x9f770327a206d64b
.xword 0xcec4ff8822b5be05
.xword 0x61987e1d6cf174fb
.xword 0x4b81e50a18f52ad3
.xword 0x5017f203b2f2209b
.xword 0xf6f97a8df46b6dd8
.xword 0x0cf6f2d3cbf9dcbf
.xword 0x67930e4997bf507a
.xword 0x6fe67da04312f459
.xword 0x34f978628156cc44
.xword 0x182d05c3a273c77a
.xword 0x23fc554803c0171a
.xword 0xd196f41116b00d40
.xword 0x4ad68d0392acd355
.xword 0xcc9baa0aed812b6d
.xword 0x35f4cbefaf1e04ae
.xword 0x897ee9f7ac81cf62
.xword 0xef722566ccac6fa1
.xword 0xfc8f4b2197acdfc8
.xword 0x1234dcd4f665513b
.xword 0x3e7ff4260cc46ba9
.xword 0x370875d59ff191f0
.xword 0x4af3c669b325e3bc
.xword 0xff401d3d19965bd4
.xword 0xc38e12ff1d76d606
.xword 0x7fadb63c8b467999
.xword 0x4573df02535607ae
.xword 0xb8f037922e678263
.xword 0x094f84d4cc68948d
.xword 0x9831dffef48126d7
.xword 0x1f9029dadea8a316
.xword 0x565b7e839eb8dffe
.xword 0xb81f05318ff216b6
.xword 0xdec820037feaa943
.xword 0x7f8f3323972025c1
.xword 0x1d915766c7a5d70c




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
.global MEM_SEC_DATA1_START
MEM_SEC_DATA1_START:
.xword 0xd1846d77132c453d
.xword 0x771f17d36ae16335
.xword 0xe80e097450471168
.xword 0x3c91e242919bfe16
.xword 0xb3ea1c1adc64826e
.xword 0x6b07fd1220a3d972
.xword 0x0f575cd7b38427df
.xword 0x62bcb7cbfdfe08dc
.xword 0x7c9887ae688ae262
.xword 0xb366af80d52fd68b
.xword 0xc64743111655a308
.xword 0xa69b1c9fc91fd32b
.xword 0x0f06e75396d614eb
.xword 0xf5fb52a8d49f8fa4
.xword 0x4d67bd1d5a2dbd29
.xword 0x95025ef0ec9ab485
.xword 0x29d10c76123ebb97




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
.global MEM_SEC_DATA2_START
MEM_SEC_DATA2_START:
.xword 0x37851a37e693a167
.xword 0x199e4fc6dc9bbbc6
.xword 0x71b37dbf753c425b
.xword 0x76d36c049f64699c
.xword 0xe1e00aba26b942a7
.xword 0x6609cbb7f6223a03
.xword 0x0e054e542207a07c
.xword 0x08de3bdd38c66ed5
.xword 0x16de2dd37f2b1676
.xword 0x65204b68d7e3c109
.xword 0xac09bc84fa685b8e
.xword 0xa9330d9bf931c5d2
.xword 0x4cb8d40fc57af18e
.xword 0x1d4f8980df8285b2
.xword 0x42484edb32945a03
.xword 0xf461e2db95587cf2
.xword 0x363811504300fc42




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
.global MEM_SEC_DATA3_START
MEM_SEC_DATA3_START:
.xword 0xffb757ef3ff8d1a9
.xword 0xfa9dba17581c6a0d
.xword 0xe7ffe692ef045c57
.xword 0x089e03e54cd2267c
.xword 0xea9a5a1b3634ca7f
.xword 0xa11d31da07ca6ac6
.xword 0x8597e6896097f71c
.xword 0x35a2c023255fbfe9
.xword 0xb3c61fde48c1607e
.xword 0x7e19a7dc35e83ef6
.xword 0xead2bd20c3f4269a
.xword 0xd577895b2dd37cf0
.xword 0x7663e25fe977072f
.xword 0x7f86359960941654
.xword 0xc1b5a7b28e582c82
.xword 0x30333c14406c6478
.xword 0x2aad2a69125df218




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
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA4_START
MEM_SEC_DATA4_START:
.xword 0xc03ad67bf760fe67
.xword 0x5bb3ac314282b63c
.xword 0xebfac27b18368299
.xword 0xa92450b1a96a818b
.xword 0x6892a58e3d047b37
.xword 0x427866cbd2093395
.xword 0x436f8bf03cdf03e3
.xword 0xb7b2828be4476d07
.xword 0xceb7ce392f779fc0
.xword 0x987fd800e58bab11
.xword 0x06870030074e00cb
.xword 0xe98d52427de25bd0
.xword 0xac3c47da7d739748
.xword 0xf45c39234be560a7
.xword 0x09ef291d2f60b938
.xword 0x931ab9634e7267ee
.xword 0x1457ed329ae776df




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
.global MEM_SEC_DATA5_START
MEM_SEC_DATA5_START:
.xword 0xad0cad3f205d114e
.xword 0xce6b2354f6aea709
.xword 0x5b54967c6db3d45d
.xword 0x833e16ca05d7c97c
.xword 0xe7200b2b445b7477
.xword 0x308a3e9e40688d4e
.xword 0x769bae14e9eabedd
.xword 0xfb595484822be02d
.xword 0x2692db3fb9864f48
.xword 0x3bc99db1bfc8cfd0
.xword 0xcdb2b1449c19aada
.xword 0xa2443adb2449be17
.xword 0x6bad3de31f19da04
.xword 0xe52cd03536271694
.xword 0xa3ea7e3c4f0df572
.xword 0x57099ae6765075ae
.xword 0x28f51eb58c630064




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA6_START
MEM_SEC_DATA6_START:
.xword 0xe7301e4cbaf4766f
.xword 0xbb28a51d38bdf440
.xword 0x18a8cd925741a0d2
.xword 0x89e927962c746464
.xword 0xf4f01311199ab6f8
.xword 0xe83434cf93ee3c72
.xword 0xdf47cecc1497863c
.xword 0xa23fb317895197e9
.xword 0x3e2a1c1e6f2905c8
.xword 0x65e7b298100cd74f
.xword 0x5c8bf870eb0fc4c8
.xword 0x7ea8c5ca9046a72a
.xword 0xc30aa482dc343057
.xword 0xadfaa2b059a77b26
.xword 0x25581e30e5651671
.xword 0x40fc123b7ca8d25c
.xword 0x5500b8242c6134a0




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
.xword 0xed6e13ec4bea18ec
.xword 0x28fb2d1701c5e4e5
.xword 0x76670cc402643cb7
.xword 0xdc6c25b76f08a06b
.xword 0x1e0bce13bd7ec786
.xword 0x48ea59f22c4f992b
.xword 0xf8646459638c7350
.xword 0x13d174d96e9c1a92
.xword 0x5d283e8d25954cdf
.xword 0x2d2244e899aa8747
.xword 0x03aa71ed5a0db8eb
.xword 0x7931c73517064279
.xword 0xc884513395a37f93
.xword 0x745ec4d9bc3cf93c
.xword 0x3b3d1e79950e1217
.xword 0x242e9ad0f0cf81be
.xword 0xbbba62958db0cb0b






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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x999121011d028cdf
.xword 0xcbbcc23318698296
.xword 0x53f264e75703864c
.xword 0xf3afbc63e572d1cd
.xword 0x6afe346a8eef6d10
.xword 0xf757504025aa01ae
.xword 0xf3c36d5acfcae9e4
.xword 0xb835ab9b0ea5ebb3




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
	TTE_W	 = 1
}

.xword 0x08e7dfcb04db1dff
.xword 0x43e206da05c53924
.xword 0x0fb08d6ee01a6a2c
.xword 0x715cce1851c03df5
.xword 0x9378f901332fe016
.xword 0x75b629bc9936b9ff
.xword 0x9698231d674aff01
.xword 0xd0447f7ea4e0d936




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

.xword 0x21a4fb3ff77b6f79
.xword 0xd1fef9c2a274b32e
.xword 0xa4142ca0085017a8
.xword 0x5a3500542de35117
.xword 0xf7654a0e56a883d7
.xword 0x44a8260f28c3ac8f
.xword 0x8e6d29def131940b
.xword 0xb75bb83c5de4bc5d




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

.xword 0x9e80df8534b7c172
.xword 0x99fcd78b96e5b488
.xword 0x473b1165129d9a7f
.xword 0xe5a7c3a4234f0bed
.xword 0xb1f46012fbbfeb14
.xword 0x444650d2553ab1aa
.xword 0x1a72656dbe43d72b
.xword 0x05c88b240909c64b




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

.xword 0xfe204bec021ba022
.xword 0xa2c942a4b5ea5372
.xword 0xbe336b0c8421ee68
.xword 0x42cbef7cfcde102c
.xword 0x38755b7460e592ae
.xword 0x0c8d7584a7e741ee
.xword 0x62689b50582a1ec6
.xword 0x48762bf8fd876d27




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

.xword 0x5e639e30263320ed
.xword 0xa5bf9fb8dd5abe27
.xword 0x3b3fdebc9e211e75
.xword 0x634e2b13e13acd69
.xword 0xab357a633680d9fb
.xword 0xf7517f242768ce83
.xword 0xcd7ef85af8eaada2
.xword 0x10cdc9019d05a20d




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

.xword 0x06de26ce3f3997e6
.xword 0x8ed45298378c9c3d
.xword 0x8484d4882e5c1d43
.xword 0x0d3c7de3e911d5c9
.xword 0x20a9eea7e04f9286
.xword 0x4b8b84c26c062a95
.xword 0xedc36272d2b1a455
.xword 0x6a58a8865e566560




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

.xword 0x9706033accf315cf
.xword 0x571b6033331bcf09
.xword 0xa25d2ba9fc26a47c
.xword 0xe022e69fa3a30ca2
.xword 0x33635e7b7e4a602b
.xword 0x7744414e50ebc6fd
.xword 0xa009680a2759cd0d
.xword 0x51901d7ff28ff8c1






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

.xword 0x3a9c926f1f7ca375
.xword 0x26ee60f52ba0966f
.xword 0x9b8556eaa597bca1
.xword 0x2b723fcc756b2350
.xword 0xf7eba40327dbb279
.xword 0xe460fa1aa046a80b
.xword 0x738f9d89e3461560
.xword 0x4b2130e1a7531d39




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

.xword 0x1f3bcd4e98423acf
.xword 0x014229f29e497cfc
.xword 0x353103ce4bb6d7f4
.xword 0x88b11a2bb0cc8958
.xword 0x4ed714ba528b9941
.xword 0x3b4ca962a5dc7f23
.xword 0x68019c9ce090711f
.xword 0xb832ddfabca0fe9b




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
	TTE_W	 = 1
}

.xword 0x2ae850e011559cd3
.xword 0x83a88bb2c418bd0f
.xword 0xd2a53b25be8e1c0c
.xword 0x7a952e84f6b54cf2
.xword 0xb89a6a685db87860
.xword 0x0f961159da3f5840
.xword 0xb43ab10429a820cb
.xword 0xbaeac13abcd2abff




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
	TTE_W	 = 1
}

.xword 0x342c1add425bcf6b
.xword 0xea69ab17e401383f
.xword 0x680c3b0b4592036f
.xword 0x90c22ee361c09a20
.xword 0xdb0cff881a6b3621
.xword 0x8de659c405bc5820
.xword 0x9d9ca2524f76c4d7
.xword 0x78a5614e2574e91d




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

.xword 0x7c88bb4a1aa18131
.xword 0xed651ceb90e5af37
.xword 0x771974748783f071
.xword 0x82941c008fefd11d
.xword 0x6dc802b8c6cd5d30
.xword 0xc408416b96161d2f
.xword 0xfd50645fede961a7
.xword 0x27acc614d4de0aba




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

.xword 0x5ca46b3e76070cd1
.xword 0x9d3cd2115956003a
.xword 0xe1322d6ab1823c2d
.xword 0x09ea495675016415
.xword 0x8c3d3d0de8234682
.xword 0x7c183bf9c011a8a7
.xword 0xed073c11a5b2bc51
.xword 0x3d4c8e2890e03f00




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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xe7fb48bdd8a835fa
.xword 0xa04d01809adb80f5
.xword 0x5bc3a0419c307c72
.xword 0xa453bdb0d383dfc9
.xword 0x19e5105e7aeef4e9
.xword 0x3a81f3b37afdaafe
.xword 0x9f9338c21d82f4af
.xword 0x723073be162d838d




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

.xword 0xb3035164ef6ea406
.xword 0x50a6f0087a608667
.xword 0xb48051ab891d3448
.xword 0x93782536bc81391f
.xword 0xd4d98e296084146c
.xword 0x523bb60332029ee2
.xword 0xadf6297d0f6ac2ca
.xword 0x95547cbbfdb9cf75






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
	TTE_W	 = 1
}

.xword 0x2d2b1312f486662c
.xword 0xf28bd76a58e33b83
.xword 0xfd720137daa5e5cc
.xword 0x76950f79d299b90e
.xword 0xc5e9891ca83cfceb
.xword 0x006642c1e645a418
.xword 0xc12b14f62e691c79
.xword 0xb6efbe2d540b7d41




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
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
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

.xword 0x822595b3e24bc14a
.xword 0x24b396e95db92e8f
.xword 0xb5d53d9117a52421
.xword 0x44e6c3a1d0b54910
.xword 0x55b00fd17f2ccd20
.xword 0x0e5bd98c1255be6c
.xword 0x2f20807bb05b22aa
.xword 0xd919a0f39ea9212f




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

.xword 0x817a65cfd9c341e6
.xword 0x4e9869f0414b443f
.xword 0x2cf4ee43c861b3f3
.xword 0xb676e573532c5218
.xword 0x42450666e6f3cf9f
.xword 0x1f0f6ad41de72bb7
.xword 0x818610ca9350d7a1
.xword 0xf9ed8a7471df9361




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

.xword 0x04bf8107883fc0ae
.xword 0x980cf8e9cfc376cb
.xword 0x10e4385d81ad9c3b
.xword 0x1e70e30b21ac9f04
.xword 0x393f662a83eaa7c7
.xword 0xde152d2549dc078b
.xword 0xc306ddd22a5f8c14
.xword 0xde8dbea466631405




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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb7024dd2ea37c05a
.xword 0x012c72320b4d421d
.xword 0x4754635f008a14ae
.xword 0x69919ece5d9ab596
.xword 0x0a2be802b08fa96d
.xword 0x2c5fa4b680bd40cc
.xword 0xcd222ff15433aca8
.xword 0x1395f8d397548a8a




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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x58ca20a4c3acc5df
.xword 0xa5850d342907a00e
.xword 0xd64fc75050d85000
.xword 0xf40025f13a1ab3f1
.xword 0x0a374de8998bf1bc
.xword 0xe9c5f73d9458f9a0
.xword 0x979fe85a1ddd21ec
.xword 0x9e3a3fd0b96a186c




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x1a1622d8891a45cc
.xword 0x58454b3b54a52653
.xword 0xd862807398bfbb75
.xword 0x5219ce1b43f91ba2
.xword 0xfcb4df9f735a69e9
.xword 0xbba37ed9900a1b60
.xword 0xb1abfe5a9edc9db9
.xword 0xcd7668a765211b0b




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x6a59ebf4119e565b
.xword 0x1c75e7f71e3d4250
.xword 0x63949b674f88b961
.xword 0xa2eab82e96756fc3
.xword 0x6536796114cf5500
.xword 0xc054203c597f0326
.xword 0x700f696e6af69dc7
.xword 0x7a016b55f0074dc4






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
.global MEM_REAL_DATA0_START
MEM_REAL_DATA0_START:
.xword 0x23b96ef14e1e2612
.xword 0xb97a3862440eb74a
.xword 0x71abb2d9bea48bab
.xword 0x1989be361647f203
.xword 0xbd37c25a160dddde
.xword 0xfe7e5f5d4907341f
.xword 0x1d7528092352ace9
.xword 0xfe2e452fc761f566
.xword 0x6455881746b1775e
.xword 0x70061d488d7b768c
.xword 0xf0634ee798232102
.xword 0xd53e5c3b0c959325
.xword 0x6e0700948b1d1f12
.xword 0xb4dfebb43e64a490
.xword 0xe21455a7e29ce5ca
.xword 0xbecfcd32aff42399
.xword 0x8348f84b7fcf5b60
.xword 0x31ecd13656c13629
.xword 0x1bc7db8729c536bc
.xword 0x54a184d77bfff6d6
.xword 0xea425b73759c7417
.xword 0x29516a19c2b4c32d
.xword 0xfaf487f8909c6535
.xword 0x6b96c16f31bb9714
.xword 0x2c315fee86973994
.xword 0x8ca53dfaf2ca5cb9
.xword 0x2817f8c1385cfd89
.xword 0xf918e13331284bcb
.xword 0x2574db26034a2f1c
.xword 0x1bf4677f6df50f5e
.xword 0xbea4dcd4a43abc0b
.xword 0x154cde9c1418b0f6



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
.global MEM_REAL_DATA1_START
MEM_REAL_DATA1_START:
.xword 0xc0ff873fcca085b5
.xword 0xe2477dd66573fb9a
.xword 0x1a4784690e491561
.xword 0xcc5f7e9c3b11cb53
.xword 0x4ec0f697ecd444c9
.xword 0x399a329d26e635a8
.xword 0xc709c27e9582a353
.xword 0x632bdf2a1ede6e39
.xword 0x6d85e6302497f54e



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
.global MEM_REAL_DATA2_START
MEM_REAL_DATA2_START:
.xword 0xf2f8610204c28b46
.xword 0x6b02e083a79170b7
.xword 0x28c62cfde48f6a2b
.xword 0xf50657a1e6857f7d
.xword 0x6fc11a11888a4ab4
.xword 0x158f367347c35076
.xword 0xe209fdccf77010e5
.xword 0x32133107ea9a56db
.xword 0x162fabf492a3d47a



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
.xword 0x1b7e050bbb13505e
.xword 0xd97339a21a7ceb18
.xword 0xb9a791509d293795
.xword 0x6671cfd6db757d87
.xword 0xb31b34756eb3eea6
.xword 0xd7b9e280198fc1f4
.xword 0x39a3c5d501198443
.xword 0x98c21d9a0b2996e7
.xword 0x573f9041a6d1eb95



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
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA4_START
MEM_REAL_DATA4_START:
.xword 0xc101f36bfe5d05d5
.xword 0x6e85ac9bfd2599ce
.xword 0x94e0e1318f0b8d8a
.xword 0xd422eaab2d9c37ec
.xword 0x8bcebe2de3e4a0c6
.xword 0x7d13a714beeafe61
.xword 0x997a854a0b22ea09
.xword 0xcb57af5f878e73aa
.xword 0xa9c0d04de73bca2d



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
.global MEM_REAL_DATA5_START
MEM_REAL_DATA5_START:
.xword 0x46121965161d5231
.xword 0x6abadb654f72955a
.xword 0x6b6359f6e0a08de1
.xword 0x4db8de57870943ce
.xword 0xa18bf35342c93bb5
.xword 0x9c936d9950a932b9
.xword 0x90762c326e0c69f0
.xword 0xa284ad4b4feba4df
.xword 0x6368cc2d42b5e3e3



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
.global MEM_REAL_DATA6_START
MEM_REAL_DATA6_START:
.xword 0x95d576f82201516f
.xword 0x9416fe8a03a1aebc
.xword 0xd9ad147b805b8ae6
.xword 0x8e9446aeb0780a12
.xword 0xb6f449e61bd9b834
.xword 0x6a842ab81f922ab5
.xword 0xcd60b1a6e635f224
.xword 0xbd3041550e75d91a
.xword 0xc7177bd4952106b3



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
.global MEM_REAL_DATA7_START
MEM_REAL_DATA7_START:
.xword 0x21e47300d37b9aae
.xword 0x2604d9e6680945f9
.xword 0x04b1d5bcc96101b2
.xword 0x75f2b6bbe6f57095
.xword 0xac37cce6b4270933
.xword 0x220f30de3755bca6
.xword 0x278855742e61412f
.xword 0x022ba93eb95b410e
.xword 0xb25c6ebd432a7c94





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

.xword 0x127e05786947ade8
.xword 0xefa0fa69fbd8d6bd
.xword 0xe2184aa831898b4f
.xword 0x7b61b37535c5d2e0
.xword 0x9071ebd4dc988e09
.xword 0xa63d157691ecc521
.xword 0x2eff1306ba20f1d9
.xword 0x781ba3542d0e1382




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x1c75446421a34e16
.xword 0xdba5a4f690d3cf30
.xword 0x75736b1278a06bc3
.xword 0x670ab7e145abb80d
.xword 0x5ef069954d090929
.xword 0xde2cbe912d19461c
.xword 0xd813b16cc22bde9c
.xword 0x3135e255aed2639f




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

.xword 0x2894d7dcd5732e5b
.xword 0xbafa0c50e945295d
.xword 0x074df0230f383564
.xword 0x6bb998183b90e8ee
.xword 0x236a0a8b61084ed9
.xword 0x2bcd37f7d0b85813
.xword 0x335b5527784311d5
.xword 0x79a1a4e7876ade6c




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

.xword 0xa0979dee137766b6
.xword 0x8e00e632986ff3eb
.xword 0xffab453d1f882fa7
.xword 0x29f6481fee0e537e
.xword 0x81048b6a5c35f1ae
.xword 0x8a3554665034acb7
.xword 0x85e324a770656aa5
.xword 0xbb74a88ad0f30e96




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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x47cbe07567ffbe21
.xword 0xc5813dd8ebeb7a60
.xword 0x60ea3f8317e74313
.xword 0x2497a5a3ab65e3ae
.xword 0x859176b8fc7b275a
.xword 0x6e94027999f1b2a2
.xword 0x50f2e5dd24c28c34
.xword 0x4dc1e521c8443f9d




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

.xword 0x6a3f01a434f67d78
.xword 0x1f52f2805a18d865
.xword 0x5df03f6f7e786c62
.xword 0x1cbc248151771902
.xword 0xd85c6d9da83dc036
.xword 0xabca33a466e06354
.xword 0x3d245fe1b0d2953e
.xword 0xa5d30e9573d9f99b




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

.xword 0xd596ab293e85f7d2
.xword 0x1797c70ba54d15ba
.xword 0xf5d2a0be59062965
.xword 0xa433270e2ce8a058
.xword 0xd37a259cb952534c
.xword 0xd20171cc1d36dd20
.xword 0x2d4b4a534825f116
.xword 0x20c33ededd7585d1




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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x70f39a771eae12c0
.xword 0x7d3cf2326360e67b
.xword 0x3137390953c69bcc
.xword 0x14ed947495c73eec
.xword 0xe3667e6e3c006231
.xword 0x7f7650d87bd2851b
.xword 0xb447278d24bdfe57
.xword 0x3d8c388bb59a26ea






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
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb1d9830170f04708
.xword 0x6cdf15d68d4b069b
.xword 0x0dec7f9db2a1dae4
.xword 0xe719247a7b1c4365
.xword 0xd1b2e1ab161f73f1
.xword 0x11356dd2e1d090a6
.xword 0x75529135f7122617
.xword 0x33c56c1ba3344988




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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x2838b246ececdf65
.xword 0x89be1d7b00ceec30
.xword 0xd27b4a70fbee5f95
.xword 0x376e913320f67f5f
.xword 0x62e8a725b512fed7
.xword 0xbf904e62dfee4a86
.xword 0x0bee7c273b560752
.xword 0xce5cb77931cb70a0




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

.xword 0xd042e655648dcb11
.xword 0x6c06a2286da2991b
.xword 0x249dd65a1a5fbf24
.xword 0xe66ac645a4c68485
.xword 0x1efd7abd8da90d8a
.xword 0xdfbf6fcd12d07827
.xword 0xfa35f17017523e2c
.xword 0x10bca988cbcd16c6




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x3fbd39eef60ba184
.xword 0x0270f7468b487a66
.xword 0x8ce6c327420341d9
.xword 0x9da57e5a94ced797
.xword 0x7d775b3d2904efdd
.xword 0x7c6eaa35984febac
.xword 0x9c1cb6e7e846132a
.xword 0x59c7c38a9544ac4c




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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xcb764d9798014fcb
.xword 0x1d14da1d57851cad
.xword 0xc1d0ca4ccdb9e744
.xword 0x71d99004a511f2ac
.xword 0xedcdeb94e9f9c017
.xword 0x07df4548eb92dbb6
.xword 0x8a1f21f4dd59d1d1
.xword 0x639b428edead5089




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

.xword 0x00f069603c112119
.xword 0xddad89bd27773a17
.xword 0x0e81c2b6f4afae9e
.xword 0x4325e8ce901a39d0
.xword 0x787f6fcb7fb1ad99
.xword 0xfda2324f528f607c
.xword 0xb314bca24d156456
.xword 0x3f5c167024f1d927




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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xf1f90ddf88cd4eab
.xword 0x0bb7b78071a0684b
.xword 0x1fda9c8a1d11add9
.xword 0x75d2481c659517e8
.xword 0x1f7f2f4f638736eb
.xword 0xf3ee0638bfbbea88
.xword 0xef6971a3730281ac
.xword 0x76fbc5c0a13eb37e




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
	TTE_W	 = 1
}

.xword 0x79adf37f6ecb906c
.xword 0xdb4779423f4226b6
.xword 0xb6332958643dde92
.xword 0xf1e6e5d5c2a83351
.xword 0x3210c4285523ac95
.xword 0x2d6aa8c5ae5c7b3a
.xword 0x2af4cf6478bca3a6
.xword 0x5da30765d8daca7c






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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x239ea0c4a7c6da34
.xword 0xe30d6faed28da410
.xword 0x84a284f3b0907efd
.xword 0xe4f6f96a51b9f8aa
.xword 0xf0dd0a2b45c0b1c2
.xword 0xa1c4af0b0f821ddf
.xword 0x2fb80f1f1ffbf09f
.xword 0x479c5e7b9b8f14c1




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
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xf451d55e002c2a10
.xword 0x837df62c2f306b98
.xword 0x7a9c94bd6ffdee8b
.xword 0x60585f9ba303c749
.xword 0xd1f4966232a115fb
.xword 0xcd21562b520714f1
.xword 0x7bfa0615af8a1f9e
.xword 0x5fbe448ddfca017d




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
	TTE_W	 = 1
}

.xword 0x790556d5de8a3178
.xword 0x041acde21ab2c47a
.xword 0xd0839b75a5590900
.xword 0xde4a522ee7932c49
.xword 0xdaf48c687559389a
.xword 0x2b4c974d3a28e146
.xword 0x060ae65ec0572408
.xword 0x89942100afce6d16




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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xa4cbb0dcd978a13a
.xword 0xdd113e9f4a154677
.xword 0x8989dd6fd57b3586
.xword 0x0123b87ed0b5a670
.xword 0xb1f876cedf5e1657
.xword 0x1bbf4f969523b5af
.xword 0x883d39cabfb04b87
.xword 0x0124e8246e8ef22d




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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd328d7107960f408
.xword 0x93bbd5385efd65c2
.xword 0x00e26cd946e6c8de
.xword 0x3c370ea06aff2525
.xword 0x57cdc55c283ecf61
.xword 0xf200a8f9082a45f0
.xword 0xd43532de9492c547
.xword 0x1284de183405b4db




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
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x32c34079cc631ddf
.xword 0xadaac80d792fa63d
.xword 0x580f26f8eaf43597
.xword 0x32ea9fd3ba18c4da
.xword 0x046c5d1c19e11cfa
.xword 0x73ac9e50fa71596c
.xword 0xb76dc1d35ec80246
.xword 0xe037fc23c8c7d581




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

.xword 0x0ea5ead38578cc97
.xword 0xda849e33d2607c2c
.xword 0xce26e28692f016ff
.xword 0x5948316efe11b32b
.xword 0x98924af030d30cbf
.xword 0x50fe38a23d40a8d0
.xword 0xf7a51bbd5a759019
.xword 0x86b375c2cbced7be




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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x8144ad2297d22011
.xword 0xdb364816d38a3613
.xword 0x649bc63368ad286c
.xword 0xe9ce5120cdd55d84
.xword 0x0ffd27fc050895f9
.xword 0xeb5a8c3603db75ef
.xword 0xd54969d5741dc0ba
.xword 0x24a4e51c5813de09






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

.xword 0x35effb03ca53dd7b
.xword 0x80905880e5bf4a42
.xword 0x5f2872a2b776d9b4
.xword 0x82499b9bde7aee3f
.xword 0x4d1b1ce3431141d5
.xword 0x2794626ea68dcf5e
.xword 0x48e170f2039415a7
.xword 0x445b89a35dc58e0f




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
	TTE_W	 = 1
}

.xword 0x411d29232a6befd0
.xword 0x8f8487967bfe82a5
.xword 0xbb55e57c14dac7af
.xword 0xb6b7c1c742212a90
.xword 0x41ffce7ebe330b0e
.xword 0xd70773317700c20e
.xword 0x1ea856415b8f5f06
.xword 0xdcb555d82d4370f9




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

.xword 0x3d3a42ea34150202
.xword 0x8ca19cc26aab6365
.xword 0x4bc82ca65247693b
.xword 0x0d772577236544bd
.xword 0xeb09d835f0e115c9
.xword 0x7e07aa9b8868010b
.xword 0xba47da550e15d9ad
.xword 0xcc904f659f116052




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

.xword 0xf209abf935f69f4b
.xword 0x3a3878ab6f929120
.xword 0xf8dc655fb5a8545a
.xword 0x0e0b6294611b1862
.xword 0xdf5bfac53b5fcac9
.xword 0x778283efd5b31430
.xword 0x4421523985ed758e
.xword 0xb6691a1c2ca458bd






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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5c8a9e72e7403e38
.xword 0x87f5d7e06d8376e2
.xword 0xbda7587e55c40efb
.xword 0xab312a858c325a2f
.xword 0x327530734ad9741d
.xword 0x2986c438333788b3
.xword 0x41de040c7e076225
.xword 0x25c60bec4967aead




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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xc630a7a2f504c2d0
.xword 0xe1aeeb465bb18b30
.xword 0x48bd38f032aa7a53
.xword 0xd9060b91c02647c8
.xword 0x727f2dd7861900ef
.xword 0xacada19b3ebba43e
.xword 0xe213777b7202fe9c
.xword 0xaa3bf66b48c951fc




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

.xword 0x73811c3f03709753
.xword 0xb02ada3b5bb4bc25
.xword 0x6862c90eab0bbee9
.xword 0x4e1d00c6b32b3563
.xword 0xe582c3bb0c9d8029
.xword 0x7877c5bf56b87fa7
.xword 0xf1673a17172d9e22
.xword 0x7554e08fdb9e497d




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

.xword 0x4a27e414702dc9ec
.xword 0xfc1156e0c12434f3
.xword 0x002ef10b68a3a79c
.xword 0xadb46db4e598f515
.xword 0x9b5bd7a7c7e1ac6b
.xword 0xe083ef977d9277f2
.xword 0x57133869bf291391
.xword 0x39881cc34d36fd4f




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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x94e0ec25584639c9
.xword 0xa1a16a5b1809e017
.xword 0x060b1a53165ea3c2
.xword 0xf3909af00c46b296
.xword 0x6cd6727f3896d562
.xword 0xa5be4f34e8ed8041
.xword 0x7bd3167df25b43e4
.xword 0xb1bcc0747ff55cd8




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xe58a585c68249aa8
.xword 0x0e870e2e95fee4f3
.xword 0xc52137654a48c1e6
.xword 0x12f372cba803e655
.xword 0xff20e1e188e6ba71
.xword 0x949ab1a6c3ac4bf8
.xword 0x7b3f7e9efeb25cd4
.xword 0x3ee5458a75a3bcfd




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

.xword 0x99509e115dcb088b
.xword 0xc9cf4e532ae24640
.xword 0x2336c8d67519e027
.xword 0x49eb64f31d48f6f6
.xword 0x089449a3f7cb866d
.xword 0x89233056017c88b7
.xword 0x4d8ba1560112b685
.xword 0x5a9e2f010d587011




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
	TTE_IE	 = 1,
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

.xword 0x80cc80914005565e
.xword 0xb2ce951cbcb3547c
.xword 0xb3d85d5303816af1
.xword 0xe499479b824d78cf
.xword 0xa57e3f2b339b123b
.xword 0x025b3211ccb5c22f
.xword 0xf611ad6138aab5ab
.xword 0x0f9cb217ba2e3560




#if 0
#endif
