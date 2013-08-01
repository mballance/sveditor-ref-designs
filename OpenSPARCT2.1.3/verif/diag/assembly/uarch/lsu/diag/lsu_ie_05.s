/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_05.s
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
	setx 0x1638911c1cef2bc6, %g1, %r2
	setx 0x2e04167abc51c080, %g1, %r3
	setx 0xe9a196bc79895133, %g1, %r4
	setx 0x55a72340f6275eb2, %g1, %r5
	setx 0x97fddc781e68882f, %g1, %r6
	setx 0x53cd74d6b37a22f9, %g1, %r7
	setx 0x1e8107630e0e87a0, %g1, %r8

     mov %r2, %r1
CHANGE_PRIV0:
	ta	T_CHANGE_PRIV
CHANGE_R261:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP1:
	and	%r26,	%r28,	%r26
CP_NUC2:
	.word 0xcad5019a  ! 3: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r5
	.word 0xc8bcd03a  ! 5: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xca84101a  ! 7: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r5
	.word 0xcaacd13a  ! 9: STBA_R	stba	%r5, [%r19 + %r26] 0x89
SHORT_FP_PRI3:
	.word 0xcb9adb1a  ! 11: LDDFA_R	ldda	[%r11, %r26], %f5
NC_BIS_AIUS4:
	.word 0xc4a7c47a  ! 13: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
NC_NUC5:
	.word 0xcacd409a  ! 15: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r5
NC_PST_PRI6:
	.word 0xcbbb991a  ! 17: STDFA_R	stda	%f5, [%r26, %r14]
CP_BIS_NUC7:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 19: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
	.word 0xca6b603b  ! 20: LDSTUB_I	ldstub	%r5, [%r13 + 0x003b]
	.word 0xc89c501a  ! 22: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
	.word 0xca12a03a  ! 23: LDUH_I	lduh	[%r10 + 0x003a], %r5
CHANGE_USER8:
	ta	T_CHANGE_NONPRIV
CHANGE_R269:
	add	%r26,	%r27,	%r26
NC_BIS_PRI9:
	.word 0xc8a41d5a  ! 25: STWA_R	stwa	%r4, [%r16 + %r26] 0xea
	.word 0xcaac101a  ! 27: STBA_R	stba	%r5, [%r16 + %r26] 0x80
	.word 0xcbbbd01a  ! 29: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcb9cd03a  ! 31: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcadc903a  ! 33: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP11:
	.word 0xcb9e031a  ! 35: LDDFA_R	ldda	[%r24, %r26], %f5
NC_AIUP12:
	.word 0xc8be421a  ! 37: STDA_R	stda	%r4, [%r25 + %r26] 0x10
	.word 0xcac3d11a  ! 39: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r5
SHORT_FP_PRI13:
	.word 0xcb9a9b1a  ! 41: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcb3aa038  ! 42: STDF_I	std	%f5, [0x0038, %r10]
CP_AIUS14:
	.word 0xcb87823a  ! 44: LDFA_R	lda	[%r30, %r26], %f5
CHANGE_USER15:
	ta	T_CHANGE_NONPRIV
CHANGE_R2616:
	add	%r26,	%r27,	%r26
NC_BIS_PRI16:
	.word 0xcca41c5a  ! 46: STWA_R	stwa	%r6, [%r16 + %r26] 0xe2
WR_LEASI_17:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_18:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcb1a801a  ! 48: LDDF_R	ldd	[%r10, %r26], %f5
SHORT_FP_PRI19:
	.word 0xcb9b1a5a  ! 50: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xc8bc903a  ! 52: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xcab4d03a  ! 54: STHA_R	stha	%r5, [%r19 + %r26] 0x81
	.word 0xca7a801a  ! 55: SWAP_R	swap	%r5, [%r10 + %r26]
NC_PST_PRI20:
	.word 0xcbbc195a  ! 57: STDFA_R	stda	%f5, [%r26, %r16]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP22:
	.word 0xcad6021a  ! 59: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r5
NC_BIS_SEC23:
	.word 0xc4a4dc7a  ! 61: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xca94d03a  ! 63: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xca8c111a  ! 65: LDUBA_R	lduba	[%r16, %r26] 0x88, %r5
	.word 0xcba4903a  ! 67: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xca8cd03a  ! 69: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xcaac903a  ! 71: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xca22c01a  ! 72: STW_R	stw	%r5, [%r11 + %r26]
	.word 0xcb03401a  ! 73: LDF_R	ld	[%r13, %r26], %f5
NC_BLK_SEc24:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 75: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcaa4d03a  ! 77: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xca72a038  ! 78: STX_I	stx	%r5, [%r10 + 0x0038]
CP_PST_PRI25:
	.word 0xcbbad89a  ! 80: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcb02c01a  ! 81: LDF_R	ld	[%r11, %r26], %f5
NC_AIUP26:
	.word 0xcb9e421a  ! 83: LDDFA_R	ldda	[%r25, %r26], %f5
	.word 0xca7a801a  ! 84: SWAP_R	swap	%r5, [%r10 + %r26]
CP_BIS_AIUP27:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 86: STBA_R	stba	%r6, [%r24 + %r26] 0x22
	.word 0xcaf3901a  ! 88: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
	.word 0xcb02801a  ! 89: LDF_R	ld	[%r10, %r26], %f5
NC_BIS_AIUP28:
	.word 0xc4be455a  ! 91: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
	.word 0xcbbc111a  ! 93: STDFA_R	stda	%f5, [%r26, %r16]
CHANGE_R2629:
	add	%r26,	%r27,	%r26
CP_BIS_SEC29:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 95: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
CP_NUC30:
	.word 0xcaad019a  ! 97: STBA_R	stba	%r5, [%r20 + %r26] 0x0c
	.word 0xc8bcd03a  ! 99: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xcb84511a  ! 101: LDFA_R	lda	[%r17, %r26], %f5
	.word 0xcb02a038  ! 102: LDF_I	ld	[%r10, 0x0038], %f5
	.word 0xcac3901a  ! 104: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
	.word 0xca7b401a  ! 105: SWAP_R	swap	%r5, [%r13 + %r26]
	.word 0xca236038  ! 106: STW_I	stw	%r5, [%r13 + 0x0038]
	.word 0xcb82905a  ! 107: LDFA_R	lda	[%r10, %r26], %f5
CHANGE_R2631:
	add	%r26,	%r27,	%r26
CP_BIS_SEC31:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 109: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xc8bc903a  ! 111: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CP_PST_PRI32:
	.word 0xcbba981a  ! 113: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcaabd11a  ! 115: STBA_R	stba	%r5, [%r15 + %r26] 0x88
	.word 0xcba4d03a  ! 117: STFA_R	sta	%f5, [%r26, %r19]
CP_NUC33:
	.word 0xcaed009a  ! 119: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x04
NC_BIS_SEC34:
	.word 0xc4b4dc7a  ! 121: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xca94903a  ! 123: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xc89c101a  ! 125: LDDA_R	ldda	[%r16, %r26] 0x80, %r4
	.word 0xcb1b001a  ! 126: LDDF_R	ldd	[%r12, %r26], %f5
	.word 0xcaac903a  ! 128: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_BLK_SEc35:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 130: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcb22a038  ! 131: STF_I	st	%f5, [0x0038, %r10]
CHANGE_R2636:
	mov	%g0,	%r26
CP_BIS_SEC36:
	and	%r26,	%r28,	%r26
	.word 0xc8f49c7a  ! 133: STXA_R	stxa	%r4, [%r18 + %r26] 0xe3
NC_PST_PRI37:
	.word 0xcbbc191a  ! 135: STDFA_R	stda	%f5, [%r26, %r16]
SHORT_FP_PRI38:
	.word 0xcb9b5b5a  ! 137: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xcb3b6038  ! 138: STDF_I	std	%f5, [0x0038, %r13]
SHORT_FP_PRI39:
	.word 0xcb9a9a1a  ! 140: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xc89c913a  ! 142: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
NC_AIUS40:
	.word 0xcadfc33a  ! 144: LDXA_R	ldxa	[%r31, %r26] 0x19, %r5
CHANGE_USER41:
	ta	T_CHANGE_NONPRIV
CHANGE_R2642:
	add	%r26,	%r27,	%r26
NC_BIS_PRI42:
	.word 0xc4f39c5a  ! 146: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	.word 0xcacb105a  ! 147: LDSBA_R	ldsba	[%r12, %r26] 0x82, %r5
	.word 0xcb1a801a  ! 148: LDDF_R	ldd	[%r10, %r26], %f5
	.word 0xca8b901a  ! 150: LDUBA_R	lduba	[%r14, %r26] 0x80, %r5
