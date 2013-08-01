/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_08.s
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
#define DMMU_SKIP_IF_NO_TTE
#define IMMU_SKIP_IF_NO_TTE
#define PSTATE_CLE_MASK	0x200
#define PSTATE_TLE_MASK	0x100
#define MAIN_PAGE_NUCLEUS_ALSO
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
        done;nop;nop;nop;nop;nop;nop;nop
#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
        done;nop;nop;nop;nop;nop;nop;nop

# include "hboot.s"
.text
.global main

main:

main_text_start:
	setx SEC_CPPRI_DATA0_START, %r4, %r10
	setx SEC_CPPRI_DATA8_START, %r4, %r11
	setx SEC_CPPRI_DATA16_START, %r4, %r12
	setx SEC_CPPRI_DATA23_START, %r4, %r13

	setx SEC_NCPRI_DATA0_START, %r4, %r14
	setx SEC_NCPRI_DATA8_START, %r4, %r15
	setx SEC_NCPRI_DATA16_START, %r4, %r16
	setx SEC_NCPRI_DATA23_START, %r4, %r17

	setx SEC_CPSEC_DATA0_START, %r4, %r18
	setx SEC_NCSEC_DATA0_START, %r4, %r19

	setx SEC_CPNUC_DATA0_START, %r4, %r20
	setx SEC_NCNUC_DATA0_START, %r4, %r21

	setx SEC_CP_REAL_MEM_DATA0_START, %r4, %r22
	setx SEC_NC_REAL_IO_DATA0_START, %r4, %r23

	setx SEC_CP_AIUP_DATA0_START, %r4, %r24
	setx SEC_NC_AIUP_DATA0_START, %r4, %r25

	setx SEC_CP_AIUS_DATA0_START, %r4, %r30
	setx SEC_NC_AIUS_DATA0_START, %r4, %r31

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
# 306 "diag.j"
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
	setx 0x29515d5a69928b65, %g1, %r2
	setx 0x93283a116826028b, %g1, %r3
	setx 0xcb08762f6c6f8851, %g1, %r4
	setx 0xef22a31f13d52d84, %g1, %r5
	setx 0x8b56b3d9df34c04a, %g1, %r6
	setx 0xca95e9edc4be1867, %g1, %r7
	setx 0xb0ebe220236a3ca2, %g1, %r8

     mov %r2, %r1
CP_BIS_QUAD_LD0:
	and	%r26,	%r29,	%r26
CP_BIS_QUAD_LD1:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 3: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xc3a3101a  ! 4: STFA_R	sta	%f1, [%r26, %r12]
SHORT_FP_PRI2:
	.word 0xc39b5b5a  ! 6: LDDFA_R	ldda	[%r13, %r26], %f1
NC_BLK_SEc3:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 8: STDFA_R	stda	%f16, [%r26, %r19]
CHANGE_PRIV4:
	ta	T_CHANGE_PRIV
CHANGE_R265:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP5:
	.word 0xc4f6445a  ! 10: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xc2b2d11a  ! 11: STHA_R	stha	%r1, [%r11 + %r26] 0x88
	.word 0xc302801a  ! 12: LDF_R	ld	[%r10, %r26], %f1
	.word 0xc2c4903a  ! 14: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r1
	.word 0xc293101a  ! 15: LDUHA_R	lduha	[%r12, %r26] 0x80, %r1
CHANGE_USER6:
	ta	T_CHANGE_NONPRIV
CHANGE_R267:
	add	%r26,	%r27,	%r26
NC_BIS_PRI7:
	.word 0xc4f41c5a  ! 17: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS9:
	.word 0xc2cf833a  ! 19: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r1
CP_BIS_QUAD_LD10:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 21: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xc2d4101a  ! 23: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r1
	.word 0xc2d4913a  ! 25: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r1
	.word 0xc09cd13a  ! 27: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
	.word 0xc3bb101a  ! 28: STDFA_R	stda	%f1, [%r26, %r12]
NC_AIUS11:
	.word 0xc2d7c23a  ! 30: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r1
	.word 0xc383d01a  ! 32: LDFA_R	lda	[%r15, %r26], %f1
NC_BIS_AIUS12:
	.word 0xc4f7c57a  ! 34: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xc384d03a  ! 36: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc28b911a  ! 38: LDUBA_R	lduba	[%r14, %r26] 0x88, %r1
	.word 0xc39b911a  ! 40: LDDFA_R	ldda	[%r14, %r26], %f1
NC_BIS_AIUS13:
	.word 0xc8afc57a  ! 42: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
CP_AIUS14:
	.word 0xc2cf823a  ! 44: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r1
	.word 0xc2b4101a  ! 46: STHA_R	stha	%r1, [%r16 + %r26] 0x80
WR_LEASI_15:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_16:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SET_TL1_17:
	ta	T_CHANGE_TO_TL1
CHANGE_R2618:
	add	%r26,	%r27,	%r26
NC_BIS_NUC18:
	.word 0xd0bd45fa  ! 49: STDA_R	stda	%r8, [%r21 + %r26] 0x2f
	.word 0xc2ab901a  ! 51: STBA_R	stba	%r1, [%r14 + %r26] 0x80
	.word 0xc284d13a  ! 53: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r1
NC_BLK_SEc19:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 55: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc28bd01a  ! 57: LDUBA_R	lduba	[%r15, %r26] 0x80, %r1
	.word 0xc2c4d03a  ! 59: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r1
	.word 0xc0bcd03a  ! 61: STDA_R	stda	%r0, [%r19 + %r26] 0x81
	.word 0xc2acd03a  ! 63: STBA_R	stba	%r1, [%r19 + %r26] 0x81
	.word 0xc384913a  ! 65: LDFA_R	lda	[%r18, %r26], %f1
CP_PST_PRI20:
	.word 0xc3ba985a  ! 67: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2cc903a  ! 69: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	.word 0xc2c4101a  ! 71: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r1
NC_NUC21:
	.word 0xc2c5409a  ! 73: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r1
SET_TL0_22:
	ta	T_CHANGE_TO_TL0
CHANGE_R2623:
	add	%r26,	%r27,	%r26
NC_BIS_SEC23:
	.word 0xc4acdc7a  ! 75: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc26a801a  ! 76: LDSTUB_R	ldstub	%r1, [%r10 + %r26]
	.word 0xc2dcd03a  ! 78: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
CHANGE_PRIV24:
	ta	T_CHANGE_PRIV
CHANGE_R2625:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP25:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 80: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xc33b401a  ! 81: STDF_R	std	%f1, [%r26, %r13]
	.word 0xc0bbd11a  ! 83: STDA_R	stda	%r0, [%r15 + %r26] 0x88
CP_AIUS26:
	.word 0xc297833a  ! 85: LDUHA_R	lduha	[%r30, %r26] 0x19, %r1
NC_SHORT_FP_SEC27:
	.word 0xc3bcda3a  ! 87: STDFA_R	stda	%f1, [%r26, %r19]
	.word 0xc284903a  ! 89: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
	.word 0xc284903a  ! 91: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
