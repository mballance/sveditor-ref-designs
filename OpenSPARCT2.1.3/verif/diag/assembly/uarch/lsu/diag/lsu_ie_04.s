/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_04.s
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
	setx 0x10b3974a345c8be9, %g1, %r2
	setx 0x120b38991f99d92f, %g1, %r3
	setx 0x100e373b15012941, %g1, %r4
	setx 0xfdcbb5a3523ffb30, %g1, %r5
	setx 0x984d9011096852f2, %g1, %r6
	setx 0x14ea5ab5641561f3, %g1, %r7
	setx 0x7342b1544badfbf2, %g1, %r8

     mov %r2, %r1
CP_PST_PRI0:
	.word 0xd1a4903a  ! 3: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd0db911a  ! 5: LDXA_R	ldxa	[%r14, %r26] 0x88, %r8
	.word 0xd0acd03a  ! 7: STBA_R	stba	%r8, [%r19 + %r26] 0x81
SET_TL1_1:
	ta	T_CHANGE_TO_TL1
CHANGE_R262:
	add	%r26,	%r27,	%r26
NC_BIS_NUC2:
	.word 0xc4a544fa  ! 9: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xd0b4d13a  ! 11: STHA_R	stha	%r8, [%r19 + %r26] 0x89
	.word 0xd09c903a  ! 13: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
NC_BIS_NUC3:
	.word 0xd0a544fa  ! 15: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
CHANGE_R264:
	add	%r26,	%r27,	%r26
CP_BIS_SEC4:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 17: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
SET_TL0_5:
	ta	T_CHANGE_TO_TL0
CHANGE_R266:
	add	%r26,	%r27,	%r26
NC_BIS_SEC6:
	.word 0xd0acdd7a  ! 19: STBA_R	stba	%r8, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS8:
	.word 0xd09fc23a  ! 21: LDDA_R	ldda	[%r31, %r26] 0x11, %r8
	.word 0xd07a801a  ! 22: SWAP_R	swap	%r8, [%r10 + %r26]
	.word 0xd0eb101a  ! 23: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
CP_PST_PRI9:
	.word 0xd1ba981a  ! 25: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd122e004  ! 26: STF_I	st	%f8, [0x0004, %r11]
NC_SHORT_FP_SEC10:
	.word 0xd1bcda7a  ! 28: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd1a2901a  ! 29: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd19b101a  ! 30: LDDFA_R	ldda	[%r12, %r26], %f8
	.word 0xd0d3901a  ! 32: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
NC_NUC11:
	.word 0xd0a5409a  ! 34: STWA_R	stwa	%r8, [%r21 + %r26] 0x04
WR_LEASI_12:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_13:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP14:
	.word 0xd19e421a  ! 37: LDDFA_R	ldda	[%r25, %r26], %f8
NC_BIS_SEC15:
	.word 0xc4a4dd7a  ! 39: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
NC_AIUP16:
	.word 0xd1be421a  ! 41: STDFA_R	stda	%f8, [%r26, %r25]
	.word 0xd0f4d13a  ! 43: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
NC_NUC17:
	.word 0xd1bd409a  ! 45: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd0a4111a  ! 47: STWA_R	stwa	%r8, [%r16 + %r26] 0x88
CP_BIS_QUAD_LD18:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 49: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_NUC19:
	.word 0xd0cd009a  ! 51: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r8
	.word 0xd0a4913a  ! 53: STWA_R	stwa	%r8, [%r18 + %r26] 0x89
CHANGE_CLE20:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd13aa000  ! 55: STDF_I	std	%f8, [0x0000, %r10]
BLK_PRI21:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 57: STDFA_R	stda	%f0, [%r26, %r13]
CP_PST_PRI22:
	.word 0xd1bad95a  ! 59: STDFA_R	stda	%f8, [%r26, %r11]
CHANGE_PRIV23:
	ta	T_CHANGE_PRIV
CHANGE_R2624:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP24:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 61: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xd092901a  ! 62: LDUHA_R	lduha	[%r10, %r26] 0x80, %r8
	.word 0xd19c903a  ! 64: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd0a4903a  ! 66: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
NC_BIS_AIUP25:
	.word 0xd0b6455a  ! 68: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
	.word 0xd08c111a  ! 70: LDUBA_R	lduba	[%r16, %r26] 0x88, %r8
	.word 0xd0f4d03a  ! 72: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
BLK_PRI26:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 74: LDDFA_R	ldda	[%r11, %r26], %f0
NC_PST_PRI27:
	.word 0xd1bbd91a  ! 76: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd0b4903a  ! 78: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_BIS_AIUS28:
	.word 0xc8afc47a  ! 80: STBA_R	stba	%r4, [%r31 + %r26] 0x23
	.word 0xd0c3901a  ! 82: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r8
	.word 0xd0a3101a  ! 83: STWA_R	stwa	%r8, [%r12 + %r26] 0x80
CP_BIS_QUAD_LD29:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 85: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
	.word 0xd19cd03a  ! 87: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd19c913a  ! 89: LDDFA_R	ldda	[%r18, %r26], %f8
NC_AIUP30:
	.word 0xd0de421a  ! 91: LDXA_R	ldxa	[%r25, %r26] 0x10, %r8
CHANGE_CLE31:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0ac903a  ! 94: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd094903a  ! 96: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP33:
	.word 0xd186421a  ! 98: LDFA_R	lda	[%r25, %r26], %f8
NC_BLK_SEc34:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 100: STDFA_R	stda	%f0, [%r26, %r19]
WR_LEASI_35:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_36:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_AIUP37:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 103: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
NC_AIUP38:
	.word 0xd1be421a  ! 105: STDFA_R	stda	%f8, [%r26, %r25]
	.word 0xd08c913a  ! 107: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd1bc903a  ! 109: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd1e2e01a  ! 110: CASA_R	casa	[%r11] %asi, %r26, %r8
NC_AIUS39:
	.word 0xd0c7c33a  ! 112: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r8
	.word 0xd0dc501a  ! 114: LDXA_R	ldxa	[%r17, %r26] 0x80, %r8
NC_BLK_SEc40:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 116: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xd05a801a  ! 117: LDX_R	ldx	[%r10 + %r26], %r8
	.word 0xd0ccd13a  ! 119: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
CHANGE_USER41:
	ta	T_CHANGE_NONPRIV
CHANGE_R2642:
	add	%r26,	%r27,	%r26
CP_BIS_PRI42:
	and	%r26,	%r28,	%r26
	.word 0xc89a9c5a  ! 121: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC44:
	.word 0xd0f5019a  ! 123: STXA_R	stxa	%r8, [%r20 + %r26] 0x0c
NC_NUC45:
	.word 0xd185409a  ! 125: LDFA_R	lda	[%r21, %r26], %f8
NC_AIUP46:
	.word 0xd086421a  ! 127: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r8
	.word 0xd1a3111a  ! 128: STFA_R	sta	%f8, [%r26, %r12]
NC_SHORT_FP_SEC47:
	.word 0xd1bcda3a  ! 130: STDFA_R	stda	%f8, [%r26, %r19]
SHORT_FP_PRI48:
	.word 0xd19a9b1a  ! 132: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd184d03a  ! 134: LDFA_R	lda	[%r19, %r26], %f8
NC_BIS_SEC49:
	.word 0xccb4dc7a  ! 136: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
NC_AIUS50:
	.word 0xd09fc23a  ! 138: LDDA_R	ldda	[%r31, %r26] 0x11, %r8
	.word 0xd0c3901a  ! 140: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r8
CP_BIS_QUAD_LD51:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1d5a  ! 142: LDDA_R	ldda	[%r12, %r26] 0xea, %r6
CP_AIUP52:
	.word 0xd086021a  ! 144: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r8
NC_NUC53:
	.word 0xd095409a  ! 146: LDUHA_R	lduha	[%r21, %r26] 0x04, %r8
	.word 0xd073001a  ! 147: STX_R	stx	%r8, [%r12 + %r26]
CP_AIUS54:
	.word 0xd0d7833a  ! 149: LDSHA_R	ldsha	[%r30, %r26] 0x19, %r8
	.word 0xd0f4d03a  ! 151: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
NC_BIS_SEC55:
	.word 0xd0f4dc7a  ! 153: STXA_R	stxa	%r8, [%r19 + %r26] 0xe3