NC_BIS_PRI43:
	.word 0xd0b39c5a  ! 152: STHA_R	stha	%r8, [%r14 + %r26] 0xe2
	.word 0xcb9c903a  ! 154: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xca8c903a  ! 156: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xcafa901a  ! 157: SWAPA_R	swapa	%r5, [%r10 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS45:
	.word 0xca87c33a  ! 159: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r5
CP_NUC46:
	.word 0xcacd019a  ! 161: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r5
	.word 0xcad4913a  ! 163: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcbbc913a  ! 165: STDFA_R	stda	%f5, [%r26, %r18]
CP_AIUP47:
	.word 0xcaf6021a  ! 167: STXA_R	stxa	%r5, [%r24 + %r26] 0x10
CP_BIS_AIUP48:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 169: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
CP_PST_PRI49:
	.word 0xcbbb581a  ! 171: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcac4d13a  ! 173: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
CP_BIS_AIUP50:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 175: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CHANGE_CLE51:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcbbc913a  ! 178: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcaab901a  ! 180: STBA_R	stba	%r5, [%r14 + %r26] 0x80
	.word 0xcb82915a  ! 181: LDFA_R	lda	[%r10, %r26], %f5
CHANGE_PRIV52:
	ta	T_CHANGE_PRIV
CHANGE_R2653:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP53:
	.word 0xc4a6455a  ! 183: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
	.word 0xcbbcd13a  ! 185: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcaa4903a  ! 187: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcaf3901a  ! 189: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
	.word 0xcb22c01a  ! 190: STF_R	st	%f5, [%r26, %r11]
	.word 0xcaeb501a  ! 191: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x80
CP_AIUP54:
	.word 0xcab6021a  ! 193: STHA_R	stha	%r5, [%r24 + %r26] 0x10
	.word 0xcaf3101a  ! 194: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
CP_BIS_AIUS55:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 196: STHA_R	stha	%r2, [%r30 + %r26] 0x23
CP_AIUP56:
	.word 0xcaae021a  ! 198: STBA_R	stba	%r5, [%r24 + %r26] 0x10
	.word 0xcaf4d03a  ! 200: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xcac4903a  ! 202: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcb83501a  ! 203: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xcacc913a  ! 205: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r5
CP_BIS_QUAD_LD57:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 207: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
	.word 0xcad4903a  ! 209: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
CP_AIUS58:
	.word 0xcab7823a  ! 211: STHA_R	stha	%r5, [%r30 + %r26] 0x11
CHANGE_USER59:
	ta	T_CHANGE_NONPRIV
CHANGE_R2660:
	add	%r26,	%r27,	%r26
NC_BIS_PRI60:
	.word 0xccb39c5a  ! 213: STHA_R	stha	%r6, [%r14 + %r26] 0xe2
CP_PST_PRI61:
	.word 0xcbbb181a  ! 215: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xca8c903a  ! 217: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CP_PST_PRI62:
	.word 0xcbbb185a  ! 219: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xc8bc101a  ! 221: STDA_R	stda	%r4, [%r16 + %r26] 0x80
CHANGE_PRIV63:
	ta	T_CHANGE_PRIV
CHANGE_R2664:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP64:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 223: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xcbbad01a  ! 224: STDFA_R	stda	%f5, [%r26, %r11]
CP_NUC65:
	.word 0xcac5019a  ! 226: LDSWA_R	ldswa	[%r20, %r26] 0x0c, %r5
	.word 0xc89cd03a  ! 228: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
NC_PST_PRI66:
	.word 0xcbbbd81a  ! 230: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xca7b2038  ! 231: SWAP_I	swap	%r5, [%r12 + 0x0038]
	.word 0xcadc913a  ! 233: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
	.word 0xcadb911a  ! 235: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
	.word 0xcb83911a  ! 237: LDFA_R	lda	[%r14, %r26], %f5
	.word 0xcbbb901a  ! 239: STDFA_R	stda	%f5, [%r26, %r14]
CP_AIUP67:
	.word 0xcac6021a  ! 241: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r5
	.word 0xcbe2a01a  ! 242: CASA_R	casa	[%r10] %asi, %r26, %r5
	.word 0xcaa4d13a  ! 244: STWA_R	stwa	%r5, [%r19 + %r26] 0x89
CP_AIUS68:
	.word 0xca8f823a  ! 246: LDUBA_R	lduba	[%r30, %r26] 0x11, %r5
	.word 0xca84d13a  ! 248: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
CP_BIS_AIUP69:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 250: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
	.word 0xca83515a  ! 251: LDUWA_R	lduwa	[%r13, %r26] 0x8a, %r5
CP_AIUP70:
	.word 0xc8be031a  ! 253: STDA_R	stda	%r4, [%r24 + %r26] 0x18
NC_AIUS71:
	.word 0xcb87c23a  ! 255: LDFA_R	lda	[%r31, %r26], %f5
	.word 0xcada915a  ! 256: LDXA_R	ldxa	[%r10, %r26] 0x8a, %r5
	.word 0xcb83105a  ! 257: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xca84903a  ! 259: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
	.word 0xcba3101a  ! 260: STFA_R	sta	%f5, [%r26, %r12]
	.word 0xcaf4d03a  ! 262: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
CHANGE_USER72:
	ta	T_CHANGE_NONPRIV
CHANGE_R2673:
	add	%r26,	%r27,	%r26
NC_BIS_PRI73:
	.word 0xc8a3dd5a  ! 264: STWA_R	stwa	%r4, [%r15 + %r26] 0xea
	.word 0xcaccd03a  ! 266: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcba4511a  ! 268: STFA_R	sta	%f5, [%r26, %r17]
	.word 0xca736038  ! 269: STX_I	stx	%r5, [%r13 + 0x0038]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS75:
	.word 0xcbbfc23a  ! 271: STDFA_R	stda	%f5, [%r26, %r31]
	.word 0xcbbb101a  ! 272: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcb23401a  ! 273: STF_R	st	%f5, [%r26, %r13]
CP_NUC76:
	.word 0xcbf5201a  ! 275: CASXA_R	casxa	[%r20]%asi, %r26, %r5
CHANGE_USER77:
	ta	T_CHANGE_NONPRIV
CHANGE_R2678:
	mov	%g0,	%r26
NC_BIS_PRI78:
	.word 0xc4ab9c5a  ! 277: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
NC_SHORT_FP_SEC79:
	.word 0xcbbcda3a  ! 279: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xc89b105a  ! 280: LDDA_R	ldda	[%r12, %r26] 0x82, %r4
	.word 0xcbbb101a  ! 281: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcad4903a  ! 283: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
CP_BIS_PRI80:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 285: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
CHANGE_R2681:
	add	%r26,	%r27,	%r26
CP_BIS_SEC81:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 287: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
CHANGE_CLE82:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP84:
	.word 0xcab6421a  ! 290: STHA_R	stha	%r5, [%r25 + %r26] 0x10
	.word 0xca2b603b  ! 291: STB_I	stb	%r5, [%r13 + 0x003b]
	.word 0xcaea901a  ! 292: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x80
SET_TL1_85:
	ta	T_CHANGE_TO_TL1
CHANGE_R2686:
	add	%r26,	%r27,	%r26
NC_BIS_NUC86:
	.word 0xc4f545fa  ! 294: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
	.word 0xca8c903a  ! 296: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
NC_BLK_SEc87:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 298: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BIS_AIUP88:
	.word 0xd0ae445a  ! 300: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xcaab901a  ! 302: STBA_R	stba	%r5, [%r14 + %r26] 0x80
NC_BIS_AIUP89:
	.word 0xc4b6455a  ! 304: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
CP_ATM_QUAD_LD90:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 306: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
	.word 0xca732038  ! 307: STX_I	stx	%r5, [%r12 + 0x0038]
	.word 0xcb02c01a  ! 308: LDF_R	ld	[%r11, %r26], %f5
CP_BIS_QUAD_LD91:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 310: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
CP_BIS_QUAD_LD92:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 312: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
CHANGE_R2693:
	add	%r26,	%r27,	%r26
CP_BIS_SEC93:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9d7a  ! 314: STBA_R	stba	%r4, [%r18 + %r26] 0xeb
	.word 0xcaf4d13a  ! 316: STXA_R	stxa	%r5, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD94:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 318: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc89cd13a  ! 320: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xcba3901a  ! 322: STFA_R	sta	%f5, [%r26, %r14]
SET_TL0_95:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI96:
	.word 0xccac5c5a  ! 324: STBA_R	stba	%r6, [%r17 + %r26] 0xe2
CP_BIS_QUAD_LD97:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 326: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
CHANGE_PRIV98:
	ta	T_CHANGE_PRIV
CHANGE_R2699:
	add	%r26,	%r27,	%r26
CP_BIS_NUC99:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 328: STHA_R	stha	%r4, [%r20 + %r26] 0x27
SHORT_FP_PRI100:
	.word 0xcbbb5a1a  ! 330: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcaa3901a  ! 332: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	.word 0xcaac913a  ! 334: STBA_R	stba	%r5, [%r18 + %r26] 0x89
NC_PST_PRI101:
	.word 0xcbbc591a  ! 336: STDFA_R	stda	%f5, [%r26, %r17]
CP_BIS_AIUP102:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 338: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xca6b401a  ! 339: LDSTUB_R	ldstub	%r5, [%r13 + %r26]
	.word 0xcba4d13a  ! 341: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcacc903a  ! 343: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
CHANGE_USER103:
	ta	T_CHANGE_NONPRIV
CHANGE_R26104:
	add	%r26,	%r27,	%r26
NC_BIS_PRI104:
	.word 0xc8ac1c5a  ! 345: STBA_R	stba	%r4, [%r16 + %r26] 0xe2
	.word 0xcaa2901a  ! 346: STWA_R	stwa	%r5, [%r10 + %r26] 0x80
	.word 0xca93d11a  ! 348: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
NC_PST_PRI105:
	.word 0xcbbc599a  ! 350: STDFA_R	stda	%f5, [%r26, %r17]
CHANGE_PRIV106:
	ta	T_CHANGE_PRIV
CHANGE_R26107:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS107:
	.word 0xc4f7c47a  ! 352: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xc89cd03a  ! 354: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xcaacd03a  ! 356: STBA_R	stba	%r5, [%r19 + %r26] 0x81
	.word 0xc89c903a  ! 358: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xcaccd03a  ! 360: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xca84d03a  ! 362: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
NC_NUC108:
	.word 0xcadd419a  ! 364: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r5
CHANGE_R26109:
	mov	%g0,	%r26
CP_BIS_SEC109:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 366: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CP_PST_PRI110:
	.word 0xcbbad99a  ! 368: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xc89c903a  ! 370: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xcac4d03a  ! 372: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xcadc903a  ! 374: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
CHANGE_USER111:
	ta	T_CHANGE_NONPRIV
CHANGE_R26112:
	add	%r26,	%r27,	%r26
NC_BIS_PRI112:
	.word 0xd0a41c5a  ! 376: STWA_R	stwa	%r8, [%r16 + %r26] 0xe2
WR_LEASI_113:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_114:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xca8b911a  ! 379: LDUBA_R	lduba	[%r14, %r26] 0x88, %r5
	.word 0xca94d03a  ! 381: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xcb3b401a  ! 382: STDF_R	std	%f5, [%r26, %r13]
CHANGE_PRIV115:
	ta	T_CHANGE_PRIV
CHANGE_R26116:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP116:
	.word 0xc4f6445a  ! 384: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
BLK_PRI117:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 386: LDDFA_R	ldda	[%r10, %r26], %f16
CP_PST_PRI118:
	.word 0xcbbb599a  ! 388: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xca6b001a  ! 389: LDSTUB_R	ldstub	%r5, [%r12 + %r26]
	.word 0xca84d03a  ! 391: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
CHANGE_USER119:
	ta	T_CHANGE_NONPRIV
CHANGE_R26120:
	add	%r26,	%r27,	%r26
CP_BIS_PRI120:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 393: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
NC_BIS_SEC121:
	.word 0xd0a4dd7a  ! 395: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP123:
	.word 0xca86031a  ! 397: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r5
NC_BIS_AIUS124:
	.word 0xccb7c47a  ! 399: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xcaa3d01a  ! 401: STWA_R	stwa	%r5, [%r15 + %r26] 0x80
NC_BLK_SEc125:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 403: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcb82905a  ! 404: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcacc101a  ! 406: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r5
NC_SHORT_FP_SEC126:
	.word 0xcb9cdb7a  ! 408: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcbe3201a  ! 409: CASA_R	casa	[%r12] %asi, %r26, %r5
	.word 0xca8c913a  ! 411: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
CHANGE_USER127:
	ta	T_CHANGE_NONPRIV
CHANGE_R26128:
	add	%r26,	%r27,	%r26
NC_BIS_PRI128:
	.word 0xd0f41c5a  ! 413: STXA_R	stxa	%r8, [%r16 + %r26] 0xe2
SHORT_FP_PRI129:
	.word 0xcb9b1a1a  ! 415: LDDFA_R	ldda	[%r12, %r26], %f5
CHANGE_PRIV130:
	ta	T_CHANGE_PRIV
CHANGE_R26131:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS131:
	.word 0xccb7c57a  ! 417: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
CP_BIS_QUAD_LD132:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 419: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xcad4903a  ! 421: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcaf3511a  ! 422: STXA_R	stxa	%r5, [%r13 + %r26] 0x88
CP_NUC133:
	.word 0xcac5009a  ! 424: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xcb83511a  ! 425: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xca32801a  ! 426: STH_R	sth	%r5, [%r10 + %r26]
SHORT_FP_PRI134:
	.word 0xcb9ada5a  ! 428: LDDFA_R	ldda	[%r11, %r26], %f5
CP_BIS_NUC135:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 430: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
	.word 0xc8bcd13a  ! 432: STDA_R	stda	%r4, [%r19 + %r26] 0x89
	.word 0xcac3911a  ! 434: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r5
	.word 0xcba4d03a  ! 436: STFA_R	sta	%f5, [%r26, %r19]
CHANGE_USER136:
	ta	T_CHANGE_NONPRIV
CHANGE_R26137:
	add	%r26,	%r27,	%r26
CP_BIS_PRI137:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9d5a  ! 438: STBA_R	stba	%r2, [%r10 + %r26] 0xea
	.word 0xcb84913a  ! 440: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xcadc903a  ! 442: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xcba4501a  ! 444: STFA_R	sta	%f5, [%r26, %r17]
	.word 0xcac4501a  ! 446: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
	.word 0xcacc101a  ! 448: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r5
	.word 0xca93901a  ! 450: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
	.word 0xcb1a801a  ! 451: LDDF_R	ldd	[%r10, %r26], %f5
	.word 0xca94903a  ! 453: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP139:
	.word 0xcace021a  ! 455: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r5
WR_LEASI_140:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_141:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xca8c913a  ! 458: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
CP_AIUS142:
	.word 0xc8bf833a  ! 460: STDA_R	stda	%r4, [%r30 + %r26] 0x19
CHANGE_USER143:
	ta	T_CHANGE_NONPRIV
CHANGE_R26144:
	add	%r26,	%r27,	%r26
NC_BIS_PRI144:
	.word 0xc4ab9c5a  ! 462: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
	.word 0xcad4913a  ! 464: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xca2a801a  ! 465: STB_R	stb	%r5, [%r10 + %r26]
	.word 0xcac4d03a  ! 467: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xca7b2038  ! 468: SWAP_I	swap	%r5, [%r12 + 0x0038]
NC_BLK_SEc145:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 470: STDFA_R	stda	%f16, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC147:
	.word 0xcadd409a  ! 472: LDXA_R	ldxa	[%r21, %r26] 0x04, %r5
	.word 0xcab3111a  ! 473: STHA_R	stha	%r5, [%r12 + %r26] 0x88
	.word 0xcadc903a  ! 475: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xcad4d13a  ! 477: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
CP_NUC148:
	.word 0xcadd019a  ! 479: LDXA_R	ldxa	[%r20, %r26] 0x0c, %r5
CP_BIS_AIUP149:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 481: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
WR_LEASI_150:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_151:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcac3901a  ! 484: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
	.word 0xcadcd03a  ! 486: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
NC_AIUP152:
	.word 0xcbbe431a  ! 488: STDFA_R	stda	%f5, [%r26, %r25]
NC_BIS_AIUS153:
	.word 0xd0bfc47a  ! 490: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xcaf3501a  ! 491: STXA_R	stxa	%r5, [%r13 + %r26] 0x80
CHANGE_R26154:
	add	%r26,	%r27,	%r26
CP_BIS_SEC154:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 493: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
	.word 0xca83901a  ! 495: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r5
	.word 0xc81aa038  ! 496: LDD_I	ldd	[%r10 + 0x0038], %r4
CP_AIUS155:
	.word 0xcacf823a  ! 498: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r5
	.word 0xcab2901a  ! 499: STHA_R	stha	%r5, [%r10 + %r26] 0x80
	.word 0xcba4d03a  ! 501: STFA_R	sta	%f5, [%r26, %r19]
CP_PST_PRI156:
	.word 0xcbbb189a  ! 503: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcacc501a  ! 505: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r5
CHANGE_USER157:
	ta	T_CHANGE_NONPRIV
CHANGE_R26158:
	add	%r26,	%r27,	%r26
CP_BIS_PRI158:
	and	%r26,	%r28,	%r26
	.word 0xd0bb5c5a  ! 507: STDA_R	stda	%r8, [%r13 + %r26] 0xe2
CHANGE_PRIV159:
	ta	T_CHANGE_PRIV
CHANGE_R26160:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP160:
	.word 0xc4be445a  ! 509: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xcacc903a  ! 511: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
CP_BIS_AIUP161:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 513: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xcb1b001a  ! 514: LDDF_R	ldd	[%r12, %r26], %f5
NC_BIS_AIUP162:
	.word 0xc4b6445a  ! 516: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xc89b911a  ! 518: LDDA_R	ldda	[%r14, %r26] 0x88, %r4
	.word 0xcb9b501a  ! 519: LDDFA_R	ldda	[%r13, %r26], %f5
CP_NUC163:
	.word 0xca85009a  ! 521: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r5
CP_BIS_NUC164:
	and	%r26,	%r28,	%r26
	.word 0xc8f504fa  ! 523: STXA_R	stxa	%r4, [%r20 + %r26] 0x27
	.word 0xcacc903a  ! 525: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
NC_NUC165:
	.word 0xc8bd409a  ! 527: STDA_R	stda	%r4, [%r21 + %r26] 0x04
	.word 0xcb83105a  ! 528: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xcaa4d03a  ! 530: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xca93901a  ! 532: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
	.word 0xca8cd03a  ! 534: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xca6b001a  ! 535: LDSTUB_R	ldstub	%r5, [%r12 + %r26]
CP_BIS_NUC166:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 537: STBA_R	stba	%r4, [%r20 + %r26] 0x27
	.word 0xcab4d03a  ! 539: STHA_R	stha	%r5, [%r19 + %r26] 0x81
CHANGE_TLE167:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC169:
	.word 0xcb9d409a  ! 542: LDDFA_R	ldda	[%r21, %r26], %f5
NC_BIS_AIUP170:
	.word 0xc4be445a  ! 544: STDA_R	stda	%r2, [%r25 + %r26] 0x22
CP_BIS_AIUP171:
	and	%r26,	%r28,	%r26
	.word 0xc8f6055a  ! 546: STXA_R	stxa	%r4, [%r24 + %r26] 0x2a
	.word 0xcbe2e01a  ! 547: CASA_R	casa	[%r11] %asi, %r26, %r5
NC_NUC172:
	.word 0xcab5409a  ! 549: STHA_R	stha	%r5, [%r21 + %r26] 0x04
CP_ATM_QUAD_LD173:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 551: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
	.word 0xcadb111a  ! 552: LDXA_R	ldxa	[%r12, %r26] 0x88, %r5
CP_AIUP174:
	.word 0xcbbe021a  ! 554: STDFA_R	stda	%f5, [%r26, %r24]
CHANGE_R26175:
	add	%r26,	%r27,	%r26
CP_BIS_SEC175:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 556: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
	.word 0xcac4511a  ! 558: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r5
NC_BIS_SEC176:
	.word 0xc8acdd7a  ! 560: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
NC_BIS_AIUS177:
	.word 0xc4bfc47a  ! 562: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xcb9cd03a  ! 564: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_USER178:
	ta	T_CHANGE_NONPRIV
CHANGE_R26179:
	mov	%g0,	%r26
CP_BIS_PRI179:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dd5a  ! 566: STXA_R	stxa	%r2, [%r11 + %r26] 0xea
	.word 0xcaa3901a  ! 568: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP181:
	.word 0xcb86021a  ! 570: LDFA_R	lda	[%r24, %r26], %f5
	.word 0xcba4101a  ! 572: STFA_R	sta	%f5, [%r26, %r16]
	.word 0xca7aa038  ! 573: SWAP_I	swap	%r5, [%r10 + 0x0038]
	.word 0xcad4d03a  ! 575: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xc81aa038  ! 576: LDD_I	ldd	[%r10 + 0x0038], %r4
CP_BIS_AIUS182:
	and	%r26,	%r28,	%r26
	.word 0xc89f857a  ! 578: LDDA_R	ldda	[%r30, %r26] 0x2b, %r4
	.word 0xcadcd03a  ! 580: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CHANGE_R26183:
	add	%r26,	%r27,	%r26
CP_BIS_SEC183:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 582: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
NC_BIS_AIUS184:
	.word 0xd0afc57a  ! 584: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
NC_NUC185:
	.word 0xca8d409a  ! 586: LDUBA_R	lduba	[%r21, %r26] 0x04, %r5
NC_BIS_AIUS186:
	.word 0xc4afc47a  ! 588: STBA_R	stba	%r2, [%r31 + %r26] 0x23
SHORT_FP_PRI187:
	.word 0xcb9b1a1a  ! 590: LDDFA_R	ldda	[%r12, %r26], %f5
CHANGE_USER188:
	ta	T_CHANGE_NONPRIV
CHANGE_R26189:
	add	%r26,	%r27,	%r26
NC_BIS_PRI189:
	.word 0xc8a45c5a  ! 592: STWA_R	stwa	%r4, [%r17 + %r26] 0xe2
	.word 0xc8bc903a  ! 594: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CP_PST_PRI190:
	.word 0xcbba995a  ! 596: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca93901a  ! 598: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
NC_PST_PRI191:
	.word 0xcbbb995a  ! 600: STDFA_R	stda	%f5, [%r26, %r14]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS193:
	.word 0xcadf823a  ! 602: LDXA_R	ldxa	[%r30, %r26] 0x11, %r5
	.word 0xcb3a801a  ! 603: STDF_R	std	%f5, [%r26, %r10]
	.word 0xcb84903a  ! 605: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xcb9a905a  ! 606: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaf3101a  ! 607: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
	.word 0xcb82901a  ! 608: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcadb501a  ! 609: LDXA_R	ldxa	[%r13, %r26] 0x80, %r5
	.word 0xcb22c01a  ! 610: STF_R	st	%f5, [%r26, %r11]
CHANGE_R26194:
	add	%r26,	%r27,	%r26
CP_BIS_SEC194:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 612: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
	.word 0xca84d03a  ! 614: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xc83b401a  ! 615: STD_R	std	%r4, [%r13 + %r26]
CP_PST_PRI195:
	.word 0xcbbad99a  ! 617: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaacd03a  ! 619: STBA_R	stba	%r5, [%r19 + %r26] 0x81
CHANGE_R26196:
	add	%r26,	%r27,	%r26
CP_BIS_SEC196:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 621: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
CP_BIS_AIUP197:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 623: STBA_R	stba	%r2, [%r24 + %r26] 0x22
CP_AIUS198:
	.word 0xcaaf823a  ! 625: STBA_R	stba	%r5, [%r30 + %r26] 0x11
	.word 0xca7aa038  ! 626: SWAP_I	swap	%r5, [%r10 + 0x0038]
CP_PST_PRI199:
	.word 0xcbbb589a  ! 628: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcba3511a  ! 629: STFA_R	sta	%f5, [%r26, %r13]
	.word 0xca84d13a  ! 631: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
NC_NUC200:
	.word 0xcb85409a  ! 633: LDFA_R	lda	[%r21, %r26], %f5
CHANGE_USER201:
	ta	T_CHANGE_NONPRIV
CHANGE_R26202:
	add	%r26,	%r27,	%r26
NC_BIS_PRI202:
	.word 0xccb39c5a  ! 635: STHA_R	stha	%r6, [%r14 + %r26] 0xe2
	.word 0xcad4903a  ! 637: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcad4d03a  ! 639: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
CHANGE_R26203:
	mov	%g0,	%r26
CP_BIS_SEC203:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 641: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
	.word 0xcacc913a  ! 643: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS205:
	.word 0xcacfc23a  ! 645: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r5
NC_SHORT_FP_SEC206:
	.word 0xcb9cda3a  ! 647: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcb1b001a  ! 648: LDDF_R	ldd	[%r12, %r26], %f5
	.word 0xcb1b2038  ! 649: LDDF_I	ldd	[%r12, 0x0038], %f5
	.word 0xca7b2038  ! 650: SWAP_I	swap	%r5, [%r12 + 0x0038]
SET_TL1_207:
	ta	T_CHANGE_TO_TL1
CHANGE_R26208:
	add	%r26,	%r27,	%r26
NC_BIS_NUC208:
	.word 0xc4f544fa  ! 652: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_BLK_SEc209:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 654: LDDFA_R	ldda	[%r19, %r26], %f16
SET_TL0_210:
	ta	T_CHANGE_TO_TL0
CHANGE_R26211:
	add	%r26,	%r27,	%r26
NC_BIS_SEC211:
	.word 0xc4a4dc7a  ! 656: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
NC_BLK_SEc212:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 658: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_PRIV213:
	ta	T_CHANGE_PRIV
CHANGE_R26214:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP214:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 660: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
NC_AIUS215:
	.word 0xca97c23a  ! 662: LDUHA_R	lduha	[%r31, %r26] 0x11, %r5
	.word 0xca8bd01a  ! 664: LDUBA_R	lduba	[%r15, %r26] 0x80, %r5
NC_BIS_AIUP216:
	.word 0xc4f6445a  ! 666: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_NUC217:
	.word 0xcac5009a  ! 668: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xcb83111a  ! 669: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xcba3501a  ! 670: STFA_R	sta	%f5, [%r26, %r13]
CP_ATM_QUAD_LD218:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 672: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xca92911a  ! 673: LDUHA_R	lduha	[%r10, %r26] 0x88, %r5
BLK_PRI219:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 675: LDDFA_R	ldda	[%r11, %r26], %f16
CP_BIS_AIUP220:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 677: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xcad4903a  ! 679: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
NC_AIUS221:
	.word 0xcab7c23a  ! 681: STHA_R	stha	%r5, [%r31 + %r26] 0x11
CP_PST_PRI222:
	.word 0xcbbad81a  ! 683: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xca83911a  ! 685: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r5
	.word 0xcac2905a  ! 686: LDSWA_R	ldswa	[%r10, %r26] 0x82, %r5
NC_NUC223:
	.word 0xc8bd409a  ! 688: STDA_R	stda	%r4, [%r21 + %r26] 0x04
	.word 0xc8bb911a  ! 690: STDA_R	stda	%r4, [%r14 + %r26] 0x88
	.word 0xcaea901a  ! 691: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x80
CHANGE_USER224:
	ta	T_CHANGE_NONPRIV
CHANGE_R26225:
	add	%r26,	%r27,	%r26
CP_BIS_PRI225:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 693: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xcaa3101a  ! 694: STWA_R	stwa	%r5, [%r12 + %r26] 0x80
	.word 0xcb82901a  ! 695: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xca22e038  ! 696: STW_I	stw	%r5, [%r11 + 0x0038]
NC_BIS_SEC226:
	.word 0xd0a4dc7a  ! 698: STWA_R	stwa	%r8, [%r19 + %r26] 0xe3
	.word 0xcaf4d03a  ! 700: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xc89c903a  ! 702: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xcadc913a  ! 704: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CHANGE_PRIV227:
	ta	T_CHANGE_PRIV
CHANGE_R26228:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD228:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 706: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xca84101a  ! 708: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r5
CP_AIUP229:
	.word 0xca86021a  ! 710: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r5
	.word 0xcad4d03a  ! 712: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xcaea901a  ! 713: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x80
	.word 0xcacbd11a  ! 715: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r5
NC_BIS_SEC230:
	.word 0xc4f4dc7a  ! 717: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CP_AIUP231:
	.word 0xcba6031a  ! 719: STFA_R	sta	%f5, [%r26, %r24]
	.word 0xca8c511a  ! 721: LDUBA_R	lduba	[%r17, %r26] 0x88, %r5
NC_BIS_AIUP232:
	.word 0xcca6445a  ! 723: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xcb9c903a  ! 725: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcadc511a  ! 727: LDXA_R	ldxa	[%r17, %r26] 0x88, %r5
NC_AIUS233:
	.word 0xcbbfc33a  ! 729: STDFA_R	stda	%f5, [%r26, %r31]
CHANGE_CLE234:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc8bc903a  ! 732: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CP_PST_PRI235:
	.word 0xcbbad95a  ! 734: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaccd03a  ! 736: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS237:
	.word 0xc8bfc23a  ! 738: STDA_R	stda	%r4, [%r31 + %r26] 0x11
	.word 0xca83d01a  ! 740: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r5
	.word 0xcbe2e01a  ! 741: CASA_R	casa	[%r11] %asi, %r26, %r5
	.word 0xcb84903a  ! 743: LDFA_R	lda	[%r18, %r26], %f5
CP_ATM_QUAD_LD238:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 745: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
CHANGE_CLE239:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_CLE240:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcad2d01a  ! 748: LDSHA_R	ldsha	[%r11, %r26] 0x80, %r5
	.word 0xc83b401a  ! 749: STD_R	std	%r4, [%r13 + %r26]
CHANGE_R26241:
	mov	%g0,	%r26
CP_BIS_SEC241:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 751: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
	.word 0xca6a801a  ! 752: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xca02a038  ! 753: LDUW_I	lduw	[%r10 + 0x0038], %r5
	.word 0xca83d01a  ! 755: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP243:
	.word 0xcb86021a  ! 757: LDFA_R	lda	[%r24, %r26], %f5
	.word 0xca8c511a  ! 759: LDUBA_R	lduba	[%r17, %r26] 0x88, %r5
	.word 0xcb83d01a  ! 761: LDFA_R	lda	[%r15, %r26], %f5
	.word 0xcb9ad15a  ! 762: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcaf4903a  ! 764: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcadc913a  ! 766: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
	.word 0xcadc913a  ! 768: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CHANGE_USER244:
	ta	T_CHANGE_NONPRIV
CHANGE_R26245:
	add	%r26,	%r27,	%r26
NC_BIS_PRI245:
	.word 0xc4b41d5a  ! 770: STHA_R	stha	%r2, [%r16 + %r26] 0xea
	.word 0xca7b2038  ! 771: SWAP_I	swap	%r5, [%r12 + 0x0038]
BLK_PRI246:
	and	%r26,	%r29,	%r26
	.word 0xe19b1f1a  ! 773: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc89cd03a  ! 775: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
CHANGE_PRIV247:
	ta	T_CHANGE_PRIV
CHANGE_R26248:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS248:
	.word 0xc4bfc47a  ! 777: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xcafad01a  ! 778: SWAPA_R	swapa	%r5, [%r11 + %r26] 0x80
	.word 0xca5a801a  ! 779: LDX_R	ldx	[%r10 + %r26], %r5
	.word 0xc89b901a  ! 781: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
	.word 0xcaf4903a  ! 783: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
NC_NUC249:
	.word 0xc89d419a  ! 785: LDDA_R	ldda	[%r21, %r26] 0x0c, %r4
	.word 0xcac3911a  ! 787: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r5
CP_AIUP250:
	.word 0xcad6031a  ! 789: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r5
	.word 0xcbf2a01a  ! 790: CASXA_R	casxa	[%r10]%asi, %r26, %r5
SET_TL1_251:
	ta	T_CHANGE_TO_TL1
CHANGE_R26252:
	add	%r26,	%r27,	%r26
NC_BIS_NUC252:
	.word 0xccb545fa  ! 792: STHA_R	stha	%r6, [%r21 + %r26] 0x2f
	.word 0xcadcd13a  ! 794: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUS253:
	.word 0xc4f7c47a  ! 796: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xcb1b001a  ! 797: LDDF_R	ldd	[%r12, %r26], %f5
CHANGE_R26254:
	add	%r26,	%r27,	%r26
CP_BIS_SEC254:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 799: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
NC_AIUS255:
	.word 0xca8fc23a  ! 801: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcbba901a  ! 802: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcbbb501a  ! 803: STDFA_R	stda	%f5, [%r26, %r13]
NC_BLK_SEc256:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 805: LDDFA_R	ldda	[%r19, %r26], %f0
NC_AIUP257:
	.word 0xcac6421a  ! 807: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r5
	.word 0xca7ae038  ! 808: SWAP_I	swap	%r5, [%r11 + 0x0038]
	.word 0xcaf4913a  ! 810: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
NC_NUC258:
	.word 0xc8bd409a  ! 812: STDA_R	stda	%r4, [%r21 + %r26] 0x04
	.word 0xcbbcd13a  ! 814: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xc8bb901a  ! 816: STDA_R	stda	%r4, [%r14 + %r26] 0x80
	.word 0xcb9a901a  ! 817: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcbbad11a  ! 818: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcbbb111a  ! 820: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcaa4913a  ! 822: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
CP_BIS_NUC259:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 824: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
	.word 0xcb22c01a  ! 825: STF_R	st	%f5, [%r26, %r11]
NC_PST_PRI260:
	.word 0xcbbb991a  ! 827: STDFA_R	stda	%f5, [%r26, %r14]
CHANGE_R26261:
	add	%r26,	%r27,	%r26
CP_BIS_SEC261:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 829: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
SHORT_FP_PRI262:
	.word 0xcbba9a1a  ! 831: STDFA_R	stda	%f5, [%r26, %r10]
NC_BLK_SEc263:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 833: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xca7ae038  ! 834: SWAP_I	swap	%r5, [%r11 + 0x0038]
	.word 0xca8b901a  ! 836: LDUBA_R	lduba	[%r14, %r26] 0x80, %r5
	.word 0xcaab901a  ! 838: STBA_R	stba	%r5, [%r14 + %r26] 0x80
	.word 0xcaac903a  ! 840: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xcb9b105a  ! 841: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcaf3101a  ! 842: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
CP_ATM_QUAD_LD264:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 844: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
	.word 0xcacc511a  ! 846: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r5
	.word 0xca94913a  ! 848: LDUHA_R	lduha	[%r18, %r26] 0x89, %r5
CP_BIS_QUAD_LD265:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 850: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
NC_PST_PRI266:
	.word 0xcbbb981a  ! 852: STDFA_R	stda	%f5, [%r26, %r14]
BLK_PRI267:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 854: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xca84d03a  ! 856: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xc89a905a  ! 857: LDDA_R	ldda	[%r10, %r26] 0x82, %r4
	.word 0xcba4101a  ! 859: STFA_R	sta	%f5, [%r26, %r16]
CHANGE_R26268:
	add	%r26,	%r27,	%r26
CP_BIS_SEC268:
	and	%r26,	%r28,	%r26
	.word 0xc8f49c7a  ! 861: STXA_R	stxa	%r4, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD269:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 863: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CP_AIUS270:
	.word 0xcab7823a  ! 865: STHA_R	stha	%r5, [%r30 + %r26] 0x11
	.word 0xcaa4111a  ! 867: STWA_R	stwa	%r5, [%r16 + %r26] 0x88
NC_BIS_NUC271:
	.word 0xc4bd45fa  ! 869: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
NC_BIS_AIUP272:
	.word 0xd0ae445a  ! 871: STBA_R	stba	%r8, [%r25 + %r26] 0x22
NC_BIS_AIUP273:
	.word 0xd0f6445a  ! 873: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
CP_ATM_QUAD_LD274:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 875: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
CP_NUC275:
	.word 0xcaf5009a  ! 877: STXA_R	stxa	%r5, [%r20 + %r26] 0x04
CP_BIS_NUC276:
	and	%r26,	%r28,	%r26
	.word 0xc8f504fa  ! 879: STXA_R	stxa	%r4, [%r20 + %r26] 0x27
	.word 0xca84511a  ! 881: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r5
	.word 0xcaccd13a  ! 883: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
	.word 0xcab4d03a  ! 885: STHA_R	stha	%r5, [%r19 + %r26] 0x81
	.word 0xca8cd13a  ! 887: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcb9b105a  ! 888: LDDFA_R	ldda	[%r12, %r26], %f5
CP_BIS_AIUP277:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 890: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
	.word 0xcb03001a  ! 891: LDF_R	ld	[%r12, %r26], %f5
	.word 0xcb22a038  ! 892: STF_I	st	%f5, [0x0038, %r10]
NC_BLK_SEc278:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 894: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcba3501a  ! 895: STFA_R	sta	%f5, [%r26, %r13]
	.word 0xcb83d11a  ! 897: LDFA_R	lda	[%r15, %r26], %f5
BLK_PRI279:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1e1a  ! 899: STDFA_R	stda	%f16, [%r26, %r12]
	.word 0xcaab511a  ! 900: STBA_R	stba	%r5, [%r13 + %r26] 0x88
CP_PST_PRI280:
	.word 0xcbbad85a  ! 902: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcbbcd03a  ! 904: STDFA_R	stda	%f5, [%r26, %r19]
CP_BIS_QUAD_LD281:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 906: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_NUC282:
	.word 0xccb544fa  ! 908: STHA_R	stha	%r6, [%r21 + %r26] 0x27
NC_NUC283:
	.word 0xca8d409a  ! 910: LDUBA_R	lduba	[%r21, %r26] 0x04, %r5
NC_SHORT_FP_SEC284:
	.word 0xcbbcda3a  ! 912: STDFA_R	stda	%f5, [%r26, %r19]
CP_BIS_QUAD_LD285:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 914: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
NC_AIUS286:
	.word 0xca8fc23a  ! 916: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcb83d11a  ! 918: LDFA_R	lda	[%r15, %r26], %f5
	.word 0xcaa3911a  ! 920: STWA_R	stwa	%r5, [%r14 + %r26] 0x88
	.word 0xca94903a  ! 922: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
NC_PST_PRI287:
	.word 0xcbbbd95a  ! 924: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcba2901a  ! 925: STFA_R	sta	%f5, [%r26, %r10]
NC_AIUP288:
	.word 0xcb9e431a  ! 927: LDDFA_R	ldda	[%r25, %r26], %f5
SET_TL0_289:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI290:
	.word 0xd0bb9c5a  ! 929: STDA_R	stda	%r8, [%r14 + %r26] 0xe2
	.word 0xcbba901a  ! 930: STDFA_R	stda	%f5, [%r26, %r10]
SET_TL1_291:
	ta	T_CHANGE_TO_TL1
CHANGE_R26292:
	mov	%g0,	%r26
NC_BIS_NUC292:
	.word 0xc8a544fa  ! 932: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xcab3101a  ! 933: STHA_R	stha	%r5, [%r12 + %r26] 0x80
NC_BIS_NUC293:
	.word 0xc4b544fa  ! 935: STHA_R	stha	%r2, [%r21 + %r26] 0x27
SET_TL0_294:
	ta	T_CHANGE_TO_TL0
CHANGE_R26295:
	add	%r26,	%r27,	%r26
NC_BIS_SEC295:
	.word 0xccb4dd7a  ! 937: STHA_R	stha	%r6, [%r19 + %r26] 0xeb
	.word 0xc89bd01a  ! 939: LDDA_R	ldda	[%r15, %r26] 0x80, %r4
	.word 0xca2aa03b  ! 940: STB_I	stb	%r5, [%r10 + 0x003b]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS297:
	.word 0xcba7823a  ! 942: STFA_R	sta	%f5, [%r26, %r30]
CHANGE_TLE298:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS300:
	.word 0xcbbf823a  ! 945: STDFA_R	stda	%f5, [%r26, %r30]
CP_NUC301:
	.word 0xc8bd019a  ! 947: STDA_R	stda	%r4, [%r20 + %r26] 0x0c
NC_AIUS302:
	.word 0xcab7c23a  ! 949: STHA_R	stha	%r5, [%r31 + %r26] 0x11
	.word 0xcad4d03a  ! 951: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
CHANGE_USER303:
	ta	T_CHANGE_NONPRIV
CHANGE_R26304:
	add	%r26,	%r27,	%r26
NC_BIS_PRI304:
	.word 0xccf39c5a  ! 953: STXA_R	stxa	%r6, [%r14 + %r26] 0xe2
	.word 0xcac4501a  ! 955: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
	.word 0xcb9cd03a  ! 957: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca93505a  ! 958: LDUHA_R	lduha	[%r13, %r26] 0x82, %r5
CHANGE_CLE305:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xca52a03a  ! 960: LDSH_I	ldsh	[%r10 + 0x003a], %r5
NC_BLK_SEc306:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 962: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcb9c913a  ! 964: LDDFA_R	ldda	[%r18, %r26], %f5
CHANGE_PRIV307:
	ta	T_CHANGE_PRIV
CHANGE_R26308:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP308:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 966: STDA_R	stda	%r4, [%r24 + %r26] 0x22
	.word 0xcb84d13a  ! 968: LDFA_R	lda	[%r19, %r26], %f5
CHANGE_TLE309:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_R26310:
	add	%r26,	%r27,	%r26
CP_BIS_SEC310:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 971: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_PST_PRI311:
	.word 0xcbba981a  ! 973: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca84501a  ! 975: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r5
NC_BLK_SEc312:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 977: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_PRIV313:
	ta	T_CHANGE_PRIV
CHANGE_R26314:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS314:
	and	%r26,	%r28,	%r26
	.word 0xccbf857a  ! 979: STDA_R	stda	%r6, [%r30 + %r26] 0x2b
CHANGE_R26315:
	mov	%g0,	%r26
CP_BIS_SEC315:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 981: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
	.word 0xca8cd13a  ! 983: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcbe2a01a  ! 984: CASA_R	casa	[%r10] %asi, %r26, %r5
	.word 0xcad4d13a  ! 986: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
	.word 0xca93911a  ! 988: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
	.word 0xcba2d01a  ! 989: STFA_R	sta	%f5, [%r26, %r11]
	.word 0xc8bc903a  ! 991: STDA_R	stda	%r4, [%r18 + %r26] 0x81
NC_BLK_SEc316:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 993: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xca93901a  ! 995: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
	.word 0xcaccd03a  ! 997: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcaaa901a  ! 998: STBA_R	stba	%r5, [%r10 + %r26] 0x80
CP_BIS_NUC317:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 1000: STDA_R	stda	%r2, [%r20 + %r26] 0x27
CP_BIS_NUC318:
	and	%r26,	%r28,	%r26
	.word 0xd0bd05fa  ! 1002: STDA_R	stda	%r8, [%r20 + %r26] 0x2f
	.word 0xc8bbd11a  ! 1004: STDA_R	stda	%r4, [%r15 + %r26] 0x88
	.word 0xca8cd03a  ! 1006: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xcb03401a  ! 1007: LDF_R	ld	[%r13, %r26], %f5
	.word 0xcb9a911a  ! 1008: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaf4d03a  ! 1010: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xcaacd03a  ! 1012: STBA_R	stba	%r5, [%r19 + %r26] 0x81
NC_NUC319:
	.word 0xcb85419a  ! 1014: LDFA_R	lda	[%r21, %r26], %f5
NC_AIUS320:
	.word 0xcb87c23a  ! 1016: LDFA_R	lda	[%r31, %r26], %f5
	.word 0xc83a801a  ! 1017: STD_R	std	%r4, [%r10 + %r26]
	.word 0xcaa4903a  ! 1019: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcb9cd03a  ! 1021: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_R26321:
	add	%r26,	%r27,	%r26
CP_BIS_SEC321:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1023: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
NC_PST_PRI322:
	.word 0xcbbb995a  ! 1025: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcad3d01a  ! 1027: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r5
	.word 0xc81aa038  ! 1028: LDD_I	ldd	[%r10 + 0x0038], %r4
	.word 0xcac4501a  ! 1030: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
	.word 0xcac3901a  ! 1032: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
NC_AIUS323:
	.word 0xcab7c23a  ! 1034: STHA_R	stha	%r5, [%r31 + %r26] 0x11
	.word 0xcad4913a  ! 1036: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
CHANGE_R26324:
	add	%r26,	%r27,	%r26
CP_BIS_SEC324:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1038: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
NC_PST_PRI325:
	.word 0xcbbb989a  ! 1040: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcb1a801a  ! 1041: LDDF_R	ldd	[%r10, %r26], %f5
NC_BIS_SEC326:
	.word 0xc8acdc7a  ! 1043: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
NC_AIUP327:
	.word 0xcb9e431a  ! 1045: LDDFA_R	ldda	[%r25, %r26], %f5
	.word 0xca0ac01a  ! 1046: LDUB_R	ldub	[%r11 + %r26], %r5
NC_AIUS328:
	.word 0xcad7c33a  ! 1048: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r5
	.word 0xcb9a901a  ! 1049: LDDFA_R	ldda	[%r10, %r26], %f5
CP_ATM_QUAD_LD329:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 1051: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
NC_BIS_AIUS330:
	.word 0xc4bfc47a  ! 1053: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xcbbc511a  ! 1055: STDFA_R	stda	%f5, [%r26, %r17]
WR_LEASI_331:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_332:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_USER333:
	ta	T_CHANGE_NONPRIV
CHANGE_R26334:
	add	%r26,	%r27,	%r26
CP_BIS_PRI334:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 1058: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
CHANGE_R26335:
	add	%r26,	%r27,	%r26
CP_BIS_SEC335:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 1060: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xcb9c903a  ! 1062: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xca7b401a  ! 1063: SWAP_R	swap	%r5, [%r13 + %r26]
	.word 0xeb6b801a  ! 1065: PREFETCH_R	prefetch	[%r14 + %r26], #21
NC_PST_PRI336:
	.word 0xcbbc189a  ! 1067: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcb9b911a  ! 1069: LDDFA_R	ldda	[%r14, %r26], %f5
	.word 0xcb3b401a  ! 1070: STDF_R	std	%f5, [%r26, %r13]
	.word 0xcb82d01a  ! 1071: LDFA_R	lda	[%r11, %r26], %f5
	.word 0xca94903a  ! 1073: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xca6a801a  ! 1074: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
CHANGE_R26337:
	add	%r26,	%r27,	%r26
CP_BIS_SEC337:
	and	%r26,	%r28,	%r26
	.word 0xc8f49c7a  ! 1076: STXA_R	stxa	%r4, [%r18 + %r26] 0xe3
CHANGE_PRIV338:
	ta	T_CHANGE_PRIV
CHANGE_R26339:
	add	%r26,	%r27,	%r26
CP_BIS_NUC339:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1078: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xcab3901a  ! 1080: STHA_R	stha	%r5, [%r14 + %r26] 0x80
	.word 0xcb9c913a  ! 1082: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcaa4d03a  ! 1084: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xcadc111a  ! 1086: LDXA_R	ldxa	[%r16, %r26] 0x88, %r5
CP_NUC340:
	.word 0xca85009a  ! 1088: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r5
	.word 0xca8b101a  ! 1089: LDUBA_R	lduba	[%r12, %r26] 0x80, %r5
CP_AIUS341:
	.word 0xcab7833a  ! 1091: STHA_R	stha	%r5, [%r30 + %r26] 0x19
	.word 0xcaf4d03a  ! 1093: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xcadc913a  ! 1095: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CP_AIUP342:
	.word 0xca86031a  ! 1097: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r5
WR_LEASI_343:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_344:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcac3115a  ! 1099: LDSWA_R	ldswa	[%r12, %r26] 0x8a, %r5
	.word 0xca84d03a  ! 1101: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
NC_BIS_AIUP345:
	.word 0xc4be455a  ! 1103: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
NC_AIUS346:
	.word 0xcacfc33a  ! 1105: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r5
SET_TL1_347:
	ta	T_CHANGE_TO_TL1
CHANGE_R26348:
	add	%r26,	%r27,	%r26
NC_BIS_NUC348:
	.word 0xccf544fa  ! 1107: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
SET_TL0_349:
	ta	T_CHANGE_TO_TL0
CHANGE_R26350:
	mov	%g0,	%r26
NC_BIS_SEC350:
	.word 0xc4acdd7a  ! 1109: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
CP_BIS_QUAD_LD351:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 1111: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xcac2d15a  ! 1112: LDSWA_R	ldswa	[%r11, %r26] 0x8a, %r5
CHANGE_R26352:
	add	%r26,	%r27,	%r26
CP_BIS_SEC352:
	and	%r26,	%r28,	%r26
	.word 0xc8f49c7a  ! 1114: STXA_R	stxa	%r4, [%r18 + %r26] 0xe3
	.word 0xcad3911a  ! 1116: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r5
	.word 0xca42a038  ! 1117: LDSW_I	ldsw	[%r10 + 0x0038], %r5
CP_BIS_QUAD_LD353:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 1119: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	.word 0xcadc903a  ! 1121: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
WR_LEASI_354:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_355:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcad4903a  ! 1124: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcacb901a  ! 1126: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r5
	.word 0xcb84903a  ! 1128: LDFA_R	lda	[%r18, %r26], %f5
NC_BIS_PRI356:
	.word 0xc4ab9c5a  ! 1130: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
CHANGE_PRIV357:
	ta	T_CHANGE_PRIV
CHANGE_R26358:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP358:
	.word 0xccae445a  ! 1132: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xcab4903a  ! 1134: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xcb23001a  ! 1135: STF_R	st	%f5, [%r26, %r12]
	.word 0xca94903a  ! 1137: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
CHANGE_CLE359:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_CLE360:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcbbc501a  ! 1141: STDFA_R	stda	%f5, [%r26, %r17]
CHANGE_PRIV361:
	ta	T_CHANGE_PRIV
CHANGE_R26362:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP362:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 1143: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xca8bd11a  ! 1145: LDUBA_R	lduba	[%r15, %r26] 0x88, %r5
	.word 0xcb82905a  ! 1146: LDFA_R	lda	[%r10, %r26], %f5
CP_NUC363:
	.word 0xcaa5009a  ! 1148: STWA_R	stwa	%r5, [%r20 + %r26] 0x04
CP_BIS_QUAD_LD364:
	and	%r26,	%r29,	%r26
	.word 0xc89b5d5a  ! 1150: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
	.word 0xcadcd13a  ! 1152: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
	.word 0xca8b901a  ! 1154: LDUBA_R	lduba	[%r14, %r26] 0x80, %r5
NC_BIS_AIUS365:
	.word 0xc8afc57a  ! 1156: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
	.word 0xcbbc903a  ! 1158: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcaac913a  ! 1160: STBA_R	stba	%r5, [%r18 + %r26] 0x89
NC_AIUP366:
	.word 0xcbbe421a  ! 1162: STDFA_R	stda	%f5, [%r26, %r25]
	.word 0xcad4501a  ! 1164: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r5
	.word 0xcb84d03a  ! 1166: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcac4d03a  ! 1168: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
CP_AIUP367:
	.word 0xcaae031a  ! 1170: STBA_R	stba	%r5, [%r24 + %r26] 0x18
CP_BIS_QUAD_LD368:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 1172: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xcbbb901a  ! 1174: STDFA_R	stda	%f5, [%r26, %r14]
CHANGE_USER369:
	ta	T_CHANGE_NONPRIV
CHANGE_R26370:
	add	%r26,	%r27,	%r26
NC_BIS_PRI370:
	.word 0xc8f41c5a  ! 1176: STXA_R	stxa	%r4, [%r16 + %r26] 0xe2
NC_BIS_PRI371:
	.word 0xc8bc5d5a  ! 1178: STDA_R	stda	%r4, [%r17 + %r26] 0xea
CHANGE_PRIV372:
	ta	T_CHANGE_PRIV
CHANGE_R26373:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS373:
	.word 0xc8a7c47a  ! 1180: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
	.word 0xcba2901a  ! 1181: STFA_R	sta	%f5, [%r26, %r10]
CP_BIS_AIUP374:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 1183: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
	.word 0xcaea911a  ! 1184: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x88
NC_NUC375:
	.word 0xcac5409a  ! 1186: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r5
	.word 0xcaf3911a  ! 1188: STXA_R	stxa	%r5, [%r14 + %r26] 0x88
	.word 0xca8a911a  ! 1189: LDUBA_R	lduba	[%r10, %r26] 0x88, %r5
NC_NUC376:
	.word 0xcbbd419a  ! 1191: STDFA_R	stda	%f5, [%r26, %r21]
	.word 0xca84d03a  ! 1193: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xcaac903a  ! 1195: STBA_R	stba	%r5, [%r18 + %r26] 0x81
CP_BIS_AIUS377:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 1197: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
	.word 0xcb1b401a  ! 1198: LDDF_R	ldd	[%r13, %r26], %f5
	.word 0xca84d13a  ! 1200: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
	.word 0xca84d13a  ! 1202: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUP378:
	.word 0xd0b6455a  ! 1204: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
CHANGE_USER379:
	ta	T_CHANGE_NONPRIV
CHANGE_R26380:
	add	%r26,	%r27,	%r26
CP_BIS_PRI380:
	and	%r26,	%r28,	%r26
	.word 0xd09b5c5a  ! 1206: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xcba4913a  ! 1208: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcaeb501a  ! 1209: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x80
CHANGE_PRIV381:
	ta	T_CHANGE_PRIV
CHANGE_R26382:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP382:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1211: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xcb83d01a  ! 1213: LDFA_R	lda	[%r15, %r26], %f5
NC_BLK_SEc383:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1215: STDFA_R	stda	%f0, [%r26, %r19]
BLK_PRI384:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 1217: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xca83501a  ! 1218: LDUWA_R	lduwa	[%r13, %r26] 0x80, %r5
	.word 0xcb1b001a  ! 1219: LDDF_R	ldd	[%r12, %r26], %f5
	.word 0xca84d13a  ! 1221: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUS385:
	.word 0xc8afc57a  ! 1223: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
CP_ATM_QUAD_LD386:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 1225: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
WR_LEASI_387:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_388:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SET_TL1_389:
	ta	T_CHANGE_TO_TL1
CHANGE_R26390:
	mov	%g0,	%r26
NC_BIS_NUC390:
	.word 0xd0f544fa  ! 1228: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
	.word 0xcadc903a  ! 1230: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xc89ad01a  ! 1231: LDDA_R	ldda	[%r11, %r26] 0x80, %r4
NC_BIS_AIUS391:
	.word 0xccb7c47a  ! 1233: STHA_R	stha	%r6, [%r31 + %r26] 0x23
NC_PST_PRI392:
	.word 0xcbbbd85a  ! 1235: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xc89cd03a  ! 1237: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xcb82d01a  ! 1238: LDFA_R	lda	[%r11, %r26], %f5
CP_PST_PRI393:
	.word 0xcbbb189a  ! 1240: STDFA_R	stda	%f5, [%r26, %r12]
NC_PST_PRI394:
	.word 0xcbbc199a  ! 1242: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcb1b2038  ! 1243: LDDF_I	ldd	[%r12, 0x0038], %f5
	.word 0xca73001a  ! 1244: STX_R	stx	%r5, [%r12 + %r26]
	.word 0xcb9c903a  ! 1246: LDDFA_R	ldda	[%r18, %r26], %f5
NC_BIS_NUC395:
	.word 0xccbd44fa  ! 1248: STDA_R	stda	%r6, [%r21 + %r26] 0x27
	.word 0xc8bc903a  ! 1250: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xca93911a  ! 1252: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
	.word 0xcadc903a  ! 1254: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xcaa2911a  ! 1255: STWA_R	stwa	%r5, [%r10 + %r26] 0x88
	.word 0xca8b101a  ! 1256: LDUBA_R	lduba	[%r12, %r26] 0x80, %r5
CP_BIS_AIUP396:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 1258: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
SHORT_FP_PRI397:
	.word 0xcbba9b5a  ! 1260: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xc8bbd01a  ! 1262: STDA_R	stda	%r4, [%r15 + %r26] 0x80
	.word 0xcb3aa038  ! 1263: STDF_I	std	%f5, [0x0038, %r10]
	.word 0xca7ae038  ! 1264: SWAP_I	swap	%r5, [%r11 + 0x0038]
SET_TL0_398:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI399:
	and	%r26,	%r28,	%r26
	.word 0xd09add5a  ! 1266: LDDA_R	ldda	[%r11, %r26] 0xea, %r8
	.word 0xcb03001a  ! 1267: LDF_R	ld	[%r12, %r26], %f5
CHANGE_R26400:
	add	%r26,	%r27,	%r26
CP_BIS_SEC400:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 1269: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xca93911a  ! 1271: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
BLK_PRI401:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1273: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_PRIV402:
	ta	T_CHANGE_PRIV
CHANGE_R26403:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS403:
	and	%r26,	%r28,	%r26
	.word 0xc4af857a  ! 1275: STBA_R	stba	%r2, [%r30 + %r26] 0x2b
CP_NUC404:
	.word 0xcb85009a  ! 1277: LDFA_R	lda	[%r20, %r26], %f5
	.word 0xcba4101a  ! 1279: STFA_R	sta	%f5, [%r26, %r16]
	.word 0xca84d03a  ! 1281: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
NC_NUC405:
	.word 0xcba5419a  ! 1283: STFA_R	sta	%f5, [%r26, %r21]
	.word 0xcb84903a  ! 1285: LDFA_R	lda	[%r18, %r26], %f5
CP_BIS_QUAD_LD406:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1287: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CHANGE_TLE407:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc89c913a  ! 1290: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
SET_TL1_408:
	ta	T_CHANGE_TO_TL1
CHANGE_R26409:
	add	%r26,	%r27,	%r26
NC_BIS_NUC409:
	.word 0xd0ad44fa  ! 1292: STBA_R	stba	%r8, [%r21 + %r26] 0x27
CP_BIS_AIUS410:
	and	%r26,	%r28,	%r26
	.word 0xc89f857a  ! 1294: LDDA_R	ldda	[%r30, %r26] 0x2b, %r4
	.word 0xcba2911a  ! 1295: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcadc913a  ! 1297: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
NC_AIUP411:
	.word 0xcba6431a  ! 1299: STFA_R	sta	%f5, [%r26, %r25]
SET_TL0_412:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI413:
	and	%r26,	%r28,	%r26
	.word 0xc89adc5a  ! 1301: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
	.word 0xcaacd03a  ! 1303: STBA_R	stba	%r5, [%r19 + %r26] 0x81
CHANGE_TLE414:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcab2911a  ! 1305: STHA_R	stha	%r5, [%r10 + %r26] 0x88
	.word 0xcb82d05a  ! 1306: LDFA_R	lda	[%r11, %r26], %f5
CHANGE_PRIV415:
	ta	T_CHANGE_PRIV
CHANGE_R26416:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP416:
	.word 0xcca6445a  ! 1308: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xcaa4903a  ! 1310: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xca94d03a  ! 1312: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
NC_BIS_AIUP417:
	.word 0xd0b6455a  ! 1314: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
NC_SHORT_FP_SEC418:
	.word 0xcb9cda3a  ! 1316: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_R26419:
	add	%r26,	%r27,	%r26
CP_BIS_SEC419:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 1318: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
	.word 0xcb9b901a  ! 1320: LDDFA_R	ldda	[%r14, %r26], %f5
BLK_PRI420:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 1322: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc8bc903a  ! 1324: STDA_R	stda	%r4, [%r18 + %r26] 0x81
WR_LEASI_421:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_422:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP423:
	.word 0xc89e431a  ! 1327: LDDA_R	ldda	[%r25, %r26] 0x18, %r4
NC_PST_PRI424:
	.word 0xcbbbd85a  ! 1329: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcaac511a  ! 1331: STBA_R	stba	%r5, [%r17 + %r26] 0x88
CP_BIS_AIUP425:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1333: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
CP_NUC426:
	.word 0xcaf5009a  ! 1335: STXA_R	stxa	%r5, [%r20 + %r26] 0x04
	.word 0xcb22c01a  ! 1336: STF_R	st	%f5, [%r26, %r11]
	.word 0xca8c913a  ! 1338: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
NC_PST_PRI427:
	.word 0xcbbc191a  ! 1340: STDFA_R	stda	%f5, [%r26, %r16]
CP_BIS_NUC428:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 1342: STHA_R	stha	%r4, [%r20 + %r26] 0x27
	.word 0xcba4913a  ! 1344: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcba3d11a  ! 1346: STFA_R	sta	%f5, [%r26, %r15]
CP_AIUS429:
	.word 0xcab7823a  ! 1348: STHA_R	stha	%r5, [%r30 + %r26] 0x11
NC_AIUP430:
	.word 0xcba6431a  ! 1350: STFA_R	sta	%f5, [%r26, %r25]
NC_BLK_SEc431:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1352: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xcab4511a  ! 1354: STHA_R	stha	%r5, [%r17 + %r26] 0x88
	.word 0xcb9a901a  ! 1355: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcac4d13a  ! 1357: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
CP_AIUS432:
	.word 0xcaa7823a  ! 1359: STWA_R	stwa	%r5, [%r30 + %r26] 0x11
	.word 0xcab4d03a  ! 1361: STHA_R	stha	%r5, [%r19 + %r26] 0x81
NC_BIS_AIUP433:
	.word 0xc4b6445a  ! 1363: STHA_R	stha	%r2, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD434:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 1365: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xcad4903a  ! 1367: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcb83501a  ! 1368: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xcab4903a  ! 1370: STHA_R	stha	%r5, [%r18 + %r26] 0x81
CP_PST_PRI435:
	.word 0xcbbad91a  ! 1372: STDFA_R	stda	%f5, [%r26, %r11]
NC_BIS_SEC436:
	.word 0xc4b4dc7a  ! 1374: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xcbf3601a  ! 1375: CASXA_R	casxa	[%r13]%asi, %r26, %r5
	.word 0xca93d11a  ! 1377: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
	.word 0xcb84d03a  ! 1379: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcab4101a  ! 1381: STHA_R	stha	%r5, [%r16 + %r26] 0x80
	.word 0xcb9c913a  ! 1383: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcac4903a  ! 1385: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
CP_NUC437:
	.word 0xcaed019a  ! 1387: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x0c
	.word 0xcaccd13a  ! 1389: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
CHANGE_R26438:
	add	%r26,	%r27,	%r26
CP_BIS_SEC438:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 1391: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
NC_AIUS439:
	.word 0xc89fc23a  ! 1393: LDDA_R	ldda	[%r31, %r26] 0x11, %r4
CP_AIUS440:
	.word 0xcad7823a  ! 1395: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r5
CHANGE_USER441:
	ta	T_CHANGE_NONPRIV
CHANGE_R26442:
	add	%r26,	%r27,	%r26
CP_BIS_PRI442:
	and	%r26,	%r28,	%r26
	.word 0xc4bb5c5a  ! 1397: STDA_R	stda	%r2, [%r13 + %r26] 0xe2
	.word 0xcad2905a  ! 1398: LDSHA_R	ldsha	[%r10, %r26] 0x82, %r5
	.word 0xcb84913a  ! 1400: LDFA_R	lda	[%r18, %r26], %f5
SET_TL1_443:
	ta	T_CHANGE_TO_TL1
CHANGE_R26444:
	mov	%g0,	%r26
NC_BIS_NUC444:
	.word 0xc4f545fa  ! 1402: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
	.word 0xcb83511a  ! 1403: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xcb83911a  ! 1405: LDFA_R	lda	[%r14, %r26], %f5
NC_PST_PRI445:
	.word 0xcbbc585a  ! 1407: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xca42801a  ! 1408: LDSW_R	ldsw	[%r10 + %r26], %r5
	.word 0xcbbad11a  ! 1409: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaead01a  ! 1410: LDSTUBA_R	ldstuba	%r5, [%r11 + %r26] 0x80
CHANGE_R26446:
	add	%r26,	%r27,	%r26
CP_BIS_SEC446:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 1412: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
CP_BIS_QUAD_LD447:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 1414: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
NC_AIUS448:
	.word 0xcba7c33a  ! 1416: STFA_R	sta	%f5, [%r26, %r31]
NC_PST_PRI449:
	.word 0xcbbc585a  ! 1418: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xcaac903a  ! 1420: STBA_R	stba	%r5, [%r18 + %r26] 0x81
SHORT_FP_PRI450:
	.word 0xcb9a9b5a  ! 1422: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaeb501a  ! 1423: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x80
CP_ATM_QUAD_LD451:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 1425: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
CP_AIUP452:
	.word 0xcaf6031a  ! 1427: STXA_R	stxa	%r5, [%r24 + %r26] 0x18
NC_BLK_SEc453:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1429: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xca4ae03b  ! 1430: LDSB_I	ldsb	[%r11 + 0x003b], %r5
	.word 0xcad4101a  ! 1432: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r5
	.word 0xcb3aa038  ! 1433: STDF_I	std	%f5, [0x0038, %r10]
	.word 0xcba4913a  ! 1435: STFA_R	sta	%f5, [%r26, %r18]
CP_ATM_QUAD_LD454:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1437: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xcacc903a  ! 1439: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
CHANGE_R26455:
	add	%r26,	%r27,	%r26
CP_BIS_SEC455:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9d7a  ! 1441: STDA_R	stda	%r4, [%r18 + %r26] 0xeb
	.word 0xcaaa901a  ! 1442: STBA_R	stba	%r5, [%r10 + %r26] 0x80
	.word 0xcba4903a  ! 1444: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcac4511a  ! 1446: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r5
	.word 0xcb84913a  ! 1448: LDFA_R	lda	[%r18, %r26], %f5
SET_TL0_456:
	ta	T_CHANGE_TO_TL0
CHANGE_R26457:
	add	%r26,	%r27,	%r26
NC_BIS_SEC457:
	.word 0xc4a4dd7a  ! 1450: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
	.word 0xca83901a  ! 1452: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r5
	.word 0xcaa4913a  ! 1454: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
SHORT_FP_PRI458:
	.word 0xcb9b1a5a  ! 1456: LDDFA_R	ldda	[%r12, %r26], %f5
CHANGE_R26459:
	add	%r26,	%r27,	%r26
CP_BIS_SEC459:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 1458: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP461:
	.word 0xcb86421a  ! 1460: LDFA_R	lda	[%r25, %r26], %f5
NC_PST_PRI462:
	.word 0xcbbb995a  ! 1462: STDFA_R	stda	%f5, [%r26, %r14]
NC_BIS_SEC463:
	.word 0xccacdd7a  ! 1464: STBA_R	stba	%r6, [%r19 + %r26] 0xeb
	.word 0xcbbb911a  ! 1466: STDFA_R	stda	%f5, [%r26, %r14]
CHANGE_USER464:
	ta	T_CHANGE_NONPRIV
CHANGE_R26465:
	add	%r26,	%r27,	%r26
NC_BIS_PRI465:
	.word 0xd0f45c5a  ! 1468: STXA_R	stxa	%r8, [%r17 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS467:
	.word 0xcaafc33a  ! 1470: STBA_R	stba	%r5, [%r31 + %r26] 0x19
CP_AIUP468:
	.word 0xcaa6021a  ! 1472: STWA_R	stwa	%r5, [%r24 + %r26] 0x10
CHANGE_USER469:
	ta	T_CHANGE_NONPRIV
CHANGE_R26470:
	mov	%g0,	%r26
NC_BIS_PRI470:
	.word 0xc8f41c5a  ! 1474: STXA_R	stxa	%r4, [%r16 + %r26] 0xe2
	.word 0xc83a801a  ! 1475: STD_R	std	%r4, [%r10 + %r26]
	.word 0xca12801a  ! 1476: LDUH_R	lduh	[%r10 + %r26], %r5
CHANGE_PRIV471:
	ta	T_CHANGE_PRIV
CHANGE_R26472:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS472:
	.word 0xcca7c47a  ! 1478: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
	.word 0xc89a901a  ! 1479: LDDA_R	ldda	[%r10, %r26] 0x80, %r4
NC_BLK_SEc473:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1481: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xca22801a  ! 1482: STW_R	stw	%r5, [%r10 + %r26]
	.word 0xcbbc903a  ! 1484: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcad3901a  ! 1486: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
	.word 0xcaeb101a  ! 1487: LDSTUBA_R	ldstuba	%r5, [%r12 + %r26] 0x80
	.word 0xcbbc913a  ! 1489: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcbbad01a  ! 1490: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaea911a  ! 1491: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x88
	.word 0xcaccd13a  ! 1493: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
NC_PST_PRI474:
	.word 0xcbbc189a  ! 1495: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xca8c101a  ! 1497: LDUBA_R	lduba	[%r16, %r26] 0x80, %r5
	.word 0xcab4101a  ! 1499: STHA_R	stha	%r5, [%r16 + %r26] 0x80
CP_ATM_QUAD_LD475:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 1501: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
CP_AIUS476:
	.word 0xca87833a  ! 1503: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r5
	.word 0xca33203a  ! 1504: STH_I	sth	%r5, [%r12 + 0x003a]
	.word 0xcb9b901a  ! 1506: LDDFA_R	ldda	[%r14, %r26], %f5
NC_PST_PRI477:
	.word 0xcbbbd91a  ! 1508: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcaa4d03a  ! 1510: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CP_PST_PRI478:
	.word 0xcbba989a  ! 1512: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xc89c903a  ! 1514: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
SHORT_FP_PRI479:
	.word 0xcb9b5a1a  ! 1516: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xca7ac01a  ! 1517: SWAP_R	swap	%r5, [%r11 + %r26]
	.word 0xca8c101a  ! 1519: LDUBA_R	lduba	[%r16, %r26] 0x80, %r5
NC_NUC480:
	.word 0xc89d419a  ! 1521: LDDA_R	ldda	[%r21, %r26] 0x0c, %r4
CHANGE_USER481:
	ta	T_CHANGE_NONPRIV
CHANGE_R26482:
	add	%r26,	%r27,	%r26
NC_BIS_PRI482:
	.word 0xd0b39c5a  ! 1523: STHA_R	stha	%r8, [%r14 + %r26] 0xe2
NC_BIS_SEC483:
	.word 0xc4b4dd7a  ! 1525: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
	.word 0xcb84d13a  ! 1527: LDFA_R	lda	[%r19, %r26], %f5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP485:
	.word 0xcb86021a  ! 1529: LDFA_R	lda	[%r24, %r26], %f5
CHANGE_USER486:
	ta	T_CHANGE_NONPRIV
CHANGE_R26487:
	add	%r26,	%r27,	%r26
CP_BIS_PRI487:
	and	%r26,	%r28,	%r26
	.word 0xccba9d5a  ! 1531: STDA_R	stda	%r6, [%r10 + %r26] 0xea
NC_SHORT_FP_SEC488:
	.word 0xcb9cdb3a  ! 1533: LDDFA_R	ldda	[%r19, %r26], %f5
SHORT_FP_PRI489:
	.word 0xcbba9a5a  ! 1535: STDFA_R	stda	%f5, [%r26, %r10]
NC_BLK_SEc490:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1537: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcadcd03a  ! 1539: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CP_BIS_PRI491:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 1541: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
BLK_PRI492:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 1543: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xca7aa038  ! 1544: SWAP_I	swap	%r5, [%r10 + 0x0038]
SHORT_FP_PRI493:
	.word 0xcbba9b5a  ! 1546: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_PRI494:
	and	%r26,	%r28,	%r26
	.word 0xc4a29d5a  ! 1548: STWA_R	stwa	%r2, [%r10 + %r26] 0xea
	.word 0xcab3901a  ! 1550: STHA_R	stha	%r5, [%r14 + %r26] 0x80
	.word 0xca22c01a  ! 1551: STW_R	stw	%r5, [%r11 + %r26]
	.word 0xcbe3201a  ! 1552: CASA_R	casa	[%r12] %asi, %r26, %r5
	.word 0xcb84501a  ! 1554: LDFA_R	lda	[%r17, %r26], %f5
SET_TL1_495:
	ta	T_CHANGE_TO_TL1
CHANGE_R26496:
	add	%r26,	%r27,	%r26
NC_BIS_NUC496:
	.word 0xc4ad44fa  ! 1556: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xca82911a  ! 1557: LDUWA_R	lduwa	[%r10, %r26] 0x88, %r5
	.word 0xcba2d01a  ! 1558: STFA_R	sta	%f5, [%r26, %r11]
	.word 0xcad4903a  ! 1560: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
CHANGE_R26497:
	add	%r26,	%r27,	%r26
CP_BIS_SEC497:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 1562: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xcb9c903a  ! 1564: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcb9b101a  ! 1565: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcaa4d03a  ! 1567: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CHANGE_R26498:
	add	%r26,	%r27,	%r26
CP_BIS_SEC498:
	and	%r26,	%r28,	%r26
	.word 0xcca49d7a  ! 1569: STWA_R	stwa	%r6, [%r18 + %r26] 0xeb
NC_BLK_SEc499:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1571: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc8bcd03a  ! 1573: STDA_R	stda	%r4, [%r19 + %r26] 0x81
CP_PST_PRI500:
	.word 0xcbba999a  ! 1575: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcab3101a  ! 1576: STHA_R	stha	%r5, [%r12 + %r26] 0x80
	.word 0xc89cd13a  ! 1578: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
NC_PST_PRI501:
	.word 0xcbbc189a  ! 1580: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xca8c913a  ! 1582: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
NC_BLK_SEc502:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1584: LDDFA_R	ldda	[%r19, %r26], %f0
NC_PST_PRI503:
	.word 0xcbbc195a  ! 1586: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcaa3111a  ! 1587: STWA_R	stwa	%r5, [%r12 + %r26] 0x88
NC_AIUP504:
	.word 0xcab6431a  ! 1589: STHA_R	stha	%r5, [%r25 + %r26] 0x18
CP_BIS_AIUP505:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 1591: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
	.word 0xca13203a  ! 1592: LDUH_I	lduh	[%r12 + 0x003a], %r5
	.word 0xcaa4501a  ! 1594: STWA_R	stwa	%r5, [%r17 + %r26] 0x80
	.word 0xcb032038  ! 1595: LDF_I	ld	[%r12, 0x0038], %f5
	.word 0xc89c913a  ! 1597: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xcaac913a  ! 1599: STBA_R	stba	%r5, [%r18 + %r26] 0x89
NC_BIS_AIUP506:
	.word 0xc8ae445a  ! 1601: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xcaa4111a  ! 1603: STWA_R	stwa	%r5, [%r16 + %r26] 0x88
	.word 0xcbbcd13a  ! 1605: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xca84913a  ! 1607: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r5
	.word 0xcaf4d13a  ! 1609: STXA_R	stxa	%r5, [%r19 + %r26] 0x89
SHORT_FP_PRI507:
	.word 0xcbbb5a1a  ! 1611: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xca52a03a  ! 1612: LDSH_I	ldsh	[%r10 + 0x003a], %r5
NC_BIS_AIUP508:
	.word 0xccf6445a  ! 1614: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xca7ac01a  ! 1615: SWAP_R	swap	%r5, [%r11 + %r26]
	.word 0xca22a038  ! 1616: STW_I	stw	%r5, [%r10 + 0x0038]
	.word 0xcad4d13a  ! 1618: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
SET_TL0_509:
	ta	T_CHANGE_TO_TL0
CHANGE_R26510:
	mov	%g0,	%r26
NC_BIS_SEC510:
	.word 0xccb4dd7a  ! 1620: STHA_R	stha	%r6, [%r19 + %r26] 0xeb
	.word 0xcb9a901a  ! 1621: LDDFA_R	ldda	[%r10, %r26], %f5
CHANGE_PRIV511:
	ta	T_CHANGE_PRIV
CHANGE_R26512:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS512:
	.word 0xd0a7c57a  ! 1623: STWA_R	stwa	%r8, [%r31 + %r26] 0x2b
CP_BIS_QUAD_LD513:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1625: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xcaf4d03a  ! 1627: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xc89c903a  ! 1629: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xca6a801a  ! 1630: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
NC_BIS_AIUS514:
	.word 0xc4f7c47a  ! 1632: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
WR_LEASI_515:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_516:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc89c913a  ! 1635: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
CHANGE_R26517:
	add	%r26,	%r27,	%r26
CP_BIS_SEC517:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 1637: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
SHORT_FP_PRI518:
	.word 0xcbbb5a1a  ! 1639: STDFA_R	stda	%f5, [%r26, %r13]
CHANGE_USER519:
	ta	T_CHANGE_NONPRIV
CHANGE_R26520:
	add	%r26,	%r27,	%r26
CP_BIS_PRI520:
	and	%r26,	%r28,	%r26
	.word 0xc4f29d5a  ! 1641: STXA_R	stxa	%r2, [%r10 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC522:
	.word 0xcaad409a  ! 1643: STBA_R	stba	%r5, [%r21 + %r26] 0x04
	.word 0xcba4d13a  ! 1645: STFA_R	sta	%f5, [%r26, %r19]
CP_NUC523:
	.word 0xcac5009a  ! 1647: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xcab4101a  ! 1649: STHA_R	stha	%r5, [%r16 + %r26] 0x80
	.word 0xcad3911a  ! 1651: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r5
CP_ATM_QUAD_LD524:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 1653: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
CHANGE_USER525:
	ta	T_CHANGE_NONPRIV
CHANGE_R26526:
	add	%r26,	%r27,	%r26
NC_BIS_PRI526:
	.word 0xc8a3dc5a  ! 1655: STWA_R	stwa	%r4, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC528:
	.word 0xcaed019a  ! 1657: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x0c
NC_NUC529:
	.word 0xca95419a  ! 1659: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r5
	.word 0xcb22a038  ! 1660: STF_I	st	%f5, [0x0038, %r10]
CHANGE_USER530:
	ta	T_CHANGE_NONPRIV
CHANGE_R26531:
	add	%r26,	%r27,	%r26
NC_BIS_PRI531:
	.word 0xccac5d5a  ! 1662: STBA_R	stba	%r6, [%r17 + %r26] 0xea
	.word 0xcaead11a  ! 1663: LDSTUBA_R	ldstuba	%r5, [%r11 + %r26] 0x88
	.word 0xca83901a  ! 1665: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r5
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS533:
	.word 0xcb9fc23a  ! 1667: LDDFA_R	ldda	[%r31, %r26], %f5
	.word 0xca83501a  ! 1668: LDUWA_R	lduwa	[%r13, %r26] 0x80, %r5
SET_TL1_534:
	ta	T_CHANGE_TO_TL1
CHANGE_R26535:
	add	%r26,	%r27,	%r26
NC_BIS_NUC535:
	.word 0xc4ad44fa  ! 1670: STBA_R	stba	%r2, [%r21 + %r26] 0x27
NC_AIUP536:
	.word 0xca86431a  ! 1672: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r5
	.word 0xcab4d03a  ! 1674: STHA_R	stha	%r5, [%r19 + %r26] 0x81
	.word 0xcbba901a  ! 1675: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_QUAD_LD537:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1677: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xcb9a905a  ! 1678: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcbbcd03a  ! 1680: STDFA_R	stda	%f5, [%r26, %r19]
CP_BIS_QUAD_LD538:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1682: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xc81b401a  ! 1683: LDD_R	ldd	[%r13 + %r26], %r4
NC_PST_PRI539:
	.word 0xcbbbd81a  ! 1685: STDFA_R	stda	%f5, [%r26, %r15]
NC_BIS_AIUS540:
	.word 0xd0f7c47a  ! 1687: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xcb9cd03a  ! 1689: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca8c913a  ! 1691: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
	.word 0xca8c913a  ! 1693: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
NC_BIS_NUC541:
	.word 0xc4bd44fa  ! 1695: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_BIS_NUC542:
	.word 0xc4bd44fa  ! 1697: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_AIUS543:
	.word 0xcba7c23a  ! 1699: STFA_R	sta	%f5, [%r26, %r31]
CP_NUC544:
	.word 0xcad5009a  ! 1701: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r5
CP_AIUS545:
	.word 0xcaf7823a  ! 1703: STXA_R	stxa	%r5, [%r30 + %r26] 0x11
NC_BLK_SEc546:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1705: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcb9b111a  ! 1706: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcacc903a  ! 1708: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
	.word 0xcacc903a  ! 1710: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
SET_TL0_547:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI548:
	.word 0xc4ab9c5a  ! 1712: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
	.word 0xcbba911a  ! 1713: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcb1ac01a  ! 1714: LDDF_R	ldd	[%r11, %r26], %f5
	.word 0xca736038  ! 1715: STX_I	stx	%r5, [%r13 + 0x0038]
NC_BIS_PRI549:
	.word 0xc4a39c5a  ! 1717: STWA_R	stwa	%r2, [%r14 + %r26] 0xe2
	.word 0xc89cd03a  ! 1719: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
BLK_PRI550:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1721: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xca8cd13a  ! 1723: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcba3911a  ! 1725: STFA_R	sta	%f5, [%r26, %r14]
CP_PST_PRI551:
	.word 0xcbba995a  ! 1727: STDFA_R	stda	%f5, [%r26, %r10]
CHANGE_PRIV552:
	ta	T_CHANGE_PRIV
CHANGE_R26553:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP553:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1729: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
CP_BIS_AIUP554:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1731: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xca0aa03b  ! 1732: LDUB_I	ldub	[%r10 + 0x003b], %r5
	.word 0xcaacd13a  ! 1734: STBA_R	stba	%r5, [%r19 + %r26] 0x89
CP_BIS_AIUP555:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 1736: STHA_R	stha	%r8, [%r24 + %r26] 0x22
NC_AIUP556:
	.word 0xcaae421a  ! 1738: STBA_R	stba	%r5, [%r25 + %r26] 0x10
	.word 0xca94903a  ! 1740: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcbba901a  ! 1741: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_QUAD_LD557:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 1743: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
BLK_PRI558:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 1745: STDFA_R	stda	%f0, [%r26, %r13]
CP_BIS_NUC559:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 1747: STBA_R	stba	%r6, [%r20 + %r26] 0x27
SHORT_FP_PRI560:
	.word 0xcbbb1a1a  ! 1749: STDFA_R	stda	%f5, [%r26, %r12]
NC_PST_PRI561:
	.word 0xcbbbd81a  ! 1751: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcab2911a  ! 1752: STHA_R	stha	%r5, [%r10 + %r26] 0x88
	.word 0xc89c903a  ! 1754: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
NC_BIS_AIUS562:
	.word 0xcca7c47a  ! 1756: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
CHANGE_R26563:
	add	%r26,	%r27,	%r26
CP_BIS_SEC563:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1758: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xcb84501a  ! 1760: LDFA_R	lda	[%r17, %r26], %f5
	.word 0xcac4d13a  ! 1762: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUP564:
	.word 0xd0be445a  ! 1764: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CP_AIUS565:
	.word 0xca8f833a  ! 1766: LDUBA_R	lduba	[%r30, %r26] 0x19, %r5
	.word 0xcaac913a  ! 1768: STBA_R	stba	%r5, [%r18 + %r26] 0x89
NC_NUC566:
	.word 0xcab5419a  ! 1770: STHA_R	stha	%r5, [%r21 + %r26] 0x0c
CP_NUC567:
	.word 0xcac5009a  ! 1772: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xca7a801a  ! 1773: SWAP_R	swap	%r5, [%r10 + %r26]
NC_PST_PRI568:
	.word 0xcbbc189a  ! 1775: STDFA_R	stda	%f5, [%r26, %r16]
CP_PST_PRI569:
	.word 0xcbbb591a  ! 1777: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcb9c101a  ! 1779: LDDFA_R	ldda	[%r16, %r26], %f5
NC_BIS_AIUP570:
	.word 0xd0be445a  ! 1781: STDA_R	stda	%r8, [%r25 + %r26] 0x22
NC_PST_PRI571:
	.word 0xcbbb989a  ! 1783: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcaca901a  ! 1784: LDSBA_R	ldsba	[%r10, %r26] 0x80, %r5
NC_BLK_SEc572:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1786: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_AIUP573:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1788: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
CP_BIS_NUC574:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 1790: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
CHANGE_USER575:
	ta	T_CHANGE_NONPRIV
CHANGE_R26576:
	add	%r26,	%r27,	%r26
CP_BIS_PRI576:
	and	%r26,	%r28,	%r26
	.word 0xccab5c5a  ! 1792: STBA_R	stba	%r6, [%r13 + %r26] 0xe2
	.word 0xca22a038  ! 1793: STW_I	stw	%r5, [%r10 + 0x0038]
	.word 0xcab4903a  ! 1795: STHA_R	stha	%r5, [%r18 + %r26] 0x81
NC_PST_PRI577:
	.word 0xcbbb989a  ! 1797: STDFA_R	stda	%f5, [%r26, %r14]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP579:
	.word 0xcac6021a  ! 1799: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r5
	.word 0xcbbc903a  ! 1801: STDFA_R	stda	%f5, [%r26, %r18]
CHANGE_USER580:
	ta	T_CHANGE_NONPRIV
CHANGE_R26581:
	add	%r26,	%r27,	%r26
NC_BIS_PRI581:
	.word 0xc4a45d5a  ! 1803: STWA_R	stwa	%r2, [%r17 + %r26] 0xea
SHORT_FP_PRI582:
	.word 0xcb9a9a1a  ! 1805: LDDFA_R	ldda	[%r10, %r26], %f5
CHANGE_R26583:
	add	%r26,	%r27,	%r26
CP_BIS_SEC583:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 1807: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
CHANGE_PRIV584:
	ta	T_CHANGE_PRIV
CHANGE_R26585:
	mov	%g0,	%r26
CP_ATM_QUAD_LD585:
	and	%r26,	%r29,	%r26
	.word 0xc89b059a  ! 1809: LDDA_R	ldda	[%r12, %r26] 0x2c, %r4
	.word 0xc8bb911a  ! 1811: STDA_R	stda	%r4, [%r14 + %r26] 0x88
CHANGE_USER586:
	ta	T_CHANGE_NONPRIV
CHANGE_R26587:
	add	%r26,	%r27,	%r26
CP_BIS_PRI587:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 1813: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
	.word 0xcb1b6038  ! 1814: LDDF_I	ldd	[%r13, 0x0038], %f5
NC_SHORT_FP_SEC588:
	.word 0xcbbcda3a  ! 1816: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xca8c903a  ! 1818: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
SHORT_FP_PRI589:
	.word 0xcb9a9a1a  ! 1820: LDDFA_R	ldda	[%r10, %r26], %f5
CHANGE_PRIV590:
	ta	T_CHANGE_PRIV
CHANGE_R26591:
	add	%r26,	%r27,	%r26
CP_BIS_NUC591:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 1822: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
CP_PST_PRI592:
	.word 0xcbbb191a  ! 1824: STDFA_R	stda	%f5, [%r26, %r12]
WR_LEASI_593:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_594:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_SHORT_FP_SEC595:
	.word 0xcb9cda3a  ! 1827: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcac4913a  ! 1829: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
NC_BLK_SEc596:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1831: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcaf3101a  ! 1832: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
NC_BIS_AIUP597:
	.word 0xc4f6445a  ! 1834: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xcad4d13a  ! 1836: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
CP_BIS_AIUS598:
	and	%r26,	%r28,	%r26
	.word 0xccf7857a  ! 1838: STXA_R	stxa	%r6, [%r30 + %r26] 0x2b
	.word 0xca8c903a  ! 1840: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
SET_TL1_599:
	ta	T_CHANGE_TO_TL1
CHANGE_R26600:
	add	%r26,	%r27,	%r26
NC_BIS_NUC600:
	.word 0xd0f545fa  ! 1842: STXA_R	stxa	%r8, [%r21 + %r26] 0x2f
CP_BIS_QUAD_LD601:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1844: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xcadb901a  ! 1846: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
BLK_PRI602:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 1848: LDDFA_R	ldda	[%r13, %r26], %f16
CP_BIS_AIUP603:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 1850: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
	.word 0xcab4501a  ! 1852: STHA_R	stha	%r5, [%r17 + %r26] 0x80
SET_TL0_604:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI605:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 1854: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xcbf3201a  ! 1855: CASXA_R	casxa	[%r12]%asi, %r26, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP607:
	.word 0xcade421a  ! 1857: LDXA_R	ldxa	[%r25, %r26] 0x10, %r5
CHANGE_TLE608:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcba2901a  ! 1859: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xca84d03a  ! 1861: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xca6b603b  ! 1862: LDSTUB_I	ldstub	%r5, [%r13 + 0x003b]
CHANGE_TLE609:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_PST_PRI610:
	.word 0xcbbc181a  ! 1865: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xc89b911a  ! 1867: LDDA_R	ldda	[%r14, %r26] 0x88, %r4
	.word 0xca33001a  ! 1868: STH_R	sth	%r5, [%r12 + %r26]
	.word 0xcaac501a  ! 1870: STBA_R	stba	%r5, [%r17 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP612:
	.word 0xc8be021a  ! 1872: STDA_R	stda	%r4, [%r24 + %r26] 0x10
NC_BLK_SEc613:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1874: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xca7b001a  ! 1875: SWAP_R	swap	%r5, [%r12 + %r26]
NC_BIS_SEC614:
	.word 0xc4acdc7a  ! 1877: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
CHANGE_USER615:
	ta	T_CHANGE_NONPRIV
CHANGE_R26616:
	add	%r26,	%r27,	%r26
CP_BIS_PRI616:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1879: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	.word 0xca92d05a  ! 1880: LDUHA_R	lduha	[%r11, %r26] 0x82, %r5
	.word 0xc89cd03a  ! 1882: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xca0b603b  ! 1883: LDUB_I	ldub	[%r13 + 0x003b], %r5
	.word 0xcba4913a  ! 1885: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcaacd13a  ! 1887: STBA_R	stba	%r5, [%r19 + %r26] 0x89
CHANGE_PRIV617:
	ta	T_CHANGE_PRIV
CHANGE_R26618:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP618:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 1889: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xc89cd03a  ! 1891: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
NC_BIS_SEC619:
	.word 0xc4f4dc7a  ! 1893: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xcac4d13a  ! 1895: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
NC_BLK_SEc620:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1897: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_QUAD_LD621:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1899: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_AIUP622:
	.word 0xcab6021a  ! 1901: STHA_R	stha	%r5, [%r24 + %r26] 0x10
NC_SHORT_FP_SEC623:
	.word 0xcbbcda3a  ! 1903: STDFA_R	stda	%f5, [%r26, %r19]
SHORT_FP_PRI624:
	.word 0xcb9a9a1a  ! 1905: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcb22a038  ! 1906: STF_I	st	%f5, [0x0038, %r10]
CP_BIS_AIUS625:
	and	%r26,	%r28,	%r26
	.word 0xc4a7857a  ! 1908: STWA_R	stwa	%r2, [%r30 + %r26] 0x2b
CHANGE_R26626:
	mov	%g0,	%r26
CP_BIS_SEC626:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 1910: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
NC_BIS_SEC627:
	.word 0xc4b4dd7a  ! 1912: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
NC_BIS_AIUS628:
	.word 0xc8b7c57a  ! 1914: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
	.word 0xcab2901a  ! 1915: STHA_R	stha	%r5, [%r10 + %r26] 0x80
CP_BIS_AIUP629:
	and	%r26,	%r28,	%r26
	.word 0xc8f6055a  ! 1917: STXA_R	stxa	%r4, [%r24 + %r26] 0x2a
	.word 0xcb9c913a  ! 1919: LDDFA_R	ldda	[%r18, %r26], %f5
CP_BIS_AIUP630:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1921: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CP_AIUS631:
	.word 0xca87833a  ! 1923: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r5
BLK_PRI632:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 1925: LDDFA_R	ldda	[%r10, %r26], %f16
NC_BIS_SEC633:
	.word 0xc4f4dc7a  ! 1927: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
BLK_PRI634:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1929: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xca93911a  ! 1931: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
	.word 0xcac2d11a  ! 1932: LDSWA_R	ldswa	[%r11, %r26] 0x88, %r5
	.word 0xcaf2901a  ! 1933: STXA_R	stxa	%r5, [%r10 + %r26] 0x80
	.word 0xca4aa03b  ! 1934: LDSB_I	ldsb	[%r10 + 0x003b], %r5
CHANGE_USER635:
	ta	T_CHANGE_NONPRIV
CHANGE_R26636:
	add	%r26,	%r27,	%r26
CP_BIS_PRI636:
	and	%r26,	%r28,	%r26
	.word 0xc4ab1c5a  ! 1936: STBA_R	stba	%r2, [%r12 + %r26] 0xe2
	.word 0xcba4913a  ! 1938: STFA_R	sta	%f5, [%r26, %r18]
BLK_PRI637:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1940: LDDFA_R	ldda	[%r10, %r26], %f0
CP_PST_PRI638:
	.word 0xcbbad89a  ! 1942: STDFA_R	stda	%f5, [%r26, %r11]
BLK_PRI639:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1944: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xcab4d03a  ! 1946: STHA_R	stha	%r5, [%r19 + %r26] 0x81
CHANGE_PRIV640:
	ta	T_CHANGE_PRIV
CHANGE_R26641:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS641:
	and	%r26,	%r28,	%r26
	.word 0xc8f7847a  ! 1948: STXA_R	stxa	%r4, [%r30 + %r26] 0x23
	.word 0xca8a901a  ! 1949: LDUBA_R	lduba	[%r10, %r26] 0x80, %r5
NC_PST_PRI642:
	.word 0xcbbc191a  ! 1951: STDFA_R	stda	%f5, [%r26, %r16]
NC_NUC643:
	.word 0xcad5409a  ! 1953: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r5
	.word 0xcadc511a  ! 1955: LDXA_R	ldxa	[%r17, %r26] 0x88, %r5
CHANGE_USER644:
	ta	T_CHANGE_NONPRIV
CHANGE_R26645:
	add	%r26,	%r27,	%r26
NC_BIS_PRI645:
	.word 0xc4f39c5a  ! 1957: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	.word 0xca8ad01a  ! 1958: LDUBA_R	lduba	[%r11, %r26] 0x80, %r5
CHANGE_PRIV646:
	ta	T_CHANGE_PRIV
CHANGE_R26647:
	add	%r26,	%r27,	%r26
CP_BIS_NUC647:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 1960: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
CP_ATM_QUAD_LD648:
	and	%r26,	%r29,	%r26
	.word 0xd09a859a  ! 1962: LDDA_R	ldda	[%r10, %r26] 0x2c, %r8
CP_BIS_NUC649:
	and	%r26,	%r28,	%r26
	.word 0xc8b505fa  ! 1964: STHA_R	stha	%r4, [%r20 + %r26] 0x2f
SHORT_FP_PRI650:
	.word 0xcb9b1b5a  ! 1966: LDDFA_R	ldda	[%r12, %r26], %f5
WR_LEASI_651:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_652:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcaaad01a  ! 1968: STBA_R	stba	%r5, [%r11 + %r26] 0x80
CHANGE_USER653:
	ta	T_CHANGE_NONPRIV
CHANGE_R26654:
	add	%r26,	%r27,	%r26
CP_BIS_PRI654:
	and	%r26,	%r28,	%r26
	.word 0xcc9b1c5a  ! 1970: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xcaf3901a  ! 1972: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
	.word 0xcaa4913a  ! 1974: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
NC_BIS_PRI655:
	.word 0xccf39d5a  ! 1976: STXA_R	stxa	%r6, [%r14 + %r26] 0xea
	.word 0xca4aa03b  ! 1977: LDSB_I	ldsb	[%r10 + 0x003b], %r5
WR_LEASI_656:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_657:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xca94913a  ! 1980: LDUHA_R	lduha	[%r18, %r26] 0x89, %r5
NC_PST_PRI658:
	.word 0xcbbb981a  ! 1982: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xc89c101a  ! 1984: LDDA_R	ldda	[%r16, %r26] 0x80, %r4
SHORT_FP_PRI659:
	.word 0xcb9b1b5a  ! 1986: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xca93911a  ! 1988: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
NC_SHORT_FP_SEC660:
	.word 0xcb9cda3a  ! 1990: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcacb105a  ! 1991: LDSBA_R	ldsba	[%r12, %r26] 0x82, %r5
	.word 0xc89bd01a  ! 1993: LDDA_R	ldda	[%r15, %r26] 0x80, %r4
CHANGE_PRIV661:
	ta	T_CHANGE_PRIV
CHANGE_R26662:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP662:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1995: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xc89cd03a  ! 1997: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xcbe3201a  ! 1998: CASA_R	casa	[%r12] %asi, %r26, %r5
	.word 0xc89cd13a  ! 2000: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
CP_BIS_NUC663:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 2002: STBA_R	stba	%r8, [%r20 + %r26] 0x27
NC_BLK_SEc664:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2004: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcbe2a01a  ! 2005: CASA_R	casa	[%r10] %asi, %r26, %r5
NC_BIS_AIUS665:
	.word 0xc4bfc47a  ! 2007: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xcb9c903a  ! 2009: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcac4d13a  ! 2011: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
CP_AIUP666:
	.word 0xcace031a  ! 2013: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r5
CP_BIS_AIUP667:
	and	%r26,	%r28,	%r26
	.word 0xd0be055a  ! 2015: STDA_R	stda	%r8, [%r24 + %r26] 0x2a
CP_PST_PRI668:
	.word 0xcbbb185a  ! 2017: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xca94d03a  ! 2019: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
NC_BLK_SEc669:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2021: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcb1b401a  ! 2022: LDDF_R	ldd	[%r13, %r26], %f5
CP_BIS_QUAD_LD670:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 2024: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xc8bb911a  ! 2026: STDA_R	stda	%r4, [%r14 + %r26] 0x88
NC_NUC671:
	.word 0xc89d409a  ! 2028: LDDA_R	ldda	[%r21, %r26] 0x04, %r4
	.word 0xcaccd03a  ! 2030: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
NC_NUC672:
	.word 0xc89d409a  ! 2032: LDDA_R	ldda	[%r21, %r26] 0x04, %r4
NC_BIS_AIUP673:
	.word 0xccae445a  ! 2034: STBA_R	stba	%r6, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD674:
	and	%r26,	%r29,	%r26
	.word 0xcc9add5a  ! 2036: LDDA_R	ldda	[%r11, %r26] 0xea, %r6
	.word 0xcb02e038  ! 2037: LDF_I	ld	[%r11, 0x0038], %f5
	.word 0xcb9c913a  ! 2039: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xca84d13a  ! 2041: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
	.word 0xca53401a  ! 2042: LDSH_R	ldsh	[%r13 + %r26], %r5
	.word 0xcb9c903a  ! 2044: LDDFA_R	ldda	[%r18, %r26], %f5
CP_BIS_NUC675:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2046: STBA_R	stba	%r2, [%r20 + %r26] 0x27
NC_AIUS676:
	.word 0xcacfc23a  ! 2048: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r5
	.word 0xcbbc101a  ! 2050: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcbf2e01a  ! 2051: CASXA_R	casxa	[%r11]%asi, %r26, %r5
	.word 0xcaf2911a  ! 2052: STXA_R	stxa	%r5, [%r10 + %r26] 0x88
	.word 0xcb9c111a  ! 2054: LDDFA_R	ldda	[%r16, %r26], %f5
	.word 0xc83aa038  ! 2055: STD_I	std	%r4, [%r10 + 0x0038]
NC_BIS_AIUS677:
	.word 0xc4b7c47a  ! 2057: STHA_R	stha	%r2, [%r31 + %r26] 0x23
CP_ATM_QUAD_LD678:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2059: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
NC_BIS_SEC679:
	.word 0xd0bcdc7a  ! 2061: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xcaa2901a  ! 2062: STWA_R	stwa	%r5, [%r10 + %r26] 0x80
NC_AIUP680:
	.word 0xc8be431a  ! 2064: STDA_R	stda	%r4, [%r25 + %r26] 0x18
	.word 0xcab4903a  ! 2066: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xcb9cd03a  ! 2068: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcacbd11a  ! 2070: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r5
	.word 0xcbf3201a  ! 2071: CASXA_R	casxa	[%r12]%asi, %r26, %r5
CHANGE_R26681:
	add	%r26,	%r27,	%r26
CP_BIS_SEC681:
	and	%r26,	%r28,	%r26
	.word 0xc4f49d7a  ! 2073: STXA_R	stxa	%r2, [%r18 + %r26] 0xeb
	.word 0xcaf4d13a  ! 2075: STXA_R	stxa	%r5, [%r19 + %r26] 0x89
	.word 0xc8bc903a  ! 2077: STDA_R	stda	%r4, [%r18 + %r26] 0x81
NC_AIUS682:
	.word 0xca97c33a  ! 2079: LDUHA_R	lduha	[%r31, %r26] 0x19, %r5
	.word 0xcbbc913a  ! 2081: STDFA_R	stda	%f5, [%r26, %r18]
CP_AIUP683:
	.word 0xcade031a  ! 2083: LDXA_R	ldxa	[%r24, %r26] 0x18, %r5
	.word 0xc89c903a  ! 2085: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xca32c01a  ! 2086: STH_R	sth	%r5, [%r11 + %r26]
	.word 0xcacc903a  ! 2088: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
NC_BLK_SEc684:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2090: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUP685:
	.word 0xcad6021a  ! 2092: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r5
	.word 0xcadc903a  ! 2094: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
NC_BIS_AIUP686:
	.word 0xc8a6445a  ! 2096: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
CP_ATM_QUAD_LD687:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2098: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
CP_BIS_NUC688:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 2100: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xca94903a  ! 2102: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
NC_BLK_SEc689:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2104: STDFA_R	stda	%f16, [%r26, %r19]
CP_BIS_NUC690:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 2106: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
NC_PST_PRI691:
	.word 0xcbbc181a  ! 2108: STDFA_R	stda	%f5, [%r26, %r16]
WR_LEASI_692:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_693:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
WR_LEASI_694:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_695:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xca0aa03b  ! 2111: LDUB_I	ldub	[%r10 + 0x003b], %r5
	.word 0xcaf3501a  ! 2112: STXA_R	stxa	%r5, [%r13 + %r26] 0x80
	.word 0xca8cd03a  ! 2114: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
BLK_PRI696:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2116: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xcbbb511a  ! 2117: STDFA_R	stda	%f5, [%r26, %r13]
NC_AIUP697:
	.word 0xc89e421a  ! 2119: LDDA_R	ldda	[%r25, %r26] 0x10, %r4
	.word 0xc8bad11a  ! 2120: STDA_R	stda	%r4, [%r11 + %r26] 0x88
CP_BIS_QUAD_LD698:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2122: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
NC_AIUS699:
	.word 0xcb87c23a  ! 2124: LDFA_R	lda	[%r31, %r26], %f5
CHANGE_USER700:
	ta	T_CHANGE_NONPRIV
CHANGE_R26701:
	mov	%g0,	%r26
CP_BIS_PRI701:
	and	%r26,	%r28,	%r26
	.word 0xc89b1d5a  ! 2126: LDDA_R	ldda	[%r12, %r26] 0xea, %r4
	.word 0xc89c903a  ! 2128: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CHANGE_PRIV702:
	ta	T_CHANGE_PRIV
CHANGE_R26703:
	add	%r26,	%r27,	%r26
CP_BIS_NUC703:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 2130: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
CP_PST_PRI704:
	.word 0xcbbb581a  ! 2132: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcadc913a  ! 2134: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CP_AIUS705:
	.word 0xcad7823a  ! 2136: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r5
NC_BIS_AIUP706:
	.word 0xccae455a  ! 2138: STBA_R	stba	%r6, [%r25 + %r26] 0x2a
CP_AIUP707:
	.word 0xcad6031a  ! 2140: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r5
CHANGE_USER708:
	ta	T_CHANGE_NONPRIV
CHANGE_R26709:
	add	%r26,	%r27,	%r26
CP_BIS_PRI709:
	and	%r26,	%r28,	%r26
	.word 0xd0ab5c5a  ! 2142: STBA_R	stba	%r8, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS711:
	.word 0xcadf823a  ! 2144: LDXA_R	ldxa	[%r30, %r26] 0x11, %r5
	.word 0xcaf3101a  ! 2145: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
NC_NUC712:
	.word 0xcacd419a  ! 2147: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r5
CP_AIUS713:
	.word 0xca87823a  ! 2149: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r5
	.word 0xcbba901a  ! 2150: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcbe2a01a  ! 2151: CASA_R	casa	[%r10] %asi, %r26, %r5
	.word 0xcac3501a  ! 2152: LDSWA_R	ldswa	[%r13, %r26] 0x80, %r5
	.word 0xcbba901a  ! 2153: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcb84d13a  ! 2155: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcb9b115a  ! 2156: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcba2901a  ! 2157: STFA_R	sta	%f5, [%r26, %r10]
CP_ATM_QUAD_LD714:
	and	%r26,	%r29,	%r26
	.word 0xc89b059a  ! 2159: LDDA_R	ldda	[%r12, %r26] 0x2c, %r4
	.word 0xcaa3101a  ! 2160: STWA_R	stwa	%r5, [%r12 + %r26] 0x80
	.word 0xcab3111a  ! 2161: STHA_R	stha	%r5, [%r12 + %r26] 0x88
SHORT_FP_PRI715:
	.word 0xcb9b5b5a  ! 2163: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xcb9c903a  ! 2165: LDDFA_R	ldda	[%r18, %r26], %f5
CP_AIUP716:
	.word 0xcade021a  ! 2167: LDXA_R	ldxa	[%r24, %r26] 0x10, %r5
	.word 0xcad4d03a  ! 2169: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
CP_AIUP717:
	.word 0xcba6021a  ! 2171: STFA_R	sta	%f5, [%r26, %r24]
	.word 0xca94d13a  ! 2173: LDUHA_R	lduha	[%r19, %r26] 0x89, %r5
	.word 0xca93d11a  ! 2175: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
	.word 0xcb02801a  ! 2176: LDF_R	ld	[%r10, %r26], %f5
	.word 0xc89c913a  ! 2178: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xcbbc913a  ! 2180: STDFA_R	stda	%f5, [%r26, %r18]
NC_BIS_SEC718:
	.word 0xcca4dc7a  ! 2182: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
NC_BIS_AIUS719:
	.word 0xccbfc47a  ! 2184: STDA_R	stda	%r6, [%r31 + %r26] 0x23
CP_PST_PRI720:
	.word 0xcbbb185a  ! 2186: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xc8bcd03a  ! 2188: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xca8cd03a  ! 2190: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
NC_BIS_SEC721:
	.word 0xd0a4dd7a  ! 2192: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	.word 0xca82d01a  ! 2193: LDUWA_R	lduwa	[%r11, %r26] 0x80, %r5
NC_PST_PRI722:
	.word 0xcbbb981a  ! 2195: STDFA_R	stda	%f5, [%r26, %r14]
NC_BLK_SEc723:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2197: LDDFA_R	ldda	[%r19, %r26], %f16
SHORT_FP_PRI724:
	.word 0xcbba9a1a  ! 2199: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca8cd03a  ! 2201: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xcadc101a  ! 2203: LDXA_R	ldxa	[%r16, %r26] 0x80, %r5
BLK_PRI725:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2205: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xcab3111a  ! 2206: STHA_R	stha	%r5, [%r12 + %r26] 0x88
CP_ATM_QUAD_LD726:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2208: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
NC_BIS_SEC727:
	.word 0xd0f4dc7a  ! 2210: STXA_R	stxa	%r8, [%r19 + %r26] 0xe3
	.word 0xcaacd03a  ! 2212: STBA_R	stba	%r5, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD728:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 2214: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xcbba911a  ! 2215: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_AIUP729:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 2217: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
NC_AIUP730:
	.word 0xca96421a  ! 2219: LDUHA_R	lduha	[%r25, %r26] 0x10, %r5
	.word 0xc8bc903a  ! 2221: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc89c903a  ! 2223: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CP_ATM_QUAD_LD731:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2225: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xcad4501a  ! 2227: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r5
NC_BLK_SEc732:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2229: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc76fa016  ! 2231: PREFETCH_I	prefetch	[%r30 + 0x0016], #one_write
	.word 0xca8c903a  ! 2233: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CP_AIUP733:
	.word 0xca8e021a  ! 2235: LDUBA_R	lduba	[%r24, %r26] 0x10, %r5
	.word 0xca84903a  ! 2237: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
NC_NUC734:
	.word 0xcb85409a  ! 2239: LDFA_R	lda	[%r21, %r26], %f5
	.word 0xcb02a038  ! 2240: LDF_I	ld	[%r10, 0x0038], %f5
	.word 0xcad4913a  ! 2242: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xca83511a  ! 2243: LDUWA_R	lduwa	[%r13, %r26] 0x88, %r5
	.word 0xcb9b111a  ! 2244: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcac4903a  ! 2246: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
NC_PST_PRI735:
	.word 0xcbbbd95a  ! 2248: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcb9c913a  ! 2250: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcab4d13a  ! 2252: STHA_R	stha	%r5, [%r19 + %r26] 0x89
CP_PST_PRI736:
	.word 0xcbba981a  ! 2254: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_AIUS737:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 2256: STDA_R	stda	%r2, [%r30 + %r26] 0x23
	.word 0xcb9cd03a  ! 2258: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcafa901a  ! 2259: SWAPA_R	swapa	%r5, [%r10 + %r26] 0x80
CP_BIS_AIUP738:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 2261: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
CP_BIS_NUC739:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 2263: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
SHORT_FP_PRI740:
	.word 0xcb9a9a5a  ! 2265: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xca84d03a  ! 2267: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
NC_BIS_AIUP741:
	.word 0xc4f6445a  ! 2269: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xcab4913a  ! 2271: STHA_R	stha	%r5, [%r18 + %r26] 0x89
CHANGE_USER742:
	ta	T_CHANGE_NONPRIV
CHANGE_R26743:
	add	%r26,	%r27,	%r26
CP_BIS_PRI743:
	and	%r26,	%r28,	%r26
	.word 0xc49b1c5a  ! 2273: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
NC_BIS_SEC744:
	.word 0xd0acdc7a  ! 2275: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
	.word 0xcaa4d03a  ! 2277: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
NC_BLK_SEc745:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2279: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_PRIV746:
	ta	T_CHANGE_PRIV
CHANGE_R26747:
	add	%r26,	%r27,	%r26
CP_BIS_NUC747:
	and	%r26,	%r28,	%r26
	.word 0xd09d05fa  ! 2281: LDDA_R	ldda	[%r20, %r26] 0x2f, %r8
SHORT_FP_PRI748:
	.word 0xcbbada5a  ! 2283: STDFA_R	stda	%f5, [%r26, %r11]
NC_BLK_SEc749:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2285: LDDFA_R	ldda	[%r19, %r26], %f16
NC_PST_PRI750:
	.word 0xcbbbd81a  ! 2287: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xc83ae038  ! 2288: STD_I	std	%r4, [%r11 + 0x0038]
	.word 0xca4b401a  ! 2289: LDSB_R	ldsb	[%r13 + %r26], %r5
	.word 0xcadbd01a  ! 2291: LDXA_R	ldxa	[%r15, %r26] 0x80, %r5
SET_TL1_751:
	ta	T_CHANGE_TO_TL1
CHANGE_R26752:
	add	%r26,	%r27,	%r26
NC_BIS_NUC752:
	.word 0xd0bd45fa  ! 2293: STDA_R	stda	%r8, [%r21 + %r26] 0x2f
	.word 0xcab4d03a  ! 2295: STHA_R	stha	%r5, [%r19 + %r26] 0x81
	.word 0xcba4101a  ! 2297: STFA_R	sta	%f5, [%r26, %r16]
CP_AIUP753:
	.word 0xcac6021a  ! 2299: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r5
NC_PST_PRI754:
	.word 0xcbbbd81a  ! 2301: STDFA_R	stda	%f5, [%r26, %r15]
CP_NUC755:
	.word 0xcaed009a  ! 2303: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x04
	.word 0xcadc913a  ! 2305: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
NC_AIUS756:
	.word 0xca8fc23a  ! 2307: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcbbb501a  ! 2308: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcb1a801a  ! 2309: LDDF_R	ldd	[%r10, %r26], %f5
	.word 0xcbbbd01a  ! 2311: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xc89c903a  ! 2313: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
NC_AIUP757:
	.word 0xcbbe421a  ! 2315: STDFA_R	stda	%f5, [%r26, %r25]
NC_PST_PRI758:
	.word 0xcbbb995a  ! 2317: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xca93d11a  ! 2319: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
	.word 0xcaf3901a  ! 2321: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
BLK_PRI759:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 2323: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xca83901a  ! 2325: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r5
CP_AIUS760:
	.word 0xca97823a  ! 2327: LDUHA_R	lduha	[%r30, %r26] 0x11, %r5
SET_TL0_761:
	ta	T_CHANGE_TO_TL0
CHANGE_R26762:
	add	%r26,	%r27,	%r26
NC_BIS_SEC762:
	.word 0xc4acdd7a  ! 2329: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
NC_BIS_SEC763:
	.word 0xc4acdc7a  ! 2331: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc89cd03a  ! 2333: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
NC_BLK_SEc764:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2335: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_SEC765:
	.word 0xc4f4dc7a  ! 2337: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xcab4913a  ! 2339: STHA_R	stha	%r5, [%r18 + %r26] 0x89
NC_BLK_SEc766:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2341: LDDFA_R	ldda	[%r19, %r26], %f0
NC_PST_PRI767:
	.word 0xcbbc189a  ! 2343: STDFA_R	stda	%f5, [%r26, %r16]
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC769:
	.word 0xcad5409a  ! 2345: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r5
	.word 0xca2aa03b  ! 2346: STB_I	stb	%r5, [%r10 + 0x003b]
	.word 0xca6b401a  ! 2347: LDSTUB_R	ldstub	%r5, [%r13 + %r26]
	.word 0xcb3b2038  ! 2348: STDF_I	std	%f5, [0x0038, %r12]
CP_BIS_AIUP770:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 2350: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
	.word 0xc83b6038  ! 2351: STD_I	std	%r4, [%r13 + 0x0038]
CP_AIUP771:
	.word 0xcade031a  ! 2353: LDXA_R	ldxa	[%r24, %r26] 0x18, %r5
	.word 0xcab4d03a  ! 2355: STHA_R	stha	%r5, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD772:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2357: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
CP_PST_PRI773:
	.word 0xcbba989a  ! 2359: STDFA_R	stda	%f5, [%r26, %r10]
NC_SHORT_FP_SEC774:
	.word 0xcb9cdb3a  ! 2361: LDDFA_R	ldda	[%r19, %r26], %f5
CP_BIS_AIUS775:
	and	%r26,	%r28,	%r26
	.word 0xcc9f857a  ! 2363: LDDA_R	ldda	[%r30, %r26] 0x2b, %r6
NC_NUC776:
	.word 0xcb9d409a  ! 2365: LDDFA_R	ldda	[%r21, %r26], %f5
	.word 0xcb1b001a  ! 2366: LDDF_R	ldd	[%r12, %r26], %f5
	.word 0xcaa3101a  ! 2367: STWA_R	stwa	%r5, [%r12 + %r26] 0x80
	.word 0xca72a038  ! 2368: STX_I	stx	%r5, [%r10 + 0x0038]
	.word 0xca22801a  ! 2369: STW_R	stw	%r5, [%r10 + %r26]
	.word 0xcadcd03a  ! 2371: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
NC_BIS_SEC777:
	.word 0xc4a4dc7a  ! 2373: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xcab4101a  ! 2375: STHA_R	stha	%r5, [%r16 + %r26] 0x80
NC_BIS_SEC778:
	.word 0xc8a4dc7a  ! 2377: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xcacbd01a  ! 2379: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r5
NC_AIUP779:
	.word 0xcbbe421a  ! 2381: STDFA_R	stda	%f5, [%r26, %r25]
NC_AIUP780:
	.word 0xc8be421a  ! 2383: STDA_R	stda	%r4, [%r25 + %r26] 0x10
	.word 0xcacc111a  ! 2385: LDSBA_R	ldsba	[%r16, %r26] 0x88, %r5
	.word 0xc89b901a  ! 2387: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
BLK_PRI781:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2389: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xcacbd11a  ! 2391: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r5
NC_BIS_AIUP782:
	.word 0xccb6455a  ! 2393: STHA_R	stha	%r6, [%r25 + %r26] 0x2a
WR_LEASI_783:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_784:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcab4511a  ! 2396: STHA_R	stha	%r5, [%r17 + %r26] 0x88
	.word 0xca736038  ! 2397: STX_I	stx	%r5, [%r13 + 0x0038]
CP_ATM_QUAD_LD785:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2399: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
NC_BIS_AIUS786:
	.word 0xc4a7c57a  ! 2401: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
CHANGE_USER787:
	ta	T_CHANGE_NONPRIV
CHANGE_R26788:
	add	%r26,	%r27,	%r26
CP_BIS_PRI788:
	and	%r26,	%r28,	%r26
	.word 0xd0b35d5a  ! 2403: STHA_R	stha	%r8, [%r13 + %r26] 0xea
CP_PST_PRI789:
	.word 0xcbba995a  ! 2405: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca8cd13a  ! 2407: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcbf2a01a  ! 2408: CASXA_R	casxa	[%r10]%asi, %r26, %r5
	.word 0xcaac913a  ! 2410: STBA_R	stba	%r5, [%r18 + %r26] 0x89
	.word 0xcba4903a  ! 2412: STFA_R	sta	%f5, [%r26, %r18]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC791:
	.word 0xc8bd409a  ! 2414: STDA_R	stda	%r4, [%r21 + %r26] 0x04
CP_AIUP792:
	.word 0xca96021a  ! 2416: LDUHA_R	lduha	[%r24, %r26] 0x10, %r5
CHANGE_USER793:
	ta	T_CHANGE_NONPRIV
CHANGE_R26794:
	add	%r26,	%r27,	%r26
CP_BIS_PRI794:
	and	%r26,	%r28,	%r26
	.word 0xccaadc5a  ! 2418: STBA_R	stba	%r6, [%r11 + %r26] 0xe2
	.word 0xcaa4913a  ! 2420: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS796:
	.word 0xca8f823a  ! 2422: LDUBA_R	lduba	[%r30, %r26] 0x11, %r5
CHANGE_USER797:
	ta	T_CHANGE_NONPRIV
CHANGE_R26798:
	add	%r26,	%r27,	%r26
NC_BIS_PRI798:
	.word 0xd0bc5c5a  ! 2424: STDA_R	stda	%r8, [%r17 + %r26] 0xe2
	.word 0xcaeb501a  ! 2425: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x80
NC_SHORT_FP_SEC799:
	.word 0xcbbcda3a  ! 2427: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcad4903a  ! 2429: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcacb911a  ! 2431: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC801:
	.word 0xcacd019a  ! 2433: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r5
	.word 0xca8ad11a  ! 2434: LDUBA_R	lduba	[%r11, %r26] 0x88, %r5
	.word 0xcb9cd13a  ! 2436: LDDFA_R	ldda	[%r19, %r26], %f5
CP_NUC802:
	.word 0xcac5009a  ! 2438: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xca84913a  ! 2440: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r5
	.word 0xcb9a911a  ! 2441: LDDFA_R	ldda	[%r10, %r26], %f5
CHANGE_USER803:
	ta	T_CHANGE_NONPRIV
CHANGE_R26804:
	add	%r26,	%r27,	%r26
NC_BIS_PRI804:
	.word 0xccbbdc5a  ! 2443: STDA_R	stda	%r6, [%r15 + %r26] 0xe2
	.word 0xc89c501a  ! 2445: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
CP_BIS_QUAD_LD805:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2447: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_SEC806:
	.word 0xc8b4dc7a  ! 2449: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
NC_PST_PRI807:
	.word 0xcbbb995a  ! 2451: STDFA_R	stda	%f5, [%r26, %r14]
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC809:
	.word 0xc8bd009a  ! 2453: STDA_R	stda	%r4, [%r20 + %r26] 0x04
CP_AIUP810:
	.word 0xcab6021a  ! 2455: STHA_R	stha	%r5, [%r24 + %r26] 0x10
SET_TL1_811:
	ta	T_CHANGE_TO_TL1
CHANGE_R26812:
	add	%r26,	%r27,	%r26
NC_BIS_NUC812:
	.word 0xc4ad45fa  ! 2457: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
NC_AIUS813:
	.word 0xca8fc23a  ! 2459: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcaf3101a  ! 2460: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
BLK_PRI814:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2462: STDFA_R	stda	%f16, [%r26, %r10]
CP_AIUS815:
	.word 0xcab7823a  ! 2464: STHA_R	stha	%r5, [%r30 + %r26] 0x11
NC_SHORT_FP_SEC816:
	.word 0xcbbcda7a  ! 2466: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcba2901a  ! 2467: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xca7a801a  ! 2468: SWAP_R	swap	%r5, [%r10 + %r26]
	.word 0xcaab911a  ! 2470: STBA_R	stba	%r5, [%r14 + %r26] 0x88
CP_BIS_AIUP817:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2472: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xcb23001a  ! 2473: STF_R	st	%f5, [%r26, %r12]
SET_TL0_818:
	ta	T_CHANGE_TO_TL0
WR_LEASI_819:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_820:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcb83101a  ! 2475: LDFA_R	lda	[%r12, %r26], %f5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS822:
	.word 0xcba7c33a  ! 2477: STFA_R	sta	%f5, [%r26, %r31]
	.word 0xca84d03a  ! 2479: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xcbbc913a  ! 2481: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcadb101a  ! 2482: LDXA_R	ldxa	[%r12, %r26] 0x80, %r5
CHANGE_USER823:
	ta	T_CHANGE_NONPRIV
CHANGE_R26824:
	add	%r26,	%r27,	%r26
NC_BIS_PRI824:
	.word 0xc4bb9c5a  ! 2484: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
CHANGE_PRIV825:
	ta	T_CHANGE_PRIV
CHANGE_R26826:
	add	%r26,	%r27,	%r26
CP_BIS_NUC826:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 2486: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
	.word 0xcad4501a  ! 2488: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r5
BLK_PRI827:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2490: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xca94d13a  ! 2492: LDUHA_R	lduha	[%r19, %r26] 0x89, %r5
SHORT_FP_PRI828:
	.word 0xcbba9a1a  ! 2494: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcb9b515a  ! 2495: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xcac4501a  ! 2497: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
	.word 0xca2aa03b  ! 2498: STB_I	stb	%r5, [%r10 + 0x003b]
NC_BLK_SEc829:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2500: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xcaa4913a  ! 2502: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
	.word 0xca94d03a  ! 2504: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xcb84913a  ! 2506: LDFA_R	lda	[%r18, %r26], %f5
SHORT_FP_PRI830:
	.word 0xcbba9a1a  ! 2508: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcaf4903a  ! 2510: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcb84111a  ! 2512: LDFA_R	lda	[%r16, %r26], %f5
	.word 0xcbbc111a  ! 2514: STDFA_R	stda	%f5, [%r26, %r16]
CP_BIS_QUAD_LD831:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 2516: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xcb02c01a  ! 2517: LDF_R	ld	[%r11, %r26], %f5
	.word 0xcad3901a  ! 2519: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
CP_PST_PRI832:
	.word 0xcbba981a  ! 2521: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcbbcd13a  ! 2523: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcaac913a  ! 2525: STBA_R	stba	%r5, [%r18 + %r26] 0x89
	.word 0xcac3501a  ! 2526: LDSWA_R	ldswa	[%r13, %r26] 0x80, %r5
	.word 0xca84d03a  ! 2528: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xca8c903a  ! 2530: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CP_AIUP833:
	.word 0xca86031a  ! 2532: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r5
	.word 0xcb1b6038  ! 2533: LDDF_I	ldd	[%r13, 0x0038], %f5
SHORT_FP_PRI834:
	.word 0xcbbb5b1a  ! 2535: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcb3b2038  ! 2536: STDF_I	std	%f5, [0x0038, %r12]
NC_AIUP835:
	.word 0xcaa6431a  ! 2538: STWA_R	stwa	%r5, [%r25 + %r26] 0x18
CHANGE_USER836:
	ta	T_CHANGE_NONPRIV
CHANGE_R26837:
	add	%r26,	%r27,	%r26
CP_BIS_PRI837:
	and	%r26,	%r28,	%r26
	.word 0xcca2dc5a  ! 2540: STWA_R	stwa	%r6, [%r11 + %r26] 0xe2
	.word 0xca236038  ! 2541: STW_I	stw	%r5, [%r13 + 0x0038]
	.word 0xcaf4903a  ! 2543: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
NC_SHORT_FP_SEC838:
	.word 0xcbbcda7a  ! 2545: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xca94903a  ! 2547: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcaacd03a  ! 2549: STBA_R	stba	%r5, [%r19 + %r26] 0x81
SHORT_FP_PRI839:
	.word 0xcbba9a5a  ! 2551: STDFA_R	stda	%f5, [%r26, %r10]
NC_BIS_SEC840:
	.word 0xd0bcdc7a  ! 2553: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xca93d01a  ! 2555: LDUHA_R	lduha	[%r15, %r26] 0x80, %r5
NC_PST_PRI841:
	.word 0xcbbbd89a  ! 2557: STDFA_R	stda	%f5, [%r26, %r15]
NC_BIS_SEC842:
	.word 0xc4a4dc7a  ! 2559: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xca436038  ! 2560: LDSW_I	ldsw	[%r13 + 0x0038], %r5
NC_SHORT_FP_SEC843:
	.word 0xcbbcda3a  ! 2562: STDFA_R	stda	%f5, [%r26, %r19]
CP_PST_PRI844:
	.word 0xcbba981a  ! 2564: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcadb901a  ! 2566: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
	.word 0xcb9b101a  ! 2567: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcbf2a01a  ! 2568: CASXA_R	casxa	[%r10]%asi, %r26, %r5
	.word 0xcaeb501a  ! 2569: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x80
CHANGE_PRIV845:
	ta	T_CHANGE_PRIV
CHANGE_R26846:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS846:
	.word 0xc8bfc47a  ! 2571: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xcadcd03a  ! 2573: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CHANGE_USER847:
	ta	T_CHANGE_NONPRIV
CHANGE_R26848:
	add	%r26,	%r27,	%r26
CP_BIS_PRI848:
	and	%r26,	%r28,	%r26
	.word 0xd0f31d5a  ! 2575: STXA_R	stxa	%r8, [%r12 + %r26] 0xea
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS850:
	.word 0xca97c23a  ! 2577: LDUHA_R	lduha	[%r31, %r26] 0x11, %r5
	.word 0xcacad11a  ! 2578: LDSBA_R	ldsba	[%r11, %r26] 0x88, %r5
CP_ATM_QUAD_LD851:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2580: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xcbbb101a  ! 2581: STDFA_R	stda	%f5, [%r26, %r12]
CP_AIUP852:
	.word 0xca96021a  ! 2583: LDUHA_R	lduha	[%r24, %r26] 0x10, %r5
CHANGE_USER853:
	ta	T_CHANGE_NONPRIV
CHANGE_R26854:
	add	%r26,	%r27,	%r26
NC_BIS_PRI854:
	.word 0xc8ab9c5a  ! 2585: STBA_R	stba	%r4, [%r14 + %r26] 0xe2
	.word 0xcaa4d03a  ! 2587: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xc8ba901a  ! 2588: STDA_R	stda	%r4, [%r10 + %r26] 0x80
CP_BIS_QUAD_LD855:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 2590: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xcbbbd01a  ! 2592: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xc89cd03a  ! 2594: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xcb84d03a  ! 2596: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcb9c903a  ! 2598: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcba2d11a  ! 2599: STFA_R	sta	%f5, [%r26, %r11]
	.word 0xcaac903a  ! 2601: STBA_R	stba	%r5, [%r18 + %r26] 0x81
WR_LEASI_856:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_857:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_PRIV858:
	ta	T_CHANGE_PRIV
CHANGE_R26859:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD859:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2604: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xcadbd01a  ! 2606: LDXA_R	ldxa	[%r15, %r26] 0x80, %r5
	.word 0xcb3a801a  ! 2607: STDF_R	std	%f5, [%r26, %r10]
CP_AIUS860:
	.word 0xcb9f823a  ! 2609: LDDFA_R	ldda	[%r30, %r26], %f5
CP_AIUS861:
	.word 0xca87833a  ! 2611: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r5
	.word 0xcaa4d03a  ! 2613: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xcad4d03a  ! 2615: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
CP_ATM_QUAD_LD862:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2617: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xcadc903a  ! 2619: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
CP_BIS_NUC863:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 2621: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xcba2d11a  ! 2622: STFA_R	sta	%f5, [%r26, %r11]
CP_BIS_AIUP864:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2624: STHA_R	stha	%r6, [%r24 + %r26] 0x22
SHORT_FP_PRI865:
	.word 0xcb9b5a1a  ! 2626: LDDFA_R	ldda	[%r13, %r26], %f5
CP_BIS_NUC866:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2628: STBA_R	stba	%r4, [%r20 + %r26] 0x27
	.word 0xcba4d03a  ! 2630: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcaa3901a  ! 2632: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
CP_NUC867:
	.word 0xcaed019a  ! 2634: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x0c
	.word 0xcac3d11a  ! 2636: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r5
	.word 0xcaf4d13a  ! 2638: STXA_R	stxa	%r5, [%r19 + %r26] 0x89
NC_BIS_SEC868:
	.word 0xc4a4dd7a  ! 2640: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
	.word 0xcb84903a  ! 2642: LDFA_R	lda	[%r18, %r26], %f5
NC_AIUP869:
	.word 0xc89e431a  ! 2644: LDDA_R	ldda	[%r25, %r26] 0x18, %r4
CP_BIS_QUAD_LD870:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 2646: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
	.word 0xcad4903a  ! 2648: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
NC_PST_PRI871:
	.word 0xcbbc589a  ! 2650: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xcaccd13a  ! 2652: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
CHANGE_USER872:
	ta	T_CHANGE_NONPRIV
CHANGE_R26873:
	add	%r26,	%r27,	%r26
CP_BIS_PRI873:
	and	%r26,	%r28,	%r26
	.word 0xccb2dd5a  ! 2654: STHA_R	stha	%r6, [%r11 + %r26] 0xea
SHORT_FP_PRI874:
	.word 0xcbbada5a  ! 2656: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaf3901a  ! 2658: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC876:
	.word 0xca85419a  ! 2660: LDUWA_R	lduwa	[%r21, %r26] 0x0c, %r5
	.word 0xcba3501a  ! 2661: STFA_R	sta	%f5, [%r26, %r13]
	.word 0xcba2d01a  ! 2662: STFA_R	sta	%f5, [%r26, %r11]
NC_PST_PRI877:
	.word 0xcbbbd91a  ! 2664: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcafb501a  ! 2665: SWAPA_R	swapa	%r5, [%r13 + %r26] 0x80
	.word 0xcbbcd03a  ! 2667: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcba4501a  ! 2669: STFA_R	sta	%f5, [%r26, %r17]
	.word 0xcac4101a  ! 2671: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r5
	.word 0xca12801a  ! 2672: LDUH_R	lduh	[%r10 + %r26], %r5
	.word 0xcb9b501a  ! 2673: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xca0b001a  ! 2674: LDUB_R	ldub	[%r12 + %r26], %r5
NC_PST_PRI878:
	.word 0xcbbb985a  ! 2676: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcb9c101a  ! 2678: LDDFA_R	ldda	[%r16, %r26], %f5
CHANGE_CLE879:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
BLK_PRI880:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2681: LDDFA_R	ldda	[%r11, %r26], %f0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP882:
	.word 0xcbbe021a  ! 2683: STDFA_R	stda	%f5, [%r26, %r24]
CP_ATM_QUAD_LD883:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2685: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
CP_ATM_QUAD_LD884:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2687: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
NC_BIS_SEC885:
	.word 0xc8acdd7a  ! 2689: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
NC_BIS_AIUP886:
	.word 0xc4ae455a  ! 2691: STBA_R	stba	%r2, [%r25 + %r26] 0x2a
	.word 0xcbbc913a  ! 2693: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcbbad01a  ! 2694: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcb9a901a  ! 2695: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcb84d03a  ! 2697: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcaaad01a  ! 2698: STBA_R	stba	%r5, [%r11 + %r26] 0x80
	.word 0xca4b401a  ! 2699: LDSB_R	ldsb	[%r13 + %r26], %r5
SET_TL1_887:
	ta	T_CHANGE_TO_TL1
CHANGE_R26888:
	add	%r26,	%r27,	%r26
NC_BIS_NUC888:
	.word 0xccf544fa  ! 2701: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
CP_BIS_QUAD_LD889:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2703: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CP_BIS_AIUS890:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 2705: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
SET_TL0_891:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI892:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9d5a  ! 2707: STBA_R	stba	%r2, [%r10 + %r26] 0xea
CHANGE_PRIV893:
	ta	T_CHANGE_PRIV
CHANGE_R26894:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD894:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2709: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
CHANGE_USER895:
	ta	T_CHANGE_NONPRIV
CHANGE_R26896:
	mov	%g0,	%r26
NC_BIS_PRI896:
	.word 0xc8bb9d5a  ! 2711: STDA_R	stda	%r4, [%r14 + %r26] 0xea
NC_PST_PRI897:
	.word 0xcbbbd99a  ! 2713: STDFA_R	stda	%f5, [%r26, %r15]
CHANGE_PRIV898:
	ta	T_CHANGE_PRIV
CHANGE_R26899:
	add	%r26,	%r27,	%r26
CP_BIS_NUC899:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 2715: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xcaa4903a  ! 2717: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
CHANGE_TLE900:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV901:
	ta	T_CHANGE_PRIV
CHANGE_R26902:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP902:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 2720: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xcaf4903a  ! 2722: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcb9b515a  ! 2723: LDDFA_R	ldda	[%r13, %r26], %f5
CP_BIS_NUC903:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2725: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
	.word 0xcacb901a  ! 2727: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r5
	.word 0xcbbc903a  ! 2729: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xca94903a  ! 2731: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xc8bc913a  ! 2733: STDA_R	stda	%r4, [%r18 + %r26] 0x89
	.word 0xcacbd01a  ! 2735: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r5
	.word 0xca12801a  ! 2736: LDUH_R	lduh	[%r10 + %r26], %r5
CHANGE_TLE904:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcb9cd13a  ! 2739: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_PRIV905:
	ta	T_CHANGE_PRIV
CHANGE_R26906:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD906:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 2741: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
BLK_PRI907:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2743: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xca8cd03a  ! 2745: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
CP_ATM_QUAD_LD908:
	and	%r26,	%r29,	%r26
	.word 0xc89b459a  ! 2747: LDDA_R	ldda	[%r13, %r26] 0x2c, %r4
	.word 0xcba4903a  ! 2749: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcada911a  ! 2750: LDXA_R	ldxa	[%r10, %r26] 0x88, %r5
	.word 0xcb22801a  ! 2751: STF_R	st	%f5, [%r26, %r10]
	.word 0xc89c903a  ! 2753: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xcb9cd03a  ! 2755: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca8c903a  ! 2757: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xcafb501a  ! 2758: SWAPA_R	swapa	%r5, [%r13 + %r26] 0x80
CHANGE_R26909:
	add	%r26,	%r27,	%r26
CP_BIS_SEC909:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 2760: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
	.word 0xc8bb511a  ! 2761: STDA_R	stda	%r4, [%r13 + %r26] 0x88
NC_BIS_AIUP910:
	.word 0xc4ae445a  ! 2763: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUP911:
	.word 0xccae445a  ! 2765: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xcba4d13a  ! 2767: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcac4101a  ! 2769: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r5
WR_LEASI_912:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_913:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_QUAD_LD914:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 2772: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
NC_AIUS915:
	.word 0xcac7c23a  ! 2774: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r5
	.word 0xca93901a  ! 2776: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
CHANGE_USER916:
	ta	T_CHANGE_NONPRIV
CHANGE_R26917:
	add	%r26,	%r27,	%r26
CP_BIS_PRI917:
	and	%r26,	%r28,	%r26
	.word 0xd0b31c5a  ! 2778: STHA_R	stha	%r8, [%r12 + %r26] 0xe2
	.word 0xcb3b001a  ! 2779: STDF_R	std	%f5, [%r26, %r12]
CHANGE_PRIV918:
	ta	T_CHANGE_PRIV
CHANGE_R26919:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD919:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 2781: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
	.word 0xcab4903a  ! 2783: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xcbe2a01a  ! 2784: CASA_R	casa	[%r10] %asi, %r26, %r5
NC_BIS_AIUP920:
	.word 0xc4a6445a  ! 2786: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
NC_BLK_SEc921:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2788: STDFA_R	stda	%f16, [%r26, %r19]
BLK_PRI922:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 2790: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc89c111a  ! 2792: LDDA_R	ldda	[%r16, %r26] 0x88, %r4
NC_AIUS923:
	.word 0xcb87c23a  ! 2794: LDFA_R	lda	[%r31, %r26], %f5
CP_AIUS924:
	.word 0xca97823a  ! 2796: LDUHA_R	lduha	[%r30, %r26] 0x11, %r5
CHANGE_R26925:
	add	%r26,	%r27,	%r26
CP_BIS_SEC925:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9d7a  ! 2798: STBA_R	stba	%r4, [%r18 + %r26] 0xeb
NC_NUC926:
	.word 0xca85409a  ! 2800: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r5
	.word 0xc89c903a  ! 2802: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CP_AIUP927:
	.word 0xcad6031a  ! 2804: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r5
NC_SHORT_FP_SEC928:
	.word 0xcb9cdb7a  ! 2806: LDDFA_R	ldda	[%r19, %r26], %f5
NC_NUC929:
	.word 0xcacd419a  ! 2808: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r5
	.word 0xcad4913a  ! 2810: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcaf4903a  ! 2812: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcad4111a  ! 2814: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r5
NC_NUC930:
	.word 0xcb85409a  ! 2816: LDFA_R	lda	[%r21, %r26], %f5
CP_BIS_QUAD_LD931:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2818: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_PST_PRI932:
	.word 0xcbbb599a  ! 2820: STDFA_R	stda	%f5, [%r26, %r13]
CHANGE_USER933:
	ta	T_CHANGE_NONPRIV
CHANGE_R26934:
	mov	%g0,	%r26
NC_BIS_PRI934:
	.word 0xc4bc5c5a  ! 2822: STDA_R	stda	%r2, [%r17 + %r26] 0xe2
NC_PST_PRI935:
	.word 0xcbbc199a  ! 2824: STDFA_R	stda	%f5, [%r26, %r16]
SET_TL1_936:
	ta	T_CHANGE_TO_TL1
CHANGE_R26937:
	add	%r26,	%r27,	%r26
NC_BIS_NUC937:
	.word 0xc4a544fa  ! 2826: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xca8c903a  ! 2828: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xca72801a  ! 2829: STX_R	stx	%r5, [%r10 + %r26]
NC_AIUS938:
	.word 0xcaafc23a  ! 2831: STBA_R	stba	%r5, [%r31 + %r26] 0x11
CP_AIUS939:
	.word 0xcba7833a  ! 2833: STFA_R	sta	%f5, [%r26, %r30]
SET_TL0_940:
	ta	T_CHANGE_TO_TL0
CHANGE_R26941:
	add	%r26,	%r27,	%r26
NC_BIS_SEC941:
	.word 0xcca4dc7a  ! 2835: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xcbe3601a  ! 2836: CASA_R	casa	[%r13] %asi, %r26, %r5
CHANGE_PRIV942:
	ta	T_CHANGE_PRIV
CHANGE_R26943:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP943:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2838: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xcad4d03a  ! 2840: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xca0ac01a  ! 2841: LDUB_R	ldub	[%r11 + %r26], %r5
	.word 0xcadc913a  ! 2843: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CP_BIS_QUAD_LD944:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 2845: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xc8bc913a  ! 2847: STDA_R	stda	%r4, [%r18 + %r26] 0x89
CHANGE_USER945:
	ta	T_CHANGE_NONPRIV
CHANGE_R26946:
	add	%r26,	%r27,	%r26
CP_BIS_PRI946:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 2849: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xcac4903a  ! 2851: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcbbcd03a  ! 2853: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcab4111a  ! 2855: STHA_R	stha	%r5, [%r16 + %r26] 0x88
	.word 0xca22c01a  ! 2856: STW_R	stw	%r5, [%r11 + %r26]
NC_SHORT_FP_SEC947:
	.word 0xcbbcdb3a  ! 2858: STDFA_R	stda	%f5, [%r26, %r19]
CHANGE_PRIV948:
	ta	T_CHANGE_PRIV
CHANGE_R26949:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS949:
	.word 0xc8b7c47a  ! 2860: STHA_R	stha	%r4, [%r31 + %r26] 0x23
CP_AIUP950:
	.word 0xcb86031a  ! 2862: LDFA_R	lda	[%r24, %r26], %f5
CP_BIS_AIUP951:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 2864: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
	.word 0xcaa4d03a  ! 2866: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CP_BIS_NUC952:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 2868: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
SET_TL1_953:
	ta	T_CHANGE_TO_TL1
CHANGE_R26954:
	add	%r26,	%r27,	%r26
NC_BIS_NUC954:
	.word 0xc4ad45fa  ! 2870: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
NC_BIS_NUC955:
	.word 0xd0a544fa  ! 2872: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
	.word 0xcadcd03a  ! 2874: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CP_BIS_AIUS956:
	and	%r26,	%r28,	%r26
	.word 0xd0bf857a  ! 2876: STDA_R	stda	%r8, [%r30 + %r26] 0x2b
	.word 0xcba3911a  ! 2878: STFA_R	sta	%f5, [%r26, %r14]
NC_BIS_NUC957:
	.word 0xc4f544fa  ! 2880: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD958:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 2882: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
SET_TL0_959:
	ta	T_CHANGE_TO_TL0
CHANGE_R26960:
	add	%r26,	%r27,	%r26
NC_BIS_SEC960:
	.word 0xccacdd7a  ! 2884: STBA_R	stba	%r6, [%r19 + %r26] 0xeb
	.word 0xcac3d01a  ! 2886: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r5
NC_SHORT_FP_SEC961:
	.word 0xcbbcda3a  ! 2888: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcba2911a  ! 2889: STFA_R	sta	%f5, [%r26, %r10]
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP963:
	.word 0xcace031a  ! 2891: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r5
CP_PST_PRI964:
	.word 0xcbbb181a  ! 2893: STDFA_R	stda	%f5, [%r26, %r12]
NC_BIS_AIUP965:
	.word 0xd0be445a  ! 2895: STDA_R	stda	%r8, [%r25 + %r26] 0x22
BLK_PRI966:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 2897: LDDFA_R	ldda	[%r13, %r26], %f16
SET_TL1_967:
	ta	T_CHANGE_TO_TL1
CHANGE_R26968:
	add	%r26,	%r27,	%r26
NC_BIS_NUC968:
	.word 0xc4bd45fa  ! 2899: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
	.word 0xcacb105a  ! 2900: LDSBA_R	ldsba	[%r12, %r26] 0x82, %r5
CHANGE_R26969:
	add	%r26,	%r27,	%r26
CP_BIS_SEC969:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 2902: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
NC_BLK_SEc970:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2904: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcb82905a  ! 2905: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcb9a905a  ! 2906: LDDFA_R	ldda	[%r10, %r26], %f5
CP_BIS_AIUP971:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 2908: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xcaac903a  ! 2910: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_AIUP972:
	.word 0xcad6431a  ! 2912: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r5
	.word 0xca84903a  ! 2914: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
CP_BIS_AIUS973:
	and	%r26,	%r28,	%r26
	.word 0xc8bf847a  ! 2916: STDA_R	stda	%r4, [%r30 + %r26] 0x23
	.word 0xcbbcd13a  ! 2918: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xc8bc501a  ! 2920: STDA_R	stda	%r4, [%r17 + %r26] 0x80
CHANGE_R26974:
	add	%r26,	%r27,	%r26
CP_BIS_SEC974:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9d7a  ! 2922: STBA_R	stba	%r2, [%r18 + %r26] 0xeb
	.word 0xcac4903a  ! 2924: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xca8c913a  ! 2926: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
	.word 0xcb83501a  ! 2927: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xca6b603b  ! 2928: LDSTUB_I	ldstub	%r5, [%r13 + 0x003b]
	.word 0xcaf4913a  ! 2930: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
	.word 0xca84d13a  ! 2932: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUP975:
	.word 0xcca6445a  ! 2934: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xc89c111a  ! 2936: LDDA_R	ldda	[%r16, %r26] 0x88, %r4
NC_BLK_SEc976:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2938: LDDFA_R	ldda	[%r19, %r26], %f0
CP_AIUS977:
	.word 0xcba7823a  ! 2940: STFA_R	sta	%f5, [%r26, %r30]
CP_ATM_QUAD_LD978:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 2942: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
CP_BIS_QUAD_LD979:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2944: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
NC_BIS_AIUP980:
	.word 0xc4b6445a  ! 2946: STHA_R	stha	%r2, [%r25 + %r26] 0x22
NC_AIUS981:
	.word 0xcaf7c23a  ! 2948: STXA_R	stxa	%r5, [%r31 + %r26] 0x11
	.word 0xca7b401a  ! 2949: SWAP_R	swap	%r5, [%r13 + %r26]
SET_TL0_982:
	ta	T_CHANGE_TO_TL0
CHANGE_R26983:
	add	%r26,	%r27,	%r26
NC_BIS_SEC983:
	.word 0xc4f4dd7a  ! 2951: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
NC_BIS_SEC984:
	.word 0xc4f4dc7a  ! 2953: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xcbbcd03a  ! 2955: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcac3d01a  ! 2957: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r5
CHANGE_PRIV985:
	ta	T_CHANGE_PRIV
CHANGE_R26986:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS986:
	.word 0xc4a7c57a  ! 2959: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
NC_BIS_SEC987:
	.word 0xc8f4dc7a  ! 2961: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
CP_BIS_AIUP988:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 2963: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
	.word 0xcadb911a  ! 2965: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
CP_AIUP989:
	.word 0xc8be031a  ! 2967: STDA_R	stda	%r4, [%r24 + %r26] 0x18
SET_TL1_990:
	ta	T_CHANGE_TO_TL1
CHANGE_R26991:
	add	%r26,	%r27,	%r26
NC_BIS_NUC991:
	.word 0xc4bd45fa  ! 2969: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
	.word 0xc89cd03a  ! 2971: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xca94d03a  ! 2973: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
BLK_PRI992:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 2975: STDFA_R	stda	%f16, [%r26, %r11]
SET_TL0_993:
	ta	T_CHANGE_TO_TL0
CHANGE_R26994:
	add	%r26,	%r27,	%r26
NC_BIS_SEC994:
	.word 0xc8a4dc7a  ! 2977: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xcb9c903a  ! 2979: LDDFA_R	ldda	[%r18, %r26], %f5
CHANGE_R26995:
	mov	%g0,	%r26
CP_BIS_SEC995:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 2981: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
	.word 0xcb1aa038  ! 2982: LDDF_I	ldd	[%r10, 0x0038], %f5
CHANGE_PRIV996:
	ta	T_CHANGE_PRIV
CHANGE_R26997:
	add	%r26,	%r27,	%r26
CP_BIS_NUC997:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 2984: STDA_R	stda	%r6, [%r20 + %r26] 0x27
	.word 0xcb3aa038  ! 2985: STDF_I	std	%f5, [0x0038, %r10]
	.word 0xca94903a  ! 2987: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcad4511a  ! 2989: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r5
NC_BIS_SEC998:
	.word 0xc8acdd7a  ! 2991: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
	.word 0xcacb911a  ! 2993: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r5
	.word 0xcaf4913a  ! 2995: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
NC_BIS_SEC999:
	.word 0xc4a4dd7a  ! 2997: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
CHANGE_USER1000:
	ta	T_CHANGE_NONPRIV
CHANGE_R261001:
	add	%r26,	%r27,	%r26
CP_BIS_PRI1001:
	and	%r26,	%r28,	%r26
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0xd424a27a55919e71
.xword 0xd704b991739e77f1
.xword 0xa41b026fa4e2f9be
.xword 0xe192f71256929a50
.xword 0xc18f48667ca2cfea
.xword 0xb71a99b5d2956ee2
.xword 0xc6e5658829f685da
.xword 0x9069c546091e2fc8
.xword 0x27f69562bd5ad040
.xword 0x16b412d9535d0b77
.xword 0x2bc1c97fdf69cd25
.xword 0x91e38dc7642f1fed
.xword 0xdd038e96fc26b49f
.xword 0x04f591e60249cfad
.xword 0xb6389dbee2bea105
.xword 0x58ab1be7f31b093c
.xword 0xd34b86cd1e3de181
.xword 0x9185ddf146dc05a7
.xword 0x5e245a8da7d87650
.xword 0x6c8f3140d6e36669
.xword 0xb40fe6049f830bf1
.xword 0x44ed89fb2b8b05a1
.xword 0x500b0efda25377e0
.xword 0x89a8d31746f0b999
.xword 0xf9f05cc8fe338704
.xword 0x216c9de8559e18ce
.xword 0x7c9b43e7d4d891b6
.xword 0x3677995ff6bcb271
.xword 0x43f2fb99f7f3d23a
.xword 0x85b35991ced10634
.xword 0x7410f803304d099d
.xword 0x8d7c1ccd1cae2b16



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
.xword 0x34011d9f870e618f

.xword 0xb6c487b82065b0a6

.xword 0x1f1210eacd19fe6c

.xword 0x4b830a56a0f6dd47

.xword 0x84fd2bb8b8438115

.xword 0xcc108833ab500e8b

.xword 0x522ea551e248b148

.xword 0xd317399c98ed33c3

.xword 0x074e7eeff098e79e

.xword 0x7a09db691efd790d

.xword 0x320d222e80f0e900

.xword 0xb4e183fe60bad3ee

.xword 0xea66f1333800c284

.xword 0x24db68869f8d8489

.xword 0x3a3f4ce4d9cfd5a3

.xword 0xdc874f20b3748225

.xword 0x110b1b43a71ebc61

.xword 0xff22189d123661b9

.xword 0xbce06f0ea3920c6f

.xword 0xce5ae2d28694adba

.xword 0xeb71a6400b0ed919

.xword 0xd9bb8698e9c136c7

.xword 0x03b0920049e6f275

.xword 0x903809cfa518149a

.xword 0x8504a1af58e65a04

.xword 0x1229684c45df4954

.xword 0xb0d3e85e030f9e69

.xword 0x8eaea7629d841401

.xword 0x718386fbe2e41f19

.xword 0xc11d581bb1f11550

.xword 0x36687554df94dd75

.xword 0x150a427ee1b502de




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
.xword 0x9430d5556cb8f0c4
.xword 0x8bacb55d5997462d
.xword 0xcf0452fba3368081
.xword 0x1933357e166a0273
.xword 0xe1cb05f072c20d29
.xword 0x3c4b484884aeb58a
.xword 0xacfedad58566bc06
.xword 0x6f05ee81275f6b36
.xword 0x8cd38baeb59b2605




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
.xword 0x7408ba7032109d39
.xword 0x9a5e6e2223e110bf
.xword 0x2981c3ceec82ff45
.xword 0x707d8ea53deba452
.xword 0x8890f387b7f5d17f
.xword 0xc8e58125c32943e1
.xword 0xb7edc330d83ebc89
.xword 0xbb6e8552fe429c06
.xword 0x2167e9169d2471ad




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
.xword 0x0b30ac9ba416766a
.xword 0xa5aa3dfae95aca98
.xword 0x7739a6ac15f3befc
.xword 0x966842f2026fb269
.xword 0x40470969b2e48623
.xword 0xbd40d983e2482c21
.xword 0xf694ffd6a7cc0ef4
.xword 0x96954a00a4933c19
.xword 0x7639d360408a84df




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
.xword 0x8b89fe5d65b6113d
.xword 0xfa36eb2f9eddb47f
.xword 0xf51a4931be2dcd2c
.xword 0xce2a502dae059f46
.xword 0xb03d52a1d49597fb
.xword 0x935cad1b679078dc
.xword 0x0ffb953257415339
.xword 0x0349ac0282c5220a
.xword 0x69a696316eee0a61




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
.xword 0x0e985337c2c621c2
.xword 0xe98298e1d6799634
.xword 0x283dbede16627784
.xword 0xd22392b6ae0ac5a6
.xword 0x06669c76561a0c43
.xword 0x5fc984f02d30453c
.xword 0x61f57568c09c2df2
.xword 0x87dca9b1e276fd78
.xword 0x766c8909f1683155




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
.xword 0xd3d4c81e4cf26eb1
.xword 0x9c982c81a5b5f024
.xword 0x8c78686635f5cf53
.xword 0x2ed4ac9dbd8b279d
.xword 0x86911294b38f2fca
.xword 0xa3c09b2407b29e54
.xword 0x7411df75da4f9c02
.xword 0x4a745ef5fd82e4af
.xword 0xcf023cb28a40eefe




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
.xword 0xfc1759e7fbbe9322
.xword 0x2f445a8d06f62d5d
.xword 0x19a47894f7fda68c
.xword 0x9a154ebcf1c60ced
.xword 0xcdc5944274f45c13
.xword 0xd7b032ac815b1e77
.xword 0xac60db4688927d97
.xword 0x9b82c8b8c12c397c
.xword 0xbf2b93c6feca2011




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
.xword 0xd6740ad57205e57f
.xword 0x4615fca4b3417f14
.xword 0x29f2311847036302
.xword 0x6a047656371c1284
.xword 0x74195f6f7fa33cd5
.xword 0xe466a70f4f556a5b
.xword 0x7d5cb9bc811705c0
.xword 0x3f02110d7a9b5304
.xword 0x6c32ee088eb474ae




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
.xword 0xe3b36133bd7d9b72
.xword 0xacb522689ddb6fb8
.xword 0xfc2f44dca0342468
.xword 0xf9c1c9a33f71abdb
.xword 0xb790cd4c6619094d
.xword 0x7a8840888f2f31da
.xword 0x6404b0c4dcbd5dc5
.xword 0x2655454a47e2dca7
.xword 0x8cfd7ab02c7263e3




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
.xword 0xf18d2bb48dbead72
.xword 0xab0f8fd52dfbfce5
.xword 0xbf53a1bf32166747
.xword 0x8b742f5c81fd8445
.xword 0x2020668ac5655feb
.xword 0xb615ac3ba2670441
.xword 0x6e4fb7ff70186021
.xword 0x86ed9f07db5becc1
.xword 0x2865285e125b8baa




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
.xword 0x8a21f11970dc43b2
.xword 0x85dc609d42be1755
.xword 0x1b7afec32495e2a6
.xword 0x351d131b7a24963a
.xword 0x18390f455eb2bb34
.xword 0xe3b5d50d3783addb
.xword 0x2d44b470b40b4fc1
.xword 0xd707b101fc9655fe
.xword 0xc1757b770a83a9eb




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
.xword 0x8c887b7b7c2e61d9
.xword 0x01b29671b5f9b424
.xword 0x204328ed80358930
.xword 0x21ffc75e4c41e1d8
.xword 0xd62cdbad77a3bd56
.xword 0x62fab70b8a9ff09d
.xword 0x1dadf7b6a090cc34
.xword 0x218beeb720dfa387
.xword 0x8d311b6a2b2ad287




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
.xword 0xbb96d675920eddad
.xword 0xc90e5eb38b4fd9ea
.xword 0x8e2b881320526d92
.xword 0x91870f5d16793021
.xword 0xeae574f2264a1c28
.xword 0x06b0cec07f18de45
.xword 0xe1a60d74b2b95dbb
.xword 0x62d0735c789425cd
.xword 0x9a30015199f50252




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
.xword 0x23babaff9029da27
.xword 0x438fe5c80fa75e42
.xword 0x559fef5fa532ba2c
.xword 0xe0634cc4bef27b0d
.xword 0x00f7f00d0229575d
.xword 0xec65f87e8f9ec595
.xword 0xb720a0c821ad9ba2
.xword 0xfcf814f903c03dfe
.xword 0xbd82cf11dee934a7




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
.xword 0x136848755a6e17d9
.xword 0x89965afb5d56b18f
.xword 0xe0d6ec3ba680f02d
.xword 0x0779d483da287bed
.xword 0xe875d4565bd6b826
.xword 0x592e7484c0307ac2
.xword 0x44c0715a6e10f177
.xword 0xb95d0444ac8b4100
.xword 0x2ff887df87225030




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
.xword 0xdc0fe2a320819f25
.xword 0xe4d761df9cdf713d
.xword 0x4c40232e45a97d4c
.xword 0xe0ec38cd9899a122
.xword 0xab2e7821fec6c681
.xword 0xad1f5cc326dd699d
.xword 0x630f5beea5378bae
.xword 0x29838303c77c8658
.xword 0x53313591f8e5c6e3




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
.xword 0xca9420330b8129f4
.xword 0xe51a57592d116fcf
.xword 0x4a09ab2a83236410
.xword 0xf44039ae5e9d1db1
.xword 0x98c13fea8b3ed7a9
.xword 0x0a00a561c9d38deb
.xword 0x96376ac5a18f4423
.xword 0x3a86e30dabe3106d
.xword 0xf854a1f714a7f420




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
.xword 0xe501b2b6f471f529
.xword 0x8c4648624309a80d
.xword 0xe4f508537d8d0069
.xword 0x664b06c096787df6
.xword 0x0bf90c0a3ee67c1e
.xword 0x3e69b27e89e4690b
.xword 0x00d11539009f492d
.xword 0xe1085f450d8f740f
.xword 0x9f329f08fefd429c




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
.xword 0x624430fa6a2794c8
.xword 0x2ab69bbfa20c9a41
.xword 0x62258936a6cab493
.xword 0xe0152fb61f409a86
.xword 0x032f18b494bf35da
.xword 0x1e856b77e6c3a9d2
.xword 0x923fc1f06d20aa97
.xword 0xd7b6574375559b23
.xword 0x1748067aad30b09a




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
.xword 0x5dacf01077ce5cfb
.xword 0x80aed91b3a0e953c
.xword 0x826f98cad9a8caa6
.xword 0xb27d2f1b4c09780b
.xword 0xc39104e3dab20b43
.xword 0x1b88610c90e7cdd0
.xword 0xebb1b9cd9341308a
.xword 0x214d6de341c799fa
.xword 0xa1be0697be4b9f51




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
.xword 0xd87775cf28975de4
.xword 0xe20d3c516ed1ddb1
.xword 0x1674bd74937ca87d
.xword 0x438a9be01ee02f29
.xword 0x8bf52a0eba3cb00e
.xword 0x9aa07d860765b23e
.xword 0x99ad6aedca17e0d8
.xword 0xec04b2e93d656859
.xword 0xb43649c4d90dcbce




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
.xword 0x1cb4e973b517ab11
.xword 0x1c7c78469a19e930
.xword 0x99533f99ea28c6a3
.xword 0x211bf373b867b7f0
.xword 0x4975efc7d4177fdf
.xword 0x5c0e66e1dff55131
.xword 0xcac4b87b3966fba8
.xword 0xbb4a2fd41cfec988
.xword 0x4fecd9584149025c




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
.xword 0x6a06fc58dbb5185a
.xword 0x5a6c8fc04fbe8d6c
.xword 0x39d0350b4bf9335a
.xword 0xcd87f1354c1fed8f
.xword 0x949ebc4be00323a2
.xword 0x8cb188d8c84fe0e8
.xword 0xad5effe4110687e1
.xword 0xffbcb2586607b7cd
.xword 0xc4f958026f2b582f




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
.xword 0x0ddde140a60fdf2e
.xword 0x62a593a30faa904e
.xword 0x7546907f60fe9d84
.xword 0x715341b279c34959
.xword 0x2f827783469db976
.xword 0x80f0e9667731046f
.xword 0x28d248577aecf149
.xword 0xbccf9aa79b3f5444
.xword 0x06448cb49f88ba6b




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
.xword 0x897052aa9f37ce00
.xword 0xa97e81cec78dfc69
.xword 0x267e4c7648bd539a
.xword 0x38994e7d6bb52f94
.xword 0xfa0f4f5d81cb97e3
.xword 0x0ed2ae269aaccc06
.xword 0x5b8cda2b86dee6d9
.xword 0x2a40676550909882
.xword 0xe6fb6e9e9ed59474




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
.xword 0xe6dde3dd3a380049
.xword 0xa70039fb45c84227
.xword 0x99ae54f73f40aa91
.xword 0xf8532293a61be2eb
.xword 0x72e67cbdd6825ae9
.xword 0xf8dd047ec88f96f5
.xword 0xba3dcc7a2eb73ae6
.xword 0x90f2248f338c2e45
.xword 0x6c3d48836011703f




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
.xword 0x7629f5e2e9753ceb
.xword 0xe51f735cf75a5628
.xword 0x89f199f4d59bdad0
.xword 0x5420420a25af18de
.xword 0x049aa5cfd9e39fd7
.xword 0x4c0caf3d75d62c1b
.xword 0x9796c4435c3f4c40
.xword 0x932eec128529628c
.xword 0x2b5849ad28e873f6




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
.xword 0x494d954cf6cf5ce2
.xword 0xb3827a466fdf4401
.xword 0xbf3037c805a26096
.xword 0x9382f3491232689f
.xword 0xf8651f1fcdc08b1a
.xword 0x2dbe4b59849f90be
.xword 0xd79eaf0cabbaf97c
.xword 0xf928cb2ad8db061a
.xword 0x0f533bf276195f14




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
.xword 0x3d3bec9964e387a1
.xword 0x495ae8306cd16930
.xword 0x0ba7273d5d73d0d8
.xword 0xe37e663aaa361891
.xword 0x39ef74f21a639aab
.xword 0x4e5158e248767048
.xword 0x76b616862b87ee6a
.xword 0xa4608df7bc73ec48
.xword 0xf6fc6b9077201137




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
.xword 0xc23e466a64a83de4
.xword 0xa67a68078f141fff
.xword 0x06c4a45557c19abd
.xword 0xb590cf3b06d895f5
.xword 0x6b1567468bcea9a6
.xword 0x139e30c9f3671d2e
.xword 0xa1bdd45ac8266c47
.xword 0xb18b8f8015285482
.xword 0x7c1c770f4017dba7




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
.xword 0xea5f3e958f332103
.xword 0xcb52dafc6a2dfa1c
.xword 0xfcc9471c24143071
.xword 0xd3c69b15d0453eb3
.xword 0xf325034080908184
.xword 0xaa56698dd3c03a5d
.xword 0x9276476344187570
.xword 0x063b6c6a7a9a7561
.xword 0xea3a75a3f4d4f1b1






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
.xword 0x5946d2b57bbec92b
.xword 0x679e2c788ceda2c2
.xword 0xd7a1e4dfd2a45f11
.xword 0x4e643f13d5fc314e
.xword 0xd289e9aeab8be813
.xword 0xb665c7369d5f584b
.xword 0xb78dc155212cde3f
.xword 0x02ef2502f3b77394



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
.xword 0xa971ac8696eebee4
.xword 0x177862d3bd3abdc9
.xword 0x59a6de1653388a84
.xword 0xfca406d020d4f001
.xword 0xaacba9f00fe662e1
.xword 0xce4eeaacb5097fb2
.xword 0x08d7ccfe3cfb100d
.xword 0xd7dd336307e7ae1b



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
.xword 0x0193946ea741cf76
.xword 0x13913341e258c376
.xword 0x7d10ffa276d89bd7
.xword 0x37870dada7a767ba
.xword 0xb3bf850b65ca1a13
.xword 0x07b3b9cc83953be6
.xword 0x8762a7bf0c4988f9
.xword 0x3c130b496d06c754



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
.xword 0xc53a1af0de16c87b
.xword 0x8c135597f7bc5d01
.xword 0xc37e72774d8a27a7
.xword 0x4a8c1e9cbbf6421e
.xword 0x51f65f1e93f4c12d
.xword 0x8a9301032b540c75
.xword 0x058fe21aee87a4f9
.xword 0x151b4508e23ccc30



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
.xword 0xf28001a249aa2436
.xword 0xfbc5148c800ceec0
.xword 0x6fbd591d3ef62845
.xword 0x08f36fa44076f288
.xword 0xb9a87835c52599de
.xword 0x68ff09014f71bc92
.xword 0xe9ca564ec2583fbc
.xword 0x908b35396491cfdd



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
.xword 0xf044465aec7082e8
.xword 0xb0eab3f2e45328fc
.xword 0x41468beb8da6ca4b
.xword 0xa0f2763d66e76719
.xword 0x891c0f55786bd904
.xword 0x8507d47082e57725
.xword 0x215b6f465d098abc
.xword 0xf453a92d43c48005



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
.xword 0x341ecc15e41ec30d
.xword 0x16e96f9ee62188da
.xword 0x8e772d3c5a6a3ae7
.xword 0x45828f706bc63cf6
.xword 0x644800bd2f852694
.xword 0x35c68d5486dc6824
.xword 0x1ff9096950599779
.xword 0x8c7ce17f777469e8



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
.xword 0x74a4315c82c3ac4d
.xword 0xa06d370a7f41a64a
.xword 0x090f869b38881d7c
.xword 0xeadeec23f60bc05d
.xword 0xcb46525d3997db6d
.xword 0x6463915c87c3417d
.xword 0x893a21ee9aea3015
.xword 0x5ab4e4c21a751a82



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
.xword 0xb78610dc29a6f2df
.xword 0x8bad0ca928bfca5c
.xword 0x6d4d2cd3afd921c2
.xword 0x6c90ed9b3322cbe4
.xword 0xae006ca33db51bf8
.xword 0x2a03d54a178255f9
.xword 0xcc67e1c70b71a544
.xword 0x06f2da74e42f4bd3



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
.xword 0xd533724db7178b0f
.xword 0x5ec63992e88cb4de
.xword 0x439baf79b9a45d29
.xword 0x43f6507388f39b7d
.xword 0xd14a8d858cf7f059
.xword 0x549bb6ea3c3d5294
.xword 0x2a26d0d06a0be640
.xword 0xf3848974d5811084



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
.xword 0x9a1de2d3a0250bfd
.xword 0x77dae64abb732b68
.xword 0x3e7cca4ccc95ebe4
.xword 0xe476613103d7ba93
.xword 0x70ce5ae7c9dbcc34
.xword 0xbd59b0d9666d9707
.xword 0x216027065b17f524
.xword 0x71b5d3d6cb0f1ab1



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
.xword 0x0e4386cdeed406fd
.xword 0xec8ca9cf6e952e4a
.xword 0xb0ce69bf92213c89
.xword 0x0b61ad82089ee9e6
.xword 0xda93ae0b2f59816f
.xword 0x0c419e8456d4a916
.xword 0x448eec5446c8b89b
.xword 0x5634000e93350618



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
.xword 0x0e63f7cadc587b90
.xword 0x1d54ec8cb9491474
.xword 0x88a52e0d732b9980
.xword 0x766f6171fe441289
.xword 0x9a9d4081fc29ce19
.xword 0x4029e1ea4587b068
.xword 0xfaf363b9ee502d70
.xword 0x24759d21b0a39573



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
.xword 0xfc4b13ee45e24722
.xword 0x51d364d1fa3e4250
.xword 0x8086dba943196e86
.xword 0x8670e8b817228983
.xword 0x557e6d108b07ba00
.xword 0xfa7e2ff306187784
.xword 0x19acbcc7331a9422
.xword 0x8715d77e5fa8e41d



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
.xword 0xe79e63dba1031d31
.xword 0xf7a71789ac39948a
.xword 0xde02e564f0d06974
.xword 0xbb2ba483be99457c
.xword 0xc12896e9fde0ae32
.xword 0x0ae42a99e90fdd7d
.xword 0x27a4ba870a96de51
.xword 0x05178799e83ad0ff



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
.xword 0xcc3b7554f85a5bc2
.xword 0x96e42f5ba8cace8c
.xword 0xf6f30069e4ed9819
.xword 0x32d4e04e30dc48a9
.xword 0x2353c61eb6b149da
.xword 0x94388fc27e339503
.xword 0xfdf3cecd6387dce5
.xword 0x63ae45ae32b0fe86



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
.xword 0x412b49b41ab50b0b
.xword 0x3295efac03a33fa2
.xword 0x37da5e9371f80a81
.xword 0xf8d552c7cb818880
.xword 0x9853f05e9094a5fe
.xword 0x88ce2a6a3c0a3ab3
.xword 0x5e7bb678d92236d4
.xword 0x2d24bf4ad4f82492



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
.xword 0xb9049d7e643bfb59
.xword 0x1f5cf75898d0e63d
.xword 0xe5399aa02e98ce02
.xword 0x4f0066b097d1d4b1
.xword 0xac5b232ee7fef5be
.xword 0x3de9d14fc52d7b93
.xword 0x5ed806e493174406
.xword 0xb7de4a27abcfaada



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
.xword 0x2af39f946155b33b
.xword 0xee2b8564f09d9df3
.xword 0x39cdce9774020d09
.xword 0x96d5f1a74d0cc2f1
.xword 0x4ac962e002271f71
.xword 0xe88802a15d44a8c8
.xword 0xc74382c699aa7606
.xword 0xd1d1a04027a50304



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
.xword 0x4655537253b364b6
.xword 0x2526d974ed53efd7
.xword 0xd87bb5ba8bfbe486
.xword 0x2bf6f36294916cc9
.xword 0xf9909436410e846b
.xword 0x68729b9df2bcc05f
.xword 0x10ec753fe86d8827
.xword 0x3d0f746338222995



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
.xword 0x4e2767ee405cd702
.xword 0xa1a337e60b4b2317
.xword 0xc689d162bb4f8ee0
.xword 0x4ea2cf4d410428b6
.xword 0x43f0831178db6ad6
.xword 0x474a06df41b575b6
.xword 0x4fe1a555dd23467f
.xword 0x6e84fddf18dacd2f



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
.xword 0xbb54b950f08340b2
.xword 0xfcdf4198c8a40fe4
.xword 0x1e230a9c969ca2da
.xword 0xa669f3ea06334f13
.xword 0xdb5b58cb6106ddf6
.xword 0x1948531c3e103ccd
.xword 0xeec2a448273c389b
.xword 0x2320f13504f3b756



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
.xword 0xa9ce45b20bb87b57
.xword 0xa13a3d7953639bb6
.xword 0xcb9191bb5befd312
.xword 0x3c45421c984cf683
.xword 0xc4a20be0f2591515
.xword 0x5b634a2a704e7703
.xword 0x94e983b9dfd5d0da
.xword 0xd7dbf6e4ab38f5dd



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
.xword 0x68fa07ed03548e51
.xword 0xff7cf23fcc9eca6d
.xword 0x90f351e4b5aa250f
.xword 0x4b6f16b848a950e7
.xword 0xa875b88fe9b47de2
.xword 0x1b887467ec498e85
.xword 0xfaf157ee1817ddf2
.xword 0x1eb215503e0bd3c5



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
.xword 0xcccd7d1e13248bde
.xword 0x1e15eaf495942c13
.xword 0x8c48313395fce836
.xword 0xbcbe188c92c3d319
.xword 0xef2bb6545df6e7f9
.xword 0xf5268fae200ab5b3
.xword 0xa3ffff235aac9458
.xword 0x7c3d467cc814d66e



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
.xword 0xa362886abb73270b
.xword 0x6959ae8233073fbd
.xword 0xe6b05d759e83f7cd
.xword 0x369587b67d590dc9
.xword 0x11eb9fbee7da9a39
.xword 0x279eece293f51889
.xword 0x4faea0295eb54d35
.xword 0x0f5e7665e732b878



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
.xword 0x0d29793447315e05
.xword 0x17d2414551203aed
.xword 0xb8a73841210c65c0
.xword 0x1b6a9357f54f6028
.xword 0x62e01084812fad2e
.xword 0x6d2bd5a14fe32622
.xword 0x79ec28f13bf24878
.xword 0x862798ff2159cab8



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
.xword 0xd78911339eb91b1d
.xword 0x6a157d2329fe947d
.xword 0xa416f08f741f719b
.xword 0x96f186173e34df0d
.xword 0x6b43af77da58d2a1
.xword 0x22f320e67a0b5921
.xword 0xf27662ce8c358625
.xword 0xe11a759e5487bb36



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
.xword 0x2884803c89bf4fa5
.xword 0xbc9aa5a075443611
.xword 0x063cc07866ec221f
.xword 0xc7d24993c434de69
.xword 0x39e7c2f67cc07e3a
.xword 0x2f83bdc28460bd73
.xword 0x511c62ebac70ba29
.xword 0x6f0c2bbab4193dab



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
.xword 0x78769d248f949f49
.xword 0x620d60581699811b
.xword 0x2212ee4e4e6ea98c
.xword 0x80c9c79c61d6265d
.xword 0x83b4932da877cd0a
.xword 0x56f7a53c447eca15
.xword 0x7c4ef5f02f77222a
.xword 0xd83a0491b224d280



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
.xword 0x618e2e6a0f2acc32
.xword 0x24a05f97a769bfc1
.xword 0xe1e598dfe323c752
.xword 0x50776b785a58325a
.xword 0x5b5140ce27c880fd
.xword 0x695129ea2d741f5e
.xword 0x3d23a34075009574
.xword 0x77bce54a17bcce26



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
.xword 0x2a5d11e7619def4e
.xword 0x1d64fbae8def1b3f
.xword 0x4e8dc78b609e0bd7
.xword 0x5b5ad7ac81c5a540
.xword 0x2a5990905b3d0841
.xword 0x324a07f9b2efad62
.xword 0x9d6abf5d27d145fe
.xword 0x28a14b8258ea7f60





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
.xword 0xd7ac1c5a1b673ba5
.xword 0x07ea303caa7abea8
.xword 0xb4c9c6e3c921fa65
.xword 0x346e1b960159c86a
.xword 0x24f7a3cf8e7e73c2
.xword 0xfe2d5ce23ce694b4
.xword 0xa26850b1cff132f3
.xword 0xd2af1a7ca2c7f2b8




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
.xword 0x12364a1960d96112
.xword 0x9766910c539223c6
.xword 0x8e98f8037d8b571a
.xword 0x9bc5d94b0a90fa9c
.xword 0x40b612370338e8b9
.xword 0xb644b60d3a3021bc
.xword 0x491c9dc3f5c07a7e
.xword 0xe8cc25dcf92a6113




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
.xword 0xb88da7a396be126a
.xword 0xea7d5c4800a9c450
.xword 0x63f3d591bf502f5d
.xword 0x9522e8ab3ab24629
.xword 0xeceea0097afac6e1
.xword 0x0719006aa0794e87
.xword 0xd22dc4233e8c320b
.xword 0x07524505dd8c38c2




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
.xword 0x33eddb9fc0a8d3c9
.xword 0x52ccac6cc17c79d1
.xword 0x1b66db04b4c649b5
.xword 0x6d2be1c2e044af45
.xword 0x3eb1daadb9a89212
.xword 0x43af9c7371660627
.xword 0x50b8d80340e3b9d3
.xword 0x0c7deed60b02965a




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
.xword 0xf68b3434eebfef06
.xword 0xb480803cb6fae7d0
.xword 0x2da23c7eee7e7444
.xword 0x86314e0f24330cb4
.xword 0xabb11faccae0592f
.xword 0x24974c8691860029
.xword 0xddbb49fdc437ddae
.xword 0xb0716b001da5c0f2




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
.xword 0x804e35628fe55417
.xword 0x936d47ee0f74b96e
.xword 0xf01d561190de1676
.xword 0x151ba687f5ad57b3
.xword 0xb6fa649409c00898
.xword 0x85ea4d993773a547
.xword 0x83a4f01010e7f3c7
.xword 0x61e54f1675544757




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
.xword 0x353e6bbb54417803
.xword 0xd2f3c334593bf8da
.xword 0xd0716fed3f5dfb0c
.xword 0x369d65863f2e187c
.xword 0xa3ec0b81aeb47216
.xword 0xb7658ade64a1091e
.xword 0xe9b92650f807a1ac
.xword 0xf578194488d9f7a4




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
.xword 0xfe4a0c2620914717
.xword 0xec7a76b4004035cc
.xword 0x773df801b08dd28b
.xword 0x217450aaff2a20a6
.xword 0x94226ba95f0a907c
.xword 0x78ca96846d7062e0
.xword 0xb9abff52e65ba4a5
.xword 0x7bfd110d26d5317a






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
.xword 0x181790b94d81599a
.xword 0xcfbabdb15110ae2d
.xword 0x08517dda6ad3b417
.xword 0x66ab47f4f88febad
.xword 0xa687eb214f223154
.xword 0x4c9f61f5661e58d4
.xword 0x4125aeae8ed1f246
.xword 0x2b0407b1dc32fe32




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
.xword 0x80af74b218c2616e
.xword 0x1a7b2f0b045c5dc5
.xword 0x648a968a1cb071e7
.xword 0x6741ed0b956aae1a
.xword 0x5e54be597f3ccfbf
.xword 0x6b3a6a54194c26eb
.xword 0xbc11223bce340d29
.xword 0x398079ca1a6ba0a0




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
.xword 0x8af9cd79858670d9
.xword 0x1a58cf7b93539329
.xword 0x193e294e4ed304ee
.xword 0x38ffe87316d74b0f
.xword 0xd4ec949f43683504
.xword 0xce41808de210552c
.xword 0xf9fd324715693d6b
.xword 0x5f5deedb895c4621




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
.xword 0x60026e8b2da394eb
.xword 0x6cf63f38b1027f3c
.xword 0x680b0fa7fb9badc4
.xword 0x09a567921f4c2527
.xword 0x5706087189deebf8
.xword 0x845d9e63b8367dcd
.xword 0x02e8a06588ee43d0
.xword 0x755cf605eb0f9c7f




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
.xword 0xce6f92c1a53f5c10
.xword 0x495ac2493ace5ed5
.xword 0xdb811edaea2f25d4
.xword 0x0c0df746700ec50d
.xword 0xf749fef7b39c84de
.xword 0xfcaddb4b8c7491ee
.xword 0x71a6dee95153acbd
.xword 0xf6cc8c05b47d4f15




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
.xword 0xd9092076bbb426e2
.xword 0x01acdb0e4eeb6ddf
.xword 0x89472722b7657bb5
.xword 0x9f92365683c8a517
.xword 0x3b6cb38a342fb1be
.xword 0x47ea0520fa73f265
.xword 0x7b945ce96f185286
.xword 0x3c986379eeef8d29




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
.xword 0xf063bae10659db68
.xword 0xa2eb2e96629785b1
.xword 0x3dd1143b03fa4bf8
.xword 0xfec16e9ac9e78c5d
.xword 0xdd1fd02bfab6263c
.xword 0xd26bfee804b9a006
.xword 0xf98b5c8ab3c8e927
.xword 0xd31907ccf641b3a1




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
.xword 0xd3aadc58bd5be6db
.xword 0xf4360909cc361918
.xword 0x8cb276ec1481bbed
.xword 0xdd6317ecee6a974a
.xword 0xbc66a707fe510554
.xword 0x0d19c04a5151a7a4
.xword 0x41d21e132b1021dc
.xword 0xcde8305d670ac97f






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
.xword 0xc8938259c4e0a960
.xword 0x36ac4f3808f014c7
.xword 0x4ff63391b7e70d9f
.xword 0xab483afea71d4892
.xword 0x5c9c30f15c265c0e
.xword 0xa46968030ed2e422
.xword 0x89678fbbf134a2ad
.xword 0xc520f00f8a626948




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
.xword 0x2139937d09ea650b
.xword 0x4a6944a24762a22f
.xword 0x8ba6aec5fccf07e2
.xword 0x0324bdef64b246d4
.xword 0x0c32c57222d2bed6
.xword 0x90a6f0b98a296be2
.xword 0xa138a93b45b1a52a
.xword 0x19ff7447241167ed




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
.xword 0xfe2290994971fe94
.xword 0xe736488a11bd7d8c
.xword 0xfcb6b80d7a6f64dc
.xword 0x6ecdc584523eb0bb
.xword 0x9551b84873244bf2
.xword 0xe0612e18ccb8c07b
.xword 0x24f9ce96c39f732f
.xword 0x53711d50d2225733




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
.xword 0xd14903c7036a6be4
.xword 0x2c768d7ea089682c
.xword 0x3796941fc49dd1c7
.xword 0xd3ffceafcadff6f0
.xword 0x64ba4cd48e057320
.xword 0x6241f73eb9250390
.xword 0x30564eef56f04779
.xword 0x50b8ca115e5216ef




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
.xword 0x07b9de70f9df51ad
.xword 0xc8e06caa11f45126
.xword 0x3b03c2513149b7a2
.xword 0x2bbf47995ad09c68
.xword 0x438df743a113e4ce
.xword 0x32bac64d25bb7248
.xword 0xd313670b4f2e87d4
.xword 0xe81b65eaeeea8611




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
.xword 0x1259bada1fe582a1
.xword 0xb272f45642745569
.xword 0x289acb98334f33c5
.xword 0xa838f80df7c8bdcd
.xword 0xce0d7635872b1656
.xword 0x13a1d5388af8bc3b
.xword 0x5f82b3e6b52bb643
.xword 0x76c00c8f4b4e5fdf




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
.xword 0xa70f6580390305f8
.xword 0xc47a2c76c5622fba
.xword 0xcf581d90a6a1174b
.xword 0x70df1032a1d3c512
.xword 0xfb81d468cbc996a1
.xword 0xc143aeae88e88976
.xword 0x51d5a732ef5092b1
.xword 0x2831c4b27b6cdb07




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
.xword 0x68517d7018019b3f
.xword 0x41fce3a989dbf51b
.xword 0xcb2aaee80d3d3280
.xword 0x3f93c14f03266636
.xword 0xa4a2c2f88a9e718d
.xword 0x7dc679d0635d795e
.xword 0x1f999c3ef8621894
.xword 0xca415f07e5a842b1






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
.xword 0x99038eb2af4c2773
.xword 0x80c3fb5acd6175ce
.xword 0x384bebdafc264e72
.xword 0xf828db669fa708d8
.xword 0xd496b15bbcb78bfd
.xword 0xe34af4ea80b3e9dd
.xword 0x1db2e30d83f0b659
.xword 0x80d4a7e8186b97a9




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
.xword 0x1a875fbdd0c0a162
.xword 0x7128f0ba13af92ad
.xword 0xc93c3723b4d793f0
.xword 0x37bd6d08c9afe133
.xword 0x4076244fdae81800
.xword 0xefca52a98fa6595d
.xword 0xe8d8f4f06d1ee288
.xword 0xab5f46d4119ab02b




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
.xword 0xf79a79b1a3ef75d1
.xword 0x44ab0e71226a0f33
.xword 0xfdb5af8d691dbebe
.xword 0xcfa9c15f87eea5fa
.xword 0x05524754ce101492
.xword 0xfbfa23c7f0f73ec9
.xword 0x5e30df3e885b1f9a
.xword 0xc7c5379b30c6d156




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
.xword 0x941af120875c4413
.xword 0x4e1979df000a02e0
.xword 0x6d9417a3725d4adb
.xword 0x2ed6e2bee5d97d84
.xword 0xae9812840fc17c4e
.xword 0x0932ad67ecc265f8
.xword 0xe889fa821a1e8f44
.xword 0xaa3f420fc58fa53d




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
.xword 0x1848acc9c9cc2acc
.xword 0xd9a4b728befd6549
.xword 0x8a2a1361b079c024
.xword 0xb9a56565669b89d4
.xword 0xb5f01e472a067129
.xword 0x5a5be849eab94647
.xword 0xc59a8c0b2239c939
.xword 0x14aaf49a75dbca8c




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
.xword 0x1614a67c3de4cf3e
.xword 0xa371e4de958db7f5
.xword 0x269b58a9fae08a5a
.xword 0x5c0de23622627e2b
.xword 0xb681f796403ce141
.xword 0x01f1902f31205842
.xword 0x62990910a44ad273
.xword 0xf23abe793e8b0b8c




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
.xword 0x0b731d41545b2c56
.xword 0x3f46b56abfcd394e
.xword 0x34ddcefa0423b62a
.xword 0x51a81b1b555a51f1
.xword 0xba026699fc2ce07e
.xword 0x2f9a649a6981456b
.xword 0x721838fd4e3d6c25
.xword 0x129a9249e21cd95a




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
.xword 0xa089507a5ebc550c
.xword 0x432a2bbef5ac2dd3
.xword 0xb47e27954d88feca
.xword 0x4a02b2eecf832236
.xword 0x56d8e823ffe2b1de
.xword 0x9d9d0f709973f754
.xword 0x51c19967e7f13c0d
.xword 0x0f9381f8ab715555






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
.xword 0xa22311cca42085de
.xword 0x9b2f74442d8b6e4f
.xword 0xd11ca9ac9974ffbc
.xword 0xf3d88484cdfb6bb8
.xword 0x20e366d2cc42e0ba
.xword 0x7396317c52a39261
.xword 0xf95e14beabd4c66a
.xword 0x01ca453001d06739




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
.xword 0xc2cea7d55e11c1f1
.xword 0x3035d828d97a87c9
.xword 0x51a385ddac7a574c
.xword 0x86582a30207bcd19
.xword 0xedb37240f2f7a452
.xword 0x9e60841517b5e050
.xword 0xf4a56575a238461d
.xword 0x5cab45fbfc9e7638




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
.xword 0x5c71730874d671b5
.xword 0x255053c8b532609b
.xword 0xd015eb6ab1304140
.xword 0x5fd2af27d0feec1c
.xword 0x9234a4915e17d8a2
.xword 0x5ecddce9cd80a523
.xword 0x261b98d684e595aa
.xword 0xbf84d8bd7601573a




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
.xword 0x5f17fc4017178992
.xword 0xd04bb4d5c79550b8
.xword 0x0686b0c133affa80
.xword 0x36d0186c1855811b
.xword 0x8e281ebee1767b8e
.xword 0x291f316b48dd2f96
.xword 0x5932b20ec4582030
.xword 0x10e1cdefe25aefd7




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
.xword 0x3f4d413939f0f229
.xword 0xbf7c7c2b3b43a321
.xword 0x552ee7b8115d9391
.xword 0x17e36cf1b22ef69f
.xword 0x882d07d927dbe102
.xword 0x4f9dbe1684306bcc
.xword 0x8e16063f8c6f9fed
.xword 0xaa31d60262db4e07




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
.xword 0xd41ec081af332d47
.xword 0x5a0e8ff9b676a201
.xword 0xcacf6f4cbed1f2d2
.xword 0x0307a2456cb486c0
.xword 0x0b0cab87f11fe574
.xword 0xa78325f73219f96e
.xword 0x6af7a48bbb1feaa8
.xword 0xfa6d1a5245b483d3




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
.xword 0x0157ea48e023a544
.xword 0x502eb4ae909a6b57
.xword 0x7db400d31285bb65
.xword 0x0ac883305180e53f
.xword 0x1147bcaa74617b64
.xword 0xbe67ee7253268efa
.xword 0x2737ddac4f451fa2
.xword 0xc3a2143122456ee5




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
.xword 0xfe5376c3a53baf78
.xword 0x6666797e40eee6e2
.xword 0xcb63ed860271b882
.xword 0xde4d9174e5f0a519
.xword 0xd7153f5716473ec7
.xword 0xba426865671f52fb
.xword 0x761c62415cd83e3a
.xword 0x3de68eaa10bf78b1






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
.xword 0x802481a70f85ef66
.xword 0x82b4af2ac2ebacdb
.xword 0x28978c17058a7240
.xword 0x50c1fbb581e387ea
.xword 0xc77536a2ebfce301
.xword 0x7fbba41dddd9a43a
.xword 0xbcfedeca762a6d8c
.xword 0x3aee9499ea1daa7e




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
.xword 0x01d7dfbb10d69d64
.xword 0x61926c70095737e4
.xword 0xd30cf270cb8e7209
.xword 0xef1e817b20db6039
.xword 0xb70be5a998408308
.xword 0xe7c0af282220327e
.xword 0x5cb7a70c12540520
.xword 0x3629a0db8a9cd230




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
.xword 0xb57411a0916cbd9e
.xword 0x0c29a0ee6335b389
.xword 0xc9789f570d9d726b
.xword 0xbe48e4dbb5011523
.xword 0x891787f5ac64197f
.xword 0x53e4641ff55a535c
.xword 0xcfe32f142800222d
.xword 0xd0d13fb1fd02a7ee




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
.xword 0xc43cdba350f0b50e
.xword 0xfca96f98140ec546
.xword 0x67e29af0f50be204
.xword 0xa5f0c89430f0f103
.xword 0xabf088baa257b0b7
.xword 0x209b67e9d2eef838
.xword 0xa90539c3ebe89b61
.xword 0xb50bb95f4da499f8




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
.xword 0x879fe62f27647f3c
.xword 0x92dff1044d18ab20
.xword 0x5e14041daa796db1
.xword 0x6e80bdf0a8ac3ffd
.xword 0x3f447b0fbea687d1
.xword 0x199cac78a22f42a1
.xword 0xc61e76dae745efb1
.xword 0x730d58514402f977




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
.xword 0x6f5465560367bba8
.xword 0x2badbfa2f45a913f
.xword 0xcf0f4452f60aa07a
.xword 0x651d11f7738cb820
.xword 0x0bbd2a00ac4a38de
.xword 0x69ec2b062cb19947
.xword 0x141fc23a2a607bb3
.xword 0xe0a60b7ee3e12ff8




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
.xword 0xd2cf44bb51c195f9
.xword 0x02cd1f14f2d10b6c
.xword 0xec5ea9dd2e34ea1c
.xword 0x044715b997dc93aa
.xword 0x4050bd667218aa52
.xword 0x1d90f7cacabaaff9
.xword 0x3261c405c8aa4de8
.xword 0xb338cdcaf440543e




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
.xword 0xf1c2eb581eecc310
.xword 0xc79a3f97e55be13c
.xword 0xd04be41b2686a633
.xword 0xca91683d4e84a9d0
.xword 0x7b4cde46137a18c3
.xword 0x9f0a040f0bce5114
.xword 0x1a4317cf0a787fa0
.xword 0x3e3950bd3c410d79






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
.xword 0x93cb168d71f03629
.xword 0x6d1431dcc0d18ce2
.xword 0x736993983312563d
.xword 0x62744c56c5c26e96
.xword 0x85afe03428e8ecab
.xword 0x39ec933be249a4cc
.xword 0x837c0a44a152b49a
.xword 0x231b17e9e09959ec




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
.xword 0xed9bb8e7b5ee75f9
.xword 0x7ebda7308a3f6f27
.xword 0xc79b82980ac0f5d0
.xword 0xf8cb5aeebd4c31df
.xword 0x29656ab66abf611b
.xword 0x7a66cb77ac56ef13
.xword 0x85af0e20dc8a1c59
.xword 0x56791efc4e7ad272




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
.xword 0x4c5eaf3e6854fbc5
.xword 0xfd7d203f2a3c7b12
.xword 0x0ea5acc6836048db
.xword 0x2cd44c7d59170669
.xword 0x0c3604b6dd5e54d6
.xword 0x5016419282b4d5f1
.xword 0x7116b1fe11fc1610
.xword 0x8b6beb1345507a30




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
.xword 0x47236d81f4784667
.xword 0xd6210f05b7f4e14b
.xword 0x4f2e0cd00d99aa72
.xword 0xca5b665612084961
.xword 0x45bf1623cc581f8a
.xword 0xe7c45966feab1dfb
.xword 0xfee224511dc997bc
.xword 0xf1188edb80e3e039




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
.xword 0x5985577f27389a35
.xword 0xd6b923eb9ba3e7e5
.xword 0xef574c59a63f4387
.xword 0x06c0069d39447133
.xword 0x0af6bcd3974dd5cc
.xword 0x455dc88cd3829efe
.xword 0x0e2ae70da068df26
.xword 0x950c8b9f4eeb746d




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
.xword 0xf35734a19eafe8c8
.xword 0x368162dce7c4c3d8
.xword 0x45685f2b3ca3523d
.xword 0x6586cc8988eb31fe
.xword 0xb5ce0e5eb2333eaf
.xword 0xdb88e7c647d68f5f
.xword 0x6b95dbe18f868272
.xword 0x49852c64cc737aec




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
.xword 0x565677d2023e8152
.xword 0x4253df121ba0c628
.xword 0x7790c5b2a2a850bc
.xword 0x371e3cf8ededce27
.xword 0x2f2da913ad6094bb
.xword 0xfc49ddcf981885d5
.xword 0x62f050a773dbdd86
.xword 0x0c81c1e132ac66f2




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
.xword 0x0a705aa9be8b0172
.xword 0xf24b816c66d41a09
.xword 0x223237eacf2ddac9
.xword 0x805c9f0725e2b68f
.xword 0x78abd9ffc4f9f77c
.xword 0x902c4db32b79b255
.xword 0xe9055862c659d24d
.xword 0x53ef0d6435ebf2e5






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
.xword 0x75a3ea56b6436611
.xword 0x66d40b4a399f27be
.xword 0x80d4b2cf799c09f9
.xword 0x3e7f2f605537c795
.xword 0x8935aa004d26c1d8
.xword 0x75d0c56f86856f55
.xword 0xe440f4f2ec7b3c3b
.xword 0x381507cb6c07e241




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
.xword 0xb4d37f9835822ac1
.xword 0xc6f852daeef80228
.xword 0x61b266ab049183d0
.xword 0xd79b50feaa5f9718
.xword 0xca8fe2e257f656b4
.xword 0xbd14cca54ab9fc9d
.xword 0xabf3f944d3cebebd
.xword 0x81ac101ef6b10e21




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
.xword 0xa8607fbec4ceca68
.xword 0x441a24b44225733c
.xword 0x43020112c801b41b
.xword 0xd7e590cd915d2c87
.xword 0x8af7863a011b5d4d
.xword 0x75d56f8ef2f9e98e
.xword 0xafa62bf3d6c43e81
.xword 0xb82cf54e91019822




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
.xword 0x0f9ed43db4e48f59
.xword 0x22b39d911910b8dc
.xword 0xa3d84e9d9801d45a
.xword 0x727d7d635ec95dd7
.xword 0xf88ca874c84f170c
.xword 0x48e3de82a4c5c45f
.xword 0x13aa775e0f2ccd8e
.xword 0xe751bd9f36de30bb




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
.xword 0x6ec86f8030b474a7
.xword 0xda521d58f7e5bdb3
.xword 0x4e33a25b75b1a6ad
.xword 0xed75a0eb3b0f937f
.xword 0xbafe221fb4eae40d
.xword 0x5c1cf562f3b49163
.xword 0x4b3c95f0c22c4119
.xword 0xda8ae8bc176d8282




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
.xword 0x565a4250979a8771
.xword 0xf7f04f1755b99635
.xword 0x25773f22324ca88c
.xword 0xc4326bb128a3e67b
.xword 0xb3b9757732c5e695
.xword 0x5dbdad2badedbbfa
.xword 0x716e619824c9134c
.xword 0xc36eecd6fab69ed4




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
.xword 0x168eac5a7509dde3
.xword 0x8dcd11d9c2be3c65
.xword 0x6ed58f20bf44f387
.xword 0x3ff4d1f641a1547f
.xword 0xff2d4699bbf0cad8
.xword 0x8182eb09f56abc01
.xword 0xd206a81b1742f8b7
.xword 0x6fefbe665a99a171




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
.xword 0x084ea854dd060f8a
.xword 0x1713587e0554cc5c
.xword 0x83e5a3f20080b5d3
.xword 0xca53a184607d803a
.xword 0xbb774761a52908b8
.xword 0x185c3d4c8e382c11
.xword 0xca52141ee451a6dd
.xword 0xcc5d329df2c61a66






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
.xword 0x715141642ff0c2ec
.xword 0x8435e03f379de93f
.xword 0x7c71d63051b6502b
.xword 0x7d40880a208b8b19
.xword 0x0eab6dad30ab0146
.xword 0x9cda1d4e19a17af9
.xword 0x94edfe036975d245
.xword 0xbf7e5f91fd287cfa




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
.xword 0x1f32bf206e1347f6
.xword 0xfebc77dc64939fe4
.xword 0x4e2806ca7ee5cc10
.xword 0x38b7ad5ad4e132b3
.xword 0x0c4690f8b2b326a5
.xword 0xf460728552ecc303
.xword 0xf60a7eee88714f90
.xword 0x150131c3240ecccc




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
.xword 0x171fa0ce5eb49ade
.xword 0xf59e23d6b91d7ec8
.xword 0x1ae51cfaf8c6e00c
.xword 0xedb3af488c4111df
.xword 0xecaf7068acd6662c
.xword 0xa6d97ec7f2691877
.xword 0x6ae63620d5a13d63
.xword 0xbbd1b22ab8df39a1




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
.xword 0x84e133258c4e20ca
.xword 0x1eecb03564910419
.xword 0xa36a8f5ece52ee60
.xword 0xdcfd058677e7e42e
.xword 0x0df984408e5faae4
.xword 0xb750178990620c37
.xword 0xfc7212d44d79b72d
.xword 0x9ee43ff33b7d114b




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
.xword 0xb7cf7ec06f5ec82b
.xword 0x9a79991b04b67cb5
.xword 0x94dee6b869177bea
.xword 0xd3b4777ec880c2f3
.xword 0xbba8421c3231f0f2
.xword 0xd8d278c2d5cb7e9f
.xword 0xad5aaa70ef28c8f5
.xword 0xa86a4f525fa02d38




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
.xword 0xfdf99ba938ef88af
.xword 0xc4e623f950d94c98
.xword 0x1d543e99f612082e
.xword 0xaa0d4b033b2cd59d
.xword 0xd8e8807ab6a987fd
.xword 0x89ebe1f30c706195
.xword 0xb704301c2b80296f
.xword 0x77997680e5d4dde8




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
.xword 0x7b1b7e2ec92a4ebe
.xword 0x684419643a5a80a3
.xword 0x99af8b3318f2f91d
.xword 0x01bf945c4599db04
.xword 0x18b4d68eb405e365
.xword 0x25dde821c25f9534
.xword 0xb772e8f7895c7870
.xword 0x7c9b9026fd61af0d




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
.xword 0xd9e801f0ba5e5fa0
.xword 0x0b15001c5adfa059
.xword 0x133b5e9c3550ddbc
.xword 0x2d01ed35361d0117
.xword 0xe84e17c2f695056c
.xword 0x233fccb03a4d68b3
.xword 0x274c2f250cb3289c
.xword 0x177ae6c9a64414c3






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
.xword 0x27e131bef4da37a4
.xword 0xc93e02501e8b0849
.xword 0xd09db9a2703e9dfd
.xword 0x55b4ace4ee47705e
.xword 0x8de2a7276530d546
.xword 0x4b5ad5051900c830
.xword 0x564f025ab7ff72bd
.xword 0xd82802b9fbb39bb7




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
.xword 0xc857c170ea5517f7
.xword 0x147e582379271f48
.xword 0x16b0cff759d61ce9
.xword 0x77053c0bb4028d8f
.xword 0x50bb761bc04d888d
.xword 0x74694dcda41ca08b
.xword 0xe5445e5a4f54bc90
.xword 0x1803a76480102b2c




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
.xword 0xe68051e234f5f9dc
.xword 0x70e984679e071526
.xword 0x266fdb6711856566
.xword 0x87c22c2c851f76d7
.xword 0xdf503cb795ba6c64
.xword 0x5159634bb9ad2d54
.xword 0xb15be6bda7b69aab
.xword 0xea896fa19536ce9f




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
.xword 0xf5041e744c454c03
.xword 0x6e6a8b4500bade2a
.xword 0x70ea78616e653f85
.xword 0xd04a67d095c9d17d
.xword 0x23dbcf1a43a533be
.xword 0xddaa5fddf3f1fed6
.xword 0x56ba446472716d2a
.xword 0x595185cde6d44578




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
.xword 0x9d4763c0c704d4cf
.xword 0xf0e0299064e10d3c
.xword 0xb2e1e0cb1f5f0d6d
.xword 0x7708abaec3356970
.xword 0x584ca5d3fc88779d
.xword 0xea62b8a904bdc6e6
.xword 0x41e8cadee61098a0
.xword 0x89c347f462681eb3




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
.xword 0x9d4d16ce7de19b17
.xword 0x26a2107c0f8a85ec
.xword 0xa6dd697abe8b1d43
.xword 0xdf5bfec65079f3f5
.xword 0x2f692c49a3dcbeff
.xword 0x5127c89f6b0a27a5
.xword 0x66c0ac9286e59b3c
.xword 0xcf1fce0daf97b119




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
.xword 0xc9b4d334212fc20f
.xword 0x4cf84b5e78a8dbab
.xword 0xf3397fe8be515dae
.xword 0x1eb74964005c2a07
.xword 0x20849a8ed257b8c9
.xword 0xfaf2fcf435fe18fc
.xword 0x0386fa2e4ae7113d
.xword 0xc8cde7e866cd143f




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
.xword 0x50555163765a22e1
.xword 0xa9e04e8645f7de0f
.xword 0xa9e176b6703b4e1f
.xword 0x0219e9cb36bb6275
.xword 0x31c290f6b1d74b9b
.xword 0x5b79031d1592d7d7
.xword 0xebd531c856054017
.xword 0xd19270fc3a3637a8




#if 0
#endif