CHANGE_TLE28:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc09cd03a  ! 94: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc2b4d13a  ! 96: STHA_R	stha	%r1, [%r19 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC30:
	.word 0xc2fd009a  ! 98: SWAPA_R	swapa	%r1, [%r20 + %r26] 0x04
NC_BIS_AIUS31:
	.word 0xc8f7c57a  ! 100: STXA_R	stxa	%r4, [%r31 + %r26] 0x2b
NC_PST_PRI32:
	.word 0xc3bc189a  ! 102: STDFA_R	stda	%f1, [%r26, %r16]
CHANGE_R2633:
	mov	%g0,	%r26
CP_BIS_SEC33:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 104: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xc09cd03a  ! 106: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
CP_ATM_QUAD_LD34:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 108: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xc39ad05a  ! 109: LDDFA_R	ldda	[%r11, %r26], %f1
CP_BIS_AIUS35:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 111: STDA_R	stda	%r2, [%r30 + %r26] 0x23
CP_NUC36:
	.word 0xc39d009a  ! 113: LDDFA_R	ldda	[%r20, %r26], %f1
CP_BIS_NUC37:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 115: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
BLK_PRI38:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 117: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xc3032024  ! 118: LDF_I	ld	[%r12, 0x0024], %f1
NC_BIS_AIUP39:
	.word 0xd0b6445a  ! 120: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xc2f2901a  ! 121: STXA_R	stxa	%r1, [%r10 + %r26] 0x80
NC_BLK_SEc40:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 123: LDDFA_R	ldda	[%r19, %r26], %f16
NC_PST_PRI41:
	.word 0xc3bc591a  ! 125: STDFA_R	stda	%f1, [%r26, %r17]
CHANGE_USER42:
	ta	T_CHANGE_NONPRIV
CHANGE_R2643:
	add	%r26,	%r27,	%r26
CP_BIS_PRI43:
	and	%r26,	%r28,	%r26
	.word 0xc8ba9c5a  ! 127: STDA_R	stda	%r4, [%r10 + %r26] 0xe2
SHORT_FP_PRI44:
	.word 0xc39b5a1a  ! 129: LDDFA_R	ldda	[%r13, %r26], %f1
	.word 0xc384903a  ! 131: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc3a4903a  ! 133: STFA_R	sta	%f1, [%r26, %r18]
NC_SHORT_FP_SEC45:
	.word 0xc39cdb7a  ! 135: LDDFA_R	ldda	[%r19, %r26], %f1
NC_BIS_SEC46:
	.word 0xc8a4dc7a  ! 137: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xc2f4913a  ! 139: STXA_R	stxa	%r1, [%r18 + %r26] 0x89
	.word 0xc2cc903a  ! 141: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP48:
	.word 0xc2ae421a  ! 143: STBA_R	stba	%r1, [%r25 + %r26] 0x10
BLK_PRI49:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 145: LDDFA_R	ldda	[%r11, %r26], %f16
NC_NUC50:
	.word 0xc3a5409a  ! 147: STFA_R	sta	%f1, [%r26, %r21]
CP_BIS_NUC51:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 149: STHA_R	stha	%r6, [%r20 + %r26] 0x27
	.word 0xc2d4903a  ! 151: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
NC_BLK_SEc52:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 153: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc2f4903a  ! 155: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
CP_BIS_AIUS53:
	and	%r26,	%r28,	%r26
	.word 0xc89f847a  ! 157: LDDA_R	ldda	[%r30, %r26] 0x23, %r4
NC_PST_PRI54:
	.word 0xc3bbd99a  ! 159: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc284d13a  ! 161: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r1
	.word 0xc09cd03a  ! 163: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc09cd03a  ! 165: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
NC_AIUP55:
	.word 0xc2a6421a  ! 167: STWA_R	stwa	%r1, [%r25 + %r26] 0x10
	.word 0xc39b515a  ! 168: LDDFA_R	ldda	[%r13, %r26], %f1
	.word 0xc2dc101a  ! 170: LDXA_R	ldxa	[%r16, %r26] 0x80, %r1
	.word 0xc2db911a  ! 172: LDXA_R	ldxa	[%r14, %r26] 0x88, %r1
CP_NUC56:
	.word 0xc2d5009a  ! 174: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r1
	.word 0xc284913a  ! 176: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r1
	.word 0xc39a901a  ! 177: LDDFA_R	ldda	[%r10, %r26], %f1
SET_TL1_57:
	ta	T_CHANGE_TO_TL1
CHANGE_R2658:
	add	%r26,	%r27,	%r26
NC_BIS_NUC58:
	.word 0xccad45fa  ! 179: STBA_R	stba	%r6, [%r21 + %r26] 0x2f
NC_NUC59:
	.word 0xc2a5419a  ! 181: STWA_R	stwa	%r1, [%r21 + %r26] 0x0c
	.word 0xc384111a  ! 183: LDFA_R	lda	[%r16, %r26], %f1
NC_BIS_NUC60:
	.word 0xc4b544fa  ! 185: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc28c913a  ! 187: LDUBA_R	lduba	[%r18, %r26] 0x89, %r1
	.word 0xc2d4d03a  ! 189: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc36b401a  ! 191: PREFETCH_R	prefetch	[%r13 + %r26], #one_read
	.word 0xc2ccd13a  ! 193: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
	.word 0xc3bb501a  ! 194: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc2b4903a  ! 196: STHA_R	stha	%r1, [%r18 + %r26] 0x81
	.word 0xc3bb111a  ! 197: STDFA_R	stda	%f1, [%r26, %r12]
CP_AIUP61:
	.word 0xc286031a  ! 199: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r1
	.word 0xc0bb101a  ! 200: STDA_R	stda	%r0, [%r12 + %r26] 0x80
CP_NUC62:
	.word 0xc2a5009a  ! 202: STWA_R	stwa	%r1, [%r20 + %r26] 0x04
	.word 0xc2a2d01a  ! 203: STWA_R	stwa	%r1, [%r11 + %r26] 0x80
	.word 0xc39c903a  ! 205: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc284d03a  ! 207: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
	.word 0xc27ac01a  ! 208: SWAP_R	swap	%r1, [%r11 + %r26]
NC_AIUS63:
	.word 0xc2d7c33a  ! 210: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r1
	.word 0xc39a915a  ! 211: LDDFA_R	ldda	[%r10, %r26], %f1
NC_BIS_NUC64:
	.word 0xc4f544fa  ! 213: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xc3236024  ! 214: STF_I	st	%f1, [0x0024, %r13]
	.word 0xc2d4111a  ! 216: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r1
	.word 0xc2cb911a  ! 218: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r1
	.word 0xc2f4d13a  ! 220: STXA_R	stxa	%r1, [%r19 + %r26] 0x89
CP_PST_PRI65:
	.word 0xc3bb181a  ! 222: STDFA_R	stda	%f1, [%r26, %r12]
NC_AIUS66:
	.word 0xc09fc23a  ! 224: LDDA_R	ldda	[%r31, %r26] 0x11, %r0
	.word 0xc323401a  ! 225: STF_R	st	%f1, [%r26, %r13]
	.word 0xc39c913a  ! 227: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc2ccd13a  ! 229: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
	.word 0xc294d03a  ! 231: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
NC_SHORT_FP_SEC67:
	.word 0xc39cdb3a  ! 233: LDDFA_R	ldda	[%r19, %r26], %f1
NC_NUC68:
	.word 0xc3bd409a  ! 235: STDFA_R	stda	%f1, [%r26, %r21]
	.word 0xc09c903a  ! 237: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
	.word 0xc384913a  ! 239: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc302801a  ! 240: LDF_R	ld	[%r10, %r26], %f1
NC_AIUS69:
	.word 0xc2c7c23a  ! 242: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r1
	.word 0xc39c501a  ! 244: LDDFA_R	ldda	[%r17, %r26], %f1
	.word 0xc39ad15a  ! 245: LDDFA_R	ldda	[%r11, %r26], %f1
NC_BIS_NUC70:
	.word 0xd0bd44fa  ! 247: STDA_R	stda	%r8, [%r21 + %r26] 0x27
NC_NUC71:
	.word 0xc09d409a  ! 249: LDDA_R	ldda	[%r21, %r26] 0x04, %r0
	.word 0xc284d03a  ! 251: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
CP_BIS_NUC72:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 253: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
CP_BIS_QUAD_LD73:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 255: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
CP_BIS_NUC74:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 257: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xc233401a  ! 258: STH_R	sth	%r1, [%r13 + %r26]
CP_PST_PRI75:
	.word 0xc3ba981a  ! 260: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc382911a  ! 261: LDFA_R	lda	[%r10, %r26], %f1
	.word 0xc2ab911a  ! 263: STBA_R	stba	%r1, [%r14 + %r26] 0x88
	.word 0xc2b4501a  ! 265: STHA_R	stha	%r1, [%r17 + %r26] 0x80
	.word 0xc2ab911a  ! 267: STBA_R	stba	%r1, [%r14 + %r26] 0x88
NC_BIS_NUC76:
	.word 0xc4b544fa  ! 269: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc39c903a  ! 271: LDDFA_R	ldda	[%r18, %r26], %f1
CP_ATM_QUAD_LD77:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 273: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
SET_TL0_78:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI79:
	and	%r26,	%r28,	%r26
	.word 0xccbb1d5a  ! 275: STDA_R	stda	%r6, [%r12 + %r26] 0xea
	.word 0xc2b4d03a  ! 277: STHA_R	stha	%r1, [%r19 + %r26] 0x81
CHANGE_PRIV80:
	ta	T_CHANGE_PRIV
CHANGE_R2681:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS81:
	.word 0xcca7c57a  ! 279: STWA_R	stwa	%r6, [%r31 + %r26] 0x2b
BLK_PRI82:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 281: LDDFA_R	ldda	[%r10, %r26], %f16
CP_PST_PRI83:
	.word 0xc3bb585a  ! 283: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc39c903a  ! 285: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc384903a  ! 287: LDFA_R	lda	[%r18, %r26], %f1
CP_PST_PRI84:
	.word 0xc3bb599a  ! 289: STDFA_R	stda	%f1, [%r26, %r13]
CP_AIUP85:
	.word 0xc2d6031a  ! 291: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r1
	.word 0xc3bc903a  ! 293: STDFA_R	stda	%f1, [%r26, %r18]
	.word 0xc3bcd03a  ! 295: STDFA_R	stda	%f1, [%r26, %r19]
NC_NUC86:
	.word 0xc2d5419a  ! 297: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r1
	.word 0xc39ad01a  ! 298: LDDFA_R	ldda	[%r11, %r26], %f1
NC_AIUP87:
	.word 0xc3a6421a  ! 300: STFA_R	sta	%f1, [%r26, %r25]
	.word 0xc2f4d03a  ! 302: STXA_R	stxa	%r1, [%r19 + %r26] 0x81
	.word 0xc2f4903a  ! 304: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
CP_PST_PRI88:
	.word 0xc3bb185a  ! 306: STDFA_R	stda	%f1, [%r26, %r12]
CP_BIS_NUC89:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 308: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
NC_BIS_AIUP90:
	.word 0xccbe445a  ! 310: STDA_R	stda	%r6, [%r25 + %r26] 0x22
CHANGE_USER91:
	ta	T_CHANGE_NONPRIV
CHANGE_R2692:
	add	%r26,	%r27,	%r26
CP_BIS_PRI92:
	and	%r26,	%r28,	%r26
	.word 0xd0badc5a  ! 312: STDA_R	stda	%r8, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP94:
	.word 0xc2d6421a  ! 314: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r1
	.word 0xc0bcd03a  ! 316: STDA_R	stda	%r0, [%r19 + %r26] 0x81
NC_PST_PRI95:
	.word 0xc3bb985a  ! 318: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc284d03a  ! 320: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
BLK_PRI96:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 322: LDDFA_R	ldda	[%r10, %r26], %f0
CP_PST_PRI97:
	.word 0xc3bb599a  ! 324: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc2dcd03a  ! 326: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
	.word 0xc2b4d03a  ! 328: STHA_R	stha	%r1, [%r19 + %r26] 0x81
	.word 0xc39b911a  ! 330: LDDFA_R	ldda	[%r14, %r26], %f1
NC_BIS_SEC98:
	.word 0xccbcdc7a  ! 332: STDA_R	stda	%r6, [%r19 + %r26] 0xe3
NC_AIUP99:
	.word 0xc2d6431a  ! 334: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r1
	.word 0xc2d4d03a  ! 336: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc33ae020  ! 337: STDF_I	std	%f1, [0x0020, %r11]
	.word 0xc0ba901a  ! 338: STDA_R	stda	%r0, [%r10 + %r26] 0x80
	.word 0xc2c4501a  ! 340: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r1
CP_ATM_QUAD_LD100:
	and	%r26,	%r29,	%r26
	.word 0xd09b459a  ! 342: LDDA_R	ldda	[%r13, %r26] 0x2c, %r8
	.word 0xc09c913a  ! 344: LDDA_R	ldda	[%r18, %r26] 0x89, %r0
	.word 0xc293d01a  ! 346: LDUHA_R	lduha	[%r15, %r26] 0x80, %r1
CHANGE_USER101:
	ta	T_CHANGE_NONPRIV
CHANGE_R26102:
	add	%r26,	%r27,	%r26
NC_BIS_PRI102:
	.word 0xc4f3dd5a  ! 348: STXA_R	stxa	%r2, [%r15 + %r26] 0xea
	.word 0xc2dcd03a  ! 350: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS104:
	.word 0xc28f823a  ! 352: LDUBA_R	lduba	[%r30, %r26] 0x11, %r1
CP_PST_PRI105:
	.word 0xc3ba989a  ! 354: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc22b6027  ! 355: STB_I	stb	%r1, [%r13 + 0x0027]
CP_BIS_AIUS106:
	and	%r26,	%r28,	%r26
	.word 0xc8bf857a  ! 357: STDA_R	stda	%r4, [%r30 + %r26] 0x2b
CP_ATM_QUAD_LD107:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 359: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xc2b3911a  ! 361: STHA_R	stha	%r1, [%r14 + %r26] 0x88
SHORT_FP_PRI108:
	.word 0xc39b5b1a  ! 363: LDDFA_R	ldda	[%r13, %r26], %f1
	.word 0xc3a2901a  ! 364: STFA_R	sta	%f1, [%r26, %r10]
CP_PST_PRI109:
	.word 0xc3ba981a  ! 366: STDFA_R	stda	%f1, [%r26, %r10]
NC_AIUS110:
	.word 0xc3bfc23a  ! 368: STDFA_R	stda	%f1, [%r26, %r31]
	.word 0xc3a3101a  ! 369: STFA_R	sta	%f1, [%r26, %r12]
WR_LEASI_111:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_112:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP113:
	.word 0xc286421a  ! 372: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r1
NC_NUC114:
	.word 0xc39d409a  ! 374: LDDFA_R	ldda	[%r21, %r26], %f1
	.word 0xc2d4111a  ! 376: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r1
NC_BIS_SEC115:
	.word 0xc4f4dc7a  ! 378: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xc0bc903a  ! 380: STDA_R	stda	%r0, [%r18 + %r26] 0x81
	.word 0xc383d11a  ! 382: LDFA_R	lda	[%r15, %r26], %f1
	.word 0xc0ba901a  ! 383: STDA_R	stda	%r0, [%r10 + %r26] 0x80
WR_LEASI_116:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_117:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
BLK_PRI118:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 386: STDFA_R	stda	%f16, [%r26, %r10]
CHANGE_R26119:
	add	%r26,	%r27,	%r26
CP_BIS_SEC119:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 388: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
	.word 0xc284d03a  ! 390: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
NC_AIUS120:
	.word 0xc2b7c23a  ! 392: STHA_R	stha	%r1, [%r31 + %r26] 0x11
	.word 0xc2dcd03a  ! 394: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
	.word 0xc2c4903a  ! 396: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r1
CHANGE_USER121:
	ta	T_CHANGE_NONPRIV
CHANGE_R26122:
	add	%r26,	%r27,	%r26
NC_BIS_PRI122:
	.word 0xc8abdc5a  ! 398: STBA_R	stba	%r4, [%r15 + %r26] 0xe2
	.word 0xc302801a  ! 399: LDF_R	ld	[%r10, %r26], %f1
NC_BIS_PRI123:
	.word 0xc4ab9c5a  ! 401: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
	.word 0xc28cd13a  ! 403: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS125:
	.word 0xc2d7823a  ! 405: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r1
CP_BIS_QUAD_LD126:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 407: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc39c903a  ! 409: LDDFA_R	ldda	[%r18, %r26], %f1
CP_PST_PRI127:
	.word 0xc3bad81a  ! 411: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc31b2020  ! 412: LDDF_I	ldd	[%r12, 0x0020], %f1
NC_AIUS128:
	.word 0xc2a7c23a  ! 414: STWA_R	stwa	%r1, [%r31 + %r26] 0x11
	.word 0xc3bc101a  ! 416: STDFA_R	stda	%f1, [%r26, %r16]
CP_BIS_AIUP129:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 418: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xc09cd03a  ! 420: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc2c3101a  ! 421: LDSWA_R	ldswa	[%r12, %r26] 0x80, %r1
	.word 0xc322c01a  ! 422: STF_R	st	%f1, [%r26, %r11]
	.word 0xc2b2911a  ! 423: STHA_R	stha	%r1, [%r10 + %r26] 0x88
	.word 0xc27b2024  ! 424: SWAP_I	swap	%r1, [%r12 + 0x0024]
SET_TL1_130:
	ta	T_CHANGE_TO_TL1
CHANGE_R26131:
	add	%r26,	%r27,	%r26
NC_BIS_NUC131:
	.word 0xccb544fa  ! 426: STHA_R	stha	%r6, [%r21 + %r26] 0x27
SET_TL0_132:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI133:
	.word 0xccb41d5a  ! 428: STHA_R	stha	%r6, [%r16 + %r26] 0xea
CP_PST_PRI134:
	.word 0xc3bb189a  ! 430: STDFA_R	stda	%f1, [%r26, %r12]
CHANGE_PRIV135:
	ta	T_CHANGE_PRIV
CHANGE_R26136:
	add	%r26,	%r27,	%r26
CP_BIS_NUC136:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 432: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
NC_NUC137:
	.word 0xc28d419a  ! 434: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r1
	.word 0xc26a801a  ! 435: LDSTUB_R	ldstub	%r1, [%r10 + %r26]
CP_BIS_NUC138:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 437: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
	.word 0xc282d15a  ! 438: LDUWA_R	lduwa	[%r11, %r26] 0x8a, %r1
SET_TL1_139:
	ta	T_CHANGE_TO_TL1
CHANGE_R26140:
	add	%r26,	%r27,	%r26
NC_BIS_NUC140:
	.word 0xc4ad45fa  ! 440: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
SET_TL0_141:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI142:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 442: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	.word 0xc27aa024  ! 443: SWAP_I	swap	%r1, [%r10 + 0x0024]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP144:
	.word 0xc28e421a  ! 445: LDUBA_R	lduba	[%r25, %r26] 0x10, %r1
	.word 0xc384501a  ! 447: LDFA_R	lda	[%r17, %r26], %f1
	.word 0xc294d03a  ! 449: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
	.word 0xc28c903a  ! 451: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
NC_BIS_AIUS145:
	.word 0xccb7c47a  ! 453: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xc31ae020  ! 454: LDDF_I	ldd	[%r11, 0x0020], %f1
NC_PST_PRI146:
	.word 0xc3bb991a  ! 456: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc09bd11a  ! 458: LDDA_R	ldda	[%r15, %r26] 0x88, %r0
	.word 0xc2b4d13a  ! 460: STHA_R	stha	%r1, [%r19 + %r26] 0x89
NC_BIS_AIUS147:
	.word 0xc4f7c57a  ! 462: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
NC_PST_PRI148:
	.word 0xc3bb981a  ! 464: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc294d03a  ! 466: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
	.word 0xc3bb101a  ! 467: STDFA_R	stda	%f1, [%r26, %r12]
CHANGE_R26149:
	mov	%g0,	%r26
CP_BIS_SEC149:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 469: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
CHANGE_USER150:
	ta	T_CHANGE_NONPRIV
CHANGE_R26151:
	add	%r26,	%r27,	%r26
NC_BIS_PRI151:
	.word 0xc4f39c5a  ! 471: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
SHORT_FP_PRI152:
	.word 0xc3ba9b5a  ! 473: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2ac913a  ! 475: STBA_R	stba	%r1, [%r18 + %r26] 0x89
NC_BLK_SEc153:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 477: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc284501a  ! 479: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r1
	.word 0xc3a4d03a  ! 481: STFA_R	sta	%f1, [%r26, %r19]
NC_BIS_SEC154:
	.word 0xcca4dd7a  ! 483: STWA_R	stwa	%r6, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS156:
	.word 0xc3bfc33a  ! 485: STDFA_R	stda	%f1, [%r26, %r31]
CHANGE_USER157:
	ta	T_CHANGE_NONPRIV
CHANGE_R26158:
	add	%r26,	%r27,	%r26
CP_BIS_PRI158:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 487: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
	.word 0xc28cd03a  ! 489: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC160:
	.word 0xc3e5201a  ! 491: CASA_R	casa	[%r20] %asi, %r26, %r1
	.word 0xc31b6020  ! 492: LDDF_I	ldd	[%r13, 0x0020], %f1
	.word 0xc3e3201a  ! 493: CASA_R	casa	[%r12] %asi, %r26, %r1
SHORT_FP_PRI161:
	.word 0xc39b5b1a  ! 495: LDDFA_R	ldda	[%r13, %r26], %f1
CP_AIUS162:
	.word 0xc3a7823a  ! 497: STFA_R	sta	%f1, [%r26, %r30]
	.word 0xc28c913a  ! 499: LDUBA_R	lduba	[%r18, %r26] 0x89, %r1
CP_NUC163:
	.word 0xc3f5201a  ! 501: CASXA_R	casxa	[%r20]%asi, %r26, %r1
CP_AIUP164:
	.word 0xc2b6031a  ! 503: STHA_R	stha	%r1, [%r24 + %r26] 0x18
	.word 0xc39a901a  ! 504: LDDFA_R	ldda	[%r10, %r26], %f1
CHANGE_USER165:
	ta	T_CHANGE_NONPRIV
CHANGE_R26166:
	add	%r26,	%r27,	%r26
NC_BIS_PRI166:
	.word 0xccbc1c5a  ! 506: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS168:
	.word 0xc2b7c23a  ! 508: STHA_R	stha	%r1, [%r31 + %r26] 0x11
	.word 0xc2a3101a  ! 509: STWA_R	stwa	%r1, [%r12 + %r26] 0x80
NC_BLK_SEc169:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 511: LDDFA_R	ldda	[%r19, %r26], %f16
CHANGE_R26170:
	add	%r26,	%r27,	%r26
CP_BIS_SEC170:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 513: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xc2ccd13a  ! 515: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
CHANGE_R26171:
	mov	%g0,	%r26
CP_BIS_SEC171:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 517: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
	.word 0xc3e3601a  ! 518: CASA_R	casa	[%r13] %asi, %r26, %r1
	.word 0xc2d4d03a  ! 520: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc2d3501a  ! 521: LDSHA_R	ldsha	[%r13, %r26] 0x80, %r1
	.word 0xc3bad01a  ! 522: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc2acd13a  ! 524: STBA_R	stba	%r1, [%r19 + %r26] 0x89
CP_BIS_NUC172:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 526: STBA_R	stba	%r6, [%r20 + %r26] 0x27
NC_AIUP173:
	.word 0xc2d6431a  ! 528: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r1
NC_AIUP174:
	.word 0xc2b6431a  ! 530: STHA_R	stha	%r1, [%r25 + %r26] 0x18
	.word 0xc384903a  ! 532: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc3bb101a  ! 533: STDFA_R	stda	%f1, [%r26, %r12]
CP_NUC175:
	.word 0xc285019a  ! 535: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r1
	.word 0xc3bc903a  ! 537: STDFA_R	stda	%f1, [%r26, %r18]
	.word 0xc3a4913a  ! 539: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc2aa901a  ! 540: STBA_R	stba	%r1, [%r10 + %r26] 0x80
CP_BIS_QUAD_LD176:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 542: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
NC_BIS_AIUP177:
	.word 0xcca6445a  ! 544: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
CHANGE_R26178:
	add	%r26,	%r27,	%r26
CP_BIS_SEC178:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 546: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
	.word 0xc03b401a  ! 547: STD_R	std	%r0, [%r13 + %r26]
	.word 0xc2a3901a  ! 549: STWA_R	stwa	%r1, [%r14 + %r26] 0x80
	.word 0xc76f801a  ! 551: PREFETCH_R	prefetch	[%r30 + %r26], #one_write
	.word 0xc2cc903a  ! 553: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	.word 0xc3e2a01a  ! 554: CASA_R	casa	[%r10] %asi, %r26, %r1
	.word 0xc2acd13a  ! 556: STBA_R	stba	%r1, [%r19 + %r26] 0x89
	.word 0xc382905a  ! 557: LDFA_R	lda	[%r10, %r26], %f1
	.word 0xc39c913a  ! 559: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc2a3101a  ! 560: STWA_R	stwa	%r1, [%r12 + %r26] 0x80
CP_BIS_AIUS179:
	and	%r26,	%r28,	%r26
	.word 0xd0bf857a  ! 562: STDA_R	stda	%r8, [%r30 + %r26] 0x2b
	.word 0xc28cd03a  ! 564: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
	.word 0xc3a3501a  ! 565: STFA_R	sta	%f1, [%r26, %r13]
SET_TL1_180:
	ta	T_CHANGE_TO_TL1
CHANGE_R26181:
	add	%r26,	%r27,	%r26
NC_BIS_NUC181:
	.word 0xd0ad44fa  ! 567: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xc2d4d03a  ! 569: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
SET_TL0_182:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI183:
	.word 0xccf41c5a  ! 571: STXA_R	stxa	%r6, [%r16 + %r26] 0xe2
CP_BIS_PRI184:
	and	%r26,	%r28,	%r26
	.word 0xc8b35c5a  ! 573: STHA_R	stha	%r4, [%r13 + %r26] 0xe2
	.word 0xc2c4d13a  ! 575: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r1
	.word 0xc0bcd13a  ! 577: STDA_R	stda	%r0, [%r19 + %r26] 0x89
	.word 0xc2cb101a  ! 578: LDSBA_R	ldsba	[%r12, %r26] 0x80, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC186:
	.word 0xc28d409a  ! 580: LDUBA_R	lduba	[%r21, %r26] 0x04, %r1
	.word 0xc294d13a  ! 582: LDUHA_R	lduha	[%r19, %r26] 0x89, %r1
	.word 0xc2ac903a  ! 584: STBA_R	stba	%r1, [%r18 + %r26] 0x81
CP_AIUP187:
	.word 0xc2b6031a  ! 586: STHA_R	stha	%r1, [%r24 + %r26] 0x18
CP_NUC188:
	.word 0xc2cd009a  ! 588: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r1
CP_AIUS189:
	.word 0xc2c7823a  ! 590: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r1
	.word 0xc294903a  ! 592: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
	.word 0xc28cd13a  ! 594: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
	.word 0xc25b6020  ! 595: LDX_I	ldx	[%r13 + 0x0020], %r1
CP_ATM_QUAD_LD190:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 597: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_NUC191:
	.word 0xc285009a  ! 599: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r1
	.word 0xc2cc913a  ! 601: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r1
WR_LEASI_192:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_193:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2a3901a  ! 604: STWA_R	stwa	%r1, [%r14 + %r26] 0x80
	.word 0xc22a801a  ! 605: STB_R	stb	%r1, [%r10 + %r26]
	.word 0xc2f4913a  ! 607: STXA_R	stxa	%r1, [%r18 + %r26] 0x89
	.word 0xc2a4903a  ! 609: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
WR_LEASI_194:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_195:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2f4d13a  ! 612: STXA_R	stxa	%r1, [%r19 + %r26] 0x89
	.word 0xc28cd13a  ! 614: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
NC_BLK_SEc196:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 616: LDDFA_R	ldda	[%r19, %r26], %f0
CP_AIUP197:
	.word 0xc3be031a  ! 618: STDFA_R	stda	%f1, [%r26, %r24]
CHANGE_CLE198:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_PST_PRI199:
	.word 0xc3bb591a  ! 621: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc273401a  ! 622: STX_R	stx	%r1, [%r13 + %r26]
	.word 0xc2f4101a  ! 624: STXA_R	stxa	%r1, [%r16 + %r26] 0x80
NC_BIS_SEC200:
	.word 0xc4a4dc7a  ! 626: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV201:
	ta	T_CHANGE_PRIV
CHANGE_R26202:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD202:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 628: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
	.word 0xc03b001a  ! 629: STD_R	std	%r0, [%r12 + %r26]
NC_BIS_SEC203:
	.word 0xccf4dc7a  ! 631: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
NC_AIUS204:
	.word 0xc297c33a  ! 633: LDUHA_R	lduha	[%r31, %r26] 0x19, %r1
	.word 0xc39c913a  ! 635: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc2ab901a  ! 637: STBA_R	stba	%r1, [%r14 + %r26] 0x80
CHANGE_USER205:
	ta	T_CHANGE_NONPRIV
CHANGE_R26206:
	add	%r26,	%r27,	%r26
NC_BIS_PRI206:
	.word 0xd0bb9d5a  ! 639: STDA_R	stda	%r8, [%r14 + %r26] 0xea
	.word 0xc3a4903a  ! 641: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc31a801a  ! 642: LDDF_R	ldd	[%r10, %r26], %f1
	.word 0xc39c101a  ! 644: LDDFA_R	ldda	[%r16, %r26], %f1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC208:
	.word 0xc2dd019a  ! 646: LDXA_R	ldxa	[%r20, %r26] 0x0c, %r1
	.word 0xc3f3601a  ! 647: CASXA_R	casxa	[%r13]%asi, %r26, %r1
NC_NUC209:
	.word 0xc2f5419a  ! 649: STXA_R	stxa	%r1, [%r21 + %r26] 0x0c
NC_BIS_SEC210:
	.word 0xd0a4dd7a  ! 651: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	.word 0xc3a2901a  ! 652: STFA_R	sta	%f1, [%r26, %r10]
	.word 0xc284913a  ! 654: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r1
	.word 0xc293511a  ! 655: LDUHA_R	lduha	[%r13, %r26] 0x88, %r1
	.word 0xc09c101a  ! 657: LDDA_R	ldda	[%r16, %r26] 0x80, %r0
CP_NUC211:
	.word 0xc39d009a  ! 659: LDDFA_R	ldda	[%r20, %r26], %f1
	.word 0xc2b3d01a  ! 661: STHA_R	stha	%r1, [%r15 + %r26] 0x80
BLK_PRI212:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 663: LDDFA_R	ldda	[%r11, %r26], %f16
CHANGE_R26213:
	add	%r26,	%r27,	%r26
CP_BIS_SEC213:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 665: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
	.word 0xc2ead11a  ! 666: LDSTUBA_R	ldstuba	%r1, [%r11 + %r26] 0x88
NC_NUC214:
	.word 0xc2ad419a  ! 668: STBA_R	stba	%r1, [%r21 + %r26] 0x0c
	.word 0xc2336026  ! 669: STH_I	sth	%r1, [%r13 + 0x0026]
NC_BIS_AIUS215:
	.word 0xccbfc57a  ! 671: STDA_R	stda	%r6, [%r31 + %r26] 0x2b
	.word 0xc3ba901a  ! 672: STDFA_R	stda	%f1, [%r26, %r10]
CHANGE_USER216:
	ta	T_CHANGE_NONPRIV
CHANGE_R26217:
	mov	%g0,	%r26
NC_BIS_PRI217:
	.word 0xd0f39c5a  ! 674: STXA_R	stxa	%r8, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC219:
	.word 0xc0bd019a  ! 676: STDA_R	stda	%r0, [%r20 + %r26] 0x0c
	.word 0xc3a4903a  ! 678: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc09c913a  ! 680: LDDA_R	ldda	[%r18, %r26] 0x89, %r0
NC_PST_PRI220:
	.word 0xc3bc189a  ! 682: STDFA_R	stda	%f1, [%r26, %r16]
CP_BIS_QUAD_LD221:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 684: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
NC_BIS_AIUS222:
	.word 0xc4a7c57a  ! 686: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
SET_TL1_223:
	ta	T_CHANGE_TO_TL1
CHANGE_R26224:
	add	%r26,	%r27,	%r26
NC_BIS_NUC224:
	.word 0xcca544fa  ! 688: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xc03b2020  ! 689: STD_I	std	%r0, [%r12 + 0x0020]
	.word 0xc292d05a  ! 690: LDUHA_R	lduha	[%r11, %r26] 0x82, %r1
NC_BIS_AIUP225:
	.word 0xd0be445a  ! 692: STDA_R	stda	%r8, [%r25 + %r26] 0x22
SET_TL0_226:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI227:
	and	%r26,	%r28,	%r26
	.word 0xc4a2dc5a  ! 694: STWA_R	stwa	%r2, [%r11 + %r26] 0xe2
	.word 0xc302a024  ! 695: LDF_I	ld	[%r10, 0x0024], %f1
NC_BIS_PRI228:
	.word 0xccab9c5a  ! 697: STBA_R	stba	%r6, [%r14 + %r26] 0xe2
	.word 0xc294d13a  ! 699: LDUHA_R	lduha	[%r19, %r26] 0x89, %r1
CHANGE_PRIV229:
	ta	T_CHANGE_PRIV
CHANGE_R26230:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP230:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 701: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CP_PST_PRI231:
	.word 0xc3bb581a  ! 703: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc2f3911a  ! 705: STXA_R	stxa	%r1, [%r14 + %r26] 0x88
	.word 0xc3bcd13a  ! 707: STDFA_R	stda	%f1, [%r26, %r19]
	.word 0xc2cad05a  ! 708: LDSBA_R	ldsba	[%r11, %r26] 0x82, %r1
SET_TL1_232:
	ta	T_CHANGE_TO_TL1
CHANGE_R26233:
	add	%r26,	%r27,	%r26
NC_BIS_NUC233:
	.word 0xc4b544fa  ! 710: STHA_R	stha	%r2, [%r21 + %r26] 0x27
CP_BIS_AIUP234:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 712: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xc28cd03a  ! 714: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
	.word 0xc2f4501a  ! 716: STXA_R	stxa	%r1, [%r17 + %r26] 0x80
CP_BIS_QUAD_LD235:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9d5a  ! 718: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
	.word 0xc31ae020  ! 719: LDDF_I	ldd	[%r11, 0x0020], %f1
	.word 0xc2a2d01a  ! 720: STWA_R	stwa	%r1, [%r11 + %r26] 0x80
NC_PST_PRI236:
	.word 0xc3bb995a  ! 722: STDFA_R	stda	%f1, [%r26, %r14]
NC_PST_PRI237:
	.word 0xc3bb981a  ! 724: STDFA_R	stda	%f1, [%r26, %r14]
NC_NUC238:
	.word 0xc28d419a  ! 726: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r1
	.word 0xc294913a  ! 728: LDUHA_R	lduha	[%r18, %r26] 0x89, %r1
	.word 0xc2d4d13a  ! 730: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
	.word 0xc2b4903a  ! 732: STHA_R	stha	%r1, [%r18 + %r26] 0x81
	.word 0xc2d3901a  ! 734: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r1
CP_PST_PRI239:
	.word 0xc3bb599a  ! 736: STDFA_R	stda	%f1, [%r26, %r13]
NC_BLK_SEc240:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 738: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc3f3201a  ! 739: CASXA_R	casxa	[%r12]%asi, %r26, %r1
	.word 0xc3bb901a  ! 741: STDFA_R	stda	%f1, [%r26, %r14]
CP_BIS_QUAD_LD241:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 743: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
SET_TL0_242:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI243:
	and	%r26,	%r28,	%r26
	.word 0xd09adc5a  ! 745: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
CHANGE_PRIV244:
	ta	T_CHANGE_PRIV
CHANGE_R26245:
	add	%r26,	%r27,	%r26
CP_BIS_NUC245:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 747: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
NC_NUC246:
	.word 0xc39d409a  ! 749: LDDFA_R	ldda	[%r21, %r26], %f1
	.word 0xc232e026  ! 750: STH_I	sth	%r1, [%r11 + 0x0026]
	.word 0xc2d4903a  ! 752: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
CHANGE_USER247:
	ta	T_CHANGE_NONPRIV
CHANGE_R26248:
	add	%r26,	%r27,	%r26
NC_BIS_PRI248:
	.word 0xd0bc1c5a  ! 754: STDA_R	stda	%r8, [%r16 + %r26] 0xe2
	.word 0xc3bcd13a  ! 756: STDFA_R	stda	%f1, [%r26, %r19]
	.word 0xc284903a  ! 758: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
SET_TL1_249:
	ta	T_CHANGE_TO_TL1
CHANGE_R26250:
	add	%r26,	%r27,	%r26
NC_BIS_NUC250:
	.word 0xc8a545fa  ! 760: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
	.word 0xc28c903a  ! 762: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
	.word 0xc2cc903a  ! 764: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
BLK_PRI251:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 766: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xc2abd01a  ! 768: STBA_R	stba	%r1, [%r15 + %r26] 0x80
NC_BLK_SEc252:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 770: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc2b4d03a  ! 772: STHA_R	stha	%r1, [%r19 + %r26] 0x81
NC_BIS_NUC253:
	.word 0xccbd44fa  ! 774: STDA_R	stda	%r6, [%r21 + %r26] 0x27
	.word 0xc283901a  ! 776: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r1
	.word 0xc2a4d03a  ! 778: STWA_R	stwa	%r1, [%r19 + %r26] 0x81
CP_NUC254:
	.word 0xc2a5009a  ! 780: STWA_R	stwa	%r1, [%r20 + %r26] 0x04
CP_ATM_QUAD_LD255:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 782: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_AIUS256:
	.word 0xc2a7823a  ! 784: STWA_R	stwa	%r1, [%r30 + %r26] 0x11
NC_NUC257:
	.word 0xc2f5419a  ! 786: STXA_R	stxa	%r1, [%r21 + %r26] 0x0c
NC_PST_PRI258:
	.word 0xc3bb991a  ! 788: STDFA_R	stda	%f1, [%r26, %r14]
NC_NUC259:
	.word 0xc2b5419a  ! 790: STHA_R	stha	%r1, [%r21 + %r26] 0x0c
	.word 0xc2dcd03a  ! 792: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
CP_AIUP260:
	.word 0xc2ae031a  ! 794: STBA_R	stba	%r1, [%r24 + %r26] 0x18
	.word 0xc384501a  ! 796: LDFA_R	lda	[%r17, %r26], %f1
	.word 0xc2dc501a  ! 798: LDXA_R	ldxa	[%r17, %r26] 0x80, %r1
	.word 0xc2d3901a  ! 800: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r1
NC_PST_PRI261:
	.word 0xc3bb981a  ! 802: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc2dc903a  ! 804: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
	.word 0xc0bad11a  ! 805: STDA_R	stda	%r0, [%r11 + %r26] 0x88
NC_BIS_NUC262:
	.word 0xd0a545fa  ! 808: STWA_R	stwa	%r8, [%r21 + %r26] 0x2f
CP_ATM_QUAD_LD263:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 810: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc3ba901a  ! 811: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc28c903a  ! 813: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
	.word 0xc382911a  ! 814: LDFA_R	lda	[%r10, %r26], %f1
	.word 0xc3a2d11a  ! 815: STFA_R	sta	%f1, [%r26, %r11]
	.word 0xc2ccd13a  ! 817: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
NC_AIUS264:
	.word 0xc28fc33a  ! 819: LDUBA_R	lduba	[%r31, %r26] 0x19, %r1
BLK_PRI265:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 821: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc3a3901a  ! 823: STFA_R	sta	%f1, [%r26, %r14]
CP_PST_PRI266:
	.word 0xc3bb189a  ! 825: STDFA_R	stda	%f1, [%r26, %r12]
CP_BIS_AIUS267:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 827: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xc3bc903a  ! 829: STDFA_R	stda	%f1, [%r26, %r18]
CP_AIUP268:
	.word 0xc2ce021a  ! 831: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r1
	.word 0xc0bc903a  ! 833: STDA_R	stda	%r0, [%r18 + %r26] 0x81
NC_AIUS269:
	.word 0xc39fc23a  ! 835: LDDFA_R	ldda	[%r31, %r26], %f1
	.word 0xc2dcd13a  ! 837: LDXA_R	ldxa	[%r19, %r26] 0x89, %r1
	.word 0xc3e2e01a  ! 838: CASA_R	casa	[%r11] %asi, %r26, %r1
SET_TL0_270:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI271:
	.word 0xc4b39c5a  ! 840: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
CHANGE_TLE272:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP274:
	.word 0xc2de421a  ! 843: LDXA_R	ldxa	[%r25, %r26] 0x10, %r1
CP_AIUP275:
	.word 0xc09e031a  ! 845: LDDA_R	ldda	[%r24, %r26] 0x18, %r0
CP_PST_PRI276:
	.word 0xc3ba985a  ! 847: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2b4d13a  ! 849: STHA_R	stha	%r1, [%r19 + %r26] 0x89
	.word 0xc39cd03a  ! 851: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc3a4501a  ! 853: STFA_R	sta	%f1, [%r26, %r17]
NC_BLK_SEc277:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 855: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc2dc913a  ! 857: LDXA_R	ldxa	[%r18, %r26] 0x89, %r1
WR_LEASI_278:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_279:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc28c903a  ! 860: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
	.word 0xc302a024  ! 861: LDF_I	ld	[%r10, 0x0024], %f1
	.word 0xc2ccd13a  ! 863: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
NC_BLK_SEc280:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 865: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc27b2024  ! 866: SWAP_I	swap	%r1, [%r12 + 0x0024]
	.word 0xc323401a  ! 867: STF_R	st	%f1, [%r26, %r13]
NC_BIS_AIUS281:
	.word 0xccafc47a  ! 869: STBA_R	stba	%r6, [%r31 + %r26] 0x23
WR_LEASI_282:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_283:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_TLE284:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV285:
	ta	T_CHANGE_PRIV
CHANGE_R26286:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS286:
	.word 0xc4bfc47a  ! 873: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xc2ccd03a  ! 875: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
CP_AIUS287:
	.word 0xc3a7833a  ! 877: STFA_R	sta	%f1, [%r26, %r30]
NC_BLK_SEc288:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 879: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc2cad05a  ! 880: LDSBA_R	ldsba	[%r11, %r26] 0x82, %r1
NC_SHORT_FP_SEC289:
	.word 0xc39cdb7a  ! 882: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc09cd13a  ! 884: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
CHANGE_USER290:
	ta	T_CHANGE_NONPRIV
CHANGE_R26291:
	add	%r26,	%r27,	%r26
CP_BIS_PRI291:
	and	%r26,	%r28,	%r26
	.word 0xc4b29c5a  ! 886: STHA_R	stha	%r2, [%r10 + %r26] 0xe2
CP_BIS_QUAD_LD292:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 888: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
NC_BIS_SEC293:
	.word 0xc8b4dc7a  ! 890: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
CP_BIS_PRI294:
	and	%r26,	%r28,	%r26
	.word 0xc4a35c5a  ! 892: STWA_R	stwa	%r2, [%r13 + %r26] 0xe2
	.word 0xc303401a  ! 893: LDF_R	ld	[%r13, %r26], %f1
CP_BIS_PRI295:
	and	%r26,	%r28,	%r26
	.word 0xd0f2dd5a  ! 895: STXA_R	stxa	%r8, [%r11 + %r26] 0xea
CP_PST_PRI296:
	.word 0xc3ba981a  ! 897: STDFA_R	stda	%f1, [%r26, %r10]
NC_BIS_PRI297:
	.word 0xd0ab9d5a  ! 899: STBA_R	stba	%r8, [%r14 + %r26] 0xea
NC_BIS_PRI298:
	.word 0xc4f41c5a  ! 901: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
	.word 0xc3a3501a  ! 902: STFA_R	sta	%f1, [%r26, %r13]
CP_PST_PRI299:
	.word 0xc3bb595a  ! 904: STDFA_R	stda	%f1, [%r26, %r13]
CHANGE_PRIV300:
	ta	T_CHANGE_PRIV
CHANGE_R26301:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD301:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 906: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
NC_SHORT_FP_SEC302:
	.word 0xc39cda7a  ! 908: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc09cd03a  ! 910: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc3a4d13a  ! 912: STFA_R	sta	%f1, [%r26, %r19]
	.word 0xc3a3101a  ! 913: STFA_R	sta	%f1, [%r26, %r12]
	.word 0xc2c4d03a  ! 915: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r1
	.word 0xc09c903a  ! 917: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
CP_AIUS303:
	.word 0xc39f823a  ! 919: LDDFA_R	ldda	[%r30, %r26], %f1
	.word 0xc3a2d01a  ! 920: STFA_R	sta	%f1, [%r26, %r11]
NC_BLK_SEc304:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 922: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC305:
	.word 0xc2d5009a  ! 924: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r1
CHANGE_R26306:
	add	%r26,	%r27,	%r26
CP_BIS_SEC306:
	and	%r26,	%r28,	%r26
	.word 0xd0a49d7a  ! 926: STWA_R	stwa	%r8, [%r18 + %r26] 0xeb
	.word 0xc2acd03a  ! 928: STBA_R	stba	%r1, [%r19 + %r26] 0x81
	.word 0xc284501a  ! 930: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r1
CP_AIUP307:
	.word 0xc2ce021a  ! 932: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r1
CHANGE_R26308:
	add	%r26,	%r27,	%r26
CP_BIS_SEC308:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 934: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xc3bcd13a  ! 936: STDFA_R	stda	%f1, [%r26, %r19]
CP_AIUP309:
	.word 0xc386021a  ! 938: LDFA_R	lda	[%r24, %r26], %f1
NC_PST_PRI310:
	.word 0xc3bb981a  ! 940: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc28c101a  ! 942: LDUBA_R	lduba	[%r16, %r26] 0x80, %r1
CP_ATM_QUAD_LD311:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 944: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
NC_BIS_AIUS312:
	.word 0xc4f7c57a  ! 946: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xc2dc903a  ! 948: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
CHANGE_USER313:
	ta	T_CHANGE_NONPRIV
CHANGE_R26314:
	add	%r26,	%r27,	%r26
CP_BIS_PRI314:
	and	%r26,	%r28,	%r26
	.word 0xd09b5c5a  ! 950: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xc284d03a  ! 952: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
WR_LEASI_315:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_316:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS318:
	.word 0xc2cfc23a  ! 955: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r1
	.word 0xc27a801a  ! 956: SWAP_R	swap	%r1, [%r10 + %r26]
	.word 0xc3e3601a  ! 957: CASA_R	casa	[%r13] %asi, %r26, %r1
CHANGE_USER319:
	ta	T_CHANGE_NONPRIV
CHANGE_R26320:
	mov	%g0,	%r26
CP_BIS_PRI320:
	and	%r26,	%r28,	%r26
	.word 0xd09b1c5a  ! 959: LDDA_R	ldda	[%r12, %r26] 0xe2, %r8
	.word 0xc3a4903a  ! 961: STFA_R	sta	%f1, [%r26, %r18]
CHANGE_CLE321:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc28ad01a  ! 963: LDUBA_R	lduba	[%r11, %r26] 0x80, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC323:
	.word 0xc0bd009a  ! 965: STDA_R	stda	%r0, [%r20 + %r26] 0x04
	.word 0xc384d13a  ! 967: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc09cd13a  ! 969: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
	.word 0xc28c913a  ! 971: LDUBA_R	lduba	[%r18, %r26] 0x89, %r1
CP_PST_PRI324:
	.word 0xc3bad81a  ! 973: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc3a3911a  ! 975: STFA_R	sta	%f1, [%r26, %r14]
CP_BIS_NUC325:
	and	%r26,	%r28,	%r26
	.word 0xc8bd05fa  ! 977: STDA_R	stda	%r4, [%r20 + %r26] 0x2f
CP_BIS_AIUS326:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 979: STBA_R	stba	%r2, [%r30 + %r26] 0x23
CP_BIS_QUAD_LD327:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 981: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xc33a801a  ! 982: STDF_R	std	%f1, [%r26, %r10]
CP_NUC328:
	.word 0xc2ad009a  ! 984: STBA_R	stba	%r1, [%r20 + %r26] 0x04
	.word 0xc3a4913a  ! 986: STFA_R	sta	%f1, [%r26, %r18]
CHANGE_USER329:
	ta	T_CHANGE_NONPRIV
CHANGE_R26330:
	add	%r26,	%r27,	%r26
NC_BIS_PRI330:
	.word 0xccf39c5a  ! 988: STXA_R	stxa	%r6, [%r14 + %r26] 0xe2
CHANGE_PRIV331:
	ta	T_CHANGE_PRIV
CHANGE_R26332:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP332:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 990: STBA_R	stba	%r4, [%r24 + %r26] 0x22
CP_AIUP333:
	.word 0xc2de021a  ! 992: LDXA_R	ldxa	[%r24, %r26] 0x10, %r1
	.word 0xc39a915a  ! 993: LDDFA_R	ldda	[%r10, %r26], %f1
	.word 0xc39b901a  ! 995: LDDFA_R	ldda	[%r14, %r26], %f1
CP_BIS_NUC334:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 997: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
NC_PST_PRI335:
	.word 0xc3bb999a  ! 999: STDFA_R	stda	%f1, [%r26, %r14]
NC_AIUP336:
	.word 0xc386421a  ! 1001: LDFA_R	lda	[%r25, %r26], %f1
NC_BIS_SEC337:
	.word 0xc4f4dc7a  ! 1003: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xc3a4d13a  ! 1005: STFA_R	sta	%f1, [%r26, %r19]
	.word 0xc2dc903a  ! 1007: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
	.word 0xc2d4d03a  ! 1009: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc2db901a  ! 1011: LDXA_R	ldxa	[%r14, %r26] 0x80, %r1
NC_AIUP338:
	.word 0xc09e421a  ! 1013: LDDA_R	ldda	[%r25, %r26] 0x10, %r0
	.word 0xc2ccd13a  ! 1015: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
BLK_PRI339:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1017: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc2c4511a  ! 1019: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r1
CHANGE_R26340:
	add	%r26,	%r27,	%r26
CP_BIS_SEC340:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1021: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
NC_BIS_AIUS341:
	.word 0xc4b7c47a  ! 1023: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xc2ac903a  ! 1025: STBA_R	stba	%r1, [%r18 + %r26] 0x81
NC_BIS_AIUS342:
	.word 0xc4a7c47a  ! 1027: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
NC_PST_PRI343:
	.word 0xc3bb981a  ! 1029: STDFA_R	stda	%f1, [%r26, %r14]
NC_AIUP344:
	.word 0xc2a6431a  ! 1031: STWA_R	stwa	%r1, [%r25 + %r26] 0x18
CP_BIS_AIUS345:
	and	%r26,	%r28,	%r26
	.word 0xc4bf857a  ! 1033: STDA_R	stda	%r2, [%r30 + %r26] 0x2b
	.word 0xc39c903a  ! 1035: LDDFA_R	ldda	[%r18, %r26], %f1
CHANGE_USER346:
	ta	T_CHANGE_NONPRIV
CHANGE_R26347:
	add	%r26,	%r27,	%r26
NC_BIS_PRI347:
	.word 0xcca41c5a  ! 1037: STWA_R	stwa	%r6, [%r16 + %r26] 0xe2
CHANGE_PRIV348:
	ta	T_CHANGE_PRIV
CHANGE_R26349:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP349:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 1039: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
	.word 0xc39cd13a  ! 1041: LDDFA_R	ldda	[%r19, %r26], %f1
CP_PST_PRI350:
	.word 0xc3bad99a  ! 1043: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc2d4d13a  ! 1045: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
CP_AIUS351:
	.word 0xc287833a  ! 1047: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r1
CP_BIS_AIUS352:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 1049: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
CP_AIUS353:
	.word 0xc28f823a  ! 1051: LDUBA_R	lduba	[%r30, %r26] 0x11, %r1
	.word 0xc01b2020  ! 1052: LDD_I	ldd	[%r12 + 0x0020], %r0
NC_BIS_AIUS354:
	.word 0xc4afc57a  ! 1054: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xc2f4d03a  ! 1056: STXA_R	stxa	%r1, [%r19 + %r26] 0x81
	.word 0xc2d3d01a  ! 1058: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r1
CP_BIS_NUC355:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1060: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
CP_BIS_NUC356:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 1062: STHA_R	stha	%r4, [%r20 + %r26] 0x27
CP_BIS_AIUP357:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 1064: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
NC_AIUP358:
	.word 0xc3a6421a  ! 1066: STFA_R	sta	%f1, [%r26, %r25]
	.word 0xc28b115a  ! 1067: LDUBA_R	lduba	[%r12, %r26] 0x8a, %r1
CP_PST_PRI359:
	.word 0xc3ba985a  ! 1069: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2dcd03a  ! 1071: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
BLK_PRI360:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 1073: STDFA_R	stda	%f0, [%r26, %r12]
CP_ATM_QUAD_LD361:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 1075: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
NC_PST_PRI362:
	.word 0xc3bc199a  ! 1077: STDFA_R	stda	%f1, [%r26, %r16]
NC_BIS_SEC363:
	.word 0xc4bcdd7a  ! 1079: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
NC_NUC364:
	.word 0xc2d5409a  ! 1081: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r1
	.word 0xc22b401a  ! 1082: STB_R	stb	%r1, [%r13 + %r26]
	.word 0xc2ccd03a  ! 1084: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
	.word 0xc3bc111a  ! 1086: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc3a2901a  ! 1087: STFA_R	sta	%f1, [%r26, %r10]
CP_AIUP365:
	.word 0xc3be021a  ! 1089: STDFA_R	stda	%f1, [%r26, %r24]
	.word 0xc2a4903a  ! 1091: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
	.word 0xc31aa020  ! 1092: LDDF_I	ldd	[%r10, 0x0020], %f1
NC_PST_PRI366:
	.word 0xc3bb999a  ! 1094: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc0bc111a  ! 1096: STDA_R	stda	%r0, [%r16 + %r26] 0x88
WR_LEASI_367:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_368:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP369:
	.word 0xc2a6431a  ! 1099: STWA_R	stwa	%r1, [%r25 + %r26] 0x18
CHANGE_R26370:
	add	%r26,	%r27,	%r26
CP_BIS_SEC370:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 1101: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
	.word 0xc3bb511a  ! 1102: STDFA_R	stda	%f1, [%r26, %r13]
NC_PST_PRI371:
	.word 0xc3bb991a  ! 1104: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc2d4d03a  ! 1106: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc2cc903a  ! 1108: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	.word 0xc322c01a  ! 1109: STF_R	st	%f1, [%r26, %r11]
NC_BIS_SEC372:
	.word 0xd0b4dd7a  ! 1111: STHA_R	stha	%r8, [%r19 + %r26] 0xeb
CHANGE_USER373:
	ta	T_CHANGE_NONPRIV
CHANGE_R26374:
	mov	%g0,	%r26
NC_BIS_PRI374:
	.word 0xccbbdc5a  ! 1113: STDA_R	stda	%r6, [%r15 + %r26] 0xe2
	.word 0xc2d3911a  ! 1115: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r1
	.word 0xc28b911a  ! 1117: LDUBA_R	lduba	[%r14, %r26] 0x88, %r1
	.word 0xc283901a  ! 1119: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r1
NC_PST_PRI375:
	.word 0xc3bbd89a  ! 1121: STDFA_R	stda	%f1, [%r26, %r15]
CHANGE_PRIV376:
	ta	T_CHANGE_PRIV
CHANGE_R26377:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP377:
	.word 0xc4f6455a  ! 1123: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xc39ad15a  ! 1124: LDDFA_R	ldda	[%r11, %r26], %f1
	.word 0xc09cd03a  ! 1126: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc202a024  ! 1127: LDUW_I	lduw	[%r10 + 0x0024], %r1
NC_AIUP378:
	.word 0xc2ae421a  ! 1129: STBA_R	stba	%r1, [%r25 + %r26] 0x10
CP_AIUS379:
	.word 0xc0bf833a  ! 1131: STDA_R	stda	%r0, [%r30 + %r26] 0x19
	.word 0xc2b4d03a  ! 1133: STHA_R	stha	%r1, [%r19 + %r26] 0x81
	.word 0xc3e3601a  ! 1134: CASA_R	casa	[%r13] %asi, %r26, %r1
	.word 0xc2dc913a  ! 1136: LDXA_R	ldxa	[%r18, %r26] 0x89, %r1
	.word 0xc2dc903a  ! 1138: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
	.word 0xc2b4d03a  ! 1140: STHA_R	stha	%r1, [%r19 + %r26] 0x81
	.word 0xc09cd03a  ! 1142: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc294903a  ! 1144: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
	.word 0xc09c903a  ! 1146: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
NC_AIUS380:
	.word 0xc287c23a  ! 1148: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r1
	.word 0xc2fad01a  ! 1149: SWAPA_R	swapa	%r1, [%r11 + %r26] 0x80
CP_NUC381:
	.word 0xc2c5009a  ! 1151: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r1
CHANGE_USER382:
	ta	T_CHANGE_NONPRIV
CHANGE_R26383:
	add	%r26,	%r27,	%r26
NC_BIS_PRI383:
	.word 0xc4f39d5a  ! 1153: STXA_R	stxa	%r2, [%r14 + %r26] 0xea
NC_BIS_PRI384:
	.word 0xd0bc5c5a  ! 1155: STDA_R	stda	%r8, [%r17 + %r26] 0xe2
	.word 0xc2a2901a  ! 1156: STWA_R	stwa	%r1, [%r10 + %r26] 0x80
	.word 0xc2a3501a  ! 1157: STWA_R	stwa	%r1, [%r13 + %r26] 0x80
CHANGE_PRIV385:
	ta	T_CHANGE_PRIV
CHANGE_R26386:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP386:
	.word 0xc4f6455a  ! 1159: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xc2b4903a  ! 1161: STHA_R	stha	%r1, [%r18 + %r26] 0x81
SET_TL1_387:
	ta	T_CHANGE_TO_TL1
CHANGE_R26388:
	add	%r26,	%r27,	%r26
NC_BIS_NUC388:
	.word 0xc4f544fa  ! 1163: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CHANGE_R26389:
	add	%r26,	%r27,	%r26
CP_BIS_SEC389:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 1165: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
	.word 0xc3a3511a  ! 1166: STFA_R	sta	%f1, [%r26, %r13]
	.word 0xc3a3901a  ! 1168: STFA_R	sta	%f1, [%r26, %r14]
NC_AIUS390:
	.word 0xc2cfc23a  ! 1170: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r1
	.word 0xc2f4101a  ! 1172: STXA_R	stxa	%r1, [%r16 + %r26] 0x80
SET_TL0_391:
	ta	T_CHANGE_TO_TL0
CHANGE_R26392:
	add	%r26,	%r27,	%r26
NC_BIS_SEC392:
	.word 0xcca4dc7a  ! 1174: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xc2aa901a  ! 1175: STBA_R	stba	%r1, [%r10 + %r26] 0x80
	.word 0xc2ac903a  ! 1177: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc39b115a  ! 1178: LDDFA_R	ldda	[%r12, %r26], %f1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC394:
	.word 0xc295409a  ! 1180: LDUHA_R	lduha	[%r21, %r26] 0x04, %r1
NC_AIUP395:
	.word 0xc2b6421a  ! 1182: STHA_R	stha	%r1, [%r25 + %r26] 0x10
	.word 0xc39cd03a  ! 1184: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc3a4903a  ! 1186: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc2d4d13a  ! 1188: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
	.word 0xc2aa901a  ! 1189: STBA_R	stba	%r1, [%r10 + %r26] 0x80
NC_AIUP396:
	.word 0xc2de431a  ! 1191: LDXA_R	ldxa	[%r25, %r26] 0x18, %r1
	.word 0xc384d03a  ! 1193: LDFA_R	lda	[%r19, %r26], %f1
CP_BIS_NUC397:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 1195: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
	.word 0xc2336026  ! 1196: STH_I	sth	%r1, [%r13 + 0x0026]
WR_LEASI_398:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_399:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2ac101a  ! 1199: STBA_R	stba	%r1, [%r16 + %r26] 0x80
CP_ATM_QUAD_LD400:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 1201: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
SHORT_FP_PRI401:
	.word 0xc39a9a1a  ! 1203: LDDFA_R	ldda	[%r10, %r26], %f1
NC_BIS_AIUS402:
	.word 0xcca7c47a  ! 1205: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
BLK_PRI403:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 1207: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc384903a  ! 1209: LDFA_R	lda	[%r18, %r26], %f1
NC_BIS_AIUP404:
	.word 0xc4be445a  ! 1211: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xc2a4913a  ! 1213: STWA_R	stwa	%r1, [%r18 + %r26] 0x89
	.word 0xc33b2020  ! 1214: STDF_I	std	%f1, [0x0020, %r12]
	.word 0xc39cd13a  ! 1216: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc323001a  ! 1217: STF_R	st	%f1, [%r26, %r12]
CP_BIS_AIUP405:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1219: STHA_R	stha	%r6, [%r24 + %r26] 0x22
CP_AIUS406:
	.word 0xc2b7823a  ! 1221: STHA_R	stha	%r1, [%r30 + %r26] 0x11
	.word 0xc09a905a  ! 1222: LDDA_R	ldda	[%r10, %r26] 0x82, %r0
	.word 0xc3a4903a  ! 1224: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc2dcd03a  ! 1226: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
	.word 0xc2d4903a  ! 1228: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
	.word 0xc22b6027  ! 1229: STB_I	stb	%r1, [%r13 + 0x0027]
CHANGE_USER407:
	ta	T_CHANGE_NONPRIV
CHANGE_R26408:
	mov	%g0,	%r26
NC_BIS_PRI408:
	.word 0xc8ab9d5a  ! 1231: STBA_R	stba	%r4, [%r14 + %r26] 0xea
	.word 0xc39a905a  ! 1232: LDDFA_R	ldda	[%r10, %r26], %f1
CHANGE_PRIV409:
	ta	T_CHANGE_PRIV
CHANGE_R26410:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP410:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1234: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xc39b911a  ! 1236: LDDFA_R	ldda	[%r14, %r26], %f1
CP_BIS_AIUS411:
	and	%r26,	%r28,	%r26
	.word 0xd0b7847a  ! 1238: STHA_R	stha	%r8, [%r30 + %r26] 0x23
	.word 0xc33aa020  ! 1239: STDF_I	std	%f1, [0x0020, %r10]
	.word 0xc28c101a  ! 1241: LDUBA_R	lduba	[%r16, %r26] 0x80, %r1
CP_AIUS412:
	.word 0xc2cf833a  ! 1243: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r1
BLK_PRI413:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1245: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc3a4903a  ! 1247: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc2fa901a  ! 1248: SWAPA_R	swapa	%r1, [%r10 + %r26] 0x80
CP_AIUP414:
	.word 0xc296021a  ! 1250: LDUHA_R	lduha	[%r24, %r26] 0x10, %r1
	.word 0xc2a4d13a  ! 1252: STWA_R	stwa	%r1, [%r19 + %r26] 0x89
	.word 0xc293901a  ! 1254: LDUHA_R	lduha	[%r14, %r26] 0x80, %r1
CP_BIS_AIUP415:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1256: STHA_R	stha	%r6, [%r24 + %r26] 0x22
CP_PST_PRI416:
	.word 0xc3bad81a  ! 1258: STDFA_R	stda	%f1, [%r26, %r11]
CP_BIS_QUAD_LD417:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 1260: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
CP_BIS_AIUP418:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1262: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xc39cd13a  ! 1264: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc0bcd13a  ! 1266: STDA_R	stda	%r0, [%r19 + %r26] 0x89
CP_PST_PRI419:
	.word 0xc3bb185a  ! 1268: STDFA_R	stda	%f1, [%r26, %r12]
CP_BIS_AIUP420:
	and	%r26,	%r28,	%r26
	.word 0xd0be055a  ! 1270: STDA_R	stda	%r8, [%r24 + %r26] 0x2a
CHANGE_R26421:
	add	%r26,	%r27,	%r26
CP_BIS_SEC421:
	and	%r26,	%r28,	%r26
	.word 0xc8a49c7a  ! 1272: STWA_R	stwa	%r4, [%r18 + %r26] 0xe3
	.word 0xc2a4d03a  ! 1274: STWA_R	stwa	%r1, [%r19 + %r26] 0x81
CP_BIS_AIUS422:
	and	%r26,	%r28,	%r26
	.word 0xd0bf847a  ! 1276: STDA_R	stda	%r8, [%r30 + %r26] 0x23
	.word 0xc3a4d03a  ! 1278: STFA_R	sta	%f1, [%r26, %r19]
	.word 0xc5ef9f1a  ! 1280: PREFETCHA_R	prefetcha	[%r30, %r26] 0xf8, #n_writes
	.word 0xc2f4501a  ! 1282: STXA_R	stxa	%r1, [%r17 + %r26] 0x80
CP_BIS_AIUP423:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 1284: STDA_R	stda	%r6, [%r24 + %r26] 0x22
NC_BIS_SEC424:
	.word 0xd0bcdd7a  ! 1286: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
WR_LEASI_425:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_426:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2cb901a  ! 1289: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r1
NC_AIUS427:
	.word 0xc2a7c33a  ! 1291: STWA_R	stwa	%r1, [%r31 + %r26] 0x19
	.word 0xc3bc501a  ! 1293: STDFA_R	stda	%f1, [%r26, %r17]
WR_LEASI_428:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_429:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BIS_AIUS430:
	.word 0xc4f7c47a  ! 1296: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_AIUP431:
	.word 0xc2d6421a  ! 1298: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r1
NC_AIUS432:
	.word 0xc2c7c23a  ! 1300: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r1
	.word 0xc382905a  ! 1301: LDFA_R	lda	[%r10, %r26], %f1
CHANGE_USER433:
	ta	T_CHANGE_NONPRIV
CHANGE_R26434:
	add	%r26,	%r27,	%r26
CP_BIS_PRI434:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1303: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
CHANGE_R26435:
	add	%r26,	%r27,	%r26
CP_BIS_SEC435:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1305: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xc2eb511a  ! 1306: LDSTUBA_R	ldstuba	%r1, [%r13 + %r26] 0x88
	.word 0xc3032024  ! 1307: LDF_I	ld	[%r12, 0x0024], %f1
CP_BIS_PRI436:
	and	%r26,	%r28,	%r26
	.word 0xc89b1c5a  ! 1309: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC438:
	.word 0xc385009a  ! 1311: LDFA_R	lda	[%r20, %r26], %f1
CHANGE_USER439:
	ta	T_CHANGE_NONPRIV
CHANGE_R26440:
	add	%r26,	%r27,	%r26
CP_BIS_PRI440:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 1313: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xc322801a  ! 1314: STF_R	st	%f1, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP442:
	.word 0xc386421a  ! 1316: LDFA_R	lda	[%r25, %r26], %f1
	.word 0xc294903a  ! 1318: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
	.word 0xc0bc903a  ! 1320: STDA_R	stda	%r0, [%r18 + %r26] 0x81
CP_AIUP443:
	.word 0xc2f6021a  ! 1322: STXA_R	stxa	%r1, [%r24 + %r26] 0x10
	.word 0xc294913a  ! 1324: LDUHA_R	lduha	[%r18, %r26] 0x89, %r1
CHANGE_USER444:
	ta	T_CHANGE_NONPRIV
CHANGE_R26445:
	mov	%g0,	%r26
CP_BIS_PRI445:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 1326: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CP_BIS_PRI446:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1328: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	.word 0xc284903a  ! 1330: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
NC_BIS_PRI447:
	.word 0xc8bc1c5a  ! 1332: STDA_R	stda	%r4, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC449:
	.word 0xc3bd019a  ! 1334: STDFA_R	stda	%f1, [%r26, %r20]
	.word 0xc28cd03a  ! 1336: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
	.word 0xc384903a  ! 1338: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc2d4903a  ! 1340: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
CP_AIUP450:
	.word 0xc2b6021a  ! 1342: STHA_R	stha	%r1, [%r24 + %r26] 0x10
	.word 0xc384d03a  ! 1344: LDFA_R	lda	[%r19, %r26], %f1
CP_AIUP451:
	.word 0xc39e021a  ! 1346: LDDFA_R	ldda	[%r24, %r26], %f1
CP_BIS_AIUP452:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 1348: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CP_AIUS453:
	.word 0xc2f7823a  ! 1350: STXA_R	stxa	%r1, [%r30 + %r26] 0x11
	.word 0xc3ba901a  ! 1351: STDFA_R	stda	%f1, [%r26, %r10]
NC_BIS_SEC454:
	.word 0xc4acdd7a  ! 1353: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xc2f3911a  ! 1355: STXA_R	stxa	%r1, [%r14 + %r26] 0x88
	.word 0xc39c101a  ! 1357: LDDFA_R	ldda	[%r16, %r26], %f1
NC_AIUP455:
	.word 0xc3a6421a  ! 1359: STFA_R	sta	%f1, [%r26, %r25]
SHORT_FP_PRI456:
	.word 0xc39a9b1a  ! 1361: LDDFA_R	ldda	[%r10, %r26], %f1
CP_AIUP457:
	.word 0xc2ae021a  ! 1363: STBA_R	stba	%r1, [%r24 + %r26] 0x10
CP_BIS_NUC458:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 1365: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
	.word 0xc3f3201a  ! 1366: CASXA_R	casxa	[%r12]%asi, %r26, %r1
	.word 0xc39cd03a  ! 1368: LDDFA_R	ldda	[%r19, %r26], %f1
NC_BIS_AIUS459:
	.word 0xccb7c47a  ! 1370: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xc27b2024  ! 1371: SWAP_I	swap	%r1, [%r12 + 0x0024]
NC_PST_PRI460:
	.word 0xc3bbd95a  ! 1373: STDFA_R	stda	%f1, [%r26, %r15]
CHANGE_R26461:
	add	%r26,	%r27,	%r26
CP_BIS_SEC461:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 1375: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
CHANGE_USER462:
	ta	T_CHANGE_NONPRIV
CHANGE_R26463:
	add	%r26,	%r27,	%r26
CP_BIS_PRI463:
	and	%r26,	%r28,	%r26
	.word 0xc49a9d5a  ! 1377: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xc2acd13a  ! 1379: STBA_R	stba	%r1, [%r19 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP465:
	.word 0xc2b6421a  ! 1381: STHA_R	stha	%r1, [%r25 + %r26] 0x10
CHANGE_R26466:
	add	%r26,	%r27,	%r26
CP_BIS_SEC466:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1383: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
NC_NUC467:
	.word 0xc2b5409a  ! 1385: STHA_R	stha	%r1, [%r21 + %r26] 0x04
NC_AIUS468:
	.word 0xc2c7c23a  ! 1387: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r1
CP_PST_PRI469:
	.word 0xc3bb581a  ! 1389: STDFA_R	stda	%f1, [%r26, %r13]
NC_AIUS470:
	.word 0xc2dfc23a  ! 1391: LDXA_R	ldxa	[%r31, %r26] 0x11, %r1
CP_BIS_QUAD_LD471:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 1393: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xc26b401a  ! 1394: LDSTUB_R	ldstub	%r1, [%r13 + %r26]
	.word 0xc3bad01a  ! 1395: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc2f4501a  ! 1397: STXA_R	stxa	%r1, [%r17 + %r26] 0x80
	.word 0xc33ac01a  ! 1398: STDF_R	std	%f1, [%r26, %r11]
BLK_PRI472:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 1400: STDFA_R	stda	%f16, [%r26, %r11]
SHORT_FP_PRI473:
	.word 0xc39ada1a  ! 1402: LDDFA_R	ldda	[%r11, %r26], %f1
	.word 0xc323001a  ! 1403: STF_R	st	%f1, [%r26, %r12]
CP_BIS_AIUP474:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 1405: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
CHANGE_USER475:
	ta	T_CHANGE_NONPRIV
CHANGE_R26476:
	add	%r26,	%r27,	%r26
NC_BIS_PRI476:
	.word 0xc4a3dc5a  ! 1407: STWA_R	stwa	%r2, [%r15 + %r26] 0xe2
	.word 0xc2ea901a  ! 1408: LDSTUBA_R	ldstuba	%r1, [%r10 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP478:
	.word 0xc386431a  ! 1410: LDFA_R	lda	[%r25, %r26], %f1
	.word 0xc2ab901a  ! 1412: STBA_R	stba	%r1, [%r14 + %r26] 0x80
CHANGE_USER479:
	ta	T_CHANGE_NONPRIV
CHANGE_R26480:
	mov	%g0,	%r26
NC_BIS_PRI480:
	.word 0xccb39d5a  ! 1414: STHA_R	stha	%r6, [%r14 + %r26] 0xea
	.word 0xc283901a  ! 1416: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r1
	.word 0xc383105a  ! 1417: LDFA_R	lda	[%r12, %r26], %f1
CHANGE_PRIV481:
	ta	T_CHANGE_PRIV
CHANGE_R26482:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP482:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 1419: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xc2cb901a  ! 1421: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r1
	.word 0xc3a3501a  ! 1422: STFA_R	sta	%f1, [%r26, %r13]
WR_LEASI_483:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_484:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_NUC485:
	.word 0xc0bd019a  ! 1425: STDA_R	stda	%r0, [%r20 + %r26] 0x0c
	.word 0xc232c01a  ! 1426: STH_R	sth	%r1, [%r11 + %r26]
	.word 0xc322c01a  ! 1427: STF_R	st	%f1, [%r26, %r11]
CP_AIUS486:
	.word 0xc2f7833a  ! 1429: STXA_R	stxa	%r1, [%r30 + %r26] 0x19
SHORT_FP_PRI487:
	.word 0xc39a9a1a  ! 1431: LDDFA_R	ldda	[%r10, %r26], %f1
CP_BIS_AIUP488:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 1433: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xc2fad11a  ! 1434: SWAPA_R	swapa	%r1, [%r11 + %r26] 0x88
CP_BIS_NUC489:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 1436: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
NC_NUC490:
	.word 0xc2a5409a  ! 1438: STWA_R	stwa	%r1, [%r21 + %r26] 0x04
CP_BIS_AIUP491:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1440: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
CP_BIS_NUC492:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 1442: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
	.word 0xc2d4d03a  ! 1444: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
CP_BIS_AIUP493:
	and	%r26,	%r28,	%r26
	.word 0xd0be045a  ! 1446: STDA_R	stda	%r8, [%r24 + %r26] 0x22
CP_BIS_NUC494:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1448: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
CP_ATM_QUAD_LD495:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1450: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xc2b4d03a  ! 1452: STHA_R	stha	%r1, [%r19 + %r26] 0x81
	.word 0xc28b901a  ! 1454: LDUBA_R	lduba	[%r14, %r26] 0x80, %r1
	.word 0xc0bcd03a  ! 1456: STDA_R	stda	%r0, [%r19 + %r26] 0x81
NC_BIS_AIUP496:
	.word 0xc4a6445a  ! 1458: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xc2aa901a  ! 1459: STBA_R	stba	%r1, [%r10 + %r26] 0x80
CP_ATM_QUAD_LD497:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 1461: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
	.word 0xc20b2027  ! 1462: LDUB_I	ldub	[%r12 + 0x0027], %r1
CP_BIS_QUAD_LD498:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1464: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc2b4d13a  ! 1466: STHA_R	stha	%r1, [%r19 + %r26] 0x89
	.word 0xc39a905a  ! 1467: LDDFA_R	ldda	[%r10, %r26], %f1
SHORT_FP_PRI499:
	.word 0xc39b1b5a  ! 1469: LDDFA_R	ldda	[%r12, %r26], %f1
NC_BIS_AIUS500:
	.word 0xccafc57a  ! 1471: STBA_R	stba	%r6, [%r31 + %r26] 0x2b
NC_BIS_AIUP501:
	.word 0xc4be445a  ! 1473: STDA_R	stda	%r2, [%r25 + %r26] 0x22
WR_LEASI_502:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_503:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_NUC504:
	.word 0xc2c5419a  ! 1476: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r1
	.word 0xc382d11a  ! 1477: LDFA_R	lda	[%r11, %r26], %f1
NC_SHORT_FP_SEC505:
	.word 0xc3bcda3a  ! 1479: STDFA_R	stda	%f1, [%r26, %r19]
	.word 0xc26b6027  ! 1480: LDSTUB_I	ldstub	%r1, [%r13 + 0x0027]
	.word 0xc2d4913a  ! 1482: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r1
	.word 0xc242a024  ! 1483: LDSW_I	ldsw	[%r10 + 0x0024], %r1
NC_BLK_SEc506:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1485: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc2d4903a  ! 1487: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
CP_AIUP507:
	.word 0xc286031a  ! 1489: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r1
CP_NUC508:
	.word 0xc3f5201a  ! 1491: CASXA_R	casxa	[%r20]%asi, %r26, %r1
CP_AIUP509:
	.word 0xc296021a  ! 1493: LDUHA_R	lduha	[%r24, %r26] 0x10, %r1
	.word 0xc284d03a  ! 1495: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
CP_BIS_AIUS510:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 1497: STDA_R	stda	%r2, [%r30 + %r26] 0x23
NC_BIS_AIUP511:
	.word 0xc4ae445a  ! 1499: STBA_R	stba	%r2, [%r25 + %r26] 0x22
CP_BIS_NUC512:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1501: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xc1ef907a  ! 1503: PREFETCHA_R	prefetcha	[%r30, %r26] 0x83, #n_reads
CP_NUC513:
	.word 0xc2cd009a  ! 1505: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r1
	.word 0xc3bb101a  ! 1506: STDFA_R	stda	%f1, [%r26, %r12]
NC_BIS_AIUS514:
	.word 0xc4a7c57a  ! 1508: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
CP_AIUS515:
	.word 0xc2df823a  ! 1510: LDXA_R	ldxa	[%r30, %r26] 0x11, %r1
CHANGE_CLE516:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc2f3901a  ! 1513: STXA_R	stxa	%r1, [%r14 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS518:
	.word 0xc39fc23a  ! 1515: LDDFA_R	ldda	[%r31, %r26], %f1
CHANGE_R26519:
	add	%r26,	%r27,	%r26
CP_BIS_SEC519:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 1517: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xc3bc903a  ! 1519: STDFA_R	stda	%f1, [%r26, %r18]
	.word 0xc33b001a  ! 1520: STDF_R	std	%f1, [%r26, %r12]
SHORT_FP_PRI520:
	.word 0xc3ba9a5a  ! 1522: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2b3101a  ! 1523: STHA_R	stha	%r1, [%r12 + %r26] 0x80
NC_AIUS521:
	.word 0xc2afc33a  ! 1525: STBA_R	stba	%r1, [%r31 + %r26] 0x19
	.word 0xc0bc903a  ! 1527: STDA_R	stda	%r0, [%r18 + %r26] 0x81
	.word 0xc2f4d13a  ! 1529: STXA_R	stxa	%r1, [%r19 + %r26] 0x89
	.word 0xc2c3911a  ! 1531: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r1
	.word 0xc2ac903a  ! 1533: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc2eb101a  ! 1534: LDSTUBA_R	ldstuba	%r1, [%r12 + %r26] 0x80
CP_BIS_AIUP522:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1536: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xc39cd03a  ! 1538: LDDFA_R	ldda	[%r19, %r26], %f1
SHORT_FP_PRI523:
	.word 0xc3bb5a1a  ! 1540: STDFA_R	stda	%f1, [%r26, %r13]
	.word 0xc27b401a  ! 1541: SWAP_R	swap	%r1, [%r13 + %r26]
SET_TL1_524:
	ta	T_CHANGE_TO_TL1
CHANGE_R26525:
	add	%r26,	%r27,	%r26
NC_BIS_NUC525:
	.word 0xc4a545fa  ! 1543: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc2d4d13a  ! 1545: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
SET_TL0_526:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI527:
	and	%r26,	%r28,	%r26
	.word 0xd0ba9c5a  ! 1547: STDA_R	stda	%r8, [%r10 + %r26] 0xe2
SHORT_FP_PRI528:
	.word 0xc3bada1a  ! 1549: STDFA_R	stda	%f1, [%r26, %r11]
SHORT_FP_PRI529:
	.word 0xc39a9a5a  ! 1551: LDDFA_R	ldda	[%r10, %r26], %f1
	.word 0xc3bcd03a  ! 1553: STDFA_R	stda	%f1, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC531:
	.word 0xc2d5019a  ! 1555: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r1
	.word 0xc2aa901a  ! 1556: STBA_R	stba	%r1, [%r10 + %r26] 0x80
CP_BIS_NUC532:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1558: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
CP_NUC533:
	.word 0xc2fd009a  ! 1560: SWAPA_R	swapa	%r1, [%r20 + %r26] 0x04
SHORT_FP_PRI534:
	.word 0xc39a9a1a  ! 1562: LDDFA_R	ldda	[%r10, %r26], %f1
	.word 0xc284d03a  ! 1564: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
NC_BIS_AIUP535:
	.word 0xc4ae455a  ! 1566: STBA_R	stba	%r2, [%r25 + %r26] 0x2a
NC_PST_PRI536:
	.word 0xc3bbd85a  ! 1568: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc3ba901a  ! 1569: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2fb111a  ! 1570: SWAPA_R	swapa	%r1, [%r12 + %r26] 0x88
NC_BIS_AIUP537:
	.word 0xc4ae455a  ! 1572: STBA_R	stba	%r2, [%r25 + %r26] 0x2a
	.word 0xc2ab901a  ! 1574: STBA_R	stba	%r1, [%r14 + %r26] 0x80
NC_BLK_SEc538:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1576: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_AIUP539:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 1578: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xc294903a  ! 1580: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
CP_ATM_QUAD_LD540:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1582: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_PST_PRI541:
	.word 0xc3bc195a  ! 1584: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc28c903a  ! 1586: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
NC_AIUS542:
	.word 0xc0bfc23a  ! 1588: STDA_R	stda	%r0, [%r31 + %r26] 0x11
	.word 0xc2f4101a  ! 1590: STXA_R	stxa	%r1, [%r16 + %r26] 0x80
	.word 0xc2ccd03a  ! 1592: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
CHANGE_USER543:
	ta	T_CHANGE_NONPRIV
CHANGE_R26544:
	add	%r26,	%r27,	%r26
CP_BIS_PRI544:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 1594: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xc27ac01a  ! 1595: SWAP_R	swap	%r1, [%r11 + %r26]
CP_BIS_QUAD_LD545:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 1597: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
BLK_PRI546:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1599: LDDFA_R	ldda	[%r10, %r26], %f0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP548:
	.word 0xc09e031a  ! 1601: LDDA_R	ldda	[%r24, %r26] 0x18, %r0
CP_BIS_QUAD_LD549:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1d5a  ! 1603: LDDA_R	ldda	[%r12, %r26] 0xea, %r6
	.word 0xc2ac903a  ! 1605: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc28c903a  ! 1607: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
CP_AIUP550:
	.word 0xc2c6021a  ! 1609: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r1
	.word 0xc3bc903a  ! 1611: STDFA_R	stda	%f1, [%r26, %r18]
CHANGE_USER551:
	ta	T_CHANGE_NONPRIV
CHANGE_R26552:
	mov	%g0,	%r26
CP_BIS_PRI552:
	and	%r26,	%r28,	%r26
	.word 0xcca35c5a  ! 1613: STWA_R	stwa	%r6, [%r13 + %r26] 0xe2
CHANGE_PRIV553:
	ta	T_CHANGE_PRIV
CHANGE_R26554:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP554:
	.word 0xc8a6445a  ! 1615: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD555:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 1617: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xc0bbd11a  ! 1619: STDA_R	stda	%r0, [%r15 + %r26] 0x88
CP_ATM_QUAD_LD556:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 1621: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
NC_PST_PRI557:
	.word 0xc3bbd91a  ! 1623: STDFA_R	stda	%f1, [%r26, %r15]
NC_BIS_AIUS558:
	.word 0xd0bfc47a  ! 1625: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc3e3601a  ! 1626: CASA_R	casa	[%r13] %asi, %r26, %r1
SET_TL1_559:
	ta	T_CHANGE_TO_TL1
CHANGE_R26560:
	add	%r26,	%r27,	%r26
NC_BIS_NUC560:
	.word 0xc4a545fa  ! 1628: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc3bc913a  ! 1630: STDFA_R	stda	%f1, [%r26, %r18]
SHORT_FP_PRI561:
	.word 0xc39a9a1a  ! 1632: LDDFA_R	ldda	[%r10, %r26], %f1
CHANGE_R26562:
	add	%r26,	%r27,	%r26
CP_BIS_SEC562:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1634: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xc3bb901a  ! 1636: STDFA_R	stda	%f1, [%r26, %r14]
BLK_PRI563:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 1638: STDFA_R	stda	%f0, [%r26, %r12]
CP_AIUP564:
	.word 0xc296021a  ! 1640: LDUHA_R	lduha	[%r24, %r26] 0x10, %r1
NC_PST_PRI565:
	.word 0xc3bc181a  ! 1642: STDFA_R	stda	%f1, [%r26, %r16]
NC_BLK_SEc566:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1644: STDFA_R	stda	%f0, [%r26, %r19]
NC_SHORT_FP_SEC567:
	.word 0xc3bcda3a  ! 1646: STDFA_R	stda	%f1, [%r26, %r19]
CP_BIS_AIUP568:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 1648: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
NC_BIS_NUC569:
	.word 0xd0bd44fa  ! 1650: STDA_R	stda	%r8, [%r21 + %r26] 0x27
NC_NUC570:
	.word 0xc2cd409a  ! 1652: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r1
	.word 0xc20b001a  ! 1653: LDUB_R	ldub	[%r12 + %r26], %r1
NC_BIS_AIUS571:
	.word 0xc8bfc47a  ! 1655: STDA_R	stda	%r4, [%r31 + %r26] 0x23
CP_AIUP572:
	.word 0xc2a6021a  ! 1657: STWA_R	stwa	%r1, [%r24 + %r26] 0x10
CP_BIS_NUC573:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 1659: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
NC_BLK_SEc574:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1661: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc0bcd13a  ! 1663: STDA_R	stda	%r0, [%r19 + %r26] 0x89
NC_BIS_AIUS575:
	.word 0xc4bfc47a  ! 1665: STDA_R	stda	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUS576:
	.word 0xd0b7c47a  ! 1667: STHA_R	stha	%r8, [%r31 + %r26] 0x23
	.word 0xc322801a  ! 1668: STF_R	st	%f1, [%r26, %r10]
CP_BIS_NUC577:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 1670: STBA_R	stba	%r4, [%r20 + %r26] 0x27
NC_NUC578:
	.word 0xc3bd409a  ! 1672: STDFA_R	stda	%f1, [%r26, %r21]
	.word 0xc2d4d03a  ! 1674: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc382d01a  ! 1675: LDFA_R	lda	[%r11, %r26], %f1
	.word 0xc2ac913a  ! 1677: STBA_R	stba	%r1, [%r18 + %r26] 0x89
	.word 0xc2f2911a  ! 1678: STXA_R	stxa	%r1, [%r10 + %r26] 0x88
	.word 0xc213401a  ! 1679: LDUH_R	lduh	[%r13 + %r26], %r1
SET_TL0_579:
	ta	T_CHANGE_TO_TL0
CHANGE_R26580:
	add	%r26,	%r27,	%r26
NC_BIS_SEC580:
	.word 0xc8bcdc7a  ! 1681: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
CHANGE_PRIV581:
	ta	T_CHANGE_PRIV
CHANGE_R26582:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS582:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 1683: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xc283511a  ! 1684: LDUWA_R	lduwa	[%r13, %r26] 0x88, %r1
	.word 0xc2dc903a  ! 1686: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
	.word 0xc39c903a  ! 1688: LDDFA_R	ldda	[%r18, %r26], %f1
	.word 0xc383901a  ! 1690: LDFA_R	lda	[%r14, %r26], %f1
CP_NUC583:
	.word 0xc3f5201a  ! 1692: CASXA_R	casxa	[%r20]%asi, %r26, %r1
	.word 0xc25b2020  ! 1693: LDX_I	ldx	[%r12 + 0x0020], %r1
	.word 0xc2f4d13a  ! 1695: STXA_R	stxa	%r1, [%r19 + %r26] 0x89
NC_BLK_SEc584:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1697: LDDFA_R	ldda	[%r19, %r26], %f0
CP_AIUS585:
	.word 0xc2c7823a  ! 1699: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r1
	.word 0xc2ccd13a  ! 1701: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
NC_NUC586:
	.word 0xc09d409a  ! 1703: LDDA_R	ldda	[%r21, %r26] 0x04, %r0
	.word 0xc294d03a  ! 1705: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
CP_BIS_AIUP587:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1707: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
NC_BIS_AIUS588:
	.word 0xccb7c47a  ! 1709: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xc2ab501a  ! 1710: STBA_R	stba	%r1, [%r13 + %r26] 0x80
	.word 0xe56b001a  ! 1712: PREFETCH_R	prefetch	[%r12 + %r26], #18
NC_NUC589:
	.word 0xc2dd409a  ! 1714: LDXA_R	ldxa	[%r21, %r26] 0x04, %r1
	.word 0xc31b001a  ! 1715: LDDF_R	ldd	[%r12, %r26], %f1
	.word 0xc28c101a  ! 1717: LDUBA_R	lduba	[%r16, %r26] 0x80, %r1
NC_BLK_SEc590:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1719: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUP591:
	.word 0xc4ae445a  ! 1721: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUS592:
	.word 0xc8b7c47a  ! 1723: STHA_R	stha	%r4, [%r31 + %r26] 0x23
NC_BIS_SEC593:
	.word 0xc4bcdc7a  ! 1725: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc2cbd01a  ! 1727: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r1
NC_AIUS594:
	.word 0xc28fc33a  ! 1729: LDUBA_R	lduba	[%r31, %r26] 0x19, %r1
CP_PST_PRI595:
	.word 0xc3bb181a  ! 1731: STDFA_R	stda	%f1, [%r26, %r12]
CP_BIS_AIUS596:
	and	%r26,	%r28,	%r26
	.word 0xccf7857a  ! 1733: STXA_R	stxa	%r6, [%r30 + %r26] 0x2b
	.word 0xc2acd13a  ! 1735: STBA_R	stba	%r1, [%r19 + %r26] 0x89
	.word 0xc2f4d03a  ! 1737: STXA_R	stxa	%r1, [%r19 + %r26] 0x81
	.word 0xc2d4903a  ! 1739: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
	.word 0xc2c4903a  ! 1741: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r1
CP_AIUS597:
	.word 0xc2d7823a  ! 1743: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r1
	.word 0xc2dbd11a  ! 1745: LDXA_R	ldxa	[%r15, %r26] 0x88, %r1
CP_AIUS598:
	.word 0xc3bf833a  ! 1747: STDFA_R	stda	%f1, [%r26, %r30]
	.word 0xc27ae024  ! 1748: SWAP_I	swap	%r1, [%r11 + 0x0024]
NC_AIUS599:
	.word 0xc2afc33a  ! 1750: STBA_R	stba	%r1, [%r31 + %r26] 0x19
CHANGE_R26600:
	add	%r26,	%r27,	%r26
CP_BIS_SEC600:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1752: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xc16fe022  ! 1754: PREFETCH_I	prefetch	[%r31 + 0x0022], #n_reads
	.word 0xc2dc903a  ! 1756: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
CP_BIS_NUC601:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 1758: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xc294d03a  ! 1760: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
CP_BIS_NUC602:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 1762: STBA_R	stba	%r8, [%r20 + %r26] 0x27
	.word 0xc3bcd03a  ! 1764: STDFA_R	stda	%f1, [%r26, %r19]
	.word 0xc26aa027  ! 1765: LDSTUB_I	ldstub	%r1, [%r10 + 0x0027]
	.word 0xc2ac903a  ! 1767: STBA_R	stba	%r1, [%r18 + %r26] 0x81
NC_AIUS603:
	.word 0xc0bfc33a  ! 1769: STDA_R	stda	%r0, [%r31 + %r26] 0x19
	.word 0xc3bb501a  ! 1770: STDFA_R	stda	%f1, [%r26, %r13]
CP_PST_PRI604:
	.word 0xc3bad81a  ! 1772: STDFA_R	stda	%f1, [%r26, %r11]
NC_AIUS605:
	.word 0xc287c23a  ! 1774: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r1
SET_TL1_606:
	ta	T_CHANGE_TO_TL1
CHANGE_R26607:
	add	%r26,	%r27,	%r26
NC_BIS_NUC607:
	.word 0xc4ad44fa  ! 1776: STBA_R	stba	%r2, [%r21 + %r26] 0x27
SET_TL0_608:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI609:
	.word 0xccb39d5a  ! 1778: STHA_R	stha	%r6, [%r14 + %r26] 0xea
NC_BIS_PRI610:
	.word 0xcca39c5a  ! 1780: STWA_R	stwa	%r6, [%r14 + %r26] 0xe2
NC_BIS_PRI611:
	.word 0xcca39d5a  ! 1782: STWA_R	stwa	%r6, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS613:
	.word 0xc2b7823a  ! 1784: STHA_R	stha	%r1, [%r30 + %r26] 0x11
	.word 0xc33a801a  ! 1785: STDF_R	std	%f1, [%r26, %r10]
CP_NUC614:
	.word 0xc0bd009a  ! 1787: STDA_R	stda	%r0, [%r20 + %r26] 0x04
	.word 0xc2b2901a  ! 1788: STHA_R	stha	%r1, [%r10 + %r26] 0x80
	.word 0xc39b911a  ! 1790: LDDFA_R	ldda	[%r14, %r26], %f1
CP_AIUS615:
	.word 0xc2af833a  ! 1792: STBA_R	stba	%r1, [%r30 + %r26] 0x19
CHANGE_USER616:
	ta	T_CHANGE_NONPRIV
CHANGE_R26617:
	add	%r26,	%r27,	%r26
NC_BIS_PRI617:
	.word 0xc4ab9c5a  ! 1794: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
	.word 0xc384d03a  ! 1796: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc09c903a  ! 1798: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
CHANGE_PRIV618:
	ta	T_CHANGE_PRIV
CHANGE_R26619:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS619:
	.word 0xcca7c47a  ! 1800: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
	.word 0xc2b2901a  ! 1801: STHA_R	stha	%r1, [%r10 + %r26] 0x80
	.word 0xc2b4903a  ! 1803: STHA_R	stha	%r1, [%r18 + %r26] 0x81
	.word 0xc322a024  ! 1804: STF_I	st	%f1, [0x0024, %r10]
CP_AIUP620:
	.word 0xc286021a  ! 1806: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r1
	.word 0xc25ae020  ! 1807: LDX_I	ldx	[%r11 + 0x0020], %r1
	.word 0xc3e3601a  ! 1808: CASA_R	casa	[%r13] %asi, %r26, %r1
	.word 0xc28cd13a  ! 1810: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
	.word 0xc1efa021  ! 1812: PREFETCHA_I	prefetcha	[%r30, + 0x0021] %asi, #n_reads
WR_LEASI_621:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_622:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc28c511a  ! 1815: LDUBA_R	lduba	[%r17, %r26] 0x88, %r1
SHORT_FP_PRI623:
	.word 0xc3badb1a  ! 1817: STDFA_R	stda	%f1, [%r26, %r11]
SET_TL1_624:
	ta	T_CHANGE_TO_TL1
CHANGE_R26625:
	add	%r26,	%r27,	%r26
NC_BIS_NUC625:
	.word 0xc8a544fa  ! 1819: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
NC_PST_PRI626:
	.word 0xc3bc191a  ! 1821: STDFA_R	stda	%f1, [%r26, %r16]
NC_PST_PRI627:
	.word 0xc3bbd99a  ! 1824: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc243401a  ! 1825: LDSW_R	ldsw	[%r13 + %r26], %r1
	.word 0xc33b6020  ! 1826: STDF_I	std	%f1, [0x0020, %r13]
	.word 0xc33b6020  ! 1827: STDF_I	std	%f1, [0x0020, %r13]
SET_TL0_628:
	ta	T_CHANGE_TO_TL0
WR_LEASI_629:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_630:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc284d03a  ! 1830: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
	.word 0xc31aa020  ! 1831: LDDF_I	ldd	[%r10, 0x0020], %f1
	.word 0xc2d4111a  ! 1833: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r1
SHORT_FP_PRI631:
	.word 0xc39b1a1a  ! 1835: LDDFA_R	ldda	[%r12, %r26], %f1
	.word 0xc2d3d01a  ! 1837: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r1
	.word 0xc2dcd03a  ! 1839: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
	.word 0xc2b3501a  ! 1840: STHA_R	stha	%r1, [%r13 + %r26] 0x80
CP_BIS_QUAD_LD632:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 1842: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC634:
	.word 0xc3bd409a  ! 1844: STDFA_R	stda	%f1, [%r26, %r21]
	.word 0xc294913a  ! 1846: LDUHA_R	lduha	[%r18, %r26] 0x89, %r1
	.word 0xc28cd13a  ! 1848: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
NC_AIUP635:
	.word 0xc286421a  ! 1850: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r1
	.word 0xc2d4d13a  ! 1852: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
	.word 0xc0bad11a  ! 1853: STDA_R	stda	%r0, [%r11 + %r26] 0x88
	.word 0xc294903a  ! 1855: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
SET_TL1_636:
	ta	T_CHANGE_TO_TL1
CHANGE_R26637:
	add	%r26,	%r27,	%r26
NC_BIS_NUC637:
	.word 0xc4f544fa  ! 1857: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CHANGE_R26638:
	add	%r26,	%r27,	%r26
CP_BIS_SEC638:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 1859: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
	.word 0xc09cd03a  ! 1861: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
CP_BIS_NUC639:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 1863: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
	.word 0xc33b6020  ! 1864: STDF_I	std	%f1, [0x0020, %r13]
	.word 0xc39cd13a  ! 1866: LDDFA_R	ldda	[%r19, %r26], %f1
NC_SHORT_FP_SEC640:
	.word 0xc39cdb7a  ! 1868: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc2a4903a  ! 1870: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
NC_BIS_AIUS641:
	.word 0xc4a7c47a  ! 1872: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
	.word 0xc3bad01a  ! 1873: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc382d05a  ! 1874: LDFA_R	lda	[%r11, %r26], %f1
	.word 0xc0bc101a  ! 1876: STDA_R	stda	%r0, [%r16 + %r26] 0x80
	.word 0xc27b6024  ! 1877: SWAP_I	swap	%r1, [%r13 + 0x0024]
CHANGE_R26642:
	add	%r26,	%r27,	%r26
CP_BIS_SEC642:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 1879: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
	.word 0xc3bcd13a  ! 1881: STDFA_R	stda	%f1, [%r26, %r19]
NC_AIUP643:
	.word 0xc386421a  ! 1883: LDFA_R	lda	[%r25, %r26], %f1
NC_BIS_AIUS644:
	.word 0xc4bfc47a  ! 1885: STDA_R	stda	%r2, [%r31 + %r26] 0x23
CP_ATM_QUAD_LD645:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 1887: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
SET_TL0_646:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI647:
	.word 0xc4a45c5a  ! 1889: STWA_R	stwa	%r2, [%r17 + %r26] 0xe2
CHANGE_PRIV648:
	ta	T_CHANGE_PRIV
CHANGE_R26649:
	mov	%g0,	%r26
CP_BIS_AIUS649:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 1891: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
	.word 0xc222c01a  ! 1892: STW_R	stw	%r1, [%r11 + %r26]
SHORT_FP_PRI650:
	.word 0xc3bada1a  ! 1894: STDFA_R	stda	%f1, [%r26, %r11]
CP_NUC651:
	.word 0xc385009a  ! 1896: LDFA_R	lda	[%r20, %r26], %f1
	.word 0xc27b001a  ! 1897: SWAP_R	swap	%r1, [%r12 + %r26]
	.word 0xc284913a  ! 1899: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r1
CP_NUC652:
	.word 0xc3f5201a  ! 1901: CASXA_R	casxa	[%r20]%asi, %r26, %r1
	.word 0xc3a4903a  ! 1903: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc3e2e01a  ! 1904: CASA_R	casa	[%r11] %asi, %r26, %r1
WR_LEASI_653:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_654:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2ac903a  ! 1907: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc382901a  ! 1908: LDFA_R	lda	[%r10, %r26], %f1
SET_TL1_655:
	ta	T_CHANGE_TO_TL1
CHANGE_R26656:
	add	%r26,	%r27,	%r26
NC_BIS_NUC656:
	.word 0xd0ad45fa  ! 1910: STBA_R	stba	%r8, [%r21 + %r26] 0x2f
	.word 0xc322801a  ! 1911: STF_R	st	%f1, [%r26, %r10]
	.word 0xc39a901a  ! 1912: LDDFA_R	ldda	[%r10, %r26], %f1
CP_ATM_QUAD_LD657:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1914: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xc2d3901a  ! 1916: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r1
	.word 0xc3bb901a  ! 1918: STDFA_R	stda	%f1, [%r26, %r14]
NC_BLK_SEc658:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1920: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc2f2901a  ! 1921: STXA_R	stxa	%r1, [%r10 + %r26] 0x80
	.word 0xc2d4501a  ! 1923: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r1
	.word 0xc2a4913a  ! 1925: STWA_R	stwa	%r1, [%r18 + %r26] 0x89
	.word 0xc09c903a  ! 1928: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
	.word 0xc384903a  ! 1930: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc2736020  ! 1931: STX_I	stx	%r1, [%r13 + 0x0020]
	.word 0xc31b001a  ! 1932: LDDF_R	ldd	[%r12, %r26], %f1
	.word 0xc322a024  ! 1933: STF_I	st	%f1, [0x0024, %r10]
	.word 0xc09c903a  ! 1935: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
	.word 0xc2ac903a  ! 1937: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc39cd03a  ! 1939: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc2cc903a  ! 1941: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
SHORT_FP_PRI659:
	.word 0xc3bb1a5a  ! 1943: STDFA_R	stda	%f1, [%r26, %r12]
	.word 0xc3a3911a  ! 1945: STFA_R	sta	%f1, [%r26, %r14]
	.word 0xc03b6020  ! 1946: STD_I	std	%r0, [%r13 + 0x0020]
SET_TL0_660:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI661:
	and	%r26,	%r28,	%r26
	.word 0xd0ba9d5a  ! 1948: STDA_R	stda	%r8, [%r10 + %r26] 0xea
	.word 0xc2c4903a  ! 1950: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r1
CHANGE_PRIV662:
	ta	T_CHANGE_PRIV
CHANGE_R26663:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD663:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 1952: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
CP_PST_PRI664:
	.word 0xc3bad89a  ! 1954: STDFA_R	stda	%f1, [%r26, %r11]
NC_BIS_SEC665:
	.word 0xd0a4dd7a  ! 1956: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	.word 0xc202c01a  ! 1957: LDUW_R	lduw	[%r11 + %r26], %r1
	.word 0xc3a4101a  ! 1959: STFA_R	sta	%f1, [%r26, %r16]
	.word 0xc3232024  ! 1960: STF_I	st	%f1, [0x0024, %r12]
CP_BIS_AIUP666:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1962: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc294903a  ! 1964: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
WR_LEASI_667:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_668:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2a3501a  ! 1966: STWA_R	stwa	%r1, [%r13 + %r26] 0x80
	.word 0xc3a4111a  ! 1968: STFA_R	sta	%f1, [%r26, %r16]
	.word 0xc28c501a  ! 1970: LDUBA_R	lduba	[%r17, %r26] 0x80, %r1
NC_PST_PRI669:
	.word 0xc3bb981a  ! 1972: STDFA_R	stda	%f1, [%r26, %r14]
CHANGE_R26670:
	add	%r26,	%r27,	%r26
CP_BIS_SEC670:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1974: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
NC_AIUP671:
	.word 0xc386421a  ! 1976: LDFA_R	lda	[%r25, %r26], %f1
	.word 0xc2d4903a  ! 1978: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
	.word 0xc3a3d11a  ! 1980: STFA_R	sta	%f1, [%r26, %r15]
	.word 0xc09bd01a  ! 1982: LDDA_R	ldda	[%r15, %r26] 0x80, %r0
SET_TL1_672:
	ta	T_CHANGE_TO_TL1
CHANGE_R26673:
	add	%r26,	%r27,	%r26
NC_BIS_NUC673:
	.word 0xccbd45fa  ! 1984: STDA_R	stda	%r6, [%r21 + %r26] 0x2f
	.word 0xc2d3901a  ! 1986: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r1
	.word 0xc09c913a  ! 1988: LDDA_R	ldda	[%r18, %r26] 0x89, %r0
	.word 0xc3e2a01a  ! 1989: CASA_R	casa	[%r10] %asi, %r26, %r1
CP_BIS_AIUP674:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1991: STBA_R	stba	%r2, [%r24 + %r26] 0x22
NC_PST_PRI675:
	.word 0xc3bb995a  ! 1993: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc2acd03a  ! 1995: STBA_R	stba	%r1, [%r19 + %r26] 0x81
CP_ATM_QUAD_LD676:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 1997: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
	.word 0xc2a2d01a  ! 1998: STWA_R	stwa	%r1, [%r11 + %r26] 0x80
CP_AIUS677:
	.word 0xc387823a  ! 2000: LDFA_R	lda	[%r30, %r26], %f1
	.word 0xc2536026  ! 2001: LDSH_I	ldsh	[%r13 + 0x0026], %r1
CP_AIUS678:
	.word 0xc09f833a  ! 2003: LDDA_R	ldda	[%r30, %r26] 0x19, %r0
NC_NUC679:
	.word 0xc09d409a  ! 2005: LDDA_R	ldda	[%r21, %r26] 0x04, %r0
	.word 0xc292901a  ! 2006: LDUHA_R	lduha	[%r10, %r26] 0x80, %r1
	.word 0xc2f4101a  ! 2008: STXA_R	stxa	%r1, [%r16 + %r26] 0x80
NC_BIS_AIUS680:
	.word 0xd0afc47a  ! 2010: STBA_R	stba	%r8, [%r31 + %r26] 0x23
NC_BLK_SEc681:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2012: LDDFA_R	ldda	[%r19, %r26], %f16
NC_AIUP682:
	.word 0xc28e421a  ! 2014: LDUBA_R	lduba	[%r25, %r26] 0x10, %r1
	.word 0xc303001a  ! 2015: LDF_R	ld	[%r12, %r26], %f1
NC_PST_PRI683:
	.word 0xc3bb989a  ! 2017: STDFA_R	stda	%f1, [%r26, %r14]
BLK_PRI684:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 2019: LDDFA_R	ldda	[%r11, %r26], %f0
CP_BIS_NUC685:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 2021: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
	.word 0xc2232024  ! 2022: STW_I	stw	%r1, [%r12 + 0x0024]
	.word 0xc0bb901a  ! 2024: STDA_R	stda	%r0, [%r14 + %r26] 0x80
	.word 0xc284903a  ! 2026: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
BLK_PRI686:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 2028: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xc2ccd13a  ! 2030: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r1
CP_AIUP687:
	.word 0xc2ce021a  ! 2032: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r1
	.word 0xc2f4501a  ! 2034: STXA_R	stxa	%r1, [%r17 + %r26] 0x80
CP_NUC688:
	.word 0xc3f5201a  ! 2036: CASXA_R	casxa	[%r20]%asi, %r26, %r1
	.word 0xc3a3501a  ! 2037: STFA_R	sta	%f1, [%r26, %r13]
CP_BIS_AIUP689:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 2039: STBA_R	stba	%r8, [%r24 + %r26] 0x22
NC_BIS_AIUS690:
	.word 0xc4a7c57a  ! 2041: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
NC_BLK_SEc691:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2043: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc28c903a  ! 2045: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
CP_ATM_QUAD_LD692:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 2047: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
NC_AIUP693:
	.word 0xc2d6421a  ! 2049: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r1
	.word 0xc09c903a  ! 2051: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
SET_TL0_694:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI695:
	.word 0xc4b39d5a  ! 2053: STHA_R	stha	%r2, [%r14 + %r26] 0xea
	.word 0xc2b3901a  ! 2055: STHA_R	stha	%r1, [%r14 + %r26] 0x80
	.word 0xc33b6020  ! 2056: STDF_I	std	%f1, [0x0020, %r13]
CHANGE_PRIV696:
	ta	T_CHANGE_PRIV
CHANGE_R26697:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP697:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2058: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
NC_NUC698:
	.word 0xc39d409a  ! 2060: LDDFA_R	ldda	[%r21, %r26], %f1
	.word 0xc26a801a  ! 2061: LDSTUB_R	ldstub	%r1, [%r10 + %r26]
	.word 0xc33ac01a  ! 2062: STDF_R	std	%f1, [%r26, %r11]
CP_NUC699:
	.word 0xc2cd009a  ! 2064: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r1
SHORT_FP_PRI700:
	.word 0xc3bada5a  ! 2066: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc2b4913a  ! 2068: STHA_R	stha	%r1, [%r18 + %r26] 0x89
	.word 0xc26b6027  ! 2069: LDSTUB_I	ldstub	%r1, [%r13 + 0x0027]
NC_NUC701:
	.word 0xc2dd409a  ! 2071: LDXA_R	ldxa	[%r21, %r26] 0x04, %r1
NC_PST_PRI702:
	.word 0xc3bbd81a  ! 2073: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc3a4903a  ! 2075: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc33b6020  ! 2076: STDF_I	std	%f1, [0x0020, %r13]
CHANGE_R26703:
	add	%r26,	%r27,	%r26
CP_BIS_SEC703:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 2078: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
CHANGE_USER704:
	ta	T_CHANGE_NONPRIV
CHANGE_R26705:
	add	%r26,	%r27,	%r26
CP_BIS_PRI705:
	and	%r26,	%r28,	%r26
	.word 0xccf35d5a  ! 2080: STXA_R	stxa	%r6, [%r13 + %r26] 0xea
	.word 0xc2c3901a  ! 2082: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r1
CP_BIS_PRI706:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 2084: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xc2cc903a  ! 2086: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	.word 0xc2ccd03a  ! 2088: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
CHANGE_PRIV707:
	ta	T_CHANGE_PRIV
CHANGE_R26708:
	mov	%g0,	%r26
CP_ATM_QUAD_LD708:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2090: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
CP_BIS_AIUS709:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 2092: STBA_R	stba	%r2, [%r30 + %r26] 0x23
NC_AIUP710:
	.word 0xc2d6421a  ! 2094: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r1
CP_AIUS711:
	.word 0xc0bf823a  ! 2096: STDA_R	stda	%r0, [%r30 + %r26] 0x11
NC_NUC712:
	.word 0xc2dd419a  ! 2098: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r1
	.word 0xc2f3901a  ! 2100: STXA_R	stxa	%r1, [%r14 + %r26] 0x80
NC_BIS_AIUS713:
	.word 0xccf7c47a  ! 2102: STXA_R	stxa	%r6, [%r31 + %r26] 0x23
NC_BIS_AIUP714:
	.word 0xccf6455a  ! 2104: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
	.word 0xc3e2e01a  ! 2105: CASA_R	casa	[%r11] %asi, %r26, %r1
NC_PST_PRI715:
	.word 0xc3bc181a  ! 2107: STDFA_R	stda	%f1, [%r26, %r16]
NC_AIUS716:
	.word 0xc387c23a  ! 2109: LDFA_R	lda	[%r31, %r26], %f1
BLK_PRI717:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 2111: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc294d03a  ! 2113: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
CP_PST_PRI718:
	.word 0xc3ba999a  ! 2115: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc0bcd03a  ! 2117: STDA_R	stda	%r0, [%r19 + %r26] 0x81
	.word 0xc2a4101a  ! 2119: STWA_R	stwa	%r1, [%r16 + %r26] 0x80
CHANGE_USER719:
	ta	T_CHANGE_NONPRIV
CHANGE_R26720:
	add	%r26,	%r27,	%r26
CP_BIS_PRI720:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dd5a  ! 2121: STXA_R	stxa	%r2, [%r11 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC722:
	.word 0xc2dd009a  ! 2123: LDXA_R	ldxa	[%r20, %r26] 0x04, %r1
	.word 0xc2b3901a  ! 2125: STHA_R	stha	%r1, [%r14 + %r26] 0x80
CHANGE_USER723:
	ta	T_CHANGE_NONPRIV
CHANGE_R26724:
	add	%r26,	%r27,	%r26
CP_BIS_PRI724:
	and	%r26,	%r28,	%r26
	.word 0xc4f35c5a  ! 2127: STXA_R	stxa	%r2, [%r13 + %r26] 0xe2
	.word 0xc28b911a  ! 2129: LDUBA_R	lduba	[%r14, %r26] 0x88, %r1
	.word 0xc2f2d01a  ! 2130: STXA_R	stxa	%r1, [%r11 + %r26] 0x80
	.word 0xc25ac01a  ! 2131: LDX_R	ldx	[%r11 + %r26], %r1
	.word 0xc26aa027  ! 2132: LDSTUB_I	ldstub	%r1, [%r10 + 0x0027]
CHANGE_PRIV725:
	ta	T_CHANGE_PRIV
CHANGE_R26726:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP726:
	and	%r26,	%r28,	%r26
	.word 0xd0be045a  ! 2134: STDA_R	stda	%r8, [%r24 + %r26] 0x22
CP_AIUS727:
	.word 0xc2cf823a  ! 2136: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r1
SHORT_FP_PRI728:
	.word 0xc39b1a1a  ! 2138: LDDFA_R	ldda	[%r12, %r26], %f1
CP_BIS_NUC729:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 2140: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
	.word 0xc382d05a  ! 2141: LDFA_R	lda	[%r11, %r26], %f1
NC_SHORT_FP_SEC730:
	.word 0xc39cda7a  ! 2143: LDDFA_R	ldda	[%r19, %r26], %f1
NC_AIUP731:
	.word 0xc0be421a  ! 2145: STDA_R	stda	%r0, [%r25 + %r26] 0x10
NC_BIS_AIUP732:
	.word 0xc4a6445a  ! 2147: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CP_BIS_NUC733:
	and	%r26,	%r28,	%r26
	.word 0xcca504fa  ! 2149: STWA_R	stwa	%r6, [%r20 + %r26] 0x27
BLK_PRI734:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 2151: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc2b4d03a  ! 2153: STHA_R	stha	%r1, [%r19 + %r26] 0x81
CP_AIUP735:
	.word 0xc2ae031a  ! 2155: STBA_R	stba	%r1, [%r24 + %r26] 0x18
CP_NUC736:
	.word 0xc385009a  ! 2157: LDFA_R	lda	[%r20, %r26], %f1
	.word 0xc2d4d03a  ! 2159: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
CP_BIS_AIUP737:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 2161: STHA_R	stha	%r8, [%r24 + %r26] 0x22
CP_AIUP738:
	.word 0xc2ce021a  ! 2163: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r1
NC_PST_PRI739:
	.word 0xc3bbd81a  ! 2165: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc2b4501a  ! 2167: STHA_R	stha	%r1, [%r17 + %r26] 0x80
	.word 0xc284d13a  ! 2169: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r1
NC_BIS_AIUP740:
	.word 0xc4a6455a  ! 2171: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
NC_AIUP741:
	.word 0xc2ce421a  ! 2173: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r1
	.word 0xc09b911a  ! 2175: LDDA_R	ldda	[%r14, %r26] 0x88, %r0
	.word 0xc2d4903a  ! 2177: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
NC_BLK_SEc742:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2179: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc03a801a  ! 2180: STD_R	std	%r0, [%r10 + %r26]
NC_AIUS743:
	.word 0xc2a7c23a  ! 2182: STWA_R	stwa	%r1, [%r31 + %r26] 0x11
	.word 0xc3f2e01a  ! 2183: CASXA_R	casxa	[%r11]%asi, %r26, %r1
CP_ATM_QUAD_LD744:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2185: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
CP_ATM_QUAD_LD745:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2187: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc272a020  ! 2188: STX_I	stx	%r1, [%r10 + 0x0020]
	.word 0xc28b115a  ! 2189: LDUBA_R	lduba	[%r12, %r26] 0x8a, %r1
	.word 0xc2a4903a  ! 2191: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
	.word 0xc39b501a  ! 2192: LDDFA_R	ldda	[%r13, %r26], %f1
	.word 0xc25ac01a  ! 2193: LDX_R	ldx	[%r11 + %r26], %r1
	.word 0xc2cbd01a  ! 2195: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r1
CHANGE_TLE746:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc39cd03a  ! 2198: LDDFA_R	ldda	[%r19, %r26], %f1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC748:
	.word 0xc2dd419a  ! 2200: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r1
	.word 0xc384101a  ! 2202: LDFA_R	lda	[%r16, %r26], %f1
CP_AIUP749:
	.word 0xc0be021a  ! 2204: STDA_R	stda	%r0, [%r24 + %r26] 0x10
CP_ATM_QUAD_LD750:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2206: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc3a3501a  ! 2207: STFA_R	sta	%f1, [%r26, %r13]
CP_AIUS751:
	.word 0xc287823a  ! 2209: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r1
	.word 0xc322801a  ! 2210: STF_R	st	%f1, [%r26, %r10]
	.word 0xc3bc101a  ! 2212: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc3ba901a  ! 2213: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2ab101a  ! 2214: STBA_R	stba	%r1, [%r12 + %r26] 0x80
	.word 0xc2a4903a  ! 2216: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
	.word 0xc09cd13a  ! 2218: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
SET_TL1_752:
	ta	T_CHANGE_TO_TL1
CHANGE_R26753:
	add	%r26,	%r27,	%r26
NC_BIS_NUC753:
	.word 0xc4b544fa  ! 2220: STHA_R	stha	%r2, [%r21 + %r26] 0x27
CP_BIS_AIUS754:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 2222: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
CP_BIS_NUC755:
	and	%r26,	%r28,	%r26
	.word 0xd0b504fa  ! 2224: STHA_R	stha	%r8, [%r20 + %r26] 0x27
NC_NUC756:
	.word 0xc09d409a  ! 2226: LDDA_R	ldda	[%r21, %r26] 0x04, %r0
SET_TL0_757:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI758:
	.word 0xc4a3dd5a  ! 2228: STWA_R	stwa	%r2, [%r15 + %r26] 0xea
CP_PST_PRI759:
	.word 0xc3ba995a  ! 2230: STDFA_R	stda	%f1, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC761:
	.word 0xc39d409a  ! 2232: LDDFA_R	ldda	[%r21, %r26], %f1
SHORT_FP_PRI762:
	.word 0xc39adb5a  ! 2234: LDDFA_R	ldda	[%r11, %r26], %f1
NC_BIS_SEC763:
	.word 0xc8f4dc7a  ! 2236: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xc28a901a  ! 2237: LDUBA_R	lduba	[%r10, %r26] 0x80, %r1
	.word 0xc2236024  ! 2238: STW_I	stw	%r1, [%r13 + 0x0024]
	.word 0xc2b4d03a  ! 2240: STHA_R	stha	%r1, [%r19 + %r26] 0x81
CP_PST_PRI764:
	.word 0xc3ba999a  ! 2242: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc2c4501a  ! 2244: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r1
	.word 0xc0bc501a  ! 2246: STDA_R	stda	%r0, [%r17 + %r26] 0x80
	.word 0xc3236024  ! 2247: STF_I	st	%f1, [0x0024, %r13]
CHANGE_TLE765:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc213001a  ! 2249: LDUH_R	lduh	[%r12 + %r26], %r1
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS767:
	.word 0xc297823a  ! 2251: LDUHA_R	lduha	[%r30, %r26] 0x11, %r1
WR_LEASI_768:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_769:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_QUAD_LD770:
	and	%r26,	%r29,	%r26
	.word 0xc89add5a  ! 2254: LDDA_R	ldda	[%r11, %r26] 0xea, %r4
	.word 0xc3a4903a  ! 2256: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc2a4903a  ! 2258: STWA_R	stwa	%r1, [%r18 + %r26] 0x81
	.word 0xc294101a  ! 2260: LDUHA_R	lduha	[%r16, %r26] 0x80, %r1
SET_TL1_771:
	ta	T_CHANGE_TO_TL1
CHANGE_R26772:
	add	%r26,	%r27,	%r26
NC_BIS_NUC772:
	.word 0xc8ad44fa  ! 2262: STBA_R	stba	%r4, [%r21 + %r26] 0x27
SET_TL0_773:
	ta	T_CHANGE_TO_TL0
WR_LEASI_774:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_775:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc3a4d03a  ! 2265: STFA_R	sta	%f1, [%r26, %r19]
BLK_PRI776:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 2267: STDFA_R	stda	%f0, [%r26, %r13]
CP_BIS_PRI777:
	and	%r26,	%r28,	%r26
	.word 0xcca2dd5a  ! 2269: STWA_R	stwa	%r6, [%r11 + %r26] 0xea
BLK_PRI778:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1e1a  ! 2271: STDFA_R	stda	%f16, [%r26, %r12]
SHORT_FP_PRI779:
	.word 0xc39adb5a  ! 2273: LDDFA_R	ldda	[%r11, %r26], %f1
NC_BIS_PRI780:
	.word 0xcca3dc5a  ! 2275: STWA_R	stwa	%r6, [%r15 + %r26] 0xe2
	.word 0xc2dc903a  ! 2277: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
	.word 0xc39bd11a  ! 2279: LDDFA_R	ldda	[%r15, %r26], %f1
CHANGE_R26781:
	add	%r26,	%r27,	%r26
CP_BIS_SEC781:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 2281: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
	.word 0xc2f4d03a  ! 2283: STXA_R	stxa	%r1, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS783:
	.word 0xc2b7c33a  ! 2285: STHA_R	stha	%r1, [%r31 + %r26] 0x19
	.word 0xc2f3901a  ! 2287: STXA_R	stxa	%r1, [%r14 + %r26] 0x80
	.word 0xc384d13a  ! 2289: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc303401a  ! 2290: LDF_R	ld	[%r13, %r26], %f1
	.word 0xc2db515a  ! 2291: LDXA_R	ldxa	[%r13, %r26] 0x8a, %r1
	.word 0xc33ac01a  ! 2292: STDF_R	std	%f1, [%r26, %r11]
	.word 0xc3a3501a  ! 2293: STFA_R	sta	%f1, [%r26, %r13]
CP_AIUP784:
	.word 0xc2ae031a  ! 2295: STBA_R	stba	%r1, [%r24 + %r26] 0x18
NC_NUC785:
	.word 0xc28d419a  ! 2297: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r1
	.word 0xc09cd03a  ! 2299: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
NC_AIUS786:
	.word 0xc2cfc23a  ! 2301: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r1
	.word 0xc0bc903a  ! 2303: STDA_R	stda	%r0, [%r18 + %r26] 0x81
CP_AIUP787:
	.word 0xc296021a  ! 2305: LDUHA_R	lduha	[%r24, %r26] 0x10, %r1
	.word 0xc3a4903a  ! 2307: STFA_R	sta	%f1, [%r26, %r18]
SHORT_FP_PRI788:
	.word 0xc39b5b1a  ! 2309: LDDFA_R	ldda	[%r13, %r26], %f1
NC_BIS_SEC789:
	.word 0xc4a4dd7a  ! 2311: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
NC_BLK_SEc790:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2313: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_USER791:
	ta	T_CHANGE_NONPRIV
CHANGE_R26792:
	add	%r26,	%r27,	%r26
NC_BIS_PRI792:
	.word 0xc4bc1c5a  ! 2315: STDA_R	stda	%r2, [%r16 + %r26] 0xe2
	.word 0xc33aa020  ! 2316: STDF_I	std	%f1, [0x0020, %r10]
	.word 0xc39c501a  ! 2318: LDDFA_R	ldda	[%r17, %r26], %f1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS794:
	.word 0xc2a7c33a  ! 2320: STWA_R	stwa	%r1, [%r31 + %r26] 0x19
SHORT_FP_PRI795:
	.word 0xc39b1b5a  ! 2322: LDDFA_R	ldda	[%r12, %r26], %f1
	.word 0xc2ac903a  ! 2324: STBA_R	stba	%r1, [%r18 + %r26] 0x81
CP_AIUP796:
	.word 0xc3be031a  ! 2326: STDFA_R	stda	%f1, [%r26, %r24]
SHORT_FP_PRI797:
	.word 0xc3ba9a5a  ! 2328: STDFA_R	stda	%f1, [%r26, %r10]
NC_BIS_AIUP798:
	.word 0xd0be455a  ! 2330: STDA_R	stda	%r8, [%r25 + %r26] 0x2a
CP_BIS_AIUP799:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 2332: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
NC_SHORT_FP_SEC800:
	.word 0xc39cda3a  ! 2334: LDDFA_R	ldda	[%r19, %r26], %f1
NC_PST_PRI801:
	.word 0xc3bc585a  ! 2336: STDFA_R	stda	%f1, [%r26, %r17]
CP_BIS_AIUP802:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2338: STDA_R	stda	%r2, [%r24 + %r26] 0x22
SHORT_FP_PRI803:
	.word 0xc39adb1a  ! 2340: LDDFA_R	ldda	[%r11, %r26], %f1
NC_BIS_AIUS804:
	.word 0xd0f7c57a  ! 2342: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
CHANGE_USER805:
	ta	T_CHANGE_NONPRIV
CHANGE_R26806:
	add	%r26,	%r27,	%r26
CP_BIS_PRI806:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 2344: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
NC_BIS_SEC807:
	.word 0xccacdc7a  ! 2346: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP809:
	.word 0xc2b6421a  ! 2348: STHA_R	stha	%r1, [%r25 + %r26] 0x10
	.word 0xc2db901a  ! 2350: LDXA_R	ldxa	[%r14, %r26] 0x80, %r1
CP_BIS_NUC810:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2352: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc2ea911a  ! 2353: LDSTUBA_R	ldstuba	%r1, [%r10 + %r26] 0x88
	.word 0xc39b901a  ! 2355: LDDFA_R	ldda	[%r14, %r26], %f1
	.word 0xc27aa024  ! 2356: SWAP_I	swap	%r1, [%r10 + 0x0024]
CP_BIS_AIUP811:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 2358: STBA_R	stba	%r8, [%r24 + %r26] 0x22
CP_ATM_QUAD_LD812:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 2360: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
	.word 0xc2f2911a  ! 2361: STXA_R	stxa	%r1, [%r10 + %r26] 0x88
NC_AIUP813:
	.word 0xc3a6431a  ! 2363: STFA_R	sta	%f1, [%r26, %r25]
	.word 0xc28cd03a  ! 2365: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
WR_LEASI_814:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_815:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_R26816:
	mov	%g0,	%r26
CP_BIS_SEC816:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 2368: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
	.word 0xc284d03a  ! 2370: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r1
	.word 0xc2ab901a  ! 2372: STBA_R	stba	%r1, [%r14 + %r26] 0x80
NC_BLK_SEc817:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2374: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc302801a  ! 2375: LDF_R	ld	[%r10, %r26], %f1
	.word 0xc2f4903a  ! 2377: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
NC_NUC818:
	.word 0xc3a5409a  ! 2379: STFA_R	sta	%f1, [%r26, %r21]
	.word 0xc2c3d01a  ! 2381: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r1
	.word 0xc284903a  ! 2383: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
CHANGE_TLE819:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc282911a  ! 2385: LDUWA_R	lduwa	[%r10, %r26] 0x88, %r1
	.word 0xc28cd13a  ! 2387: LDUBA_R	lduba	[%r19, %r26] 0x89, %r1
CHANGE_PRIV820:
	ta	T_CHANGE_PRIV
CHANGE_R26821:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP821:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 2389: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xc27a801a  ! 2390: SWAP_R	swap	%r1, [%r10 + %r26]
	.word 0xc3a4903a  ! 2392: STFA_R	sta	%f1, [%r26, %r18]
NC_BLK_SEc822:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2394: STDFA_R	stda	%f16, [%r26, %r19]
SET_TL1_823:
	ta	T_CHANGE_TO_TL1
CHANGE_R26824:
	add	%r26,	%r27,	%r26
NC_BIS_NUC824:
	.word 0xc4a544fa  ! 2396: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xc2b4903a  ! 2398: STHA_R	stha	%r1, [%r18 + %r26] 0x81
NC_BLK_SEc825:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2400: LDDFA_R	ldda	[%r19, %r26], %f0
SHORT_FP_PRI826:
	.word 0xc39a9a1a  ! 2402: LDDFA_R	ldda	[%r10, %r26], %f1
NC_NUC827:
	.word 0xc0bd409a  ! 2404: STDA_R	stda	%r0, [%r21 + %r26] 0x04
CP_PST_PRI828:
	.word 0xc3bb191a  ! 2406: STDFA_R	stda	%f1, [%r26, %r12]
CP_AIUS829:
	.word 0xc28f833a  ! 2408: LDUBA_R	lduba	[%r30, %r26] 0x19, %r1
NC_BIS_AIUP830:
	.word 0xc4b6445a  ! 2410: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xc39c913a  ! 2412: LDDFA_R	ldda	[%r18, %r26], %f1
SET_TL0_831:
	ta	T_CHANGE_TO_TL0
WR_LEASI_832:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_833:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_PRI834:
	and	%r26,	%r28,	%r26
	.word 0xc8ab1d5a  ! 2415: STBA_R	stba	%r4, [%r12 + %r26] 0xea
CP_BIS_QUAD_LD835:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 2417: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc322c01a  ! 2418: STF_R	st	%f1, [%r26, %r11]
BLK_PRI836:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2420: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc2cb911a  ! 2422: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r1
	.word 0xc3a3101a  ! 2423: STFA_R	sta	%f1, [%r26, %r12]
CHANGE_PRIV837:
	ta	T_CHANGE_PRIV
CHANGE_R26838:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP838:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2425: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc25ac01a  ! 2426: LDX_R	ldx	[%r11 + %r26], %r1
	.word 0xc2ccd03a  ! 2428: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
	.word 0xc322a024  ! 2429: STF_I	st	%f1, [0x0024, %r10]
	.word 0xc303401a  ! 2430: LDF_R	ld	[%r13, %r26], %f1
	.word 0xc2b3111a  ! 2431: STHA_R	stha	%r1, [%r12 + %r26] 0x88
	.word 0xc2a4913a  ! 2433: STWA_R	stwa	%r1, [%r18 + %r26] 0x89
BLK_PRI839:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2435: LDDFA_R	ldda	[%r11, %r26], %f0
CHANGE_R26840:
	add	%r26,	%r27,	%r26
CP_BIS_SEC840:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2437: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
WR_LEASI_841:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_842:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SET_TL1_843:
	ta	T_CHANGE_TO_TL1
CHANGE_R26844:
	add	%r26,	%r27,	%r26
NC_BIS_NUC844:
	.word 0xc4b544fa  ! 2440: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc284511a  ! 2442: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r1
NC_BIS_AIUS845:
	.word 0xd0bfc47a  ! 2444: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc2ab911a  ! 2446: STBA_R	stba	%r1, [%r14 + %r26] 0x88
	.word 0xc2d4d13a  ! 2448: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r1
SHORT_FP_PRI846:
	.word 0xc3ba9a5a  ! 2450: STDFA_R	stda	%f1, [%r26, %r10]
CP_AIUP847:
	.word 0xc09e021a  ! 2452: LDDA_R	ldda	[%r24, %r26] 0x10, %r0
NC_BIS_NUC848:
	.word 0xc4ad44fa  ! 2454: STBA_R	stba	%r2, [%r21 + %r26] 0x27
SET_TL0_849:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI850:
	.word 0xc4b39c5a  ! 2456: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS852:
	.word 0xc287833a  ! 2458: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r1
CP_PST_PRI853:
	.word 0xc3ba991a  ! 2460: STDFA_R	stda	%f1, [%r26, %r10]
CHANGE_CLE854:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP856:
	.word 0xc3be421a  ! 2463: STDFA_R	stda	%f1, [%r26, %r25]
	.word 0xc284913a  ! 2465: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r1
	.word 0xc09cd03a  ! 2467: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc2b3111a  ! 2468: STHA_R	stha	%r1, [%r12 + %r26] 0x88
CP_AIUP857:
	.word 0xc2f6031a  ! 2470: STXA_R	stxa	%r1, [%r24 + %r26] 0x18
	.word 0xc2f4903a  ! 2472: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
SET_TL1_858:
	ta	T_CHANGE_TO_TL1
CHANGE_R26859:
	mov	%g0,	%r26
NC_BIS_NUC859:
	.word 0xd0ad45fa  ! 2474: STBA_R	stba	%r8, [%r21 + %r26] 0x2f
	.word 0xc2d4913a  ! 2476: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r1
NC_BIS_NUC860:
	.word 0xc8b544fa  ! 2478: STHA_R	stha	%r4, [%r21 + %r26] 0x27
	.word 0xc2dcd03a  ! 2480: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
BLK_PRI861:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2482: STDFA_R	stda	%f16, [%r26, %r10]
CP_AIUS862:
	.word 0xc2a7823a  ! 2484: STWA_R	stwa	%r1, [%r30 + %r26] 0x11
SET_TL0_863:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI864:
	.word 0xc8a45c5a  ! 2486: STWA_R	stwa	%r4, [%r17 + %r26] 0xe2
CHANGE_PRIV865:
	ta	T_CHANGE_PRIV
CHANGE_R26866:
	add	%r26,	%r27,	%r26
CP_BIS_NUC866:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2488: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc384903a  ! 2490: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc3232024  ! 2491: STF_I	st	%f1, [0x0024, %r12]
	.word 0xc2a3901a  ! 2493: STWA_R	stwa	%r1, [%r14 + %r26] 0x80
	.word 0xc303001a  ! 2494: LDF_R	ld	[%r12, %r26], %f1
WR_LEASI_867:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_868:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc2b4903a  ! 2497: STHA_R	stha	%r1, [%r18 + %r26] 0x81
	.word 0xc39cd13a  ! 2499: LDDFA_R	ldda	[%r19, %r26], %f1
CP_AIUP869:
	.word 0xc3a6021a  ! 2501: STFA_R	sta	%f1, [%r26, %r24]
	.word 0xc2d4903a  ! 2503: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r1
	.word 0xc3a2d11a  ! 2504: STFA_R	sta	%f1, [%r26, %r11]
NC_BIS_AIUP870:
	.word 0xc8ae455a  ! 2506: STBA_R	stba	%r4, [%r25 + %r26] 0x2a
CP_PST_PRI871:
	.word 0xc3ba981a  ! 2508: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc26aa027  ! 2509: LDSTUB_I	ldstub	%r1, [%r10 + 0x0027]
	.word 0xc3236024  ! 2510: STF_I	st	%f1, [0x0024, %r13]
	.word 0xc2aa911a  ! 2511: STBA_R	stba	%r1, [%r10 + %r26] 0x88
NC_BIS_AIUS872:
	.word 0xc8f7c47a  ! 2513: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
CP_BIS_AIUS873:
	and	%r26,	%r28,	%r26
	.word 0xccb7857a  ! 2515: STHA_R	stha	%r6, [%r30 + %r26] 0x2b
	.word 0xc384501a  ! 2517: LDFA_R	lda	[%r17, %r26], %f1
NC_BIS_SEC874:
	.word 0xc4b4dd7a  ! 2519: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
	.word 0xc0bcd03a  ! 2521: STDA_R	stda	%r0, [%r19 + %r26] 0x81
	.word 0xc39b101a  ! 2522: LDDFA_R	ldda	[%r12, %r26], %f1
BLK_PRI875:
	and	%r26,	%r29,	%r26
	.word 0xe19b5f1a  ! 2524: LDDFA_R	ldda	[%r13, %r26], %f16
CHANGE_R26876:
	add	%r26,	%r27,	%r26
CP_BIS_SEC876:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 2526: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xc294d03a  ! 2528: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
CP_BIS_QUAD_LD877:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2530: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
CP_BIS_QUAD_LD878:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9d5a  ! 2532: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
CP_AIUS879:
	.word 0xc2df823a  ! 2534: LDXA_R	ldxa	[%r30, %r26] 0x11, %r1
	.word 0xc384101a  ! 2536: LDFA_R	lda	[%r16, %r26], %f1
CHANGE_USER880:
	ta	T_CHANGE_NONPRIV
CHANGE_R26881:
	add	%r26,	%r27,	%r26
NC_BIS_PRI881:
	.word 0xc4b39c5a  ! 2538: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
	.word 0xc222801a  ! 2539: STW_R	stw	%r1, [%r10 + %r26]
	.word 0xc3a4d03a  ! 2541: STFA_R	sta	%f1, [%r26, %r19]
NC_BIS_SEC882:
	.word 0xd0bcdc7a  ! 2543: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
CHANGE_PRIV883:
	ta	T_CHANGE_PRIV
CHANGE_R26884:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS884:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 2545: STHA_R	stha	%r2, [%r30 + %r26] 0x23
NC_PST_PRI885:
	.word 0xc3bc595a  ! 2547: STDFA_R	stda	%f1, [%r26, %r17]
CP_PST_PRI886:
	.word 0xc3bad91a  ! 2549: STDFA_R	stda	%f1, [%r26, %r11]
SET_TL1_887:
	ta	T_CHANGE_TO_TL1
CHANGE_R26888:
	add	%r26,	%r27,	%r26
NC_BIS_NUC888:
	.word 0xc4ad45fa  ! 2551: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xc3a4913a  ! 2553: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc27aa024  ! 2554: SWAP_I	swap	%r1, [%r10 + 0x0024]
CP_ATM_QUAD_LD889:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2556: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc09cd13a  ! 2558: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
NC_AIUP890:
	.word 0xc296421a  ! 2560: LDUHA_R	lduha	[%r25, %r26] 0x10, %r1
	.word 0xc2c4d13a  ! 2562: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r1
	.word 0xc2b4d03a  ! 2564: STHA_R	stha	%r1, [%r19 + %r26] 0x81
	.word 0xc2cc101a  ! 2566: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r1
	.word 0xc0bb511a  ! 2567: STDA_R	stda	%r0, [%r13 + %r26] 0x88
CP_ATM_QUAD_LD891:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 2569: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
CP_BIS_AIUP892:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 2571: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc294d03a  ! 2573: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
	.word 0xc2ac101a  ! 2575: STBA_R	stba	%r1, [%r16 + %r26] 0x80
	.word 0xc382d05a  ! 2576: LDFA_R	lda	[%r11, %r26], %f1
CP_BIS_AIUS893:
	and	%r26,	%r28,	%r26
	.word 0xd0af847a  ! 2578: STBA_R	stba	%r8, [%r30 + %r26] 0x23
	.word 0xc3bc903a  ! 2580: STDFA_R	stda	%f1, [%r26, %r18]
	.word 0xc3a4913a  ! 2582: STFA_R	sta	%f1, [%r26, %r18]
	.word 0xc294913a  ! 2584: LDUHA_R	lduha	[%r18, %r26] 0x89, %r1
SET_TL0_894:
	ta	T_CHANGE_TO_TL0
CHANGE_R26895:
	add	%r26,	%r27,	%r26
NC_BIS_SEC895:
	.word 0xc4b4dc7a  ! 2586: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP897:
	.word 0xc3be021a  ! 2588: STDFA_R	stda	%f1, [%r26, %r24]
	.word 0xc24b001a  ! 2589: LDSB_R	ldsb	[%r12 + %r26], %r1
SHORT_FP_PRI898:
	.word 0xc3bb5b1a  ! 2591: STDFA_R	stda	%f1, [%r26, %r13]
CP_BIS_QUAD_LD899:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2593: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
NC_BIS_AIUP900:
	.word 0xc8f6445a  ! 2595: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
CP_PST_PRI901:
	.word 0xc3ba991a  ! 2597: STDFA_R	stda	%f1, [%r26, %r10]
CHANGE_USER902:
	ta	T_CHANGE_NONPRIV
CHANGE_R26903:
	mov	%g0,	%r26
NC_BIS_PRI903:
	.word 0xc8a45d5a  ! 2599: STWA_R	stwa	%r4, [%r17 + %r26] 0xea
NC_PST_PRI904:
	.word 0xc3bc199a  ! 2601: STDFA_R	stda	%f1, [%r26, %r16]
SET_TL1_905:
	ta	T_CHANGE_TO_TL1
CHANGE_R26906:
	add	%r26,	%r27,	%r26
NC_BIS_NUC906:
	.word 0xc4f544fa  ! 2603: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_PST_PRI907:
	.word 0xc3bc181a  ! 2605: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc2acd13a  ! 2607: STBA_R	stba	%r1, [%r19 + %r26] 0x89
	.word 0xc09c913a  ! 2609: LDDA_R	ldda	[%r18, %r26] 0x89, %r0
	.word 0xc39b901a  ! 2611: LDDFA_R	ldda	[%r14, %r26], %f1
CHANGE_R26908:
	add	%r26,	%r27,	%r26
CP_BIS_SEC908:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 2613: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
NC_PST_PRI909:
	.word 0xc3bbd81a  ! 2615: STDFA_R	stda	%f1, [%r26, %r15]
	.word 0xc2d2901a  ! 2616: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r1
CP_BIS_QUAD_LD910:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2618: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_NUC911:
	.word 0xc4bd44fa  ! 2620: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xc3e3601a  ! 2621: CASA_R	casa	[%r13] %asi, %r26, %r1
NC_NUC912:
	.word 0xc2f5419a  ! 2623: STXA_R	stxa	%r1, [%r21 + %r26] 0x0c
NC_BLK_SEc913:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2625: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc383901a  ! 2627: LDFA_R	lda	[%r14, %r26], %f1
SET_TL0_914:
	ta	T_CHANGE_TO_TL0
CHANGE_R26915:
	add	%r26,	%r27,	%r26
NC_BIS_SEC915:
	.word 0xccf4dc7a  ! 2629: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xc3bcd03a  ! 2631: STDFA_R	stda	%f1, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP917:
	.word 0xc2ce031a  ! 2633: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r1
	.word 0xc28b105a  ! 2634: LDUBA_R	lduba	[%r12, %r26] 0x82, %r1
NC_AIUP918:
	.word 0xc286421a  ! 2636: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r1
CP_BIS_QUAD_LD919:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2638: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc27b401a  ! 2639: SWAP_R	swap	%r1, [%r13 + %r26]
CHANGE_USER920:
	ta	T_CHANGE_NONPRIV
CHANGE_R26921:
	add	%r26,	%r27,	%r26
NC_BIS_PRI921:
	.word 0xc4bb9c5a  ! 2641: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
BLK_PRI922:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2643: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc28c903a  ! 2645: LDUBA_R	lduba	[%r18, %r26] 0x81, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP924:
	.word 0xc28e021a  ! 2647: LDUBA_R	lduba	[%r24, %r26] 0x10, %r1
CP_BIS_QUAD_LD925:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2649: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xc03a801a  ! 2650: STD_R	std	%r0, [%r10 + %r26]
CP_AIUP926:
	.word 0xc2b6031a  ! 2652: STHA_R	stha	%r1, [%r24 + %r26] 0x18
NC_PST_PRI927:
	.word 0xc3bc191a  ! 2654: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc2ac903a  ! 2656: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc2cad05a  ! 2657: LDSBA_R	ldsba	[%r11, %r26] 0x82, %r1
NC_PST_PRI928:
	.word 0xc3bc199a  ! 2659: STDFA_R	stda	%f1, [%r26, %r16]
	.word 0xc2cc101a  ! 2661: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r1
NC_PST_PRI929:
	.word 0xc3bc185a  ! 2663: STDFA_R	stda	%f1, [%r26, %r16]
NC_AIUP930:
	.word 0xc2d6431a  ! 2665: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r1
NC_BLK_SEc931:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2667: LDDFA_R	ldda	[%r19, %r26], %f0
NC_SHORT_FP_SEC932:
	.word 0xc39cdb3a  ! 2669: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc383511a  ! 2670: LDFA_R	lda	[%r13, %r26], %f1
	.word 0xc2f4903a  ! 2672: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
	.word 0xc284903a  ! 2674: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
	.word 0xc384903a  ! 2676: LDFA_R	lda	[%r18, %r26], %f1
	.word 0xc27b6024  ! 2677: SWAP_I	swap	%r1, [%r13 + 0x0024]
CP_ATM_QUAD_LD933:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2679: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc383901a  ! 2681: LDFA_R	lda	[%r14, %r26], %f1
NC_BIS_AIUP934:
	.word 0xcca6455a  ! 2683: STWA_R	stwa	%r6, [%r25 + %r26] 0x2a
	.word 0xc2dc903a  ! 2685: LDXA_R	ldxa	[%r18, %r26] 0x81, %r1
CHANGE_USER935:
	ta	T_CHANGE_NONPRIV
CHANGE_R26936:
	add	%r26,	%r27,	%r26
CP_BIS_PRI936:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 2687: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
BLK_PRI937:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2689: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc283d01a  ! 2691: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r1
	.word 0xc384d13a  ! 2693: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc33a801a  ! 2694: STDF_R	std	%f1, [%r26, %r10]
CHANGE_PRIV938:
	ta	T_CHANGE_PRIV
CHANGE_R26939:
	mov	%g0,	%r26
CP_BIS_AIUS939:
	and	%r26,	%r28,	%r26
	.word 0xd0b7857a  ! 2696: STHA_R	stha	%r8, [%r30 + %r26] 0x2b
	.word 0xc27b001a  ! 2697: SWAP_R	swap	%r1, [%r12 + %r26]
	.word 0xc2f3111a  ! 2698: STXA_R	stxa	%r1, [%r12 + %r26] 0x88
	.word 0xc2c3901a  ! 2700: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r1
	.word 0xc09cd13a  ! 2702: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
	.word 0xc0bc903a  ! 2704: STDA_R	stda	%r0, [%r18 + %r26] 0x81
	.word 0xc2eb111a  ! 2705: LDSTUBA_R	ldstuba	%r1, [%r12 + %r26] 0x88
	.word 0xc2abd01a  ! 2707: STBA_R	stba	%r1, [%r15 + %r26] 0x80
NC_AIUP940:
	.word 0xc2b6421a  ! 2709: STHA_R	stha	%r1, [%r25 + %r26] 0x10
NC_BLK_SEc941:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2711: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_QUAD_LD942:
	and	%r26,	%r29,	%r26
	.word 0xc89b5d5a  ! 2713: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
NC_AIUP943:
	.word 0xc286431a  ! 2715: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r1
CP_BIS_AIUP944:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 2717: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
	.word 0xc2ab901a  ! 2719: STBA_R	stba	%r1, [%r14 + %r26] 0x80
NC_BLK_SEc945:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2721: STDFA_R	stda	%f0, [%r26, %r19]
BLK_PRI946:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 2723: LDDFA_R	ldda	[%r13, %r26], %f0
NC_AIUP947:
	.word 0xc2c6421a  ! 2725: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r1
	.word 0xc31b2020  ! 2726: LDDF_I	ldd	[%r12, 0x0020], %f1
	.word 0xc3a2901a  ! 2727: STFA_R	sta	%f1, [%r26, %r10]
CHANGE_USER948:
	ta	T_CHANGE_NONPRIV
CHANGE_R26949:
	add	%r26,	%r27,	%r26
NC_BIS_PRI949:
	.word 0xc4a45d5a  ! 2729: STWA_R	stwa	%r2, [%r17 + %r26] 0xea
	.word 0xc09a905a  ! 2730: LDDA_R	ldda	[%r10, %r26] 0x82, %r0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS951:
	.word 0xc2af833a  ! 2732: STBA_R	stba	%r1, [%r30 + %r26] 0x19
NC_BIS_AIUP952:
	.word 0xc4f6445a  ! 2734: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUS953:
	.word 0xc4f7c47a  ! 2736: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_PST_PRI954:
	.word 0xc3bb981a  ! 2738: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc0bcd03a  ! 2740: STDA_R	stda	%r0, [%r19 + %r26] 0x81
NC_AIUS955:
	.word 0xc39fc23a  ! 2742: LDDFA_R	ldda	[%r31, %r26], %f1
NC_BLK_SEc956:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2744: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_NUC957:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 2746: STBA_R	stba	%r8, [%r20 + %r26] 0x27
NC_BLK_SEc958:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2748: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc39c903a  ! 2750: LDDFA_R	ldda	[%r18, %r26], %f1
NC_AIUP959:
	.word 0xc09e421a  ! 2752: LDDA_R	ldda	[%r25, %r26] 0x10, %r0
	.word 0xc2a3d01a  ! 2754: STWA_R	stwa	%r1, [%r15 + %r26] 0x80
NC_SHORT_FP_SEC960:
	.word 0xc3bcda7a  ! 2756: STDFA_R	stda	%f1, [%r26, %r19]
CP_BIS_AIUS961:
	and	%r26,	%r28,	%r26
	.word 0xc8af847a  ! 2758: STBA_R	stba	%r4, [%r30 + %r26] 0x23
BLK_PRI962:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2760: LDDFA_R	ldda	[%r10, %r26], %f0
BLK_PRI963:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2762: LDDFA_R	ldda	[%r10, %r26], %f16
CP_BIS_AIUP964:
	and	%r26,	%r28,	%r26
	.word 0xccf6055a  ! 2764: STXA_R	stxa	%r6, [%r24 + %r26] 0x2a
	.word 0xc2f4d03a  ! 2766: STXA_R	stxa	%r1, [%r19 + %r26] 0x81
	.word 0xc3a4d03a  ! 2768: STFA_R	sta	%f1, [%r26, %r19]
NC_AIUS965:
	.word 0xc3bfc23a  ! 2770: STDFA_R	stda	%f1, [%r26, %r31]
CHANGE_USER966:
	ta	T_CHANGE_NONPRIV
CHANGE_R26967:
	add	%r26,	%r27,	%r26
CP_BIS_PRI967:
	and	%r26,	%r28,	%r26
	.word 0xc4b2dc5a  ! 2772: STHA_R	stha	%r2, [%r11 + %r26] 0xe2
	.word 0xc2ac101a  ! 2774: STBA_R	stba	%r1, [%r16 + %r26] 0x80
NC_BIS_PRI968:
	.word 0xd0b3dd5a  ! 2776: STHA_R	stha	%r8, [%r15 + %r26] 0xea
	.word 0xc2b4913a  ! 2778: STHA_R	stha	%r1, [%r18 + %r26] 0x89
WR_LEASI_969:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_970:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS972:
	.word 0xc2f7823a  ! 2781: STXA_R	stxa	%r1, [%r30 + %r26] 0x11
NC_NUC973:
	.word 0xc2ad409a  ! 2783: STBA_R	stba	%r1, [%r21 + %r26] 0x04
	.word 0xc384d13a  ! 2785: LDFA_R	lda	[%r19, %r26], %f1
	.word 0xc09cd03a  ! 2787: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc3e2e01a  ! 2788: CASA_R	casa	[%r11] %asi, %r26, %r1
	.word 0xc223001a  ! 2789: STW_R	stw	%r1, [%r12 + %r26]
	.word 0xc09cd03a  ! 2791: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
NC_BIS_AIUS974:
	.word 0xccafc47a  ! 2793: STBA_R	stba	%r6, [%r31 + %r26] 0x23
CP_BIS_AIUS975:
	and	%r26,	%r28,	%r26
	.word 0xd0b7847a  ! 2795: STHA_R	stha	%r8, [%r30 + %r26] 0x23
CHANGE_R26976:
	add	%r26,	%r27,	%r26
CP_BIS_SEC976:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 2797: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
	.word 0xc2cb901a  ! 2799: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r1
CP_PST_PRI977:
	.word 0xc3ba991a  ! 2801: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc3ba901a  ! 2802: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc27ac01a  ! 2803: SWAP_R	swap	%r1, [%r11 + %r26]
CP_AIUS978:
	.word 0xc3bf833a  ! 2805: STDFA_R	stda	%f1, [%r26, %r30]
	.word 0xc3bad11a  ! 2806: STDFA_R	stda	%f1, [%r26, %r11]
	.word 0xc2abd01a  ! 2808: STBA_R	stba	%r1, [%r15 + %r26] 0x80
	.word 0xc28c913a  ! 2810: LDUBA_R	lduba	[%r18, %r26] 0x89, %r1
NC_PST_PRI979:
	.word 0xc3bc599a  ! 2812: STDFA_R	stda	%f1, [%r26, %r17]
NC_BIS_AIUS980:
	.word 0xc4b7c57a  ! 2814: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
WR_LEASI_981:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_982:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BIS_AIUP983:
	.word 0xccf6445a  ! 2817: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xc283101a  ! 2818: LDUWA_R	lduwa	[%r12, %r26] 0x80, %r1
CP_BIS_AIUP984:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 2820: STBA_R	stba	%r4, [%r24 + %r26] 0x22
CP_AIUS985:
	.word 0xc0bf823a  ! 2822: STDA_R	stda	%r0, [%r30 + %r26] 0x11
CP_BIS_QUAD_LD986:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 2824: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	.word 0xc20b2027  ! 2825: LDUB_I	ldub	[%r12 + 0x0027], %r1
NC_AIUP987:
	.word 0xc2de421a  ! 2827: LDXA_R	ldxa	[%r25, %r26] 0x10, %r1
NC_SHORT_FP_SEC988:
	.word 0xc39cdb7a  ! 2829: LDDFA_R	ldda	[%r19, %r26], %f1
	.word 0xc03ac01a  ! 2830: STD_R	std	%r0, [%r11 + %r26]
	.word 0xc31b2020  ! 2831: LDDF_I	ldd	[%r12, 0x0020], %f1
CP_BIS_AIUP989:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 2833: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
CP_BIS_NUC990:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 2835: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
	.word 0xc28c101a  ! 2837: LDUBA_R	lduba	[%r16, %r26] 0x80, %r1
	.word 0xc20b401a  ! 2838: LDUB_R	ldub	[%r13 + %r26], %r1
	.word 0xc09cd03a  ! 2840: LDDA_R	ldda	[%r19, %r26] 0x81, %r0
	.word 0xc2f2901a  ! 2841: STXA_R	stxa	%r1, [%r10 + %r26] 0x80
NC_PST_PRI991:
	.word 0xc3bbd81a  ! 2843: STDFA_R	stda	%f1, [%r26, %r15]
NC_BLK_SEc992:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2845: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc2a4501a  ! 2847: STWA_R	stwa	%r1, [%r17 + %r26] 0x80
	.word 0xc222a024  ! 2848: STW_I	stw	%r1, [%r10 + 0x0024]
CHANGE_R26993:
	add	%r26,	%r27,	%r26
CP_BIS_SEC993:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2850: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xc26aa027  ! 2851: LDSTUB_I	ldstub	%r1, [%r10 + 0x0027]
	.word 0xc382905a  ! 2852: LDFA_R	lda	[%r10, %r26], %f1
NC_BIS_SEC994:
	.word 0xc8f4dc7a  ! 2854: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xc284d13a  ! 2856: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r1
CP_ATM_QUAD_LD995:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 2858: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xc294903a  ! 2860: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
	.word 0xc5efc5fa  ! 2862: PREFETCHA_R	prefetcha	[%r31, %r26] 0x2f, #n_writes
	.word 0xc2432024  ! 2863: LDSW_I	ldsw	[%r12 + 0x0024], %r1
	.word 0xc28cd03a  ! 2865: LDUBA_R	lduba	[%r19, %r26] 0x81, %r1
	.word 0xc2ac903a  ! 2867: STBA_R	stba	%r1, [%r18 + %r26] 0x81
	.word 0xc25a801a  ! 2868: LDX_R	ldx	[%r10 + %r26], %r1
SHORT_FP_PRI996:
	.word 0xc3ba9b5a  ! 2870: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc383501a  ! 2871: LDFA_R	lda	[%r13, %r26], %f1
	.word 0xc383505a  ! 2872: LDFA_R	lda	[%r13, %r26], %f1
CHANGE_R26997:
	add	%r26,	%r27,	%r26
CP_BIS_SEC997:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 2874: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
NC_BIS_SEC998:
	.word 0xc4acdc7a  ! 2876: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc2acd03a  ! 2878: STBA_R	stba	%r1, [%r19 + %r26] 0x81
	.word 0xc09c913a  ! 2880: LDDA_R	ldda	[%r18, %r26] 0x89, %r0
	.word 0xc3bb501a  ! 2881: STDFA_R	stda	%f1, [%r26, %r13]
NC_NUC999:
	.word 0xc3bd419a  ! 2883: STDFA_R	stda	%f1, [%r26, %r21]
	.word 0xc2b3901a  ! 2885: STHA_R	stha	%r1, [%r14 + %r26] 0x80
	.word 0xc294101a  ! 2887: LDUHA_R	lduha	[%r16, %r26] 0x80, %r1
SET_TL1_1000:
	ta	T_CHANGE_TO_TL1
CHANGE_R261001:
	mov	%g0,	%r26
NC_BIS_NUC1001:
	.word 0xcca544fa  ! 2889: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xc3ba901a  ! 2890: STDFA_R	stda	%f1, [%r26, %r10]
CP_BIS_NUC1002:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 2892: STHA_R	stha	%r6, [%r20 + %r26] 0x27
	.word 0xc2d4d03a  ! 2894: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r1
	.word 0xc2ac913a  ! 2896: STBA_R	stba	%r1, [%r18 + %r26] 0x89
SHORT_FP_PRI1003:
	.word 0xc3bb1a1a  ! 2898: STDFA_R	stda	%f1, [%r26, %r12]
NC_BLK_SEc1004:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2900: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc31ac01a  ! 2901: LDDF_R	ldd	[%r11, %r26], %f1
	.word 0xc284501a  ! 2903: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r1
	.word 0xc28b911a  ! 2905: LDUBA_R	lduba	[%r14, %r26] 0x88, %r1
	.word 0xc222801a  ! 2906: STW_R	stw	%r1, [%r10 + %r26]
	.word 0xc2a4d13a  ! 2908: STWA_R	stwa	%r1, [%r19 + %r26] 0x89
SET_TL0_1005:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI1006:
	and	%r26,	%r28,	%r26
	.word 0xd0a31c5a  ! 2910: STWA_R	stwa	%r8, [%r12 + %r26] 0xe2
CP_BIS_PRI1007:
	and	%r26,	%r28,	%r26
	.word 0xd0b2dd5a  ! 2912: STHA_R	stha	%r8, [%r11 + %r26] 0xea
	.word 0xc284903a  ! 2914: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r1
	.word 0xc2ac903a  ! 2916: STBA_R	stba	%r1, [%r18 + %r26] 0x81
CHANGE_PRIV1008:
	ta	T_CHANGE_PRIV
CHANGE_R261009:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP1009:
	.word 0xc8f6445a  ! 2918: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xc2db911a  ! 2920: LDXA_R	ldxa	[%r14, %r26] 0x88, %r1
CHANGE_R261010:
	add	%r26,	%r27,	%r26
CP_BIS_SEC1010:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2922: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xc2f4903a  ! 2924: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
	.word 0xc294d03a  ! 2926: LDUHA_R	lduha	[%r19, %r26] 0x81, %r1
	.word 0xc322801a  ! 2927: STF_R	st	%f1, [%r26, %r10]
NC_AIUS1011:
	.word 0xc297c23a  ! 2929: LDUHA_R	lduha	[%r31, %r26] 0x11, %r1
CP_BIS_AIUP1012:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 2931: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CP_AIUS1013:
	.word 0xc2f7823a  ! 2933: STXA_R	stxa	%r1, [%r30 + %r26] 0x11
	.word 0xc3bad11a  ! 2934: STDFA_R	stda	%f1, [%r26, %r11]
CP_AIUS1014:
	.word 0xc387823a  ! 2936: LDFA_R	lda	[%r30, %r26], %f1
BLK_PRI1015:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 2938: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc2dcd03a  ! 2940: LDXA_R	ldxa	[%r19, %r26] 0x81, %r1
CP_BIS_QUAD_LD1016:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 2942: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xc294903a  ! 2944: LDUHA_R	lduha	[%r18, %r26] 0x81, %r1
CP_NUC1017:
	.word 0xc2ed019a  ! 2946: LDSTUBA_R	ldstuba	%r1, [%r20 + %r26] 0x0c
NC_PST_PRI1018:
	.word 0xc3bc581a  ! 2948: STDFA_R	stda	%f1, [%r26, %r17]
	.word 0xc26a801a  ! 2949: LDSTUB_R	ldstub	%r1, [%r10 + %r26]
	.word 0xc28c511a  ! 2951: LDUBA_R	lduba	[%r17, %r26] 0x88, %r1
CP_BIS_QUAD_LD1019:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2953: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc3ba901a  ! 2954: STDFA_R	stda	%f1, [%r26, %r10]
	.word 0xc232a026  ! 2955: STH_I	sth	%r1, [%r10 + 0x0026]
	.word 0xc3a3511a  ! 2956: STFA_R	sta	%f1, [%r26, %r13]
	.word 0xc2f4903a  ! 2958: STXA_R	stxa	%r1, [%r18 + %r26] 0x81
	.word 0xc383d01a  ! 2960: LDFA_R	lda	[%r15, %r26], %f1
CP_BIS_NUC1020:
	and	%r26,	%r28,	%r26
	.word 0xd0b505fa  ! 2962: STHA_R	stha	%r8, [%r20 + %r26] 0x2f
	.word 0xc09cd13a  ! 2964: LDDA_R	ldda	[%r19, %r26] 0x89, %r0
NC_AIUP1021:
	.word 0xc0be431a  ! 2966: STDA_R	stda	%r0, [%r25 + %r26] 0x18
	.word 0xc2c4903a  ! 2968: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r1
	.word 0xc2b4913a  ! 2970: STHA_R	stha	%r1, [%r18 + %r26] 0x89
	.word 0xc31ac01a  ! 2971: LDDF_R	ldd	[%r11, %r26], %f1
CHANGE_USER1022:
	ta	T_CHANGE_NONPRIV
CHANGE_R261023:
	add	%r26,	%r27,	%r26
NC_BIS_PRI1023:
	.word 0xcca41c5a  ! 2973: STWA_R	stwa	%r6, [%r16 + %r26] 0xe2
CP_PST_PRI1024:
	.word 0xc3ba981a  ! 2975: STDFA_R	stda	%f1, [%r26, %r10]
CHANGE_TLE1025:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc2cc903a  ! 2978: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r1
	.word 0xc2ccd03a  ! 2980: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r1
	.word 0xc09c903a  ! 2982: LDDA_R	ldda	[%r18, %r26] 0x81, %r0
	.word 0xc3bb901a  ! 2984: STDFA_R	stda	%f1, [%r26, %r14]
	.word 0xc0bc101a  ! 2986: STDA_R	stda	%r0, [%r16 + %r26] 0x80
CHANGE_PRIV1026:
	ta	T_CHANGE_PRIV
CHANGE_R261027:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD1027:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 2988: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
NC_BIS_SEC1028:
	.word 0xccacdc7a  ! 2990: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
NC_BIS_AIUP1029:
	.word 0xc8f6445a  ! 2992: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xc31aa020  ! 2993: LDDF_I	ldd	[%r10, 0x0020], %f1
NC_NUC1030:
	.word 0xc3a5419a  ! 2995: STFA_R	sta	%f1, [%r26, %r21]
CP_BIS_AIUP1031:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 2997: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x3486482d2b0745c7
.xword 0x2111a9b0335e41d1
.xword 0x7c17274da46f8b2b
.xword 0xda72af239486744d
.xword 0x87a058e59ff223dc
.xword 0x34d89f6cc260a69a
.xword 0x872d40d55ea4a5f5
.xword 0xd47b726ed8983e9a
.xword 0xfd6edfc7a2273e9a
.xword 0x2a2855db8a5331c2
.xword 0x06cce82bca6ef09f
.xword 0x5ad2b56a3f3a69ac
.xword 0x154ec094d427bc75
.xword 0x0790970a021b1120
.xword 0x70ac1876cbcd358a
.xword 0x0140ce2531694f49
.xword 0xb84fcd59f5879831
.xword 0x0a890a088e3b052a
.xword 0xff2db5f6ec2f91ae
.xword 0x94b88fc1326cbecd
.xword 0x9ca8c6f0e2ed4633
.xword 0xb3e639943748b0fa
.xword 0x8cbe9c53fde398af
.xword 0x80035d7e855a5421
.xword 0x02036f4ceaa3946d
.xword 0xbc0021ad7ac1a5b5
.xword 0x8a8438fab72bd433
.xword 0xcde36c5e2c296c1f
.xword 0xfb951031bc77fc13
.xword 0x5969dc061595679c
.xword 0x97ec7a21c127c87e
.xword 0x1e949e56e12e43f7



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
.xword 0x7b9b51775b4ef841

.xword 0x50ffe3f5b4e3227a

.xword 0x5de71a371e211216

.xword 0xbbd3eb381d20fab0

.xword 0xb182c4a7cb185192

.xword 0xd01e68f02af37245

.xword 0x1f6141005b3f8173

.xword 0x8ec22e6cb3e48c9c

.xword 0x628377388d5c0e52

.xword 0xe39867d55dbfeb5d

.xword 0x2f11c0341f622fe8

.xword 0x337d94b414571a7c

.xword 0x59ad46e4238333ee

.xword 0x471fefcec2b663e6

.xword 0x5a71ca0e2b1cc97b

.xword 0x0760189369323d74

.xword 0xca7d647b251616a1

.xword 0xfa33b5d91cd00a91

.xword 0x7b25f625fbc8800b

.xword 0x27aeba51bccb6503

.xword 0x218ca3dc9f3b7793

.xword 0xd7578a7b02099f8d

.xword 0x477fbb8fe73c9f9f

.xword 0x64b3e142a63ebff4

.xword 0xa6eda36a84c23827

.xword 0xd2f7c22e01022ce2

.xword 0xe705100f7c989f82

.xword 0xfe7a93b1874e9618

.xword 0x36767bab51c7b35b

.xword 0xf3306b7df3da410e

.xword 0x73a391ef9eb10fb8

.xword 0x207b36863cd4a3bb




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
.xword 0x547af9a1beb400e2
.xword 0xc95f5478f319594b
.xword 0xa04a9f57dfd6d07c
.xword 0x223e01dafdae263f
.xword 0x0d3d69dfb7ce3f01
.xword 0xc0f96de2e989f2cc
.xword 0x5f76f031c4b0e074
.xword 0x6eac77c425458dd3
.xword 0x2cce3e6f92313767




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
.xword 0x398ac3a05ebd6324
.xword 0x48694cb05beebab9
.xword 0xb1ee7567674ff0a9
.xword 0x895c5ae977f4f340
.xword 0x33a9d8d9c699cdc3
.xword 0xb6149f24623faa97
.xword 0x8da582b7ff8c9452
.xword 0x5602796e768fcc28
.xword 0xbe504590e5421d5e




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
.xword 0xc189c78d628ff6b9
.xword 0x9a9f057e55f9f7d1
.xword 0x69269310744f372c
.xword 0x3a57716fccd4aac7
.xword 0xb07844290b6b4e3b
.xword 0xf7cbe8d32ec4e66a
.xword 0x490b86f1bd078048
.xword 0xf509208109f46492
.xword 0x3fc84aa3aab13582




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
.xword 0xd654c64fe6d8132f
.xword 0x3017ccb9c95f3fbb
.xword 0xf7c485caebb119b3
.xword 0xb7967ab3aa339e34
.xword 0xc114b1a8eda10d99
.xword 0xc4cf273361e73fb5
.xword 0x9cbf6c498196172c
.xword 0xfe1ae6a505551042
.xword 0x2dd8aab49d056faf




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
.xword 0x45b55137621b00aa
.xword 0x99eed7cbba424c3c
.xword 0x13eb1217e720be1d
.xword 0xd390a1121206b9d7
.xword 0xa99d82cc23a5ca83
.xword 0xce9804febc638655
.xword 0xe385c543088aee18
.xword 0x5386b6d81853f7cd
.xword 0x597468cb6324c0ba




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
.xword 0x9c516aee2b123fb4
.xword 0xc067d0215193dfea
.xword 0x5d93643c587c13c4
.xword 0x24ddf873f781b810
.xword 0xb9b6e0416867527c
.xword 0xcf19c0f82a3d737e
.xword 0x9d3286a06d5e0480
.xword 0x439a5e7c93df97e4
.xword 0x8969e0f8d05a6683




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
.xword 0x6443cfa6b92889b3
.xword 0x407d61326e0b3c92
.xword 0x16556099a39e4a35
.xword 0x52574f8af44ba613
.xword 0x18f118651cfb921b
.xword 0x6b4d3aae5fdb8667
.xword 0xdcbf81e530f276f4
.xword 0x146d79eab80f7302
.xword 0xe1125a9d41be67b1




SECTION .CPPRI_SEG_8 DATA_VA = 0x0000005abcc20000
attr_data {
	Name	 = .CPPRI_SEG_8,
	VA	 = 0x0000005abcc20000,
	RA	 = 0x0000005123410000,
	PA	 = ra2pa(0x0000005123410000,0),
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
.global SEC_CPPRI_DATA8_START
SEC_CPPRI_DATA8_START:
.xword 0x62cefecfc802fc97
.xword 0xdc292e33a99b93fc
.xword 0x15cba1fc56701c3e
.xword 0x8fc85d534423b3cc
.xword 0xf7e9b4a1fb44a5b0
.xword 0xbf1e5afb6ac21d30
.xword 0x1673f9c15d7ab765
.xword 0x11aa0d8ae851b951
.xword 0x8b3f108aa2e06bfc




SECTION .CPPRI_SEG_9 DATA_VA = 0x0000005abcc24000
attr_data {
	Name	 = .CPPRI_SEG_9,
	VA	 = 0x0000005abcc24000,
	RA	 = 0x0000005123412000,
	PA	 = ra2pa(0x0000005123412000,0),
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
.global SEC_CPPRI_DATA9_START
SEC_CPPRI_DATA9_START:
.xword 0x8bb16a08448f40ed
.xword 0x21d622069932625d
.xword 0x4b9f9431de752395
.xword 0x96c78a88d602e3e2
.xword 0xde18952339d369c1
.xword 0xec509dcd075718df
.xword 0x0add8d182046170e
.xword 0xbe7ea7ed45a4d23e
.xword 0x8edfe970982b3267




SECTION .CPPRI_SEG_10 DATA_VA = 0x0000005abcc28000
attr_data {
	Name	 = .CPPRI_SEG_10,
	VA	 = 0x0000005abcc28000,
	RA	 = 0x0000005123414000,
	PA	 = ra2pa(0x0000005123414000,0),
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
.global SEC_CPPRI_DATA10_START
SEC_CPPRI_DATA10_START:
.xword 0x75bab2babdb43cc6
.xword 0xfeb2559bec90c834
.xword 0xaa24241bb45d3231
.xword 0xdbe95d36e9fb3731
.xword 0xd845a1f23198b299
.xword 0x7369c8430935971f
.xword 0x0b38725254082123
.xword 0x9b9ea2dd037a5f42
.xword 0x5f9a148fc554a452




SECTION .CPPRI_SEG_11 DATA_VA = 0x0000005abcc2c000
attr_data {
	Name	 = .CPPRI_SEG_11,
	VA	 = 0x0000005abcc2c000,
	RA	 = 0x0000005123416000,
	PA	 = ra2pa(0x0000005123416000,0),
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
.global SEC_CPPRI_DATA11_START
SEC_CPPRI_DATA11_START:
.xword 0xea08333a7cd91e15
.xword 0x334bf7e66ac898e8
.xword 0xdbc88531efabd677
.xword 0x9aa4114baa7929e0
.xword 0xc65976f0130feb6c
.xword 0x8a9829a7d534217c
.xword 0x9dcacec6e2377604
.xword 0xb850e85024a51a83
.xword 0x67fb332d6cd9c0cd




SECTION .CPPRI_SEG_12 DATA_VA = 0x0000005abcc30000
attr_data {
	Name	 = .CPPRI_SEG_12,
	VA	 = 0x0000005abcc30000,
	RA	 = 0x0000005123418000,
	PA	 = ra2pa(0x0000005123418000,0),
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
.global SEC_CPPRI_DATA12_START
SEC_CPPRI_DATA12_START:
.xword 0x4808e7d09d4a0b61
.xword 0x10e4a9071a481fef
.xword 0x08b616ba972d50f5
.xword 0xf148b088d39fceae
.xword 0x16f54ecd210a360c
.xword 0x2e31ed029a2b8c7f
.xword 0x7a05ddcfa19db620
.xword 0x5de29d3663d6ac57
.xword 0xe199d5348afab120




SECTION .CPPRI_SEG_13 DATA_VA = 0x0000005abcc34000
attr_data {
	Name	 = .CPPRI_SEG_13,
	VA	 = 0x0000005abcc34000,
	RA	 = 0x000000512341a000,
	PA	 = ra2pa(0x000000512341a000,0),
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
.global SEC_CPPRI_DATA13_START
SEC_CPPRI_DATA13_START:
.xword 0xffc161c99efa6ad4
.xword 0x86c99333c091f58f
.xword 0xfd90d8b71964520b
.xword 0x61e96370d200d6cf
.xword 0xe08245eceb721271
.xword 0x77748b7090c97cb0
.xword 0x1af0ab07ff776b14
.xword 0xc934faa0b932c521
.xword 0x53c7e47b8af9bd02




SECTION .CPPRI_SEG_14 DATA_VA = 0x0000005abcc38000
attr_data {
	Name	 = .CPPRI_SEG_14,
	VA	 = 0x0000005abcc38000,
	RA	 = 0x000000512341c000,
	PA	 = ra2pa(0x000000512341c000,0),
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
.global SEC_CPPRI_DATA14_START
SEC_CPPRI_DATA14_START:
.xword 0x90add5368f5b9ab3
.xword 0x891053eafd9e8db6
.xword 0x04dbf82321cb56f0
.xword 0x3647a8ba1b971669
.xword 0x7877384be2c49648
.xword 0x0ee9b20e187080b4
.xword 0xc73a1adab7807996
.xword 0x353dc1497ecfbf89
.xword 0xf6a96f92715d8850




SECTION .CPPRI_SEG_15 DATA_VA = 0x0000005abcc3c000
attr_data {
	Name	 = .CPPRI_SEG_15,
	VA	 = 0x0000005abcc3c000,
	RA	 = 0x000000512341e000,
	PA	 = ra2pa(0x000000512341e000,0),
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
.global SEC_CPPRI_DATA15_START
SEC_CPPRI_DATA15_START:
.xword 0x59941dece066e698
.xword 0x913c79fd3b4ec0b5
.xword 0xecadc78eafff11d1
.xword 0x854b8f08948d4d2f
.xword 0x1618883620285e0b
.xword 0xd70512bc978b4394
.xword 0x7eae3cf8487f13c1
.xword 0x56df94db2af25bbb
.xword 0x29a5b87ab1c7b0f9




SECTION .CPPRI_SEG_16 DATA_VA = 0x0000005abcc40000
attr_data {
	Name	 = .CPPRI_SEG_16,
	VA	 = 0x0000005abcc40000,
	RA	 = 0x0000005123420000,
	PA	 = ra2pa(0x0000005123420000,0),
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
.global SEC_CPPRI_DATA16_START
SEC_CPPRI_DATA16_START:
.xword 0x33f56aa24878ab95
.xword 0x100f9c873f91c667
.xword 0x2091d606e146b1cb
.xword 0x3accef611c6c6cde
.xword 0x7d1752eabd601d10
.xword 0x57164461f4e8c904
.xword 0xd36a6e0f7b1b25b7
.xword 0x947cefb2d157ff17
.xword 0xc93a60ab30974834




SECTION .CPPRI_SEG_17 DATA_VA = 0x0000005abcc44000
attr_data {
	Name	 = .CPPRI_SEG_17,
	VA	 = 0x0000005abcc44000,
	RA	 = 0x0000005123422000,
	PA	 = ra2pa(0x0000005123422000,0),
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
.global SEC_CPPRI_DATA17_START
SEC_CPPRI_DATA17_START:
.xword 0xb4891dbc474fc18e
.xword 0x8ac1c7ecff8a66f9
.xword 0x30d38b2094836b97
.xword 0x1ac5ab0a863c6df9
.xword 0xf1c5e479971c68b2
.xword 0x3cc154498fc8e552
.xword 0x5514d7523c4d0cd4
.xword 0x5d81d811e9157d66
.xword 0xbf925cad39a98247




SECTION .CPPRI_SEG_18 DATA_VA = 0x0000005abcc48000
attr_data {
	Name	 = .CPPRI_SEG_18,
	VA	 = 0x0000005abcc48000,
	RA	 = 0x0000005123424000,
	PA	 = ra2pa(0x0000005123424000,0),
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
.global SEC_CPPRI_DATA18_START
SEC_CPPRI_DATA18_START:
.xword 0xf9a14a6b1eff24a0
.xword 0x2d0939bbed87b912
.xword 0x964368d713341095
.xword 0xbcf675a15afe3d15
.xword 0x71be81352036cc3d
.xword 0x1696299a63c81a0a
.xword 0xce5fd0e5de4a0083
.xword 0x92a4119cea0f6d46
.xword 0x12b186a68978c555




SECTION .CPPRI_SEG_19 DATA_VA = 0x0000005abcc4c000
attr_data {
	Name	 = .CPPRI_SEG_19,
	VA	 = 0x0000005abcc4c000,
	RA	 = 0x0000005123426000,
	PA	 = ra2pa(0x0000005123426000,0),
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
.global SEC_CPPRI_DATA19_START
SEC_CPPRI_DATA19_START:
.xword 0xd7b5587774c808d4
.xword 0xe09f8dd3a407dee8
.xword 0x8024e27fdfc5b95f
.xword 0xca20f15e25458af3
.xword 0x6b0ea7820aedb297
.xword 0xc6f0cb8d40d61161
.xword 0xfef7e6aa652e21b2
.xword 0x86f897395c6a5856
.xword 0xf812a29ef77a81aa




SECTION .CPPRI_SEG_20 DATA_VA = 0x0000005abcc50000
attr_data {
	Name	 = .CPPRI_SEG_20,
	VA	 = 0x0000005abcc50000,
	RA	 = 0x0000005123428000,
	PA	 = ra2pa(0x0000005123428000,0),
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
.global SEC_CPPRI_DATA20_START
SEC_CPPRI_DATA20_START:
.xword 0x6e71b40d441e8933
.xword 0xfdc20ebfd90de142
.xword 0x81d4fc8511db8964
.xword 0xbddab3f233f884e5
.xword 0xb7e194921c0904b8
.xword 0x20496b9854108d94
.xword 0x4dc9d542abed607e
.xword 0x633cdec620210c13
.xword 0x755739af0a1d7660




SECTION .CPPRI_SEG_21 DATA_VA = 0x0000005abcc54000
attr_data {
	Name	 = .CPPRI_SEG_21,
	VA	 = 0x0000005abcc54000,
	RA	 = 0x000000512342a000,
	PA	 = ra2pa(0x000000512342a000,0),
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
.global SEC_CPPRI_DATA21_START
SEC_CPPRI_DATA21_START:
.xword 0xc865bd0c359e1c25
.xword 0x2148f371e0c541d8
.xword 0xa1929807e2840521
.xword 0x4a4f4f42ba3267df
.xword 0x9bb36473aaf83115
.xword 0xe7c3ca7fc7160621
.xword 0x27460ef5cffa7de0
.xword 0x18466232f5e71fa0
.xword 0x2f86dc30b821ca22




SECTION .CPPRI_SEG_22 DATA_VA = 0x0000005abcc58000
attr_data {
	Name	 = .CPPRI_SEG_22,
	VA	 = 0x0000005abcc58000,
	RA	 = 0x000000512342c000,
	PA	 = ra2pa(0x000000512342c000,0),
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
.global SEC_CPPRI_DATA22_START
SEC_CPPRI_DATA22_START:
.xword 0xdedfeef9482f0c5f
.xword 0x86dfa859377d9520
.xword 0xbc8b0f8eac070736
.xword 0xc914cfe5a59fcd4e
.xword 0xc1c54004b32be54c
.xword 0xf41a1808cb536d9a
.xword 0x4b9ba1b856862e82
.xword 0xd0647c8b2e5ba8b8
.xword 0xd9b238bfd630652f




SECTION .CPPRI_SEG_23 DATA_VA = 0x0000005abcc5c000
attr_data {
	Name	 = .CPPRI_SEG_23,
	VA	 = 0x0000005abcc5c000,
	RA	 = 0x000000512342e000,
	PA	 = ra2pa(0x000000512342e000,0),
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
.global SEC_CPPRI_DATA23_START
SEC_CPPRI_DATA23_START:
.xword 0x55df9f3278611afe
.xword 0x36908c39571b86b8
.xword 0x50b57bc2809d4a72
.xword 0xbd2c5c1e25c255e7
.xword 0x34c373b91caf708e
.xword 0xe52501666dcabc7a
.xword 0x25e1c4d3c9afaf21
.xword 0xe825edfc3ee613f7
.xword 0x4eb9052b2fa8f2a1




SECTION .CPPRI_SEG_24 DATA_VA = 0x0000005abcc60000
attr_data {
	Name	 = .CPPRI_SEG_24,
	VA	 = 0x0000005abcc60000,
	RA	 = 0x0000005123430000,
	PA	 = ra2pa(0x0000005123430000,0),
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
.global SEC_CPPRI_DATA24_START
SEC_CPPRI_DATA24_START:
.xword 0xe487519330a71d17
.xword 0x59b6a3f3d0f7259c
.xword 0xeeaeeab7b784e77a
.xword 0x91d114e95324c99a
.xword 0x7d3eb1f6321ad9c2
.xword 0x51b08ae43a4ad4bf
.xword 0x1ae1a49cc15b20ac
.xword 0x48c6e52e6d79e72c
.xword 0xdf20a5192082a6c3




SECTION .CPPRI_SEG_25 DATA_VA = 0x0000005abcc64000
attr_data {
	Name	 = .CPPRI_SEG_25,
	VA	 = 0x0000005abcc64000,
	RA	 = 0x0000005123432000,
	PA	 = ra2pa(0x0000005123432000,0),
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
.global SEC_CPPRI_DATA25_START
SEC_CPPRI_DATA25_START:
.xword 0x613936ea1ec26a9e
.xword 0x7b9134c19e51b1dd
.xword 0xd1e1531372567874
.xword 0xb306960a370af690
.xword 0xf391a0f0c8e903ff
.xword 0x1117d94f0a8b3fee
.xword 0xa6e0981192969636
.xword 0xdb9e2bf567d7a605
.xword 0xf6236bd76e4c97ae




SECTION .CPPRI_SEG_26 DATA_VA = 0x0000005abcc68000
attr_data {
	Name	 = .CPPRI_SEG_26,
	VA	 = 0x0000005abcc68000,
	RA	 = 0x0000005123434000,
	PA	 = ra2pa(0x0000005123434000,0),
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
.global SEC_CPPRI_DATA26_START
SEC_CPPRI_DATA26_START:
.xword 0x8ffcfa333c825071
.xword 0xc72bc926a36e9f4e
.xword 0x6eb584343b0354d2
.xword 0x7d2fe5927eb8994c
.xword 0xbbd79931e8a45373
.xword 0x4e90298bce71dcf2
.xword 0x8bb269a65ebbc188
.xword 0xfaba58b4193baa18
.xword 0x37cfb4ecb1f1cf6a




SECTION .CPPRI_SEG_27 DATA_VA = 0x0000005abcc6c000
attr_data {
	Name	 = .CPPRI_SEG_27,
	VA	 = 0x0000005abcc6c000,
	RA	 = 0x0000005123436000,
	PA	 = ra2pa(0x0000005123436000,0),
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
.global SEC_CPPRI_DATA27_START
SEC_CPPRI_DATA27_START:
.xword 0x28dd748b2b9c735a
.xword 0x974275f904d44476
.xword 0x73d524699ed4ef91
.xword 0xbade4650b038cae1
.xword 0x8e54dba79300586c
.xword 0xda08178f3d2cd248
.xword 0xf7991438e07fdfe1
.xword 0x1bdb991f3b555844
.xword 0x23774017dfe509cb




SECTION .CPPRI_SEG_28 DATA_VA = 0x0000005abcc70000
attr_data {
	Name	 = .CPPRI_SEG_28,
	VA	 = 0x0000005abcc70000,
	RA	 = 0x0000005123438000,
	PA	 = ra2pa(0x0000005123438000,0),
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
.global SEC_CPPRI_DATA28_START
SEC_CPPRI_DATA28_START:
.xword 0xf356989ec7f1de00
.xword 0xe4fbb0d36fab75fe
.xword 0x2bf644c3ea5d8a6e
.xword 0xc16cf17ce617bc58
.xword 0xcb0bddd615f020ae
.xword 0x7af5b4796c712c8c
.xword 0x7da3d13b89fca3c2
.xword 0xebd7d763acc01225
.xword 0xdf2b3b60bde30f4c




SECTION .CPPRI_SEG_29 DATA_VA = 0x0000005abcc74000
attr_data {
	Name	 = .CPPRI_SEG_29,
	VA	 = 0x0000005abcc74000,
	RA	 = 0x000000512343a000,
	PA	 = ra2pa(0x000000512343a000,0),
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
.global SEC_CPPRI_DATA29_START
SEC_CPPRI_DATA29_START:
.xword 0x4acaedfc373e9d6a
.xword 0x840dd56b978216af
.xword 0x9808924f636c471a
.xword 0x1853e6d9cd5f1af3
.xword 0xc7330aefbb81c357
.xword 0xeea86d8236b6efde
.xword 0xe04649b322b11407
.xword 0x56671e754f8a4c3a
.xword 0x20fe01bc6f45ce2e




SECTION .CPPRI_SEG_30 DATA_VA = 0x0000005abcc78000
attr_data {
	Name	 = .CPPRI_SEG_30,
	VA	 = 0x0000005abcc78000,
	RA	 = 0x000000512343c000,
	PA	 = ra2pa(0x000000512343c000,0),
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
.global SEC_CPPRI_DATA30_START
SEC_CPPRI_DATA30_START:
.xword 0x1b5931cf63784fa8
.xword 0x3ffa8c25b7efeeb1
.xword 0x71c88e81b4c94c16
.xword 0xb9ccee2466afd314
.xword 0x00968950cf45677d
.xword 0x61e66119dff8755a
.xword 0x3524c131dd21a5ee
.xword 0xe25ea320ca089452
.xword 0x8165b91c3f5946f4




SECTION .CPPRI_SEG_31 DATA_VA = 0x0000005abcc7c000
attr_data {
	Name	 = .CPPRI_SEG_31,
	VA	 = 0x0000005abcc7c000,
	RA	 = 0x000000512343e000,
	PA	 = ra2pa(0x000000512343e000,0),
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
.global SEC_CPPRI_DATA31_START
SEC_CPPRI_DATA31_START:
.xword 0x802ea0e436eb7f26
.xword 0x31dc07553ed7d894
.xword 0x926c24aa6e0fbc13
.xword 0x19c41cd7a661f92f
.xword 0x04169272726e4373
.xword 0x2846b815fc091a08
.xword 0xbb306cba2178ed63
.xword 0x40388aef0ba1556d
.xword 0x2f2749abe611c8de






SECTION .NCPRI_SEG_0 DATA_VA = 0x0000006def080000
attr_data {
	Name	 = .NCPRI_SEG_0,
	VA	 = 0x0000006def080000,
	RA	 = 0x000000b123400000,
	PA	 = ra2pa(0x000000b123400000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA0_START
SEC_NCPRI_DATA0_START:
.xword 0xa425487af471c5e8
.xword 0xa275f373cb2cd4e2
.xword 0x41a8e404d93c6407
.xword 0x13010e47afdb25f9
.xword 0xe53ffcf20154d88d
.xword 0xee9c4f658b8e2c50
.xword 0xe2bc7548c880f497
.xword 0xf7f9ff84d891fec6



SECTION .NCPRI_SEG_1 DATA_VA = 0x0000006def084000
attr_data {
	Name	 = .NCPRI_SEG_1,
	VA	 = 0x0000006def084000,
	RA	 = 0x000000b123402000,
	PA	 = ra2pa(0x000000b123402000,0),
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

.data
.global SEC_NCPRI_DATA1_START
SEC_NCPRI_DATA1_START:
.xword 0x7b102c0e43e5012c
.xword 0xb9d02aef0512c321
.xword 0xb940fd2a3759bee0
.xword 0x518b2ad3f5338e67
.xword 0x8e0cf93c84719c5b
.xword 0xddbbbbccbe3b2629
.xword 0x830ddac9416d4ccc
.xword 0x121c22865f8af5f7



SECTION .NCPRI_SEG_2 DATA_VA = 0x0000006def088000
attr_data {
	Name	 = .NCPRI_SEG_2,
	VA	 = 0x0000006def088000,
	RA	 = 0x000000b123404000,
	PA	 = ra2pa(0x000000b123404000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA2_START
SEC_NCPRI_DATA2_START:
.xword 0x7d957d38ec4f4adc
.xword 0xfdc46af6637d3c92
.xword 0x4e9232d76043eff3
.xword 0x48dec6e2348975c0
.xword 0x93eac6256d08305f
.xword 0x10981a4202babbff
.xword 0xd293abcb930bac63
.xword 0x85615f714a514be7



SECTION .NCPRI_SEG_3 DATA_VA = 0x0000006def08c000
attr_data {
	Name	 = .NCPRI_SEG_3,
	VA	 = 0x0000006def08c000,
	RA	 = 0x000000b123406000,
	PA	 = ra2pa(0x000000b123406000,0),
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

.data
.global SEC_NCPRI_DATA3_START
SEC_NCPRI_DATA3_START:
.xword 0xcd91142e587980e1
.xword 0x7921bcc1445cba30
.xword 0x04a5c17514781f89
.xword 0x422d4bc76748154e
.xword 0x7d7ec802cb98ddf3
.xword 0x81a90148b5e99303
.xword 0xf6200cb84151b929
.xword 0xbde1bce167fc5f90



SECTION .NCPRI_SEG_4 DATA_VA = 0x0000006def090000
attr_data {
	Name	 = .NCPRI_SEG_4,
	VA	 = 0x0000006def090000,
	RA	 = 0x000000b123408000,
	PA	 = ra2pa(0x000000b123408000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA4_START
SEC_NCPRI_DATA4_START:
.xword 0x277c7ba432841c53
.xword 0xefad4c972e892dfe
.xword 0x616b278c38274b63
.xword 0xbbbf2de352bb8f64
.xword 0x25127cc88818c5ab
.xword 0xcdfe875c3b663369
.xword 0x8d82f50f6df1a9f6
.xword 0xed78cc2fcda6d73f



SECTION .NCPRI_SEG_5 DATA_VA = 0x0000006def094000
attr_data {
	Name	 = .NCPRI_SEG_5,
	VA	 = 0x0000006def094000,
	RA	 = 0x000000b12340a000,
	PA	 = ra2pa(0x000000b12340a000,0),
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

.data
.global SEC_NCPRI_DATA5_START
SEC_NCPRI_DATA5_START:
.xword 0x8d602d3513e7e0ed
.xword 0x86ffa44e2fc491c6
.xword 0x5cf3aca09512936a
.xword 0xfb5b0860dd28d62e
.xword 0x6a64cff49c46cf5c
.xword 0xe4f9690eb5c12e69
.xword 0xee03cec524b9f23b
.xword 0x28ec07e9d0798103



SECTION .NCPRI_SEG_6 DATA_VA = 0x0000006def098000
attr_data {
	Name	 = .NCPRI_SEG_6,
	VA	 = 0x0000006def098000,
	RA	 = 0x000000b12340c000,
	PA	 = ra2pa(0x000000b12340c000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA6_START
SEC_NCPRI_DATA6_START:
.xword 0x932eeefb8c9dfc75
.xword 0x9915e2e9f11c2883
.xword 0x70bd2b9e6f79c4ca
.xword 0x90c7462e6e0db969
.xword 0xdbaf7812e14fac2a
.xword 0x14193202629f816f
.xword 0xc5016a947fdc0045
.xword 0x991f3103204ba3e5



SECTION .NCPRI_SEG_7 DATA_VA = 0x0000006def09c000
attr_data {
	Name	 = .NCPRI_SEG_7,
	VA	 = 0x0000006def09c000,
	RA	 = 0x000000b12340e000,
	PA	 = ra2pa(0x000000b12340e000,0),
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

.data
.global SEC_NCPRI_DATA7_START
SEC_NCPRI_DATA7_START:
.xword 0x44fcb4102b90efc1
.xword 0x6a9346e2c9b290c1
.xword 0x9cc9a0025acffbfc
.xword 0x631ddfa10b171b7f
.xword 0x6c92c1f43d7a7ea3
.xword 0xb607e373f951cf62
.xword 0x26ccf8c9862f72f4
.xword 0x7568cf8cf1a4cf46



SECTION .NCPRI_SEG_8 DATA_VA = 0x0000006def0a0000
attr_data {
	Name	 = .NCPRI_SEG_8,
	VA	 = 0x0000006def0a0000,
	RA	 = 0x000000b123410000,
	PA	 = ra2pa(0x000000b123410000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA8_START
SEC_NCPRI_DATA8_START:
.xword 0xd7ff395976739f8d
.xword 0xb5030e3ad92ca839
.xword 0xdc728a88aecbdf63
.xword 0x657760fcaa6e2322
.xword 0x927564fd1d26f48f
.xword 0x0e55ba2c667ae602
.xword 0x939a9383b3e66499
.xword 0x3d3e5e33274dff1b



SECTION .NCPRI_SEG_9 DATA_VA = 0x0000006def0a4000
attr_data {
	Name	 = .NCPRI_SEG_9,
	VA	 = 0x0000006def0a4000,
	RA	 = 0x000000b123412000,
	PA	 = ra2pa(0x000000b123412000,0),
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

.data
.global SEC_NCPRI_DATA9_START
SEC_NCPRI_DATA9_START:
.xword 0x1ea2fa709bbcef02
.xword 0x77d0cd1aa94db3c5
.xword 0xdd24ba316246447d
.xword 0x8a868b37b1f18068
.xword 0xe4a1be582463bdf0
.xword 0x48bc3465548bbc61
.xword 0x2742c406b0be8c0f
.xword 0xd8ddd02061e41fee



SECTION .NCPRI_SEG_10 DATA_VA = 0x0000006def0a8000
attr_data {
	Name	 = .NCPRI_SEG_10,
	VA	 = 0x0000006def0a8000,
	RA	 = 0x000000b123414000,
	PA	 = ra2pa(0x000000b123414000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA10_START
SEC_NCPRI_DATA10_START:
.xword 0xde1b876cb3d6433f
.xword 0x48c638640fac4882
.xword 0xae588f1f9ad46536
.xword 0x6af8434a9f72928a
.xword 0x8cf1c0414cb208ab
.xword 0x51bd57cce2e6406b
.xword 0x225304db7211c5cb
.xword 0xb1d2b1b925884f8f



SECTION .NCPRI_SEG_11 DATA_VA = 0x0000006def0ac000
attr_data {
	Name	 = .NCPRI_SEG_11,
	VA	 = 0x0000006def0ac000,
	RA	 = 0x000000b123416000,
	PA	 = ra2pa(0x000000b123416000,0),
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

.data
.global SEC_NCPRI_DATA11_START
SEC_NCPRI_DATA11_START:
.xword 0x06ec01d3ec442d9f
.xword 0x8f777348e5942d4d
.xword 0x307222633d0a0953
.xword 0xdf1d3f061f086b02
.xword 0x2cd6d663584fe5be
.xword 0xf2a5b3871534fb84
.xword 0xe5e9160dc78ed738
.xword 0x1e6f95dc33f10cb8



SECTION .NCPRI_SEG_12 DATA_VA = 0x0000006def0b0000
attr_data {
	Name	 = .NCPRI_SEG_12,
	VA	 = 0x0000006def0b0000,
	RA	 = 0x000000b123418000,
	PA	 = ra2pa(0x000000b123418000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA12_START
SEC_NCPRI_DATA12_START:
.xword 0x9856c8d74ec096a8
.xword 0x91ad38cb0828d2f6
.xword 0xd4c46416c46452df
.xword 0x001961009c519a3e
.xword 0xf5bd0732fb3dc8f0
.xword 0x3aa543cdaf306ff9
.xword 0x7ddb2b6158cc573d
.xword 0xaa16da19068c1f63



SECTION .NCPRI_SEG_13 DATA_VA = 0x0000006def0b4000
attr_data {
	Name	 = .NCPRI_SEG_13,
	VA	 = 0x0000006def0b4000,
	RA	 = 0x000000b12341a000,
	PA	 = ra2pa(0x000000b12341a000,0),
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

.data
.global SEC_NCPRI_DATA13_START
SEC_NCPRI_DATA13_START:
.xword 0x5a005bb3d19c947b
.xword 0xba446287ed3fd0d0
.xword 0x4914fd11fb72d4c6
.xword 0xbbda71834ee6fa63
.xword 0x82357ba558d1ea84
.xword 0x5483a07130a2a950
.xword 0x295cdfc38b0a1a9e
.xword 0xd3845f1b90e990a1



SECTION .NCPRI_SEG_14 DATA_VA = 0x0000006def0b8000
attr_data {
	Name	 = .NCPRI_SEG_14,
	VA	 = 0x0000006def0b8000,
	RA	 = 0x000000b12341c000,
	PA	 = ra2pa(0x000000b12341c000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA14_START
SEC_NCPRI_DATA14_START:
.xword 0x49c51bf1b1b9687e
.xword 0x5f71cb55d6a569d4
.xword 0x85018e9c2c172cc7
.xword 0x55ea0db327af3d5a
.xword 0x0e0fff4370e77834
.xword 0x7011840bfee30246
.xword 0x05289085f5d1e004
.xword 0x183de18d76a40d09



SECTION .NCPRI_SEG_15 DATA_VA = 0x0000006def0bc000
attr_data {
	Name	 = .NCPRI_SEG_15,
	VA	 = 0x0000006def0bc000,
	RA	 = 0x000000b12341e000,
	PA	 = ra2pa(0x000000b12341e000,0),
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

.data
.global SEC_NCPRI_DATA15_START
SEC_NCPRI_DATA15_START:
.xword 0xd8acad22fe6f37ca
.xword 0x30ff4aba9230d2f1
.xword 0x01aa4fb230bdbee7
.xword 0xc94796c34deb23dd
.xword 0x47393ead14435198
.xword 0x9f0c2e5e15b5c2ae
.xword 0x9b4c04893be70a5e
.xword 0x94c673fe4ae42924



SECTION .NCPRI_SEG_16 DATA_VA = 0x0000006def0c0000
attr_data {
	Name	 = .NCPRI_SEG_16,
	VA	 = 0x0000006def0c0000,
	RA	 = 0x000000b123420000,
	PA	 = ra2pa(0x000000b123420000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA16_START
SEC_NCPRI_DATA16_START:
.xword 0x2651cca59d07a83c
.xword 0xf853469793ab782b
.xword 0xada062a9415932b3
.xword 0xe637242bc565596f
.xword 0xbfef4035fdecce85
.xword 0x1c67122ee729d691
.xword 0x8c6c48d8be59f27b
.xword 0xb2728841192fb70c



SECTION .NCPRI_SEG_17 DATA_VA = 0x0000006def0c4000
attr_data {
	Name	 = .NCPRI_SEG_17,
	VA	 = 0x0000006def0c4000,
	RA	 = 0x000000b123422000,
	PA	 = ra2pa(0x000000b123422000,0),
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

.data
.global SEC_NCPRI_DATA17_START
SEC_NCPRI_DATA17_START:
.xword 0xecc3b518f3560a15
.xword 0xa3598c21452ee3db
.xword 0x0000df004658e7b0
.xword 0x12e642222cc7fab7
.xword 0x5dbf7c2a2f4ec41d
.xword 0x537b5e3b37e953a6
.xword 0x6517928284210432
.xword 0x95074b4898b3e893



SECTION .NCPRI_SEG_18 DATA_VA = 0x0000006def0c8000
attr_data {
	Name	 = .NCPRI_SEG_18,
	VA	 = 0x0000006def0c8000,
	RA	 = 0x000000b123424000,
	PA	 = ra2pa(0x000000b123424000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA18_START
SEC_NCPRI_DATA18_START:
.xword 0xb0adacc1bfb12c61
.xword 0xffde4c0e18d2737e
.xword 0x6db98aa81d557edc
.xword 0xf073ed7785dcbd72
.xword 0x9064ab9d982796b7
.xword 0x15697ccf6b586672
.xword 0x09501268f4c1a054
.xword 0x439a1f90b66f79db



SECTION .NCPRI_SEG_19 DATA_VA = 0x0000006def0cc000
attr_data {
	Name	 = .NCPRI_SEG_19,
	VA	 = 0x0000006def0cc000,
	RA	 = 0x000000b123426000,
	PA	 = ra2pa(0x000000b123426000,0),
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

.data
.global SEC_NCPRI_DATA19_START
SEC_NCPRI_DATA19_START:
.xword 0xf8e4e5333b6930f1
.xword 0x7d9d33cad178524b
.xword 0xc032ea3dc9f8de4f
.xword 0x4cc56295418c3cc3
.xword 0x0e4776f3799ef5d6
.xword 0x6e2b54eb18df2d35
.xword 0x54c38e0e60ab2d8b
.xword 0x31ca2716c353cbae



SECTION .NCPRI_SEG_20 DATA_VA = 0x0000006def0d0000
attr_data {
	Name	 = .NCPRI_SEG_20,
	VA	 = 0x0000006def0d0000,
	RA	 = 0x000000b123428000,
	PA	 = ra2pa(0x000000b123428000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA20_START
SEC_NCPRI_DATA20_START:
.xword 0xd5e0414f4c06b989
.xword 0x13c6839b9b372f99
.xword 0x68c5eb344aa33d25
.xword 0xedd756ba48d0a23c
.xword 0xf842d22aa5d5d41d
.xword 0x96ef9680f75eda9e
.xword 0x3a98475a3724f00a
.xword 0xda5fe420b4871803



SECTION .NCPRI_SEG_21 DATA_VA = 0x0000006def0d4000
attr_data {
	Name	 = .NCPRI_SEG_21,
	VA	 = 0x0000006def0d4000,
	RA	 = 0x000000b12342a000,
	PA	 = ra2pa(0x000000b12342a000,0),
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

.data
.global SEC_NCPRI_DATA21_START
SEC_NCPRI_DATA21_START:
.xword 0x7d1306a9838bf11e
.xword 0xeda81b5b6d076ed1
.xword 0x6eab33bb539cb6d3
.xword 0xe1e91adc1bd66d75
.xword 0x570cd4079e4ef69a
.xword 0xdcae1f8cd00e8c4f
.xword 0x8ea684bf50789f05
.xword 0xf92b9de4983fa2b6



SECTION .NCPRI_SEG_22 DATA_VA = 0x0000006def0d8000
attr_data {
	Name	 = .NCPRI_SEG_22,
	VA	 = 0x0000006def0d8000,
	RA	 = 0x000000b12342c000,
	PA	 = ra2pa(0x000000b12342c000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA22_START
SEC_NCPRI_DATA22_START:
.xword 0x4b2bf0be2400c983
.xword 0x12cf1aa8b5517100
.xword 0xb849fa3a9cb5d3f4
.xword 0xa406d2467bae7b97
.xword 0xa75182d1547e21d3
.xword 0x3e83d2367e9a9af9
.xword 0x05a4adf369d6812f
.xword 0xb54b38c18b763c0e



SECTION .NCPRI_SEG_23 DATA_VA = 0x0000006def0dc000
attr_data {
	Name	 = .NCPRI_SEG_23,
	VA	 = 0x0000006def0dc000,
	RA	 = 0x000000b12342e000,
	PA	 = ra2pa(0x000000b12342e000,0),
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

.data
.global SEC_NCPRI_DATA23_START
SEC_NCPRI_DATA23_START:
.xword 0x4d6da2955dacdd5e
.xword 0xf32cb8f4fe6f1d93
.xword 0xb1ca044fed20a7b9
.xword 0x020336386150f7ab
.xword 0xb74d1b014c5ee995
.xword 0x7b8125ee87c290b3
.xword 0xf60e609a5ab25fef
.xword 0xf9cf6b1c5dd62ef0



SECTION .NCPRI_SEG_24 DATA_VA = 0x0000006def0e0000
attr_data {
	Name	 = .NCPRI_SEG_24,
	VA	 = 0x0000006def0e0000,
	RA	 = 0x000000b123430000,
	PA	 = ra2pa(0x000000b123430000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA24_START
SEC_NCPRI_DATA24_START:
.xword 0x4d06666b9c62093e
.xword 0x02626ada8c5810d7
.xword 0x780f82b1835d5560
.xword 0x492698841e990a6b
.xword 0x56073bc8bd096be7
.xword 0x1c8198deb79289bb
.xword 0x6323fa17325dad48
.xword 0x8436283875692503



SECTION .NCPRI_SEG_25 DATA_VA = 0x0000006def0e4000
attr_data {
	Name	 = .NCPRI_SEG_25,
	VA	 = 0x0000006def0e4000,
	RA	 = 0x000000b123432000,
	PA	 = ra2pa(0x000000b123432000,0),
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

.data
.global SEC_NCPRI_DATA25_START
SEC_NCPRI_DATA25_START:
.xword 0x1432f2ddf9dcc04e
.xword 0xd5477a42666c008c
.xword 0x3c8655676c60537c
.xword 0xee103bc3583895c1
.xword 0x96ce6369094d25a1
.xword 0x989922401f33545e
.xword 0x90f94ca58b542bbf
.xword 0x7abfd0e85f11f7e8



SECTION .NCPRI_SEG_26 DATA_VA = 0x0000006def0e8000
attr_data {
	Name	 = .NCPRI_SEG_26,
	VA	 = 0x0000006def0e8000,
	RA	 = 0x000000b123434000,
	PA	 = ra2pa(0x000000b123434000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA26_START
SEC_NCPRI_DATA26_START:
.xword 0xea670b7e885ec640
.xword 0xb2d52607c62c2437
.xword 0x9766d4e6f96876d5
.xword 0xbf35dd6789b8f9c3
.xword 0x238aee0bd231641f
.xword 0x32e85edc7c015739
.xword 0x0e037544af96f976
.xword 0xe77ef74a2193edf5



SECTION .NCPRI_SEG_27 DATA_VA = 0x0000006def0ec000
attr_data {
	Name	 = .NCPRI_SEG_27,
	VA	 = 0x0000006def0ec000,
	RA	 = 0x000000b123436000,
	PA	 = ra2pa(0x000000b123436000,0),
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

.data
.global SEC_NCPRI_DATA27_START
SEC_NCPRI_DATA27_START:
.xword 0xd241698227266656
.xword 0x53f104b411dc1dc8
.xword 0xf671e156eab42e09
.xword 0x4e69843bb396977e
.xword 0xc57212aef5f0e611
.xword 0xa20c3c7ee264c72a
.xword 0x322bc6288e7963b5
.xword 0x46b5cca39c55291e



SECTION .NCPRI_SEG_28 DATA_VA = 0x0000006def0f0000
attr_data {
	Name	 = .NCPRI_SEG_28,
	VA	 = 0x0000006def0f0000,
	RA	 = 0x000000b123438000,
	PA	 = ra2pa(0x000000b123438000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA28_START
SEC_NCPRI_DATA28_START:
.xword 0xd5019f6c459d0290
.xword 0xf02d3a0f94036416
.xword 0xae14f3025deabee9
.xword 0x2c2e7fa62ccd52ae
.xword 0x0a9ed44f5bc66f64
.xword 0xde5d1002c136c51c
.xword 0xeabd56d81e22ac30
.xword 0xf8d507c56dfa7ed7



SECTION .NCPRI_SEG_29 DATA_VA = 0x0000006def0f4000
attr_data {
	Name	 = .NCPRI_SEG_29,
	VA	 = 0x0000006def0f4000,
	RA	 = 0x000000b12343a000,
	PA	 = ra2pa(0x000000b12343a000,0),
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

.data
.global SEC_NCPRI_DATA29_START
SEC_NCPRI_DATA29_START:
.xword 0x538c6bafc5771960
.xword 0x26b09c2b71e50876
.xword 0xc6036e4b3a4da084
.xword 0x2f431b569f766fa3
.xword 0xde66cf4bee00ab93
.xword 0xac15dc721b5fd8e5
.xword 0x4b10add373287e73
.xword 0xf9055160064575dc



SECTION .NCPRI_SEG_30 DATA_VA = 0x0000006def0f8000
attr_data {
	Name	 = .NCPRI_SEG_30,
	VA	 = 0x0000006def0f8000,
	RA	 = 0x000000b12343c000,
	PA	 = ra2pa(0x000000b12343c000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA30_START
SEC_NCPRI_DATA30_START:
.xword 0x9c149d8199d8a6b3
.xword 0x28ce985f6cb754d4
.xword 0x95b03a0c2d6a96b5
.xword 0x4b8814fdfd78246d
.xword 0xdf7983778b18829b
.xword 0xa937d9c63f0b3869
.xword 0x54e60abab3c08916
.xword 0x29d227b330d73bd5



SECTION .NCPRI_SEG_31 DATA_VA = 0x0000006def0fc000
attr_data {
	Name	 = .NCPRI_SEG_31,
	VA	 = 0x0000006def0fc000,
	RA	 = 0x000000b12343e000,
	PA	 = ra2pa(0x000000b12343e000,0),
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

.data
.global SEC_NCPRI_DATA31_START
SEC_NCPRI_DATA31_START:
.xword 0x1b47b0dc175649be
.xword 0xd27b30f08ad0e86d
.xword 0x258702623f5ba969
.xword 0x67cdd6ee72f2385f
.xword 0xb3d355a1b04bb447
.xword 0x10753d1766dfa1db
.xword 0xaa1b438aeafb8c44
.xword 0x43d822e20a8b0f40





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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA0_START
SEC_CPSEC_DATA0_START:
.xword 0xc772f518c5865271
.xword 0xcde9a7fd2e4bdd1c
.xword 0xb10a034f9073a23a
.xword 0x363770b6608a1577
.xword 0xb84f764995bec52c
.xword 0x050a78c5272f1ea8
.xword 0xae7ed0db7044278c
.xword 0x76c62b54c91015c7




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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA1_START
SEC_CPSEC_DATA1_START:
.xword 0x2321b28fd0c7d01e
.xword 0xf4cfcf1e879035b1
.xword 0xf70f7b759ffa4616
.xword 0x44297987d49ae35f
.xword 0xc0346d2afcbb434d
.xword 0x00643b8fdf71a234
.xword 0xb626c3e34586ab4e
.xword 0x59ee66cdd6bf9b69




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA2_START
SEC_CPSEC_DATA2_START:
.xword 0xbe4f01205b5ebb50
.xword 0x709b4fd614708886
.xword 0x53cc8ab27e24760c
.xword 0x30e1a2bb0918430b
.xword 0x8e0d58fb442655a4
.xword 0xe5bd371c41c67a24
.xword 0x66ddfa6e1b6604bc
.xword 0x1630947d4d8b4560




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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA3_START
SEC_CPSEC_DATA3_START:
.xword 0xa1a96d7ea812d960
.xword 0x8562a126a49242fb
.xword 0xa82f1783661611ba
.xword 0xe079e72a217f288f
.xword 0x63584c4c79b9d9a4
.xword 0x7ff23663cceb5ff3
.xword 0x7151f433b3ef274e
.xword 0xb40963e99cee841a




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA4_START
SEC_CPSEC_DATA4_START:
.xword 0xfa5fce9dececab6b
.xword 0x9b8a9a15b73887b0
.xword 0xed80908f5aeecc43
.xword 0x8532d47d3596e4fd
.xword 0x01b74851d82ebab6
.xword 0x0757e1d8a82e74ea
.xword 0x4c0a60e2c12d85a1
.xword 0x11627c6d7e745db0




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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA5_START
SEC_CPSEC_DATA5_START:
.xword 0xce3857357483352c
.xword 0xd10feff3a29c1dc1
.xword 0x992d188d5941a676
.xword 0x54d4f79ff21f2cc6
.xword 0x6d57f4e75b0af23c
.xword 0x4714d5835e496b43
.xword 0xd3e2806982a51a21
.xword 0xcf47e07844fabaf0




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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPSEC_DATA6_START
SEC_CPSEC_DATA6_START:
.xword 0x3dee4629851f2410
.xword 0x7660e75921a3a595
.xword 0xd86d93b61af1538c
.xword 0x4e631ffbed2a7070
.xword 0xd4af91280b01a557
.xword 0x16ee5cbffab79cb9
.xword 0x2799fe8caf1933c1
.xword 0xe1fe59e0953966e2




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
.global SEC_CPSEC_DATA7_START
SEC_CPSEC_DATA7_START:
.xword 0x0ed91c2ad21cd3de
.xword 0xcc886ea8cb1fa812
.xword 0x4e3b1e3845a14cc4
.xword 0x1655d81cfdcd8387
.xword 0xea787d8d54a48a73
.xword 0x238e86f353ca7c53
.xword 0x6993beb6ec6eee7e
.xword 0xba788bd78dad0d83






SECTION .NCSEC_SEG_0 DATA_VA = 0x0000008567980000
attr_data {
	Name	 = .NCSEC_SEG_0,
	VA	 = 0x0000008567980000,
	RA	 = 0x000000b567880000,
	PA	 = ra2pa(0x000000b567880000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA0_START
SEC_NCSEC_DATA0_START:
.xword 0x53fc92d674d27cf8
.xword 0x412d25f837fa677e
.xword 0xf7dbdeceb995d4ce
.xword 0xfff45471332ffd55
.xword 0xbc4b5ee7d7883c90
.xword 0x66b421b1b79c2c4c
.xword 0x65b0e68339310e18
.xword 0x41ff8178e9b902e1




SECTION .NCSEC_SEG_1 DATA_VA = 0x0000008567984000
attr_data {
	Name	 = .NCSEC_SEG_1,
	VA	 = 0x0000008567984000,
	RA	 = 0x000000b567882000,
	PA	 = ra2pa(0x000000b567882000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA1_START
SEC_NCSEC_DATA1_START:
.xword 0x0efe79a5f7884f91
.xword 0xcbe3bac429f4a914
.xword 0xead834426f7da520
.xword 0x0f27786a676a772a
.xword 0xe2266e6546a89ef9
.xword 0xd7d9dc0ac848e8c3
.xword 0xca4a3519e9d8cc66
.xword 0xe551008c8c347dff




SECTION .NCSEC_SEG_2 DATA_VA = 0x0000008567988000
attr_data {
	Name	 = .NCSEC_SEG_2,
	VA	 = 0x0000008567988000,
	RA	 = 0x000000b567884000,
	PA	 = ra2pa(0x000000b567884000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA2_START
SEC_NCSEC_DATA2_START:
.xword 0xab31cfd5e3c80681
.xword 0x676b402ab7a64070
.xword 0x2e5c2f20057de52a
.xword 0x31a8d814da2f4433
.xword 0x61f4fc844f349b4a
.xword 0x11250753c77c4d7a
.xword 0x8da9b9f9943c287e
.xword 0x1b526f6cb21c7d1e




SECTION .NCSEC_SEG_3 DATA_VA = 0x000000856798c000
attr_data {
	Name	 = .NCSEC_SEG_3,
	VA	 = 0x000000856798c000,
	RA	 = 0x000000b567886000,
	PA	 = ra2pa(0x000000b567886000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA3_START
SEC_NCSEC_DATA3_START:
.xword 0x3dba698359730e59
.xword 0xea30e033d9721013
.xword 0xdf3ea8b276f8a798
.xword 0xffe060eee564464b
.xword 0xf8f39c8d8f5222fe
.xword 0x25194363d27e96ee
.xword 0x82c43de5dd9fda4b
.xword 0x5a8a49c3889ffa98




SECTION .NCSEC_SEG_4 DATA_VA = 0x0000008567990000
attr_data {
	Name	 = .NCSEC_SEG_4,
	VA	 = 0x0000008567990000,
	RA	 = 0x000000b567888000,
	PA	 = ra2pa(0x000000b567888000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA4_START
SEC_NCSEC_DATA4_START:
.xword 0xfbf85790f269460b
.xword 0x7c78acafd2cbadb7
.xword 0xa4fc93fae3e7a4d0
.xword 0x208619223591449c
.xword 0x316bd63e5f308f58
.xword 0x3f6ca4ecb30e850e
.xword 0x623e35f296aa7897
.xword 0xf73b2f0484c269b7




SECTION .NCSEC_SEG_5 DATA_VA = 0x0000008567994000
attr_data {
	Name	 = .NCSEC_SEG_5,
	VA	 = 0x0000008567994000,
	RA	 = 0x000000b56788a000,
	PA	 = ra2pa(0x000000b56788a000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA5_START
SEC_NCSEC_DATA5_START:
.xword 0xf25990d1a887b158
.xword 0xb0913e964b9fd4c3
.xword 0xad386f03b40c4068
.xword 0x20301986d4dc6a62
.xword 0xb1a42533fb0ba932
.xword 0xca678a00425fe95f
.xword 0xea4052cd8fac50a8
.xword 0x5b663dcdf0e9dbda




SECTION .NCSEC_SEG_6 DATA_VA = 0x0000008567998000
attr_data {
	Name	 = .NCSEC_SEG_6,
	VA	 = 0x0000008567998000,
	RA	 = 0x000000b56788c000,
	PA	 = ra2pa(0x000000b56788c000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA6_START
SEC_NCSEC_DATA6_START:
.xword 0xcd3741c3721bfd68
.xword 0xad17b5bbda7d960f
.xword 0xd97d8f253ec35004
.xword 0x362a1b28c7ca921a
.xword 0x87467ce44c3ba5f6
.xword 0x653eaa77904b365e
.xword 0x11777172d92c45cb
.xword 0x97c05e13d9e20471




SECTION .NCSEC_SEG_7 DATA_VA = 0x000000856799c000
attr_data {
	Name	 = .NCSEC_SEG_7,
	VA	 = 0x000000856799c000,
	RA	 = 0x000000b56788e000,
	PA	 = ra2pa(0x000000b56788e000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCSEC_DATA7_START
SEC_NCSEC_DATA7_START:
.xword 0x42c70c7c3f113df7
.xword 0x51ba67552c9aa328
.xword 0xa1c67a7b0cdfaa84
.xword 0xdbebab651705a2f9
.xword 0xc598ca76a3f000f9
.xword 0x87627dbd826e29de
.xword 0x30d0606ee230a803
.xword 0x5bedcac2a1077131






SECTION .CPNUC_SEG_0 DATA_VA = 0x00000099aba00000
attr_data {
	Name	 = .CPNUC_SEG_0,
	VA	 = 0x00000099aba00000,
	RA	 = 0x00000069debc0000,
	PA	 = ra2pa(0x00000069debc0000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA0_START
SEC_CPNUC_DATA0_START:
.xword 0x80b3149ae0bb3834
.xword 0x3aa413452a59bf64
.xword 0x905e1c460937554b
.xword 0xf5569f48420f02b6
.xword 0x7daa97a4b7078236
.xword 0x7a7e1fd53604f129
.xword 0x6a394188e2ab52af
.xword 0xe310bec09a6123ce




SECTION .CPNUC_SEG_1 DATA_VA = 0x00000099aba04000
attr_data {
	Name	 = .CPNUC_SEG_1,
	VA	 = 0x00000099aba04000,
	RA	 = 0x00000069debc2000,
	PA	 = ra2pa(0x00000069debc2000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA1_START
SEC_CPNUC_DATA1_START:
.xword 0x8eee446a5e26e878
.xword 0x585c2bdf80599317
.xword 0x581857f4d4c7a651
.xword 0x2074aedce352540a
.xword 0x2de796625172729c
.xword 0xbb2ec4dc8474b88c
.xword 0x07a31650da1d2d2a
.xword 0xe0e937466759cd7c




SECTION .CPNUC_SEG_2 DATA_VA = 0x00000099aba08000
attr_data {
	Name	 = .CPNUC_SEG_2,
	VA	 = 0x00000099aba08000,
	RA	 = 0x00000069debc4000,
	PA	 = ra2pa(0x00000069debc4000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA2_START
SEC_CPNUC_DATA2_START:
.xword 0xa23a519bc39c3d3f
.xword 0xfa0ea80d5979b903
.xword 0xb811397956353dc9
.xword 0x57c8661603bee2b9
.xword 0xf0f20169190dbd06
.xword 0x1ee78fcf31074f0e
.xword 0x9e2a43506e7629aa
.xword 0x7f4dbc440eab7fe6




SECTION .CPNUC_SEG_3 DATA_VA = 0x00000099aba0c000
attr_data {
	Name	 = .CPNUC_SEG_3,
	VA	 = 0x00000099aba0c000,
	RA	 = 0x00000069debc6000,
	PA	 = ra2pa(0x00000069debc6000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA3_START
SEC_CPNUC_DATA3_START:
.xword 0x796fa65e99beb136
.xword 0xce67ff6da290059a
.xword 0x07648a77f022acde
.xword 0x4e3d40688dab56e6
.xword 0xb8d9a4b5714edee7
.xword 0x679255baf8b2f144
.xword 0x5cf2f5e6252c1a41
.xword 0xaedd4707d87b5721




SECTION .CPNUC_SEG_4 DATA_VA = 0x00000099aba10000
attr_data {
	Name	 = .CPNUC_SEG_4,
	VA	 = 0x00000099aba10000,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA4_START
SEC_CPNUC_DATA4_START:
.xword 0x18365ee15e335bbf
.xword 0x98a2b6016f3e0e67
.xword 0x211756a3724f817c
.xword 0x639594a5aac7f07b
.xword 0xb754913019545c04
.xword 0x9f4bbf3a7903de76
.xword 0xa27cfae31f879b8a
.xword 0x639917dd617515d4




SECTION .CPNUC_SEG_5 DATA_VA = 0x00000099aba14000
attr_data {
	Name	 = .CPNUC_SEG_5,
	VA	 = 0x00000099aba14000,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA5_START
SEC_CPNUC_DATA5_START:
.xword 0x44b14e864b9d3faf
.xword 0xfbefd65d97279f08
.xword 0x254c328225f319c7
.xword 0x2f322ec584d30d47
.xword 0xeccf7691c3cc32ef
.xword 0x7d8bf24c966dd65e
.xword 0x9b25c493e55789d0
.xword 0x2ea0906a06a9fd8f




SECTION .CPNUC_SEG_6 DATA_VA = 0x00000099aba18000
attr_data {
	Name	 = .CPNUC_SEG_6,
	VA	 = 0x00000099aba18000,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA6_START
SEC_CPNUC_DATA6_START:
.xword 0x4bc665d858ccb74e
.xword 0x226887a1b7a37242
.xword 0x2eceed441faf294b
.xword 0x20edef529608f889
.xword 0x104f1f4553c55cd8
.xword 0x6557384a0c8ded4f
.xword 0xbdacb5fb25dd7a8b
.xword 0x921ccd794e2597e0




SECTION .CPNUC_SEG_7 DATA_VA = 0x00000099aba1c000
attr_data {
	Name	 = .CPNUC_SEG_7,
	VA	 = 0x00000099aba1c000,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPNUC_DATA7_START
SEC_CPNUC_DATA7_START:
.xword 0x9b1aa37140ebefca
.xword 0x5097f7a2b085e899
.xword 0x7c3024bcc896e25d
.xword 0x4c09d66709b189f9
.xword 0x1e233db3e629744a
.xword 0x2874857f2ec7d2a6
.xword 0x91c3d0de6102378e
.xword 0xc6bcc8c6472d8321






SECTION .NCNUC_SEG_0 DATA_VA = 0x000000adef280000
attr_data {
	Name	 = .NCNUC_SEG_0,
	VA	 = 0x000000adef280000,
	RA	 = 0x000000b9abcd0000,
	PA	 = ra2pa(0x000000b9abcd0000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA0_START
SEC_NCNUC_DATA0_START:
.xword 0x57e6b6d70ad1c4a7
.xword 0x3a776d4fca136c12
.xword 0xfd36ee717582da2a
.xword 0xba36aa2d18f904db
.xword 0xaa95368c9a37e187
.xword 0x68e67243d4d025df
.xword 0x5140a2e44e07754f
.xword 0x03b2710698f5478a




SECTION .NCNUC_SEG_1 DATA_VA = 0x000000adef284000
attr_data {
	Name	 = .NCNUC_SEG_1,
	VA	 = 0x000000adef284000,
	RA	 = 0x000000b9abcd2000,
	PA	 = ra2pa(0x000000b9abcd2000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA1_START
SEC_NCNUC_DATA1_START:
.xword 0x37520fe4cad60260
.xword 0x265396fb586fec45
.xword 0x40bf3e454278c987
.xword 0xdd073e15b66ba7c9
.xword 0xbd606e8ed4756145
.xword 0xefeda534c7760d34
.xword 0x6952d710c18bdd53
.xword 0x4b28e9374f877a4f




SECTION .NCNUC_SEG_2 DATA_VA = 0x000000adef288000
attr_data {
	Name	 = .NCNUC_SEG_2,
	VA	 = 0x000000adef288000,
	RA	 = 0x000000b9abcd4000,
	PA	 = ra2pa(0x000000b9abcd4000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA2_START
SEC_NCNUC_DATA2_START:
.xword 0x4e60ce38e8ef3458
.xword 0xa391cd68760911ba
.xword 0xeb69c6a4d24daca8
.xword 0x41cbae8f6f3b21e7
.xword 0xfe00f6a2a38d7a4c
.xword 0x72c9dbba0490b856
.xword 0xca486e718a79af5d
.xword 0x29b402729f0bd019




SECTION .NCNUC_SEG_3 DATA_VA = 0x000000adef28c000
attr_data {
	Name	 = .NCNUC_SEG_3,
	VA	 = 0x000000adef28c000,
	RA	 = 0x000000b9abcd6000,
	PA	 = ra2pa(0x000000b9abcd6000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA3_START
SEC_NCNUC_DATA3_START:
.xword 0x0ff81bf483c2d653
.xword 0xf0d466f22ee204ee
.xword 0xc4682225d75b0cb7
.xword 0x088d1bc6e77c9dd4
.xword 0x8846ddcc569dda79
.xword 0x7b9b9673454fdfb4
.xword 0xa6960923ee3b7825
.xword 0xda0c2f41761ec8a5




SECTION .NCNUC_SEG_4 DATA_VA = 0x000000adef290000
attr_data {
	Name	 = .NCNUC_SEG_4,
	VA	 = 0x000000adef290000,
	RA	 = 0x000000b9abcd8000,
	PA	 = ra2pa(0x000000b9abcd8000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA4_START
SEC_NCNUC_DATA4_START:
.xword 0x238b192aaf27ecd6
.xword 0xc0c097a2b1630db0
.xword 0x830db8837673ff25
.xword 0xa5152d1c94ebef79
.xword 0xd8655829ac3d8b92
.xword 0x7abab9c316bc241e
.xword 0x0188db2bbe716ee4
.xword 0x817dc7e40df429a4




SECTION .NCNUC_SEG_5 DATA_VA = 0x000000adef294000
attr_data {
	Name	 = .NCNUC_SEG_5,
	VA	 = 0x000000adef294000,
	RA	 = 0x000000b9abcda000,
	PA	 = ra2pa(0x000000b9abcda000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA5_START
SEC_NCNUC_DATA5_START:
.xword 0x653a534734922b49
.xword 0x8401160341bef566
.xword 0x02c4acf32c9dbe1f
.xword 0xdea970b594d930e0
.xword 0xddb39ab3597f4ad0
.xword 0x2134512da05961ff
.xword 0x1936acd56c061256
.xword 0xaa75c5609e802fe8




SECTION .NCNUC_SEG_6 DATA_VA = 0x000000adef298000
attr_data {
	Name	 = .NCNUC_SEG_6,
	VA	 = 0x000000adef298000,
	RA	 = 0x000000b9abcdc000,
	PA	 = ra2pa(0x000000b9abcdc000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA6_START
SEC_NCNUC_DATA6_START:
.xword 0x9b5688560ddf307b
.xword 0x235967dd64610a05
.xword 0xd818878eccd7f4be
.xword 0x5e905e8b38435342
.xword 0x56756cdfed406cca
.xword 0x86837893ba625ebe
.xword 0x09268e75ddfcb15c
.xword 0x603a6d196649068b




SECTION .NCNUC_SEG_7 DATA_VA = 0x000000adef29c000
attr_data {
	Name	 = .NCNUC_SEG_7,
	VA	 = 0x000000adef29c000,
	RA	 = 0x000000b9abcde000,
	PA	 = ra2pa(0x000000b9abcde000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NCNUC_DATA7_START
SEC_NCNUC_DATA7_START:
.xword 0x676137b511c253e8
.xword 0x431878b4993073a1
.xword 0x135a83b81277fe9f
.xword 0x61c9898123ded43d
.xword 0x4e6349c311704df0
.xword 0xd11490562819aa99
.xword 0x280e6f936b234a60
.xword 0x841542a1e2401a8a






SECTION .CP_REAL_MEM_SEG_0 DATA_VA = 0x0000007def300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_0,
	VA	 = 0x0000007def300000,
	RA	 = 0x0000006bff300000,
	PA	 = ra2pa(0x0000006bff300000,0),
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
.global SEC_CP_REAL_MEM_DATA0_START
SEC_CP_REAL_MEM_DATA0_START:
.xword 0x5164b014624425cb
.xword 0xa0f00cad2eb9955f
.xword 0xb5925b944ab81a01
.xword 0x3c1d67b8698bbe09
.xword 0x22fc0cb89cf89aff
.xword 0x41fecab8f73fb03b
.xword 0x597fbe0d1060de9e
.xword 0x4494a9ce7daa9dd5




SECTION .CP_REAL_MEM_SEG_1 DATA_VA = 0x0000007def304000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_1,
	VA	 = 0x0000007def304000,
	RA	 = 0x0000006bff304000,
	PA	 = ra2pa(0x0000006bff304000,0),
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
.global SEC_CP_REAL_MEM_DATA1_START
SEC_CP_REAL_MEM_DATA1_START:
.xword 0x108ef22b4af6bc5c
.xword 0x201e8718b61d1450
.xword 0x03981b28242565cb
.xword 0x41f9ef5ac6900538
.xword 0x4f984c78124742dd
.xword 0xe3994f7a75b821f5
.xword 0x04774ff4732e404b
.xword 0xcb825d70b2cdc996




SECTION .CP_REAL_MEM_SEG_2 DATA_VA = 0x0000007def308000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_2,
	VA	 = 0x0000007def308000,
	RA	 = 0x0000006bff308000,
	PA	 = ra2pa(0x0000006bff308000,0),
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
.global SEC_CP_REAL_MEM_DATA2_START
SEC_CP_REAL_MEM_DATA2_START:
.xword 0x73468356a731251d
.xword 0x7ac00288beea6858
.xword 0xc6cacb5a1b47f92c
.xword 0xc4c7b3db29c1791d
.xword 0x18f832eb738f5e2e
.xword 0x5c3afd4ca64cbd47
.xword 0xef5205e437cc22f5
.xword 0x4d6884e27432e2e0




SECTION .CP_REAL_MEM_SEG_3 DATA_VA = 0x0000007def30c000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_3,
	VA	 = 0x0000007def30c000,
	RA	 = 0x0000006bff30c000,
	PA	 = ra2pa(0x0000006bff30c000,0),
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
.global SEC_CP_REAL_MEM_DATA3_START
SEC_CP_REAL_MEM_DATA3_START:
.xword 0x4b6508d78e508e29
.xword 0x11a9aa1dcc8953a0
.xword 0x0ae07d2184607986
.xword 0x917f034a64e103f8
.xword 0xefed069597564267
.xword 0x0cfe6678fd0242fc
.xword 0xfae06595326dede4
.xword 0xb49ad19ec8311825




SECTION .CP_REAL_MEM_SEG_4 DATA_VA = 0x0000007def310000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_4,
	VA	 = 0x0000007def310000,
	RA	 = 0x0000006bff310000,
	PA	 = ra2pa(0x0000006bff310000,0),
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
.global SEC_CP_REAL_MEM_DATA4_START
SEC_CP_REAL_MEM_DATA4_START:
.xword 0xecab1d576aa8ac48
.xword 0x079e9241866cc0dc
.xword 0xdeb31d857081a056
.xword 0xcbb31833fb277ded
.xword 0x651a61de183ecd29
.xword 0x34a49eefd140fd61
.xword 0xe72b635912cf7118
.xword 0x0fbbed8c56106527




SECTION .CP_REAL_MEM_SEG_5 DATA_VA = 0x0000007def314000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_5,
	VA	 = 0x0000007def314000,
	RA	 = 0x0000006bff314000,
	PA	 = ra2pa(0x0000006bff314000,0),
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
.global SEC_CP_REAL_MEM_DATA5_START
SEC_CP_REAL_MEM_DATA5_START:
.xword 0x60ba501dcb136396
.xword 0x2b8994055862b9c4
.xword 0x24832dae75d369ef
.xword 0x47967752c7546d40
.xword 0x4499348eac1d4a8a
.xword 0x1fdd66a2eacd3b7f
.xword 0xf4ed725e17d388c4
.xword 0xa154f0489eccc37c




SECTION .CP_REAL_MEM_SEG_6 DATA_VA = 0x0000007def318000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_6,
	VA	 = 0x0000007def318000,
	RA	 = 0x0000006bff318000,
	PA	 = ra2pa(0x0000006bff318000,0),
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
.global SEC_CP_REAL_MEM_DATA6_START
SEC_CP_REAL_MEM_DATA6_START:
.xword 0xdf7276aea7a23e9e
.xword 0x5def3041608809f1
.xword 0xf501fbbf4fe4c722
.xword 0xfcfbee0071a1f4eb
.xword 0xb08fd07d94c65983
.xword 0x9d7c61427b9abb1a
.xword 0x2351970915f0ef77
.xword 0x200e8235e35e5320




SECTION .CP_REAL_MEM_SEG_7 DATA_VA = 0x0000007def31c000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_7,
	VA	 = 0x0000007def31c000,
	RA	 = 0x0000006bff31c000,
	PA	 = ra2pa(0x0000006bff31c000,0),
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
.global SEC_CP_REAL_MEM_DATA7_START
SEC_CP_REAL_MEM_DATA7_START:
.xword 0xc1c4daece63fa5a9
.xword 0x4cf55f286796591c
.xword 0x6488fe5244fa2983
.xword 0x1cc5ef36ca0161f6
.xword 0xf6799ff7fcff3232
.xword 0x3b661f65f8c07aaa
.xword 0x2289b884da264038
.xword 0xd8c11939753cafb8






SECTION .NC_REAL_IO_SEG_0 DATA_VA = 0x000000bef03a0000
attr_data {
	Name	 = .NC_REAL_IO_SEG_0,
	VA	 = 0x000000bef03a0000,
	RA	 = 0x000000bef03a0000,
	PA	 = ra2pa(0x000000bef03a0000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NC_REAL_IO_DATA0_START
SEC_NC_REAL_IO_DATA0_START:
.xword 0xe4b703c456dac8fc
.xword 0xe42416d781db4884
.xword 0xadf663df5011397b
.xword 0x04a2dd1d5c3df8a7
.xword 0x340d7bc926605a9e
.xword 0x2ed9639843a3a76c
.xword 0x88f8814dafe06103
.xword 0xb91764c23eca05b5




SECTION .NC_REAL_IO_SEG_1 DATA_VA = 0x000000bef03a4000
attr_data {
	Name	 = .NC_REAL_IO_SEG_1,
	VA	 = 0x000000bef03a4000,
	RA	 = 0x000000bef03a4000,
	PA	 = ra2pa(0x000000bef03a4000,0),
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

.data
.global SEC_NC_REAL_IO_DATA1_START
SEC_NC_REAL_IO_DATA1_START:
.xword 0xcdf88bb592c2e353
.xword 0x7ad2e79fc1bbe491
.xword 0x5bb600fff08303b2
.xword 0xb643e8b2bda0c4cf
.xword 0x1fef2abefa2f99bc
.xword 0xa529ab67bbd5187c
.xword 0x9969a6b2f33b9f41
.xword 0x3ea0fa6b7f63386e




SECTION .NC_REAL_IO_SEG_2 DATA_VA = 0x000000bef03a8000
attr_data {
	Name	 = .NC_REAL_IO_SEG_2,
	VA	 = 0x000000bef03a8000,
	RA	 = 0x000000bef03a8000,
	PA	 = ra2pa(0x000000bef03a8000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NC_REAL_IO_DATA2_START
SEC_NC_REAL_IO_DATA2_START:
.xword 0x6e2382a2a015621c
.xword 0x1778b367f31bd6ad
.xword 0x45c1ff01baf8c54f
.xword 0x1350ec9f26ccfe4d
.xword 0x33c41f24bd7d6276
.xword 0xe8e250b15ba449b8
.xword 0xeb734f98e9b19d05
.xword 0xee08a171632d73cf




SECTION .NC_REAL_IO_SEG_3 DATA_VA = 0x000000bef03ac000
attr_data {
	Name	 = .NC_REAL_IO_SEG_3,
	VA	 = 0x000000bef03ac000,
	RA	 = 0x000000bef03ac000,
	PA	 = ra2pa(0x000000bef03ac000,0),
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

.data
.global SEC_NC_REAL_IO_DATA3_START
SEC_NC_REAL_IO_DATA3_START:
.xword 0x45d11eeebe305537
.xword 0x92ccba563b46f0c3
.xword 0x27c62c5a08a54546
.xword 0x405208499a293f96
.xword 0x9b9d90d6c6f837f5
.xword 0xc37abc489b45a04f
.xword 0xdbc3b92fe30bd0ee
.xword 0xf8e12e071ccd4e07




SECTION .NC_REAL_IO_SEG_4 DATA_VA = 0x000000bef03b0000
attr_data {
	Name	 = .NC_REAL_IO_SEG_4,
	VA	 = 0x000000bef03b0000,
	RA	 = 0x000000bef03b0000,
	PA	 = ra2pa(0x000000bef03b0000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NC_REAL_IO_DATA4_START
SEC_NC_REAL_IO_DATA4_START:
.xword 0x5a5adfe87ed12774
.xword 0x46685323e9cb7ce5
.xword 0x1adf983a178f67a5
.xword 0x6352d6a72ecd8fc2
.xword 0xfef0e7489831de57
.xword 0xd69e89390defc914
.xword 0x2312d1a10cd7b1ce
.xword 0x66abc0dcf46186f1




SECTION .NC_REAL_IO_SEG_5 DATA_VA = 0x000000bef03b4000
attr_data {
	Name	 = .NC_REAL_IO_SEG_5,
	VA	 = 0x000000bef03b4000,
	RA	 = 0x000000bef03b4000,
	PA	 = ra2pa(0x000000bef03b4000,0),
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

.data
.global SEC_NC_REAL_IO_DATA5_START
SEC_NC_REAL_IO_DATA5_START:
.xword 0x9773ee9252c577ea
.xword 0x5ffe5da5b4886d40
.xword 0xcdf2df8da90fbd10
.xword 0xad5703f7eeae3037
.xword 0xa85a4591cda52bac
.xword 0x7c478198d59aa6c6
.xword 0xf4b70a2457b0262a
.xword 0x9997a3a1e77474be




SECTION .NC_REAL_IO_SEG_6 DATA_VA = 0x000000bef03b8000
attr_data {
	Name	 = .NC_REAL_IO_SEG_6,
	VA	 = 0x000000bef03b8000,
	RA	 = 0x000000bef03b8000,
	PA	 = ra2pa(0x000000bef03b8000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_NC_REAL_IO_DATA6_START
SEC_NC_REAL_IO_DATA6_START:
.xword 0xdb2c3e947f394666
.xword 0xa10aa9f00831b4a7
.xword 0xd0cb548a7d6a5c19
.xword 0x8362873402b753bd
.xword 0x982a413d10726f1d
.xword 0x6250fd45f3632274
.xword 0xe4b32ab302de822f
.xword 0x20c49911da2c7597




SECTION .NC_REAL_IO_SEG_7 DATA_VA = 0x000000bef03bc000
attr_data {
	Name	 = .NC_REAL_IO_SEG_7,
	VA	 = 0x000000bef03bc000,
	RA	 = 0x000000bef03bc000,
	PA	 = ra2pa(0x000000bef03bc000,0),
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

.data
.global SEC_NC_REAL_IO_DATA7_START
SEC_NC_REAL_IO_DATA7_START:
.xword 0x899e6e0c22c49c01
.xword 0x95d9aff0daa5bf5a
.xword 0xaea80822d424f0ee
.xword 0xb1258fe07178c13e
.xword 0x61d1ca2782963832
.xword 0x0c0d28083eccc534
.xword 0x4789fbc6e7a962c4
.xword 0xb4ac305ba083c8ed






SECTION .CP_AIUP_SEG_0 DATA_VA = 0x000000a123502000
attr_data {
	Name	 = .CP_AIUP_SEG_0,
	VA	 = 0x000000a123502000,
	RA	 = 0x0000004a5a550000,
	PA	 = ra2pa(0x0000004a5a550000,0),
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

.data
.global SEC_CP_AIUP_DATA0_START
SEC_CP_AIUP_DATA0_START:
.xword 0x2ca60f6b9e6d95e3
.xword 0xa69c1a191acd5d45
.xword 0x22e121476ffa0ea4
.xword 0xf3cfeb10b1b86a07
.xword 0x6c4d7df4cd6ff72d
.xword 0x242f7bab6f5b935d
.xword 0xf006a96330d0dfbc
.xword 0x89e0b2e058ce8d97




SECTION .CP_AIUP_SEG_1 DATA_VA = 0x000000a123506000
attr_data {
	Name	 = .CP_AIUP_SEG_1,
	VA	 = 0x000000a123506000,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA1_START
SEC_CP_AIUP_DATA1_START:
.xword 0x3fafddbd8f8aa35f
.xword 0x40668b7111d6f4e0
.xword 0xe33533a56b12b290
.xword 0x145b749320992923
.xword 0xa6e652ba49529fd0
.xword 0xa3bdc88a3019ca44
.xword 0xec16656c05b8082b
.xword 0x27b1f4d73ff42f16




SECTION .CP_AIUP_SEG_2 DATA_VA = 0x000000a12350a000
attr_data {
	Name	 = .CP_AIUP_SEG_2,
	VA	 = 0x000000a12350a000,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA2_START
SEC_CP_AIUP_DATA2_START:
.xword 0xea356a9dbf2b8a1c
.xword 0x48c6deb686e65d78
.xword 0x72aee37044193ccb
.xword 0x59f95f32af6de0e6
.xword 0xe601a5582f5d6676
.xword 0xf46b9fce4659f433
.xword 0x5cc13fdd58c8aadc
.xword 0xa99a83f8a2f7d2bc




SECTION .CP_AIUP_SEG_3 DATA_VA = 0x000000a12350e000
attr_data {
	Name	 = .CP_AIUP_SEG_3,
	VA	 = 0x000000a12350e000,
	RA	 = 0x0000004a5a556000,
	PA	 = ra2pa(0x0000004a5a556000,0),
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
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA3_START
SEC_CP_AIUP_DATA3_START:
.xword 0x911c52cb88a65515
.xword 0x05c029d637e04f7a
.xword 0xdc564487635d2e44
.xword 0xb4f9c355f2cb33d1
.xword 0x4c53e180cf8284e2
.xword 0xc6cea60e199284be
.xword 0x17005517d4f0610f
.xword 0x0258fcdbd0774d14




SECTION .CP_AIUP_SEG_4 DATA_VA = 0x000000a123512000
attr_data {
	Name	 = .CP_AIUP_SEG_4,
	VA	 = 0x000000a123512000,
	RA	 = 0x0000004a5a558000,
	PA	 = ra2pa(0x0000004a5a558000,0),
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

.data
.global SEC_CP_AIUP_DATA4_START
SEC_CP_AIUP_DATA4_START:
.xword 0xc008033f7ced10b9
.xword 0xef6cbfca8702f74f
.xword 0xe676acab4ee01abf
.xword 0xfedeb184f7980dd5
.xword 0x459d53368a28db12
.xword 0x3dd4ed7bdb3aea90
.xword 0x8399ea6d06414ff5
.xword 0xa7cfc285db784090




SECTION .CP_AIUP_SEG_5 DATA_VA = 0x000000a123516000
attr_data {
	Name	 = .CP_AIUP_SEG_5,
	VA	 = 0x000000a123516000,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA5_START
SEC_CP_AIUP_DATA5_START:
.xword 0x28ddcfac1c18e069
.xword 0x872ad3e294105108
.xword 0xe187f1b2ed1f6230
.xword 0x83c67af5f3a86325
.xword 0x0415338d6f177c18
.xword 0x41e757bf57b4b7be
.xword 0xb0659a7b78540946
.xword 0xa110a08f7a703f85




SECTION .CP_AIUP_SEG_6 DATA_VA = 0x000000a12351a000
attr_data {
	Name	 = .CP_AIUP_SEG_6,
	VA	 = 0x000000a12351a000,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA6_START
SEC_CP_AIUP_DATA6_START:
.xword 0x6f82bca5fadb6ab7
.xword 0xee58907b227351d4
.xword 0x33a6558dc9f55b7c
.xword 0xa918f603711e17b7
.xword 0x3b8c818988bd698f
.xword 0x80246a9e5b78c543
.xword 0xa000f7b10c9be28d
.xword 0xa42c59a75ac30690




SECTION .CP_AIUP_SEG_7 DATA_VA = 0x000000a12351e000
attr_data {
	Name	 = .CP_AIUP_SEG_7,
	VA	 = 0x000000a12351e000,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CP_AIUP_DATA7_START
SEC_CP_AIUP_DATA7_START:
.xword 0x0d52c59c31eaffbd
.xword 0x39d771fea1ff4c7b
.xword 0x283cc403c7628cfd
.xword 0xf5289ba068991686
.xword 0xe5cf57dd4386e47f
.xword 0x963e6c27f664ca11
.xword 0x6c0f12490946d6f1
.xword 0xc911b455718e5786






SECTION .NC_AIUP_SEG_0 DATA_VA = 0x000000a5674a2000
attr_data {
	Name	 = .NC_AIUP_SEG_0,
	VA	 = 0x000000a5674a2000,
	RA	 = 0x000000b5a5a20000,
	PA	 = ra2pa(0x000000b5a5a20000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUP_DATA0_START
SEC_NC_AIUP_DATA0_START:
.xword 0x22a7cab302b542ae
.xword 0xd5186b9c59015379
.xword 0x088a0369f718dade
.xword 0xe17987917d646a3b
.xword 0xcf72db93fd27d1d8
.xword 0x82b53707fb7d92c9
.xword 0x49652d86b52ad45e
.xword 0xc6c8e64449cc1f02




SECTION .NC_AIUP_SEG_1 DATA_VA = 0x000000a5674a6000
attr_data {
	Name	 = .NC_AIUP_SEG_1,
	VA	 = 0x000000a5674a6000,
	RA	 = 0x000000b5a5a22000,
	PA	 = ra2pa(0x000000b5a5a22000,0),
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

.data
.global SEC_NC_AIUP_DATA1_START
SEC_NC_AIUP_DATA1_START:
.xword 0x4f3767a996ac0551
.xword 0xa36eef498889aec4
.xword 0xa7b914af8e2c9808
.xword 0x5ac01dac4ad7702e
.xword 0xe0828bf67162a6ee
.xword 0xd037356a1d42e2bd
.xword 0x961a8a6a54d81e7d
.xword 0xdb2d9e0bea89c894




SECTION .NC_AIUP_SEG_2 DATA_VA = 0x000000a5674aa000
attr_data {
	Name	 = .NC_AIUP_SEG_2,
	VA	 = 0x000000a5674aa000,
	RA	 = 0x000000b5a5a24000,
	PA	 = ra2pa(0x000000b5a5a24000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUP_DATA2_START
SEC_NC_AIUP_DATA2_START:
.xword 0xe7f564481574bbd4
.xword 0x5ebde7d89721f9ad
.xword 0xc2e4a73c7361a557
.xword 0x8fef954cf7b9a77f
.xword 0x4cf2baaf9b592ac2
.xword 0x99bff24d71b12b11
.xword 0x0d685bdf3ebc5c49
.xword 0x2b2c8a6a77ea7ca1




SECTION .NC_AIUP_SEG_3 DATA_VA = 0x000000a5674ae000
attr_data {
	Name	 = .NC_AIUP_SEG_3,
	VA	 = 0x000000a5674ae000,
	RA	 = 0x000000b5a5a26000,
	PA	 = ra2pa(0x000000b5a5a26000,0),
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

.data
.global SEC_NC_AIUP_DATA3_START
SEC_NC_AIUP_DATA3_START:
.xword 0xd0590dd807b93a84
.xword 0x61b4fef019a236c9
.xword 0x3e3a8d95bb6e7397
.xword 0x1a3b0351b34d2552
.xword 0x0c713d7b4eeaf730
.xword 0x6a9c177a01fda159
.xword 0x5121403798347121
.xword 0x455e093ce7ce5ebe




SECTION .NC_AIUP_SEG_4 DATA_VA = 0x000000a5674b2000
attr_data {
	Name	 = .NC_AIUP_SEG_4,
	VA	 = 0x000000a5674b2000,
	RA	 = 0x000000b5a5a28000,
	PA	 = ra2pa(0x000000b5a5a28000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUP_DATA4_START
SEC_NC_AIUP_DATA4_START:
.xword 0x157f7f7c4ee972ba
.xword 0xfd0f070204f6baa8
.xword 0x3540ae496c07dc2b
.xword 0xa4c15e8780726434
.xword 0x496ef72a1f463e06
.xword 0xf78bfd958c7e135e
.xword 0x23565803f1369108
.xword 0xd9a306f9ec919a93




SECTION .NC_AIUP_SEG_5 DATA_VA = 0x000000a5674b6000
attr_data {
	Name	 = .NC_AIUP_SEG_5,
	VA	 = 0x000000a5674b6000,
	RA	 = 0x000000b5a5a2a000,
	PA	 = ra2pa(0x000000b5a5a2a000,0),
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

.data
.global SEC_NC_AIUP_DATA5_START
SEC_NC_AIUP_DATA5_START:
.xword 0x05f32a73baeaf50c
.xword 0x812cb41207a182ab
.xword 0x882c7da299fc4f79
.xword 0x1109f0bd33a13e52
.xword 0xe7d294166dea978b
.xword 0x57231cfda35d56f8
.xword 0x37253b6f299e432a
.xword 0xd983740e9c9988bd




SECTION .NC_AIUP_SEG_6 DATA_VA = 0x000000a5674ba000
attr_data {
	Name	 = .NC_AIUP_SEG_6,
	VA	 = 0x000000a5674ba000,
	RA	 = 0x000000b5a5a2c000,
	PA	 = ra2pa(0x000000b5a5a2c000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUP_DATA6_START
SEC_NC_AIUP_DATA6_START:
.xword 0x27d741f407c4da29
.xword 0xf62a0830363ba5d8
.xword 0x5ee2c189e9a907cb
.xword 0x67ff6f0de923ff33
.xword 0xdff21b584875ad80
.xword 0x5018234f6798b1ed
.xword 0x4827506c145d4009
.xword 0x196e93e4430d9e4d




SECTION .NC_AIUP_SEG_7 DATA_VA = 0x000000a5674be000
attr_data {
	Name	 = .NC_AIUP_SEG_7,
	VA	 = 0x000000a5674be000,
	RA	 = 0x000000b5a5a2e000,
	PA	 = ra2pa(0x000000b5a5a2e000,0),
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

.data
.global SEC_NC_AIUP_DATA7_START
SEC_NC_AIUP_DATA7_START:
.xword 0xc4c14a8e57d577c1
.xword 0xd7eee3233df75629
.xword 0xb8c0cca31817f0e2
.xword 0x8817c59066b728cb
.xword 0xe25be316fcca26a3
.xword 0xa9cbc3bb3e2827c4
.xword 0x67c597a29ad0a37b
.xword 0xbf72967fce53d4f5






SECTION .CP_AIUS_SEG_0 DATA_VA = 0x000000a9abc02000
attr_data {
	Name	 = .CP_AIUS_SEG_0,
	VA	 = 0x000000a9abc02000,
	RA	 = 0x00000043c3c90000,
	PA	 = ra2pa(0x00000043c3c90000,0),
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

.data
.global SEC_CP_AIUS_DATA0_START
SEC_CP_AIUS_DATA0_START:
.xword 0xadf13b45a6c88f89
.xword 0x9c369f5eb9584347
.xword 0xadb32ba0861dd5c8
.xword 0x2b96e9977a40b3e0
.xword 0x838223bf9eb72b6d
.xword 0xbe87baecde723ae8
.xword 0x7d1145f351c1cadc
.xword 0x180a59f09f7814db




SECTION .CP_AIUS_SEG_1 DATA_VA = 0x000000a9abc06000
attr_data {
	Name	 = .CP_AIUS_SEG_1,
	VA	 = 0x000000a9abc06000,
	RA	 = 0x00000043c3c92000,
	PA	 = ra2pa(0x00000043c3c92000,0),
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

.data
.global SEC_CP_AIUS_DATA1_START
SEC_CP_AIUS_DATA1_START:
.xword 0x6bc6103f0ecbcc8d
.xword 0xd0dbfba5d0d56da4
.xword 0x1d3387830403e867
.xword 0x49b8203771210c0c
.xword 0xfdd4c69e7090ab46
.xword 0x95a0d779a0c4952e
.xword 0xfcf86ccf7595bb4e
.xword 0x06b4d3ef291de311




SECTION .CP_AIUS_SEG_2 DATA_VA = 0x000000a9abc0a000
attr_data {
	Name	 = .CP_AIUS_SEG_2,
	VA	 = 0x000000a9abc0a000,
	RA	 = 0x00000043c3c94000,
	PA	 = ra2pa(0x00000043c3c94000,0),
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

.data
.global SEC_CP_AIUS_DATA2_START
SEC_CP_AIUS_DATA2_START:
.xword 0x8ec311f96fbf8cf0
.xword 0xb38450bef9a71f78
.xword 0xb9bc6053b82673f1
.xword 0xdc6e13f8b7464cce
.xword 0x9287544f1639c049
.xword 0x961a6850d0555967
.xword 0x19b7a36c24af1fc1
.xword 0x0dd5f652b25eb555




SECTION .CP_AIUS_SEG_3 DATA_VA = 0x000000a9abc0e000
attr_data {
	Name	 = .CP_AIUS_SEG_3,
	VA	 = 0x000000a9abc0e000,
	RA	 = 0x00000043c3c96000,
	PA	 = ra2pa(0x00000043c3c96000,0),
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

.data
.global SEC_CP_AIUS_DATA3_START
SEC_CP_AIUS_DATA3_START:
.xword 0x6bb823d8ee07ab80
.xword 0xbafd54b073c10751
.xword 0x0dedaaaeb578a25a
.xword 0x808edab222695bc5
.xword 0xb7aa1a725da9b82d
.xword 0xfccb542a6fb2fdd3
.xword 0x82884a5b11d29bac
.xword 0x37e6f156053ff777




SECTION .CP_AIUS_SEG_4 DATA_VA = 0x000000a9abc12000
attr_data {
	Name	 = .CP_AIUS_SEG_4,
	VA	 = 0x000000a9abc12000,
	RA	 = 0x00000043c3c98000,
	PA	 = ra2pa(0x00000043c3c98000,0),
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

.data
.global SEC_CP_AIUS_DATA4_START
SEC_CP_AIUS_DATA4_START:
.xword 0xdabd4ee0cd5bc44e
.xword 0x0c445e453466441c
.xword 0xea93407e68c0d32c
.xword 0x53512e91b77f4c51
.xword 0x75c3d5d80442f1da
.xword 0xf761e9f4f35fa30e
.xword 0x9686b23f6fba08be
.xword 0xbe44246c259f76ba




SECTION .CP_AIUS_SEG_5 DATA_VA = 0x000000a9abc16000
attr_data {
	Name	 = .CP_AIUS_SEG_5,
	VA	 = 0x000000a9abc16000,
	RA	 = 0x00000043c3c9a000,
	PA	 = ra2pa(0x00000043c3c9a000,0),
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

.data
.global SEC_CP_AIUS_DATA5_START
SEC_CP_AIUS_DATA5_START:
.xword 0x94af2a26661652d0
.xword 0xe00f9c06886ba802
.xword 0x83c419fbb32d80bb
.xword 0x761e26ffe574e355
.xword 0x824c3baddaf0e939
.xword 0xf442d9f63575bb5f
.xword 0x632fb9655dc0043b
.xword 0x4cd7906e05fdb733




SECTION .CP_AIUS_SEG_6 DATA_VA = 0x000000a9abc1a000
attr_data {
	Name	 = .CP_AIUS_SEG_6,
	VA	 = 0x000000a9abc1a000,
	RA	 = 0x00000043c3c9c000,
	PA	 = ra2pa(0x00000043c3c9c000,0),
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

.data
.global SEC_CP_AIUS_DATA6_START
SEC_CP_AIUS_DATA6_START:
.xword 0x338cb96f3bcc25a4
.xword 0xc9d1295c7cb31669
.xword 0x51ef75e1ed4695d1
.xword 0x715433a27b91a1a5
.xword 0x4b5b8302a3c2718d
.xword 0xdc40dcb975cbd0a3
.xword 0x16a002cfd4a51c72
.xword 0x0e7540529af91dd3




SECTION .CP_AIUS_SEG_7 DATA_VA = 0x000000a9abc1e000
attr_data {
	Name	 = .CP_AIUS_SEG_7,
	VA	 = 0x000000a9abc1e000,
	RA	 = 0x00000043c3c9e000,
	PA	 = ra2pa(0x00000043c3c9e000,0),
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

.data
.global SEC_CP_AIUS_DATA7_START
SEC_CP_AIUS_DATA7_START:
.xword 0x1698f6031732cecd
.xword 0x24d359a488ee3c7c
.xword 0x2d55c9ea55437f9b
.xword 0xa8c579aa846f179e
.xword 0x869dd2ec84320f1a
.xword 0x3b8dbbbce27de85a
.xword 0x588d089f36c392ea
.xword 0x52b254e7e0608bc0






SECTION .NC_AIUS_SEG_0 DATA_VA = 0x000000adef1a2000
attr_data {
	Name	 = .NC_AIUS_SEG_0,
	VA	 = 0x000000adef1a2000,
	RA	 = 0x000000bc3c360000,
	PA	 = ra2pa(0x000000bc3c360000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA0_START
SEC_NC_AIUS_DATA0_START:
.xword 0x6cf4d9a0899b7666
.xword 0x6a25df393372b744
.xword 0xe6749b43aad0eada
.xword 0xe5ca4de4d7dd2860
.xword 0x76aee79ebeb57954
.xword 0xef64883058218652
.xword 0xf9b5626e297fa681
.xword 0x21ead6b381735cb1




SECTION .NC_AIUS_SEG_1 DATA_VA = 0x000000adef1a6000
attr_data {
	Name	 = .NC_AIUS_SEG_1,
	VA	 = 0x000000adef1a6000,
	RA	 = 0x000000bc3c362000,
	PA	 = ra2pa(0x000000bc3c362000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA1_START
SEC_NC_AIUS_DATA1_START:
.xword 0xa1d60c62dc2d5cce
.xword 0xaec048bb7e79f5e2
.xword 0xcfa95ef79a0ce3ef
.xword 0xa03eabb9acac2402
.xword 0x9ffa3c72e8b023b9
.xword 0x594f93e1e0ce93f2
.xword 0x4328c5cbcdf0e5f7
.xword 0xf2c11ff64d36de1d




SECTION .NC_AIUS_SEG_2 DATA_VA = 0x000000adef1aa000
attr_data {
	Name	 = .NC_AIUS_SEG_2,
	VA	 = 0x000000adef1aa000,
	RA	 = 0x000000bc3c364000,
	PA	 = ra2pa(0x000000bc3c364000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA2_START
SEC_NC_AIUS_DATA2_START:
.xword 0x4596ece1ab6075ad
.xword 0xfd0289dfedddb162
.xword 0x13811d0be624fdc6
.xword 0xccda690b862a509e
.xword 0x39b9e924059ad777
.xword 0x2d014d0fb05a27f2
.xword 0xab88b03a552fdfce
.xword 0xbafba75f0d3824c4




SECTION .NC_AIUS_SEG_3 DATA_VA = 0x000000adef1ae000
attr_data {
	Name	 = .NC_AIUS_SEG_3,
	VA	 = 0x000000adef1ae000,
	RA	 = 0x000000bc3c366000,
	PA	 = ra2pa(0x000000bc3c366000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA3_START
SEC_NC_AIUS_DATA3_START:
.xword 0xf6cf0222e5e9f5c5
.xword 0xf225c86fdcb0ca83
.xword 0x09a3a7deb0e3c6e2
.xword 0xfb9cd558629b6007
.xword 0x8c18eedff3342bc7
.xword 0x154e1c120f9f2048
.xword 0xcc2dd3e17a7e72cc
.xword 0xd39a424735249845




SECTION .NC_AIUS_SEG_4 DATA_VA = 0x000000adef1b2000
attr_data {
	Name	 = .NC_AIUS_SEG_4,
	VA	 = 0x000000adef1b2000,
	RA	 = 0x000000bc3c368000,
	PA	 = ra2pa(0x000000bc3c368000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA4_START
SEC_NC_AIUS_DATA4_START:
.xword 0x177013af6a53917f
.xword 0xe8adf5782f1f96fa
.xword 0x909c5a294135e891
.xword 0x0f0cddd9546d0519
.xword 0xa4ff4a767e54052a
.xword 0x594d3be0d7005922
.xword 0x893d20e4eade1cce
.xword 0xecfb25f2f7c466e1




SECTION .NC_AIUS_SEG_5 DATA_VA = 0x000000adef1b6000
attr_data {
	Name	 = .NC_AIUS_SEG_5,
	VA	 = 0x000000adef1b6000,
	RA	 = 0x000000bc3c36a000,
	PA	 = ra2pa(0x000000bc3c36a000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA5_START
SEC_NC_AIUS_DATA5_START:
.xword 0x8de98641e6c14cf6
.xword 0x91c7a7c44c1bbafc
.xword 0xb6b02ea8922dc1ab
.xword 0xcd0de34b3616088e
.xword 0x550abb57a445bda0
.xword 0xfbb70633fd54e476
.xword 0x9682e27f60f4e2c5
.xword 0x9b15c3c7e4f7ada0




SECTION .NC_AIUS_SEG_6 DATA_VA = 0x000000adef1ba000
attr_data {
	Name	 = .NC_AIUS_SEG_6,
	VA	 = 0x000000adef1ba000,
	RA	 = 0x000000bc3c36c000,
	PA	 = ra2pa(0x000000bc3c36c000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA6_START
SEC_NC_AIUS_DATA6_START:
.xword 0xa2d57e92e7631b3d
.xword 0xc034f97b956f206c
.xword 0xafe97ef1f10f9996
.xword 0x0bcae7128517ff9a
.xword 0x4e8b71e12440e377
.xword 0x797688b621b406ad
.xword 0xcee62586773e8198
.xword 0x087820ccbb5027be




SECTION .NC_AIUS_SEG_7 DATA_VA = 0x000000adef1be000
attr_data {
	Name	 = .NC_AIUS_SEG_7,
	VA	 = 0x000000adef1be000,
	RA	 = 0x000000bc3c36e000,
	PA	 = ra2pa(0x000000bc3c36e000,0),
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NC_AIUS_DATA7_START
SEC_NC_AIUS_DATA7_START:
.xword 0xbbdbc9b0b7d2472a
.xword 0x7a6130efbc9257d2
.xword 0x2216753b91a31db8
.xword 0x50a418585c3ff18c
.xword 0x8310b7294cf57652
.xword 0x464fe9b56bc5495b
.xword 0xa6b1cff2b3f606c6
.xword 0x8eea92193eead8ab




#if 0
#endif