CHANGE_TLE56:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0bb501a  ! 155: STDA_R	stda	%r8, [%r13 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP58:
	.word 0xd086021a  ! 157: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r8
	.word 0xd084d13a  ! 159: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
NC_SHORT_FP_SEC59:
	.word 0xd1bcda3a  ! 161: STDFA_R	stda	%f8, [%r26, %r19]
CHANGE_R2660:
	add	%r26,	%r27,	%r26
CP_BIS_SEC60:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 163: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_BIS_AIUP61:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 165: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xd09c913a  ! 167: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd0d4d03a  ! 169: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
CP_BIS_QUAD_LD62:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 171: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
NC_BIS_AIUS63:
	.word 0xc4f7c57a  ! 173: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd0b4d13a  ! 175: STHA_R	stha	%r8, [%r19 + %r26] 0x89
	.word 0xd0bad01a  ! 176: STDA_R	stda	%r8, [%r11 + %r26] 0x80
NC_AIUP64:
	.word 0xd0de421a  ! 178: LDXA_R	ldxa	[%r25, %r26] 0x10, %r8
NC_AIUS65:
	.word 0xd0dfc23a  ! 180: LDXA_R	ldxa	[%r31, %r26] 0x11, %r8
CHANGE_USER66:
	ta	T_CHANGE_NONPRIV
CHANGE_R2667:
	add	%r26,	%r27,	%r26
NC_BIS_PRI67:
	.word 0xc4f41c5a  ! 182: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
	.word 0xd182915a  ! 183: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd0c4d03a  ! 185: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
NC_BLK_SEc68:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 187: STDFA_R	stda	%f16, [%r26, %r19]
CP_BIS_PRI69:
	and	%r26,	%r28,	%r26
	.word 0xc4b2dd5a  ! 189: STHA_R	stha	%r2, [%r11 + %r26] 0xea
CHANGE_PRIV70:
	ta	T_CHANGE_PRIV
CHANGE_R2671:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD71:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 191: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xd182d05a  ! 192: LDFA_R	lda	[%r11, %r26], %f8
CHANGE_USER72:
	ta	T_CHANGE_NONPRIV
CHANGE_R2673:
	add	%r26,	%r27,	%r26
CP_BIS_PRI73:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9d5a  ! 194: STBA_R	stba	%r2, [%r10 + %r26] 0xea
BLK_PRI74:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 196: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xd0dc913a  ! 198: LDXA_R	ldxa	[%r18, %r26] 0x89, %r8
	.word 0xd0c4111a  ! 200: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r8
	.word 0xd083d01a  ! 202: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r8
	.word 0xd084d03a  ! 204: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd182901a  ! 205: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd1a3101a  ! 206: STFA_R	sta	%f8, [%r26, %r12]
	.word 0xd0732000  ! 207: STX_I	stx	%r8, [%r12 + 0x0000]
	.word 0xd1a3101a  ! 208: STFA_R	sta	%f8, [%r26, %r12]
	.word 0xd184903a  ! 210: LDFA_R	lda	[%r18, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS76:
	.word 0xd187823a  ! 212: LDFA_R	lda	[%r30, %r26], %f8
	.word 0xd13b001a  ! 213: STDF_R	std	%f8, [%r26, %r12]
	.word 0xd0dc903a  ! 215: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd0c4913a  ! 217: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd0a3501a  ! 218: STWA_R	stwa	%r8, [%r13 + %r26] 0x80
	.word 0xd0acd03a  ! 220: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CP_NUC77:
	.word 0xd1a5009a  ! 222: STFA_R	sta	%f8, [%r26, %r20]
CHANGE_R2678:
	add	%r26,	%r27,	%r26
CP_BIS_SEC78:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 224: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
	.word 0xd11a801a  ! 225: LDDF_R	ldd	[%r10, %r26], %f8
	.word 0xd0cb911a  ! 227: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r8
	.word 0xd08cd13a  ! 229: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS79:
	.word 0xd0afc47a  ! 231: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xd0cc903a  ! 233: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd08c913a  ! 235: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd094d03a  ! 237: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
NC_PST_PRI80:
	.word 0xd1bbd81a  ! 239: STDFA_R	stda	%f8, [%r26, %r15]
NC_BLK_SEc81:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 241: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd0bc903a  ! 243: STDA_R	stda	%r8, [%r18 + %r26] 0x81
	.word 0xd183901a  ! 245: LDFA_R	lda	[%r14, %r26], %f8
	.word 0xd1a3101a  ! 246: STFA_R	sta	%f8, [%r26, %r12]
	.word 0xd042801a  ! 247: LDSW_R	ldsw	[%r10 + %r26], %r8
NC_BIS_AIUP82:
	.word 0xd0ae445a  ! 249: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xd082d05a  ! 250: LDUWA_R	lduwa	[%r11, %r26] 0x82, %r8
CP_AIUP83:
	.word 0xd186031a  ! 252: LDFA_R	lda	[%r24, %r26], %f8
	.word 0xd0dcd13a  ! 254: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
CHANGE_USER84:
	ta	T_CHANGE_NONPRIV
CHANGE_R2685:
	mov	%g0,	%r26
CP_BIS_PRI85:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9d5a  ! 256: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
CHANGE_PRIV86:
	ta	T_CHANGE_PRIV
CHANGE_R2687:
	add	%r26,	%r27,	%r26
CP_BIS_NUC87:
	and	%r26,	%r28,	%r26
	.word 0xcca504fa  ! 258: STWA_R	stwa	%r6, [%r20 + %r26] 0x27
	.word 0xd1a4101a  ! 260: STFA_R	sta	%f8, [%r26, %r16]
	.word 0xd07b001a  ! 261: SWAP_R	swap	%r8, [%r12 + %r26]
	.word 0xd0a4d03a  ! 263: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
NC_PST_PRI88:
	.word 0xd1bb999a  ! 265: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_QUAD_LD89:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 267: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
CHANGE_USER90:
	ta	T_CHANGE_NONPRIV
CHANGE_R2691:
	add	%r26,	%r27,	%r26
CP_BIS_PRI91:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 269: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	.word 0xd0f4903a  ! 271: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC93:
	.word 0xd1bd009a  ! 273: STDFA_R	stda	%f8, [%r26, %r20]
CP_NUC94:
	.word 0xd08d019a  ! 275: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r8
CP_BIS_AIUP95:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 277: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xd0dcd03a  ! 279: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
CHANGE_R2696:
	add	%r26,	%r27,	%r26
CP_BIS_SEC96:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 281: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xd0bc903a  ! 283: STDA_R	stda	%r8, [%r18 + %r26] 0x81
NC_BIS_SEC97:
	.word 0xc8acdc7a  ! 285: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
CHANGE_USER98:
	ta	T_CHANGE_NONPRIV
CHANGE_R2699:
	add	%r26,	%r27,	%r26
NC_BIS_PRI99:
	.word 0xc8f39d5a  ! 287: STXA_R	stxa	%r4, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC101:
	.word 0xd185019a  ! 289: LDFA_R	lda	[%r20, %r26], %f8
	.word 0xd08cd03a  ! 291: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd1a4101a  ! 293: STFA_R	sta	%f8, [%r26, %r16]
CP_BIS_AIUP102:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 295: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xd0dc903a  ! 297: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
SET_TL1_103:
	ta	T_CHANGE_TO_TL1
CHANGE_R26104:
	add	%r26,	%r27,	%r26
NC_BIS_NUC104:
	.word 0xc4ad44fa  ! 299: STBA_R	stba	%r2, [%r21 + %r26] 0x27
CP_AIUP105:
	.word 0xd0b6031a  ! 301: STHA_R	stha	%r8, [%r24 + %r26] 0x18
	.word 0xd0ea901a  ! 303: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
NC_AIUP106:
	.word 0xd19e431a  ! 305: LDDFA_R	ldda	[%r25, %r26], %f8
	.word 0xd0c4913a  ! 307: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd1e3201a  ! 308: CASA_R	casa	[%r12] %asi, %r26, %r8
	.word 0xd1bb501a  ! 309: STDFA_R	stda	%f8, [%r26, %r13]
SET_TL0_107:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI108:
	.word 0xccbb9c5a  ! 311: STDA_R	stda	%r6, [%r14 + %r26] 0xe2
	.word 0xd183501a  ! 312: LDFA_R	lda	[%r13, %r26], %f8
	.word 0xd1bc913a  ! 314: STDFA_R	stda	%f8, [%r26, %r18]
CP_PST_PRI109:
	.word 0xd1bb591a  ! 316: STDFA_R	stda	%f8, [%r26, %r13]
CP_PST_PRI110:
	.word 0xd1ba989a  ! 318: STDFA_R	stda	%f8, [%r26, %r10]
BLK_PRI111:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 320: STDFA_R	stda	%f16, [%r26, %r13]
NC_BLK_SEc112:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 322: STDFA_R	stda	%f0, [%r26, %r19]
NC_PST_PRI113:
	.word 0xd1bb981a  ! 324: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd102e004  ! 325: LDF_I	ld	[%r11, 0x0004], %f8
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP115:
	.word 0xd0ae421a  ! 327: STBA_R	stba	%r8, [%r25 + %r26] 0x10
	.word 0xd09c903a  ! 329: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd0dc903a  ! 331: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
CP_AIUS116:
	.word 0xd09f823a  ! 333: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
CP_BIS_AIUP117:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 335: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CP_ATM_QUAD_LD118:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 337: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
CHANGE_R26119:
	add	%r26,	%r27,	%r26
CP_BIS_SEC119:
	and	%r26,	%r28,	%r26
	.word 0xc4f49d7a  ! 339: STXA_R	stxa	%r2, [%r18 + %r26] 0xeb
CP_PST_PRI120:
	.word 0xd1bad89a  ! 341: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd19b901a  ! 343: LDDFA_R	ldda	[%r14, %r26], %f8
NC_BIS_SEC121:
	.word 0xc4acdc7a  ! 345: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
CHANGE_USER122:
	ta	T_CHANGE_NONPRIV
CHANGE_R26123:
	add	%r26,	%r27,	%r26
CP_BIS_PRI123:
	and	%r26,	%r28,	%r26
	.word 0xd0b29c5a  ! 347: STHA_R	stha	%r8, [%r10 + %r26] 0xe2
SET_TL1_124:
	ta	T_CHANGE_TO_TL1
CHANGE_R26125:
	add	%r26,	%r27,	%r26
NC_BIS_NUC125:
	.word 0xc4ad45fa  ! 349: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
NC_BLK_SEc126:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 351: LDDFA_R	ldda	[%r19, %r26], %f0
SET_TL0_127:
	ta	T_CHANGE_TO_TL0
CHANGE_R26128:
	add	%r26,	%r27,	%r26
NC_BIS_SEC128:
	.word 0xc8a4dc7a  ! 353: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC130:
	.word 0xd0b5409a  ! 355: STHA_R	stha	%r8, [%r21 + %r26] 0x04
CP_NUC131:
	.word 0xd0ad019a  ! 357: STBA_R	stba	%r8, [%r20 + %r26] 0x0c
	.word 0xd0c4903a  ! 359: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
	.word 0xd032801a  ! 360: STH_R	sth	%r8, [%r10 + %r26]
CP_AIUP132:
	.word 0xd1be021a  ! 362: STDFA_R	stda	%f8, [%r26, %r24]
	.word 0xd0d4d13a  ! 364: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
	.word 0xd093501a  ! 365: LDUHA_R	lduha	[%r13, %r26] 0x80, %r8
	.word 0xd0acd13a  ! 367: STBA_R	stba	%r8, [%r19 + %r26] 0x89
CP_BIS_NUC133:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 369: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xd0b3101a  ! 370: STHA_R	stha	%r8, [%r12 + %r26] 0x80
NC_PST_PRI134:
	.word 0xd1bb995a  ! 372: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd184903a  ! 374: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0bbd01a  ! 376: STDA_R	stda	%r8, [%r15 + %r26] 0x80
	.word 0xd0ab511a  ! 377: STBA_R	stba	%r8, [%r13 + %r26] 0x88
	.word 0xd19c903a  ! 379: LDDFA_R	ldda	[%r18, %r26], %f8
NC_BIS_SEC135:
	.word 0xd0bcdc7a  ! 381: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
NC_BIS_AIUP136:
	.word 0xd0b6455a  ! 383: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
	.word 0xd1bad01a  ! 384: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd084903a  ! 386: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CHANGE_USER137:
	ta	T_CHANGE_NONPRIV
CHANGE_R26138:
	add	%r26,	%r27,	%r26
CP_BIS_PRI138:
	and	%r26,	%r28,	%r26
	.word 0xc89b5d5a  ! 388: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
	.word 0xd023401a  ! 389: STW_R	stw	%r8, [%r13 + %r26]
	.word 0xd0dcd03a  ! 391: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0a4903a  ! 393: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
CP_BIS_QUAD_LD139:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 395: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd19ad05a  ! 396: LDDFA_R	ldda	[%r11, %r26], %f8
CHANGE_PRIV140:
	ta	T_CHANGE_PRIV
CHANGE_R26141:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP141:
	.word 0xccbe445a  ! 398: STDA_R	stda	%r6, [%r25 + %r26] 0x22
NC_SHORT_FP_SEC142:
	.word 0xd1bcdb7a  ! 400: STDFA_R	stda	%f8, [%r26, %r19]
CHANGE_TLE143:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
BLK_PRI144:
	and	%r26,	%r29,	%r26
	.word 0xe19b1f1a  ! 403: LDDFA_R	ldda	[%r12, %r26], %f16
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS146:
	.word 0xd1bfc33a  ! 405: STDFA_R	stda	%f8, [%r26, %r31]
	.word 0xd0ccd03a  ! 407: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
NC_BLK_SEc147:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 409: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_USER148:
	ta	T_CHANGE_NONPRIV
CHANGE_R26149:
	add	%r26,	%r27,	%r26
NC_BIS_PRI149:
	.word 0xc8ab9c5a  ! 411: STBA_R	stba	%r4, [%r14 + %r26] 0xe2
	.word 0xd1f2e01a  ! 412: CASXA_R	casxa	[%r11]%asi, %r26, %r8
	.word 0xd1a3511a  ! 413: STFA_R	sta	%f8, [%r26, %r13]
	.word 0xd0c4d03a  ! 415: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd06b2007  ! 416: LDSTUB_I	ldstub	%r8, [%r12 + 0x0007]
	.word 0xd093505a  ! 417: LDUHA_R	lduha	[%r13, %r26] 0x82, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP151:
	.word 0xd186431a  ! 419: LDFA_R	lda	[%r25, %r26], %f8
	.word 0xd0f3911a  ! 421: STXA_R	stxa	%r8, [%r14 + %r26] 0x88
	.word 0xd19c913a  ! 423: LDDFA_R	ldda	[%r18, %r26], %f8
CHANGE_R26152:
	add	%r26,	%r27,	%r26
CP_BIS_SEC152:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 425: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xd122a004  ! 426: STF_I	st	%f8, [0x0004, %r10]
CP_PST_PRI153:
	.word 0xd1ba989a  ! 428: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0bb501a  ! 429: STDA_R	stda	%r8, [%r13 + %r26] 0x80
	.word 0xd02aa007  ! 430: STB_I	stb	%r8, [%r10 + 0x0007]
WR_LEASI_154:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_155:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd19b115a  ! 432: LDDFA_R	ldda	[%r12, %r26], %f8
NC_BIS_AIUP156:
	.word 0xccf6455a  ! 434: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
	.word 0xd06b001a  ! 435: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
	.word 0xd032c01a  ! 436: STH_R	sth	%r8, [%r11 + %r26]
	.word 0xd1a2d01a  ! 437: STFA_R	sta	%f8, [%r26, %r11]
CHANGE_R26157:
	add	%r26,	%r27,	%r26
CP_BIS_SEC157:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 439: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
CP_AIUP158:
	.word 0xd0ae021a  ! 441: STBA_R	stba	%r8, [%r24 + %r26] 0x10
NC_BIS_AIUP159:
	.word 0xc8be455a  ! 443: STDA_R	stda	%r4, [%r25 + %r26] 0x2a
	.word 0xd1bb511a  ! 444: STDFA_R	stda	%f8, [%r26, %r13]
CP_ATM_QUAD_LD160:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 446: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
	.word 0xd0ac903a  ! 448: STBA_R	stba	%r8, [%r18 + %r26] 0x81
CP_AIUS161:
	.word 0xd187833a  ! 450: LDFA_R	lda	[%r30, %r26], %f8
	.word 0xd123001a  ! 451: STF_R	st	%f8, [%r26, %r12]
	.word 0xd094d03a  ! 453: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
NC_NUC162:
	.word 0xd185409a  ! 455: LDFA_R	lda	[%r21, %r26], %f8
CP_ATM_QUAD_LD163:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 457: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
	.word 0xd0aad11a  ! 458: STBA_R	stba	%r8, [%r11 + %r26] 0x88
CP_BIS_AIUP164:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 460: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
	.word 0xd0c4903a  ! 462: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
CHANGE_R26165:
	add	%r26,	%r27,	%r26
CP_BIS_SEC165:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 464: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
	.word 0xd1bcd03a  ! 466: STDFA_R	stda	%f8, [%r26, %r19]
CP_BIS_QUAD_LD166:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 468: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
NC_BIS_AIUS167:
	.word 0xc8afc57a  ! 470: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
	.word 0xd0dad01a  ! 471: LDXA_R	ldxa	[%r11, %r26] 0x80, %r8
NC_BIS_AIUP168:
	.word 0xd0a6455a  ! 473: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
CP_AIUS169:
	.word 0xd08f833a  ! 475: LDUBA_R	lduba	[%r30, %r26] 0x19, %r8
CP_ATM_QUAD_LD170:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 477: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
NC_AIUS171:
	.word 0xd09fc23a  ! 479: LDDA_R	ldda	[%r31, %r26] 0x11, %r8
WR_LEASI_172:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_173:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd1a3911a  ! 482: STFA_R	sta	%f8, [%r26, %r14]
CHANGE_USER174:
	ta	T_CHANGE_NONPRIV
CHANGE_R26175:
	add	%r26,	%r27,	%r26
CP_BIS_PRI175:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 484: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV176:
	ta	T_CHANGE_PRIV
CHANGE_R26177:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS177:
	.word 0xc8a7c47a  ! 486: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
	.word 0xd0bcd03a  ! 488: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd0cc903a  ! 490: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd184111a  ! 492: LDFA_R	lda	[%r16, %r26], %f8
	.word 0xd0f4d03a  ! 494: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
CP_BIS_AIUP178:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 496: STHA_R	stha	%r2, [%r24 + %r26] 0x22
CP_AIUS179:
	.word 0xd09f823a  ! 498: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
NC_AIUP180:
	.word 0xd0d6421a  ! 500: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r8
CHANGE_TLE181:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_QUAD_LD182:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 503: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xd08c501a  ! 505: LDUBA_R	lduba	[%r17, %r26] 0x80, %r8
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC184:
	.word 0xd0d5019a  ! 507: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r8
	.word 0xd184d03a  ! 509: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd0ea911a  ! 510: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x88
SET_TL1_185:
	ta	T_CHANGE_TO_TL1
CHANGE_R26186:
	add	%r26,	%r27,	%r26
NC_BIS_NUC186:
	.word 0xcca544fa  ! 512: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xd1232004  ! 513: STF_I	st	%f8, [0x0004, %r12]
	.word 0xd012a006  ! 514: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xd1bcd03a  ! 516: STDFA_R	stda	%f8, [%r26, %r19]
NC_AIUS187:
	.word 0xd0cfc23a  ! 518: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r8
CP_NUC188:
	.word 0xd1e5201a  ! 520: CASA_R	casa	[%r20] %asi, %r26, %r8
NC_BIS_NUC189:
	.word 0xc4ad45fa  ! 522: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
CP_BIS_AIUS190:
	and	%r26,	%r28,	%r26
	.word 0xc8af857a  ! 524: STBA_R	stba	%r4, [%r30 + %r26] 0x2b
NC_PST_PRI191:
	.word 0xd1bc581a  ! 526: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd183501a  ! 527: LDFA_R	lda	[%r13, %r26], %f8
	.word 0xd07b401a  ! 528: SWAP_R	swap	%r8, [%r13 + %r26]
	.word 0xd182d15a  ! 529: LDFA_R	lda	[%r11, %r26], %f8
NC_BIS_AIUS192:
	.word 0xc4f7c47a  ! 531: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd0c3911a  ! 533: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r8
	.word 0xd1bcd03a  ! 535: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd084501a  ! 537: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
	.word 0xd0f4913a  ! 539: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
NC_BIS_NUC193:
	.word 0xccb545fa  ! 541: STHA_R	stha	%r6, [%r21 + %r26] 0x2f
SET_TL0_194:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI195:
	and	%r26,	%r28,	%r26
	.word 0xc8f2dc5a  ! 543: STXA_R	stxa	%r4, [%r11 + %r26] 0xe2
	.word 0xd0f2901a  ! 544: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC197:
	.word 0xd09d419a  ! 546: LDDA_R	ldda	[%r21, %r26] 0x0c, %r8
CP_AIUS198:
	.word 0xd0b7823a  ! 548: STHA_R	stha	%r8, [%r30 + %r26] 0x11
	.word 0xd1bad01a  ! 549: STDFA_R	stda	%f8, [%r26, %r11]
CP_PST_PRI199:
	.word 0xd1bad85a  ! 551: STDFA_R	stda	%f8, [%r26, %r11]
BLK_PRI200:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 553: STDFA_R	stda	%f16, [%r26, %r13]
SET_TL1_201:
	ta	T_CHANGE_TO_TL1
CHANGE_R26202:
	add	%r26,	%r27,	%r26
NC_BIS_NUC202:
	.word 0xd0a544fa  ! 555: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
	.word 0xd122a004  ! 556: STF_I	st	%f8, [0x0004, %r10]
	.word 0xd08cd13a  ! 558: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
	.word 0xd08b901a  ! 560: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
NC_AIUS203:
	.word 0xd097c23a  ! 562: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
SET_TL0_204:
	ta	T_CHANGE_TO_TL0
WR_LEASI_205:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_206:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS208:
	.word 0xd0a7c33a  ! 565: STWA_R	stwa	%r8, [%r31 + %r26] 0x19
SET_TL1_209:
	ta	T_CHANGE_TO_TL1
CHANGE_R26210:
	add	%r26,	%r27,	%r26
NC_BIS_NUC210:
	.word 0xc4ad44fa  ! 567: STBA_R	stba	%r2, [%r21 + %r26] 0x27
NC_BIS_NUC211:
	.word 0xc8f545fa  ! 569: STXA_R	stxa	%r4, [%r21 + %r26] 0x2f
NC_NUC212:
	.word 0xd08d409a  ! 571: LDUBA_R	lduba	[%r21, %r26] 0x04, %r8
SHORT_FP_PRI213:
	.word 0xd19b5a1a  ! 573: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd0acd13a  ! 575: STBA_R	stba	%r8, [%r19 + %r26] 0x89
SET_TL0_214:
	ta	T_CHANGE_TO_TL0
CHANGE_R26215:
	add	%r26,	%r27,	%r26
NC_BIS_SEC215:
	.word 0xc4f4dc7a  ! 577: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CP_PST_PRI216:
	.word 0xd1bad81a  ! 579: STDFA_R	stda	%f8, [%r26, %r11]
CHANGE_PRIV217:
	ta	T_CHANGE_PRIV
CHANGE_R26218:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP218:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 581: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
CP_PST_PRI219:
	.word 0xd1ba991a  ! 583: STDFA_R	stda	%f8, [%r26, %r10]
NC_PST_PRI220:
	.word 0xd1bc199a  ! 585: STDFA_R	stda	%f8, [%r26, %r16]
SET_TL1_221:
	ta	T_CHANGE_TO_TL1
CHANGE_R26222:
	mov	%g0,	%r26
NC_BIS_NUC222:
	.word 0xccad45fa  ! 587: STBA_R	stba	%r6, [%r21 + %r26] 0x2f
	.word 0xd19c903a  ! 589: LDDFA_R	ldda	[%r18, %r26], %f8
NC_AIUP223:
	.word 0xd19e421a  ! 591: LDDFA_R	ldda	[%r25, %r26], %f8
	.word 0xd184d03a  ! 593: LDFA_R	lda	[%r19, %r26], %f8
CP_BIS_NUC224:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 595: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
	.word 0xd08c903a  ! 597: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd19c101a  ! 599: LDDFA_R	ldda	[%r16, %r26], %f8
SET_TL0_225:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI226:
	and	%r26,	%r28,	%r26
	.word 0xd0f2dc5a  ! 601: STXA_R	stxa	%r8, [%r11 + %r26] 0xe2
CHANGE_PRIV227:
	ta	T_CHANGE_PRIV
CHANGE_R26228:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS228:
	.word 0xc4b7c47a  ! 603: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xd0f3511a  ! 604: STXA_R	stxa	%r8, [%r13 + %r26] 0x88
	.word 0xd0aa901a  ! 605: STBA_R	stba	%r8, [%r10 + %r26] 0x80
	.word 0xd1f3201a  ! 606: CASXA_R	casxa	[%r12]%asi, %r26, %r8
	.word 0xd19a901a  ! 607: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd0a4d03a  ! 609: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
CHANGE_USER229:
	ta	T_CHANGE_NONPRIV
CHANGE_R26230:
	add	%r26,	%r27,	%r26
NC_BIS_PRI230:
	.word 0xccbc1c5a  ! 611: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
SET_TL1_231:
	ta	T_CHANGE_TO_TL1
CHANGE_R26232:
	add	%r26,	%r27,	%r26
NC_BIS_NUC232:
	.word 0xc8b544fa  ! 613: STHA_R	stha	%r4, [%r21 + %r26] 0x27
NC_BIS_NUC233:
	.word 0xd0ad44fa  ! 615: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xd0f4d03a  ! 617: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
	.word 0xd09c903a  ! 619: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
BLK_PRI234:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 621: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xd0dc903a  ! 623: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd042a004  ! 624: LDSW_I	ldsw	[%r10 + 0x0004], %r8
	.word 0xd0bcd03a  ! 626: STDA_R	stda	%r8, [%r19 + %r26] 0x81
NC_BIS_AIUP235:
	.word 0xc4a6445a  ! 628: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xd0a4501a  ! 630: STWA_R	stwa	%r8, [%r17 + %r26] 0x80
NC_NUC236:
	.word 0xd0b5409a  ! 632: STHA_R	stha	%r8, [%r21 + %r26] 0x04
SHORT_FP_PRI237:
	.word 0xd19a9a5a  ! 634: LDDFA_R	ldda	[%r10, %r26], %f8
CP_BIS_NUC238:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 636: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
	.word 0xd11b001a  ! 637: LDDF_R	ldd	[%r12, %r26], %f8
	.word 0xd183111a  ! 639: LDFA_R	lda	[%r12, %r26], %f8
CP_PST_PRI239:
	.word 0xd1ba985a  ! 641: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0dc913a  ! 643: LDXA_R	ldxa	[%r18, %r26] 0x89, %r8
	.word 0xd0dcd03a  ! 645: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
SET_TL0_240:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI241:
	and	%r26,	%r28,	%r26
	.word 0xc49b1d5a  ! 647: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
BLK_PRI242:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 649: LDDFA_R	ldda	[%r12, %r26], %f16
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC244:
	.word 0xd085019a  ! 651: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r8
SHORT_FP_PRI245:
	.word 0xd19adb1a  ! 653: LDDFA_R	ldda	[%r11, %r26], %f8
SHORT_FP_PRI246:
	.word 0xd1bb5a5a  ! 655: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd184d03a  ! 657: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd184101a  ! 659: LDFA_R	lda	[%r16, %r26], %f8
CP_NUC247:
	.word 0xd19d019a  ! 661: LDDFA_R	ldda	[%r20, %r26], %f8
	.word 0xd07b001a  ! 662: SWAP_R	swap	%r8, [%r12 + %r26]
	.word 0xd09c903a  ! 664: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd003001a  ! 665: LDUW_R	lduw	[%r12 + %r26], %r8
	.word 0xd03ae000  ! 666: STD_I	std	%r8, [%r11 + 0x0000]
CHANGE_R26248:
	add	%r26,	%r27,	%r26
CP_BIS_SEC248:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 668: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xd0acd13a  ! 670: STBA_R	stba	%r8, [%r19 + %r26] 0x89
	.word 0xd084111a  ! 672: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r8
CP_PST_PRI249:
	.word 0xd1bad91a  ! 674: STDFA_R	stda	%f8, [%r26, %r11]
CHANGE_R26250:
	add	%r26,	%r27,	%r26
CP_BIS_SEC250:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 676: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
CP_AIUS251:
	.word 0xd0a7823a  ! 678: STWA_R	stwa	%r8, [%r30 + %r26] 0x11
NC_BLK_SEc252:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 680: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd0abd11a  ! 682: STBA_R	stba	%r8, [%r15 + %r26] 0x88
	.word 0xd0bc501a  ! 684: STDA_R	stda	%r8, [%r17 + %r26] 0x80
	.word 0xd1bad01a  ! 685: STDFA_R	stda	%f8, [%r26, %r11]
CHANGE_R26253:
	add	%r26,	%r27,	%r26
CP_BIS_SEC253:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 687: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
NC_NUC254:
	.word 0xd185409a  ! 689: LDFA_R	lda	[%r21, %r26], %f8
CHANGE_USER255:
	ta	T_CHANGE_NONPRIV
CHANGE_R26256:
	mov	%g0,	%r26
NC_BIS_PRI256:
	.word 0xcca3dc5a  ! 691: STWA_R	stwa	%r6, [%r15 + %r26] 0xe2
	.word 0xd01aa000  ! 692: LDD_I	ldd	[%r10 + 0x0000], %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP258:
	.word 0xd0ae431a  ! 694: STBA_R	stba	%r8, [%r25 + %r26] 0x18
CP_BIS_QUAD_LD259:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 696: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
NC_BIS_SEC260:
	.word 0xc8a4dd7a  ! 698: STWA_R	stwa	%r4, [%r19 + %r26] 0xeb
	.word 0xd0dc903a  ! 700: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd0ba911a  ! 701: STDA_R	stda	%r8, [%r10 + %r26] 0x88
	.word 0xd0abd01a  ! 703: STBA_R	stba	%r8, [%r15 + %r26] 0x80
	.word 0xd182905a  ! 704: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd1a4913a  ! 706: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd032a006  ! 707: STH_I	sth	%r8, [%r10 + 0x0006]
	.word 0xd0d4913a  ! 709: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
BLK_PRI261:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 711: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xd0c4913a  ! 713: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd0bcd03a  ! 715: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd1bc501a  ! 717: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0a3101a  ! 718: STWA_R	stwa	%r8, [%r12 + %r26] 0x80
	.word 0xd0b4903a  ! 720: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	.word 0xd0232004  ! 721: STW_I	stw	%r8, [%r12 + 0x0004]
	.word 0xd122a004  ! 722: STF_I	st	%f8, [0x0004, %r10]
	.word 0xd0cc903a  ! 724: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
CP_BIS_QUAD_LD262:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 726: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xd1e2a01a  ! 727: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd184d13a  ! 729: LDFA_R	lda	[%r19, %r26], %f8
WR_LEASI_263:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_264:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd1bcd03a  ! 732: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd08b901a  ! 734: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
	.word 0xd183101a  ! 735: LDFA_R	lda	[%r12, %r26], %f8
	.word 0xd1a4501a  ! 737: STFA_R	sta	%f8, [%r26, %r17]
	.word 0xd09c903a  ! 739: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd184913a  ! 741: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd1a4501a  ! 743: STFA_R	sta	%f8, [%r26, %r17]
	.word 0xd02ae007  ! 744: STB_I	stb	%r8, [%r11 + 0x0007]
	.word 0xd0dcd13a  ! 746: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS265:
	.word 0xc4f7c47a  ! 748: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd08b911a  ! 750: LDUBA_R	lduba	[%r14, %r26] 0x88, %r8
	.word 0xd084101a  ! 752: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r8
	.word 0xd09c913a  ! 754: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd0f2d01a  ! 755: STXA_R	stxa	%r8, [%r11 + %r26] 0x80
	.word 0xd0ac903a  ! 757: STBA_R	stba	%r8, [%r18 + %r26] 0x81
NC_AIUS266:
	.word 0xd08fc23a  ! 759: LDUBA_R	lduba	[%r31, %r26] 0x11, %r8
	.word 0xd19c101a  ! 761: LDDFA_R	ldda	[%r16, %r26], %f8
	.word 0xd184903a  ! 763: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd07b401a  ! 764: SWAP_R	swap	%r8, [%r13 + %r26]
NC_BIS_SEC267:
	.word 0xc4b4dc7a  ! 766: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xd09c101a  ! 768: LDDA_R	ldda	[%r16, %r26] 0x80, %r8
NC_AIUS268:
	.word 0xd087c33a  ! 770: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r8
	.word 0xd182901a  ! 771: LDFA_R	lda	[%r10, %r26], %f8
CP_BIS_QUAD_LD269:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 773: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
CP_NUC270:
	.word 0xd0cd019a  ! 775: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r8
NC_SHORT_FP_SEC271:
	.word 0xd1bcda3a  ! 777: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xc16f801a  ! 779: PREFETCH_R	prefetch	[%r30 + %r26], #n_reads
CHANGE_CLE272:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS274:
	.word 0xd087c33a  ! 782: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r8
WR_LEASI_275:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_276:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd09c501a  ! 785: LDDA_R	ldda	[%r17, %r26] 0x80, %r8
	.word 0xd1bcd03a  ! 787: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd033401a  ! 788: STH_R	sth	%r8, [%r13 + %r26]
NC_BIS_AIUS277:
	.word 0xd0b7c57a  ! 790: STHA_R	stha	%r8, [%r31 + %r26] 0x2b
	.word 0xd0d4913a  ! 792: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
CHANGE_USER278:
	ta	T_CHANGE_NONPRIV
CHANGE_R26279:
	add	%r26,	%r27,	%r26
NC_BIS_PRI279:
	.word 0xc4a41c5a  ! 794: STWA_R	stwa	%r2, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP281:
	.word 0xd0d6421a  ! 796: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r8
	.word 0xd184903a  ! 798: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0a4d03a  ! 800: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
NC_AIUS282:
	.word 0xd087c33a  ! 802: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r8
SET_TL1_283:
	ta	T_CHANGE_TO_TL1
CHANGE_R26284:
	add	%r26,	%r27,	%r26
NC_BIS_NUC284:
	.word 0xd0bd44fa  ! 804: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xd09a905a  ! 805: LDDA_R	ldda	[%r10, %r26] 0x82, %r8
CP_ATM_QUAD_LD285:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 807: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xd09b901a  ! 809: LDDA_R	ldda	[%r14, %r26] 0x80, %r8
	.word 0xd0a4903a  ! 811: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
NC_PST_PRI286:
	.word 0xd1bb989a  ! 813: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_QUAD_LD287:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 815: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xd19c903a  ! 817: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd19b901a  ! 819: LDDFA_R	ldda	[%r14, %r26], %f8
	.word 0xd0a3d11a  ! 821: STWA_R	stwa	%r8, [%r15 + %r26] 0x88
	.word 0xd1a2901a  ! 822: STFA_R	sta	%f8, [%r26, %r10]
NC_BIS_AIUP288:
	.word 0xc4be455a  ! 824: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
	.word 0xd0acd03a  ! 826: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd09c101a  ! 828: LDDA_R	ldda	[%r16, %r26] 0x80, %r8
CP_BIS_NUC289:
	and	%r26,	%r28,	%r26
	.word 0xc8bd04fa  ! 830: STDA_R	stda	%r4, [%r20 + %r26] 0x27
NC_AIUP290:
	.word 0xd0a6421a  ! 832: STWA_R	stwa	%r8, [%r25 + %r26] 0x10
CHANGE_R26291:
	add	%r26,	%r27,	%r26
CP_BIS_SEC291:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 834: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xd07b6004  ! 835: SWAP_I	swap	%r8, [%r13 + 0x0004]
NC_BLK_SEc292:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 837: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd1a2911a  ! 838: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd0b4d13a  ! 840: STHA_R	stha	%r8, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD293:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 842: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xd0ccd03a  ! 844: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	.word 0xd0bcd13a  ! 846: STDA_R	stda	%r8, [%r19 + %r26] 0x89
CP_BIS_NUC294:
	and	%r26,	%r28,	%r26
	.word 0xcca504fa  ! 848: STWA_R	stwa	%r6, [%r20 + %r26] 0x27
CP_AIUP295:
	.word 0xd096021a  ! 850: LDUHA_R	lduha	[%r24, %r26] 0x10, %r8
	.word 0xd084d03a  ! 852: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
NC_AIUP296:
	.word 0xd09e421a  ! 854: LDDA_R	ldda	[%r25, %r26] 0x10, %r8
	.word 0xd1a3101a  ! 855: STFA_R	sta	%f8, [%r26, %r12]
CP_PST_PRI297:
	.word 0xd1bb599a  ! 857: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0b4903a  ! 859: STHA_R	stha	%r8, [%r18 + %r26] 0x81
SET_TL0_298:
	ta	T_CHANGE_TO_TL0
CHANGE_R26299:
	add	%r26,	%r27,	%r26
NC_BIS_SEC299:
	.word 0xd0f4dc7a  ! 861: STXA_R	stxa	%r8, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS301:
	.word 0xd1a7823a  ! 863: STFA_R	sta	%f8, [%r26, %r30]
	.word 0xd043001a  ! 864: LDSW_R	ldsw	[%r12 + %r26], %r8
	.word 0xd1a4903a  ! 866: STFA_R	sta	%f8, [%r26, %r18]
NC_BIS_AIUP302:
	.word 0xc4ae445a  ! 868: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_BLK_SEc303:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 870: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_USER304:
	ta	T_CHANGE_NONPRIV
CHANGE_R26305:
	add	%r26,	%r27,	%r26
NC_BIS_PRI305:
	.word 0xccf41c5a  ! 872: STXA_R	stxa	%r6, [%r16 + %r26] 0xe2
	.word 0xd094913a  ! 874: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
NC_BIS_SEC306:
	.word 0xc4bcdc7a  ! 876: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xd09cd03a  ! 878: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
NC_BIS_PRI307:
	.word 0xc4bc5c5a  ! 880: STDA_R	stda	%r2, [%r17 + %r26] 0xe2
NC_BIS_SEC308:
	.word 0xcca4dd7a  ! 882: STWA_R	stwa	%r6, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP310:
	.word 0xd1be421a  ! 884: STDFA_R	stda	%f8, [%r26, %r25]
NC_BLK_SEc311:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 886: LDDFA_R	ldda	[%r19, %r26], %f16
CP_NUC312:
	.word 0xd1f5201a  ! 888: CASXA_R	casxa	[%r20]%asi, %r26, %r8
CP_BIS_QUAD_LD313:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 890: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd0a4903a  ! 892: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
CP_AIUP314:
	.word 0xd0ae031a  ! 894: STBA_R	stba	%r8, [%r24 + %r26] 0x18
NC_BLK_SEc315:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 896: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd093d01a  ! 898: LDUHA_R	lduha	[%r15, %r26] 0x80, %r8
CHANGE_USER316:
	ta	T_CHANGE_NONPRIV
CHANGE_R26317:
	add	%r26,	%r27,	%r26
CP_BIS_PRI317:
	and	%r26,	%r28,	%r26
	.word 0xccbb1c5a  ! 900: STDA_R	stda	%r6, [%r12 + %r26] 0xe2
SET_TL1_318:
	ta	T_CHANGE_TO_TL1
CHANGE_R26319:
	add	%r26,	%r27,	%r26
NC_BIS_NUC319:
	.word 0xd0bd44fa  ! 902: STDA_R	stda	%r8, [%r21 + %r26] 0x27
CP_AIUP320:
	.word 0xd0ae021a  ! 904: STBA_R	stba	%r8, [%r24 + %r26] 0x10
	.word 0xd084d03a  ! 906: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd0a4913a  ! 908: STWA_R	stwa	%r8, [%r18 + %r26] 0x89
	.word 0xc36f801a  ! 910: PREFETCH_R	prefetch	[%r30 + %r26], #one_read
	.word 0xd0b4903a  ! 912: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	.word 0xd08c101a  ! 914: LDUBA_R	lduba	[%r16, %r26] 0x80, %r8
	.word 0xd08b911a  ! 916: LDUBA_R	lduba	[%r14, %r26] 0x88, %r8
	.word 0xd08c903a  ! 918: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd184101a  ! 920: LDFA_R	lda	[%r16, %r26], %f8
	.word 0xd0acd03a  ! 922: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd184903a  ! 924: LDFA_R	lda	[%r18, %r26], %f8
NC_BIS_NUC321:
	.word 0xc4b544fa  ! 926: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xd1a4511a  ! 928: STFA_R	sta	%f8, [%r26, %r17]
CP_PST_PRI322:
	.word 0xd1bb191a  ! 930: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd094111a  ! 932: LDUHA_R	lduha	[%r16, %r26] 0x88, %r8
	.word 0xd0d4d03a  ! 934: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
	.word 0xd082d01a  ! 935: LDUWA_R	lduwa	[%r11, %r26] 0x80, %r8
CP_BIS_NUC323:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 937: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
CP_BIS_QUAD_LD324:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 939: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	.word 0xd013001a  ! 940: LDUH_R	lduh	[%r12 + %r26], %r8
NC_BIS_AIUS325:
	.word 0xd0a7c57a  ! 942: STWA_R	stwa	%r8, [%r31 + %r26] 0x2b
	.word 0xd032a006  ! 943: STH_I	sth	%r8, [%r10 + 0x0006]
	.word 0xd0cc101a  ! 945: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r8
CP_BIS_NUC326:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 947: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
SET_TL0_327:
	ta	T_CHANGE_TO_TL0
CHANGE_R26328:
	add	%r26,	%r27,	%r26
NC_BIS_SEC328:
	.word 0xc8bcdd7a  ! 949: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
CHANGE_PRIV329:
	ta	T_CHANGE_PRIV
CHANGE_R26330:
	add	%r26,	%r27,	%r26
CP_BIS_NUC330:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 951: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
	.word 0xd1bb101a  ! 952: STDFA_R	stda	%f8, [%r26, %r12]
CHANGE_USER331:
	ta	T_CHANGE_NONPRIV
CHANGE_R26332:
	add	%r26,	%r27,	%r26
CP_BIS_PRI332:
	and	%r26,	%r28,	%r26
	.word 0xc4ab1d5a  ! 954: STBA_R	stba	%r2, [%r12 + %r26] 0xea
CHANGE_PRIV333:
	ta	T_CHANGE_PRIV
CHANGE_R26334:
	mov	%g0,	%r26
CP_ATM_QUAD_LD334:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 956: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_AIUP335:
	.word 0xd1be031a  ! 958: STDFA_R	stda	%f8, [%r26, %r24]
CHANGE_USER336:
	ta	T_CHANGE_NONPRIV
CHANGE_R26337:
	add	%r26,	%r27,	%r26
CP_BIS_PRI337:
	and	%r26,	%r28,	%r26
	.word 0xd0aa9d5a  ! 960: STBA_R	stba	%r8, [%r10 + %r26] 0xea
	.word 0xd0bb111a  ! 961: STDA_R	stda	%r8, [%r12 + %r26] 0x88
CHANGE_PRIV338:
	ta	T_CHANGE_PRIV
CHANGE_R26339:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS339:
	.word 0xccbfc47a  ! 963: STDA_R	stda	%r6, [%r31 + %r26] 0x23
CP_AIUS340:
	.word 0xd087823a  ! 965: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r8
CP_AIUP341:
	.word 0xd1a6031a  ! 967: STFA_R	sta	%f8, [%r26, %r24]
	.word 0xd082915a  ! 968: LDUWA_R	lduwa	[%r10, %r26] 0x8a, %r8
NC_PST_PRI342:
	.word 0xd1bbd91a  ! 970: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd02aa007  ! 971: STB_I	stb	%r8, [%r10 + 0x0007]
	.word 0xd1ba911a  ! 972: STDFA_R	stda	%f8, [%r26, %r10]
CHANGE_USER343:
	ta	T_CHANGE_NONPRIV
CHANGE_R26344:
	add	%r26,	%r27,	%r26
CP_BIS_PRI344:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 974: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS346:
	.word 0xd0bfc23a  ! 976: STDA_R	stda	%r8, [%r31 + %r26] 0x11
CP_ATM_QUAD_LD347:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 978: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
CP_BIS_NUC348:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 980: STDA_R	stda	%r2, [%r20 + %r26] 0x27
	.word 0xd0a3911a  ! 982: STWA_R	stwa	%r8, [%r14 + %r26] 0x88
	.word 0xd09c903a  ! 984: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
CHANGE_R26349:
	add	%r26,	%r27,	%r26
CP_BIS_SEC349:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 986: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
BLK_PRI350:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 988: STDFA_R	stda	%f16, [%r26, %r11]
CP_BIS_AIUS351:
	and	%r26,	%r28,	%r26
	.word 0xcc9f847a  ! 990: LDDA_R	ldda	[%r30, %r26] 0x23, %r6
	.word 0xd0bb501a  ! 991: STDA_R	stda	%r8, [%r13 + %r26] 0x80
CP_BIS_AIUP352:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 993: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
CP_ATM_QUAD_LD353:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 995: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xd0c4913a  ! 997: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
CP_PST_PRI354:
	.word 0xd1ba985a  ! 999: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0b4913a  ! 1001: STHA_R	stha	%r8, [%r18 + %r26] 0x89
	.word 0xd0b4d13a  ! 1003: STHA_R	stha	%r8, [%r19 + %r26] 0x89
NC_PST_PRI355:
	.word 0xd1bc181a  ! 1005: STDFA_R	stda	%f8, [%r26, %r16]
CP_PST_PRI356:
	.word 0xd1bb599a  ! 1007: STDFA_R	stda	%f8, [%r26, %r13]
NC_BLK_SEc357:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1009: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd1032004  ! 1010: LDF_I	ld	[%r12, 0x0004], %f8
CHANGE_USER358:
	ta	T_CHANGE_NONPRIV
CHANGE_R26359:
	add	%r26,	%r27,	%r26
CP_BIS_PRI359:
	and	%r26,	%r28,	%r26
	.word 0xcc9b5d5a  ! 1012: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
CHANGE_PRIV360:
	ta	T_CHANGE_PRIV
CHANGE_R26361:
	add	%r26,	%r27,	%r26
CP_BIS_NUC361:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 1014: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
NC_BIS_AIUP362:
	.word 0xd0b6455a  ! 1016: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
CP_BIS_AIUP363:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 1018: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
CP_NUC364:
	.word 0xd1e5201a  ! 1020: CASA_R	casa	[%r20] %asi, %r26, %r8
	.word 0xd0cc501a  ! 1022: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r8
	.word 0xd09cd03a  ! 1024: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd052c01a  ! 1025: LDSH_R	ldsh	[%r11 + %r26], %r8
	.word 0xd05b401a  ! 1026: LDX_R	ldx	[%r13 + %r26], %r8
CP_BIS_AIUP365:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 1028: STDA_R	stda	%r6, [%r24 + %r26] 0x22
	.word 0xd1a2911a  ! 1029: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd1e2a01a  ! 1030: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd084501a  ! 1032: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
	.word 0xd13a801a  ! 1033: STDF_R	std	%f8, [%r26, %r10]
NC_AIUS366:
	.word 0xd0dfc23a  ! 1035: LDXA_R	ldxa	[%r31, %r26] 0x11, %r8
	.word 0xd182901a  ! 1036: LDFA_R	lda	[%r10, %r26], %f8
CP_BIS_QUAD_LD367:
	and	%r26,	%r29,	%r26
	.word 0xd09add5a  ! 1038: LDDA_R	ldda	[%r11, %r26] 0xea, %r8
	.word 0xd09cd13a  ! 1040: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	.word 0xd0cc913a  ! 1042: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r8
	.word 0xd0d3501a  ! 1043: LDSHA_R	ldsha	[%r13, %r26] 0x80, %r8
	.word 0xd0ccd03a  ! 1045: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
NC_NUC368:
	.word 0xd0c5419a  ! 1047: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r8
NC_BLK_SEc369:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1049: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd084d13a  ! 1051: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
	.word 0xd122801a  ! 1052: STF_R	st	%f8, [%r26, %r10]
NC_BIS_AIUP370:
	.word 0xd0ae445a  ! 1054: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xd1a3901a  ! 1056: STFA_R	sta	%f8, [%r26, %r14]
CP_BIS_NUC371:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 1058: STHA_R	stha	%r6, [%r20 + %r26] 0x27
	.word 0xd1bc903a  ! 1060: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd1f2e01a  ! 1061: CASXA_R	casxa	[%r11]%asi, %r26, %r8
NC_BLK_SEc372:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1063: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd093901a  ! 1065: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
SHORT_FP_PRI373:
	.word 0xd19b5b5a  ! 1067: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd08ad05a  ! 1068: LDUBA_R	lduba	[%r11, %r26] 0x82, %r8
	.word 0xd0ea901a  ! 1069: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
	.word 0xd03aa000  ! 1070: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd184913a  ! 1072: LDFA_R	lda	[%r18, %r26], %f8
CP_ATM_QUAD_LD374:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1074: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_BIS_AIUS375:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 1076: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
	.word 0xd002a004  ! 1077: LDUW_I	lduw	[%r10 + 0x0004], %r8
	.word 0xd022801a  ! 1078: STW_R	stw	%r8, [%r10 + %r26]
NC_BIS_SEC376:
	.word 0xc4a4dc7a  ! 1080: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
NC_BLK_SEc377:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1082: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd06b001a  ! 1083: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
CHANGE_USER378:
	ta	T_CHANGE_NONPRIV
CHANGE_R26379:
	mov	%g0,	%r26
CP_BIS_PRI379:
	and	%r26,	%r28,	%r26
	.word 0xc8a31c5a  ! 1085: STWA_R	stwa	%r4, [%r12 + %r26] 0xe2
	.word 0xd13b2000  ! 1086: STDF_I	std	%f8, [0x0000, %r12]
	.word 0xd08c913a  ! 1088: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd08cd13a  ! 1090: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
SHORT_FP_PRI380:
	.word 0xd19b1a5a  ! 1092: LDDFA_R	ldda	[%r12, %r26], %f8
CHANGE_PRIV381:
	ta	T_CHANGE_PRIV
CHANGE_R26382:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP382:
	.word 0xccbe455a  ! 1094: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
	.word 0xd083911a  ! 1096: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r8
NC_BIS_AIUP383:
	.word 0xc4a6455a  ! 1098: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
	.word 0xd0ccd13a  ! 1100: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
	.word 0xd13b6000  ! 1101: STDF_I	std	%f8, [0x0000, %r13]
NC_NUC384:
	.word 0xd1a5409a  ! 1103: STFA_R	sta	%f8, [%r26, %r21]
	.word 0xd19c501a  ! 1105: LDDFA_R	ldda	[%r17, %r26], %f8
	.word 0xd0a4d13a  ! 1107: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
	.word 0xd11b401a  ! 1108: LDDF_R	ldd	[%r13, %r26], %f8
CP_BIS_AIUS385:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 1110: STBA_R	stba	%r2, [%r30 + %r26] 0x23
NC_BIS_AIUS386:
	.word 0xc4f7c47a  ! 1112: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd13aa000  ! 1113: STDF_I	std	%f8, [0x0000, %r10]
	.word 0xd03ae000  ! 1114: STD_I	std	%r8, [%r11 + 0x0000]
CP_BIS_AIUP387:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 1116: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
NC_BIS_AIUS388:
	.word 0xd0a7c57a  ! 1118: STWA_R	stwa	%r8, [%r31 + %r26] 0x2b
	.word 0xd11ac01a  ! 1119: LDDF_R	ldd	[%r11, %r26], %f8
	.word 0xd0b4d03a  ! 1121: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xd0ead01a  ! 1122: LDSTUBA_R	ldstuba	%r8, [%r11 + %r26] 0x80
NC_AIUS389:
	.word 0xd08fc23a  ! 1124: LDUBA_R	lduba	[%r31, %r26] 0x11, %r8
	.word 0xd0f4913a  ! 1126: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
NC_NUC390:
	.word 0xd09d409a  ! 1128: LDDA_R	ldda	[%r21, %r26] 0x04, %r8
CP_PST_PRI391:
	.word 0xd1bb585a  ! 1130: STDFA_R	stda	%f8, [%r26, %r13]
CP_ATM_QUAD_LD392:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 1132: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
CP_AIUP393:
	.word 0xd096031a  ! 1134: LDUHA_R	lduha	[%r24, %r26] 0x18, %r8
	.word 0xd19b501a  ! 1135: LDDFA_R	ldda	[%r13, %r26], %f8
CHANGE_R26394:
	add	%r26,	%r27,	%r26
CP_BIS_SEC394:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 1137: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
	.word 0xd0a2d01a  ! 1138: STWA_R	stwa	%r8, [%r11 + %r26] 0x80
CHANGE_TLE395:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS397:
	.word 0xd08fc23a  ! 1141: LDUBA_R	lduba	[%r31, %r26] 0x11, %r8
NC_BLK_SEc398:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1143: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd19c101a  ! 1145: LDDFA_R	ldda	[%r16, %r26], %f8
CP_ATM_QUAD_LD399:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 1147: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
	.word 0xd184913a  ! 1149: LDFA_R	lda	[%r18, %r26], %f8
NC_NUC400:
	.word 0xd0cd409a  ! 1151: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r8
CP_ATM_QUAD_LD401:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 1153: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
NC_BIS_AIUP402:
	.word 0xd0ae445a  ! 1155: STBA_R	stba	%r8, [%r25 + %r26] 0x22
WR_LEASI_403:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_404:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd183501a  ! 1157: LDFA_R	lda	[%r13, %r26], %f8
NC_BIS_SEC405:
	.word 0xd0b4dc7a  ! 1159: STHA_R	stha	%r8, [%r19 + %r26] 0xe3
	.word 0xd0bad01a  ! 1160: STDA_R	stda	%r8, [%r11 + %r26] 0x80
	.word 0xd1ba901a  ! 1161: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0bc511a  ! 1163: STDA_R	stda	%r8, [%r17 + %r26] 0x88
NC_BIS_AIUP406:
	.word 0xccf6445a  ! 1165: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xd19cd03a  ! 1167: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0db901a  ! 1169: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
	.word 0xd0b4d03a  ! 1171: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xc36fe006  ! 1173: PREFETCH_I	prefetch	[%r31 + 0x0006], #one_read
WR_LEASI_407:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_408:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0dcd03a  ! 1176: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0c2d01a  ! 1177: LDSWA_R	ldswa	[%r11, %r26] 0x80, %r8
	.word 0xd19b901a  ! 1179: LDDFA_R	ldda	[%r14, %r26], %f8
CP_BIS_AIUP409:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1181: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd13b2000  ! 1182: STDF_I	std	%f8, [0x0000, %r12]
	.word 0xd0ccd13a  ! 1184: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS410:
	.word 0xc4a7c47a  ! 1186: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
NC_PST_PRI411:
	.word 0xd1bc591a  ! 1188: STDFA_R	stda	%f8, [%r26, %r17]
NC_AIUP412:
	.word 0xd08e421a  ! 1190: LDUBA_R	lduba	[%r25, %r26] 0x10, %r8
NC_BIS_AIUP413:
	.word 0xc4be445a  ! 1192: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUS414:
	.word 0xccb7c47a  ! 1194: STHA_R	stha	%r6, [%r31 + %r26] 0x23
CHANGE_USER415:
	ta	T_CHANGE_NONPRIV
CHANGE_R26416:
	add	%r26,	%r27,	%r26
NC_BIS_PRI416:
	.word 0xd0b41d5a  ! 1196: STHA_R	stha	%r8, [%r16 + %r26] 0xea
CHANGE_PRIV417:
	ta	T_CHANGE_PRIV
CHANGE_R26418:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP418:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 1198: STHA_R	stha	%r2, [%r24 + %r26] 0x22
CP_BIS_AIUP419:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 1200: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xd09c511a  ! 1202: LDDA_R	ldda	[%r17, %r26] 0x88, %r8
CHANGE_USER420:
	ta	T_CHANGE_NONPRIV
CHANGE_R26421:
	add	%r26,	%r27,	%r26
CP_BIS_PRI421:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 1204: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xd1bc501a  ! 1206: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd1a2901a  ! 1207: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd184903a  ! 1209: LDFA_R	lda	[%r18, %r26], %f8
NC_PST_PRI422:
	.word 0xd1bc589a  ! 1211: STDFA_R	stda	%f8, [%r26, %r17]
NC_BIS_PRI423:
	.word 0xccab9d5a  ! 1213: STBA_R	stba	%r6, [%r14 + %r26] 0xea
	.word 0xd08b515a  ! 1214: LDUBA_R	lduba	[%r13, %r26] 0x8a, %r8
NC_PST_PRI424:
	.word 0xd1bb981a  ! 1216: STDFA_R	stda	%f8, [%r26, %r14]
NC_BIS_PRI425:
	.word 0xc4bb9c5a  ! 1218: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
	.word 0xd084d03a  ! 1220: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
CHANGE_R26426:
	add	%r26,	%r27,	%r26
CP_BIS_SEC426:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9d7a  ! 1222: STBA_R	stba	%r4, [%r18 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS428:
	.word 0xd097c23a  ! 1224: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
	.word 0xd07ae004  ! 1225: SWAP_I	swap	%r8, [%r11 + 0x0004]
CHANGE_R26429:
	add	%r26,	%r27,	%r26
CP_BIS_SEC429:
	and	%r26,	%r28,	%r26
	.word 0xc4f49d7a  ! 1227: STXA_R	stxa	%r2, [%r18 + %r26] 0xeb
	.word 0xd122801a  ! 1228: STF_R	st	%f8, [%r26, %r10]
CP_BIS_NUC430:
	and	%r26,	%r28,	%r26
	.word 0xccb505fa  ! 1230: STHA_R	stha	%r6, [%r20 + %r26] 0x2f
	.word 0xd11b6000  ! 1231: LDDF_I	ldd	[%r13, 0x0000], %f8
	.word 0xd0db901a  ! 1233: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
NC_PST_PRI431:
	.word 0xd1bb991a  ! 1235: STDFA_R	stda	%f8, [%r26, %r14]
NC_BIS_AIUS432:
	.word 0xc8a7c57a  ! 1237: STWA_R	stwa	%r4, [%r31 + %r26] 0x2b
	.word 0xd0bc903a  ! 1239: STDA_R	stda	%r8, [%r18 + %r26] 0x81
CHANGE_USER433:
	ta	T_CHANGE_NONPRIV
CHANGE_R26434:
	add	%r26,	%r27,	%r26
CP_BIS_PRI434:
	and	%r26,	%r28,	%r26
	.word 0xd0b29c5a  ! 1241: STHA_R	stha	%r8, [%r10 + %r26] 0xe2
BLK_PRI435:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5f1a  ! 1243: STDFA_R	stda	%f16, [%r26, %r13]
CHANGE_PRIV436:
	ta	T_CHANGE_PRIV
CHANGE_R26437:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS437:
	and	%r26,	%r28,	%r26
	.word 0xc8b7847a  ! 1245: STHA_R	stha	%r4, [%r30 + %r26] 0x23
WR_LEASI_438:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_439:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_NUC440:
	.word 0xd1bd409a  ! 1248: STDFA_R	stda	%f8, [%r26, %r21]
CP_BIS_QUAD_LD441:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 1250: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xd094913a  ! 1252: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
NC_BIS_SEC442:
	.word 0xc8bcdc7a  ! 1254: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
CP_NUC443:
	.word 0xd1f5201a  ! 1256: CASXA_R	casxa	[%r20]%asi, %r26, %r8
CP_BIS_QUAD_LD444:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1258: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd094913a  ! 1260: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
CP_AIUS445:
	.word 0xd0c7823a  ! 1262: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
	.word 0xd06b001a  ! 1263: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
CP_PST_PRI446:
	.word 0xd1ba999a  ! 1265: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd1a3d01a  ! 1267: STFA_R	sta	%f8, [%r26, %r15]
	.word 0xd0ea901a  ! 1268: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
	.word 0xd0cc501a  ! 1270: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r8
	.word 0xd13ae000  ! 1271: STDF_I	std	%f8, [0x0000, %r11]
SHORT_FP_PRI447:
	.word 0xd19adb1a  ! 1273: LDDFA_R	ldda	[%r11, %r26], %f8
CP_BIS_QUAD_LD448:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 1275: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
NC_BIS_AIUP449:
	.word 0xcca6445a  ! 1277: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
CHANGE_USER450:
	ta	T_CHANGE_NONPRIV
CHANGE_R26451:
	add	%r26,	%r27,	%r26
CP_BIS_PRI451:
	and	%r26,	%r28,	%r26
	.word 0xd0ab5d5a  ! 1279: STBA_R	stba	%r8, [%r13 + %r26] 0xea
	.word 0xd042a004  ! 1280: LDSW_I	ldsw	[%r10 + 0x0004], %r8
SET_TL1_452:
	ta	T_CHANGE_TO_TL1
CHANGE_R26453:
	add	%r26,	%r27,	%r26
NC_BIS_NUC453:
	.word 0xc4ad45fa  ! 1282: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xd183101a  ! 1283: LDFA_R	lda	[%r12, %r26], %f8
CP_AIUP454:
	.word 0xd0de021a  ! 1285: LDXA_R	ldxa	[%r24, %r26] 0x10, %r8
NC_BLK_SEc455:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1288: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xd0ac511a  ! 1290: STBA_R	stba	%r8, [%r17 + %r26] 0x88
NC_BIS_NUC456:
	.word 0xc4f544fa  ! 1292: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
SET_TL0_457:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI458:
	.word 0xd0b41c5a  ! 1294: STHA_R	stha	%r8, [%r16 + %r26] 0xe2
	.word 0xd0bad11a  ! 1295: STDA_R	stda	%r8, [%r11 + %r26] 0x88
NC_BIS_SEC459:
	.word 0xc4acdc7a  ! 1297: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd0dc903a  ! 1299: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
SET_TL1_460:
	ta	T_CHANGE_TO_TL1
CHANGE_R26461:
	add	%r26,	%r27,	%r26
NC_BIS_NUC461:
	.word 0xc8b544fa  ! 1301: STHA_R	stha	%r4, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD462:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1303: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_PST_PRI463:
	.word 0xd1bc585a  ! 1305: STDFA_R	stda	%f8, [%r26, %r17]
CP_ATM_QUAD_LD464:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 1307: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xd07aa004  ! 1308: SWAP_I	swap	%r8, [%r10 + 0x0004]
NC_BLK_SEc465:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1310: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUP466:
	.word 0xd0a6031a  ! 1312: STWA_R	stwa	%r8, [%r24 + %r26] 0x18
CP_BIS_AIUP467:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 1314: STDA_R	stda	%r4, [%r24 + %r26] 0x22
NC_BIS_AIUS468:
	.word 0xc8bfc47a  ! 1316: STDA_R	stda	%r4, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD469:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1318: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
CP_PST_PRI470:
	.word 0xd1ba999a  ! 1320: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd094101a  ! 1322: LDUHA_R	lduha	[%r16, %r26] 0x80, %r8
	.word 0xd0c4d13a  ! 1324: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
	.word 0xd0dcd03a  ! 1326: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0dc903a  ! 1328: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd1a3501a  ! 1329: STFA_R	sta	%f8, [%r26, %r13]
NC_AIUP471:
	.word 0xd1a6421a  ! 1331: STFA_R	sta	%f8, [%r26, %r25]
CP_NUC472:
	.word 0xd1f5201a  ! 1333: CASXA_R	casxa	[%r20]%asi, %r26, %r8
NC_BIS_AIUP473:
	.word 0xd0f6445a  ! 1335: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
	.word 0xd092901a  ! 1336: LDUHA_R	lduha	[%r10, %r26] 0x80, %r8
NC_BIS_AIUP474:
	.word 0xc4be455a  ! 1338: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
	.word 0xd0c4d03a  ! 1340: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
NC_AIUS475:
	.word 0xd087c33a  ! 1342: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r8
CP_BIS_AIUS476:
	and	%r26,	%r28,	%r26
	.word 0xccbf847a  ! 1344: STDA_R	stda	%r6, [%r30 + %r26] 0x23
	.word 0xd0f4511a  ! 1346: STXA_R	stxa	%r8, [%r17 + %r26] 0x88
	.word 0xd0b3501a  ! 1347: STHA_R	stha	%r8, [%r13 + %r26] 0x80
	.word 0xd0cc903a  ! 1349: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
NC_BIS_NUC477:
	.word 0xc8f544fa  ! 1351: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
	.word 0xd184d03a  ! 1353: LDFA_R	lda	[%r19, %r26], %f8
CP_ATM_QUAD_LD478:
	and	%r26,	%r29,	%r26
	.word 0xcc9b059a  ! 1355: LDDA_R	ldda	[%r12, %r26] 0x2c, %r6
NC_SHORT_FP_SEC479:
	.word 0xd1bcda7a  ! 1358: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd13aa000  ! 1359: STDF_I	std	%f8, [0x0000, %r10]
	.word 0xd0b2d01a  ! 1360: STHA_R	stha	%r8, [%r11 + %r26] 0x80
	.word 0xd0ba901a  ! 1361: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd0b2901a  ! 1362: STHA_R	stha	%r8, [%r10 + %r26] 0x80
	.word 0xd04aa007  ! 1363: LDSB_I	ldsb	[%r10 + 0x0007], %r8
CHANGE_R26480:
	add	%r26,	%r27,	%r26
CP_BIS_SEC480:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9d7a  ! 1365: STDA_R	stda	%r4, [%r18 + %r26] 0xeb
SET_TL0_481:
	ta	T_CHANGE_TO_TL0
CHANGE_R26482:
	mov	%g0,	%r26
NC_BIS_SEC482:
	.word 0xc8f4dc7a  ! 1367: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
NC_BIS_PRI483:
	.word 0xc8bb9c5a  ! 1369: STDA_R	stda	%r4, [%r14 + %r26] 0xe2
CHANGE_PRIV484:
	ta	T_CHANGE_PRIV
CHANGE_R26485:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS485:
	.word 0xd0afc47a  ! 1371: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xd122a004  ! 1372: STF_I	st	%f8, [0x0004, %r10]
	.word 0xd05a801a  ! 1373: LDX_R	ldx	[%r10 + %r26], %r8
	.word 0xd19c903a  ! 1375: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd082905a  ! 1376: LDUWA_R	lduwa	[%r10, %r26] 0x82, %r8
SET_TL1_486:
	ta	T_CHANGE_TO_TL1
CHANGE_R26487:
	add	%r26,	%r27,	%r26
NC_BIS_NUC487:
	.word 0xc4b544fa  ! 1378: STHA_R	stha	%r2, [%r21 + %r26] 0x27
CP_PST_PRI488:
	.word 0xd1bb581a  ! 1380: STDFA_R	stda	%f8, [%r26, %r13]
NC_BIS_NUC489:
	.word 0xccbd44fa  ! 1382: STDA_R	stda	%r6, [%r21 + %r26] 0x27
	.word 0xd0f4d03a  ! 1384: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
	.word 0xd0ac101a  ! 1386: STBA_R	stba	%r8, [%r16 + %r26] 0x80
SET_TL0_490:
	ta	T_CHANGE_TO_TL0
WR_LEASI_491:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_492:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC494:
	.word 0xd1f5201a  ! 1389: CASXA_R	casxa	[%r20]%asi, %r26, %r8
CP_PST_PRI495:
	.word 0xd1bb581a  ! 1391: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0ccd13a  ! 1393: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
	.word 0xd0b3501a  ! 1394: STHA_R	stha	%r8, [%r13 + %r26] 0x80
NC_BIS_AIUS496:
	.word 0xd0bfc57a  ! 1396: STDA_R	stda	%r8, [%r31 + %r26] 0x2b
	.word 0xd053401a  ! 1397: LDSH_R	ldsh	[%r13 + %r26], %r8
NC_NUC497:
	.word 0xd085409a  ! 1399: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r8
	.word 0xd084d13a  ! 1401: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
	.word 0xd09c903a  ! 1403: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd0f3911a  ! 1405: STXA_R	stxa	%r8, [%r14 + %r26] 0x88
	.word 0xd1bcd13a  ! 1407: STDFA_R	stda	%f8, [%r26, %r19]
CP_NUC498:
	.word 0xd0dd009a  ! 1409: LDXA_R	ldxa	[%r20, %r26] 0x04, %r8
	.word 0xd1e3601a  ! 1410: CASA_R	casa	[%r13] %asi, %r26, %r8
	.word 0xd19c903a  ! 1412: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd183901a  ! 1414: LDFA_R	lda	[%r14, %r26], %f8
	.word 0xd0ac101a  ! 1416: STBA_R	stba	%r8, [%r16 + %r26] 0x80
CHANGE_USER499:
	ta	T_CHANGE_NONPRIV
CHANGE_R26500:
	add	%r26,	%r27,	%r26
CP_BIS_PRI500:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1418: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV501:
	ta	T_CHANGE_PRIV
CHANGE_R26502:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP502:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1420: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xd094d03a  ! 1422: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd19a911a  ! 1423: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd0dc903a  ! 1425: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd1a3511a  ! 1426: STFA_R	sta	%f8, [%r26, %r13]
	.word 0xd022a004  ! 1427: STW_I	stw	%r8, [%r10 + 0x0004]
	.word 0xd09cd03a  ! 1429: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd1bc903a  ! 1431: STDFA_R	stda	%f8, [%r26, %r18]
CP_AIUS503:
	.word 0xd0df823a  ! 1433: LDXA_R	ldxa	[%r30, %r26] 0x11, %r8
	.word 0xd19c903a  ! 1435: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd0c4903a  ! 1437: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
	.word 0xd183911a  ! 1439: LDFA_R	lda	[%r14, %r26], %f8
	.word 0xd08cd03a  ! 1441: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd0b4903a  ! 1443: STHA_R	stha	%r8, [%r18 + %r26] 0x81
CP_BIS_AIUS504:
	and	%r26,	%r28,	%r26
	.word 0xcca7847a  ! 1445: STWA_R	stwa	%r6, [%r30 + %r26] 0x23
	.word 0xd184d13a  ! 1447: LDFA_R	lda	[%r19, %r26], %f8
CP_AIUP505:
	.word 0xd0b6031a  ! 1449: STHA_R	stha	%r8, [%r24 + %r26] 0x18
	.word 0xd19c903a  ! 1451: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd0c4d03a  ! 1453: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
CP_ATM_QUAD_LD506:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 1455: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
CHANGE_TLE507:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd19cd03a  ! 1458: LDDFA_R	ldda	[%r19, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP509:
	.word 0xd1a6431a  ! 1460: STFA_R	sta	%f8, [%r26, %r25]
CP_BIS_NUC510:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 1462: STDA_R	stda	%r6, [%r20 + %r26] 0x27
	.word 0xd19cd03a  ! 1464: LDDFA_R	ldda	[%r19, %r26], %f8
CP_ATM_QUAD_LD511:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 1466: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
NC_NUC512:
	.word 0xd0bd409a  ! 1468: STDA_R	stda	%r8, [%r21 + %r26] 0x04
NC_BIS_SEC513:
	.word 0xccf4dc7a  ! 1470: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xd0acd03a  ! 1472: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CP_NUC514:
	.word 0xd0a5019a  ! 1474: STWA_R	stwa	%r8, [%r20 + %r26] 0x0c
CP_BIS_NUC515:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1476: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xd093911a  ! 1478: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
	.word 0xd0b3901a  ! 1480: STHA_R	stha	%r8, [%r14 + %r26] 0x80
	.word 0xe76fc01a  ! 1482: PREFETCH_R	prefetch	[%r31 + %r26], #19
	.word 0xd1bb111a  ! 1483: STDFA_R	stda	%f8, [%r26, %r12]
NC_AIUS516:
	.word 0xd19fc33a  ! 1485: LDDFA_R	ldda	[%r31, %r26], %f8
	.word 0xd0c4101a  ! 1487: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r8
CP_BIS_NUC517:
	and	%r26,	%r28,	%r26
	.word 0xd0b504fa  ! 1489: STHA_R	stha	%r8, [%r20 + %r26] 0x27
	.word 0xd08c903a  ! 1491: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd0a4111a  ! 1493: STWA_R	stwa	%r8, [%r16 + %r26] 0x88
	.word 0xd0bc101a  ! 1495: STDA_R	stda	%r8, [%r16 + %r26] 0x80
	.word 0xd0acd03a  ! 1497: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CP_AIUS518:
	.word 0xd08f823a  ! 1499: LDUBA_R	lduba	[%r30, %r26] 0x11, %r8
	.word 0xd0d2905a  ! 1500: LDSHA_R	ldsha	[%r10, %r26] 0x82, %r8
CP_NUC519:
	.word 0xd0c5009a  ! 1502: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r8
	.word 0xd11b401a  ! 1503: LDDF_R	ldd	[%r13, %r26], %f8
	.word 0xd1e2e01a  ! 1504: CASA_R	casa	[%r11] %asi, %r26, %r8
SHORT_FP_PRI520:
	.word 0xd1bb1a1a  ! 1506: STDFA_R	stda	%f8, [%r26, %r12]
CP_BIS_QUAD_LD521:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 1508: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
NC_BIS_SEC522:
	.word 0xc8f4dd7a  ! 1510: STXA_R	stxa	%r4, [%r19 + %r26] 0xeb
CP_BIS_AIUP523:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 1512: STDA_R	stda	%r6, [%r24 + %r26] 0x22
BLK_PRI524:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 1514: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xd0c4903a  ! 1516: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
CP_ATM_QUAD_LD525:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 1518: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xd184d13a  ! 1520: LDFA_R	lda	[%r19, %r26], %f8
SET_TL1_526:
	ta	T_CHANGE_TO_TL1
CHANGE_R26527:
	add	%r26,	%r27,	%r26
NC_BIS_NUC527:
	.word 0xc8bd44fa  ! 1522: STDA_R	stda	%r4, [%r21 + %r26] 0x27
	.word 0xd07b2004  ! 1523: SWAP_I	swap	%r8, [%r12 + 0x0004]
	.word 0xd1bcd13a  ! 1525: STDFA_R	stda	%f8, [%r26, %r19]
NC_AIUS528:
	.word 0xd0dfc23a  ! 1527: LDXA_R	ldxa	[%r31, %r26] 0x11, %r8
	.word 0xd0b4d13a  ! 1529: STHA_R	stha	%r8, [%r19 + %r26] 0x89
NC_AIUP529:
	.word 0xd0be421a  ! 1531: STDA_R	stda	%r8, [%r25 + %r26] 0x10
NC_PST_PRI530:
	.word 0xd1bc591a  ! 1533: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0bb911a  ! 1535: STDA_R	stda	%r8, [%r14 + %r26] 0x88
	.word 0xd0b4903a  ! 1537: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	.word 0xd0736000  ! 1538: STX_I	stx	%r8, [%r13 + 0x0000]
	.word 0xd0f3901a  ! 1540: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
SET_TL0_531:
	ta	T_CHANGE_TO_TL0
CHANGE_R26532:
	mov	%g0,	%r26
NC_BIS_SEC532:
	.word 0xd0acdd7a  ! 1542: STBA_R	stba	%r8, [%r19 + %r26] 0xeb
	.word 0xd0f4903a  ! 1544: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd032801a  ! 1545: STH_R	sth	%r8, [%r10 + %r26]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS534:
	.word 0xd09fc23a  ! 1547: LDDA_R	ldda	[%r31, %r26] 0x11, %r8
NC_BLK_SEc535:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1549: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd084903a  ! 1551: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd08cd03a  ! 1553: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd0fa901a  ! 1554: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x80
	.word 0xd1a3901a  ! 1556: STFA_R	sta	%f8, [%r26, %r14]
NC_BIS_SEC536:
	.word 0xc4bcdc7a  ! 1558: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
NC_BIS_AIUP537:
	.word 0xd0b6445a  ! 1560: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xd1a3911a  ! 1562: STFA_R	sta	%f8, [%r26, %r14]
	.word 0xd0cc903a  ! 1564: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd0c4511a  ! 1566: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r8
	.word 0xd09c511a  ! 1568: LDDA_R	ldda	[%r17, %r26] 0x88, %r8
	.word 0xd0d4d03a  ! 1570: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
CP_BIS_AIUP538:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 1572: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
	.word 0xd09cd03a  ! 1574: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CHANGE_R26539:
	add	%r26,	%r27,	%r26
CP_BIS_SEC539:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1576: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xd0f2901a  ! 1577: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
	.word 0xd0c4d13a  ! 1579: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS540:
	.word 0xc4afc57a  ! 1581: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xd013001a  ! 1582: LDUH_R	lduh	[%r12 + %r26], %r8
CP_AIUS541:
	.word 0xd187823a  ! 1584: LDFA_R	lda	[%r30, %r26], %f8
	.word 0xd0f3501a  ! 1585: STXA_R	stxa	%r8, [%r13 + %r26] 0x80
	.word 0xd082d05a  ! 1586: LDUWA_R	lduwa	[%r11, %r26] 0x82, %r8
	.word 0xd1bb511a  ! 1587: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd19c913a  ! 1589: LDDFA_R	ldda	[%r18, %r26], %f8
CHANGE_R26542:
	add	%r26,	%r27,	%r26
CP_BIS_SEC542:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 1591: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xd07aa004  ! 1592: SWAP_I	swap	%r8, [%r10 + 0x0004]
NC_BLK_SEc543:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1594: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUP544:
	.word 0xc8b6445a  ! 1596: STHA_R	stha	%r4, [%r25 + %r26] 0x22
	.word 0xd084d13a  ! 1598: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS545:
	.word 0xccf7c47a  ! 1600: STXA_R	stxa	%r6, [%r31 + %r26] 0x23
	.word 0xd02ac01a  ! 1601: STB_R	stb	%r8, [%r11 + %r26]
	.word 0xd0bc903a  ! 1603: STDA_R	stda	%r8, [%r18 + %r26] 0x81
NC_SHORT_FP_SEC546:
	.word 0xd1bcdb7a  ! 1605: STDFA_R	stda	%f8, [%r26, %r19]
SET_TL1_547:
	ta	T_CHANGE_TO_TL1
CHANGE_R26548:
	add	%r26,	%r27,	%r26
NC_BIS_NUC548:
	.word 0xc8bd45fa  ! 1607: STDA_R	stda	%r4, [%r21 + %r26] 0x2f
	.word 0xd0d4d13a  ! 1609: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
NC_AIUS549:
	.word 0xd0a7c23a  ! 1611: STWA_R	stwa	%r8, [%r31 + %r26] 0x11
	.word 0xd0d4903a  ! 1613: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
CP_ATM_QUAD_LD550:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 1615: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
	.word 0xd0b3901a  ! 1617: STHA_R	stha	%r8, [%r14 + %r26] 0x80
	.word 0xd1e3601a  ! 1618: CASA_R	casa	[%r13] %asi, %r26, %r8
	.word 0xd11a801a  ! 1619: LDDF_R	ldd	[%r10, %r26], %f8
	.word 0xd183501a  ! 1620: LDFA_R	lda	[%r13, %r26], %f8
CP_BIS_AIUS551:
	and	%r26,	%r28,	%r26
	.word 0xc8af857a  ! 1622: STBA_R	stba	%r4, [%r30 + %r26] 0x2b
	.word 0xd0a3911a  ! 1624: STWA_R	stwa	%r8, [%r14 + %r26] 0x88
	.word 0xd042c01a  ! 1625: LDSW_R	ldsw	[%r11 + %r26], %r8
NC_AIUP552:
	.word 0xd19e421a  ! 1627: LDDFA_R	ldda	[%r25, %r26], %f8
CP_ATM_QUAD_LD553:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1629: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
SET_TL0_554:
	ta	T_CHANGE_TO_TL0
CHANGE_R26555:
	add	%r26,	%r27,	%r26
NC_BIS_SEC555:
	.word 0xc8a4dc7a  ! 1631: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xd1a4903a  ! 1633: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd103401a  ! 1634: LDF_R	ld	[%r13, %r26], %f8
	.word 0xd0c4111a  ! 1636: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r8
	.word 0xd182901a  ! 1637: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd0b3d11a  ! 1639: STHA_R	stha	%r8, [%r15 + %r26] 0x88
CHANGE_PRIV556:
	ta	T_CHANGE_PRIV
CHANGE_R26557:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS557:
	and	%r26,	%r28,	%r26
	.word 0xc8af847a  ! 1641: STBA_R	stba	%r4, [%r30 + %r26] 0x23
	.word 0xd1036004  ! 1642: LDF_I	ld	[%r13, 0x0004], %f8
	.word 0xd08c913a  ! 1644: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd1bbd01a  ! 1646: STDFA_R	stda	%f8, [%r26, %r15]
CP_NUC558:
	.word 0xd0a5019a  ! 1648: STWA_R	stwa	%r8, [%r20 + %r26] 0x0c
SHORT_FP_PRI559:
	.word 0xd1bb5a1a  ! 1650: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd084501a  ! 1652: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
CP_PST_PRI560:
	.word 0xd1ba985a  ! 1654: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0acd03a  ! 1656: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd183501a  ! 1657: LDFA_R	lda	[%r13, %r26], %f8
CP_AIUS561:
	.word 0xd1bf833a  ! 1659: STDFA_R	stda	%f8, [%r26, %r30]
	.word 0xd0a4d03a  ! 1661: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
	.word 0xd0b4d13a  ! 1663: STHA_R	stha	%r8, [%r19 + %r26] 0x89
	.word 0xd08c903a  ! 1665: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd102c01a  ! 1666: LDF_R	ld	[%r11, %r26], %f8
	.word 0xd19c903a  ! 1668: LDDFA_R	ldda	[%r18, %r26], %f8
CP_BIS_AIUP562:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1670: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
CHANGE_USER563:
	ta	T_CHANGE_NONPRIV
CHANGE_R26564:
	add	%r26,	%r27,	%r26
NC_BIS_PRI564:
	.word 0xc4b41d5a  ! 1672: STHA_R	stha	%r2, [%r16 + %r26] 0xea
	.word 0xd1a4d03a  ! 1674: STFA_R	sta	%f8, [%r26, %r19]
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP566:
	.word 0xd086021a  ! 1676: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r8
	.word 0xd0f4d13a  ! 1678: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
NC_SHORT_FP_SEC567:
	.word 0xd19cdb3a  ! 1680: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0d3d01a  ! 1682: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r8
CP_NUC568:
	.word 0xd09d009a  ! 1684: LDDA_R	ldda	[%r20, %r26] 0x04, %r8
	.word 0xd0dbd01a  ! 1686: LDXA_R	ldxa	[%r15, %r26] 0x80, %r8
CP_AIUS569:
	.word 0xd087823a  ! 1688: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r8
NC_NUC570:
	.word 0xd185409a  ! 1690: LDFA_R	lda	[%r21, %r26], %f8
	.word 0xd0d4903a  ! 1692: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
NC_SHORT_FP_SEC571:
	.word 0xd1bcdb7a  ! 1694: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd1a3901a  ! 1696: STFA_R	sta	%f8, [%r26, %r14]
	.word 0xd08c913a  ! 1698: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
CP_ATM_QUAD_LD572:
	and	%r26,	%r29,	%r26
	.word 0xd09a859a  ! 1700: LDDA_R	ldda	[%r10, %r26] 0x2c, %r8
NC_BIS_SEC573:
	.word 0xc8b4dc7a  ! 1702: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
SET_TL1_574:
	ta	T_CHANGE_TO_TL1
CHANGE_R26575:
	add	%r26,	%r27,	%r26
NC_BIS_NUC575:
	.word 0xc8b545fa  ! 1704: STHA_R	stha	%r4, [%r21 + %r26] 0x2f
	.word 0xd184d03a  ! 1706: LDFA_R	lda	[%r19, %r26], %f8
NC_BLK_SEc576:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1708: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd053401a  ! 1709: LDSH_R	ldsh	[%r13 + %r26], %r8
	.word 0xd1a4d03a  ! 1711: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd13b6000  ! 1712: STDF_I	std	%f8, [0x0000, %r13]
CP_BIS_AIUS577:
	and	%r26,	%r28,	%r26
	.word 0xc4af857a  ! 1714: STBA_R	stba	%r2, [%r30 + %r26] 0x2b
	.word 0xd0f4d03a  ! 1716: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
NC_AIUP578:
	.word 0xd0a6421a  ! 1718: STWA_R	stwa	%r8, [%r25 + %r26] 0x10
NC_BLK_SEc579:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1720: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0f4501a  ! 1722: STXA_R	stxa	%r8, [%r17 + %r26] 0x80
BLK_PRI580:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 1724: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xd0f4903a  ! 1726: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
CP_NUC581:
	.word 0xd0bd009a  ! 1728: STDA_R	stda	%r8, [%r20 + %r26] 0x04
	.word 0xd094d03a  ! 1730: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
SET_TL0_582:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI583:
	.word 0xc4f39c5a  ! 1732: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	.word 0xd19cd13a  ! 1734: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0d3d01a  ! 1736: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r8
	.word 0xd0ac913a  ! 1738: STBA_R	stba	%r8, [%r18 + %r26] 0x89
	.word 0xd184913a  ! 1740: LDFA_R	lda	[%r18, %r26], %f8
CHANGE_PRIV584:
	ta	T_CHANGE_PRIV
CHANGE_R26585:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS585:
	.word 0xccafc47a  ! 1742: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xd08c913a  ! 1744: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd103401a  ! 1745: LDF_R	ld	[%r13, %r26], %f8
	.word 0xd122a004  ! 1746: STF_I	st	%f8, [0x0004, %r10]
	.word 0xd1bad01a  ! 1747: STDFA_R	stda	%f8, [%r26, %r11]
NC_AIUS586:
	.word 0xd0c7c23a  ! 1749: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r8
	.word 0xd094501a  ! 1751: LDUHA_R	lduha	[%r17, %r26] 0x80, %r8
	.word 0xd0fb501a  ! 1752: SWAPA_R	swapa	%r8, [%r13 + %r26] 0x80
WR_LEASI_587:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_588:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_NUC589:
	.word 0xd0d5009a  ! 1755: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r8
	.word 0xd0bcd03a  ! 1757: STDA_R	stda	%r8, [%r19 + %r26] 0x81
NC_BIS_SEC590:
	.word 0xc4f4dc7a  ! 1759: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CP_BIS_NUC591:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 1761: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
	.word 0xd0cc903a  ! 1763: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd13ac01a  ! 1764: STDF_R	std	%f8, [%r26, %r11]
CHANGE_R26592:
	add	%r26,	%r27,	%r26
CP_BIS_SEC592:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 1766: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	.word 0xd11ac01a  ! 1767: LDDF_R	ldd	[%r11, %r26], %f8
CP_AIUP593:
	.word 0xd0ae021a  ! 1769: STBA_R	stba	%r8, [%r24 + %r26] 0x10
	.word 0xd04b401a  ! 1770: LDSB_R	ldsb	[%r13 + %r26], %r8
	.word 0xd1036004  ! 1771: LDF_I	ld	[%r13, 0x0004], %f8
CHANGE_USER594:
	ta	T_CHANGE_NONPRIV
CHANGE_R26595:
	add	%r26,	%r27,	%r26
NC_BIS_PRI595:
	.word 0xc4ab9c5a  ! 1773: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS597:
	.word 0xd1bfc23a  ! 1775: STDFA_R	stda	%f8, [%r26, %r31]
CP_ATM_QUAD_LD598:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 1777: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
	.word 0xd02b2007  ! 1778: STB_I	stb	%r8, [%r12 + 0x0007]
SET_TL1_599:
	ta	T_CHANGE_TO_TL1
CHANGE_R26600:
	add	%r26,	%r27,	%r26
NC_BIS_NUC600:
	.word 0xc4a544fa  ! 1780: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
SET_TL0_601:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI602:
	.word 0xc4b39d5a  ! 1782: STHA_R	stha	%r2, [%r14 + %r26] 0xea
	.word 0xd0ccd03a  ! 1784: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CHANGE_CLE603:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0ccd03a  ! 1787: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS605:
	.word 0xd1bfc23a  ! 1789: STDFA_R	stda	%f8, [%r26, %r31]
CP_BIS_AIUS606:
	and	%r26,	%r28,	%r26
	.word 0xc4f7847a  ! 1791: STXA_R	stxa	%r2, [%r30 + %r26] 0x23
NC_AIUP607:
	.word 0xd19e431a  ! 1793: LDDFA_R	ldda	[%r25, %r26], %f8
CHANGE_TLE608:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS610:
	.word 0xd0c7833a  ! 1796: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r8
CP_PST_PRI611:
	.word 0xd1bb199a  ! 1798: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd093901a  ! 1800: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
	.word 0xd0f4903a  ! 1802: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd0cad01a  ! 1803: LDSBA_R	ldsba	[%r11, %r26] 0x80, %r8
SHORT_FP_PRI612:
	.word 0xd1ba9b5a  ! 1805: STDFA_R	stda	%f8, [%r26, %r10]
NC_NUC613:
	.word 0xd1a5409a  ! 1807: STFA_R	sta	%f8, [%r26, %r21]
CHANGE_CLE614:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd1a2901a  ! 1809: STFA_R	sta	%f8, [%r26, %r10]
NC_PST_PRI615:
	.word 0xd1bc189a  ! 1811: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd19cd03a  ! 1813: LDDFA_R	ldda	[%r19, %r26], %f8
NC_BIS_PRI616:
	.word 0xc8a41c5a  ! 1815: STWA_R	stwa	%r4, [%r16 + %r26] 0xe2
CHANGE_R26617:
	add	%r26,	%r27,	%r26
CP_BIS_SEC617:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 1817: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
CHANGE_PRIV618:
	ta	T_CHANGE_PRIV
CHANGE_R26619:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP619:
	.word 0xd0b6445a  ! 1819: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xd07b6004  ! 1820: SWAP_I	swap	%r8, [%r13 + 0x0004]
	.word 0xd1bbd01a  ! 1822: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd08c101a  ! 1824: LDUBA_R	lduba	[%r16, %r26] 0x80, %r8
	.word 0xd0a4d13a  ! 1826: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
NC_BIS_AIUS620:
	.word 0xc8b7c57a  ! 1828: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
CP_PST_PRI621:
	.word 0xd1bad99a  ! 1830: STDFA_R	stda	%f8, [%r26, %r11]
NC_AIUP622:
	.word 0xd0f6431a  ! 1832: STXA_R	stxa	%r8, [%r25 + %r26] 0x18
	.word 0xd09c903a  ! 1834: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd06a801a  ! 1835: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
	.word 0xd08cd03a  ! 1837: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
SHORT_FP_PRI623:
	.word 0xd1ba9a1a  ! 1839: STDFA_R	stda	%f8, [%r26, %r10]
NC_BIS_AIUS624:
	.word 0xc4b7c47a  ! 1841: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_BLK_SEc625:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1843: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd1bcd03a  ! 1845: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd09cd13a  ! 1847: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	.word 0xd19cd03a  ! 1849: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0ea901a  ! 1850: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
SET_TL1_626:
	ta	T_CHANGE_TO_TL1
CHANGE_R26627:
	add	%r26,	%r27,	%r26
NC_BIS_NUC627:
	.word 0xd0a545fa  ! 1852: STWA_R	stwa	%r8, [%r21 + %r26] 0x2f
	.word 0xd08cd03a  ! 1854: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
NC_NUC628:
	.word 0xd0dd409a  ! 1856: LDXA_R	ldxa	[%r21, %r26] 0x04, %r8
CP_AIUS629:
	.word 0xd09f823a  ! 1858: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
	.word 0xd07aa004  ! 1859: SWAP_I	swap	%r8, [%r10 + 0x0004]
	.word 0xd0ac501a  ! 1861: STBA_R	stba	%r8, [%r17 + %r26] 0x80
CP_NUC630:
	.word 0xd0f5009a  ! 1863: STXA_R	stxa	%r8, [%r20 + %r26] 0x04
NC_BIS_AIUS631:
	.word 0xccafc47a  ! 1865: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xd07aa004  ! 1866: SWAP_I	swap	%r8, [%r10 + 0x0004]
NC_NUC632:
	.word 0xd095419a  ! 1868: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r8
	.word 0xd08c903a  ! 1870: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
CP_BIS_AIUS633:
	and	%r26,	%r28,	%r26
	.word 0xc49f857a  ! 1872: LDDA_R	ldda	[%r30, %r26] 0x2b, %r2
CP_PST_PRI634:
	.word 0xd1bad89a  ! 1874: STDFA_R	stda	%f8, [%r26, %r11]
CP_BIS_AIUP635:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1876: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
CHANGE_R26636:
	add	%r26,	%r27,	%r26
CP_BIS_SEC636:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1878: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CP_PST_PRI637:
	.word 0xd1ba981a  ! 1880: STDFA_R	stda	%f8, [%r26, %r10]
CP_AIUS638:
	.word 0xd0cf823a  ! 1882: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r8
	.word 0xd09cd13a  ! 1884: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
NC_PST_PRI639:
	.word 0xd1bc191a  ! 1886: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd0c4d03a  ! 1888: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd0bcd03a  ! 1890: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd0bcd13a  ! 1892: STDA_R	stda	%r8, [%r19 + %r26] 0x89
NC_NUC640:
	.word 0xd1bd409a  ! 1894: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd0b2901a  ! 1895: STHA_R	stha	%r8, [%r10 + %r26] 0x80
	.word 0xd1bcd03a  ! 1897: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0acd13a  ! 1899: STBA_R	stba	%r8, [%r19 + %r26] 0x89
NC_SHORT_FP_SEC641:
	.word 0xd19cda3a  ! 1901: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0dbd11a  ! 1903: LDXA_R	ldxa	[%r15, %r26] 0x88, %r8
	.word 0xd1ba901a  ! 1904: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0a4d13a  ! 1906: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
	.word 0xd0db911a  ! 1908: LDXA_R	ldxa	[%r14, %r26] 0x88, %r8
CP_ATM_QUAD_LD642:
	and	%r26,	%r29,	%r26
	.word 0xcc9b459a  ! 1910: LDDA_R	ldda	[%r13, %r26] 0x2c, %r6
	.word 0xd184d03a  ! 1912: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd06b6007  ! 1913: LDSTUB_I	ldstub	%r8, [%r13 + 0x0007]
	.word 0xd0f4d03a  ! 1915: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
	.word 0xd0ac101a  ! 1917: STBA_R	stba	%r8, [%r16 + %r26] 0x80
	.word 0xd1ba901a  ! 1918: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd03aa000  ! 1919: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd0f4d13a  ! 1921: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
	.word 0xd0a2901a  ! 1922: STWA_R	stwa	%r8, [%r10 + %r26] 0x80
	.word 0xd1bad01a  ! 1923: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd0f4d13a  ! 1925: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
NC_AIUP643:
	.word 0xd0c6421a  ! 1927: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r8
SET_TL0_644:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI645:
	.word 0xc4f45c5a  ! 1929: STXA_R	stxa	%r2, [%r17 + %r26] 0xe2
	.word 0xd032801a  ! 1930: STH_R	sth	%r8, [%r10 + %r26]
	.word 0xd0bcd13a  ! 1932: STDA_R	stda	%r8, [%r19 + %r26] 0x89
	.word 0xd0bcd03a  ! 1934: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd0c4d13a  ! 1936: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
	.word 0xd1e2e01a  ! 1937: CASA_R	casa	[%r11] %asi, %r26, %r8
CHANGE_PRIV646:
	ta	T_CHANGE_PRIV
CHANGE_R26647:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP647:
	.word 0xccf6455a  ! 1939: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
BLK_PRI648:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 1941: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xd04b6007  ! 1942: LDSB_I	ldsb	[%r13 + 0x0007], %r8
NC_NUC649:
	.word 0xd1a5409a  ! 1944: STFA_R	sta	%f8, [%r26, %r21]
	.word 0xd123401a  ! 1945: STF_R	st	%f8, [%r26, %r13]
CP_PST_PRI650:
	.word 0xd1ba989a  ! 1947: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd09c903a  ! 1949: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
NC_BIS_AIUP651:
	.word 0xccae445a  ! 1951: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xd0d4903a  ! 1953: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd1a4913a  ! 1955: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd184903a  ! 1957: LDFA_R	lda	[%r18, %r26], %f8
NC_BLK_SEc652:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1959: STDFA_R	stda	%f0, [%r26, %r19]
CP_ATM_QUAD_LD653:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 1961: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xd03aa000  ! 1962: STD_I	std	%r8, [%r10 + 0x0000]
BLK_PRI654:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1964: STDFA_R	stda	%f0, [%r26, %r13]
CP_PST_PRI655:
	.word 0xd1bb585a  ! 1966: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0a4d03a  ! 1968: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
BLK_PRI656:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1970: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd0fa901a  ! 1971: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x80
CP_AIUP657:
	.word 0xd0a6021a  ! 1973: STWA_R	stwa	%r8, [%r24 + %r26] 0x10
CHANGE_R26658:
	add	%r26,	%r27,	%r26
CP_BIS_SEC658:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 1975: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
	.word 0xd122801a  ! 1976: STF_R	st	%f8, [%r26, %r10]
	.word 0xd1ba911a  ! 1977: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd1bad01a  ! 1978: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd1e2a01a  ! 1979: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd094903a  ! 1981: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
	.word 0xd13a801a  ! 1982: STDF_R	std	%f8, [%r26, %r10]
BLK_PRI659:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 1984: LDDFA_R	ldda	[%r11, %r26], %f0
SET_TL1_660:
	ta	T_CHANGE_TO_TL1
CHANGE_R26661:
	add	%r26,	%r27,	%r26
NC_BIS_NUC661:
	.word 0xccbd44fa  ! 1986: STDA_R	stda	%r6, [%r21 + %r26] 0x27
	.word 0xd0f4d03a  ! 1988: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
CP_BIS_AIUP662:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 1990: STBA_R	stba	%r8, [%r24 + %r26] 0x22
	.word 0xd084903a  ! 1992: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CP_BIS_QUAD_LD663:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1994: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
NC_BIS_AIUS664:
	.word 0xcca7c57a  ! 1996: STWA_R	stwa	%r6, [%r31 + %r26] 0x2b
CP_BIS_AIUP665:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 1998: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xd0b4d03a  ! 2000: STHA_R	stha	%r8, [%r19 + %r26] 0x81
CP_BIS_NUC666:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 2002: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
	.word 0xd0432004  ! 2003: LDSW_I	ldsw	[%r12 + 0x0004], %r8
NC_BIS_NUC667:
	.word 0xc4a544fa  ! 2005: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
CP_BIS_NUC668:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2007: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
NC_SHORT_FP_SEC669:
	.word 0xd1bcda3a  ! 2009: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd06a801a  ! 2010: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
SET_TL0_670:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI671:
	.word 0xc4abdc5a  ! 2012: STBA_R	stba	%r2, [%r15 + %r26] 0xe2
CHANGE_PRIV672:
	ta	T_CHANGE_PRIV
CHANGE_R26673:
	mov	%g0,	%r26
CP_BIS_NUC673:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 2014: STHA_R	stha	%r4, [%r20 + %r26] 0x27
	.word 0xd11aa000  ! 2015: LDDF_I	ldd	[%r10, 0x0000], %f8
	.word 0xd094d03a  ! 2017: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd19cd03a  ! 2019: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd11aa000  ! 2020: LDDF_I	ldd	[%r10, 0x0000], %f8
	.word 0xd09bd11a  ! 2022: LDDA_R	ldda	[%r15, %r26] 0x88, %r8
	.word 0xd0bc501a  ! 2024: STDA_R	stda	%r8, [%r17 + %r26] 0x80
SET_TL1_674:
	ta	T_CHANGE_TO_TL1
CHANGE_R26675:
	add	%r26,	%r27,	%r26
NC_BIS_NUC675:
	.word 0xc4b545fa  ! 2026: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
SET_TL0_676:
	ta	T_CHANGE_TO_TL0
CHANGE_R26677:
	add	%r26,	%r27,	%r26
NC_BIS_SEC677:
	.word 0xc4b4dd7a  ! 2028: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
	.word 0xd0032004  ! 2029: LDUW_I	lduw	[%r12 + 0x0004], %r8
	.word 0xd07b401a  ! 2030: SWAP_R	swap	%r8, [%r13 + %r26]
CHANGE_PRIV678:
	ta	T_CHANGE_PRIV
CHANGE_R26679:
	add	%r26,	%r27,	%r26
CP_BIS_NUC679:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 2032: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
CP_BIS_AIUP680:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 2034: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xd19cd13a  ! 2036: LDDFA_R	ldda	[%r19, %r26], %f8
CP_NUC681:
	.word 0xd0fd009a  ! 2038: SWAPA_R	swapa	%r8, [%r20 + %r26] 0x04
	.word 0xd01ac01a  ! 2039: LDD_R	ldd	[%r11 + %r26], %r8
NC_BIS_SEC682:
	.word 0xccf4dc7a  ! 2041: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xd06aa007  ! 2042: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
NC_PST_PRI683:
	.word 0xd1bb999a  ! 2044: STDFA_R	stda	%f8, [%r26, %r14]
CP_PST_PRI684:
	.word 0xd1ba989a  ! 2046: STDFA_R	stda	%f8, [%r26, %r10]
BLK_PRI685:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 2048: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xd0bb901a  ! 2050: STDA_R	stda	%r8, [%r14 + %r26] 0x80
	.word 0xd1bc903a  ! 2052: STDFA_R	stda	%f8, [%r26, %r18]
CP_BIS_QUAD_LD686:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 2054: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xd08cd03a  ! 2056: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
NC_PST_PRI687:
	.word 0xd1bc181a  ! 2058: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd04b6007  ! 2059: LDSB_I	ldsb	[%r13 + 0x0007], %r8
CP_NUC688:
	.word 0xd0dd019a  ! 2061: LDXA_R	ldxa	[%r20, %r26] 0x0c, %r8
NC_AIUS689:
	.word 0xd0dfc33a  ! 2063: LDXA_R	ldxa	[%r31, %r26] 0x19, %r8
CP_BIS_QUAD_LD690:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2065: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xd0ba901a  ! 2066: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd0ccd03a  ! 2068: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	.word 0xd0eb111a  ! 2069: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x88
	.word 0xd182d01a  ! 2070: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd03ac01a  ! 2071: STD_R	std	%r8, [%r11 + %r26]
NC_BIS_AIUS691:
	.word 0xc8bfc47a  ! 2073: STDA_R	stda	%r4, [%r31 + %r26] 0x23
NC_AIUS692:
	.word 0xd187c23a  ! 2075: LDFA_R	lda	[%r31, %r26], %f8
CP_PST_PRI693:
	.word 0xd1bad91a  ! 2077: STDFA_R	stda	%f8, [%r26, %r11]
CP_AIUS694:
	.word 0xd0bf823a  ! 2079: STDA_R	stda	%r8, [%r30 + %r26] 0x11
NC_BIS_AIUP695:
	.word 0xc4b6445a  ! 2081: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd182905a  ! 2082: LDFA_R	lda	[%r10, %r26], %f8
CP_BIS_QUAD_LD696:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2084: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xd0d4d13a  ! 2086: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
	.word 0xd08c913a  ! 2088: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
CP_BIS_NUC697:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 2090: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
CP_BIS_AIUP698:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 2092: STBA_R	stba	%r6, [%r24 + %r26] 0x22
CP_BIS_NUC699:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 2094: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
SET_TL1_700:
	ta	T_CHANGE_TO_TL1
CHANGE_R26701:
	add	%r26,	%r27,	%r26
NC_BIS_NUC701:
	.word 0xd0bd44fa  ! 2096: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xd1bcd03a  ! 2098: STDFA_R	stda	%f8, [%r26, %r19]
SET_TL0_702:
	ta	T_CHANGE_TO_TL0
WR_LEASI_703:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_704:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0b4d03a  ! 2101: STHA_R	stha	%r8, [%r19 + %r26] 0x81
CHANGE_PRIV705:
	ta	T_CHANGE_PRIV
CHANGE_R26706:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP706:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 2103: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
	.word 0xd0cc903a  ! 2105: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
NC_PST_PRI707:
	.word 0xd1bb989a  ! 2107: STDFA_R	stda	%f8, [%r26, %r14]
NC_NUC708:
	.word 0xd08d409a  ! 2109: LDUBA_R	lduba	[%r21, %r26] 0x04, %r8
NC_NUC709:
	.word 0xd0f5419a  ! 2111: STXA_R	stxa	%r8, [%r21 + %r26] 0x0c
CHANGE_R26710:
	add	%r26,	%r27,	%r26
CP_BIS_SEC710:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 2113: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
	.word 0xd084111a  ! 2115: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r8
NC_AIUP711:
	.word 0xd0b6421a  ! 2117: STHA_R	stha	%r8, [%r25 + %r26] 0x10
NC_AIUS712:
	.word 0xd0afc33a  ! 2119: STBA_R	stba	%r8, [%r31 + %r26] 0x19
CHANGE_R26713:
	add	%r26,	%r27,	%r26
CP_BIS_SEC713:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 2121: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
	.word 0xd1a4d03a  ! 2123: STFA_R	sta	%f8, [%r26, %r19]
CP_BIS_AIUP714:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 2125: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
CP_PST_PRI715:
	.word 0xd1bad89a  ! 2127: STDFA_R	stda	%f8, [%r26, %r11]
CP_ATM_QUAD_LD716:
	and	%r26,	%r29,	%r26
	.word 0xd09ac59a  ! 2129: LDDA_R	ldda	[%r11, %r26] 0x2c, %r8
CP_ATM_QUAD_LD717:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 2131: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
	.word 0xd0dcd13a  ! 2133: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
	.word 0xd11a801a  ! 2134: LDDF_R	ldd	[%r10, %r26], %f8
CP_AIUP718:
	.word 0xd08e031a  ! 2136: LDUBA_R	lduba	[%r24, %r26] 0x18, %r8
CP_BIS_NUC719:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 2138: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
CHANGE_TLE720:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd182d15a  ! 2140: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd0bcd03a  ! 2142: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd0bcd03a  ! 2144: STDA_R	stda	%r8, [%r19 + %r26] 0x81
CHANGE_PRIV721:
	ta	T_CHANGE_PRIV
CHANGE_R26722:
	mov	%g0,	%r26
CP_BIS_NUC722:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2146: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
NC_PST_PRI723:
	.word 0xd1bb991a  ! 2148: STDFA_R	stda	%f8, [%r26, %r14]
NC_NUC724:
	.word 0xd0a5409a  ! 2150: STWA_R	stwa	%r8, [%r21 + %r26] 0x04
NC_AIUS725:
	.word 0xd087c23a  ! 2152: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r8
	.word 0xd11aa000  ! 2153: LDDF_I	ldd	[%r10, 0x0000], %f8
	.word 0xd012a006  ! 2154: LDUH_I	lduh	[%r10 + 0x0006], %r8
CP_ATM_QUAD_LD726:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2156: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
CHANGE_R26727:
	add	%r26,	%r27,	%r26
CP_BIS_SEC727:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 2158: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
	.word 0xd0d4903a  ! 2160: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd094d03a  ! 2162: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd0f4903a  ! 2164: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
SET_TL1_728:
	ta	T_CHANGE_TO_TL1
CHANGE_R26729:
	add	%r26,	%r27,	%r26
NC_BIS_NUC729:
	.word 0xc4bd44fa  ! 2166: STDA_R	stda	%r2, [%r21 + %r26] 0x27
CP_NUC730:
	.word 0xd08d009a  ! 2168: LDUBA_R	lduba	[%r20, %r26] 0x04, %r8
SET_TL0_731:
	ta	T_CHANGE_TO_TL0
WR_LEASI_732:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_733:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0ac913a  ! 2171: STBA_R	stba	%r8, [%r18 + %r26] 0x89
BLK_PRI734:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2173: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xd122a004  ! 2174: STF_I	st	%f8, [0x0004, %r10]
CHANGE_PRIV735:
	ta	T_CHANGE_PRIV
CHANGE_R26736:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD736:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 2176: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
CHANGE_R26737:
	add	%r26,	%r27,	%r26
CP_BIS_SEC737:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 2178: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
CP_NUC738:
	.word 0xd095019a  ! 2180: LDUHA_R	lduha	[%r20, %r26] 0x0c, %r8
CP_BIS_QUAD_LD739:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2182: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xd183111a  ! 2183: LDFA_R	lda	[%r12, %r26], %f8
NC_BIS_AIUP740:
	.word 0xc8b6445a  ! 2185: STHA_R	stha	%r4, [%r25 + %r26] 0x22
	.word 0xd1a4913a  ! 2187: STFA_R	sta	%f8, [%r26, %r18]
NC_BIS_AIUP741:
	.word 0xd0a6455a  ! 2189: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
	.word 0xd0a4903a  ! 2191: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
NC_PST_PRI742:
	.word 0xd1bc581a  ! 2193: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0f3511a  ! 2194: STXA_R	stxa	%r8, [%r13 + %r26] 0x88
	.word 0xd184913a  ! 2196: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0b3901a  ! 2198: STHA_R	stha	%r8, [%r14 + %r26] 0x80
	.word 0xd0c4913a  ! 2200: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
CHANGE_USER743:
	ta	T_CHANGE_NONPRIV
CHANGE_R26744:
	add	%r26,	%r27,	%r26
CP_BIS_PRI744:
	and	%r26,	%r28,	%r26
	.word 0xc4a31c5a  ! 2202: STWA_R	stwa	%r2, [%r12 + %r26] 0xe2
	.word 0xd0b4903a  ! 2204: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS746:
	.word 0xd1bf823a  ! 2206: STDFA_R	stda	%f8, [%r26, %r30]
	.word 0xd1bcd03a  ! 2208: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0ac903a  ! 2210: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd084903a  ! 2212: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd0d4d13a  ! 2214: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
	.word 0xd093101a  ! 2215: LDUHA_R	lduha	[%r12, %r26] 0x80, %r8
CP_PST_PRI747:
	.word 0xd1bb591a  ! 2217: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd093911a  ! 2219: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
NC_NUC748:
	.word 0xd1bd419a  ! 2221: STDFA_R	stda	%f8, [%r26, %r21]
NC_BIS_AIUP749:
	.word 0xc8b6445a  ! 2223: STHA_R	stha	%r4, [%r25 + %r26] 0x22
	.word 0xd0f2901a  ! 2224: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
CP_BIS_AIUP750:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2226: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
CHANGE_TLE751:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_SHORT_FP_SEC752:
	.word 0xd19cda7a  ! 2229: LDDFA_R	ldda	[%r19, %r26], %f8
CP_BIS_QUAD_LD753:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2231: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xd09cd13a  ! 2233: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
BLK_PRI754:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2235: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xd0bc501a  ! 2237: STDA_R	stda	%r8, [%r17 + %r26] 0x80
SHORT_FP_PRI755:
	.word 0xd19b1a1a  ! 2239: LDDFA_R	ldda	[%r12, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC757:
	.word 0xd09d419a  ! 2241: LDDA_R	ldda	[%r21, %r26] 0x0c, %r8
	.word 0xd012a006  ! 2242: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xd08cd03a  ! 2244: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd1ba901a  ! 2245: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd184d03a  ! 2247: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd1a3911a  ! 2249: STFA_R	sta	%f8, [%r26, %r14]
	.word 0xd184d03a  ! 2251: LDFA_R	lda	[%r19, %r26], %f8
CP_AIUP758:
	.word 0xd19e021a  ! 2253: LDDFA_R	ldda	[%r24, %r26], %f8
	.word 0xd103401a  ! 2254: LDF_R	ld	[%r13, %r26], %f8
	.word 0xd08b901a  ! 2256: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
CP_PST_PRI759:
	.word 0xd1bb581a  ! 2258: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0b4903a  ! 2260: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_PST_PRI760:
	.word 0xd1bc181a  ! 2262: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd1bcd03a  ! 2264: STDFA_R	stda	%f8, [%r26, %r19]
CP_AIUS761:
	.word 0xd0c7823a  ! 2266: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
	.word 0xd0eb101a  ! 2267: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
	.word 0xd094913a  ! 2269: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd09c903a  ! 2271: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
CP_NUC762:
	.word 0xd0ad009a  ! 2273: STBA_R	stba	%r8, [%r20 + %r26] 0x04
	.word 0xd182d01a  ! 2274: LDFA_R	lda	[%r11, %r26], %f8
CP_ATM_QUAD_LD763:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2276: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xd022a004  ! 2277: STW_I	stw	%r8, [%r10 + 0x0004]
NC_BIS_AIUP764:
	.word 0xc8b6455a  ! 2279: STHA_R	stha	%r4, [%r25 + %r26] 0x2a
CHANGE_USER765:
	ta	T_CHANGE_NONPRIV
CHANGE_R26766:
	mov	%g0,	%r26
CP_BIS_PRI766:
	and	%r26,	%r28,	%r26
	.word 0xc4b29d5a  ! 2281: STHA_R	stha	%r2, [%r10 + %r26] 0xea
	.word 0xd1bad11a  ! 2282: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd06b001a  ! 2283: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
CHANGE_PRIV767:
	ta	T_CHANGE_PRIV
CHANGE_R26768:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP768:
	.word 0xccf6445a  ! 2285: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xd1a4d13a  ! 2287: STFA_R	sta	%f8, [%r26, %r19]
NC_BIS_AIUP769:
	.word 0xd0f6445a  ! 2289: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
	.word 0xd0c4d03a  ! 2291: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd0f4d13a  ! 2293: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
CP_AIUP770:
	.word 0xd0de021a  ! 2295: LDXA_R	ldxa	[%r24, %r26] 0x10, %r8
NC_SHORT_FP_SEC771:
	.word 0xd19cda3a  ! 2297: LDDFA_R	ldda	[%r19, %r26], %f8
CHANGE_USER772:
	ta	T_CHANGE_NONPRIV
CHANGE_R26773:
	add	%r26,	%r27,	%r26
NC_BIS_PRI773:
	.word 0xd0bb9c5a  ! 2299: STDA_R	stda	%r8, [%r14 + %r26] 0xe2
	.word 0xd04aa007  ! 2300: LDSB_I	ldsb	[%r10 + 0x0007], %r8
	.word 0xd19cd13a  ! 2302: LDDFA_R	ldda	[%r19, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP775:
	.word 0xd096031a  ! 2304: LDUHA_R	lduha	[%r24, %r26] 0x18, %r8
	.word 0xd0d4101a  ! 2306: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r8
	.word 0xd1a2901a  ! 2307: STFA_R	sta	%f8, [%r26, %r10]
CP_BIS_NUC776:
	and	%r26,	%r28,	%r26
	.word 0xd0bd05fa  ! 2309: STDA_R	stda	%r8, [%r20 + %r26] 0x2f
	.word 0xd0ac111a  ! 2311: STBA_R	stba	%r8, [%r16 + %r26] 0x88
	.word 0xd0436004  ! 2312: LDSW_I	ldsw	[%r13 + 0x0004], %r8
NC_PST_PRI777:
	.word 0xd1bb999a  ! 2314: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_NUC778:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2316: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
CP_ATM_QUAD_LD779:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2318: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xd0dcd13a  ! 2320: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
	.word 0xd08c903a  ! 2322: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
SET_TL1_780:
	ta	T_CHANGE_TO_TL1
CHANGE_R26781:
	add	%r26,	%r27,	%r26
NC_BIS_NUC781:
	.word 0xc4f544fa  ! 2324: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CP_BIS_NUC782:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2326: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
NC_BIS_AIUP783:
	.word 0xc4f6445a  ! 2328: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xd0bc101a  ! 2330: STDA_R	stda	%r8, [%r16 + %r26] 0x80
	.word 0xd0dcd13a  ! 2332: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
SHORT_FP_PRI784:
	.word 0xd1ba9a5a  ! 2334: STDFA_R	stda	%f8, [%r26, %r10]
CP_BIS_AIUP785:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 2336: STBA_R	stba	%r8, [%r24 + %r26] 0x22
NC_SHORT_FP_SEC786:
	.word 0xd1bcdb3a  ! 2338: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd122e004  ! 2339: STF_I	st	%f8, [0x0004, %r11]
	.word 0xd19a901a  ! 2340: LDDFA_R	ldda	[%r10, %r26], %f8
NC_AIUP787:
	.word 0xd08e421a  ! 2342: LDUBA_R	lduba	[%r25, %r26] 0x10, %r8
	.word 0xd0dad15a  ! 2343: LDXA_R	ldxa	[%r11, %r26] 0x8a, %r8
	.word 0xd0f4d03a  ! 2345: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
SET_TL0_788:
	ta	T_CHANGE_TO_TL0
WR_LEASI_789:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_790:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC792:
	.word 0xd0c5409a  ! 2348: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r8
	.word 0xd052c01a  ! 2349: LDSH_R	ldsh	[%r11 + %r26], %r8
NC_BIS_SEC793:
	.word 0xc8acdc7a  ! 2351: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
	.word 0xd0ac913a  ! 2353: STBA_R	stba	%r8, [%r18 + %r26] 0x89
	.word 0xd1ba911a  ! 2354: STDFA_R	stda	%f8, [%r26, %r10]
NC_BIS_AIUS794:
	.word 0xc4afc47a  ! 2356: STBA_R	stba	%r2, [%r31 + %r26] 0x23
	.word 0xd08cd03a  ! 2358: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
NC_AIUP795:
	.word 0xd1a6421a  ! 2360: STFA_R	sta	%f8, [%r26, %r25]
	.word 0xd0a4501a  ! 2362: STWA_R	stwa	%r8, [%r17 + %r26] 0x80
CP_NUC796:
	.word 0xd0dd009a  ! 2364: LDXA_R	ldxa	[%r20, %r26] 0x04, %r8
NC_PST_PRI797:
	.word 0xd1bb985a  ! 2366: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_NUC798:
	and	%r26,	%r28,	%r26
	.word 0xd0a505fa  ! 2368: STWA_R	stwa	%r8, [%r20 + %r26] 0x2f
	.word 0xd094d03a  ! 2370: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd083901a  ! 2372: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
NC_PST_PRI799:
	.word 0xd1bc181a  ! 2374: STDFA_R	stda	%f8, [%r26, %r16]
WR_LEASI_800:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_801:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd13b001a  ! 2376: STDF_R	std	%f8, [%r26, %r12]
NC_NUC802:
	.word 0xd19d419a  ! 2378: LDDFA_R	ldda	[%r21, %r26], %f8
NC_PST_PRI803:
	.word 0xd1bc195a  ! 2380: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd1032004  ! 2381: LDF_I	ld	[%r12, 0x0004], %f8
	.word 0xd1bc101a  ! 2383: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd094913a  ! 2385: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
SHORT_FP_PRI804:
	.word 0xd1ba9a5a  ! 2387: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd13aa000  ! 2388: STDF_I	std	%f8, [0x0000, %r10]
CP_AIUP805:
	.word 0xd1a6021a  ! 2390: STFA_R	sta	%f8, [%r26, %r24]
	.word 0xd11b2000  ! 2391: LDDF_I	ldd	[%r12, 0x0000], %f8
NC_NUC806:
	.word 0xd1bd409a  ! 2393: STDFA_R	stda	%f8, [%r26, %r21]
CHANGE_R26807:
	add	%r26,	%r27,	%r26
CP_BIS_SEC807:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 2395: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
	.word 0xd08c501a  ! 2397: LDUBA_R	lduba	[%r17, %r26] 0x80, %r8
CP_ATM_QUAD_LD808:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 2399: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
CHANGE_USER809:
	ta	T_CHANGE_NONPRIV
CHANGE_R26810:
	add	%r26,	%r27,	%r26
CP_BIS_PRI810:
	and	%r26,	%r28,	%r26
	.word 0xc49a9d5a  ! 2401: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
CHANGE_R26811:
	mov	%g0,	%r26
CP_BIS_SEC811:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 2403: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xd0d4903a  ! 2405: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
NC_BIS_PRI812:
	.word 0xc8bc1c5a  ! 2407: STDA_R	stda	%r4, [%r16 + %r26] 0xe2
	.word 0xd0a4d13a  ! 2409: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP814:
	.word 0xd09e431a  ! 2411: LDDA_R	ldda	[%r25, %r26] 0x18, %r8
NC_BIS_AIUP815:
	.word 0xc4a6445a  ! 2413: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CHANGE_USER816:
	ta	T_CHANGE_NONPRIV
CHANGE_R26817:
	add	%r26,	%r27,	%r26
CP_BIS_PRI817:
	and	%r26,	%r28,	%r26
	.word 0xd0f35c5a  ! 2415: STXA_R	stxa	%r8, [%r13 + %r26] 0xe2
	.word 0xd0d3901a  ! 2417: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
CHANGE_PRIV818:
	ta	T_CHANGE_PRIV
CHANGE_R26819:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS819:
	.word 0xcca7c57a  ! 2419: STWA_R	stwa	%r6, [%r31 + %r26] 0x2b
	.word 0xd094903a  ! 2421: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_AIUS820:
	.word 0xd097c23a  ! 2423: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
	.word 0xd0bb901a  ! 2425: STDA_R	stda	%r8, [%r14 + %r26] 0x80
SHORT_FP_PRI821:
	.word 0xd1ba9b1a  ! 2427: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd182d05a  ! 2428: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd0b3901a  ! 2430: STHA_R	stha	%r8, [%r14 + %r26] 0x80
NC_AIUS822:
	.word 0xd0d7c33a  ! 2432: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r8
NC_BIS_AIUS823:
	.word 0xc8b7c47a  ! 2434: STHA_R	stha	%r4, [%r31 + %r26] 0x23
NC_BIS_AIUS824:
	.word 0xc4b7c57a  ! 2436: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
CHANGE_USER825:
	ta	T_CHANGE_NONPRIV
CHANGE_R26826:
	add	%r26,	%r27,	%r26
NC_BIS_PRI826:
	.word 0xd0bb9d5a  ! 2438: STDA_R	stda	%r8, [%r14 + %r26] 0xea
	.word 0xd094111a  ! 2440: LDUHA_R	lduha	[%r16, %r26] 0x88, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS828:
	.word 0xd087c23a  ! 2442: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r8
	.word 0xd0c4501a  ! 2444: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r8
CP_BIS_AIUS829:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 2446: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
	.word 0xd06a801a  ! 2447: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
	.word 0xd0f4903a  ! 2449: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd1a4501a  ! 2451: STFA_R	sta	%f8, [%r26, %r17]
CHANGE_USER830:
	ta	T_CHANGE_NONPRIV
CHANGE_R26831:
	add	%r26,	%r27,	%r26
NC_BIS_PRI831:
	.word 0xc4ac5c5a  ! 2453: STBA_R	stba	%r2, [%r17 + %r26] 0xe2
	.word 0xd0d4903a  ! 2455: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd0d4d03a  ! 2457: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS833:
	.word 0xd0c7823a  ! 2459: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
	.word 0xd0cc903a  ! 2461: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd02ae007  ! 2462: STB_I	stb	%r8, [%r11 + 0x0007]
CP_BIS_NUC834:
	and	%r26,	%r28,	%r26
	.word 0xd0a505fa  ! 2464: STWA_R	stwa	%r8, [%r20 + %r26] 0x2f
	.word 0xd19a911a  ! 2465: LDDFA_R	ldda	[%r10, %r26], %f8
CP_BIS_AIUP835:
	and	%r26,	%r28,	%r26
	.word 0xcc9e055a  ! 2467: LDDA_R	ldda	[%r24, %r26] 0x2a, %r6
	.word 0xd182d15a  ! 2468: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd1a4111a  ! 2470: STFA_R	sta	%f8, [%r26, %r16]
NC_PST_PRI836:
	.word 0xd1bbd89a  ! 2472: STDFA_R	stda	%f8, [%r26, %r15]
NC_NUC837:
	.word 0xd0a5409a  ! 2474: STWA_R	stwa	%r8, [%r21 + %r26] 0x04
	.word 0xd0ac101a  ! 2476: STBA_R	stba	%r8, [%r16 + %r26] 0x80
CP_BIS_QUAD_LD838:
	and	%r26,	%r29,	%r26
	.word 0xc89b5d5a  ! 2478: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
BLK_PRI839:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 2480: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xd0b2901a  ! 2481: STHA_R	stha	%r8, [%r10 + %r26] 0x80
	.word 0xd07ae004  ! 2482: SWAP_I	swap	%r8, [%r11 + 0x0004]
	.word 0xd08cd03a  ! 2484: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
CP_BIS_AIUP840:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 2486: STHA_R	stha	%r4, [%r24 + %r26] 0x22
NC_AIUS841:
	.word 0xd0afc33a  ! 2488: STBA_R	stba	%r8, [%r31 + %r26] 0x19
CP_BIS_AIUP842:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 2490: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
NC_BIS_SEC843:
	.word 0xd0b4dd7a  ! 2492: STHA_R	stha	%r8, [%r19 + %r26] 0xeb
	.word 0xd0d2901a  ! 2493: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r8
CP_PST_PRI844:
	.word 0xd1bb589a  ! 2495: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd1bcd03a  ! 2497: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0cc903a  ! 2499: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd022a004  ! 2500: STW_I	stw	%r8, [%r10 + 0x0004]
SET_TL1_845:
	ta	T_CHANGE_TO_TL1
CHANGE_R26846:
	mov	%g0,	%r26
NC_BIS_NUC846:
	.word 0xd0b544fa  ! 2502: STHA_R	stha	%r8, [%r21 + %r26] 0x27
BLK_PRI847:
	and	%r26,	%r29,	%r26
	.word 0xe19adf1a  ! 2504: LDDFA_R	ldda	[%r11, %r26], %f16
NC_AIUP848:
	.word 0xd19e421a  ! 2506: LDDFA_R	ldda	[%r25, %r26], %f8
	.word 0xd043401a  ! 2507: LDSW_R	ldsw	[%r13 + %r26], %r8
	.word 0xd0ac903a  ! 2509: STBA_R	stba	%r8, [%r18 + %r26] 0x81
CP_BIS_NUC849:
	and	%r26,	%r28,	%r26
	.word 0xc8bd04fa  ! 2511: STDA_R	stda	%r4, [%r20 + %r26] 0x27
CP_BIS_NUC850:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 2513: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
CP_AIUP851:
	.word 0xd0be021a  ! 2515: STDA_R	stda	%r8, [%r24 + %r26] 0x10
	.word 0xd0c3505a  ! 2516: LDSWA_R	ldswa	[%r13, %r26] 0x82, %r8
SET_TL0_852:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI853:
	.word 0xccbb9c5a  ! 2518: STDA_R	stda	%r6, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP855:
	.word 0xd1be021a  ! 2520: STDFA_R	stda	%f8, [%r26, %r24]
NC_BIS_SEC856:
	.word 0xd0bcdd7a  ! 2522: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
CP_BIS_AIUS857:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 2524: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
	.word 0xd19c111a  ! 2526: LDDFA_R	ldda	[%r16, %r26], %f8
	.word 0xd19cd03a  ! 2528: LDDFA_R	ldda	[%r19, %r26], %f8
CP_ATM_QUAD_LD858:
	and	%r26,	%r29,	%r26
	.word 0xc89b459a  ! 2530: LDDA_R	ldda	[%r13, %r26] 0x2c, %r4
CP_BIS_NUC859:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 2532: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
	.word 0xd0f3901a  ! 2534: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
	.word 0xd0d4903a  ! 2536: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
NC_BIS_AIUS860:
	.word 0xc8b7c57a  ! 2538: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
NC_BIS_SEC861:
	.word 0xccb4dc7a  ! 2540: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
SET_TL1_862:
	ta	T_CHANGE_TO_TL1
CHANGE_R26863:
	add	%r26,	%r27,	%r26
NC_BIS_NUC863:
	.word 0xc4bd44fa  ! 2542: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xd02aa007  ! 2543: STB_I	stb	%r8, [%r10 + 0x0007]
	.word 0xd0acd03a  ! 2545: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd07b6004  ! 2546: SWAP_I	swap	%r8, [%r13 + 0x0004]
CP_ATM_QUAD_LD864:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2548: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xd0f4913a  ! 2550: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
	.word 0xd07aa004  ! 2551: SWAP_I	swap	%r8, [%r10 + 0x0004]
	.word 0xd094501a  ! 2553: LDUHA_R	lduha	[%r17, %r26] 0x80, %r8
NC_BIS_NUC865:
	.word 0xc4b545fa  ! 2555: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
SHORT_FP_PRI866:
	.word 0xd1ba9a5a  ! 2557: STDFA_R	stda	%f8, [%r26, %r10]
CP_BIS_QUAD_LD867:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2559: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd0b3d01a  ! 2561: STHA_R	stha	%r8, [%r15 + %r26] 0x80
NC_NUC868:
	.word 0xd1a5409a  ! 2563: STFA_R	sta	%f8, [%r26, %r21]
	.word 0xd084903a  ! 2565: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CHANGE_R26869:
	add	%r26,	%r27,	%r26
CP_BIS_SEC869:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 2567: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
NC_PST_PRI870:
	.word 0xd1bc581a  ! 2569: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0a4d03a  ! 2571: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
	.word 0xd09c903a  ! 2573: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
SET_TL0_871:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI872:
	and	%r26,	%r28,	%r26
	.word 0xccf29d5a  ! 2575: STXA_R	stxa	%r6, [%r10 + %r26] 0xea
	.word 0xd084903a  ! 2577: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd0a2911a  ! 2578: STWA_R	stwa	%r8, [%r10 + %r26] 0x88
	.word 0xd084101a  ! 2580: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r8
CHANGE_PRIV873:
	ta	T_CHANGE_PRIV
CHANGE_R26874:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP874:
	.word 0xccbe455a  ! 2582: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
	.word 0xd183901a  ! 2584: LDFA_R	lda	[%r14, %r26], %f8
	.word 0xd0bc101a  ! 2586: STDA_R	stda	%r8, [%r16 + %r26] 0x80
NC_BIS_AIUP875:
	.word 0xcca6445a  ! 2588: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
NC_BIS_AIUP876:
	.word 0xccae445a  ! 2590: STBA_R	stba	%r6, [%r25 + %r26] 0x22
BLK_PRI877:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 2592: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xd1bb101a  ! 2593: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd093911a  ! 2595: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
NC_BIS_AIUP878:
	.word 0xccbe445a  ! 2597: STDA_R	stda	%r6, [%r25 + %r26] 0x22
	.word 0xd0bc903a  ! 2599: STDA_R	stda	%r8, [%r18 + %r26] 0x81
	.word 0xd1a4903a  ! 2601: STFA_R	sta	%f8, [%r26, %r18]
NC_BIS_SEC879:
	.word 0xc4acdc7a  ! 2603: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd0b4903a  ! 2605: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_BIS_AIUP880:
	.word 0xc8b6445a  ! 2607: STHA_R	stha	%r4, [%r25 + %r26] 0x22
NC_BLK_SEc881:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2609: STDFA_R	stda	%f16, [%r26, %r19]
NC_PST_PRI882:
	.word 0xd1bc191a  ! 2611: STDFA_R	stda	%f8, [%r26, %r16]
NC_BLK_SEc883:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2613: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd1f3201a  ! 2614: CASXA_R	casxa	[%r12]%asi, %r26, %r8
	.word 0xd052801a  ! 2615: LDSH_R	ldsh	[%r10 + %r26], %r8
SHORT_FP_PRI884:
	.word 0xd19b1a1a  ! 2617: LDDFA_R	ldda	[%r12, %r26], %f8
	.word 0xd033001a  ! 2618: STH_R	sth	%r8, [%r12 + %r26]
	.word 0xd0ba901a  ! 2619: STDA_R	stda	%r8, [%r10 + %r26] 0x80
CHANGE_USER885:
	ta	T_CHANGE_NONPRIV
CHANGE_R26886:
	add	%r26,	%r27,	%r26
NC_BIS_PRI886:
	.word 0xccac5c5a  ! 2621: STBA_R	stba	%r6, [%r17 + %r26] 0xe2
SET_TL1_887:
	ta	T_CHANGE_TO_TL1
CHANGE_R26888:
	add	%r26,	%r27,	%r26
NC_BIS_NUC888:
	.word 0xc8a544fa  ! 2623: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xd084903a  ! 2625: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd0c4d03a  ! 2627: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
BLK_PRI889:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1e1a  ! 2629: STDFA_R	stda	%f16, [%r26, %r12]
NC_BIS_AIUS890:
	.word 0xc4f7c47a  ! 2631: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd084903a  ! 2633: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd083101a  ! 2634: LDUWA_R	lduwa	[%r12, %r26] 0x80, %r8
	.word 0xd083501a  ! 2635: LDUWA_R	lduwa	[%r13, %r26] 0x80, %r8
	.word 0xd0ccd03a  ! 2637: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
SET_TL0_891:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI892:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 2639: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
NC_BLK_SEc893:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2641: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd07aa004  ! 2642: SWAP_I	swap	%r8, [%r10 + 0x0004]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP895:
	.word 0xd0d6431a  ! 2644: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r8
	.word 0xd0bb901a  ! 2646: STDA_R	stda	%r8, [%r14 + %r26] 0x80
	.word 0xd0cc903a  ! 2648: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
NC_NUC896:
	.word 0xd09d409a  ! 2650: LDDA_R	ldda	[%r21, %r26] 0x04, %r8
NC_AIUP897:
	.word 0xd0ae431a  ! 2652: STBA_R	stba	%r8, [%r25 + %r26] 0x18
	.word 0xd0d3911a  ! 2654: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r8
BLK_PRI898:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 2656: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xd0f3901a  ! 2658: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
	.word 0xd052a006  ! 2659: LDSH_I	ldsh	[%r10 + 0x0006], %r8
CHANGE_R26899:
	mov	%g0,	%r26
CP_BIS_SEC899:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 2661: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
	.word 0xd01aa000  ! 2662: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xd1a4d03a  ! 2664: STFA_R	sta	%f8, [%r26, %r19]
CHANGE_R26900:
	add	%r26,	%r27,	%r26
CP_BIS_SEC900:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 2666: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
NC_BIS_AIUS901:
	.word 0xc4b7c47a  ! 2668: STHA_R	stha	%r2, [%r31 + %r26] 0x23
BLK_PRI902:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2670: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd1bc903a  ! 2672: STDFA_R	stda	%f8, [%r26, %r18]
CP_ATM_QUAD_LD903:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2674: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
CHANGE_USER904:
	ta	T_CHANGE_NONPRIV
CHANGE_R26905:
	add	%r26,	%r27,	%r26
CP_BIS_PRI905:
	and	%r26,	%r28,	%r26
	.word 0xccab1c5a  ! 2676: STBA_R	stba	%r6, [%r12 + %r26] 0xe2
	.word 0xd0f2901a  ! 2677: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
NC_SHORT_FP_SEC906:
	.word 0xd19cda3a  ! 2679: LDDFA_R	ldda	[%r19, %r26], %f8
BLK_PRI907:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2681: LDDFA_R	ldda	[%r12, %r26], %f0
NC_BIS_PRI908:
	.word 0xd0ac5c5a  ! 2683: STBA_R	stba	%r8, [%r17 + %r26] 0xe2
	.word 0xd08c913a  ! 2685: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
CHANGE_R26909:
	add	%r26,	%r27,	%r26
CP_BIS_SEC909:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 2687: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
WR_LEASI_910:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_911:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0ac913a  ! 2690: STBA_R	stba	%r8, [%r18 + %r26] 0x89
BLK_PRI912:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 2692: LDDFA_R	ldda	[%r11, %r26], %f0
CHANGE_PRIV913:
	ta	T_CHANGE_PRIV
CHANGE_R26914:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD914:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2694: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_ATM_QUAD_LD915:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 2696: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
CP_AIUP916:
	.word 0xd0a6021a  ! 2698: STWA_R	stwa	%r8, [%r24 + %r26] 0x10
CP_BIS_QUAD_LD917:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 2700: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
NC_PST_PRI918:
	.word 0xd1bbd99a  ! 2702: STDFA_R	stda	%f8, [%r26, %r15]
CHANGE_USER919:
	ta	T_CHANGE_NONPRIV
CHANGE_R26920:
	add	%r26,	%r27,	%r26
CP_BIS_PRI920:
	and	%r26,	%r28,	%r26
	.word 0xc4a35c5a  ! 2704: STWA_R	stwa	%r2, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC922:
	.word 0xd09d019a  ! 2706: LDDA_R	ldda	[%r20, %r26] 0x0c, %r8
	.word 0xd19b501a  ! 2707: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd1a3501a  ! 2708: STFA_R	sta	%f8, [%r26, %r13]
	.word 0xd0a4d03a  ! 2710: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
	.word 0xd0dc903a  ! 2712: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd0db901a  ! 2714: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
CHANGE_CLE923:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_R26924:
	add	%r26,	%r27,	%r26
CP_BIS_SEC924:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2717: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
NC_BIS_PRI925:
	.word 0xc8f41d5a  ! 2719: STXA_R	stxa	%r4, [%r16 + %r26] 0xea
	.word 0xd0a2d11a  ! 2720: STWA_R	stwa	%r8, [%r11 + %r26] 0x88
	.word 0xd183115a  ! 2721: LDFA_R	lda	[%r12, %r26], %f8
	.word 0xd09cd03a  ! 2723: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
SHORT_FP_PRI926:
	.word 0xd1ba9a1a  ! 2725: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd07aa004  ! 2726: SWAP_I	swap	%r8, [%r10 + 0x0004]
	.word 0xd19cd03a  ! 2728: LDDFA_R	ldda	[%r19, %r26], %f8
CHANGE_TLE927:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
SET_TL1_928:
	ta	T_CHANGE_TO_TL1
CHANGE_R26929:
	mov	%g0,	%r26
NC_BIS_NUC929:
	.word 0xd0b544fa  ! 2731: STHA_R	stha	%r8, [%r21 + %r26] 0x27
	.word 0xd0536006  ! 2732: LDSH_I	ldsh	[%r13 + 0x0006], %r8
CP_AIUP930:
	.word 0xd0d6021a  ! 2734: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r8
CP_AIUS931:
	.word 0xd0cf833a  ! 2736: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r8
NC_NUC932:
	.word 0xd1bd409a  ! 2738: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd0d4d13a  ! 2740: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
NC_BIS_AIUS933:
	.word 0xccbfc57a  ! 2742: STDA_R	stda	%r6, [%r31 + %r26] 0x2b
	.word 0xd1bc913a  ! 2744: STDFA_R	stda	%f8, [%r26, %r18]
CP_AIUP934:
	.word 0xd0a6021a  ! 2746: STWA_R	stwa	%r8, [%r24 + %r26] 0x10
NC_AIUP935:
	.word 0xd1a6421a  ! 2748: STFA_R	sta	%f8, [%r26, %r25]
SET_TL0_936:
	ta	T_CHANGE_TO_TL0
WR_LEASI_937:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_938:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP940:
	.word 0xd0c6421a  ! 2751: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r8
CP_AIUP941:
	.word 0xd0c6031a  ! 2753: LDSWA_R	ldswa	[%r24, %r26] 0x18, %r8
	.word 0xd1e2e01a  ! 2754: CASA_R	casa	[%r11] %asi, %r26, %r8
CP_BIS_AIUS942:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 2756: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
CP_PST_PRI943:
	.word 0xd1ba991a  ! 2758: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd1f2a01a  ! 2759: CASXA_R	casxa	[%r10]%asi, %r26, %r8
	.word 0xd0d4d03a  ! 2761: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
	.word 0xd19c913a  ! 2763: LDDFA_R	ldda	[%r18, %r26], %f8
SET_TL1_944:
	ta	T_CHANGE_TO_TL1
CHANGE_R26945:
	add	%r26,	%r27,	%r26
NC_BIS_NUC945:
	.word 0xd0bd44fa  ! 2765: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xd1a2901a  ! 2766: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd1232004  ! 2767: STF_I	st	%f8, [0x0004, %r12]
	.word 0xd0b3911a  ! 2769: STHA_R	stha	%r8, [%r14 + %r26] 0x88
	.word 0xd0332006  ! 2770: STH_I	sth	%r8, [%r12 + 0x0006]
NC_AIUP946:
	.word 0xd0be421a  ! 2772: STDA_R	stda	%r8, [%r25 + %r26] 0x10
	.word 0xd0c3d11a  ! 2774: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r8
	.word 0xd0c4d03a  ! 2776: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd0cb901a  ! 2778: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
CP_PST_PRI947:
	.word 0xd1bad81a  ! 2780: STDFA_R	stda	%f8, [%r26, %r11]
NC_AIUP948:
	.word 0xd0c6421a  ! 2782: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r8
	.word 0xd1232004  ! 2783: STF_I	st	%f8, [0x0004, %r12]
	.word 0xd0f2911a  ! 2784: STXA_R	stxa	%r8, [%r10 + %r26] 0x88
	.word 0xd0b4d03a  ! 2786: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xd08c101a  ! 2788: LDUBA_R	lduba	[%r16, %r26] 0x80, %r8
	.word 0xd0c4d13a  ! 2790: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
	.word 0xd19c903a  ! 2792: LDDFA_R	ldda	[%r18, %r26], %f8
SET_TL0_949:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI950:
	and	%r26,	%r28,	%r26
	.word 0xc8f35c5a  ! 2794: STXA_R	stxa	%r4, [%r13 + %r26] 0xe2
	.word 0xd0ccd03a  ! 2796: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	.word 0xd0dcd03a  ! 2798: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0b2d01a  ! 2799: STHA_R	stha	%r8, [%r11 + %r26] 0x80
	.word 0xd19ad11a  ! 2800: LDDFA_R	ldda	[%r11, %r26], %f8
NC_BIS_SEC951:
	.word 0xc4acdd7a  ! 2802: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
CP_BIS_QUAD_LD952:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2804: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xd0a4903a  ! 2806: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
	.word 0xd0ab911a  ! 2808: STBA_R	stba	%r8, [%r14 + %r26] 0x88
	.word 0xd1f2e01a  ! 2809: CASXA_R	casxa	[%r11]%asi, %r26, %r8
SET_TL1_953:
	ta	T_CHANGE_TO_TL1
CHANGE_R26954:
	add	%r26,	%r27,	%r26
NC_BIS_NUC954:
	.word 0xd0a545fa  ! 2811: STWA_R	stwa	%r8, [%r21 + %r26] 0x2f
NC_BIS_NUC955:
	.word 0xc4ad45fa  ! 2813: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
CP_BIS_AIUS956:
	and	%r26,	%r28,	%r26
	.word 0xc8f7847a  ! 2815: STXA_R	stxa	%r4, [%r30 + %r26] 0x23
SET_TL0_957:
	ta	T_CHANGE_TO_TL0
CHANGE_R26958:
	add	%r26,	%r27,	%r26
NC_BIS_SEC958:
	.word 0xc4bcdc7a  ! 2817: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xd0f4913a  ! 2819: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
SET_TL1_959:
	ta	T_CHANGE_TO_TL1
CHANGE_R26960:
	add	%r26,	%r27,	%r26
NC_BIS_NUC960:
	.word 0xc8b545fa  ! 2821: STHA_R	stha	%r4, [%r21 + %r26] 0x2f
	.word 0xd183d01a  ! 2823: LDFA_R	lda	[%r15, %r26], %f8
	.word 0xef6fc01a  ! 2825: PREFETCH_R	prefetch	[%r31 + %r26], #23
CP_ATM_QUAD_LD961:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2827: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
BLK_PRI962:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2829: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xd1e3201a  ! 2830: CASA_R	casa	[%r12] %asi, %r26, %r8
	.word 0xd0aa901a  ! 2831: STBA_R	stba	%r8, [%r10 + %r26] 0x80
CP_AIUP963:
	.word 0xd0f6021a  ! 2833: STXA_R	stxa	%r8, [%r24 + %r26] 0x10
	.word 0xd072a000  ! 2834: STX_I	stx	%r8, [%r10 + 0x0000]
	.word 0xd0d3901a  ! 2836: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
BLK_PRI964:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2838: LDDFA_R	ldda	[%r10, %r26], %f16
NC_SHORT_FP_SEC965:
	.word 0xd19cdb7a  ! 2840: LDDFA_R	ldda	[%r19, %r26], %f8
CP_BIS_QUAD_LD966:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2842: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xd0acd03a  ! 2844: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd094903a  ! 2846: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
	.word 0xd0d4501a  ! 2848: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r8
	.word 0xd122a004  ! 2849: STF_I	st	%f8, [0x0004, %r10]
	.word 0xd0fad01a  ! 2850: SWAPA_R	swapa	%r8, [%r11 + %r26] 0x80
	.word 0xd0ac913a  ! 2852: STBA_R	stba	%r8, [%r18 + %r26] 0x89
SET_TL0_967:
	ta	T_CHANGE_TO_TL0
CHANGE_R26968:
	add	%r26,	%r27,	%r26
NC_BIS_SEC968:
	.word 0xc4acdc7a  ! 2854: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd0d3901a  ! 2856: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
	.word 0xd08c903a  ! 2858: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd1a4d03a  ! 2860: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd0cc101a  ! 2862: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r8
	.word 0xd0acd13a  ! 2864: STBA_R	stba	%r8, [%r19 + %r26] 0x89
	.word 0xd0dc903a  ! 2866: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
CHANGE_TLE969:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd1bb911a  ! 2869: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd11a801a  ! 2870: LDDF_R	ldd	[%r10, %r26], %f8
	.word 0xd0d4913a  ! 2872: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
CHANGE_PRIV970:
	ta	T_CHANGE_PRIV
CHANGE_R26971:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP971:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 2874: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
NC_BIS_AIUP972:
	.word 0xc4b6445a  ! 2876: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd1f2e01a  ! 2877: CASXA_R	casxa	[%r11]%asi, %r26, %r8
	.word 0xd11b6000  ! 2878: LDDF_I	ldd	[%r13, 0x0000], %f8
	.word 0xd0f4d03a  ! 2880: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
BLK_PRI973:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2882: LDDFA_R	ldda	[%r10, %r26], %f16
CHANGE_USER974:
	ta	T_CHANGE_NONPRIV
CHANGE_R26975:
	mov	%g0,	%r26
NC_BIS_PRI975:
	.word 0xd0f3dc5a  ! 2884: STXA_R	stxa	%r8, [%r15 + %r26] 0xe2
	.word 0xd0b3901a  ! 2886: STHA_R	stha	%r8, [%r14 + %r26] 0x80
	.word 0xd084d03a  ! 2888: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
NC_BLK_SEc976:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2890: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0cc101a  ! 2892: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r8
CHANGE_R26977:
	add	%r26,	%r27,	%r26
CP_BIS_SEC977:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2894: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xd0fb101a  ! 2895: SWAPA_R	swapa	%r8, [%r12 + %r26] 0x80
CHANGE_R26978:
	add	%r26,	%r27,	%r26
CP_BIS_SEC978:
	and	%r26,	%r28,	%r26
	.word 0xcca49d7a  ! 2897: STWA_R	stwa	%r6, [%r18 + %r26] 0xeb
	.word 0xd084501a  ! 2899: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC980:
	.word 0xd1e5201a  ! 2901: CASA_R	casa	[%r20] %asi, %r26, %r8
	.word 0xd0b3101a  ! 2902: STHA_R	stha	%r8, [%r12 + %r26] 0x80
	.word 0xd123001a  ! 2903: STF_R	st	%f8, [%r26, %r12]
NC_BLK_SEc981:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2905: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_AIUS982:
	and	%r26,	%r28,	%r26
	.word 0xc4f7847a  ! 2907: STXA_R	stxa	%r2, [%r30 + %r26] 0x23
NC_BIS_AIUS983:
	.word 0xc4bfc47a  ! 2909: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xd0c4d03a  ! 2911: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
NC_BLK_SEc984:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2913: LDDFA_R	ldda	[%r19, %r26], %f16
CP_BIS_AIUP985:
	and	%r26,	%r28,	%r26
	.word 0xc49e055a  ! 2915: LDDA_R	ldda	[%r24, %r26] 0x2a, %r2
NC_BIS_SEC986:
	.word 0xcca4dc7a  ! 2917: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xd11aa000  ! 2918: LDDF_I	ldd	[%r10, 0x0000], %f8
CHANGE_R26987:
	add	%r26,	%r27,	%r26
CP_BIS_SEC987:
	and	%r26,	%r28,	%r26
	.word 0xccf49c7a  ! 2920: STXA_R	stxa	%r6, [%r18 + %r26] 0xe3
NC_BIS_AIUS988:
	.word 0xc4afc57a  ! 2922: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xd0f3911a  ! 2924: STXA_R	stxa	%r8, [%r14 + %r26] 0x88
CP_AIUP989:
	.word 0xd0c6021a  ! 2926: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r8
	.word 0xd1bad01a  ! 2927: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd102a004  ! 2928: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xd08c903a  ! 2930: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd022c01a  ! 2931: STW_R	stw	%r8, [%r11 + %r26]
	.word 0xd09cd13a  ! 2933: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
NC_SHORT_FP_SEC990:
	.word 0xd19cda3a  ! 2935: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd1bbd01a  ! 2937: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd09c501a  ! 2939: LDDA_R	ldda	[%r17, %r26] 0x80, %r8
NC_BLK_SEc991:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2941: STDFA_R	stda	%f0, [%r26, %r19]
NC_BLK_SEc992:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2943: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd04ae007  ! 2944: LDSB_I	ldsb	[%r11 + 0x0007], %r8
	.word 0xd0ba901a  ! 2945: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd1bcd03a  ! 2947: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd1a4913a  ! 2949: STFA_R	sta	%f8, [%r26, %r18]
NC_AIUS993:
	.word 0xd0d7c33a  ! 2951: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r8
	.word 0xd0ccd03a  ! 2953: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CP_BIS_AIUP994:
	and	%r26,	%r28,	%r26
	.word 0xd0be045a  ! 2955: STDA_R	stda	%r8, [%r24 + %r26] 0x22
	.word 0xd0ccd03a  ! 2957: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	.word 0xd1a4913a  ! 2959: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd094903a  ! 2961: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
CHANGE_USER995:
	ta	T_CHANGE_NONPRIV
CHANGE_R26996:
	add	%r26,	%r27,	%r26
CP_BIS_PRI996:
	and	%r26,	%r28,	%r26
	.word 0xc89b1d5a  ! 2963: LDDA_R	ldda	[%r12, %r26] 0xea, %r4
NC_BIS_PRI997:
	.word 0xc4a39c5a  ! 2965: STWA_R	stwa	%r2, [%r14 + %r26] 0xe2
	.word 0xd09bd01a  ! 2967: LDDA_R	ldda	[%r15, %r26] 0x80, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS999:
	.word 0xd087823a  ! 2969: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r8
CP_PST_PRI1000:
	.word 0xd1bad89a  ! 2971: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd0db901a  ! 2973: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
CP_BIS_AIUS1001:
	and	%r26,	%r28,	%r26
	.word 0xd0af847a  ! 2975: STBA_R	stba	%r8, [%r30 + %r26] 0x23
NC_SHORT_FP_SEC1002:
	.word 0xd19cda3a  ! 2977: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd042a004  ! 2978: LDSW_I	ldsw	[%r10 + 0x0004], %r8
	.word 0xd122e004  ! 2979: STF_I	st	%f8, [0x0004, %r11]
NC_SHORT_FP_SEC1003:
	.word 0xd1bcda7a  ! 2981: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0b4101a  ! 2983: STHA_R	stha	%r8, [%r16 + %r26] 0x80
	.word 0xd0c2915a  ! 2984: LDSWA_R	ldswa	[%r10, %r26] 0x8a, %r8
CHANGE_CLE1004:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0eb101a  ! 2986: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS1006:
	.word 0xd0d7823a  ! 2988: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r8
	.word 0xd0a4d03a  ! 2990: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
CP_BIS_AIUS1007:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 2992: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
	.word 0xd0c4903a  ! 2994: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
	.word 0xd084d03a  ! 2996: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
CP_PST_PRI1008:
	.word 0xd1bb185a  ! 2998: STDFA_R	stda	%f8, [%r26, %r12]
SET_TL1_1009:
	ta	T_CHANGE_TO_TL1
CHANGE_R261010:
	mov	%g0,	%r26
NC_BIS_NUC1010:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x7ea0551130351197
.xword 0x336195122ab1e4e4
.xword 0xab40a3e50d35f60b
.xword 0xfc135088e010b361
.xword 0x5445452ec3b2ca47
.xword 0xb22eb9eca29d1a4b
.xword 0x829bfae12a4c9266
.xword 0xd432e7d2cfb6ba5e
.xword 0x6b31fad10d464e2d
.xword 0x73ac006984411e1d
.xword 0xe8ef7fff7b40d60f
.xword 0xfb5953ef9c632357
.xword 0xf99c2b4534d31930
.xword 0x3030ee1a646d92ff
.xword 0xb6ac772f2994cef8
.xword 0xf73e38880798d8a9
.xword 0xc9bb48e9cd335211
.xword 0xc7114052603a5699
.xword 0x861a8feef785f1ff
.xword 0x2a87a0ea116eb9c5
.xword 0x83ec47c53bdedf55
.xword 0x576bb812581303aa
.xword 0x406d6f68d830501e
.xword 0xab7f720e979fb307
.xword 0x40cf5253d4acbbe9
.xword 0x8f4222ad72b58e8c
.xword 0xca736bc3a78b0a4f
.xword 0xeed59f461a01bb81
.xword 0xe7742dba12e58379
.xword 0x9839f8c257a79785
.xword 0xc38635daf18fdf05
.xword 0x0e137eb7d701b4f9



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
.xword 0x35e5d846143dbe3f

.xword 0x2658fb0de5bf1480

.xword 0x6eb2b681af6318fd

.xword 0xc0a6f7a9778044ab

.xword 0x9c25d025db8ce44f

.xword 0xe9b4c19e676666c6

.xword 0x1172193e1dd07047

.xword 0x0c11938c479ccd38

.xword 0x340dd26fb983eddd

.xword 0x0119acee4096d6b2

.xword 0xfa24b6e4a6d00f52

.xword 0xb32355f51ab42803

.xword 0x5e6df1c36e371d2f

.xword 0x7976eff00bd3e902

.xword 0x6c54c1ead16088c2

.xword 0x3401a9cb653b67c1

.xword 0xede8329988437ff8

.xword 0xcec20a2cbbae0077

.xword 0x546fc3dfcd6a0c07

.xword 0xdc28fea2c0ca0829

.xword 0x9965d927333183b7

.xword 0x3990aa66fdfdda15

.xword 0xfe0709f0976f3b74

.xword 0x55d3a21f3dc1331d

.xword 0xcf27b39774837bac

.xword 0xb395f9befe896358

.xword 0xa15fe47165e85632

.xword 0x22215ff2c1147c09

.xword 0x7518237f71eabb94

.xword 0xa63cf71c75629f14

.xword 0x9bb4011ca857f506

.xword 0x55d35aed6b057309




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
.xword 0x5210d796f9215f7f
.xword 0x45e7d8c700096363
.xword 0x417f861ecd31ac09
.xword 0x17a0e05be3701844
.xword 0xe1dab07e9de77c99
.xword 0x507224eb0e81bbe1
.xword 0x4eb6b6dcbe572a48
.xword 0x84b397b9361ed5c4
.xword 0xbcc84a0a932e4819




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
.xword 0xec4bdfb44f995e90
.xword 0x3357ae610ccfc9f8
.xword 0xf66834970f119f0e
.xword 0xdd8766587a720ebf
.xword 0xa9e6d7d50f8cafae
.xword 0xb4e3cd2c21d1a65a
.xword 0x9aac919def68ee50
.xword 0x1673ee06e070d542
.xword 0x9adee1bcb9546f97




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
.xword 0x199bef45b2740445
.xword 0xe93eec3828c5600d
.xword 0x4a4cf75aa4537146
.xword 0x08a35a0d6da750ac
.xword 0x99f7898fa394f8b3
.xword 0xadd86e38d9ee2dd1
.xword 0x25d9c905eba73aef
.xword 0xb3b1b153017cfdff
.xword 0xc76319673d7e714f




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
.xword 0x15ccc16f1216530b
.xword 0xba158d193bf9f0e0
.xword 0x99d555a56c22a4e8
.xword 0x3d40fc94d4fc6dc7
.xword 0xf45aaae89ad09911
.xword 0x6fbeeb17221f4845
.xword 0x180eab4593e9844d
.xword 0xe6b77c85c750a9bd
.xword 0x2892a56fdc9b9daa




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
.xword 0x596e1accda6e88b5
.xword 0x028243884841386d
.xword 0x83d1002219cafc12
.xword 0x0324d1c2b5855f6b
.xword 0xbfba8c59f4edc325
.xword 0x25fee0f8155d5c45
.xword 0x1639afa7785eca14
.xword 0xf8708d987a9ee373
.xword 0x0b578576fa451b56




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
.xword 0x1072a53fe4138967
.xword 0x03d978853d9811f1
.xword 0xdc9e409b7684caea
.xword 0x4bc391d834f76918
.xword 0xc14f116de7f1b94a
.xword 0x259699aa754cf615
.xword 0x990ba56083823648
.xword 0xb53316e3f8dd27d6
.xword 0xc391aa3d522c3e2d




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
.xword 0xd5e98a46340ba066
.xword 0x6b769e347319acf6
.xword 0x2bf7c485259d6873
.xword 0x8ea96cd1d69b3537
.xword 0x557414e4446102fd
.xword 0xf6165098b7b90f81
.xword 0xfab74fc4ac117e93
.xword 0xb5a2f2f4dbf7f435
.xword 0x80ed692ff33ab81e




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
.xword 0xb05be41cfc3fa0c4
.xword 0xdfb46c2ab76354d9
.xword 0x1ff401307c35662c
.xword 0x2c3db458c9db1bfc
.xword 0x9f71a5456d1e4cdd
.xword 0x16e39ff6c5a94aa1
.xword 0x590738854414d6d5
.xword 0xd24900272ed6da32
.xword 0xd25b1e3ddb304fec




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
.xword 0xd2b7f8c53243619b
.xword 0xca8971479064c782
.xword 0xee2d6478aafb2f45
.xword 0xbf329197f79fd3c9
.xword 0x63ead02e30311cde
.xword 0xb34fbb96620f431a
.xword 0x95e5f8f2c400fb18
.xword 0xf86acfa37fcd11c6
.xword 0xf2ff664f1405cc6e




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
.xword 0x568c68c8e3c58832
.xword 0x89237631059f03fa
.xword 0x63ebb6fabeef45a2
.xword 0x5f331eeff68a460a
.xword 0xb87066b38b188a8c
.xword 0x434145a443ff4d95
.xword 0x61ad1b527dd18048
.xword 0xdebe10084dbc9426
.xword 0xe90b166de4a21872




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
.xword 0xbd9831d7da1642c0
.xword 0x99a0eef6749b7086
.xword 0x5a88164fbbad1e04
.xword 0xb3ab0815f2b25e34
.xword 0xf82f5cadfd35db02
.xword 0xff5e87294ad3407d
.xword 0x9d1fab6807d6ff03
.xword 0x5f1fd8a39ec8c78c
.xword 0xbafd04871d64998a




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
.xword 0xdcd51568099ab412
.xword 0x42aa0cb89d9239ee
.xword 0xb31d68030d490aff
.xword 0x04d144e516102bfc
.xword 0x890cf55922fdb87b
.xword 0x58ceebfb93f0c352
.xword 0x827356126f21984f
.xword 0x90ecd34c98fb69cf
.xword 0xeb2d5ef97bf2ff28




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
.xword 0xda8b4f0678bed8eb
.xword 0x51b5e38132d30af6
.xword 0x6f0fd3f857fab3f7
.xword 0xf2c9dc2b19e4e8de
.xword 0x48e23d844971742b
.xword 0x6a8d45caa72d29d9
.xword 0x5ee826ebba80df83
.xword 0x4f8166a4f8a19bb6
.xword 0xbc6c555c72e92b79




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
.xword 0xd184fc8d229f90d7
.xword 0x75ae4fee738bccde
.xword 0x2cd382e87538925e
.xword 0x1c1444ff57d1a6fe
.xword 0xc04eb7bf4c3cfe50
.xword 0xbfb6ea4d8879beb7
.xword 0xcf42c1d4e715a4e5
.xword 0xf5ec2951770cd055
.xword 0x7ea876629cd36817




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
.xword 0x064692e21759594f
.xword 0xa80b935c81b04a75
.xword 0xf9192304e371c298
.xword 0xf10414fa3e810b31
.xword 0xbf321a0c8b6abfc9
.xword 0xdc238f312f382bdb
.xword 0xc77cb4ec9f065d7b
.xword 0x456e7869129590d5
.xword 0x8c7bb7a289c0652b




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
.xword 0x08d455e165b59033
.xword 0x4e292bd50d801f11
.xword 0x687164250f68e393
.xword 0x2f1cf1469536715e
.xword 0x39af7eb343e0483b
.xword 0x23e54e9d7f6cf61d
.xword 0xc7da29ea6b315fc3
.xword 0xa8d82a37e212d467
.xword 0xc2c66419cf82cd36




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
.xword 0xe1aa143eca72cb43
.xword 0xe60eab977afa805a
.xword 0x03a074247f18b08f
.xword 0x37982daea4b0eb5f
.xword 0x43ea74bfddf517ca
.xword 0x44f056a990354c65
.xword 0x875d84e25503fcb0
.xword 0x4a01f0364c81a764
.xword 0x289469baa0546dff




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
.xword 0x2ff0e362ead1b38f
.xword 0xf19ba7b2778bb174
.xword 0xf6fd20fc37f1e763
.xword 0xbf616639416b5e26
.xword 0x522410b3086c9709
.xword 0xef1887b4098782a4
.xword 0xf4efd4d699668433
.xword 0x5aeaf0aafcafe275
.xword 0x9f1b0d38c7d00d49




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
.xword 0x9b60f5663d276358
.xword 0xbd32102e964e46b5
.xword 0x844058d2508547c1
.xword 0x0f3c87690d9ec4bb
.xword 0xac0599630eaa1202
.xword 0xee2c581f4427c40f
.xword 0xcfe6e32ddce533e7
.xword 0x83071104bfd58601
.xword 0x3b5066edfc02a3a1




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
.xword 0xb6209e22d5f97eee
.xword 0x83e6470b1aeda075
.xword 0xc1396ea36af09d31
.xword 0x90ffaf24a7e0dda3
.xword 0x1a0e6d1ada27e71e
.xword 0x63f78646899c2463
.xword 0xe38ac16338e84ba2
.xword 0x47319004ec8e2d5d
.xword 0x3449290e43918aff




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
.xword 0x86483806af8b339d
.xword 0x8cbfbacb93dc7c4d
.xword 0x818a50f9b082c973
.xword 0x85d28a2d897ab99e
.xword 0x27740b2668437a86
.xword 0xf7a51e0de81b7fe9
.xword 0x589e5e6643f161e3
.xword 0x296ad7a67cba186f
.xword 0x6d5e98e8b7316253




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
.xword 0x7c75a65e91b7df26
.xword 0x61369460fac5c491
.xword 0x0e1e58fc01b3c795
.xword 0x1ad8e9c7fdc088a9
.xword 0xbb38f4751b8eacea
.xword 0x70b205d6401e9113
.xword 0x524442aca69b2beb
.xword 0xe453b493eb7b6fdc
.xword 0x0cc7d26acb2ec400




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
.xword 0x60898cce28e50e15
.xword 0x033c5c1c816ea79f
.xword 0x5da3750800e6cd91
.xword 0x2f626e9c01a57f72
.xword 0xb4325f3b656b8bb6
.xword 0x258d5a825c5fe012
.xword 0xba46ce02f76b9b1a
.xword 0xae94c7c953f637ed
.xword 0xaf8c9f2ea559d38a




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
.xword 0xca6842b120f79244
.xword 0x366cb31a0c9ddb0f
.xword 0x9def72482f10eb85
.xword 0x99cccb68fdd5c31e
.xword 0x3c07e4c76f9e8c25
.xword 0x3fc4dccb7a861614
.xword 0x3e2cccf2de129a48
.xword 0x5620c3e5b195e930
.xword 0x03bece3f5fbc2df6




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
.xword 0x4678179966ca1a79
.xword 0xe2549065b337c3dd
.xword 0xbc28b73784ec1c3c
.xword 0xb1aa081b3ea064f6
.xword 0x978746414345cbc5
.xword 0x93b2ebe9545fe71d
.xword 0xb5521e65995d0b89
.xword 0x7d420871ceb543a1
.xword 0x3662ff0239d26fd2




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
.xword 0x2573bc7268be48eb
.xword 0xb22caa1cc1daf76a
.xword 0xb1df18efee2c6954
.xword 0x2206ea245081ae90
.xword 0x9bcac93c9f4427be
.xword 0x58e90685898576fe
.xword 0xf175cbde80d597d9
.xword 0x521e2dbd88203487
.xword 0xc737bf70c583d0c0




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
.xword 0xa16d3891593a6e07
.xword 0x46ffade55c2cbaf4
.xword 0x890c1c53b413a3ae
.xword 0x8ebf71e235f57c36
.xword 0x1e7be60564b43a51
.xword 0xa9cd8377fdec6416
.xword 0xd0de55541dcaeaf8
.xword 0x8d9902c3e2d5446e
.xword 0x9aa59cccd35ea841




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
.xword 0xfff48f5b92adaeb4
.xword 0x971db92ad3efe049
.xword 0x8275d1ec74763973
.xword 0x3c261ab83fde08ac
.xword 0x8b40e5e8b93894e3
.xword 0xe2badf1d0e35c976
.xword 0xceb0178795467550
.xword 0x5758bc5c58bbf693
.xword 0xac3ce3bdc60a61ae




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
.xword 0xa2cd263f7b1848fc
.xword 0x3b35a10dd3bbc406
.xword 0xe5a65e1b6d7bbe7e
.xword 0x45f1d9735c03bc4c
.xword 0x6a80d54d6dba69d9
.xword 0x93d89e235cde5ac4
.xword 0xdca0396310df44d9
.xword 0x98392c0e1f4f5ac6
.xword 0x8be4bd03440173b7




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
.xword 0x871ce8d66eaa4d6f
.xword 0xb3156ea1ce78a515
.xword 0x270703b6f5b6a8ff
.xword 0x72bec604919df329
.xword 0x4406c71246e9b739
.xword 0xcf2de22e6d5e1bf5
.xword 0x48cc793f74f71ff8
.xword 0xe98dfc504806cff0
.xword 0x12a690c6c5bb10fb




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
.xword 0x9cedd317c2049f2f
.xword 0xf3619e220148a65b
.xword 0xa47c52fdf0842dfd
.xword 0x9aeb2640acf30872
.xword 0x38519360f7c64e82
.xword 0x77322dafb90e911d
.xword 0xac51a189eca723db
.xword 0xf7a5160078d38940
.xword 0xe34912a2e4343df0






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
.xword 0x74325cf51f81d165
.xword 0x71e5cd46c932e646
.xword 0x8ef38ae8391bddf3
.xword 0x74000311748418de
.xword 0x2a64a6e9fbb1a2d2
.xword 0x97ee4de1a428ab78
.xword 0xedcb54b8d73a8634
.xword 0x4a54c7ca44d75ab8



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
.xword 0xa1838b90ad0fcd8f
.xword 0x30c1d26fafc4cd94
.xword 0xb3c563b6eae75da9
.xword 0xf295fd74635dcca8
.xword 0x2609a69ada5410cb
.xword 0xd0a319b6824d4a9d
.xword 0x073ab57eed8464ad
.xword 0x4e125817b302a4da



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
.xword 0xc071ee471248235c
.xword 0xca689c5d5403f06d
.xword 0x437f3115c878ed76
.xword 0x467867b3632e1cac
.xword 0x36c02bb3d2c735f9
.xword 0x32df26940f0689ec
.xword 0x8b5d55cf943e17d1
.xword 0x40ae984672b6d6fb



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
.xword 0xf2d37b9e109bb164
.xword 0xeb1a5821d62c3c2a
.xword 0x9d12e3636b0d7cd0
.xword 0xdd4bb819695226d9
.xword 0x0a999365be947397
.xword 0xfe5aa7800c9e21e2
.xword 0x2f5da0908df02853
.xword 0xb38a744463f32ba5



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
.xword 0xad8d00daffc4138b
.xword 0xecd8a8a919afef60
.xword 0x4b5c972c0ea932b3
.xword 0xc42a40b8388e9e6a
.xword 0x82bb7946312c3b3a
.xword 0x2979f08c41760315
.xword 0x4c006feabf9bf712
.xword 0x19968e15da018bf4



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
.xword 0x1e3b9d6f98233282
.xword 0x8fbf6ff157fe4a09
.xword 0xb12847964e571c86
.xword 0xdff26c24f9d300ad
.xword 0x4de134f10cc8819d
.xword 0xc004e2297b9db2ff
.xword 0xa0fdd7067c6fcf39
.xword 0x8afc45ea351045ed



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
.xword 0x7bf14dd5a85db047
.xword 0xe07bc029f1646756
.xword 0xe5148958e43ae60b
.xword 0x9b9701d137f51962
.xword 0xa62211af2da39b99
.xword 0xd0ff810a31fdcad1
.xword 0x76d3aa1d2f8a477d
.xword 0x68ab5bdcda64830f



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
.xword 0x21338e4d3250f796
.xword 0x9d6141dab7e5fead
.xword 0x29e69596f2e71cc3
.xword 0xa1eef69e545705ad
.xword 0xe625080523785185
.xword 0xa9c308c3ea5c2b77
.xword 0xbe5582a78fbb0a2d
.xword 0x57f39a5237041385



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
.xword 0x7b5d9cb15c3b14c8
.xword 0x2b6abca3dea3d3ab
.xword 0x20046d27a965f768
.xword 0x2c51be69dc92791c
.xword 0x63f12003690e75f9
.xword 0xd0ba3719c712758a
.xword 0xfd6330744849f926
.xword 0xa1e1599b504ca523



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
.xword 0x3a375d18f1c7fd2e
.xword 0x04b06dec00fee07b
.xword 0x53a9e2a7c977d6a9
.xword 0xd491d1102956a7e8
.xword 0xa32aee89dc9e3a24
.xword 0xe00c9919bd32616e
.xword 0x552d452b2bf58ab2
.xword 0x54355a402ba51a85



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
.xword 0x98e4008053f2b708
.xword 0x942b992b5fc5366a
.xword 0x6df75b9465bf3805
.xword 0x8fc60dc17458c63d
.xword 0x7c7ffba3ff6bf942
.xword 0xea6a508576775a33
.xword 0x8f1247804571e53b
.xword 0x40453c8e723b113e



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
.xword 0x8084134e193643f5
.xword 0xccc17e9f1500d074
.xword 0xd49b5ad476baea35
.xword 0x564fb0524877a553
.xword 0x298779659b179ed0
.xword 0x87df32906521c278
.xword 0xd1d7a0eb76c211ab
.xword 0xafa087bc7b7e0de7



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
.xword 0xad01f4b8a703a4e3
.xword 0xb5edb7cb9ee49362
.xword 0xb56d617f01fd75b3
.xword 0x0e57531893146947
.xword 0xb6ca35f3038312e1
.xword 0xd910f0974f4691d3
.xword 0x66aa569e70494b57
.xword 0x4d4a5d534555175a



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
.xword 0x2e7f6e047e5e2aa4
.xword 0xde8db64d86f8d6e4
.xword 0x7b95e267fb4b536e
.xword 0xa35bde05bfe20ef2
.xword 0xcfbf19e53484c4d7
.xword 0x66e499e0da3d48e5
.xword 0x5367155a3b6fde76
.xword 0xb293ee840ed0c096



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
.xword 0x50b3a554f22edc31
.xword 0xacab1173dd4eb5ae
.xword 0x5e8577d5270eea0f
.xword 0xcfe9467e435bd2b7
.xword 0xbb543146d6381720
.xword 0x5a428212ec903d2b
.xword 0x861b35e176d0f969
.xword 0xa1b4eb247fe07cfb



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
.xword 0x4b2322f7b90037f0
.xword 0x2a4f7306e1132252
.xword 0x8dc4f72af8ba1e21
.xword 0x7f782c16a5bd5414
.xword 0x57b34761f696bf26
.xword 0xe0153e55aea7b73f
.xword 0x046a9b4db0973f65
.xword 0x1260803ff71e5bad



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
.xword 0x52fd95297326142f
.xword 0x57d368286de87046
.xword 0xa140469ba28ddfcf
.xword 0x586fdad17aa89b62
.xword 0x856c7fc6117a5385
.xword 0x5cc3f46156ae78b4
.xword 0xe64524212fb196e9
.xword 0xd6f8c8173a3b143e



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
.xword 0xda094cd3e4cd27d0
.xword 0x84393114ab5330cd
.xword 0xfd538d2b7078fd12
.xword 0xec9e148534cd7404
.xword 0x705a642820be1727
.xword 0x2b786eeff94126bb
.xword 0xf1518f5750594f25
.xword 0x6d676d686692e27d



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
.xword 0xee1e79dab528d718
.xword 0xa813be6656826c8c
.xword 0xa04b28ed6caae817
.xword 0x7b855a6664a55555
.xword 0xee873e4b59c66bb6
.xword 0x5a800f82f355b0a5
.xword 0xb840d6aa27d65cfe
.xword 0x8f27bee666ea40ac



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
.xword 0x62044cb1125fccf0
.xword 0x3fc00fa788ee221f
.xword 0xe7b11ee96db671f6
.xword 0x398111fdedd3c239
.xword 0x02c5a1b17c710a99
.xword 0x3b45bfcf7685081f
.xword 0xdbe814f330cd842d
.xword 0x0a9d42e83a015a89



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
.xword 0x298a5302fb5c6668
.xword 0x9640e176023af6a5
.xword 0x16c49e51035ae9b4
.xword 0xb0acc949cf829e9b
.xword 0xba6bf2b037a164ce
.xword 0x3a6ba84d34dd7e26
.xword 0x291e4489f936c8c3
.xword 0x7cad1f72deaec6eb



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
.xword 0xa659fa13dd92ab45
.xword 0xbf317316b07a72d0
.xword 0x03e66ad8e1d16cf2
.xword 0x34c266a3336b5263
.xword 0xfd885f469218cd9a
.xword 0x004463d8c995acdc
.xword 0xdc300094979eeae3
.xword 0xc9440dbd635ea5aa



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
.xword 0x872059467bf2ca25
.xword 0xa571c5f7c971cd68
.xword 0xebf39dc81e19bd9f
.xword 0xb0541b7bb2a7287b
.xword 0xdef1a1f6e63d429f
.xword 0x021d5cc42cf9fe4c
.xword 0xa989a6fe86d508b2
.xword 0x68fa0859b2296379



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
.xword 0x791fb113c0878c87
.xword 0x83cd01a06747cd51
.xword 0x1f71ee8ba0bcdc6d
.xword 0x2e44403b33f31e79
.xword 0x898356ffdb5b79b8
.xword 0x80a86886f8c5a053
.xword 0x9fa27d2367cb49fc
.xword 0x25605b91077c43a2



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
.xword 0x8618c3a5ec3d42cd
.xword 0xdbb5a4fc91bcb26d
.xword 0xf0c614bc946d36ad
.xword 0x671d302ce77a206e
.xword 0xe9a003a6f3ce8948
.xword 0x3733b089d8589e77
.xword 0xcab6b7364bb3a5fc
.xword 0x4fac81073e16eac6



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
.xword 0x2c7dfe8a269e2425
.xword 0xd3fe18cdf3e097f2
.xword 0x9c966fe7d24b1ae1
.xword 0x7774bea9eaeba910
.xword 0x434464ccd07d40d1
.xword 0xc853ba875a684a19
.xword 0xb71566674e509dc4
.xword 0x8c8529803c424d8f



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
.xword 0x58a7759cd9e7ca15
.xword 0x66e04ec79ef621b2
.xword 0x9aed887feb464fd9
.xword 0xfae341ec67aab087
.xword 0x47bed44df72e52d6
.xword 0x512493a31d4d16a3
.xword 0x62049a40e3fc39e3
.xword 0x4f579c93757e51ec



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
.xword 0x02f02cb5e991dceb
.xword 0x40938c7830d21de3
.xword 0x6d54759eb586d8ba
.xword 0xb16caffe9c248e20
.xword 0x8b7a25cd0941e5fd
.xword 0x50df3851dad36f17
.xword 0xed7d0783dde3e81a
.xword 0xeeaf32c79c0709e5



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
.xword 0x33e3f4135b9ef635
.xword 0x582f867a9e406bdd
.xword 0x2e5c136441a25aa5
.xword 0xdccecb1e8e086b55
.xword 0x69a8eb470e86d8b7
.xword 0x4a9fc37135c640a9
.xword 0xfd03f5be48897709
.xword 0xe6696be9674c64ec



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
.xword 0x78832268ee88782c
.xword 0xeca0a61d781ea614
.xword 0x1f10c2e676f664b9
.xword 0x24faaf413abe5061
.xword 0xb7cc75959b210df6
.xword 0x9939602b745d9134
.xword 0x8806767d26189838
.xword 0xf49fbf777f467cce



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
.xword 0x772abf1153ed90f0
.xword 0xf5c7738c681c7b3f
.xword 0xd31829b186aaa5ff
.xword 0xb06b78a9128d1de0
.xword 0x9d6366bc3767708f
.xword 0xd0841772cfee88b4
.xword 0x23f368c57568caa5
.xword 0x7339e88ffddaaf78



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
.xword 0x7079dd5f9885aa94
.xword 0xb0c114056e047517
.xword 0x4c0d0bed10780233
.xword 0x4be2901b8b2eaa72
.xword 0x6fa127f1da9b3384
.xword 0x1958ae32057cf9dd
.xword 0xea561249713d972e
.xword 0x17cd37cdd5bcd051





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
.xword 0x8fb2468dff01c1cf
.xword 0xf9646d3a57f603eb
.xword 0x3d3e72337cebd142
.xword 0x728739e8a16085fe
.xword 0x19b928a6e8e4f286
.xword 0xe2dd3d0dfb3ec5e9
.xword 0xc0bda82a64e532bb
.xword 0xd0653f6c4486f6f4




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
.xword 0xc82468eddf54a5d5
.xword 0xf180770f088aa77d
.xword 0xf58d42df691a2873
.xword 0x4243f062e5cbd9ef
.xword 0x7ecf43936c6ca9f5
.xword 0xcbc3ab1fd824e587
.xword 0x69ab5a57319a1aa6
.xword 0xe318c32e9372ca18




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
.xword 0x0caefc8dc3a0d1db
.xword 0xbfc3aecccce94661
.xword 0x4c0d21db7a12322e
.xword 0xcf08958faa39d45e
.xword 0xd16d830e69177e56
.xword 0xcc01890a7c50a710
.xword 0xfe921c0e7a143889
.xword 0x5b6e2c786a8b7b45




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
.xword 0x0102bba4c85464b0
.xword 0xfd474f0533e2daf9
.xword 0xbdd2fe4d441023ff
.xword 0xb44d6628055b4506
.xword 0x12804541d3389d79
.xword 0xd5e559454e885ffc
.xword 0x73d9a2ca3d391947
.xword 0xfb2016e121d38ad6




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
.xword 0xf8fdb60cc01fd6ca
.xword 0xb18f1435fcf519d2
.xword 0x0e668dc15d2572f3
.xword 0x57548267d42c2d52
.xword 0xf69ef0d822ff5059
.xword 0x1da80698058ee70f
.xword 0x1ef6307d06e6f981
.xword 0x11ff61a072d73d85




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
.xword 0x819169eb058b6f42
.xword 0xcd3e66e47e681212
.xword 0xf45dbdf59fadf500
.xword 0xf9ddedcb8cdb9405
.xword 0xf62afd2d0d36368c
.xword 0xa2c0b0503a836805
.xword 0x6acb629ddef0ef9b
.xword 0x3a42e31abf16877e




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
.xword 0xc0176382b926ca2b
.xword 0x9713e7678d43d5f4
.xword 0x962baef89b056cee
.xword 0x46681c92a7b62061
.xword 0x570587df9cf40d17
.xword 0xfb91876c92595e36
.xword 0x0188f99f49b73c06
.xword 0xf5aec6e8665d0077




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
.xword 0xd24bb0ac4c7ff44c
.xword 0x725a4828e17c0318
.xword 0x6b46fdf8bebef575
.xword 0x363a0d0ee03a9c5c
.xword 0x9f0ce2d296b7ff19
.xword 0xb5f2124d77e802ae
.xword 0xa7c1895f69ded220
.xword 0x8ad22c6c54f37c48






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
.xword 0x746ae41071644085
.xword 0x19ff1f73fe74a9c3
.xword 0xc00acc6869549710
.xword 0xdc62589c16a0e218
.xword 0x2234aeeda2aba068
.xword 0xd8b7d0c4f991bf94
.xword 0xf074b2f9ce9f10f4
.xword 0x8c0b4b25c446ce45




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
.xword 0x1ed7513ff76a7520
.xword 0x8c38e2e963d0bfee
.xword 0x3a98063d1afd8800
.xword 0xd18d810b7ce8cc7c
.xword 0x6f40ee75688e586b
.xword 0xc48de56cf6c93c4e
.xword 0x9830fd167d2356af
.xword 0xbfa5575b693ba559




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
.xword 0x8987f5701f7471a4
.xword 0x0bb2b1ac3017d815
.xword 0x4212f6472c9ef324
.xword 0x6175375630ba2f4d
.xword 0x49ab91afddf1bfaf
.xword 0xa8f67f7a77d6fa0f
.xword 0x8d9df630c971b6ff
.xword 0x13de4102a1dee637




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
.xword 0x8aaf566be75b43ba
.xword 0x219a522f17782957
.xword 0x80309e189ce51ff7
.xword 0x092304bcf5bc674d
.xword 0x2cf433d1808902a6
.xword 0xbf3ac2cec1dbd937
.xword 0xf9011dbbd33ac4c8
.xword 0xd57f496ac7cbe7e5




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
.xword 0x22af51e5c04f5fc9
.xword 0x1dc9d3607eb99ebc
.xword 0x4c1d903ab037f23a
.xword 0x2c08185139e80142
.xword 0x30a04a6343a9a3a1
.xword 0xf3dbeb572c136523
.xword 0xf8832f9a2809e829
.xword 0x1bba831b9f598f4f




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
.xword 0x324fae7c7428e0ae
.xword 0x3249277c7b4abf47
.xword 0x2b637329f5985382
.xword 0x63b76fe1c681ea09
.xword 0x576bd66f5f857897
.xword 0x971506bfea8284d2
.xword 0x74e0477bf5c723c4
.xword 0x2282fe24e4317e10




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
.xword 0xb47d4cac04d768be
.xword 0x98c2c728196577cd
.xword 0xe5fad60b26bb08df
.xword 0x52230aded2bb97a6
.xword 0xa301d5614e825ffc
.xword 0xd81ee2d35f7d3355
.xword 0xec72f2f100313a73
.xword 0x004d184fc3d1bede




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
.xword 0x2adab89bbd839ede
.xword 0x91d45e7fef619341
.xword 0xf4544413451cbca1
.xword 0x8b4fe325065eb53f
.xword 0x3591e6015069925e
.xword 0x2f6897206aee7a20
.xword 0x940d86bb902acf97
.xword 0xff9c26977c672d74






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
.xword 0xbe809713f40192ca
.xword 0x7586cba8a23c5c8d
.xword 0x6717ccc56a9584ea
.xword 0x2841b9f01393caec
.xword 0x198ea8df0bedab35
.xword 0x607ad8616be04b77
.xword 0xb0c79071038fb883
.xword 0x44e1b04345f67bcb




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
.xword 0xf1125c9c8eb0b184
.xword 0xcaaa61d696b01703
.xword 0x8a3784af0eb8bde6
.xword 0x270251fd3ee62da9
.xword 0x6542ac0daf45d29c
.xword 0x2c501a01e731703a
.xword 0x9d87e44fd3b2df46
.xword 0x1544d1edf89de293




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
.xword 0x31f3aa2776831d38
.xword 0x0f540e90410009ce
.xword 0x662a6da7c4997ebf
.xword 0x153803eab3375044
.xword 0xebe5eba50c25c9e5
.xword 0x623320c6a8e1efa0
.xword 0x2f637920dc822ff5
.xword 0x78632556e2738058




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
.xword 0xe510ff75b40b10e6
.xword 0xf4bafa8ecdd57ba7
.xword 0x7a76334fc5cf2493
.xword 0x6485ca935d29bc66
.xword 0xc138cd966f3771c9
.xword 0xbc4ab0f6326ea351
.xword 0x6b5309447c31ea59
.xword 0x5016b685ed03589d




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
.xword 0x68f6098474800464
.xword 0xdd81adc619c016fe
.xword 0xbd3324f88195d8af
.xword 0xd5e6d8f5ca8e2436
.xword 0xdd114d8f3d79dd73
.xword 0xeec2932549262231
.xword 0x49d2f348fb9f0c1b
.xword 0xfa2175fa6e2c4d0e




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
.xword 0x0399028cd9e49b04
.xword 0x3dec9ae0a0a9400b
.xword 0xdb81d8bb0bf9f02c
.xword 0x5df114200c8fac5c
.xword 0x3833399cbb8d72ac
.xword 0x2b710711b8611ecd
.xword 0x419267a3b2a038bf
.xword 0x99e40c10c6a9349e




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
.xword 0x8b72bbed8ac95fbf
.xword 0xef227c82dea81f9e
.xword 0xbb6ece18606bd056
.xword 0x990c96b3210425d0
.xword 0xc2c1edee216a589b
.xword 0x0574a8582f38429c
.xword 0x029acad1d62f10a0
.xword 0x0e3c452c64aee446




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
.xword 0x38dc6f9521ccedce
.xword 0xae8f8045353fbfb7
.xword 0xbb8be6a41ce71348
.xword 0x224fd741caea104c
.xword 0xbb99456b54cc75b6
.xword 0xa30c548af5d354b5
.xword 0x488975ebfeacf53c
.xword 0xec4b7dfbd306eeb3






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
.xword 0xa85c977345e70700
.xword 0x705f1c4910d48c58
.xword 0x99962e4938acad54
.xword 0x8c5956554a2b5e8f
.xword 0xd7eb2a1e340be888
.xword 0x482831b6575412c2
.xword 0x3ad7b6e6a377514a
.xword 0xb51b84826bf36687




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
.xword 0xd3c3adca5adbc4b3
.xword 0x0991fba27e2cd2a4
.xword 0xff61fc2d9a5579b9
.xword 0x1404df8186db2d2e
.xword 0x280faeef7bce37d2
.xword 0x57c22f890128dd3c
.xword 0x58602b1bed0b3932
.xword 0xee293a84f3d76d7f




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
.xword 0x6aef11d59eb56a55
.xword 0x5d36418fd219e791
.xword 0x588172de136b0095
.xword 0x4742a0027c47b5c9
.xword 0x35fa88f2215b1d70
.xword 0x01eed6e97d189a44
.xword 0x7f3fba50f53ed9f0
.xword 0xc4362fc7f12c9a80




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
.xword 0xd58066ab56ab5dd0
.xword 0xc6725a739d7ab9ee
.xword 0x5e936125104e7033
.xword 0x23a55eab04429ac4
.xword 0x36edae8f2306b206
.xword 0x9d8a3dea35e12c8c
.xword 0x080a15ef449be5c0
.xword 0xd8ea82f31297c323




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
.xword 0x6a9b1dfac154257b
.xword 0x84fa8cd5d4e4928c
.xword 0x2776bbac1a07a318
.xword 0x354f03360d15212b
.xword 0x5512fdfb357847ed
.xword 0x4ebcd4dd525eb1f1
.xword 0x6e163670f8c304b7
.xword 0x2408ba18e8f14b05




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
.xword 0x8d853548bf7c1990
.xword 0x034330e58f643759
.xword 0x8ea67aa395d2bedc
.xword 0x9d2615e298d957ce
.xword 0xc1ede0ab2e9d4ef9
.xword 0x7b2701f4b78fbf09
.xword 0x23820e1ff280a0e6
.xword 0x607e09764370a2f7




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
.xword 0x58210b0ddc135de5
.xword 0xc1eaaa78329848b4
.xword 0x86a5053001eaf654
.xword 0xc66cc3047641d029
.xword 0xe51ff21bff1fcdfb
.xword 0xfbebe7e9f9b84fec
.xword 0xd3f2876f301bd87d
.xword 0xa750e52b74d5effe




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
.xword 0x0590b1940020de6b
.xword 0xd94c2cee21fb668f
.xword 0x33d252f4a0730ceb
.xword 0x3c59bf775a1448b3
.xword 0x307f9db7f44b0637
.xword 0xa2361dd2faec9ac5
.xword 0x6fd1d180b28f7c58
.xword 0xd302a71f27d28a97






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
.xword 0xb1b3eb4938a23070
.xword 0xfc02ba723f1a14f8
.xword 0xa8f591a2b1d27fb1
.xword 0xb814fac82179f552
.xword 0xf792012fcb65f33b
.xword 0x527d92727f1151e4
.xword 0x1aa2a5faf2d8155f
.xword 0x80f43b4c4aeaa9d5




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
.xword 0x8f755b8be63b3031
.xword 0x02b53d5988b7496b
.xword 0x482ce2239eeee158
.xword 0xe9192b643921af2e
.xword 0xded09dfc406796f4
.xword 0xca0fe72a57e2a365
.xword 0xa68257b79874e313
.xword 0x574c685fec0428d8




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
.xword 0x340cb141a7a19a4d
.xword 0xa58af190db1fde3d
.xword 0xae9bc3ec8432acee
.xword 0x459a63f7025cc87e
.xword 0x25ccb56f651b1c74
.xword 0x087db71633441022
.xword 0x84ec7f3350863b88
.xword 0xa91d38b987235d37




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
.xword 0xf4d6b739c3029a9d
.xword 0xe36d1c962281bc70
.xword 0x7a71c25cae02ce82
.xword 0x8bb152f572476fe6
.xword 0x5eeae32710234fbf
.xword 0x9aabd81d2625554f
.xword 0x1f3c0ca96e1b329a
.xword 0xcb89fab20f6d137b




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
.xword 0x99991c91daba87cc
.xword 0xbe881b5c7c71aa3a
.xword 0x80945846ab941ec9
.xword 0xfd5207e277dcc936
.xword 0x84053ccd8cde0c5b
.xword 0x699fd29355642edd
.xword 0x423bbc9e791bb265
.xword 0x4b5d57b62c99b32f




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
.xword 0x16e0ef8c4bd33b65
.xword 0xa08cf46de5ca7839
.xword 0xa224224113e5b6b9
.xword 0xd097857ca4c86085
.xword 0x746be64d83982259
.xword 0xe96e512a8c4990f2
.xword 0x63cd3705e4f23c14
.xword 0xe3e3329fd0a6f4a7




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
.xword 0x46f9623186f3a60a
.xword 0x2f4b79a2976558d5
.xword 0xcc661f3841249982
.xword 0xe1a87aeedfb3c3ae
.xword 0xa1a979ded5b35ab9
.xword 0x1ba7d32775df196e
.xword 0xbcc1fcde4d44d9af
.xword 0x51e8a9200e7a4c83




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
.xword 0x5a146eed59e94e45
.xword 0xa9aedd9684dcbed9
.xword 0x3c57beb53cc5be3d
.xword 0xb1f60c5be417df70
.xword 0xb8f25d6e92b0feb4
.xword 0x48812f53d24edee3
.xword 0xc2df3930dab202f3
.xword 0xc316411d347d2d54






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
.xword 0x6cb7eeb8da913b6b
.xword 0xc416e4bd03bc2c7a
.xword 0xadac072e34533562
.xword 0xa6b5aa4d23e2c5ad
.xword 0x6108e3030d1c5060
.xword 0x8ee4fcf9670794f1
.xword 0x50849d339888987b
.xword 0x7543e18c6d4a1cb5




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
.xword 0xf898d749a38aef45
.xword 0x2df3cc92089ee1e8
.xword 0xb609afa6a6f25759
.xword 0x1a07d5fb4c6a4b46
.xword 0x503f4545ced4977b
.xword 0x77a6de9fae04d28d
.xword 0x6c70b772897c769f
.xword 0x01b87a6e03947904




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
.xword 0xc1e5ba580fa9921d
.xword 0xe35903b92fd797df
.xword 0xc902b1caaa606a23
.xword 0xe2265cb4727e071e
.xword 0x10f0c3504ff0aa58
.xword 0xb01c9ac3c3b92b12
.xword 0x8d9999180252664b
.xword 0x5209dd3c30190b0e




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
.xword 0xf769ba26391ef40c
.xword 0x6ab378ed5ceb38fe
.xword 0xca2253c4804d0fe7
.xword 0x89d5dad344db945f
.xword 0x1146a864e5c38ec3
.xword 0x21f9b81e6debe557
.xword 0x6a06866096a802a6
.xword 0xe88724edd3bec3d3




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
.xword 0x792bbc329d8c0b6c
.xword 0xf059e8a555934099
.xword 0x7b656e842bfb0147
.xword 0x508e4c71fef6e312
.xword 0xc8f95c6332692c08
.xword 0x830b4031016dfee5
.xword 0xd208ab637d065e97
.xword 0x7cb66029a60765df




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
.xword 0x05c683f666e3c179
.xword 0x936e294bb803c2dd
.xword 0x497493d962fdd1f8
.xword 0xd23a42c28cb0ba7f
.xword 0x08860f85ac0cb791
.xword 0x059fea60447af5ae
.xword 0x1d3f688d81cc2bf0
.xword 0x758ca844c2c50803




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
.xword 0xc464f3f55349fc86
.xword 0xc67a89c2511b134e
.xword 0x62d53ee28932f0f8
.xword 0x18d5d01762b94394
.xword 0x08b5f138c14d5f3d
.xword 0x7d8ef90e08ddf46d
.xword 0xbf49f2eacbeed436
.xword 0xb85f0e90a1b1056c




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
.xword 0x6feefc29c1fac432
.xword 0x98f0200a58502d8e
.xword 0xaead04643326733c
.xword 0xf7027069aab93e2c
.xword 0xbdea12d9f18ab927
.xword 0xd04b5d9e0fd511ae
.xword 0x2cbe49f60e2fee04
.xword 0xe32bca367d08cb27






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
.xword 0xfcc635edcc117fb0
.xword 0xcd0c59b588cb96e0
.xword 0x0d707acd476611ac
.xword 0x9342654c1a81a0cb
.xword 0x5ddae5e19105d450
.xword 0x2ff077f2ece3aef1
.xword 0x7a5a644284d27ca1
.xword 0xf8f07e92d9bcc86b




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
.xword 0x4f30ecf08e5e2b2d
.xword 0xf1737598dec31f68
.xword 0x3711d9a3d206715b
.xword 0xc86f53f958c7dc30
.xword 0xb5c423b491dd6559
.xword 0xa7562188e3751785
.xword 0x0c32b47ffff1204c
.xword 0x69321a6ae0380c16




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
.xword 0x23730b9042d96c4a
.xword 0x2c6b08fe52b363d6
.xword 0x8fa7a8b182fe2f40
.xword 0xa3642786b24e02dc
.xword 0x7ccec06ae2269045
.xword 0x42d679f7365b1743
.xword 0xf87f45a0d6102dc2
.xword 0x0bcf3b0199c64c6d




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
.xword 0xd97774d4fa78910a
.xword 0xde79578fab8a984e
.xword 0x8fd2b543d3c20538
.xword 0x3363f877cbab0331
.xword 0x28834dedbe7a608a
.xword 0xcc390bb7e01d53d6
.xword 0x49503ed1e8500c18
.xword 0xf7db13d3a683f35c




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
.xword 0xb210f348cb0ce63c
.xword 0xfe4ba8f744b975ba
.xword 0x7826a5ef9a6f0802
.xword 0xaea08918a7224d9d
.xword 0xd51660ae98aa83a3
.xword 0xd0931e57ad9beb90
.xword 0x84b54ee5431a0844
.xword 0xee9204e41ace08c4




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
.xword 0xe39510f71dde44d0
.xword 0xbf4a3463781f33d1
.xword 0x1ec84a84c0b12254
.xword 0xe767e2b09c88d86a
.xword 0xefb4d88dbf25f41c
.xword 0xad4f0722319af491
.xword 0x597f7042a3bdde9c
.xword 0x8987e202500398e3




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
.xword 0xb842880a6193ea2d
.xword 0xe7adb15882395690
.xword 0xda69f4ded847ce7e
.xword 0xc6a63db7d2a864a0
.xword 0x3d3ec730f752d3c8
.xword 0x0a477f5181c2f3ed
.xword 0x00ca737a1b555708
.xword 0x2a2c9456bf3d2694




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
.xword 0x69d6297ac176cccc
.xword 0x1d36162c3c6187a0
.xword 0xde689ca76401e8fe
.xword 0x6f4dc7c03d735667
.xword 0xcf7c5a0db1aa173f
.xword 0x129dddc8327d154b
.xword 0x63ef50b97f8d4a75
.xword 0x9af9c03c5c368c47






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
.xword 0x09f31b59d64adf61
.xword 0x955b3efa4b44eb44
.xword 0x499c209b5da427e7
.xword 0xc5ab83896f85222c
.xword 0xff6aaf2054db7045
.xword 0xb1926fcd8b691f60
.xword 0xe106df5a11eb0ca0
.xword 0x8a56386039383982




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
.xword 0xbe342ebc826d9062
.xword 0x65b4d6903a5b44b8
.xword 0xddf85f6f3a114f4f
.xword 0xbb45a844a31e1c4b
.xword 0xe6246531df11f31e
.xword 0xdb8f4ae9b83856c3
.xword 0xcd8c645242c6a955
.xword 0x3dd2b1c9ce416c8d




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
.xword 0x83e37738f1e4400c
.xword 0x8902b56249dd2222
.xword 0xaf3a79ad2cd88525
.xword 0x1d2b4a6553ba09a6
.xword 0x3b5961bc867c51d2
.xword 0xf55b4c31eb4fdf12
.xword 0x1d30276c88e516d0
.xword 0x35ea2e6d5414eae1




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
.xword 0xc973d6a83103bee4
.xword 0xa591cf3a6b02e949
.xword 0x74d0fab51d46d2b0
.xword 0x77446e076704bb6a
.xword 0xa6578e1c4ed5de25
.xword 0x57e685a6e833b555
.xword 0x6ecbce9557b1289b
.xword 0x487df92eecddea62




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
.xword 0x1b67bbf332393f53
.xword 0x584f9a1eef33e9ab
.xword 0x0c30214e1114d85d
.xword 0x9a583d3e746e86ad
.xword 0x1b09689f58fc4697
.xword 0xce79af7eb2b72ebc
.xword 0x75cd087960d56774
.xword 0x3a2e14245dc31598




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
.xword 0x73f749c92adb71be
.xword 0x150db8f730255484
.xword 0x5fd3b214634b2779
.xword 0x3378eedaac44ad99
.xword 0xb59ac5c9143f2f0c
.xword 0xd43031e3c1a61054
.xword 0xda72b23b30ba197b
.xword 0x9e688f5c221572d2




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
.xword 0x728cbdd7bb056723
.xword 0x5f2046745f4dc37a
.xword 0x6e235b3a0099b8b3
.xword 0xff2a6d47f89948aa
.xword 0x4658f3c27dd1e3e9
.xword 0x41d6c66b6b60b719
.xword 0xdcf27c22f979ae09
.xword 0x9b6e3d3f7a58641a




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
.xword 0x9f9a2f7daaf5a5fd
.xword 0x379aa95eac0ac816
.xword 0xd72b2634ad3f6a5f
.xword 0x10104461ff7044a4
.xword 0xf74e5b2b46f4f3a8
.xword 0xd77ebb4cc8d33c0a
.xword 0x6f079c5c8ea5fd3a
.xword 0x4cba79b2ea0c83e2






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
.xword 0xe8dd9ad9cdfc6297
.xword 0x67bc5c8f7023372d
.xword 0xccae9ff1dda0017a
.xword 0x148ca27e66469176
.xword 0x1f69890768bdf15b
.xword 0x0d00ced774e68130
.xword 0x6aaf1910945304bf
.xword 0xe2dfa6a2ab57932e




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
.xword 0x5c8ffddb215d57aa
.xword 0xfec7b2444e3412ee
.xword 0xaefe159482a44638
.xword 0x9243eb81fd1ee07d
.xword 0x4a5df3766c07784a
.xword 0x7bbc22948eb0b03c
.xword 0x7386ad98f84a927e
.xword 0xb064383d4b5195c8




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
.xword 0xa99eede09a3225d7
.xword 0xb3bb2ac926b91095
.xword 0xc582cdf763c5f268
.xword 0xeec7401dfae80abc
.xword 0xa63756e31b155d97
.xword 0x8b8b21f26e16db00
.xword 0xd71f6e6faa155520
.xword 0x34adc5e605534ae5




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
.xword 0xf0d4764f39b6a593
.xword 0x53aac573c0f766f3
.xword 0xa00a20254f59a09a
.xword 0x8169c34a34774915
.xword 0xa53bfd9c17b2f768
.xword 0xff153e9ad8283d86
.xword 0x0d9e850275f7914b
.xword 0x1e67dd5d5beee3eb




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
.xword 0xdc35cca3cbb42222
.xword 0x201fa77bc6f198a8
.xword 0xdb83bd24cb1bd2a3
.xword 0xa6ad0281e50ebe48
.xword 0x37f5b9f6761007ec
.xword 0xbe8ea1f8a46e20fa
.xword 0xb8cb001c2ead7945
.xword 0x586f8b433067bdd9




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
.xword 0xbd274bca504c6805
.xword 0x9fd5b85af725029c
.xword 0x4bd5571c6cbb62b2
.xword 0x34a65980306266b7
.xword 0x6159290812332cb3
.xword 0xe4cba6f02e44f468
.xword 0x27edf5a7d133373c
.xword 0x794dbef0e2c33df2




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
.xword 0xc23a7051c803f821
.xword 0xb4bb842c9578899a
.xword 0x0db9fbad13407a1c
.xword 0xa683d775a9619067
.xword 0x5da1fe5dd0f2da74
.xword 0x73e22ca20612921b
.xword 0x22447d58b3d1e776
.xword 0x86b40ce94a45a3fe




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
.xword 0x5314923bbf45f957
.xword 0x08d37d02e1d6fabe
.xword 0x06d4f6466917102b
.xword 0x0591149e1f4afad9
.xword 0x7543c51706f112b0
.xword 0x27eccae5e1947f37
.xword 0x34987fef91150d64
.xword 0x0423917937ff4ece






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
.xword 0xedc1ad939f7e0f78
.xword 0xd0711e3cacc05014
.xword 0xf3c50afaedbe20d6
.xword 0x5a02d675badfbbe5
.xword 0xc888f84dd05fbe9b
.xword 0x9e98bfaf808cb294
.xword 0x3f41224fd1ebe6ef
.xword 0x170cf56eadd74fc3




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
.xword 0x93b82d321c636998
.xword 0x6372cbb832b9131c
.xword 0xe10847187f9e67e8
.xword 0x288f438dd3ba3bd3
.xword 0x47f143a52309e6f5
.xword 0x18586d49743d37e2
.xword 0x3885188edbc08e8f
.xword 0x3842297bfba188b6




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
.xword 0x987e5f33f8171feb
.xword 0xb0d59d2db9dc9d65
.xword 0x2f249af477de7467
.xword 0x003dfae11e908cb2
.xword 0x3fb02c6459f5ce65
.xword 0xd73433bb42286696
.xword 0x962a2d10386b2b15
.xword 0xc68a94eb6d76be83




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
.xword 0xe485ef43ea7b0e1a
.xword 0x1793398d538ebf7f
.xword 0x59739ca1433834dc
.xword 0xa17b2523190862d6
.xword 0xc71faf3f8bb83169
.xword 0xbd5a7262f89fab8f
.xword 0xdcd22feb354e458d
.xword 0x7cdf1b1efc0dfcce




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
.xword 0x936c79d5da8a68f7
.xword 0x9467900186a32a36
.xword 0xfe2ce16d18767549
.xword 0xce111139d3bd0e08
.xword 0x169c701f32ebe5cc
.xword 0xbeb4d8d9799a7394
.xword 0xca8b8aca3539171e
.xword 0x874a0fe6d30a854f




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
.xword 0x762c5b419de4b8f5
.xword 0xcccd185b527b7f4a
.xword 0xf1c15ec67866f8d7
.xword 0x7dac2cabb35ce121
.xword 0x8b39aa3867406fad
.xword 0x1fce7a049c630a7b
.xword 0x24345892e7dffbaf
.xword 0xb4631922dfa41818




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
.xword 0x2571d3dd1ded6e45
.xword 0xf0918c06bb0f4e14
.xword 0x85fe45e3994ab019
.xword 0xd8937efce6f60540
.xword 0x7236c30bbdb7c827
.xword 0x438943651d8355a3
.xword 0x0aa4b944c97fa077
.xword 0x618022065b8c0767




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
.xword 0x11c8e4bf5926a321
.xword 0xe155fde777a06c1a
.xword 0x57968d2ed325a135
.xword 0x047027432eeac95f
.xword 0x745fe31f34fea46c
.xword 0x30ca8539210279c5
.xword 0x968d76c73e65be4c
.xword 0x37952a52e75e8e6a




#if 0
#endif
