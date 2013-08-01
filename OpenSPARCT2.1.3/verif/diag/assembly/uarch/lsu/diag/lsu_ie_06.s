/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_06.s
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
	setx 0x86e05d84503dd020, %g1, %r2
	setx 0x04f7a5ced521cf8a, %g1, %r3
	setx 0xa8d991fa40f5271b, %g1, %r4
	setx 0x69fb5e3a349676b0, %g1, %r5
	setx 0x75c37264730753f3, %g1, %r6
	setx 0x43afe1aab5273fc7, %g1, %r7
	setx 0x799299c551678838, %g1, %r8

     mov %r2, %r1
CP_BIS_PRI0:
	and	%r26,	%r28,	%r26
CHANGE_PRIV1:
	ta	T_CHANGE_PRIV
CHANGE_R262:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP2:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 3: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
SHORT_FP_PRI3:
	.word 0xc59a9a5a  ! 5: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc4a4d13a  ! 7: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
NC_PST_PRI4:
	.word 0xc5bbd99a  ! 9: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc4f4903a  ! 11: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
NC_BIS_AIUS5:
	.word 0xccbfc47a  ! 13: STDA_R	stda	%r6, [%r31 + %r26] 0x23
CHANGE_USER6:
	ta	T_CHANGE_NONPRIV
CHANGE_R267:
	add	%r26,	%r27,	%r26
CP_BIS_PRI7:
	and	%r26,	%r28,	%r26
	.word 0xc4aadd5a  ! 15: STBA_R	stba	%r2, [%r11 + %r26] 0xea
	.word 0xc48cd03a  ! 17: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc53b2008  ! 18: STDF_I	std	%f2, [0x0008, %r12]
CHANGE_PRIV8:
	ta	T_CHANGE_PRIV
CHANGE_R269:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP9:
	and	%r26,	%r28,	%r26
	.word 0xd0a6055a  ! 20: STWA_R	stwa	%r8, [%r24 + %r26] 0x2a
	.word 0xc5e2e01a  ! 21: CASA_R	casa	[%r11] %asi, %r26, %r2
NC_AIUP10:
	.word 0xc4de431a  ! 23: LDXA_R	ldxa	[%r25, %r26] 0x18, %r2
	.word 0xc582d05a  ! 24: LDFA_R	lda	[%r11, %r26], %f2
	.word 0xc48b501a  ! 25: LDUBA_R	lduba	[%r13, %r26] 0x80, %r2
CP_AIUS11:
	.word 0xc4b7823a  ! 27: STHA_R	stha	%r2, [%r30 + %r26] 0x11
CHANGE_R2612:
	add	%r26,	%r27,	%r26
CP_BIS_SEC12:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 29: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
BLK_PRI13:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 31: LDDFA_R	ldda	[%r12, %r26], %f0
NC_BIS_AIUS14:
	.word 0xc8bfc47a  ! 33: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xc4acd03a  ! 35: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc584d13a  ! 37: LDFA_R	lda	[%r19, %r26], %f2
NC_BIS_AIUP15:
	.word 0xccbe445a  ! 39: STDA_R	stda	%r6, [%r25 + %r26] 0x22
CHANGE_USER16:
	ta	T_CHANGE_NONPRIV
CHANGE_R2617:
	add	%r26,	%r27,	%r26
CP_BIS_PRI17:
	and	%r26,	%r28,	%r26
	.word 0xc8f31c5a  ! 41: STXA_R	stxa	%r4, [%r12 + %r26] 0xe2
	.word 0xc59a911a  ! 42: LDDFA_R	ldda	[%r10, %r26], %f2
NC_BLK_SEc18:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 44: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc5bb511a  ! 45: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc522e008  ! 46: STF_I	st	%f2, [0x0008, %r11]
CHANGE_PRIV19:
	ta	T_CHANGE_PRIV
CHANGE_R2620:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP20:
	.word 0xc4a6455a  ! 48: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
	.word 0xc4ac913a  ! 50: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc4ab901a  ! 52: STBA_R	stba	%r2, [%r14 + %r26] 0x80
CHANGE_USER21:
	ta	T_CHANGE_NONPRIV
CHANGE_R2622:
	add	%r26,	%r27,	%r26
NC_BIS_PRI22:
	.word 0xd0ac1c5a  ! 54: STBA_R	stba	%r8, [%r16 + %r26] 0xe2
	.word 0xc51ae008  ! 55: LDDF_I	ldd	[%r11, 0x0008], %f2
	.word 0xc4a4d03a  ! 57: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc49cd03a  ! 59: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
	.word 0xc4b4d03a  ! 61: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc4bc913a  ! 63: STDA_R	stda	%r2, [%r18 + %r26] 0x89
	.word 0xc59c913a  ! 65: LDDFA_R	ldda	[%r18, %r26], %f2
NC_SHORT_FP_SEC23:
	.word 0xc5bcdb3a  ! 67: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc403401a  ! 68: LDUW_R	lduw	[%r13 + %r26], %r2
	.word 0xc4b4903a  ! 70: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc4f4903a  ! 72: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc59c903a  ! 74: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc4d4903a  ! 76: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc48b505a  ! 77: LDUBA_R	lduba	[%r13, %r26] 0x82, %r2
	.word 0xc4db501a  ! 78: LDXA_R	ldxa	[%r13, %r26] 0x80, %r2
SET_TL1_24:
	ta	T_CHANGE_TO_TL1
CHANGE_R2625:
	mov	%g0,	%r26
NC_BIS_NUC25:
	.word 0xc4bd45fa  ! 80: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
NC_BIS_AIUP26:
	.word 0xc4ae445a  ! 82: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_NUC27:
	.word 0xc585419a  ! 84: LDFA_R	lda	[%r21, %r26], %f2
NC_AIUS28:
	.word 0xc4cfc23a  ! 86: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r2
	.word 0xc584913a  ! 88: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc5a2d01a  ! 89: STFA_R	sta	%f2, [%r26, %r11]
CP_BIS_QUAD_LD29:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 91: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
NC_AIUS30:
	.word 0xc487c33a  ! 93: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r2
NC_AIUS31:
	.word 0xc497c23a  ! 95: LDUHA_R	lduha	[%r31, %r26] 0x11, %r2
NC_BLK_SEc32:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 97: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BIS_AIUP33:
	.word 0xc4a6445a  ! 99: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD34:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 101: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
NC_BIS_AIUP35:
	.word 0xc4a6445a  ! 103: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xc4d2911a  ! 104: LDSHA_R	ldsha	[%r10, %r26] 0x88, %r2
CP_BIS_QUAD_LD36:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 106: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
NC_BIS_AIUS37:
	.word 0xd0a7c47a  ! 108: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
CP_NUC38:
	.word 0xc4f5009a  ! 110: STXA_R	stxa	%r2, [%r20 + %r26] 0x04
	.word 0xc584d03a  ! 112: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4d4101a  ! 114: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r2
	.word 0xc4bad01a  ! 115: STDA_R	stda	%r2, [%r11 + %r26] 0x80
NC_PST_PRI39:
	.word 0xc5bb995a  ! 117: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4bc101a  ! 119: STDA_R	stda	%r2, [%r16 + %r26] 0x80
SET_TL0_40:
	ta	T_CHANGE_TO_TL0
CHANGE_R2641:
	add	%r26,	%r27,	%r26
NC_BIS_SEC41:
	.word 0xc4bcdc7a  ! 121: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc482901a  ! 122: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r2
	.word 0xc4d4913a  ! 124: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
	.word 0xc49cd03a  ! 126: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
	.word 0xc582d01a  ! 127: LDFA_R	lda	[%r11, %r26], %f2
CHANGE_R2642:
	add	%r26,	%r27,	%r26
CP_BIS_SEC42:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 129: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xc59c903a  ! 131: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc584d03a  ! 133: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc584913a  ! 135: LDFA_R	lda	[%r18, %r26], %f2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC44:
	.word 0xc5a5409a  ! 137: STFA_R	sta	%f2, [%r26, %r21]
	.word 0xc4f4d03a  ! 139: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
CHANGE_USER45:
	ta	T_CHANGE_NONPRIV
CHANGE_R2646:
	add	%r26,	%r27,	%r26
CP_BIS_PRI46:
	and	%r26,	%r28,	%r26
	.word 0xcca29c5a  ! 141: STWA_R	stwa	%r6, [%r10 + %r26] 0xe2
	.word 0xc5bb911a  ! 143: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc5bc903a  ! 145: STDFA_R	stda	%f2, [%r26, %r18]
CHANGE_PRIV47:
	ta	T_CHANGE_PRIV
CHANGE_R2648:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS48:
	.word 0xc4b7c57a  ! 147: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
	.word 0xc4c4913a  ! 149: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc4b4d03a  ! 151: STHA_R	stha	%r2, [%r19 + %r26] 0x81
NC_BLK_SEc49:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 153: LDDFA_R	ldda	[%r19, %r26], %f0
SET_TL1_50:
	ta	T_CHANGE_TO_TL1
CHANGE_R2651:
	add	%r26,	%r27,	%r26
NC_BIS_NUC51:
	.word 0xc4a544fa  ! 155: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
NC_SHORT_FP_SEC52:
	.word 0xc5bcdb7a  ! 157: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc483101a  ! 158: LDUWA_R	lduwa	[%r12, %r26] 0x80, %r2
	.word 0xc5a4511a  ! 160: STFA_R	sta	%f2, [%r26, %r17]
NC_BIS_AIUP53:
	.word 0xd0a6445a  ! 162: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
SET_TL0_54:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI55:
	.word 0xc4a45c5a  ! 164: STWA_R	stwa	%r2, [%r17 + %r26] 0xe2
BLK_PRI56:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 166: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xc4c4d03a  ! 168: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
NC_BIS_PRI57:
	.word 0xc4a39c5a  ! 170: STWA_R	stwa	%r2, [%r14 + %r26] 0xe2
BLK_PRI58:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1f1a  ! 172: STDFA_R	stda	%f16, [%r26, %r12]
NC_BIS_SEC59:
	.word 0xc4bcdc7a  ! 174: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc5e2a01a  ! 175: CASA_R	casa	[%r10] %asi, %r26, %r2
CHANGE_PRIV60:
	ta	T_CHANGE_PRIV
CHANGE_R2661:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS61:
	and	%r26,	%r28,	%r26
	.word 0xd0bf857a  ! 177: STDA_R	stda	%r8, [%r30 + %r26] 0x2b
	.word 0xc59a901a  ! 178: LDDFA_R	ldda	[%r10, %r26], %f2
CP_BIS_AIUP62:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 180: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc483901a  ! 182: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r2
	.word 0xc4d4903a  ! 184: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc51a801a  ! 185: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc4b4913a  ! 187: STHA_R	stha	%r2, [%r18 + %r26] 0x89
CP_BIS_QUAD_LD63:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 189: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
	.word 0xc59c913a  ! 191: LDDFA_R	ldda	[%r18, %r26], %f2
NC_BIS_AIUP64:
	.word 0xc8f6445a  ! 193: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
WR_LEASI_65:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_66:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_CLE67:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc484d03a  ! 197: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
NC_PST_PRI68:
	.word 0xc5bb981a  ! 199: STDFA_R	stda	%f2, [%r26, %r14]
CP_BIS_PRI69:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 201: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
SHORT_FP_PRI70:
	.word 0xc59a9b5a  ! 203: LDDFA_R	ldda	[%r10, %r26], %f2
NC_BIS_SEC71:
	.word 0xc8a4dc7a  ! 205: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xc42aa00b  ! 206: STB_I	stb	%r2, [%r10 + 0x000b]
CP_BIS_QUAD_LD72:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9d5a  ! 208: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
SHORT_FP_PRI73:
	.word 0xc59b5a1a  ! 210: LDDFA_R	ldda	[%r13, %r26], %f2
CHANGE_PRIV74:
	ta	T_CHANGE_PRIV
CHANGE_R2675:
	mov	%g0,	%r26
CP_BIS_NUC75:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 212: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
SET_TL1_76:
	ta	T_CHANGE_TO_TL1
CHANGE_R2677:
	add	%r26,	%r27,	%r26
NC_BIS_NUC77:
	.word 0xc4b544fa  ! 214: STHA_R	stha	%r2, [%r21 + %r26] 0x27
NC_BLK_SEc78:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 216: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc522801a  ! 217: STF_R	st	%f2, [%r26, %r10]
	.word 0xc4cb911a  ! 219: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r2
	.word 0xc494501a  ! 221: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
	.word 0xc484903a  ! 223: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc5bad01a  ! 224: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc48c903a  ! 226: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CP_PST_PRI79:
	.word 0xc5bb189a  ! 228: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc49b901a  ! 230: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc402a008  ! 231: LDUW_I	lduw	[%r10 + 0x0008], %r2
	.word 0xc5e3601a  ! 232: CASA_R	casa	[%r13] %asi, %r26, %r2
CP_ATM_QUAD_LD80:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 234: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc40ae00b  ! 235: LDUB_I	ldub	[%r11 + 0x000b], %r2
	.word 0xc4db911a  ! 237: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
	.word 0xc5a4111a  ! 239: STFA_R	sta	%f2, [%r26, %r16]
	.word 0xc502c01a  ! 240: LDF_R	ld	[%r11, %r26], %f2
	.word 0xc4ac903a  ! 242: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc4d4913a  ! 244: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
CP_AIUS81:
	.word 0xc48f823a  ! 246: LDUBA_R	lduba	[%r30, %r26] 0x11, %r2
	.word 0xc49cd03a  ! 248: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
BLK_PRI82:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 250: STDFA_R	stda	%f0, [%r26, %r11]
BLK_PRI83:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 252: STDFA_R	stda	%f0, [%r26, %r13]
CP_BIS_AIUP84:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 254: STHA_R	stha	%r2, [%r24 + %r26] 0x22
	.word 0xc5a2901a  ! 255: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc432c01a  ! 256: STH_R	sth	%r2, [%r11 + %r26]
	.word 0xc47ae008  ! 257: SWAP_I	swap	%r2, [%r11 + 0x0008]
	.word 0xc483901a  ! 259: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r2
CP_AIUS85:
	.word 0xc5bf833a  ! 261: STDFA_R	stda	%f2, [%r26, %r30]
CP_BIS_AIUP86:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 263: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
NC_AIUS87:
	.word 0xc4dfc23a  ! 265: LDXA_R	ldxa	[%r31, %r26] 0x11, %r2
NC_AIUP88:
	.word 0xc586421a  ! 267: LDFA_R	lda	[%r25, %r26], %f2
	.word 0xc48b911a  ! 269: LDUBA_R	lduba	[%r14, %r26] 0x88, %r2
	.word 0xc49cd13a  ! 271: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
	.word 0xc5a4913a  ! 273: STFA_R	sta	%f2, [%r26, %r18]
NC_NUC89:
	.word 0xc495409a  ! 275: LDUHA_R	lduha	[%r21, %r26] 0x04, %r2
	.word 0xc47b2008  ! 276: SWAP_I	swap	%r2, [%r12 + 0x0008]
	.word 0xc4bc913a  ! 278: STDA_R	stda	%r2, [%r18 + %r26] 0x89
CP_BIS_AIUP90:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 280: STDA_R	stda	%r2, [%r24 + %r26] 0x22
CP_AIUP91:
	.word 0xc5be021a  ! 282: STDFA_R	stda	%f2, [%r26, %r24]
CP_ATM_QUAD_LD92:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 284: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc4ab511a  ! 285: STBA_R	stba	%r2, [%r13 + %r26] 0x88
	.word 0xc494903a  ! 287: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
NC_BLK_SEc93:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 289: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc4bc903a  ! 291: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc4f4913a  ! 293: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
NC_BLK_SEc94:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 295: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc5bc913a  ! 297: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc48cd03a  ! 299: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc5a3111a  ! 300: STFA_R	sta	%f2, [%r26, %r12]
SHORT_FP_PRI95:
	.word 0xc59b5b5a  ! 302: LDDFA_R	ldda	[%r13, %r26], %f2
CP_BIS_AIUS96:
	and	%r26,	%r28,	%r26
	.word 0xc89f857a  ! 304: LDDA_R	ldda	[%r30, %r26] 0x2b, %r4
	.word 0xc5a4913a  ! 306: STFA_R	sta	%f2, [%r26, %r18]
SET_TL0_97:
	ta	T_CHANGE_TO_TL0
CHANGE_R2698:
	add	%r26,	%r27,	%r26
NC_BIS_SEC98:
	.word 0xc4a4dc7a  ! 308: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP100:
	.word 0xc4c6031a  ! 310: LDSWA_R	ldswa	[%r24, %r26] 0x18, %r2
	.word 0xefefa000  ! 312: PREFETCHA_I	prefetcha	[%r30, + 0x0000] %asi, #23
	.word 0xc4bb901a  ! 314: STDA_R	stda	%r2, [%r14 + %r26] 0x80
	.word 0xc484d03a  ! 316: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
NC_BIS_AIUP101:
	.word 0xccbe455a  ! 318: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
CHANGE_R26102:
	add	%r26,	%r27,	%r26
CP_BIS_SEC102:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 320: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
BLK_PRI103:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 322: STDFA_R	stda	%f0, [%r26, %r10]
NC_BIS_SEC104:
	.word 0xc4acdc7a  ! 324: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
NC_BIS_AIUP105:
	.word 0xc8ae445a  ! 326: STBA_R	stba	%r4, [%r25 + %r26] 0x22
CP_BIS_NUC106:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 328: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xc48c913a  ! 330: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xef6fa01e  ! 332: PREFETCH_I	prefetch	[%r30 + 0x001e], #23
CP_BIS_AIUP107:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 334: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
	.word 0xc4b4913a  ! 336: STHA_R	stha	%r2, [%r18 + %r26] 0x89
	.word 0xc5bc101a  ! 338: STDFA_R	stda	%f2, [%r26, %r16]
NC_BIS_SEC108:
	.word 0xc8f4dc7a  ! 340: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xc5a3901a  ! 342: STFA_R	sta	%f2, [%r26, %r14]
NC_BIS_AIUS109:
	.word 0xc4afc47a  ! 344: STBA_R	stba	%r2, [%r31 + %r26] 0x23
	.word 0xc43ae008  ! 345: STD_I	std	%r2, [%r11 + 0x0008]
CP_BIS_QUAD_LD110:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 347: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
CHANGE_R26111:
	add	%r26,	%r27,	%r26
CP_BIS_SEC111:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 349: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
CP_BIS_AIUS112:
	and	%r26,	%r28,	%r26
	.word 0xcca7847a  ! 351: STWA_R	stwa	%r6, [%r30 + %r26] 0x23
	.word 0xc484903a  ! 353: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
NC_PST_PRI113:
	.word 0xc5bbd89a  ! 355: STDFA_R	stda	%f2, [%r26, %r15]
SHORT_FP_PRI114:
	.word 0xc5ba9b5a  ! 357: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4bc903a  ! 359: STDA_R	stda	%r2, [%r18 + %r26] 0x81
CP_BIS_QUAD_LD115:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 361: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
CP_BIS_NUC116:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 363: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
NC_BLK_SEc117:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 365: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc584d03a  ! 367: LDFA_R	lda	[%r19, %r26], %f2
CP_PST_PRI118:
	.word 0xc5bad85a  ! 369: STDFA_R	stda	%f2, [%r26, %r11]
CP_AIUS119:
	.word 0xc497833a  ! 371: LDUHA_R	lduha	[%r30, %r26] 0x19, %r2
CHANGE_USER120:
	ta	T_CHANGE_NONPRIV
CHANGE_R26121:
	add	%r26,	%r27,	%r26
CP_BIS_PRI121:
	and	%r26,	%r28,	%r26
	.word 0xccab5d5a  ! 373: STBA_R	stba	%r6, [%r13 + %r26] 0xea
	.word 0xc59ad01a  ! 374: LDDFA_R	ldda	[%r11, %r26], %f2
NC_PST_PRI122:
	.word 0xc5bc189a  ! 376: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc482d11a  ! 377: LDUWA_R	lduwa	[%r11, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC124:
	.word 0xc5a5019a  ! 379: STFA_R	sta	%f2, [%r26, %r20]
CP_BIS_AIUP125:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 381: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
NC_BLK_SEc126:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 383: LDDFA_R	ldda	[%r19, %r26], %f16
CHANGE_R26127:
	mov	%g0,	%r26
CP_BIS_SEC127:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 385: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
CP_BIS_QUAD_LD128:
	and	%r26,	%r29,	%r26
	.word 0xc89b1d5a  ! 387: LDDA_R	ldda	[%r12, %r26] 0xea, %r4
	.word 0xc4acd13a  ! 389: STBA_R	stba	%r2, [%r19 + %r26] 0x89
NC_BIS_AIUS129:
	.word 0xccf7c57a  ! 391: STXA_R	stxa	%r6, [%r31 + %r26] 0x2b
	.word 0xc4cc903a  ! 393: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CP_BIS_AIUS130:
	and	%r26,	%r28,	%r26
	.word 0xc8b7847a  ! 395: STHA_R	stha	%r4, [%r30 + %r26] 0x23
NC_BIS_SEC131:
	.word 0xccacdc7a  ! 397: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
CP_BIS_AIUS132:
	and	%r26,	%r28,	%r26
	.word 0xccb7857a  ! 399: STHA_R	stha	%r6, [%r30 + %r26] 0x2b
CP_BIS_AIUS133:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 401: STDA_R	stda	%r2, [%r30 + %r26] 0x23
	.word 0xc49c903a  ! 403: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
NC_BLK_SEc134:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 405: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_AIUP135:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 407: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
	.word 0xc493901a  ! 409: LDUHA_R	lduha	[%r14, %r26] 0x80, %r2
	.word 0xc4b4d03a  ! 411: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc4d4d13a  ! 413: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	.word 0xc4d4d03a  ! 415: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
NC_BLK_SEc136:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 417: STDFA_R	stda	%f0, [%r26, %r19]
NC_NUC137:
	.word 0xc4b5409a  ! 419: STHA_R	stha	%r2, [%r21 + %r26] 0x04
	.word 0xc49bd11a  ! 421: LDDA_R	ldda	[%r15, %r26] 0x88, %r2
	.word 0xc5236008  ! 422: STF_I	st	%f2, [0x0008, %r13]
	.word 0xc4d4101a  ! 424: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r2
	.word 0xc42ae00b  ! 425: STB_I	stb	%r2, [%r11 + 0x000b]
CP_NUC138:
	.word 0xc48d019a  ! 427: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r2
CP_AIUP139:
	.word 0xc4ae021a  ! 429: STBA_R	stba	%r2, [%r24 + %r26] 0x10
	.word 0xc494d13a  ! 431: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
	.word 0xc494d13a  ! 433: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
	.word 0xc4c3501a  ! 434: LDSWA_R	ldswa	[%r13, %r26] 0x80, %r2
SET_TL1_140:
	ta	T_CHANGE_TO_TL1
CHANGE_R26141:
	add	%r26,	%r27,	%r26
NC_BIS_NUC141:
	.word 0xc4f544fa  ! 436: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
SET_TL0_142:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI143:
	and	%r26,	%r28,	%r26
	.word 0xd0b35d5a  ! 438: STHA_R	stha	%r8, [%r13 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP145:
	.word 0xc4ae421a  ! 440: STBA_R	stba	%r2, [%r25 + %r26] 0x10
CP_AIUS146:
	.word 0xc4b7833a  ! 442: STHA_R	stha	%r2, [%r30 + %r26] 0x19
	.word 0xc484101a  ! 444: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r2
NC_BIS_SEC147:
	.word 0xccf4dc7a  ! 446: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
NC_AIUS148:
	.word 0xc48fc23a  ! 448: LDUBA_R	lduba	[%r31, %r26] 0x11, %r2
	.word 0xc49cd03a  ! 450: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
	.word 0xc59c903a  ! 452: LDDFA_R	ldda	[%r18, %r26], %f2
NC_BLK_SEc149:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 454: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc53aa008  ! 455: STDF_I	std	%f2, [0x0008, %r10]
CHANGE_USER150:
	ta	T_CHANGE_NONPRIV
CHANGE_R26151:
	add	%r26,	%r27,	%r26
NC_BIS_PRI151:
	.word 0xd0a45c5a  ! 457: STWA_R	stwa	%r8, [%r17 + %r26] 0xe2
CHANGE_CLE152:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4ea901a  ! 459: LDSTUBA_R	ldstuba	%r2, [%r10 + %r26] 0x80
CP_BIS_PRI153:
	and	%r26,	%r28,	%r26
	.word 0xd0ba9c5a  ! 461: STDA_R	stda	%r8, [%r10 + %r26] 0xe2
	.word 0xc4a4913a  ! 463: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
	.word 0xc4a4d13a  ! 465: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
CP_BIS_QUAD_LD154:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 467: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP156:
	.word 0xc4ae421a  ! 469: STBA_R	stba	%r2, [%r25 + %r26] 0x10
	.word 0xc59a911a  ! 470: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc43b001a  ! 471: STD_R	std	%r2, [%r12 + %r26]
	.word 0xc4736008  ! 472: STX_I	stx	%r2, [%r13 + 0x0008]
SET_TL1_157:
	ta	T_CHANGE_TO_TL1
CHANGE_R26158:
	add	%r26,	%r27,	%r26
NC_BIS_NUC158:
	.word 0xd0a545fa  ! 474: STWA_R	stwa	%r8, [%r21 + %r26] 0x2f
	.word 0xc502a008  ! 475: LDF_I	ld	[%r10, 0x0008], %f2
CP_BIS_QUAD_LD159:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 477: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc4a4913a  ! 479: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
	.word 0xc4d4903a  ! 481: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_PST_PRI160:
	.word 0xc5bc585a  ! 483: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc49b901a  ! 485: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
SET_TL0_161:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI162:
	.word 0xccf3dc5a  ! 487: STXA_R	stxa	%r6, [%r15 + %r26] 0xe2
	.word 0xc584903a  ! 489: LDFA_R	lda	[%r18, %r26], %f2
CHANGE_PRIV163:
	ta	T_CHANGE_PRIV
CHANGE_R26164:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD164:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 491: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
SHORT_FP_PRI165:
	.word 0xc5badb1a  ! 493: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc582915a  ! 494: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc4eb501a  ! 495: LDSTUBA_R	ldstuba	%r2, [%r13 + %r26] 0x80
	.word 0xc452a00a  ! 496: LDSH_I	ldsh	[%r10 + 0x000a], %r2
	.word 0xc53a801a  ! 497: STDF_R	std	%f2, [%r26, %r10]
SET_TL1_166:
	ta	T_CHANGE_TO_TL1
CHANGE_R26167:
	add	%r26,	%r27,	%r26
NC_BIS_NUC167:
	.word 0xc4b544fa  ! 499: STHA_R	stha	%r2, [%r21 + %r26] 0x27
CP_BIS_QUAD_LD168:
	and	%r26,	%r29,	%r26
	.word 0xcc9add5a  ! 501: LDDA_R	ldda	[%r11, %r26] 0xea, %r6
	.word 0xc59b101a  ! 502: LDDFA_R	ldda	[%r12, %r26], %f2
CP_BIS_AIUP169:
	and	%r26,	%r28,	%r26
	.word 0xcc9e055a  ! 504: LDDA_R	ldda	[%r24, %r26] 0x2a, %r6
CP_BIS_NUC170:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 506: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xc5a4d13a  ! 508: STFA_R	sta	%f2, [%r26, %r19]
SET_TL0_171:
	ta	T_CHANGE_TO_TL0
CHANGE_R26172:
	mov	%g0,	%r26
NC_BIS_SEC172:
	.word 0xc8bcdd7a  ! 510: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
	.word 0xc59ad05a  ! 511: LDDFA_R	ldda	[%r11, %r26], %f2
NC_PST_PRI173:
	.word 0xc5bbd85a  ! 513: STDFA_R	stda	%f2, [%r26, %r15]
CHANGE_PRIV174:
	ta	T_CHANGE_PRIV
CHANGE_R26175:
	add	%r26,	%r27,	%r26
CP_BIS_NUC175:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 515: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
SHORT_FP_PRI176:
	.word 0xc59a9a1a  ! 517: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc484d13a  ! 519: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
CP_AIUS177:
	.word 0xc4bf823a  ! 521: STDA_R	stda	%r2, [%r30 + %r26] 0x11
CP_AIUP178:
	.word 0xc4a6021a  ! 523: STWA_R	stwa	%r2, [%r24 + %r26] 0x10
CP_AIUS179:
	.word 0xc4a7823a  ! 525: STWA_R	stwa	%r2, [%r30 + %r26] 0x11
SET_TL1_180:
	ta	T_CHANGE_TO_TL1
CHANGE_R26181:
	add	%r26,	%r27,	%r26
NC_BIS_NUC181:
	.word 0xc4b544fa  ! 527: STHA_R	stha	%r2, [%r21 + %r26] 0x27
NC_AIUP182:
	.word 0xc4d6431a  ! 529: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r2
NC_AIUS183:
	.word 0xc4d7c23a  ! 531: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r2
SET_TL0_184:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI185:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 533: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	.word 0xc4b4101a  ! 535: STHA_R	stha	%r2, [%r16 + %r26] 0x80
	.word 0xc4b4501a  ! 537: STHA_R	stha	%r2, [%r17 + %r26] 0x80
SHORT_FP_PRI186:
	.word 0xc5bb5b1a  ! 539: STDFA_R	stda	%f2, [%r26, %r13]
CP_BIS_PRI187:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 541: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
	.word 0xc51ae008  ! 542: LDDF_I	ldd	[%r11, 0x0008], %f2
	.word 0xc4a4903a  ! 544: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc4dcd03a  ! 546: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
CHANGE_CLE188:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4f4913a  ! 549: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc4ac913a  ! 551: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP190:
	.word 0xc4de431a  ! 553: LDXA_R	ldxa	[%r25, %r26] 0x18, %r2
CP_AIUS191:
	.word 0xc4bf833a  ! 555: STDA_R	stda	%r2, [%r30 + %r26] 0x19
NC_BIS_AIUS192:
	.word 0xccf7c47a  ! 557: STXA_R	stxa	%r6, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD193:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 559: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_NUC194:
	.word 0xc5e5201a  ! 561: CASA_R	casa	[%r20] %asi, %r26, %r2
	.word 0xc4a4101a  ! 563: STWA_R	stwa	%r2, [%r16 + %r26] 0x80
CHANGE_TLE195:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV196:
	ta	T_CHANGE_PRIV
CHANGE_R26197:
	add	%r26,	%r27,	%r26
CP_BIS_NUC197:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 566: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
NC_AIUS198:
	.word 0xc48fc33a  ! 568: LDUBA_R	lduba	[%r31, %r26] 0x19, %r2
	.word 0xc5bcd03a  ! 570: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4232008  ! 571: STW_I	stw	%r2, [%r12 + 0x0008]
	.word 0xc483d11a  ! 573: LDUWA_R	lduwa	[%r15, %r26] 0x88, %r2
CHANGE_USER199:
	ta	T_CHANGE_NONPRIV
CHANGE_R26200:
	add	%r26,	%r27,	%r26
CP_BIS_PRI200:
	and	%r26,	%r28,	%r26
	.word 0xd0ab1c5a  ! 575: STBA_R	stba	%r8, [%r12 + %r26] 0xe2
CP_PST_PRI201:
	.word 0xc5bb185a  ! 577: STDFA_R	stda	%f2, [%r26, %r12]
CHANGE_PRIV202:
	ta	T_CHANGE_PRIV
CHANGE_R26203:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS203:
	.word 0xc4bfc47a  ! 579: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xc522e008  ! 580: STF_I	st	%f2, [0x0008, %r11]
	.word 0xc4d3911a  ! 582: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r2
NC_PST_PRI204:
	.word 0xc5bc585a  ! 584: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc4c4913a  ! 586: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
CP_AIUP205:
	.word 0xc4ce031a  ! 588: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r2
NC_BLK_SEc206:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 590: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_QUAD_LD207:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 592: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc59a905a  ! 593: LDDFA_R	ldda	[%r10, %r26], %f2
CP_BIS_AIUP208:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 595: STDA_R	stda	%r2, [%r24 + %r26] 0x22
CHANGE_USER209:
	ta	T_CHANGE_NONPRIV
CHANGE_R26210:
	add	%r26,	%r27,	%r26
NC_BIS_PRI210:
	.word 0xc4a41d5a  ! 597: STWA_R	stwa	%r2, [%r16 + %r26] 0xea
SET_TL1_211:
	ta	T_CHANGE_TO_TL1
CHANGE_R26212:
	mov	%g0,	%r26
NC_BIS_NUC212:
	.word 0xcca544fa  ! 599: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
CP_BIS_AIUP213:
	and	%r26,	%r28,	%r26
	.word 0xccb6055a  ! 601: STHA_R	stha	%r6, [%r24 + %r26] 0x2a
CP_AIUS214:
	.word 0xc4df823a  ! 603: LDXA_R	ldxa	[%r30, %r26] 0x11, %r2
	.word 0xc4b4903a  ! 605: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc5bb901a  ! 607: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4ac913a  ! 609: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc49cd13a  ! 611: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
NC_NUC215:
	.word 0xc5bd409a  ! 614: STDFA_R	stda	%f2, [%r26, %r21]
CP_NUC216:
	.word 0xc4ed019a  ! 616: LDSTUBA_R	ldstuba	%r2, [%r20 + %r26] 0x0c
SET_TL0_217:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI218:
	and	%r26,	%r28,	%r26
	.word 0xcc9b5c5a  ! 618: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xc48c903a  ! 620: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CP_BIS_QUAD_LD219:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9d5a  ! 622: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
CHANGE_PRIV220:
	ta	T_CHANGE_PRIV
CHANGE_R26221:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS221:
	.word 0xccbfc47a  ! 624: STDA_R	stda	%r6, [%r31 + %r26] 0x23
	.word 0xc49c511a  ! 626: LDDA_R	ldda	[%r17, %r26] 0x88, %r2
NC_BIS_SEC222:
	.word 0xc4b4dd7a  ! 628: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
NC_BLK_SEc223:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 630: LDDFA_R	ldda	[%r19, %r26], %f0
NC_BIS_SEC224:
	.word 0xc8acdc7a  ! 632: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
	.word 0xc7ebde3a  ! 634: PREFETCHA_R	prefetcha	[%r15, %r26] 0xf1, #one_write
CP_NUC225:
	.word 0xc5a5009a  ! 636: STFA_R	sta	%f2, [%r26, %r20]
	.word 0xc49b901a  ! 638: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
NC_AIUP226:
	.word 0xc4c6421a  ! 640: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r2
	.word 0xc583911a  ! 642: LDFA_R	lda	[%r14, %r26], %f2
CP_PST_PRI227:
	.word 0xc5bad99a  ! 644: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc5bcd03a  ! 646: STDFA_R	stda	%f2, [%r26, %r19]
CP_BIS_AIUP228:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 648: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
CHANGE_R26229:
	add	%r26,	%r27,	%r26
CP_BIS_SEC229:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 650: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
	.word 0xc49c101a  ! 652: LDDA_R	ldda	[%r16, %r26] 0x80, %r2
CHANGE_R26230:
	add	%r26,	%r27,	%r26
CP_BIS_SEC230:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 654: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xc4dc511a  ! 656: LDXA_R	ldxa	[%r17, %r26] 0x88, %r2
NC_SHORT_FP_SEC231:
	.word 0xc59cda3a  ! 658: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc43ae008  ! 659: STD_I	std	%r2, [%r11 + 0x0008]
CP_NUC232:
	.word 0xc48d009a  ! 661: LDUBA_R	lduba	[%r20, %r26] 0x04, %r2
NC_NUC233:
	.word 0xc585419a  ! 663: LDFA_R	lda	[%r21, %r26], %f2
	.word 0xc59cd13a  ! 665: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc584913a  ! 667: LDFA_R	lda	[%r18, %r26], %f2
CP_BIS_QUAD_LD234:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 669: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
CHANGE_R26235:
	add	%r26,	%r27,	%r26
CP_BIS_SEC235:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 671: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
CP_BIS_NUC236:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 673: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
	.word 0xc5a2901a  ! 674: STFA_R	sta	%f2, [%r26, %r10]
NC_PST_PRI237:
	.word 0xc5bc591a  ! 676: STDFA_R	stda	%f2, [%r26, %r17]
CP_ATM_QUAD_LD238:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 678: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
CP_BIS_AIUP239:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 680: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
NC_BIS_SEC240:
	.word 0xc8a4dd7a  ! 682: STWA_R	stwa	%r4, [%r19 + %r26] 0xeb
	.word 0xc484d03a  ! 684: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
NC_BIS_AIUP241:
	.word 0xd0be445a  ! 686: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CP_AIUS242:
	.word 0xc4b7823a  ! 688: STHA_R	stha	%r2, [%r30 + %r26] 0x11
NC_NUC243:
	.word 0xc4ad409a  ! 690: STBA_R	stba	%r2, [%r21 + %r26] 0x04
CHANGE_USER244:
	ta	T_CHANGE_NONPRIV
CHANGE_R26245:
	add	%r26,	%r27,	%r26
NC_BIS_PRI245:
	.word 0xd0ab9d5a  ! 692: STBA_R	stba	%r8, [%r14 + %r26] 0xea
	.word 0xc4ac903a  ! 694: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC247:
	.word 0xc4d5419a  ! 696: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r2
NC_AIUP248:
	.word 0xc59e421a  ! 698: LDDFA_R	ldda	[%r25, %r26], %f2
CP_PST_PRI249:
	.word 0xc5ba991a  ! 700: STDFA_R	stda	%f2, [%r26, %r10]
CP_AIUS250:
	.word 0xc4cf833a  ! 702: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r2
	.word 0xc492d15a  ! 703: LDUHA_R	lduha	[%r11, %r26] 0x8a, %r2
	.word 0xc45a801a  ! 704: LDX_R	ldx	[%r10 + %r26], %r2
	.word 0xc4f4d03a  ! 706: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
NC_AIUP251:
	.word 0xc4a6431a  ! 708: STWA_R	stwa	%r2, [%r25 + %r26] 0x18
CHANGE_USER252:
	ta	T_CHANGE_NONPRIV
CHANGE_R26253:
	add	%r26,	%r27,	%r26
NC_BIS_PRI253:
	.word 0xc4f39c5a  ! 710: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
NC_PST_PRI254:
	.word 0xc5bbd95a  ! 712: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc4fad01a  ! 713: SWAPA_R	swapa	%r2, [%r11 + %r26] 0x80
	.word 0xc502801a  ! 714: LDF_R	ld	[%r10, %r26], %f2
CHANGE_PRIV255:
	ta	T_CHANGE_PRIV
CHANGE_R26256:
	mov	%g0,	%r26
CP_BIS_AIUP256:
	and	%r26,	%r28,	%r26
	.word 0xc8be055a  ! 716: STDA_R	stda	%r4, [%r24 + %r26] 0x2a
	.word 0xc47b401a  ! 717: SWAP_R	swap	%r2, [%r13 + %r26]
NC_SHORT_FP_SEC257:
	.word 0xc59cdb7a  ! 719: LDDFA_R	ldda	[%r19, %r26], %f2
NC_SHORT_FP_SEC258:
	.word 0xc59cda3a  ! 721: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc47ae008  ! 722: SWAP_I	swap	%r2, [%r11 + 0x0008]
CP_BIS_AIUP259:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 724: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc4c4111a  ! 726: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r2
	.word 0xc48c913a  ! 728: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xc49c913a  ! 730: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
CHANGE_USER260:
	ta	T_CHANGE_NONPRIV
CHANGE_R26261:
	add	%r26,	%r27,	%r26
CP_BIS_PRI261:
	and	%r26,	%r28,	%r26
	.word 0xc8ab5c5a  ! 732: STBA_R	stba	%r4, [%r13 + %r26] 0xe2
CHANGE_PRIV262:
	ta	T_CHANGE_PRIV
CHANGE_R26263:
	add	%r26,	%r27,	%r26
CP_BIS_NUC263:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 734: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
CP_AIUS264:
	.word 0xc48f823a  ! 736: LDUBA_R	lduba	[%r30, %r26] 0x11, %r2
CP_BIS_QUAD_LD265:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 738: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc4c4903a  ! 740: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
NC_PST_PRI266:
	.word 0xc5bc181a  ! 742: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc4dcd03a  ! 744: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
CHANGE_R26267:
	add	%r26,	%r27,	%r26
CP_BIS_SEC267:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 746: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xc4b4501a  ! 748: STHA_R	stha	%r2, [%r17 + %r26] 0x80
	.word 0xc46a801a  ! 749: LDSTUB_R	ldstub	%r2, [%r10 + %r26]
BLK_PRI268:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 751: STDFA_R	stda	%f0, [%r26, %r13]
NC_NUC269:
	.word 0xc4c5409a  ! 753: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r2
CP_ATM_QUAD_LD270:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 755: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xc4d4913a  ! 757: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
	.word 0xc4f4d03a  ! 759: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc5a2901a  ! 760: STFA_R	sta	%f2, [%r26, %r10]
NC_BIS_SEC271:
	.word 0xc4bcdc7a  ! 762: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_BIS_AIUS272:
	and	%r26,	%r28,	%r26
	.word 0xc8a7847a  ! 764: STWA_R	stwa	%r4, [%r30 + %r26] 0x23
	.word 0xc483501a  ! 765: LDUWA_R	lduwa	[%r13, %r26] 0x80, %r2
	.word 0xc422a008  ! 766: STW_I	stw	%r2, [%r10 + 0x0008]
	.word 0xc583111a  ! 767: LDFA_R	lda	[%r12, %r26], %f2
	.word 0xc453200a  ! 768: LDSH_I	ldsh	[%r12 + 0x000a], %r2
	.word 0xc4b4913a  ! 770: STHA_R	stha	%r2, [%r18 + %r26] 0x89
NC_BIS_AIUP273:
	.word 0xc4be445a  ! 772: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xc583911a  ! 774: LDFA_R	lda	[%r14, %r26], %f2
NC_BIS_AIUP274:
	.word 0xccf6455a  ! 776: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
	.word 0xc584d13a  ! 778: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc59b101a  ! 779: LDDFA_R	ldda	[%r12, %r26], %f2
CHANGE_USER275:
	ta	T_CHANGE_NONPRIV
CHANGE_R26276:
	add	%r26,	%r27,	%r26
CP_BIS_PRI276:
	and	%r26,	%r28,	%r26
	.word 0xc4a29d5a  ! 781: STWA_R	stwa	%r2, [%r10 + %r26] 0xea
	.word 0xc502c01a  ! 782: LDF_R	ld	[%r11, %r26], %f2
CHANGE_PRIV277:
	ta	T_CHANGE_PRIV
CHANGE_R26278:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD278:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 784: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
NC_AIUP279:
	.word 0xc4be421a  ! 786: STDA_R	stda	%r2, [%r25 + %r26] 0x10
	.word 0xc5bb901a  ! 788: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4cb101a  ! 789: LDSBA_R	ldsba	[%r12, %r26] 0x80, %r2
CP_ATM_QUAD_LD280:
	and	%r26,	%r29,	%r26
	.word 0xd09b049a  ! 791: LDDA_R	ldda	[%r12, %r26] 0x24, %r8
	.word 0xc5ba911a  ! 792: STDFA_R	stda	%f2, [%r26, %r10]
CHANGE_R26281:
	add	%r26,	%r27,	%r26
CP_BIS_SEC281:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 794: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
NC_NUC282:
	.word 0xc48d409a  ! 796: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
CP_BIS_QUAD_LD283:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 798: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
CP_BIS_NUC284:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 800: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
CP_AIUP285:
	.word 0xc4f6021a  ! 802: STXA_R	stxa	%r2, [%r24 + %r26] 0x10
CHANGE_R26286:
	add	%r26,	%r27,	%r26
CP_BIS_SEC286:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 804: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
NC_BLK_SEc287:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 806: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc49cd13a  ! 808: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
NC_BLK_SEc288:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 810: STDFA_R	stda	%f0, [%r26, %r19]
NC_AIUS289:
	.word 0xc4cfc33a  ! 812: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r2
CP_ATM_QUAD_LD290:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 814: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
	.word 0xc583d11a  ! 816: LDFA_R	lda	[%r15, %r26], %f2
	.word 0xc5ba901a  ! 817: STDFA_R	stda	%f2, [%r26, %r10]
CP_BIS_AIUP291:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 819: STHA_R	stha	%r2, [%r24 + %r26] 0x22
NC_AIUP292:
	.word 0xc4b6431a  ! 821: STHA_R	stha	%r2, [%r25 + %r26] 0x18
	.word 0xc522a008  ! 822: STF_I	st	%f2, [0x0008, %r10]
	.word 0xc4fb111a  ! 823: SWAPA_R	swapa	%r2, [%r12 + %r26] 0x88
NC_SHORT_FP_SEC293:
	.word 0xc59cdb3a  ! 825: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc5bb901a  ! 827: STDFA_R	stda	%f2, [%r26, %r14]
CP_BIS_NUC294:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 829: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
	.word 0xc4ab911a  ! 831: STBA_R	stba	%r2, [%r14 + %r26] 0x88
	.word 0xc59c101a  ! 833: LDDFA_R	ldda	[%r16, %r26], %f2
	.word 0xc483911a  ! 835: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r2
	.word 0xc59b105a  ! 836: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc4d4903a  ! 838: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc584101a  ! 840: LDFA_R	lda	[%r16, %r26], %f2
	.word 0xc5bc913a  ! 842: STDFA_R	stda	%f2, [%r26, %r18]
NC_AIUS295:
	.word 0xc48fc33a  ! 844: LDUBA_R	lduba	[%r31, %r26] 0x19, %r2
CHANGE_USER296:
	ta	T_CHANGE_NONPRIV
CHANGE_R26297:
	mov	%g0,	%r26
NC_BIS_PRI297:
	.word 0xccbc5c5a  ! 846: STDA_R	stda	%r6, [%r17 + %r26] 0xe2
	.word 0xc4a4d03a  ! 848: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc49a901a  ! 849: LDDA_R	ldda	[%r10, %r26] 0x80, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC299:
	.word 0xc4cd409a  ! 851: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r2
	.word 0xc4dcd13a  ! 853: LDXA_R	ldxa	[%r19, %r26] 0x89, %r2
	.word 0xc4d2901a  ! 854: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r2
BLK_PRI300:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 856: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc4dc913a  ! 858: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
	.word 0xc4bcd03a  ! 860: STDA_R	stda	%r2, [%r19 + %r26] 0x81
NC_BIS_AIUS301:
	.word 0xd0afc57a  ! 862: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
CHANGE_R26302:
	add	%r26,	%r27,	%r26
CP_BIS_SEC302:
	and	%r26,	%r28,	%r26
	.word 0xc4f49d7a  ! 864: STXA_R	stxa	%r2, [%r18 + %r26] 0xeb
	.word 0xc45a801a  ! 865: LDX_R	ldx	[%r10 + %r26], %r2
CP_AIUP303:
	.word 0xc4ce031a  ! 867: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r2
CP_PST_PRI304:
	.word 0xc5bb195a  ! 869: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc4dcd03a  ! 871: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc4d4d03a  ! 873: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
CP_PST_PRI305:
	.word 0xc5bb581a  ! 875: STDFA_R	stda	%f2, [%r26, %r13]
SET_TL1_306:
	ta	T_CHANGE_TO_TL1
CHANGE_R26307:
	add	%r26,	%r27,	%r26
NC_BIS_NUC307:
	.word 0xccb544fa  ! 877: STHA_R	stha	%r6, [%r21 + %r26] 0x27
	.word 0xc4b4101a  ! 879: STHA_R	stha	%r2, [%r16 + %r26] 0x80
SET_TL0_308:
	ta	T_CHANGE_TO_TL0
CHANGE_R26309:
	add	%r26,	%r27,	%r26
NC_BIS_SEC309:
	.word 0xc8bcdd7a  ! 881: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
	.word 0xc4cb901a  ! 883: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
	.word 0xc4ac903a  ! 885: STBA_R	stba	%r2, [%r18 + %r26] 0x81
CHANGE_CLE310:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV311:
	ta	T_CHANGE_PRIV
CHANGE_R26312:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP312:
	.word 0xd0be445a  ! 888: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CHANGE_R26313:
	add	%r26,	%r27,	%r26
CP_BIS_SEC313:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 890: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
CP_BIS_AIUP314:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 892: STBA_R	stba	%r4, [%r24 + %r26] 0x22
SET_TL1_315:
	ta	T_CHANGE_TO_TL1
CHANGE_R26316:
	add	%r26,	%r27,	%r26
NC_BIS_NUC316:
	.word 0xc4ad45fa  ! 894: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
CP_BIS_AIUP317:
	and	%r26,	%r28,	%r26
	.word 0xc8be055a  ! 896: STDA_R	stda	%r4, [%r24 + %r26] 0x2a
SET_TL0_318:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI319:
	and	%r26,	%r28,	%r26
	.word 0xccf31c5a  ! 898: STXA_R	stxa	%r6, [%r12 + %r26] 0xe2
	.word 0xc5f3601a  ! 899: CASXA_R	casxa	[%r13]%asi, %r26, %r2
CP_BIS_QUAD_LD320:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 901: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC322:
	.word 0xc585409a  ! 903: LDFA_R	lda	[%r21, %r26], %f2
BLK_PRI323:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 905: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc584903a  ! 907: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc484d13a  ! 909: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
CHANGE_TLE324:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4ead01a  ! 911: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x80
CHANGE_PRIV325:
	ta	T_CHANGE_PRIV
CHANGE_R26326:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP326:
	.word 0xc4ae445a  ! 913: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc47b2008  ! 914: SWAP_I	swap	%r2, [%r12 + 0x0008]
CP_BIS_AIUS327:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 916: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
	.word 0xc4c3901a  ! 918: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
NC_AIUS328:
	.word 0xc4cfc23a  ! 920: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r2
	.word 0xc4ac101a  ! 922: STBA_R	stba	%r2, [%r16 + %r26] 0x80
	.word 0xc4acd03a  ! 924: STBA_R	stba	%r2, [%r19 + %r26] 0x81
SET_TL1_329:
	ta	T_CHANGE_TO_TL1
CHANGE_R26330:
	add	%r26,	%r27,	%r26
NC_BIS_NUC330:
	.word 0xc8ad45fa  ! 926: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
	.word 0xc583911a  ! 928: LDFA_R	lda	[%r14, %r26], %f2
SET_TL0_331:
	ta	T_CHANGE_TO_TL0
CHANGE_R26332:
	add	%r26,	%r27,	%r26
NC_BIS_SEC332:
	.word 0xd0acdc7a  ! 930: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
CHANGE_R26333:
	add	%r26,	%r27,	%r26
CP_BIS_SEC333:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 932: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS335:
	.word 0xc4b7c33a  ! 934: STHA_R	stha	%r2, [%r31 + %r26] 0x19
	.word 0xc4032008  ! 935: LDUW_I	lduw	[%r12 + 0x0008], %r2
	.word 0xc4bc501a  ! 937: STDA_R	stda	%r2, [%r17 + %r26] 0x80
CP_NUC336:
	.word 0xc5f5201a  ! 939: CASXA_R	casxa	[%r20]%asi, %r26, %r2
WR_LEASI_337:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_338:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc494d03a  ! 942: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc49cd13a  ! 944: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
	.word 0xc484101a  ! 946: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r2
	.word 0xc5bcd03a  ! 948: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc584d03a  ! 950: LDFA_R	lda	[%r19, %r26], %f2
NC_BLK_SEc339:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 952: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_R26340:
	add	%r26,	%r27,	%r26
CP_BIS_SEC340:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 954: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
NC_PST_PRI341:
	.word 0xc5bb985a  ! 956: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc49b901a  ! 958: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc46b200b  ! 959: LDSTUB_I	ldstub	%r2, [%r12 + 0x000b]
	.word 0xc5ba901a  ! 960: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc5036008  ! 961: LDF_I	ld	[%r13, 0x0008], %f2
	.word 0xc40aa00b  ! 962: LDUB_I	ldub	[%r10 + 0x000b], %r2
BLK_PRI342:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1e1a  ! 964: STDFA_R	stda	%f16, [%r26, %r12]
	.word 0xc5bc903a  ! 966: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc4236008  ! 967: STW_I	stw	%r2, [%r13 + 0x0008]
	.word 0xc51aa008  ! 968: LDDF_I	ldd	[%r10, 0x0008], %f2
CP_AIUS343:
	.word 0xc587833a  ! 970: LDFA_R	lda	[%r30, %r26], %f2
	.word 0xc5bb501a  ! 971: STDFA_R	stda	%f2, [%r26, %r13]
NC_BIS_AIUS344:
	.word 0xc4afc47a  ! 973: STBA_R	stba	%r2, [%r31 + %r26] 0x23
NC_AIUS345:
	.word 0xc59fc33a  ! 975: LDDFA_R	ldda	[%r31, %r26], %f2
	.word 0xc4b3d01a  ! 977: STHA_R	stha	%r2, [%r15 + %r26] 0x80
CP_NUC346:
	.word 0xc4fd019a  ! 979: SWAPA_R	swapa	%r2, [%r20 + %r26] 0x0c
BLK_PRI347:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 981: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc4f4913a  ! 983: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
CP_BIS_QUAD_LD348:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 985: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc4ccd03a  ! 987: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc503401a  ! 988: LDF_R	ld	[%r13, %r26], %f2
	.word 0xc5a4101a  ! 990: STFA_R	sta	%f2, [%r26, %r16]
CP_BIS_QUAD_LD349:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 992: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
CP_AIUP350:
	.word 0xc4f6021a  ! 994: STXA_R	stxa	%r2, [%r24 + %r26] 0x10
SHORT_FP_PRI351:
	.word 0xc5bb5a5a  ! 996: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc584d13a  ! 998: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4db901a  ! 1000: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
NC_NUC352:
	.word 0xc59d419a  ! 1002: LDDFA_R	ldda	[%r21, %r26], %f2
CHANGE_R26353:
	add	%r26,	%r27,	%r26
CP_BIS_SEC353:
	and	%r26,	%r28,	%r26
	.word 0xc8b49d7a  ! 1004: STHA_R	stha	%r4, [%r18 + %r26] 0xeb
	.word 0xc40aa00b  ! 1005: LDUB_I	ldub	[%r10 + 0x000b], %r2
NC_AIUS354:
	.word 0xc4bfc23a  ! 1007: STDA_R	stda	%r2, [%r31 + %r26] 0x11
NC_AIUP355:
	.word 0xc4ae421a  ! 1009: STBA_R	stba	%r2, [%r25 + %r26] 0x10
	.word 0xc4ead01a  ! 1010: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x80
	.word 0xc4bcd03a  ! 1012: STDA_R	stda	%r2, [%r19 + %r26] 0x81
	.word 0xc46aa00b  ! 1013: LDSTUB_I	ldstub	%r2, [%r10 + 0x000b]
NC_AIUP356:
	.word 0xc4c6431a  ! 1015: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r2
	.word 0xc4dc903a  ! 1017: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc4ab901a  ! 1019: STBA_R	stba	%r2, [%r14 + %r26] 0x80
	.word 0xc402a008  ! 1020: LDUW_I	lduw	[%r10 + 0x0008], %r2
NC_NUC357:
	.word 0xc48d409a  ! 1022: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
	.word 0xc51a801a  ! 1023: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc4cc903a  ! 1025: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc49c501a  ! 1027: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
SHORT_FP_PRI358:
	.word 0xc59a9b1a  ! 1029: LDDFA_R	ldda	[%r10, %r26], %f2
CP_AIUP359:
	.word 0xc49e021a  ! 1031: LDDA_R	ldda	[%r24, %r26] 0x10, %r2
CP_BIS_QUAD_LD360:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9d5a  ! 1033: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
	.word 0xc4ac101a  ! 1035: STBA_R	stba	%r2, [%r16 + %r26] 0x80
NC_PST_PRI361:
	.word 0xc5bb985a  ! 1037: STDFA_R	stda	%f2, [%r26, %r14]
CP_BIS_AIUS362:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 1039: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
	.word 0xc53a801a  ! 1040: STDF_R	std	%f2, [%r26, %r10]
BLK_PRI363:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 1042: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc4f4d03a  ! 1044: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc4d2d01a  ! 1045: LDSHA_R	ldsha	[%r11, %r26] 0x80, %r2
	.word 0xc4ba901a  ! 1046: STDA_R	stda	%r2, [%r10 + %r26] 0x80
CP_NUC364:
	.word 0xc4f5009a  ! 1048: STXA_R	stxa	%r2, [%r20 + %r26] 0x04
CP_BIS_QUAD_LD365:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 1050: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	.word 0xc4ac101a  ! 1052: STBA_R	stba	%r2, [%r16 + %r26] 0x80
CP_AIUP366:
	.word 0xc486031a  ! 1054: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r2
SHORT_FP_PRI367:
	.word 0xc59a9b1a  ! 1056: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc46aa00b  ! 1057: LDSTUB_I	ldstub	%r2, [%r10 + 0x000b]
NC_PST_PRI368:
	.word 0xc5bbd95a  ! 1059: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc453200a  ! 1060: LDSH_I	ldsh	[%r12 + 0x000a], %r2
CP_BIS_NUC369:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 1062: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc4dc101a  ! 1064: LDXA_R	ldxa	[%r16, %r26] 0x80, %r2
	.word 0xc4f4913a  ! 1066: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc4dc913a  ! 1068: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
	.word 0xc4bb501a  ! 1069: STDA_R	stda	%r2, [%r13 + %r26] 0x80
NC_AIUS370:
	.word 0xc4cfc23a  ! 1071: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r2
	.word 0xc4f4d03a  ! 1073: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
CP_AIUP371:
	.word 0xc4d6031a  ! 1075: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r2
	.word 0xc584913a  ! 1077: LDFA_R	lda	[%r18, %r26], %f2
CP_ATM_QUAD_LD372:
	and	%r26,	%r29,	%r26
	.word 0xd09a859a  ! 1079: LDDA_R	ldda	[%r10, %r26] 0x2c, %r8
CP_BIS_NUC373:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 1081: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
CHANGE_R26374:
	mov	%g0,	%r26
CP_BIS_SEC374:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 1083: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
CP_BIS_AIUS375:
	and	%r26,	%r28,	%r26
	.word 0xc4a7857a  ! 1085: STWA_R	stwa	%r2, [%r30 + %r26] 0x2b
NC_PST_PRI376:
	.word 0xc5bc189a  ! 1087: STDFA_R	stda	%f2, [%r26, %r16]
NC_NUC377:
	.word 0xc4cd409a  ! 1089: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r2
CP_BIS_QUAD_LD378:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1091: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc4b2911a  ! 1092: STHA_R	stha	%r2, [%r10 + %r26] 0x88
NC_BIS_AIUP379:
	.word 0xccae445a  ! 1094: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xc4ead11a  ! 1095: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x88
	.word 0xc5bcd03a  ! 1097: STDFA_R	stda	%f2, [%r26, %r19]
CP_BIS_NUC380:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 1099: STHA_R	stha	%r4, [%r20 + %r26] 0x27
	.word 0xc40a801a  ! 1100: LDUB_R	ldub	[%r10 + %r26], %r2
	.word 0xc5f2a01a  ! 1101: CASXA_R	casxa	[%r10]%asi, %r26, %r2
	.word 0xc5a4d03a  ! 1103: STFA_R	sta	%f2, [%r26, %r19]
	.word 0xc584d03a  ! 1105: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc5bc903a  ! 1107: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc4a4903a  ! 1109: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc4dc903a  ! 1111: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc4bc903a  ! 1113: STDA_R	stda	%r2, [%r18 + %r26] 0x81
CHANGE_USER381:
	ta	T_CHANGE_NONPRIV
CHANGE_R26382:
	add	%r26,	%r27,	%r26
CP_BIS_PRI382:
	and	%r26,	%r28,	%r26
	.word 0xd09a9d5a  ! 1115: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS384:
	.word 0xc4c7833a  ! 1117: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r2
	.word 0xc584903a  ! 1119: LDFA_R	lda	[%r18, %r26], %f2
NC_BIS_SEC385:
	.word 0xc4f4dd7a  ! 1121: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
NC_PST_PRI386:
	.word 0xc5bb991a  ! 1123: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_USER387:
	ta	T_CHANGE_NONPRIV
CHANGE_R26388:
	add	%r26,	%r27,	%r26
NC_BIS_PRI388:
	.word 0xc8bc1c5a  ! 1125: STDA_R	stda	%r4, [%r16 + %r26] 0xe2
	.word 0xc59b111a  ! 1126: LDDFA_R	ldda	[%r12, %r26], %f2
CP_BIS_QUAD_LD389:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1128: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CHANGE_PRIV390:
	ta	T_CHANGE_PRIV
CHANGE_R26391:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP391:
	.word 0xc8a6445a  ! 1130: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
	.word 0xc4dcd03a  ! 1132: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc5a3901a  ! 1134: STFA_R	sta	%f2, [%r26, %r14]
	.word 0xc49c913a  ! 1136: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc4f4913a  ! 1138: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc51aa008  ! 1139: LDDF_I	ldd	[%r10, 0x0008], %f2
CHANGE_USER392:
	ta	T_CHANGE_NONPRIV
CHANGE_R26393:
	add	%r26,	%r27,	%r26
CP_BIS_PRI393:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 1141: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV394:
	ta	T_CHANGE_PRIV
CHANGE_R26395:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP395:
	.word 0xc8ae445a  ! 1143: STBA_R	stba	%r4, [%r25 + %r26] 0x22
CP_AIUP396:
	.word 0xc5be021a  ! 1145: STDFA_R	stda	%f2, [%r26, %r24]
	.word 0xc49c913a  ! 1147: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc4a2911a  ! 1148: STWA_R	stwa	%r2, [%r10 + %r26] 0x88
SET_TL1_397:
	ta	T_CHANGE_TO_TL1
CHANGE_R26398:
	add	%r26,	%r27,	%r26
NC_BIS_NUC398:
	.word 0xccad44fa  ! 1150: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xc4cc913a  ! 1152: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
CP_NUC399:
	.word 0xc5f5201a  ! 1154: CASXA_R	casxa	[%r20]%asi, %r26, %r2
	.word 0xc49c913a  ! 1156: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc5f2a01a  ! 1157: CASXA_R	casxa	[%r10]%asi, %r26, %r2
	.word 0xc503401a  ! 1158: LDF_R	ld	[%r13, %r26], %f2
	.word 0xc4abd01a  ! 1160: STBA_R	stba	%r2, [%r15 + %r26] 0x80
	.word 0xc4c4d13a  ! 1162: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
NC_AIUP400:
	.word 0xc49e421a  ! 1164: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
	.word 0xc48bd01a  ! 1166: LDUBA_R	lduba	[%r15, %r26] 0x80, %r2
CP_AIUS401:
	.word 0xc4df823a  ! 1168: LDXA_R	ldxa	[%r30, %r26] 0x11, %r2
	.word 0xc4cb901a  ! 1170: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
CP_BIS_NUC402:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 1172: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
	.word 0xc584913a  ! 1174: LDFA_R	lda	[%r18, %r26], %f2
NC_BIS_AIUP403:
	.word 0xccf6455a  ! 1176: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
CP_BIS_NUC404:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 1178: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
BLK_PRI405:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1180: STDFA_R	stda	%f0, [%r26, %r13]
SET_TL0_406:
	ta	T_CHANGE_TO_TL0
CHANGE_R26407:
	mov	%g0,	%r26
NC_BIS_SEC407:
	.word 0xc4a4dd7a  ! 1182: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
	.word 0xc49c101a  ! 1184: LDDA_R	ldda	[%r16, %r26] 0x80, %r2
	.word 0xc47b401a  ! 1185: SWAP_R	swap	%r2, [%r13 + %r26]
CHANGE_PRIV408:
	ta	T_CHANGE_PRIV
CHANGE_R26409:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP409:
	.word 0xc8ae445a  ! 1187: STBA_R	stba	%r4, [%r25 + %r26] 0x22
SET_TL1_410:
	ta	T_CHANGE_TO_TL1
CHANGE_R26411:
	add	%r26,	%r27,	%r26
NC_BIS_NUC411:
	.word 0xc8b545fa  ! 1189: STHA_R	stha	%r4, [%r21 + %r26] 0x2f
CP_AIUP412:
	.word 0xc5a6021a  ! 1191: STFA_R	sta	%f2, [%r26, %r24]
	.word 0xc4b2911a  ! 1192: STHA_R	stha	%r2, [%r10 + %r26] 0x88
NC_NUC413:
	.word 0xc4d5409a  ! 1194: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r2
NC_BIS_AIUP414:
	.word 0xccf6445a  ! 1196: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xc5a4903a  ! 1198: STFA_R	sta	%f2, [%r26, %r18]
NC_AIUS415:
	.word 0xc48fc23a  ! 1200: LDUBA_R	lduba	[%r31, %r26] 0x11, %r2
SET_TL0_416:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI417:
	and	%r26,	%r28,	%r26
	.word 0xd0ab1c5a  ! 1202: STBA_R	stba	%r8, [%r12 + %r26] 0xe2
CHANGE_R26418:
	add	%r26,	%r27,	%r26
CP_BIS_SEC418:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1204: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CHANGE_R26419:
	add	%r26,	%r27,	%r26
CP_BIS_SEC419:
	and	%r26,	%r28,	%r26
	.word 0xc8a49c7a  ! 1206: STWA_R	stwa	%r4, [%r18 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS421:
	.word 0xc4a7833a  ! 1208: STWA_R	stwa	%r2, [%r30 + %r26] 0x19
	.word 0xc49b901a  ! 1210: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
NC_PST_PRI422:
	.word 0xc5bc591a  ! 1212: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc584d03a  ! 1214: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc522e008  ! 1215: STF_I	st	%f2, [0x0008, %r11]
	.word 0xc582901a  ! 1216: LDFA_R	lda	[%r10, %r26], %f2
NC_SHORT_FP_SEC423:
	.word 0xc59cda3a  ! 1218: LDDFA_R	ldda	[%r19, %r26], %f2
CP_NUC424:
	.word 0xc4dd009a  ! 1220: LDXA_R	ldxa	[%r20, %r26] 0x04, %r2
NC_AIUP425:
	.word 0xc4ae431a  ! 1222: STBA_R	stba	%r2, [%r25 + %r26] 0x18
	.word 0xc4cc913a  ! 1224: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
	.word 0xc584903a  ! 1226: LDFA_R	lda	[%r18, %r26], %f2
SHORT_FP_PRI426:
	.word 0xc59b1b5a  ! 1228: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc5bb101a  ! 1229: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5a2901a  ! 1230: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc4d4903a  ! 1232: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
CP_AIUP427:
	.word 0xc49e021a  ! 1234: LDDA_R	ldda	[%r24, %r26] 0x10, %r2
	.word 0xc4cc501a  ! 1236: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r2
	.word 0xc4f4d03a  ! 1238: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
SHORT_FP_PRI428:
	.word 0xc59b5b5a  ! 1240: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc4ea911a  ! 1241: LDSTUBA_R	ldstuba	%r2, [%r10 + %r26] 0x88
	.word 0xc59c903a  ! 1243: LDDFA_R	ldda	[%r18, %r26], %f2
BLK_PRI429:
	and	%r26,	%r29,	%r26
	.word 0xe19b1f1a  ! 1245: LDDFA_R	ldda	[%r12, %r26], %f16
CP_AIUP430:
	.word 0xc4de021a  ! 1247: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
CP_PST_PRI431:
	.word 0xc5ba981a  ! 1249: STDFA_R	stda	%f2, [%r26, %r10]
CP_PST_PRI432:
	.word 0xc5bb585a  ! 1251: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc59cd03a  ! 1253: LDDFA_R	ldda	[%r19, %r26], %f2
CP_BIS_QUAD_LD433:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 1255: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
SET_TL1_434:
	ta	T_CHANGE_TO_TL1
CHANGE_R26435:
	add	%r26,	%r27,	%r26
NC_BIS_NUC435:
	.word 0xc4b545fa  ! 1257: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
NC_NUC436:
	.word 0xc4cd409a  ! 1259: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r2
	.word 0xc46ac01a  ! 1260: LDSTUB_R	ldstub	%r2, [%r11 + %r26]
NC_BIS_AIUP437:
	.word 0xc4b6455a  ! 1262: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
	.word 0xc5a4903a  ! 1264: STFA_R	sta	%f2, [%r26, %r18]
SET_TL0_438:
	ta	T_CHANGE_TO_TL0
WR_LEASI_439:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_440:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4f4d03a  ! 1267: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc4a4d03a  ! 1269: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP442:
	.word 0xc4f6421a  ! 1271: STXA_R	stxa	%r2, [%r25 + %r26] 0x10
NC_PST_PRI443:
	.word 0xc5bc195a  ! 1273: STDFA_R	stda	%f2, [%r26, %r16]
NC_BIS_AIUP444:
	.word 0xc8f6445a  ! 1275: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xc584d13a  ! 1277: LDFA_R	lda	[%r19, %r26], %f2
NC_BLK_SEc445:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1279: LDDFA_R	ldda	[%r19, %r26], %f16
CHANGE_USER446:
	ta	T_CHANGE_NONPRIV
CHANGE_R26447:
	mov	%g0,	%r26
CP_BIS_PRI447:
	and	%r26,	%r28,	%r26
	.word 0xc4a31c5a  ! 1281: STWA_R	stwa	%r2, [%r12 + %r26] 0xe2
	.word 0xc40b001a  ! 1282: LDUB_R	ldub	[%r12 + %r26], %r2
	.word 0xc48cd03a  ! 1284: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc483511a  ! 1285: LDUWA_R	lduwa	[%r13, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC449:
	.word 0xc49d019a  ! 1287: LDDA_R	ldda	[%r20, %r26] 0x0c, %r2
WR_LEASI_450:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_451:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_QUAD_LD452:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 1290: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
WR_LEASI_453:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_454:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4b2901a  ! 1292: STHA_R	stha	%r2, [%r10 + %r26] 0x80
NC_NUC455:
	.word 0xc495409a  ! 1294: LDUHA_R	lduha	[%r21, %r26] 0x04, %r2
CHANGE_USER456:
	ta	T_CHANGE_NONPRIV
CHANGE_R26457:
	add	%r26,	%r27,	%r26
NC_BIS_PRI457:
	.word 0xc8bc5c5a  ! 1296: STDA_R	stda	%r4, [%r17 + %r26] 0xe2
	.word 0xc5a2911a  ! 1297: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc4d3d01a  ! 1299: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r2
NC_BIS_SEC458:
	.word 0xc4acdc7a  ! 1301: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc5a4d03a  ! 1303: STFA_R	sta	%f2, [%r26, %r19]
CHANGE_PRIV459:
	ta	T_CHANGE_PRIV
CHANGE_R26460:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP460:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 1305: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
	.word 0xc4aad01a  ! 1306: STBA_R	stba	%r2, [%r11 + %r26] 0x80
NC_PST_PRI461:
	.word 0xc5bc185a  ! 1308: STDFA_R	stda	%f2, [%r26, %r16]
NC_PST_PRI462:
	.word 0xc5bbd81a  ! 1310: STDFA_R	stda	%f2, [%r26, %r15]
NC_BIS_AIUP463:
	.word 0xc8b6455a  ! 1312: STHA_R	stha	%r4, [%r25 + %r26] 0x2a
	.word 0xc5032008  ! 1313: LDF_I	ld	[%r12, 0x0008], %f2
NC_AIUP464:
	.word 0xc4de421a  ! 1315: LDXA_R	ldxa	[%r25, %r26] 0x10, %r2
CHANGE_R26465:
	add	%r26,	%r27,	%r26
CP_BIS_SEC465:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 1317: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
	.word 0xc584903a  ! 1319: LDFA_R	lda	[%r18, %r26], %f2
SET_TL1_466:
	ta	T_CHANGE_TO_TL1
CHANGE_R26467:
	add	%r26,	%r27,	%r26
NC_BIS_NUC467:
	.word 0xc4a544fa  ! 1321: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xc453200a  ! 1322: LDSH_I	ldsh	[%r12 + 0x000a], %r2
CP_BIS_AIUS468:
	and	%r26,	%r28,	%r26
	.word 0xc8bf847a  ! 1324: STDA_R	stda	%r4, [%r30 + %r26] 0x23
CP_AIUP469:
	.word 0xc4de021a  ! 1326: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
	.word 0xc4b4903a  ! 1328: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc42ac01a  ! 1329: STB_R	stb	%r2, [%r11 + %r26]
NC_AIUS470:
	.word 0xc4d7c23a  ! 1331: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r2
	.word 0xc49cd13a  ! 1333: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
	.word 0xc49c903a  ! 1335: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc584903a  ! 1337: LDFA_R	lda	[%r18, %r26], %f2
NC_BIS_NUC471:
	.word 0xc4ad44fa  ! 1339: STBA_R	stba	%r2, [%r21 + %r26] 0x27
NC_PST_PRI472:
	.word 0xc5bb991a  ! 1341: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc43aa008  ! 1342: STD_I	std	%r2, [%r10 + 0x0008]
SET_TL0_473:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI474:
	and	%r26,	%r28,	%r26
	.word 0xccf2dd5a  ! 1344: STXA_R	stxa	%r6, [%r11 + %r26] 0xea
	.word 0xc5a3911a  ! 1346: STFA_R	sta	%f2, [%r26, %r14]
CP_BIS_PRI475:
	and	%r26,	%r28,	%r26
	.word 0xd0b35c5a  ! 1348: STHA_R	stha	%r8, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS477:
	.word 0xc4c7c23a  ! 1350: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r2
CHANGE_TLE478:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc522e008  ! 1352: STF_I	st	%f2, [0x0008, %r11]
	.word 0xc484d03a  ! 1354: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc4b4913a  ! 1356: STHA_R	stha	%r2, [%r18 + %r26] 0x89
	.word 0xc4ead11a  ! 1357: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x88
CHANGE_PRIV479:
	ta	T_CHANGE_PRIV
CHANGE_R26480:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS480:
	.word 0xccafc47a  ! 1359: STBA_R	stba	%r6, [%r31 + %r26] 0x23
SHORT_FP_PRI481:
	.word 0xc5bb1b1a  ! 1361: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc4d4d03a  ! 1363: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
BLK_PRI482:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 1365: LDDFA_R	ldda	[%r10, %r26], %f16
CP_BIS_NUC483:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 1367: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
CHANGE_R26484:
	mov	%g0,	%r26
CP_BIS_SEC484:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 1369: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
	.word 0xc5a4d03a  ! 1371: STFA_R	sta	%f2, [%r26, %r19]
NC_NUC485:
	.word 0xc4dd409a  ! 1373: LDXA_R	ldxa	[%r21, %r26] 0x04, %r2
	.word 0xc4ead01a  ! 1374: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x80
	.word 0xc4a2911a  ! 1375: STWA_R	stwa	%r2, [%r10 + %r26] 0x88
	.word 0xc5bc501a  ! 1377: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc5e2a01a  ! 1378: CASA_R	casa	[%r10] %asi, %r26, %r2
NC_BIS_AIUP486:
	.word 0xd0a6445a  ! 1380: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xc5e3601a  ! 1381: CASA_R	casa	[%r13] %asi, %r26, %r2
NC_AIUS487:
	.word 0xc4f7c33a  ! 1383: STXA_R	stxa	%r2, [%r31 + %r26] 0x19
CP_BIS_QUAD_LD488:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 1385: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
WR_LEASI_489:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_490:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4ba911a  ! 1387: STDA_R	stda	%r2, [%r10 + %r26] 0x88
CP_BIS_AIUP491:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 1389: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
CP_AIUS492:
	.word 0xc4cf823a  ! 1391: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r2
CP_BIS_AIUS493:
	and	%r26,	%r28,	%r26
	.word 0xc8a7847a  ! 1393: STWA_R	stwa	%r4, [%r30 + %r26] 0x23
CP_NUC494:
	.word 0xc4f5009a  ! 1395: STXA_R	stxa	%r2, [%r20 + %r26] 0x04
CHANGE_USER495:
	ta	T_CHANGE_NONPRIV
CHANGE_R26496:
	add	%r26,	%r27,	%r26
NC_BIS_PRI496:
	.word 0xc4f3dd5a  ! 1397: STXA_R	stxa	%r2, [%r15 + %r26] 0xea
CHANGE_R26497:
	add	%r26,	%r27,	%r26
CP_BIS_SEC497:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1399: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xc4bbd11a  ! 1401: STDA_R	stda	%r2, [%r15 + %r26] 0x88
CHANGE_PRIV498:
	ta	T_CHANGE_PRIV
CHANGE_R26499:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP499:
	and	%r26,	%r28,	%r26
	.word 0xccae055a  ! 1403: STBA_R	stba	%r6, [%r24 + %r26] 0x2a
CP_NUC500:
	.word 0xc495019a  ! 1405: LDUHA_R	lduha	[%r20, %r26] 0x0c, %r2
	.word 0xc48cd03a  ! 1407: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4da911a  ! 1408: LDXA_R	ldxa	[%r10, %r26] 0x88, %r2
	.word 0xc40a801a  ! 1409: LDUB_R	ldub	[%r10 + %r26], %r2
	.word 0xc453200a  ! 1410: LDSH_I	ldsh	[%r12 + 0x000a], %r2
	.word 0xc44a801a  ! 1411: LDSB_R	ldsb	[%r10 + %r26], %r2
	.word 0xc4d3911a  ! 1413: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r2
CP_BIS_QUAD_LD501:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 1415: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xc47b401a  ! 1416: SWAP_R	swap	%r2, [%r13 + %r26]
	.word 0xc522c01a  ! 1417: STF_R	st	%f2, [%r26, %r11]
BLK_PRI502:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 1419: STDFA_R	stda	%f0, [%r26, %r12]
CP_NUC503:
	.word 0xc4f5019a  ! 1421: STXA_R	stxa	%r2, [%r20 + %r26] 0x0c
BLK_PRI504:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 1423: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc59c903a  ! 1425: LDDFA_R	ldda	[%r18, %r26], %f2
CP_BIS_AIUP505:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 1427: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
CHANGE_TLE506:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4a2901a  ! 1429: STWA_R	stwa	%r2, [%r10 + %r26] 0x80
NC_BIS_PRI507:
	.word 0xd0b3dd5a  ! 1431: STHA_R	stha	%r8, [%r15 + %r26] 0xea
	.word 0xc59b911a  ! 1433: LDDFA_R	ldda	[%r14, %r26], %f2
	.word 0xc4dc511a  ! 1435: LDXA_R	ldxa	[%r17, %r26] 0x88, %r2
	.word 0xc4c4d03a  ! 1437: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
	.word 0xc4c4101a  ! 1439: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r2
CHANGE_PRIV508:
	ta	T_CHANGE_PRIV
CHANGE_R26509:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP509:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 1441: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
SHORT_FP_PRI510:
	.word 0xc5bb1b1a  ! 1443: STDFA_R	stda	%f2, [%r26, %r12]
BLK_PRI511:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1445: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc4acd03a  ! 1447: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4c4913a  ! 1449: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc5a4d13a  ! 1451: STFA_R	sta	%f2, [%r26, %r19]
NC_AIUP512:
	.word 0xc586421a  ! 1453: LDFA_R	lda	[%r25, %r26], %f2
CHANGE_USER513:
	ta	T_CHANGE_NONPRIV
CHANGE_R26514:
	add	%r26,	%r27,	%r26
CP_BIS_PRI514:
	and	%r26,	%r28,	%r26
	.word 0xc4f31c5a  ! 1455: STXA_R	stxa	%r2, [%r12 + %r26] 0xe2
CP_BIS_PRI515:
	and	%r26,	%r28,	%r26
	.word 0xc8f31d5a  ! 1457: STXA_R	stxa	%r4, [%r12 + %r26] 0xea
	.word 0xc4ccd13a  ! 1459: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r2
CHANGE_PRIV516:
	ta	T_CHANGE_PRIV
CHANGE_R26517:
	add	%r26,	%r27,	%r26
CP_BIS_NUC517:
	and	%r26,	%r28,	%r26
	.word 0xc8f504fa  ! 1461: STXA_R	stxa	%r4, [%r20 + %r26] 0x27
	.word 0xc51a801a  ! 1462: LDDF_R	ldd	[%r10, %r26], %f2
NC_SHORT_FP_SEC518:
	.word 0xc59cdb7a  ! 1464: LDDFA_R	ldda	[%r19, %r26], %f2
NC_BLK_SEc519:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1466: STDFA_R	stda	%f16, [%r26, %r19]
CP_PST_PRI520:
	.word 0xc5ba981a  ! 1468: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc48b901a  ! 1470: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
	.word 0xc4d4d03a  ! 1472: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
NC_BLK_SEc521:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1474: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUP522:
	.word 0xc4ae445a  ! 1476: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_BIS_SEC523:
	.word 0xc4b4dc7a  ! 1478: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
SHORT_FP_PRI524:
	.word 0xc59b1a5a  ! 1480: LDDFA_R	ldda	[%r12, %r26], %f2
NC_SHORT_FP_SEC525:
	.word 0xc59cda3a  ! 1482: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4f4903a  ! 1484: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc53b001a  ! 1485: STDF_R	std	%f2, [%r26, %r12]
CP_AIUS526:
	.word 0xc59f823a  ! 1487: LDDFA_R	ldda	[%r30, %r26], %f2
	.word 0xc4d4d03a  ! 1489: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc5bbd01a  ! 1491: STDFA_R	stda	%f2, [%r26, %r15]
CP_NUC527:
	.word 0xc485009a  ! 1493: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r2
NC_AIUP528:
	.word 0xc4de421a  ! 1495: LDXA_R	ldxa	[%r25, %r26] 0x10, %r2
CP_ATM_QUAD_LD529:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 1497: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
	.word 0xc4acd13a  ! 1499: STBA_R	stba	%r2, [%r19 + %r26] 0x89
	.word 0xc4ccd03a  ! 1501: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc44b200b  ! 1502: LDSB_I	ldsb	[%r12 + 0x000b], %r2
	.word 0xc48c903a  ! 1504: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CP_BIS_AIUP530:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 1506: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
	.word 0xc4fa901a  ! 1507: SWAPA_R	swapa	%r2, [%r10 + %r26] 0x80
NC_PST_PRI531:
	.word 0xc5bc191a  ! 1509: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc483511a  ! 1510: LDUWA_R	lduwa	[%r13, %r26] 0x88, %r2
	.word 0xc522a008  ! 1511: STF_I	st	%f2, [0x0008, %r10]
NC_PST_PRI532:
	.word 0xc5bc181a  ! 1513: STDFA_R	stda	%f2, [%r26, %r16]
NC_BLK_SEc533:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1515: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC534:
	.word 0xc4cd019a  ! 1517: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r2
	.word 0xc4ccd03a  ! 1519: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
NC_BLK_SEc535:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1521: STDFA_R	stda	%f16, [%r26, %r19]
CP_BIS_AIUS536:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 1523: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
CP_AIUS537:
	.word 0xc48f833a  ! 1525: LDUBA_R	lduba	[%r30, %r26] 0x19, %r2
	.word 0xc5a3101a  ! 1526: STFA_R	sta	%f2, [%r26, %r12]
	.word 0xc4dcd13a  ! 1528: LDXA_R	ldxa	[%r19, %r26] 0x89, %r2
CP_ATM_QUAD_LD538:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1530: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc522801a  ! 1531: STF_R	st	%f2, [%r26, %r10]
	.word 0xc484d03a  ! 1533: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
CP_AIUS539:
	.word 0xc49f823a  ! 1535: LDDA_R	ldda	[%r30, %r26] 0x11, %r2
NC_BIS_AIUP540:
	.word 0xc4ae445a  ! 1537: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc53ac01a  ! 1538: STDF_R	std	%f2, [%r26, %r11]
	.word 0xc5e2e01a  ! 1539: CASA_R	casa	[%r11] %asi, %r26, %r2
	.word 0xc412a00a  ! 1540: LDUH_I	lduh	[%r10 + 0x000a], %r2
NC_BLK_SEc541:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1542: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc48c913a  ! 1544: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
NC_AIUS542:
	.word 0xc4d7c23a  ! 1546: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r2
CP_AIUS543:
	.word 0xc487833a  ! 1548: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r2
CHANGE_CLE544:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc5a4903a  ! 1551: STFA_R	sta	%f2, [%r26, %r18]
CHANGE_PRIV545:
	ta	T_CHANGE_PRIV
CHANGE_R26546:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD546:
	and	%r26,	%r29,	%r26
	.word 0xc89ac59a  ! 1553: LDDA_R	ldda	[%r11, %r26] 0x2c, %r4
	.word 0xc42b001a  ! 1554: STB_R	stb	%r2, [%r12 + %r26]
CP_AIUP547:
	.word 0xc4f6031a  ! 1556: STXA_R	stxa	%r2, [%r24 + %r26] 0x18
	.word 0xc53a801a  ! 1557: STDF_R	std	%f2, [%r26, %r10]
	.word 0xc522e008  ! 1558: STF_I	st	%f2, [0x0008, %r11]
CP_BIS_AIUP548:
	and	%r26,	%r28,	%r26
	.word 0xd0b6055a  ! 1560: STHA_R	stha	%r8, [%r24 + %r26] 0x2a
SET_TL1_549:
	ta	T_CHANGE_TO_TL1
CHANGE_R26550:
	mov	%g0,	%r26
NC_BIS_NUC550:
	.word 0xccf544fa  ! 1562: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
BLK_PRI551:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1564: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc1eaa00e  ! 1566: PREFETCHA_I	prefetcha	[%r10, + 0x000e] %asi, #n_reads
NC_SHORT_FP_SEC552:
	.word 0xc5bcdb7a  ! 1568: STDFA_R	stda	%f2, [%r26, %r19]
CP_BIS_NUC553:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 1570: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
	.word 0xc4f3111a  ! 1571: STXA_R	stxa	%r2, [%r12 + %r26] 0x88
NC_BLK_SEc554:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1573: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc4d4d13a  ! 1575: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	.word 0xc4ab501a  ! 1576: STBA_R	stba	%r2, [%r13 + %r26] 0x80
NC_BIS_AIUP555:
	.word 0xd0ae445a  ! 1578: STBA_R	stba	%r8, [%r25 + %r26] 0x22
NC_AIUP556:
	.word 0xc4d6431a  ! 1580: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r2
SET_TL0_557:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI558:
	and	%r26,	%r28,	%r26
	.word 0xcc9b1c5a  ! 1582: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
CHANGE_PRIV559:
	ta	T_CHANGE_PRIV
CHANGE_R26560:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS560:
	and	%r26,	%r28,	%r26
	.word 0xccf7847a  ! 1584: STXA_R	stxa	%r6, [%r30 + %r26] 0x23
	.word 0xc4acd03a  ! 1586: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4a3d11a  ! 1588: STWA_R	stwa	%r2, [%r15 + %r26] 0x88
	.word 0xc5ba911a  ! 1589: STDFA_R	stda	%f2, [%r26, %r10]
CP_AIUS561:
	.word 0xc4c7823a  ! 1591: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r2
CP_AIUS562:
	.word 0xc4c7823a  ! 1593: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r2
	.word 0xc4dcd03a  ! 1595: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc4d4d13a  ! 1597: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	.word 0xc48c913a  ! 1599: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xc48b911a  ! 1601: LDUBA_R	lduba	[%r14, %r26] 0x88, %r2
	.word 0xc59a905a  ! 1602: LDDFA_R	ldda	[%r10, %r26], %f2
CHANGE_USER563:
	ta	T_CHANGE_NONPRIV
CHANGE_R26564:
	add	%r26,	%r27,	%r26
CP_BIS_PRI564:
	and	%r26,	%r28,	%r26
	.word 0xc8a29d5a  ! 1604: STWA_R	stwa	%r4, [%r10 + %r26] 0xea
	.word 0xc48cd03a  ! 1606: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS566:
	.word 0xc49f833a  ! 1608: LDDA_R	ldda	[%r30, %r26] 0x19, %r2
	.word 0xc584d03a  ! 1610: LDFA_R	lda	[%r19, %r26], %f2
NC_BLK_SEc567:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1612: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc5bc903a  ! 1614: STDFA_R	stda	%f2, [%r26, %r18]
NC_BIS_AIUP568:
	.word 0xc4be445a  ! 1616: STDA_R	stda	%r2, [%r25 + %r26] 0x22
CP_BIS_AIUP569:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1618: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xc422a008  ! 1619: STW_I	stw	%r2, [%r10 + 0x0008]
	.word 0xc4b3901a  ! 1621: STHA_R	stha	%r2, [%r14 + %r26] 0x80
	.word 0xc5a2911a  ! 1622: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc4ead11a  ! 1623: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x88
	.word 0xc53ae008  ! 1624: STDF_I	std	%f2, [0x0008, %r11]
CP_PST_PRI570:
	.word 0xc5bb599a  ! 1626: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc43b001a  ! 1627: STD_R	std	%r2, [%r12 + %r26]
	.word 0xc4ab901a  ! 1629: STBA_R	stba	%r2, [%r14 + %r26] 0x80
	.word 0xc4d4903a  ! 1631: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc5ba901a  ! 1632: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4c3901a  ! 1634: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
NC_BIS_AIUS571:
	.word 0xd0bfc57a  ! 1636: STDA_R	stda	%r8, [%r31 + %r26] 0x2b
	.word 0xc484d03a  ! 1638: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
NC_SHORT_FP_SEC572:
	.word 0xc5bcdb3a  ! 1640: STDFA_R	stda	%f2, [%r26, %r19]
CP_NUC573:
	.word 0xc4dd009a  ! 1642: LDXA_R	ldxa	[%r20, %r26] 0x04, %r2
	.word 0xc4a4d03a  ! 1644: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc4ccd13a  ! 1646: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r2
BLK_PRI574:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 1648: LDDFA_R	ldda	[%r11, %r26], %f0
CP_AIUP575:
	.word 0xc48e031a  ! 1650: LDUBA_R	lduba	[%r24, %r26] 0x18, %r2
CP_PST_PRI576:
	.word 0xc5bb195a  ! 1652: STDFA_R	stda	%f2, [%r26, %r12]
CP_AIUP577:
	.word 0xc4ce021a  ! 1654: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r2
	.word 0xc47b401a  ! 1655: SWAP_R	swap	%r2, [%r13 + %r26]
	.word 0xc502e008  ! 1656: LDF_I	ld	[%r11, 0x0008], %f2
CP_BIS_AIUP578:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1658: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xc4fb111a  ! 1659: SWAPA_R	swapa	%r2, [%r12 + %r26] 0x88
CP_PST_PRI579:
	.word 0xc5bad85a  ! 1661: STDFA_R	stda	%f2, [%r26, %r11]
CP_BIS_AIUS580:
	and	%r26,	%r28,	%r26
	.word 0xd0a7847a  ! 1663: STWA_R	stwa	%r8, [%r30 + %r26] 0x23
CP_BIS_QUAD_LD581:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 1665: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
CP_BIS_QUAD_LD582:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1667: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
BLK_PRI583:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 1669: STDFA_R	stda	%f16, [%r26, %r11]
CHANGE_CLE584:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BIS_PRI585:
	.word 0xc4bb9c5a  ! 1672: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
	.word 0xc49c511a  ! 1674: LDDA_R	ldda	[%r17, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC587:
	.word 0xc5a5009a  ! 1676: STFA_R	sta	%f2, [%r26, %r20]
	.word 0xc452c01a  ! 1677: LDSH_R	ldsh	[%r11 + %r26], %r2
NC_SHORT_FP_SEC588:
	.word 0xc5bcda7a  ! 1679: STDFA_R	stda	%f2, [%r26, %r19]
NC_NUC589:
	.word 0xc585409a  ! 1681: LDFA_R	lda	[%r21, %r26], %f2
SHORT_FP_PRI590:
	.word 0xc5bb1a5a  ! 1683: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5a4d13a  ! 1685: STFA_R	sta	%f2, [%r26, %r19]
	.word 0xc4ac913a  ! 1687: STBA_R	stba	%r2, [%r18 + %r26] 0x89
NC_NUC591:
	.word 0xc4ad409a  ! 1689: STBA_R	stba	%r2, [%r21 + %r26] 0x04
	.word 0xc49a901a  ! 1690: LDDA_R	ldda	[%r10, %r26] 0x80, %r2
CP_ATM_QUAD_LD592:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1692: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
CP_AIUP593:
	.word 0xc496021a  ! 1694: LDUHA_R	lduha	[%r24, %r26] 0x10, %r2
	.word 0xc59ad11a  ! 1695: LDDFA_R	ldda	[%r11, %r26], %f2
WR_LEASI_594:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_595:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc53a801a  ! 1697: STDF_R	std	%f2, [%r26, %r10]
NC_AIUP596:
	.word 0xc49e421a  ! 1699: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
	.word 0xc59a901a  ! 1700: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc49ad11a  ! 1701: LDDA_R	ldda	[%r11, %r26] 0x88, %r2
	.word 0xc4da901a  ! 1702: LDXA_R	ldxa	[%r10, %r26] 0x80, %r2
	.word 0xc4ac903a  ! 1704: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc48c903a  ! 1706: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4da901a  ! 1707: LDXA_R	ldxa	[%r10, %r26] 0x80, %r2
CP_NUC597:
	.word 0xc4cd009a  ! 1709: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r2
CP_NUC598:
	.word 0xc4d5009a  ! 1711: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r2
CP_BIS_QUAD_LD599:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 1713: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
	.word 0xc4b3d01a  ! 1715: STHA_R	stha	%r2, [%r15 + %r26] 0x80
	.word 0xc4a4903a  ! 1717: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
CHANGE_R26600:
	add	%r26,	%r27,	%r26
CP_BIS_SEC600:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 1719: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	.word 0xc584511a  ! 1721: LDFA_R	lda	[%r17, %r26], %f2
	.word 0xc4bb111a  ! 1722: STDA_R	stda	%r2, [%r12 + %r26] 0x88
	.word 0xc4b4d03a  ! 1724: STHA_R	stha	%r2, [%r19 + %r26] 0x81
CP_AIUS601:
	.word 0xc587833a  ! 1726: LDFA_R	lda	[%r30, %r26], %f2
	.word 0xc43aa008  ! 1727: STD_I	std	%r2, [%r10 + 0x0008]
CP_BIS_QUAD_LD602:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 1729: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
CP_BIS_QUAD_LD603:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 1731: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
CP_BIS_AIUS604:
	and	%r26,	%r28,	%r26
	.word 0xccb7847a  ! 1733: STHA_R	stha	%r6, [%r30 + %r26] 0x23
CHANGE_TLE605:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc5ba901a  ! 1735: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc43aa008  ! 1736: STD_I	std	%r2, [%r10 + 0x0008]
SET_TL1_606:
	ta	T_CHANGE_TO_TL1
CHANGE_R26607:
	add	%r26,	%r27,	%r26
NC_BIS_NUC607:
	.word 0xd0ad44fa  ! 1738: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xc4a4111a  ! 1740: STWA_R	stwa	%r2, [%r16 + %r26] 0x88
	.word 0xc4ccd03a  ! 1743: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
NC_PST_PRI608:
	.word 0xc5bb995a  ! 1745: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4cb901a  ! 1747: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
CP_AIUP609:
	.word 0xc4ae021a  ! 1749: STBA_R	stba	%r2, [%r24 + %r26] 0x10
NC_SHORT_FP_SEC610:
	.word 0xc59cda7a  ! 1751: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4c4d03a  ! 1753: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
	.word 0xc47ac01a  ! 1754: SWAP_R	swap	%r2, [%r11 + %r26]
CP_PST_PRI611:
	.word 0xc5bb589a  ! 1756: STDFA_R	stda	%f2, [%r26, %r13]
SET_TL0_612:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI613:
	and	%r26,	%r28,	%r26
	.word 0xd0b35c5a  ! 1758: STHA_R	stha	%r8, [%r13 + %r26] 0xe2
CP_PST_PRI614:
	.word 0xc5ba981a  ! 1760: STDFA_R	stda	%f2, [%r26, %r10]
CHANGE_PRIV615:
	ta	T_CHANGE_PRIV
CHANGE_R26616:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD616:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1762: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CHANGE_TLE617:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4ac501a  ! 1765: STBA_R	stba	%r2, [%r17 + %r26] 0x80
CP_BIS_QUAD_LD618:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 1767: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP620:
	.word 0xc4b6021a  ! 1769: STHA_R	stha	%r2, [%r24 + %r26] 0x10
NC_BIS_SEC621:
	.word 0xd0b4dc7a  ! 1771: STHA_R	stha	%r8, [%r19 + %r26] 0xe3
CHANGE_USER622:
	ta	T_CHANGE_NONPRIV
CHANGE_R26623:
	add	%r26,	%r27,	%r26
CP_BIS_PRI623:
	and	%r26,	%r28,	%r26
	.word 0xc4b29d5a  ! 1773: STHA_R	stha	%r2, [%r10 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC625:
	.word 0xc4bd409a  ! 1775: STDA_R	stda	%r2, [%r21 + %r26] 0x04
	.word 0xc5232008  ! 1776: STF_I	st	%f2, [0x0008, %r12]
	.word 0xc522e008  ! 1777: STF_I	st	%f2, [0x0008, %r11]
NC_NUC626:
	.word 0xc495409a  ! 1779: LDUHA_R	lduha	[%r21, %r26] 0x04, %r2
	.word 0xc494903a  ! 1781: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
NC_AIUS627:
	.word 0xc4d7c33a  ! 1783: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r2
CP_BIS_NUC628:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 1785: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
	.word 0xc5bcd03a  ! 1787: STDFA_R	stda	%f2, [%r26, %r19]
NC_BIS_AIUP629:
	.word 0xc8f6455a  ! 1789: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
	.word 0xc48c501a  ! 1791: LDUBA_R	lduba	[%r17, %r26] 0x80, %r2
	.word 0xc4d4903a  ! 1793: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc4cb901a  ! 1795: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
NC_BIS_AIUP630:
	.word 0xccb6455a  ! 1797: STHA_R	stha	%r6, [%r25 + %r26] 0x2a
NC_BIS_AIUS631:
	.word 0xc8f7c57a  ! 1799: STXA_R	stxa	%r4, [%r31 + %r26] 0x2b
	.word 0xc4ac903a  ! 1801: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc4ac101a  ! 1803: STBA_R	stba	%r2, [%r16 + %r26] 0x80
	.word 0xc59cd13a  ! 1805: LDDFA_R	ldda	[%r19, %r26], %f2
CP_AIUS632:
	.word 0xc4d7823a  ! 1807: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r2
	.word 0xc4d4d13a  ! 1809: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
NC_NUC633:
	.word 0xc4f5409a  ! 1811: STXA_R	stxa	%r2, [%r21 + %r26] 0x04
CP_ATM_QUAD_LD634:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 1813: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xc5bc903a  ! 1815: STDFA_R	stda	%f2, [%r26, %r18]
BLK_PRI635:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1817: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_USER636:
	ta	T_CHANGE_NONPRIV
CHANGE_R26637:
	add	%r26,	%r27,	%r26
CP_BIS_PRI637:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 1819: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc42a801a  ! 1820: STB_R	stb	%r2, [%r10 + %r26]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP639:
	.word 0xc4d6421a  ! 1822: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r2
NC_SHORT_FP_SEC640:
	.word 0xc5bcdb7a  ! 1824: STDFA_R	stda	%f2, [%r26, %r19]
CP_AIUP641:
	.word 0xc4b6031a  ! 1826: STHA_R	stha	%r2, [%r24 + %r26] 0x18
NC_BIS_AIUS642:
	.word 0xd0a7c47a  ! 1828: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
CP_PST_PRI643:
	.word 0xc5ba981a  ! 1830: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4b2901a  ! 1831: STHA_R	stha	%r2, [%r10 + %r26] 0x80
	.word 0xc494913a  ! 1833: LDUHA_R	lduha	[%r18, %r26] 0x89, %r2
	.word 0xc4c4d03a  ! 1835: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
NC_AIUS644:
	.word 0xc4f7c23a  ! 1837: STXA_R	stxa	%r2, [%r31 + %r26] 0x11
	.word 0xc48cd03a  ! 1839: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc522a008  ! 1840: STF_I	st	%f2, [0x0008, %r10]
BLK_PRI645:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 1842: LDDFA_R	ldda	[%r11, %r26], %f16
CHANGE_USER646:
	ta	T_CHANGE_NONPRIV
CHANGE_R26647:
	add	%r26,	%r27,	%r26
NC_BIS_PRI647:
	.word 0xc4f3dc5a  ! 1844: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC649:
	.word 0xc59d019a  ! 1846: LDDFA_R	ldda	[%r20, %r26], %f2
	.word 0xc59c913a  ! 1848: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc4abd01a  ! 1850: STBA_R	stba	%r2, [%r15 + %r26] 0x80
	.word 0xc43aa008  ! 1851: STD_I	std	%r2, [%r10 + 0x0008]
CHANGE_USER650:
	ta	T_CHANGE_NONPRIV
CHANGE_R26651:
	add	%r26,	%r27,	%r26
CP_BIS_PRI651:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 1853: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CHANGE_PRIV652:
	ta	T_CHANGE_PRIV
CHANGE_R26653:
	mov	%g0,	%r26
CP_ATM_QUAD_LD653:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 1855: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
	.word 0xc584913a  ! 1857: LDFA_R	lda	[%r18, %r26], %f2
NC_BLK_SEc654:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1859: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc59cd13a  ! 1861: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4d4913a  ! 1863: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
WR_LEASI_655:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_656:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4d2905a  ! 1865: LDSHA_R	ldsha	[%r10, %r26] 0x82, %r2
BLK_PRI657:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 1867: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc582911a  ! 1868: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc4a4903a  ! 1870: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_AIUP658:
	.word 0xc4be421a  ! 1872: STDA_R	stda	%r2, [%r25 + %r26] 0x10
	.word 0xc40a801a  ! 1873: LDUB_R	ldub	[%r10 + %r26], %r2
CHANGE_USER659:
	ta	T_CHANGE_NONPRIV
CHANGE_R26660:
	add	%r26,	%r27,	%r26
CP_BIS_PRI660:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 1875: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc4db105a  ! 1876: LDXA_R	ldxa	[%r12, %r26] 0x82, %r2
	.word 0xc484111a  ! 1878: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r2
NC_PST_PRI661:
	.word 0xc5bbd89a  ! 1880: STDFA_R	stda	%f2, [%r26, %r15]
CHANGE_CLE662:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc49b111a  ! 1882: LDDA_R	ldda	[%r12, %r26] 0x88, %r2
	.word 0xc5bb901a  ! 1884: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4ac913a  ! 1886: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc48a915a  ! 1887: LDUBA_R	lduba	[%r10, %r26] 0x8a, %r2
BLK_PRI663:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 1889: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xc4acd13a  ! 1891: STBA_R	stba	%r2, [%r19 + %r26] 0x89
CP_BIS_PRI664:
	and	%r26,	%r28,	%r26
	.word 0xd0aa9c5a  ! 1893: STBA_R	stba	%r8, [%r10 + %r26] 0xe2
	.word 0xc4f3101a  ! 1894: STXA_R	stxa	%r2, [%r12 + %r26] 0x80
BLK_PRI665:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1896: STDFA_R	stda	%f0, [%r26, %r13]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS667:
	.word 0xc4f7833a  ! 1898: STXA_R	stxa	%r2, [%r30 + %r26] 0x19
CP_AIUS668:
	.word 0xc4d7823a  ! 1900: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r2
	.word 0xc4f4903a  ! 1902: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc59cd13a  ! 1904: LDDFA_R	ldda	[%r19, %r26], %f2
CP_NUC669:
	.word 0xc4c5009a  ! 1906: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r2
	.word 0xc4cc903a  ! 1908: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CHANGE_USER670:
	ta	T_CHANGE_NONPRIV
CHANGE_R26671:
	add	%r26,	%r27,	%r26
NC_BIS_PRI671:
	.word 0xc8a39c5a  ! 1910: STWA_R	stwa	%r4, [%r14 + %r26] 0xe2
BLK_PRI672:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 1912: LDDFA_R	ldda	[%r12, %r26], %f0
CHANGE_PRIV673:
	ta	T_CHANGE_PRIV
CHANGE_R26674:
	add	%r26,	%r27,	%r26
CP_BIS_NUC674:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 1914: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
CP_AIUP675:
	.word 0xc4d6021a  ! 1916: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r2
NC_NUC676:
	.word 0xc4dd409a  ! 1918: LDXA_R	ldxa	[%r21, %r26] 0x04, %r2
CP_BIS_AIUS677:
	and	%r26,	%r28,	%r26
	.word 0xc89f847a  ! 1920: LDDA_R	ldda	[%r30, %r26] 0x23, %r4
	.word 0xc5a3911a  ! 1922: STFA_R	sta	%f2, [%r26, %r14]
	.word 0xc40ac01a  ! 1923: LDUB_R	ldub	[%r11 + %r26], %r2
	.word 0xc583101a  ! 1924: LDFA_R	lda	[%r12, %r26], %f2
NC_BIS_SEC678:
	.word 0xc8a4dc7a  ! 1926: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
CP_NUC679:
	.word 0xc5a5009a  ! 1928: STFA_R	sta	%f2, [%r26, %r20]
CHANGE_USER680:
	ta	T_CHANGE_NONPRIV
CHANGE_R26681:
	add	%r26,	%r27,	%r26
CP_BIS_PRI681:
	and	%r26,	%r28,	%r26
	.word 0xccba9c5a  ! 1930: STDA_R	stda	%r6, [%r10 + %r26] 0xe2
	.word 0xc5a4913a  ! 1932: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4bb111a  ! 1933: STDA_R	stda	%r2, [%r12 + %r26] 0x88
CHANGE_R26682:
	add	%r26,	%r27,	%r26
CP_BIS_SEC682:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 1935: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
CHANGE_PRIV683:
	ta	T_CHANGE_PRIV
CHANGE_R26684:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS684:
	.word 0xc4f7c47a  ! 1937: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xc51ac01a  ! 1938: LDDF_R	ldd	[%r11, %r26], %f2
	.word 0xc4f3911a  ! 1940: STXA_R	stxa	%r2, [%r14 + %r26] 0x88
	.word 0xc5f2a01a  ! 1941: CASXA_R	casxa	[%r10]%asi, %r26, %r2
	.word 0xc4c4903a  ! 1943: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
BLK_PRI685:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 1945: STDFA_R	stda	%f0, [%r26, %r12]
NC_NUC686:
	.word 0xc4f5419a  ! 1947: STXA_R	stxa	%r2, [%r21 + %r26] 0x0c
CHANGE_USER687:
	ta	T_CHANGE_NONPRIV
CHANGE_R26688:
	mov	%g0,	%r26
NC_BIS_PRI688:
	.word 0xc4f3dc5a  ! 1949: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
	.word 0xc582d15a  ! 1950: LDFA_R	lda	[%r11, %r26], %f2
CHANGE_PRIV689:
	ta	T_CHANGE_PRIV
CHANGE_R26690:
	add	%r26,	%r27,	%r26
CP_BIS_NUC690:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 1952: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
NC_NUC691:
	.word 0xc495419a  ! 1954: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r2
	.word 0xc4b3d01a  ! 1956: STHA_R	stha	%r2, [%r15 + %r26] 0x80
NC_PST_PRI692:
	.word 0xc5bb985a  ! 1958: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4dc903a  ! 1960: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc51ae008  ! 1961: LDDF_I	ldd	[%r11, 0x0008], %f2
CHANGE_USER693:
	ta	T_CHANGE_NONPRIV
CHANGE_R26694:
	add	%r26,	%r27,	%r26
CP_BIS_PRI694:
	and	%r26,	%r28,	%r26
	.word 0xc89b5c5a  ! 1963: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc4bc913a  ! 1965: STDA_R	stda	%r2, [%r18 + %r26] 0x89
	.word 0xc502801a  ! 1966: LDF_R	ld	[%r10, %r26], %f2
SET_TL1_695:
	ta	T_CHANGE_TO_TL1
CHANGE_R26696:
	add	%r26,	%r27,	%r26
NC_BIS_NUC696:
	.word 0xc4b544fa  ! 1968: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc4abd01a  ! 1970: STBA_R	stba	%r2, [%r15 + %r26] 0x80
CP_BIS_AIUP697:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 1972: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xc494511a  ! 1974: LDUHA_R	lduha	[%r17, %r26] 0x88, %r2
NC_NUC698:
	.word 0xc5bd409a  ! 1976: STDFA_R	stda	%f2, [%r26, %r21]
	.word 0xc4dcd03a  ! 1978: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc453600a  ! 1979: LDSH_I	ldsh	[%r13 + 0x000a], %r2
	.word 0xc584913a  ! 1981: LDFA_R	lda	[%r18, %r26], %f2
CP_BIS_AIUP699:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 1983: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xc40ac01a  ! 1984: LDUB_R	ldub	[%r11 + %r26], %r2
	.word 0xc494903a  ! 1986: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
SHORT_FP_PRI700:
	.word 0xc5badb5a  ! 1988: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc5e3601a  ! 1989: CASA_R	casa	[%r13] %asi, %r26, %r2
SHORT_FP_PRI701:
	.word 0xc59a9a1a  ! 1991: LDDFA_R	ldda	[%r10, %r26], %f2
CP_AIUP702:
	.word 0xc4b6021a  ! 1993: STHA_R	stha	%r2, [%r24 + %r26] 0x10
	.word 0xc4a4111a  ! 1995: STWA_R	stwa	%r2, [%r16 + %r26] 0x88
NC_NUC703:
	.word 0xc4f5409a  ! 1997: STXA_R	stxa	%r2, [%r21 + %r26] 0x04
CP_PST_PRI704:
	.word 0xc5bb591a  ! 1999: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc51ac01a  ! 2000: LDDF_R	ldd	[%r11, %r26], %f2
CP_AIUS705:
	.word 0xc487823a  ! 2002: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r2
SET_TL0_706:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI707:
	and	%r26,	%r28,	%r26
	.word 0xc4f29d5a  ! 2004: STXA_R	stxa	%r2, [%r10 + %r26] 0xea
	.word 0xc4ab111a  ! 2005: STBA_R	stba	%r2, [%r12 + %r26] 0x88
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC709:
	.word 0xc5a5409a  ! 2007: STFA_R	sta	%f2, [%r26, %r21]
CP_PST_PRI710:
	.word 0xc5bad81a  ! 2009: STDFA_R	stda	%f2, [%r26, %r11]
SHORT_FP_PRI711:
	.word 0xc59b1a1a  ! 2011: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc4dcd03a  ! 2013: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc484101a  ! 2015: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r2
CP_PST_PRI712:
	.word 0xc5ba989a  ! 2017: STDFA_R	stda	%f2, [%r26, %r10]
CP_BIS_AIUS713:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 2019: STDA_R	stda	%r2, [%r30 + %r26] 0x23
CP_AIUS714:
	.word 0xc487823a  ! 2021: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r2
	.word 0xc4a2901a  ! 2022: STWA_R	stwa	%r2, [%r10 + %r26] 0x80
NC_BIS_SEC715:
	.word 0xccbcdd7a  ! 2024: STDA_R	stda	%r6, [%r19 + %r26] 0xeb
SHORT_FP_PRI716:
	.word 0xc59ada1a  ! 2026: LDDFA_R	ldda	[%r11, %r26], %f2
	.word 0xc4c4d03a  ! 2028: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
	.word 0xc584d03a  ! 2030: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc49cd03a  ! 2032: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
NC_BIS_AIUP717:
	.word 0xc4b6445a  ! 2034: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xc47ac01a  ! 2035: SWAP_R	swap	%r2, [%r11 + %r26]
CP_AIUS718:
	.word 0xc4a7823a  ! 2037: STWA_R	stwa	%r2, [%r30 + %r26] 0x11
	.word 0xc4f4913a  ! 2039: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc46b001a  ! 2040: LDSTUB_R	ldstub	%r2, [%r12 + %r26]
CP_BIS_NUC719:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 2042: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
	.word 0xc522801a  ! 2043: STF_R	st	%f2, [%r26, %r10]
	.word 0xc40ae00b  ! 2044: LDUB_I	ldub	[%r11 + 0x000b], %r2
	.word 0xc48c101a  ! 2046: LDUBA_R	lduba	[%r16, %r26] 0x80, %r2
	.word 0xc5bc101a  ! 2048: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc4f4d03a  ! 2050: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc5a4d03a  ! 2052: STFA_R	sta	%f2, [%r26, %r19]
NC_BIS_AIUS720:
	.word 0xd0afc57a  ! 2054: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
CHANGE_R26721:
	add	%r26,	%r27,	%r26
CP_BIS_SEC721:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2056: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD722:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 2058: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xc5bb911a  ! 2060: STDFA_R	stda	%f2, [%r26, %r14]
BLK_PRI723:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2062: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc48c903a  ! 2064: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4a4d03a  ! 2066: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc4cc903a  ! 2068: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc4f3901a  ! 2070: STXA_R	stxa	%r2, [%r14 + %r26] 0x80
	.word 0xc59c913a  ! 2072: LDDFA_R	ldda	[%r18, %r26], %f2
CHANGE_USER724:
	ta	T_CHANGE_NONPRIV
CHANGE_R26725:
	add	%r26,	%r27,	%r26
CP_BIS_PRI725:
	and	%r26,	%r28,	%r26
	.word 0xccbb1c5a  ! 2074: STDA_R	stda	%r6, [%r12 + %r26] 0xe2
	.word 0xc49c903a  ! 2076: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc45b401a  ! 2077: LDX_R	ldx	[%r13 + %r26], %r2
	.word 0xc4dcd03a  ! 2079: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
CHANGE_PRIV726:
	ta	T_CHANGE_PRIV
CHANGE_R26727:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS727:
	.word 0xc4b7c47a  ! 2081: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUS728:
	.word 0xd0afc47a  ! 2083: STBA_R	stba	%r8, [%r31 + %r26] 0x23
SET_TL1_729:
	ta	T_CHANGE_TO_TL1
CHANGE_R26730:
	mov	%g0,	%r26
NC_BIS_NUC730:
	.word 0xd0a545fa  ! 2085: STWA_R	stwa	%r8, [%r21 + %r26] 0x2f
	.word 0xc5a4913a  ! 2087: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc47b6008  ! 2088: SWAP_I	swap	%r2, [%r13 + 0x0008]
	.word 0xc4cc501a  ! 2090: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r2
	.word 0xc484d13a  ! 2092: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
	.word 0xc4cc903a  ! 2094: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CP_BIS_QUAD_LD731:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 2096: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xc4d3901a  ! 2098: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r2
	.word 0xc59cd13a  ! 2100: LDDFA_R	ldda	[%r19, %r26], %f2
NC_AIUP732:
	.word 0xc4d6431a  ! 2102: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r2
CHANGE_R26733:
	add	%r26,	%r27,	%r26
CP_BIS_SEC733:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2104: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD734:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2106: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
CP_BIS_NUC735:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 2108: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
CP_BIS_NUC736:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 2110: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
	.word 0xc53aa008  ! 2111: STDF_I	std	%f2, [0x0008, %r10]
	.word 0xc5a3911a  ! 2113: STFA_R	sta	%f2, [%r26, %r14]
	.word 0xc4c4d13a  ! 2115: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
CP_ATM_QUAD_LD737:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 2117: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
CP_AIUS738:
	.word 0xc48f833a  ! 2119: LDUBA_R	lduba	[%r30, %r26] 0x19, %r2
	.word 0xc43b2008  ! 2120: STD_I	std	%r2, [%r12 + 0x0008]
	.word 0xc5ba901a  ! 2121: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4acd03a  ! 2123: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4fa901a  ! 2124: SWAPA_R	swapa	%r2, [%r10 + %r26] 0x80
SHORT_FP_PRI739:
	.word 0xc59b1a1a  ! 2126: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc583501a  ! 2127: LDFA_R	lda	[%r13, %r26], %f2
NC_AIUP740:
	.word 0xc4a6421a  ! 2129: STWA_R	stwa	%r2, [%r25 + %r26] 0x10
NC_BLK_SEc741:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2131: STDFA_R	stda	%f16, [%r26, %r19]
CP_AIUS742:
	.word 0xc48f823a  ! 2133: LDUBA_R	lduba	[%r30, %r26] 0x11, %r2
	.word 0xc494903a  ! 2135: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
NC_BIS_AIUP743:
	.word 0xccb6445a  ! 2137: STHA_R	stha	%r6, [%r25 + %r26] 0x22
NC_BIS_AIUP744:
	.word 0xd0a6455a  ! 2139: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
	.word 0xc5bcd13a  ! 2141: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc5236008  ! 2142: STF_I	st	%f2, [0x0008, %r13]
CP_NUC745:
	.word 0xc5a5009a  ! 2144: STFA_R	sta	%f2, [%r26, %r20]
NC_BLK_SEc746:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2146: STDFA_R	stda	%f16, [%r26, %r19]
SHORT_FP_PRI747:
	.word 0xc59a9b5a  ! 2148: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc4ac913a  ! 2150: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc484903a  ! 2152: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc4cc913a  ! 2154: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
NC_BIS_NUC748:
	.word 0xc4b544fa  ! 2156: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc4a4d03a  ! 2158: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
CP_PST_PRI749:
	.word 0xc5ba985a  ! 2160: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc5ba911a  ! 2161: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc5a4903a  ! 2163: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4a4903a  ! 2165: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_PST_PRI750:
	.word 0xc5bb985a  ! 2167: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4fa901a  ! 2168: SWAPA_R	swapa	%r2, [%r10 + %r26] 0x80
	.word 0xc4f3901a  ! 2170: STXA_R	stxa	%r2, [%r14 + %r26] 0x80
	.word 0xc4a2d01a  ! 2171: STWA_R	stwa	%r2, [%r11 + %r26] 0x80
	.word 0xc46b600b  ! 2172: LDSTUB_I	ldstub	%r2, [%r13 + 0x000b]
CHANGE_R26751:
	add	%r26,	%r27,	%r26
CP_BIS_SEC751:
	and	%r26,	%r28,	%r26
	.word 0xccac9d7a  ! 2174: STBA_R	stba	%r6, [%r18 + %r26] 0xeb
	.word 0xc484d03a  ! 2176: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
CP_PST_PRI752:
	.word 0xc5bad81a  ! 2178: STDFA_R	stda	%f2, [%r26, %r11]
NC_AIUP753:
	.word 0xc4d6421a  ! 2180: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r2
SET_TL0_754:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI755:
	.word 0xccb41c5a  ! 2182: STHA_R	stha	%r6, [%r16 + %r26] 0xe2
	.word 0xc4b4101a  ! 2184: STHA_R	stha	%r2, [%r16 + %r26] 0x80
NC_SHORT_FP_SEC756:
	.word 0xc5bcda7a  ! 2186: STDFA_R	stda	%f2, [%r26, %r19]
NC_BIS_SEC757:
	.word 0xd0bcdd7a  ! 2188: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
BLK_PRI758:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2190: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc4ac511a  ! 2192: STBA_R	stba	%r2, [%r17 + %r26] 0x88
	.word 0xc5bcd03a  ! 2194: STDFA_R	stda	%f2, [%r26, %r19]
NC_BIS_PRI759:
	.word 0xc4b45c5a  ! 2196: STHA_R	stha	%r2, [%r17 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS761:
	.word 0xc5bfc33a  ! 2198: STDFA_R	stda	%f2, [%r26, %r31]
CP_NUC762:
	.word 0xc4dd019a  ! 2200: LDXA_R	ldxa	[%r20, %r26] 0x0c, %r2
	.word 0xc4dcd03a  ! 2202: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
SET_TL1_763:
	ta	T_CHANGE_TO_TL1
CHANGE_R26764:
	add	%r26,	%r27,	%r26
NC_BIS_NUC764:
	.word 0xc8b544fa  ! 2204: STHA_R	stha	%r4, [%r21 + %r26] 0x27
NC_SHORT_FP_SEC765:
	.word 0xc59cdb3a  ! 2206: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc493105a  ! 2207: LDUHA_R	lduha	[%r12, %r26] 0x82, %r2
	.word 0xc522a008  ! 2208: STF_I	st	%f2, [0x0008, %r10]
SET_TL0_766:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI767:
	and	%r26,	%r28,	%r26
	.word 0xc4badc5a  ! 2210: STDA_R	stda	%r2, [%r11 + %r26] 0xe2
	.word 0xc503001a  ! 2211: LDF_R	ld	[%r12, %r26], %f2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP769:
	.word 0xc4a6421a  ! 2213: STWA_R	stwa	%r2, [%r25 + %r26] 0x10
CP_AIUP770:
	.word 0xc48e021a  ! 2215: LDUBA_R	lduba	[%r24, %r26] 0x10, %r2
NC_NUC771:
	.word 0xc4f5419a  ! 2217: STXA_R	stxa	%r2, [%r21 + %r26] 0x0c
	.word 0xe56fc01a  ! 2219: PREFETCH_R	prefetch	[%r31 + %r26], #18
CP_NUC772:
	.word 0xc5f5201a  ! 2221: CASXA_R	casxa	[%r20]%asi, %r26, %r2
	.word 0xc4ba901a  ! 2222: STDA_R	stda	%r2, [%r10 + %r26] 0x80
NC_BLK_SEc773:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2224: STDFA_R	stda	%f0, [%r26, %r19]
BLK_PRI774:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 2226: STDFA_R	stda	%f16, [%r26, %r13]
SHORT_FP_PRI775:
	.word 0xc59a9b5a  ! 2228: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc46a801a  ! 2229: LDSTUB_R	ldstub	%r2, [%r10 + %r26]
	.word 0xc5bb101a  ! 2230: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5bb901a  ! 2232: STDFA_R	stda	%f2, [%r26, %r14]
NC_AIUP776:
	.word 0xc4d6421a  ! 2234: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r2
CHANGE_USER777:
	ta	T_CHANGE_NONPRIV
CHANGE_R26778:
	add	%r26,	%r27,	%r26
NC_BIS_PRI778:
	.word 0xccb3dc5a  ! 2236: STHA_R	stha	%r6, [%r15 + %r26] 0xe2
NC_BIS_PRI779:
	.word 0xc4bb9c5a  ! 2238: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
WR_LEASI_780:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_781:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS783:
	.word 0xc487c23a  ! 2241: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r2
	.word 0xc59a901a  ! 2242: LDDFA_R	ldda	[%r10, %r26], %f2
NC_BLK_SEc784:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2244: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc483105a  ! 2245: LDUWA_R	lduwa	[%r12, %r26] 0x82, %r2
	.word 0xc4bc903a  ! 2247: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc45a801a  ! 2248: LDX_R	ldx	[%r10 + %r26], %r2
CP_BIS_AIUP785:
	and	%r26,	%r28,	%r26
	.word 0xccbe055a  ! 2250: STDA_R	stda	%r6, [%r24 + %r26] 0x2a
	.word 0xc4acd03a  ! 2252: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4c2915a  ! 2253: LDSWA_R	ldswa	[%r10, %r26] 0x8a, %r2
CP_BIS_AIUS786:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 2255: STDA_R	stda	%r2, [%r30 + %r26] 0x23
	.word 0xc48cd03a  ! 2257: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
CHANGE_R26787:
	mov	%g0,	%r26
CP_BIS_SEC787:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 2259: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
	.word 0xc502a008  ! 2260: LDF_I	ld	[%r10, 0x0008], %f2
	.word 0xc59c913a  ! 2262: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc4bc903a  ! 2264: STDA_R	stda	%r2, [%r18 + %r26] 0x81
NC_BIS_SEC788:
	.word 0xd0bcdd7a  ! 2266: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
	.word 0xc4f3911a  ! 2268: STXA_R	stxa	%r2, [%r14 + %r26] 0x88
CP_BIS_AIUS789:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 2270: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xc4ac913a  ! 2272: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CP_BIS_AIUP790:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 2274: STBA_R	stba	%r4, [%r24 + %r26] 0x22
NC_BLK_SEc791:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2276: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc4fb101a  ! 2277: SWAPA_R	swapa	%r2, [%r12 + %r26] 0x80
	.word 0xc5bad01a  ! 2278: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc484501a  ! 2280: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r2
	.word 0xc4cc913a  ! 2282: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
BLK_PRI792:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 2284: STDFA_R	stda	%f0, [%r26, %r13]
WR_LEASI_793:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_794:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUS795:
	.word 0xc4c7c23a  ! 2287: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r2
	.word 0xc51a801a  ! 2288: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc4c4903a  ! 2290: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
CHANGE_USER796:
	ta	T_CHANGE_NONPRIV
CHANGE_R26797:
	add	%r26,	%r27,	%r26
NC_BIS_PRI797:
	.word 0xc4a45c5a  ! 2292: STWA_R	stwa	%r2, [%r17 + %r26] 0xe2
NC_SHORT_FP_SEC798:
	.word 0xc59cda3a  ! 2294: LDDFA_R	ldda	[%r19, %r26], %f2
SHORT_FP_PRI799:
	.word 0xc59b5a1a  ! 2296: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc452c01a  ! 2297: LDSH_R	ldsh	[%r11 + %r26], %r2
	.word 0xc584903a  ! 2299: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc53aa008  ! 2300: STDF_I	std	%f2, [0x0008, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC801:
	.word 0xc4b5019a  ! 2302: STHA_R	stha	%r2, [%r20 + %r26] 0x0c
CHANGE_R26802:
	add	%r26,	%r27,	%r26
CP_BIS_SEC802:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 2304: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
NC_BIS_AIUS803:
	.word 0xc4afc57a  ! 2306: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xc4c4511a  ! 2308: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r2
	.word 0xc5e3601a  ! 2309: CASA_R	casa	[%r13] %asi, %r26, %r2
	.word 0xc49c913a  ! 2311: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
CHANGE_R26804:
	add	%r26,	%r27,	%r26
CP_BIS_SEC804:
	and	%r26,	%r28,	%r26
	.word 0xccf49c7a  ! 2313: STXA_R	stxa	%r6, [%r18 + %r26] 0xe3
	.word 0xc4dc903a  ! 2315: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc4f3911a  ! 2317: STXA_R	stxa	%r2, [%r14 + %r26] 0x88
SET_TL1_805:
	ta	T_CHANGE_TO_TL1
CHANGE_R26806:
	add	%r26,	%r27,	%r26
NC_BIS_NUC806:
	.word 0xc4a544fa  ! 2319: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xc5bcd03a  ! 2321: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4d4d13a  ! 2323: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
CHANGE_R26807:
	add	%r26,	%r27,	%r26
CP_BIS_SEC807:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 2325: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
NC_AIUS808:
	.word 0xc4bfc33a  ! 2327: STDA_R	stda	%r2, [%r31 + %r26] 0x19
SET_TL0_809:
	ta	T_CHANGE_TO_TL0
WR_LEASI_810:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_811:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_PST_PRI812:
	.word 0xc5bbd95a  ! 2330: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc48cd03a  ! 2332: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4fad11a  ! 2333: SWAPA_R	swapa	%r2, [%r11 + %r26] 0x88
CHANGE_R26813:
	add	%r26,	%r27,	%r26
CP_BIS_SEC813:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 2335: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
BLK_PRI814:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 2337: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc48c913a  ! 2339: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
SET_TL1_815:
	ta	T_CHANGE_TO_TL1
CHANGE_R26816:
	mov	%g0,	%r26
NC_BIS_NUC816:
	.word 0xc8b544fa  ! 2341: STHA_R	stha	%r4, [%r21 + %r26] 0x27
	.word 0xc582d05a  ! 2342: LDFA_R	lda	[%r11, %r26], %f2
	.word 0xc5a4d13a  ! 2344: STFA_R	sta	%f2, [%r26, %r19]
NC_PST_PRI817:
	.word 0xc5bc581a  ! 2346: STDFA_R	stda	%f2, [%r26, %r17]
CP_PST_PRI818:
	.word 0xc5bb589a  ! 2348: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc523001a  ! 2349: STF_R	st	%f2, [%r26, %r12]
NC_NUC819:
	.word 0xc48d409a  ! 2351: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
CHANGE_R26820:
	add	%r26,	%r27,	%r26
CP_BIS_SEC820:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 2353: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
	.word 0xc47aa008  ! 2354: SWAP_I	swap	%r2, [%r10 + 0x0008]
NC_BIS_NUC821:
	.word 0xc4ad45fa  ! 2356: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
CP_ATM_QUAD_LD822:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2358: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
	.word 0xc49b901a  ! 2360: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc494903a  ! 2362: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
	.word 0xc4bb911a  ! 2364: STDA_R	stda	%r2, [%r14 + %r26] 0x88
BLK_PRI823:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2366: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xc4c4d13a  ! 2368: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc4d4d13a  ! 2370: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	.word 0xc5a3901a  ! 2372: STFA_R	sta	%f2, [%r26, %r14]
CP_BIS_AIUP824:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2374: STBA_R	stba	%r2, [%r24 + %r26] 0x22
NC_BLK_SEc825:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2376: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc59c111a  ! 2378: LDDFA_R	ldda	[%r16, %r26], %f2
CP_PST_PRI826:
	.word 0xc5bb581a  ! 2380: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc5036008  ! 2381: LDF_I	ld	[%r13, 0x0008], %f2
NC_AIUS827:
	.word 0xc49fc33a  ! 2383: LDDA_R	ldda	[%r31, %r26] 0x19, %r2
SET_TL0_828:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI829:
	and	%r26,	%r28,	%r26
	.word 0xcc9add5a  ! 2385: LDDA_R	ldda	[%r11, %r26] 0xea, %r6
	.word 0xc522c01a  ! 2386: STF_R	st	%f2, [%r26, %r11]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC831:
	.word 0xc5e5201a  ! 2388: CASA_R	casa	[%r20] %asi, %r26, %r2
	.word 0xc584903a  ! 2390: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc51b6008  ! 2391: LDDF_I	ldd	[%r13, 0x0008], %f2
	.word 0xc5bb901a  ! 2393: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4cc501a  ! 2395: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r2
	.word 0xc5a3911a  ! 2397: STFA_R	sta	%f2, [%r26, %r14]
SET_TL1_832:
	ta	T_CHANGE_TO_TL1
CHANGE_R26833:
	add	%r26,	%r27,	%r26
NC_BIS_NUC833:
	.word 0xc8a544fa  ! 2399: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
CP_AIUS834:
	.word 0xc4d7823a  ! 2401: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r2
	.word 0xc59cd03a  ! 2403: LDDFA_R	ldda	[%r19, %r26], %f2
NC_AIUS835:
	.word 0xc4f7c33a  ! 2405: STXA_R	stxa	%r2, [%r31 + %r26] 0x19
NC_BIS_AIUP836:
	.word 0xc4f6445a  ! 2407: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xc4dc913a  ! 2409: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
CP_PST_PRI837:
	.word 0xc5ba995a  ! 2411: STDFA_R	stda	%f2, [%r26, %r10]
NC_PST_PRI838:
	.word 0xc5bbd81a  ! 2413: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc5a2901a  ! 2414: STFA_R	sta	%f2, [%r26, %r10]
SET_TL0_839:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI840:
	.word 0xc8f39d5a  ! 2416: STXA_R	stxa	%r4, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC842:
	.word 0xc5bd409a  ! 2418: STDFA_R	stda	%f2, [%r26, %r21]
NC_BIS_AIUP843:
	.word 0xd0a6455a  ! 2420: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
	.word 0xc453600a  ! 2421: LDSH_I	ldsh	[%r13 + 0x000a], %r2
	.word 0xc4c3d01a  ! 2423: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r2
	.word 0xc48bd01a  ! 2425: LDUBA_R	lduba	[%r15, %r26] 0x80, %r2
CP_PST_PRI844:
	.word 0xc5bad95a  ! 2427: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc583901a  ! 2429: LDFA_R	lda	[%r14, %r26], %f2
CP_BIS_AIUP845:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 2431: STHA_R	stha	%r8, [%r24 + %r26] 0x22
CP_ATM_QUAD_LD846:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2433: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc584501a  ! 2435: LDFA_R	lda	[%r17, %r26], %f2
	.word 0xc53aa008  ! 2436: STDF_I	std	%f2, [0x0008, %r10]
NC_PST_PRI847:
	.word 0xc5bc189a  ! 2438: STDFA_R	stda	%f2, [%r26, %r16]
NC_AIUP848:
	.word 0xc4ae421a  ! 2440: STBA_R	stba	%r2, [%r25 + %r26] 0x10
	.word 0xc49c511a  ! 2442: LDDA_R	ldda	[%r17, %r26] 0x88, %r2
	.word 0xc522a008  ! 2443: STF_I	st	%f2, [0x0008, %r10]
	.word 0xc482911a  ! 2444: LDUWA_R	lduwa	[%r10, %r26] 0x88, %r2
	.word 0xc59c903a  ! 2446: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc4cc903a  ! 2448: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc4c3911a  ! 2450: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r2
	.word 0xc49c903a  ! 2452: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
NC_BIS_SEC849:
	.word 0xc4acdc7a  ! 2454: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
SET_TL1_850:
	ta	T_CHANGE_TO_TL1
CHANGE_R26851:
	add	%r26,	%r27,	%r26
NC_BIS_NUC851:
	.word 0xd0f544fa  ! 2456: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
NC_PST_PRI852:
	.word 0xc5bb995a  ! 2458: STDFA_R	stda	%f2, [%r26, %r14]
NC_BIS_NUC853:
	.word 0xccad45fa  ! 2460: STBA_R	stba	%r6, [%r21 + %r26] 0x2f
CP_BIS_QUAD_LD854:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 2462: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
CP_BIS_QUAD_LD855:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 2464: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xc4aa901a  ! 2465: STBA_R	stba	%r2, [%r10 + %r26] 0x80
BLK_PRI856:
	and	%r26,	%r29,	%r26
	.word 0xc1badf1a  ! 2467: STDFA_R	stda	%f0, [%r26, %r11]
CP_NUC857:
	.word 0xc4d5019a  ! 2470: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r2
	.word 0xc59b911a  ! 2472: LDDFA_R	ldda	[%r14, %r26], %f2
	.word 0xc452801a  ! 2473: LDSH_R	ldsh	[%r10 + %r26], %r2
	.word 0xc4a4d03a  ! 2475: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc4ac111a  ! 2477: STBA_R	stba	%r2, [%r16 + %r26] 0x88
NC_AIUS858:
	.word 0xc497c33a  ! 2479: LDUHA_R	lduha	[%r31, %r26] 0x19, %r2
	.word 0xc582905a  ! 2480: LDFA_R	lda	[%r10, %r26], %f2
CP_ATM_QUAD_LD859:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 2482: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
SHORT_FP_PRI860:
	.word 0xc5bb1b5a  ! 2484: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc484913a  ! 2486: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r2
	.word 0xc4bc101a  ! 2488: STDA_R	stda	%r2, [%r16 + %r26] 0x80
	.word 0xc4f3901a  ! 2490: STXA_R	stxa	%r2, [%r14 + %r26] 0x80
BLK_PRI861:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 2492: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc5f2a01a  ! 2493: CASXA_R	casxa	[%r10]%asi, %r26, %r2
NC_BIS_AIUS862:
	.word 0xd0afc57a  ! 2495: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
NC_BIS_NUC863:
	.word 0xc4ad44fa  ! 2497: STBA_R	stba	%r2, [%r21 + %r26] 0x27
CP_NUC864:
	.word 0xc4d5009a  ! 2499: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r2
	.word 0xc47b2008  ! 2500: SWAP_I	swap	%r2, [%r12 + 0x0008]
	.word 0xc4d4903a  ! 2502: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_PST_PRI865:
	.word 0xc5bb995a  ! 2504: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4b4511a  ! 2506: STHA_R	stha	%r2, [%r17 + %r26] 0x88
CP_ATM_QUAD_LD866:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2508: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
NC_BIS_AIUP867:
	.word 0xc8ae445a  ! 2510: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xc45ae008  ! 2511: LDX_I	ldx	[%r11 + 0x0008], %r2
NC_SHORT_FP_SEC868:
	.word 0xc59cda7a  ! 2513: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc47a801a  ! 2514: SWAP_R	swap	%r2, [%r10 + %r26]
	.word 0xc4d3d01a  ! 2516: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r2
BLK_PRI869:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2518: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xedefa024  ! 2520: PREFETCHA_I	prefetcha	[%r30, + 0x0024] %asi, #22
BLK_PRI870:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2522: STDFA_R	stda	%f16, [%r26, %r10]
NC_BIS_AIUS871:
	.word 0xd0afc47a  ! 2524: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xc43b001a  ! 2525: STD_R	std	%r2, [%r12 + %r26]
CHANGE_R26872:
	add	%r26,	%r27,	%r26
CP_BIS_SEC872:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 2527: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
NC_BLK_SEc873:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2529: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc4fb501a  ! 2530: SWAPA_R	swapa	%r2, [%r13 + %r26] 0x80
CP_ATM_QUAD_LD874:
	and	%r26,	%r29,	%r26
	.word 0xd09b049a  ! 2532: LDDA_R	ldda	[%r12, %r26] 0x24, %r8
	.word 0xc484913a  ! 2534: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r2
CP_AIUP875:
	.word 0xc4f6021a  ! 2536: STXA_R	stxa	%r2, [%r24 + %r26] 0x10
	.word 0xc47b001a  ! 2537: SWAP_R	swap	%r2, [%r12 + %r26]
	.word 0xc4c4d03a  ! 2539: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
	.word 0xc584903a  ! 2541: LDFA_R	lda	[%r18, %r26], %f2
SET_TL0_876:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI877:
	and	%r26,	%r28,	%r26
	.word 0xc8b2dd5a  ! 2543: STHA_R	stha	%r4, [%r11 + %r26] 0xea
CP_PST_PRI878:
	.word 0xc5bb195a  ! 2545: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc43a801a  ! 2546: STD_R	std	%r2, [%r10 + %r26]
	.word 0xc48c111a  ! 2548: LDUBA_R	lduba	[%r16, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC880:
	.word 0xc495009a  ! 2550: LDUHA_R	lduha	[%r20, %r26] 0x04, %r2
	.word 0xc4bc903a  ! 2552: STDA_R	stda	%r2, [%r18 + %r26] 0x81
CHANGE_USER881:
	ta	T_CHANGE_NONPRIV
CHANGE_R26882:
	mov	%g0,	%r26
CP_BIS_PRI882:
	and	%r26,	%r28,	%r26
	.word 0xcc9b5c5a  ! 2554: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xc4a4d03a  ! 2556: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC884:
	.word 0xc5bd009a  ! 2558: STDFA_R	stda	%f2, [%r26, %r20]
	.word 0xc522c01a  ! 2559: STF_R	st	%f2, [%r26, %r11]
	.word 0xc5bcd03a  ! 2561: STDFA_R	stda	%f2, [%r26, %r19]
CP_AIUP885:
	.word 0xc59e021a  ! 2563: LDDFA_R	ldda	[%r24, %r26], %f2
WR_LEASI_886:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_887:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4a4903a  ! 2566: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc5bbd01a  ! 2568: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc4b3901a  ! 2570: STHA_R	stha	%r2, [%r14 + %r26] 0x80
	.word 0xc4bb501a  ! 2571: STDA_R	stda	%r2, [%r13 + %r26] 0x80
	.word 0xc5ba911a  ! 2572: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc483911a  ! 2574: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r2
NC_AIUS888:
	.word 0xc4dfc23a  ! 2576: LDXA_R	ldxa	[%r31, %r26] 0x11, %r2
CP_AIUS889:
	.word 0xc487833a  ! 2578: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r2
	.word 0xc4dc903a  ! 2580: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc5a3d01a  ! 2582: STFA_R	sta	%f2, [%r26, %r15]
SET_TL1_890:
	ta	T_CHANGE_TO_TL1
CHANGE_R26891:
	add	%r26,	%r27,	%r26
NC_BIS_NUC891:
	.word 0xccad44fa  ! 2584: STBA_R	stba	%r6, [%r21 + %r26] 0x27
CP_PST_PRI892:
	.word 0xc5ba981a  ! 2586: STDFA_R	stda	%f2, [%r26, %r10]
NC_NUC893:
	.word 0xc495409a  ! 2588: LDUHA_R	lduha	[%r21, %r26] 0x04, %r2
	.word 0xc4f4d13a  ! 2590: STXA_R	stxa	%r2, [%r19 + %r26] 0x89
NC_BLK_SEc894:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2592: LDDFA_R	ldda	[%r19, %r26], %f16
SET_TL0_895:
	ta	T_CHANGE_TO_TL0
CHANGE_R26896:
	add	%r26,	%r27,	%r26
NC_BIS_SEC896:
	.word 0xc8acdd7a  ! 2594: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS898:
	.word 0xc59f823a  ! 2596: LDDFA_R	ldda	[%r30, %r26], %f2
	.word 0xc43aa008  ! 2597: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc4ccd03a  ! 2599: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
CP_NUC899:
	.word 0xc4fd019a  ! 2601: SWAPA_R	swapa	%r2, [%r20 + %r26] 0x0c
NC_BIS_AIUS900:
	.word 0xc4f7c57a  ! 2603: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xc59c101a  ! 2605: LDDFA_R	ldda	[%r16, %r26], %f2
NC_BLK_SEc901:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2607: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUP902:
	.word 0xd0ae445a  ! 2609: STBA_R	stba	%r8, [%r25 + %r26] 0x22
BLK_PRI903:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 2611: STDFA_R	stda	%f16, [%r26, %r10]
CHANGE_R26904:
	add	%r26,	%r27,	%r26
CP_BIS_SEC904:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 2613: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
	.word 0xc48c903a  ! 2615: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
BLK_PRI905:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2617: LDDFA_R	ldda	[%r10, %r26], %f0
CHANGE_USER906:
	ta	T_CHANGE_NONPRIV
CHANGE_R26907:
	add	%r26,	%r27,	%r26
CP_BIS_PRI907:
	and	%r26,	%r28,	%r26
	.word 0xc8a35c5a  ! 2619: STWA_R	stwa	%r4, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC909:
	.word 0xc5a5009a  ! 2621: STFA_R	sta	%f2, [%r26, %r20]
	.word 0xc5f2a01a  ! 2622: CASXA_R	casxa	[%r10]%asi, %r26, %r2
	.word 0xc484d13a  ! 2624: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
NC_BLK_SEc910:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2626: LDDFA_R	ldda	[%r19, %r26], %f0
SET_TL1_911:
	ta	T_CHANGE_TO_TL1
CHANGE_R26912:
	mov	%g0,	%r26
NC_BIS_NUC912:
	.word 0xc4a545fa  ! 2628: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc584111a  ! 2631: LDFA_R	lda	[%r16, %r26], %f2
	.word 0xc4236008  ! 2632: STW_I	stw	%r2, [%r13 + 0x0008]
	.word 0xc47ae008  ! 2633: SWAP_I	swap	%r2, [%r11 + 0x0008]
	.word 0xc4d3911a  ! 2635: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r2
	.word 0xc48c903a  ! 2637: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc5efe03d  ! 2639: PREFETCHA_I	prefetcha	[%r31, + 0x003d] %asi, #n_writes
CP_NUC913:
	.word 0xc4fd009a  ! 2641: SWAPA_R	swapa	%r2, [%r20 + %r26] 0x04
	.word 0xc5bc913a  ! 2643: STDFA_R	stda	%f2, [%r26, %r18]
CP_PST_PRI914:
	.word 0xc5bb181a  ! 2645: STDFA_R	stda	%f2, [%r26, %r12]
NC_AIUP915:
	.word 0xc4ce421a  ! 2647: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r2
	.word 0xc45ae008  ! 2648: LDX_I	ldx	[%r11 + 0x0008], %r2
SET_TL0_916:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI917:
	and	%r26,	%r28,	%r26
	.word 0xc4a29d5a  ! 2650: STWA_R	stwa	%r2, [%r10 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC919:
	.word 0xc4a5019a  ! 2652: STWA_R	stwa	%r2, [%r20 + %r26] 0x0c
	.word 0xc4cb505a  ! 2653: LDSBA_R	ldsba	[%r13, %r26] 0x82, %r2
	.word 0xc5e2a01a  ! 2654: CASA_R	casa	[%r10] %asi, %r26, %r2
NC_BIS_AIUS920:
	.word 0xd0f7c47a  ! 2656: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xc4d4101a  ! 2658: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r2
	.word 0xc4ab901a  ! 2660: STBA_R	stba	%r2, [%r14 + %r26] 0x80
	.word 0xc46b001a  ! 2661: LDSTUB_R	ldstub	%r2, [%r12 + %r26]
	.word 0xc4a4903a  ! 2663: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_BIS_SEC921:
	.word 0xc8a4dc7a  ! 2665: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xc4a4501a  ! 2667: STWA_R	stwa	%r2, [%r17 + %r26] 0x80
SET_TL1_922:
	ta	T_CHANGE_TO_TL1
CHANGE_R26923:
	add	%r26,	%r27,	%r26
NC_BIS_NUC923:
	.word 0xd0bd44fa  ! 2669: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xc484903a  ! 2671: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc46b600b  ! 2672: LDSTUB_I	ldstub	%r2, [%r13 + 0x000b]
	.word 0xc59b101a  ! 2673: LDDFA_R	ldda	[%r12, %r26], %f2
NC_AIUP924:
	.word 0xc4be421a  ! 2675: STDA_R	stda	%r2, [%r25 + %r26] 0x10
NC_SHORT_FP_SEC925:
	.word 0xc5bcda3a  ! 2677: STDFA_R	stda	%f2, [%r26, %r19]
CHANGE_R26926:
	add	%r26,	%r27,	%r26
CP_BIS_SEC926:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 2679: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
	.word 0xc43ae008  ! 2680: STD_I	std	%r2, [%r11 + 0x0008]
BLK_PRI927:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 2682: STDFA_R	stda	%f0, [%r26, %r12]
CP_BIS_AIUP928:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2684: STDA_R	stda	%r2, [%r24 + %r26] 0x22
SHORT_FP_PRI929:
	.word 0xc59adb5a  ! 2686: LDDFA_R	ldda	[%r11, %r26], %f2
CP_AIUP930:
	.word 0xc586031a  ! 2688: LDFA_R	lda	[%r24, %r26], %f2
CHANGE_R26931:
	add	%r26,	%r27,	%r26
CP_BIS_SEC931:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 2690: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
CP_BIS_AIUS932:
	and	%r26,	%r28,	%r26
	.word 0xc89f847a  ! 2692: LDDA_R	ldda	[%r30, %r26] 0x23, %r4
	.word 0xc4d4913a  ! 2694: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
	.word 0xc4c3901a  ! 2696: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
CP_PST_PRI933:
	.word 0xc5ba995a  ! 2698: STDFA_R	stda	%f2, [%r26, %r10]
CP_NUC934:
	.word 0xc4ed019a  ! 2700: LDSTUBA_R	ldstuba	%r2, [%r20 + %r26] 0x0c
NC_BLK_SEc935:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2702: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC936:
	.word 0xc585019a  ! 2704: LDFA_R	lda	[%r20, %r26], %f2
SHORT_FP_PRI937:
	.word 0xc59adb1a  ! 2706: LDDFA_R	ldda	[%r11, %r26], %f2
NC_BIS_AIUS938:
	.word 0xc4a7c47a  ! 2708: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
NC_NUC939:
	.word 0xc48d419a  ! 2710: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r2
CP_ATM_QUAD_LD940:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2712: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc4cc903a  ! 2714: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc4c4d13a  ! 2716: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
CP_BIS_QUAD_LD941:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2718: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CHANGE_R26942:
	add	%r26,	%r27,	%r26
CP_BIS_SEC942:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2720: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD943:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2722: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
CP_AIUP944:
	.word 0xc49e021a  ! 2724: LDDA_R	ldda	[%r24, %r26] 0x10, %r2
	.word 0xc4b4d13a  ! 2726: STHA_R	stha	%r2, [%r19 + %r26] 0x89
NC_BIS_AIUP945:
	.word 0xc4f6445a  ! 2728: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_BIS_NUC946:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 2730: STDA_R	stda	%r2, [%r20 + %r26] 0x27
CP_AIUS947:
	.word 0xc4df823a  ! 2732: LDXA_R	ldxa	[%r30, %r26] 0x11, %r2
CP_NUC948:
	.word 0xc4f5009a  ! 2735: STXA_R	stxa	%r2, [%r20 + %r26] 0x04
	.word 0xc4b2901a  ! 2736: STHA_R	stha	%r2, [%r10 + %r26] 0x80
	.word 0xc582911a  ! 2737: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc5036008  ! 2738: LDF_I	ld	[%r13, 0x0008], %f2
CP_NUC949:
	.word 0xc59d009a  ! 2740: LDDFA_R	ldda	[%r20, %r26], %f2
	.word 0xc523401a  ! 2741: STF_R	st	%f2, [%r26, %r13]
	.word 0xc4f4903a  ! 2743: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
CHANGE_R26950:
	add	%r26,	%r27,	%r26
CP_BIS_SEC950:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 2745: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
NC_NUC951:
	.word 0xc4d5419a  ! 2747: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r2
NC_PST_PRI952:
	.word 0xc5bb985a  ! 2749: STDFA_R	stda	%f2, [%r26, %r14]
NC_AIUS953:
	.word 0xc4afc33a  ! 2751: STBA_R	stba	%r2, [%r31 + %r26] 0x19
	.word 0xc4d4903a  ! 2753: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc5a4903a  ! 2755: STFA_R	sta	%f2, [%r26, %r18]
NC_BIS_AIUP954:
	.word 0xc8be445a  ! 2757: STDA_R	stda	%r4, [%r25 + %r26] 0x22
CHANGE_R26955:
	add	%r26,	%r27,	%r26
CP_BIS_SEC955:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 2759: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
CP_BIS_QUAD_LD956:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 2761: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xc4dc913a  ! 2763: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
	.word 0xc43a801a  ! 2764: STD_R	std	%r2, [%r10 + %r26]
CP_AIUS957:
	.word 0xc5bf823a  ! 2766: STDFA_R	stda	%f2, [%r26, %r30]
CP_PST_PRI958:
	.word 0xc5ba981a  ! 2768: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc51b001a  ! 2769: LDDF_R	ldd	[%r12, %r26], %f2
CP_BIS_AIUS959:
	and	%r26,	%r28,	%r26
	.word 0xc49f857a  ! 2771: LDDA_R	ldda	[%r30, %r26] 0x2b, %r2
	.word 0xc46b600b  ! 2772: LDSTUB_I	ldstub	%r2, [%r13 + 0x000b]
	.word 0xc584913a  ! 2774: LDFA_R	lda	[%r18, %r26], %f2
SET_TL0_960:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI961:
	and	%r26,	%r28,	%r26
	.word 0xc4a31c5a  ! 2776: STWA_R	stwa	%r2, [%r12 + %r26] 0xe2
	.word 0xc59c903a  ! 2778: LDDFA_R	ldda	[%r18, %r26], %f2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC963:
	.word 0xc4a5409a  ! 2780: STWA_R	stwa	%r2, [%r21 + %r26] 0x04
	.word 0xc4c4913a  ! 2782: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
NC_AIUS964:
	.word 0xc4dfc33a  ! 2784: LDXA_R	ldxa	[%r31, %r26] 0x19, %r2
NC_NUC965:
	.word 0xc4f5409a  ! 2786: STXA_R	stxa	%r2, [%r21 + %r26] 0x04
NC_BIS_AIUP966:
	.word 0xc4a6445a  ! 2788: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
NC_PST_PRI967:
	.word 0xc5bc185a  ! 2790: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc5bcd03a  ! 2792: STDFA_R	stda	%f2, [%r26, %r19]
CP_NUC968:
	.word 0xc4fd009a  ! 2794: SWAPA_R	swapa	%r2, [%r20 + %r26] 0x04
CP_BIS_NUC969:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 2796: STDA_R	stda	%r2, [%r20 + %r26] 0x27
	.word 0xc48c903a  ! 2798: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CHANGE_USER970:
	ta	T_CHANGE_NONPRIV
CHANGE_R26971:
	add	%r26,	%r27,	%r26
NC_BIS_PRI971:
	.word 0xc4a3dc5a  ! 2800: STWA_R	stwa	%r2, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP973:
	.word 0xc4c6431a  ! 2802: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r2
	.word 0xc4dcd13a  ! 2804: LDXA_R	ldxa	[%r19, %r26] 0x89, %r2
NC_BLK_SEc974:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2806: STDFA_R	stda	%f0, [%r26, %r19]
BLK_PRI975:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2808: LDDFA_R	ldda	[%r10, %r26], %f0
NC_BIS_AIUP976:
	.word 0xc4f6455a  ! 2810: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xc484913a  ! 2812: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r2
BLK_PRI977:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 2814: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc4c4903a  ! 2816: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
SET_TL1_978:
	ta	T_CHANGE_TO_TL1
CHANGE_R26979:
	add	%r26,	%r27,	%r26
NC_BIS_NUC979:
	.word 0xc4ad44fa  ! 2818: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xc5e3201a  ! 2819: CASA_R	casa	[%r12] %asi, %r26, %r2
	.word 0xc473001a  ! 2820: STX_R	stx	%r2, [%r12 + %r26]
NC_BLK_SEc980:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2822: STDFA_R	stda	%f16, [%r26, %r19]
SET_TL0_981:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI982:
	.word 0xc8abdd5a  ! 2824: STBA_R	stba	%r4, [%r15 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS984:
	.word 0xc4b7823a  ! 2826: STHA_R	stha	%r2, [%r30 + %r26] 0x11
CP_BIS_AIUP985:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 2828: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc483911a  ! 2830: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r2
CP_BIS_NUC986:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2832: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc48c903a  ! 2834: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4c4d03a  ! 2836: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
SET_TL1_987:
	ta	T_CHANGE_TO_TL1
CHANGE_R26988:
	add	%r26,	%r27,	%r26
NC_BIS_NUC988:
	.word 0xd0b545fa  ! 2838: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
	.word 0xc483901a  ! 2840: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r2
	.word 0xc4c4d13a  ! 2842: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc4ccd03a  ! 2844: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
CP_ATM_QUAD_LD989:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2846: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
SHORT_FP_PRI990:
	.word 0xc5ba9b1a  ! 2848: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc522801a  ! 2849: STF_R	st	%f2, [%r26, %r10]
CP_BIS_AIUP991:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2851: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc53b6008  ! 2852: STDF_I	std	%f2, [0x0008, %r13]
NC_SHORT_FP_SEC992:
	.word 0xc59cdb3a  ! 2854: LDDFA_R	ldda	[%r19, %r26], %f2
SHORT_FP_PRI993:
	.word 0xc5bb1a1a  ! 2856: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc4dcd03a  ! 2858: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc4ac101a  ! 2860: STBA_R	stba	%r2, [%r16 + %r26] 0x80
	.word 0xc484903a  ! 2862: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
CP_BIS_QUAD_LD994:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 2864: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xc4db911a  ! 2866: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
	.word 0xc4cc913a  ! 2868: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
NC_BIS_AIUP995:
	.word 0xc4f6455a  ! 2870: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
CHANGE_R26996:
	add	%r26,	%r27,	%r26
CP_BIS_SEC996:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 2873: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
	.word 0xc48b901a  ! 2875: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
	.word 0xc4d4d03a  ! 2877: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc4a2911a  ! 2878: STWA_R	stwa	%r2, [%r10 + %r26] 0x88
NC_AIUP997:
	.word 0xc4c6431a  ! 2880: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r2
	.word 0xc4bc903a  ! 2882: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc503001a  ! 2883: LDF_R	ld	[%r12, %r26], %f2
	.word 0xc5f3601a  ! 2884: CASXA_R	casxa	[%r13]%asi, %r26, %r2
NC_AIUP998:
	.word 0xc4c6431a  ! 2886: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r2
	.word 0xc59a915a  ! 2887: LDDFA_R	ldda	[%r10, %r26], %f2
CP_PST_PRI999:
	.word 0xc5bad99a  ! 2889: STDFA_R	stda	%f2, [%r26, %r11]
NC_PST_PRI1000:
	.word 0xc5bb991a  ! 2891: STDFA_R	stda	%f2, [%r26, %r14]
CP_AIUS1001:
	.word 0xc49f823a  ! 2893: LDDA_R	ldda	[%r30, %r26] 0x11, %r2
CP_BIS_QUAD_LD1002:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 2895: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
NC_NUC1003:
	.word 0xc495409a  ! 2897: LDUHA_R	lduha	[%r21, %r26] 0x04, %r2
CP_BIS_NUC1004:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 2899: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
CP_BIS_NUC1005:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 2901: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
CP_BIS_QUAD_LD1006:
	and	%r26,	%r29,	%r26
	.word 0xcc9add5a  ! 2903: LDDA_R	ldda	[%r11, %r26] 0xea, %r6
NC_BLK_SEc1007:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2905: STDFA_R	stda	%f0, [%r26, %r19]
SHORT_FP_PRI1008:
	.word 0xc5ba9b1a  ! 2907: STDFA_R	stda	%f2, [%r26, %r10]
CP_AIUS1009:
	.word 0xc487823a  ! 2909: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r2
	.word 0xc484903a  ! 2911: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc5236008  ! 2912: STF_I	st	%f2, [0x0008, %r13]
SET_TL0_1010:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI1011:
	.word 0xcca39c5a  ! 2914: STWA_R	stwa	%r6, [%r14 + %r26] 0xe2
	.word 0xc59a915a  ! 2915: LDDFA_R	ldda	[%r10, %r26], %f2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP1013:
	.word 0xc4de021a  ! 2917: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
NC_AIUS1014:
	.word 0xc4dfc23a  ! 2919: LDXA_R	ldxa	[%r31, %r26] 0x11, %r2
	.word 0xc4a4903a  ! 2921: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_BLK_SEc1015:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2923: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc4b3101a  ! 2924: STHA_R	stha	%r2, [%r12 + %r26] 0x80
WR_LEASI_1016:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_1017:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc5bc913a  ! 2927: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc4ac903a  ! 2929: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc4c3901a  ! 2931: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
CHANGE_USER1018:
	ta	T_CHANGE_NONPRIV
CHANGE_R261019:
	mov	%g0,	%r26
NC_BIS_PRI1019:
	.word 0xc8ac1c5a  ! 2933: STBA_R	stba	%r4, [%r16 + %r26] 0xe2
CP_BIS_PRI1020:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 2935: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
	.word 0xc5e2a01a  ! 2936: CASA_R	casa	[%r10] %asi, %r26, %r2
	.word 0xc494903a  ! 2938: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
CHANGE_PRIV1021:
	ta	T_CHANGE_PRIV
CHANGE_R261022:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS1022:
	and	%r26,	%r28,	%r26
	.word 0xc4af857a  ! 2940: STBA_R	stba	%r2, [%r30 + %r26] 0x2b
	.word 0xc5a4913a  ! 2942: STFA_R	sta	%f2, [%r26, %r18]
NC_BLK_SEc1023:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2944: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc48bd01a  ! 2946: LDUBA_R	lduba	[%r15, %r26] 0x80, %r2
CP_AIUS1024:
	.word 0xc4af823a  ! 2948: STBA_R	stba	%r2, [%r30 + %r26] 0x11
	.word 0xc4d4101a  ! 2950: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r2
	.word 0xc5a4d13a  ! 2952: STFA_R	sta	%f2, [%r26, %r19]
NC_BIS_SEC1025:
	.word 0xc8bcdc7a  ! 2954: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
	.word 0xc4a3911a  ! 2956: STWA_R	stwa	%r2, [%r14 + %r26] 0x88
	.word 0xc4bc903a  ! 2958: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc5f2e01a  ! 2959: CASXA_R	casxa	[%r11]%asi, %r26, %r2
CP_NUC1026:
	.word 0xc48d009a  ! 2961: LDUBA_R	lduba	[%r20, %r26] 0x04, %r2
	.word 0xc4db911a  ! 2963: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
	.word 0xc472801a  ! 2964: STX_R	stx	%r2, [%r10 + %r26]
	.word 0xc4ac903a  ! 2966: STBA_R	stba	%r2, [%r18 + %r26] 0x81
CP_NUC1027:
	.word 0xc5e5201a  ! 2968: CASA_R	casa	[%r20] %asi, %r26, %r2
CP_ATM_QUAD_LD1028:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 2970: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
CP_BIS_NUC1029:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 2972: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
	.word 0xc484501a  ! 2974: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r2
	.word 0xc582911a  ! 2975: LDFA_R	lda	[%r10, %r26], %f2
CHANGE_USER1030:
	ta	T_CHANGE_NONPRIV
CHANGE_R261031:
	add	%r26,	%r27,	%r26
NC_BIS_PRI1031:
	.word 0xc8b39d5a  ! 2977: STHA_R	stha	%r4, [%r14 + %r26] 0xea
	.word 0xc4db901a  ! 2979: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc4ac913a  ! 2981: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CHANGE_PRIV1032:
	ta	T_CHANGE_PRIV
CHANGE_R261033:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP1033:
	.word 0xd0ae445a  ! 2983: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xc4c4903a  ! 2985: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
	.word 0xc43aa008  ! 2986: STD_I	std	%r2, [%r10 + 0x0008]
CHANGE_USER1034:
	ta	T_CHANGE_NONPRIV
CHANGE_R261035:
	add	%r26,	%r27,	%r26
NC_BIS_PRI1035:
	.word 0xd0a39d5a  ! 2988: STWA_R	stwa	%r8, [%r14 + %r26] 0xea
	.word 0xc583901a  ! 2990: LDFA_R	lda	[%r14, %r26], %f2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS1037:
	.word 0xc487c23a  ! 2992: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r2
	.word 0xc4ac101a  ! 2994: STBA_R	stba	%r2, [%r16 + %r26] 0x80
	.word 0xc4d3901a  ! 2996: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r2
	.word 0xc49cd03a  ! 2998: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0xa79189444f65ac79
.xword 0x8c91a07474903780
.xword 0x3c074278b41e3f88
.xword 0xed1fc4a0628f5fbc
.xword 0x79e7aa5508d33d99
.xword 0x25a14a9a57b3a128
.xword 0xf5970ed492bf867e
.xword 0xd9bafe1cb89ddfb8
.xword 0x4dd5cafa9737ba10
.xword 0xa351eb609371ce59
.xword 0x67c140e586c4e40f
.xword 0xd85a173dba5a30f0
.xword 0x791c550c3b0089c1
.xword 0x3b86ca1bb9956859
.xword 0x0c54556dd8ddc427
.xword 0x814a3ffa2e441848
.xword 0x6eb997bfd0aeb530
.xword 0xd6fe01647040c832
.xword 0x55dff5ca8822cad3
.xword 0x367ac40282375edc
.xword 0x6371fa8c8d55e4fe
.xword 0xebac964772fea2ad
.xword 0x1e6d8efbb4ee020b
.xword 0xe9151cf231829c0a
.xword 0x42e7daee69d878d8
.xword 0x91524745fa352faa
.xword 0xbc0282629496cee8
.xword 0x62c9618561531bbb
.xword 0x214f1b8656ec5387
.xword 0x852b7a8b1062d968
.xword 0x0bfafb9fc2603f8b
.xword 0x1061670a0088394b



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
.xword 0xf8e91f420fdd769e

.xword 0xcc917729db31ef49

.xword 0xb57d7658bb17ff10

.xword 0xec00c26490b86b5f

.xword 0x5dde28365a70a0fb

.xword 0x4982bc891d274d0c

.xword 0x18946f4a6a3646a9

.xword 0x4dd7764923ce15e8

.xword 0xa32ce3ae8772f267

.xword 0xddbfbd997eb79601

.xword 0x4f4a91cddd20975f

.xword 0xd00e1f58ccd30933

.xword 0x8b001564f7abc90b

.xword 0x0219262c535c4c70

.xword 0x620925fa8db0760e

.xword 0xde7cdebb2ed373cf

.xword 0x6f8b7a56d3e93865

.xword 0x5cb54835bf518115

.xword 0xc6fd68cd73e610ee

.xword 0x659064412def9248

.xword 0x4ac17c69b47d7a00

.xword 0xedb40766ea39888f

.xword 0x60bdb1fb15e2f76f

.xword 0x3d0ed783a7c04d68

.xword 0x837bb527d81d6ba0

.xword 0x7b65fc2dec853785

.xword 0xea6d9c88ea8f8f1f

.xword 0x7505003d0912d55a

.xword 0x66a58fa1444ccf59

.xword 0x6b9620f95764c5a1

.xword 0x8bdecca6407ccb14

.xword 0x9e81013297dbf428




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
.xword 0xdee80cd33f869473
.xword 0x5b6a1b60aa616b6e
.xword 0x3933530628c4e326
.xword 0xc86cfa3df0a1dcd1
.xword 0x9398327c002598cb
.xword 0x2418f2b4c3acbeeb
.xword 0x40f8384fc0376fc2
.xword 0x1f76cb34b47ab187
.xword 0xc6789d7f98a9e6fd




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
.xword 0x96a240fa815abb01
.xword 0x02ae1debaaa5178d
.xword 0x557b0b5456be9689
.xword 0x8cd9af26d66578ce
.xword 0x63e61c04181e1c75
.xword 0x3eaf90afa125069a
.xword 0xca37029603e63ae8
.xword 0x6797247676befe1b
.xword 0x8e11042860bbaacd




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
.xword 0xb9288c911bf92489
.xword 0x9f2c59c8c5c04f7f
.xword 0x2574aec937d20377
.xword 0x5b75f643275229ec
.xword 0xd93f03e041106308
.xword 0xe5d772c11b15ee1b
.xword 0x3d4e4959b2cacd04
.xword 0x41056baf0c8cda94
.xword 0xe9a61f265cbd1588




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
.xword 0x85b61e813bfcb259
.xword 0x6d832319ee01209f
.xword 0xe1ae870c6bcad61b
.xword 0x6408b672fb4fbd5c
.xword 0xa15ca9b11b3dd5ec
.xword 0xc28101fe2dfc22fe
.xword 0x73265aca002db6fd
.xword 0xce52b49ab38e723d
.xword 0xc28d8b3c48814977




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
.xword 0xf3661a4b33ae30c3
.xword 0x8cab81dce090123a
.xword 0x1a0e187f7405343e
.xword 0x3819053d7e422e8f
.xword 0x9e831a3d1ae021df
.xword 0xab4c2636a988955f
.xword 0x96f9f32f5bb17bc2
.xword 0xf21d6cc0f152643c
.xword 0xf78868079a3bfa8d




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
.xword 0x91f0a39c1e51b421
.xword 0x84fb7b596d03891d
.xword 0xffc1b5f3522a4a2f
.xword 0x92f54bd7c314c603
.xword 0x8dec607382a4f4cd
.xword 0x30bddf11ffa2e617
.xword 0xdf5f2aecb85bb9ac
.xword 0x1cf096018f28b308
.xword 0x6ab19a9214d9b996




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
.xword 0x3aacc406fc2b3ba8
.xword 0x4aa552b892d4a849
.xword 0xe7d9f0ce4267ed85
.xword 0xc2d3ff9e4b7f0cc0
.xword 0x7f9781ed81efad01
.xword 0xc0a00707313f9753
.xword 0x9febb9713b73fb9a
.xword 0x96e3f20560d9e274
.xword 0xc4c32c743f372e9d




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
.xword 0x20343791886e646a
.xword 0xa33245bb2356a31a
.xword 0xfc2a53fc03771f10
.xword 0x5d234d3090e6000b
.xword 0x08ecc21d853171d9
.xword 0x65688b7defe31370
.xword 0x17abc28fb6c078a2
.xword 0x8c1a46eabc36fbda
.xword 0xbaf63e287524993e




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
.xword 0x739902b7bca51960
.xword 0x9b7ac5970a74ff11
.xword 0x2f56c8c47329faa3
.xword 0xd572ccbc63701808
.xword 0xb6161e80b4c29f36
.xword 0xbfdd714c7b2c8f8a
.xword 0x1021b5353ddd89cd
.xword 0x22b2fee2fa57bf1d
.xword 0x8accfe7d87043498




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
.xword 0xe49b537430989d1a
.xword 0x6cabdadb763c8fa3
.xword 0x691084027c978b0d
.xword 0x0305d296461ee061
.xword 0x88483bc100a27622
.xword 0xb36758775a2ece4c
.xword 0x59ff3e0c60e176c2
.xword 0xffac5ebcc446dec3
.xword 0x180937bf14f501f7




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
.xword 0x5a8594b336eb1c06
.xword 0x59b593ac24057f60
.xword 0x8e75e77a9f1cab3e
.xword 0x41cfacbc098cdb34
.xword 0xb41cb17bb7ab7f13
.xword 0x739c3d8b114b2ca1
.xword 0xf1929ccbeeb1dc9b
.xword 0x687952fd2375ee8a
.xword 0xf1ce457b945fbbe0




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
.xword 0xd0f44df834c2a746
.xword 0xe89d067dc252660f
.xword 0xa8682f39dcec1552
.xword 0xd40118604e39cbde
.xword 0x2361496181f59768
.xword 0xead02c5688ec9cb7
.xword 0x1cd11a6543e96bd1
.xword 0x40863d5f2fc328e4
.xword 0x674944d55451ea96




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
.xword 0xd8b054b90f63d116
.xword 0x6258620c6e247739
.xword 0x29088c7a4da6ccb9
.xword 0xd07e1f69cc7bf12d
.xword 0x9c6877d5e7029933
.xword 0xeb8b95bce3eda15f
.xword 0xb1c9c6de7944f357
.xword 0xc17a62da86667d34
.xword 0xcc066d423ed6daae




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
.xword 0xaa1f36d0b40b7e5f
.xword 0x1d5a788325eabc95
.xword 0x2b6aaf434c492bd3
.xword 0xf53a34963452d1de
.xword 0xa56f69abcf57c626
.xword 0xb05df4a5c50b3c78
.xword 0x0459adba29d9aa22
.xword 0x7bfc6cb57abb3dde
.xword 0x721e813b4675e781




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
.xword 0x3a272f6f4c93e3d7
.xword 0xee3172eaa771d980
.xword 0x2203e56983958cc3
.xword 0xa21b5fac28c4d5a2
.xword 0xdb7987fdb7153f21
.xword 0xc9947ae1d95450c6
.xword 0x0761fa8464b7a2ee
.xword 0x1b1a279d6eef0ddf
.xword 0x1c097661401d29cd




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
.xword 0x3f5851e2b8b710fc
.xword 0xa54fd7620cd35639
.xword 0xa5bb74cfa2c3b86b
.xword 0x5bfa7ac8264cfe84
.xword 0xb99bde9b9fa7734a
.xword 0x069518585c56f0be
.xword 0x4589aaf7cf09333c
.xword 0xb77bd3e633a7e0e0
.xword 0x8fccf04523246880




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
.xword 0xb89ef50af16fcf8e
.xword 0x2e1b33922b9eebb7
.xword 0xe993352cee9a866c
.xword 0xbebd199cb18c9fb2
.xword 0x158d363f79b746fc
.xword 0xddbb3deec5d0f989
.xword 0x9059c0be57773c9b
.xword 0xc5b18206bf93ff44
.xword 0x32d2134114ed376b




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
.xword 0x0cf63e6701245bf0
.xword 0x857e0b4150706407
.xword 0x8b61b7e89fc1ce54
.xword 0x65db563f37ad6660
.xword 0x59cf9eef4bc8a405
.xword 0xcba202f53b4ee670
.xword 0x737e778402aaaf98
.xword 0x9d422ec029adabc6
.xword 0x07932a399b3d24e4




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
.xword 0xfdb995ed30d7382e
.xword 0x26da4fe63a34dc58
.xword 0x966d58d46707e7a3
.xword 0xd4aa695c2ba2f59b
.xword 0x2c8b5df520b49d30
.xword 0xf34c9ee216f651ba
.xword 0x8560e467e50c004d
.xword 0xd1f22a9dcd0a0c15
.xword 0xbd6db8649649ba19




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
.xword 0xac421486f03e8ed0
.xword 0xac4d12f4f8d29e8f
.xword 0x8ce1e4ff10180b29
.xword 0x3ceeab0c1176193b
.xword 0x36598299ba9b4685
.xword 0xf3c9a68297215a95
.xword 0xb2beb21b039c4c9f
.xword 0x0cc26a73ad38f382
.xword 0x97899d5c17d801eb




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
.xword 0x32657ec904064ca7
.xword 0x4fc414a995c6c94f
.xword 0x573ac3178520e47f
.xword 0x47541f6bb8d0f4f1
.xword 0x2d064ffda1786de8
.xword 0x5a2cfbbf85e39809
.xword 0xb1acf61f4030d769
.xword 0x81aaa00bee9418fa
.xword 0x311c422bf9aea4af




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
.xword 0x464d3aca18cf96fc
.xword 0xda377ab786098b1f
.xword 0x68f16ba106099381
.xword 0x59fd5c8f749fdb5f
.xword 0x3474f925fae25fab
.xword 0xe7becde3fadd369a
.xword 0xb75f4921d4d5ad28
.xword 0xeac3b2ab785533b2
.xword 0xe609c5415f5798b2




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
.xword 0xd70dafcf547d6b2d
.xword 0x8739a38ea4bc2a55
.xword 0xef78a3b240991366
.xword 0xfbdcdc38421033c1
.xword 0xc56f7e5ecc13aa84
.xword 0xa8d8d75a89ce418f
.xword 0xa75aecd31d9872aa
.xword 0x7dd7369b6c93cd1a
.xword 0xf14e037cd490e697




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
.xword 0x5d87130050781cd9
.xword 0xf339a413f1e5c79b
.xword 0x6d1552a521cd5c31
.xword 0x86a389f2b8bc4aa9
.xword 0xced8b5ffda3403a1
.xword 0xb9b1b04e392f2614
.xword 0x3c0ba2f10567cd20
.xword 0x44da8ad4d874cd8a
.xword 0xac5df9897835d204




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
.xword 0x316024bcbcb7bc67
.xword 0xefa2a13178fabf11
.xword 0x5443914a65a22bf9
.xword 0x56d6044ec237f49e
.xword 0x6531fbc13b60f39b
.xword 0x477cbe45b1736c83
.xword 0xaebbaa18cf6b3f95
.xword 0x5b80bc85403fe9a4
.xword 0x7e3b62b7b09f74b3




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
.xword 0xbfd810e90616f8e9
.xword 0x69b2c1d4dfaea2a9
.xword 0x283f1b349ca40851
.xword 0x64865f2dc4c2c7ee
.xword 0xdd897b84829e6c48
.xword 0x7b4520014b423612
.xword 0x636342d633516ccd
.xword 0x433a0105b9dfc57d
.xword 0x5fc0c8b9a83eb5dd




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
.xword 0x0411912c3516a465
.xword 0xf5fd5c69ff838608
.xword 0x0eefb7c0ef9fb444
.xword 0xf1c4999ef752fa97
.xword 0x700afa0e9ec07c30
.xword 0x9d92d92060a7795e
.xword 0xededbb2f3a651150
.xword 0xa141dc44373f2981
.xword 0xf30fa85b34a875cd




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
.xword 0x20563fc8fcbf3cd4
.xword 0x2e827a25ab2b9972
.xword 0x361550593348365f
.xword 0xf5876e7fcc1a80fe
.xword 0xdfd96c4d46ca4446
.xword 0x4208d6fe6ad29322
.xword 0x960892cf918106c3
.xword 0x7d4d91ad73725b9e
.xword 0xaadc268b49200e6d




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
.xword 0xaa92cf14c6b53f6c
.xword 0x0be37e28c9383784
.xword 0x8fcb016d16846029
.xword 0xcad36bb917af5532
.xword 0xc9d82e843ad5c9c9
.xword 0x5cad2e982b6618ed
.xword 0x078fadc8f9e20020
.xword 0x8638fa382ca62e75
.xword 0x152aac4aa2d3202b




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
.xword 0xe1a6ebe349e9b523
.xword 0x7ebbff3847f8771f
.xword 0x053606bd180ab6ed
.xword 0x3d502758ad94eba8
.xword 0x1e4935ef6445d3ca
.xword 0xb9d713fbb63defaa
.xword 0xd3f6b7de8440ac8a
.xword 0x7b0e70370efe8173
.xword 0x5f64efb094e75277




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
.xword 0x138259cd9ccae7f0
.xword 0x4cfb6c90159e0851
.xword 0x4e067608ea060316
.xword 0x4f9d584d09afec9b
.xword 0xbeccc759b3e3ab3f
.xword 0x76a1ea8762f1c0a5
.xword 0x63853f5f7e82f3d9
.xword 0x6d3746c856fa5e15
.xword 0xb566e2d874e1d140






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
.xword 0xaa2546bc2816447c
.xword 0x7f63ebbdc73577d6
.xword 0x8eb06ee4a3062aac
.xword 0x4a2c55fe810ab51f
.xword 0x04915d5b9c06b76d
.xword 0xf606c819f8e64983
.xword 0x3d4c46c8aa7db6da
.xword 0xfc335e3ffc940826



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
.xword 0x43443fbca74cef2a
.xword 0x1e971c7c260a63ba
.xword 0x6aa1b6453456a574
.xword 0xb9ebbe63fa956e5d
.xword 0xf0cc950dcb214dbd
.xword 0x3045670f3ce436ca
.xword 0x507f9c0f5bafe447
.xword 0xc460a00aba4a2540



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
.xword 0x5ee3efc05e6d0375
.xword 0x27f5d6d98cb3b77d
.xword 0x4e0243d491081936
.xword 0xf5d841fa536dd480
.xword 0x283225e07a290cbe
.xword 0x751cd8c7b9a418f4
.xword 0xb340a3ddc90e5e65
.xword 0x4a4610aee7137279



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
.xword 0xac3de75a89068f80
.xword 0x3592e68fc1b5a463
.xword 0xccca703e7eb7dfcf
.xword 0x72fee4b88f8d3cf0
.xword 0x167bd675b0a3198d
.xword 0x4fd13f43a146c985
.xword 0xce4fe2886a0d0ceb
.xword 0xb8e04d0c140699a9



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
.xword 0x2cf809f6bc9a95f3
.xword 0x45e17c64ba10bc3e
.xword 0xfc4a898edd624c5a
.xword 0xcd4f9ed3dc52c6e5
.xword 0x25d463e537c5c769
.xword 0xc5823975af354e88
.xword 0x4ad0ef23d31f10c0
.xword 0x95883fa935b4a11e



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
.xword 0x872eae0b04cc95ee
.xword 0x5fc9e13053092c79
.xword 0x5c83489e100e4e7f
.xword 0x867f1c4018c1b98d
.xword 0x0606067661cf91f0
.xword 0x28aff27ead4fa98b
.xword 0x6253b2ca5fc9a51c
.xword 0x409a10c47ec1cbe4



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
.xword 0x5eec6b87fb453db6
.xword 0xf3d96b6cbda52597
.xword 0xabd4a308cd0ec2f3
.xword 0xa33c9c5d6247636d
.xword 0xcd564b77d1ac1d08
.xword 0x363efbce80f212ae
.xword 0x88a0da6e047eec1e
.xword 0x74a4fc9d2e6495ab



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
.xword 0x74a86f70114671ca
.xword 0x0d32a75181336f8f
.xword 0x55bd677cd24f1786
.xword 0x9c8892058125222a
.xword 0x97689b097da1416a
.xword 0xd98fb142b714de26
.xword 0x21c89cd78f101b89
.xword 0x2624bc2db3a42598



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
.xword 0x85b96dbefd1b0adc
.xword 0xc5c93a8f06e10107
.xword 0xc621b74ce80287b1
.xword 0xd1d80147f7e8a987
.xword 0xdcfbc42af880df4c
.xword 0x09757f8def764567
.xword 0xb4c34ffd72ab6048
.xword 0x60f9c460f17c369e



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
.xword 0x13cf88c5db545c47
.xword 0xcb57009f9470ad73
.xword 0x237d9c7a413077a2
.xword 0xa8af50b544c8ec32
.xword 0x2b4623d0268cfdc1
.xword 0x89ca5835731f3be8
.xword 0x2cf152bbb4fb8761
.xword 0x8d3c0de969dce875



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
.xword 0xdecd4c2eb704b856
.xword 0xc72f7aec006b1b7d
.xword 0x0edbba965f5e848d
.xword 0x7d2c1445bfc45f1a
.xword 0x2b715e93c7daa277
.xword 0x1469e4af7e7c8739
.xword 0x06076b8e8a69935c
.xword 0x5a5b44ef43f14f50



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
.xword 0x611df150ce106e3d
.xword 0x6f7efc36f578c08a
.xword 0x97088773ea313f58
.xword 0xe5bf9106394dd8d1
.xword 0x7423714e5eb731d6
.xword 0xd929f82f349bbc62
.xword 0xa30e4223df256814
.xword 0xad66c847be1e2548



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
.xword 0x083e8756a7f0e484
.xword 0xfab7b8afdf785c35
.xword 0x5543e5877ef6195e
.xword 0x3ddee893e1dbcac3
.xword 0xf41c898faa4eb2bc
.xword 0x82882c76316968c7
.xword 0x347f9d9fcacec52b
.xword 0x1cc49d96c48b9528



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
.xword 0xc08f1d9a0de9e1af
.xword 0xfeb39f2cb94443ab
.xword 0x228c3b9f82fc8e54
.xword 0x983392d061fca0b1
.xword 0x6d69e9f5a8f61c5f
.xword 0x86b63e9f35b3baea
.xword 0xd1ce0028a85a54f8
.xword 0x4bac201051f16d4b



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
.xword 0x5597889802bc3288
.xword 0x4b8739fdc29443a4
.xword 0xe6174f1f9980425a
.xword 0xfd4c5b1424530952
.xword 0x86cb78ab4ae77069
.xword 0x923b94d87523e5ec
.xword 0xb722bb041c8331bd
.xword 0xdc46a9020e88135d



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
.xword 0x8aac39d441eeb372
.xword 0x69801dddae30d6f7
.xword 0x6da310c8ec81cf1e
.xword 0x08e59787e42b700c
.xword 0x5d29e1e9b908f981
.xword 0x8c72491b348275fd
.xword 0x37267652b4522401
.xword 0x13e963b7dc2b5174



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
.xword 0x09509a1c156931e4
.xword 0x6bc083a7bc15c61b
.xword 0x10966f5513e7ae53
.xword 0x0ab2495ca5780a9a
.xword 0xfd5580ebc50c3292
.xword 0xb93335f95b54bac4
.xword 0xc2a067b41e55438f
.xword 0xdba739fc9c3af70c



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
.xword 0x98771dcff4251681
.xword 0x22615ca37cd28b11
.xword 0x24e43436bf4fbb10
.xword 0x52b3a6279ddb54b4
.xword 0xfb4f3c6e77ff2035
.xword 0x4eced128bb66518d
.xword 0xed1ee776921bd547
.xword 0x34986de399d2eef4



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
.xword 0x1c254562a18d927a
.xword 0xceca6ea823cf2150
.xword 0xa8bfd1a93b75e1b0
.xword 0xe71310838db82cd7
.xword 0x04feb99bb13e3a33
.xword 0xe922d9e59e1a4d71
.xword 0x48fa5fae714f3723
.xword 0xbf03421f70530080



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
.xword 0xd03662d9a03fb67d
.xword 0x9a7f36fa0ff441d4
.xword 0xcc2d7174fc4cfc77
.xword 0x11933b08b8735c60
.xword 0x5b400789e0b87ab5
.xword 0xc8627d0434d2cbc3
.xword 0xdd74b1d999b5e7a3
.xword 0x10ee22d3f2b29af2



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
.xword 0x033e089a4f779084
.xword 0x90f8d3e92301d7e0
.xword 0x49341972480558f3
.xword 0x26b2747373ebae6c
.xword 0x2baa7b4fc5bfa32e
.xword 0xbb25697e392bb807
.xword 0x3c2d782c42328ae9
.xword 0x048900a16a4d935b



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
.xword 0x9c6cccc733bc427e
.xword 0x91a12f46cd1ad83a
.xword 0xda41d823b5654999
.xword 0x65f0f45695304d01
.xword 0x61a25de087dd2ba3
.xword 0xb132ffc3b6691726
.xword 0x9fe76314871c98e9
.xword 0xf5b53b3b57f3deae



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
.xword 0x3290fdb555b7b3f2
.xword 0xc5d0094837561b4c
.xword 0x91b0d356cd589a7a
.xword 0xd1933f84e895954c
.xword 0x6f1f1fbb6217ee41
.xword 0x9f3f322b38451a45
.xword 0x75ca62fc8ecc5c2f
.xword 0x5868e5f874eddf32



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
.xword 0xd9353ccaf40caa4f
.xword 0x19a680cceffd150b
.xword 0x58b66ab57b67c270
.xword 0x5f81960cdac4262f
.xword 0x3a9614022ca26473
.xword 0x1f8b5c1371f0c4fc
.xword 0xac222192c47694a0
.xword 0xc74d2f48c2c4b5cd



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
.xword 0x68ceb9438bfbb23d
.xword 0x91560e20a347d772
.xword 0x8f8afb59f9f76d8d
.xword 0xd41e32566b9b53fb
.xword 0xfafad10ffc316146
.xword 0x6cab095c80fe9b47
.xword 0xd85b843d4f655f9f
.xword 0x85f55be3eb27b635



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
.xword 0x17071b6f651484d5
.xword 0x9828ac90a68c1059
.xword 0x6396a0d788623638
.xword 0xcde619681506c791
.xword 0x40237f7034d2e6db
.xword 0x33c7b009c6710a50
.xword 0xba774bd1d22f3cf6
.xword 0x24c953e16ebf1b90



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
.xword 0x6d7e7c7665fef187
.xword 0x7d0982d053c13d7e
.xword 0xcb61650f03d75d58
.xword 0x80616553b570f646
.xword 0x67d3275fab8598a9
.xword 0x568c02c57cd2c689
.xword 0xae9c3eb57de306d0
.xword 0xd76b1a761bace77a



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
.xword 0xed5b8825837ffcaa
.xword 0x7d7a16983b7acaa0
.xword 0xedd76917c1b4a750
.xword 0x8a7b8204f56b7754
.xword 0xe57b847547e68ab0
.xword 0xf7208d80cdbdfb3e
.xword 0xe5b22177e31f23f2
.xword 0x229c2ff4741d321b



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
.xword 0xc666b2ce16e8ea36
.xword 0xb6c6ac0d7370fa43
.xword 0x649be3034cc34088
.xword 0xd3be1492d6995b64
.xword 0x6be3b779f00ab1d3
.xword 0xde67a003ae1a64dd
.xword 0x427bc7abfc3c9a1a
.xword 0xa26f6e411ba0ea1b



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
.xword 0x9c04a743d62087c8
.xword 0xf062103732200d1e
.xword 0x50816a00f80d968e
.xword 0x8c09e437726871ae
.xword 0x1a7cca7c70bd9e6c
.xword 0xd2fa3d1d8502c412
.xword 0xd8ad1cd683423e8c
.xword 0xc561d5a37763cb8b



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
.xword 0x9339d231ce8670cb
.xword 0x4ddb73bb4af2ef43
.xword 0xbf99e9959e102222
.xword 0x77ad57a15f50042c
.xword 0xb81529bf23eb28e2
.xword 0x7d8cf738c6bdae3d
.xword 0xd793d2293f4e3bff
.xword 0x7a186635284ee07b



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
.xword 0x9289673b098d2405
.xword 0x8e3bcac685d8f993
.xword 0x6698a30da44e7858
.xword 0x95a35302e26bf548
.xword 0x54103e203cff4bf6
.xword 0x78292b78db6ae7d8
.xword 0x054f2340eba9b6e7
.xword 0x6bd4cb080e504b92





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
.xword 0xf289df3a9ff54ba4
.xword 0x42c4f53f1caccd2f
.xword 0x18db821b7520ca1a
.xword 0x7d6a3b4cab3857e7
.xword 0x4b5250537e8d9ba9
.xword 0x79b1792c6218f0de
.xword 0x7aedea8f52f6d698
.xword 0xa16744d5fcc3df00




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
.xword 0x21385ff5feb0704b
.xword 0x726ecfee611fde44
.xword 0xcef35a819b0d691f
.xword 0xf7eff07222354f09
.xword 0x8820eab2d71e06b8
.xword 0x386ab5385902f7c6
.xword 0x2021f1a6ba1ad139
.xword 0xd99beacfddb52057




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
.xword 0xcf9b8ffb56d26942
.xword 0x0c009c40eaf0302e
.xword 0x32a2fc21e2fae276
.xword 0x3cbaa9ade233c6da
.xword 0x624c4b39d0b548fb
.xword 0x7237ca9da3f9b7e0
.xword 0x2ebccf95f54b05ee
.xword 0xd4d5db5be5485b0c




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
.xword 0x09a3f6f2dcb56e2f
.xword 0x1fb70286c2729c4c
.xword 0xe3e1bcee5a0977b0
.xword 0x8465c34cfdc9df2a
.xword 0x44f8e7aca3ba5745
.xword 0x6a999d436cd7230c
.xword 0x549b8f60d101b106
.xword 0x287d93c430d9fc38




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
.xword 0xddbda7a29b1f619b
.xword 0x6860b4dc2b5459a5
.xword 0x75eafb6493865aee
.xword 0xe4e1c72e48a15e27
.xword 0x4d4fb985f7b71eb7
.xword 0x66a7d03c23bec12d
.xword 0xecd8ec91c1e8a9a0
.xword 0xad18d317df6db803




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
.xword 0x8d5ee5ec0be6ee1d
.xword 0xd7fba63be578e723
.xword 0x3552ef868916d6cb
.xword 0xc52e31c4c0692b5b
.xword 0xbb272f2c31ad5d91
.xword 0x2edcb24fda4fe4db
.xword 0x8f01a2d2156fdce1
.xword 0xfb95064b113b8322




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
.xword 0xdbf09be3861ac7be
.xword 0x3e351a4b56ad4240
.xword 0x9f2d32d3825d5c90
.xword 0xca554a719e07432e
.xword 0xc55b796e8eddf884
.xword 0xbe20e90f9e44df0b
.xword 0x18343fc27f9d94fa
.xword 0x17887f94830cc542




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
.xword 0x20cf1046ba8d9bb3
.xword 0xf02c8832b156676c
.xword 0xfd9b65b4b4b483a2
.xword 0x4cf9f13b4ab46414
.xword 0x785741dc2370cc8c
.xword 0xc762a2a7c00b6564
.xword 0x68d5168c38d43d01
.xword 0x6ed24be6cbc09e2c






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
.xword 0xa8071331adda71f9
.xword 0xcb06be4c732ac381
.xword 0x1bbb6e4d2dbe43e5
.xword 0xaeaa1e55c404397e
.xword 0x4c410ea04721559f
.xword 0x2511a89b0a8ce84b
.xword 0x98caa3ee32d89637
.xword 0x899925b060948918




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
.xword 0x2049557d4aa060f0
.xword 0xb72f2189f1295c6e
.xword 0xdc1fcc8a124c5918
.xword 0x5b1c5802c80d7f8e
.xword 0x54244484a7bc60c5
.xword 0x62093f74ca3c7ac1
.xword 0xe804169ec810eb23
.xword 0xc665935f0aeb8ca9




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
.xword 0xa9b1163ceee70ca0
.xword 0x2d01a0e585fa7d45
.xword 0x67249553ebbf3401
.xword 0x103a596ef35d855b
.xword 0xf08644d28cd72e7a
.xword 0x7fee44407aacc912
.xword 0xfd9233bc675970f4
.xword 0xc54412c63ceab806




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
.xword 0x7a8b2f61f3565012
.xword 0xf499a6626a061125
.xword 0xc0a9d911dd743d81
.xword 0xc0f1517c5c8c51d4
.xword 0x7d104f3bf05aa044
.xword 0x1e8d66661f93c49e
.xword 0x84449d25a7728a9c
.xword 0x9d834ef010fac1e3




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
.xword 0xcd0c91ba02c54e48
.xword 0x6ed1f6486676c292
.xword 0x87a5dcde1fc1e695
.xword 0x54cc7a295fdb9994
.xword 0x7f7829ed0257748f
.xword 0x515c4e50dec7fd00
.xword 0xff31ffeac69b6e59
.xword 0x4d4822f7e63de1b8




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
.xword 0x359e7e18005cc1e4
.xword 0xa55ad275cdd01c6d
.xword 0xfa1d981e54e5d3e4
.xword 0x9ef37cd5c3d05469
.xword 0x0840930c7fca8a3f
.xword 0x698d111f83f04b66
.xword 0x05653bfcba195f11
.xword 0x3cc1efcdf29e9dea




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
.xword 0x7a3e0e835fef82fd
.xword 0x6fbca80af5501aea
.xword 0x76bf8a67ff353080
.xword 0x525d6d923e496e2b
.xword 0x36af44410cd03572
.xword 0x2e73564922632748
.xword 0x889c0e9e1c5314cc
.xword 0xce0f484299251904




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
.xword 0x7ce0d3b6eb2b22ef
.xword 0xaf00b72ac6ffd597
.xword 0xe280ee27aa236712
.xword 0x564937f4aaf5bc14
.xword 0x2004ff790cc33c69
.xword 0x8ea9d79181a1c502
.xword 0x7197eb75dc5cf506
.xword 0xe744040831a2d37b






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
.xword 0xe863b6ba76dfe466
.xword 0x5a99e14230a04926
.xword 0x3756b004d1321bf0
.xword 0x479681ad667da504
.xword 0x57b4c379f45838ac
.xword 0x98dc1de33af92c9c
.xword 0x69b5790bb377d6e6
.xword 0x16fd038014a33431




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
.xword 0xe68e9ccffcfa2a50
.xword 0x753bad4f2f627448
.xword 0xe715fc650f035696
.xword 0xdd67c94032669737
.xword 0x88d56b0d2de249f5
.xword 0xe0d4d29f280a7487
.xword 0xeba80152d9986385
.xword 0xa479c72cd00ef8a7




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
.xword 0x9646ea508a11e739
.xword 0x39a9c0bcfe5ec42b
.xword 0xaa66a7c95651d47d
.xword 0x02093959bed8f5b5
.xword 0x497c45eb60954ee8
.xword 0x072c86dc5a8d6e04
.xword 0xe1bd9d20338bebca
.xword 0xdb610cc80be019c9




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
.xword 0x82cc1a27ee05ab37
.xword 0x7bd8d3b0b5808919
.xword 0xe669b3d76480c5fc
.xword 0x1118d66c40e2c56a
.xword 0xf138afc9a1addeb0
.xword 0xfdc777e2b0bba6b8
.xword 0x19cd94b4a2e119b2
.xword 0x4ed939f76f43a8f8




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
.xword 0xbc1d07983fc279d6
.xword 0x8084a4639126c7a6
.xword 0x4f3e0f1271fe6440
.xword 0x3a93939b1864e359
.xword 0x89b5e664ad5e476a
.xword 0x2dad131ba8578cc5
.xword 0x859b4e6c48439b75
.xword 0x02967d893ee875f6




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
.xword 0x28e5325e4e1fe9a2
.xword 0x90ee1cad3756a804
.xword 0x7afcaf202135d83c
.xword 0x0e504e5e46e82b85
.xword 0xfc8e7c084e80b67a
.xword 0xadbccd51266f0572
.xword 0xfaad67230f1a3bb4
.xword 0x8f2806531c60c540




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
.xword 0x54035c5f1a30bf47
.xword 0xd37bcb33036b1027
.xword 0x632a44ddd0998712
.xword 0x23ca8d40fbee0746
.xword 0x6b4a65a9492e10b6
.xword 0x088e11f7ec7233c0
.xword 0x49ad02f0d0e94ac8
.xword 0xcbc091ae6c6620c6




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
.xword 0x6755c186e557e66f
.xword 0xa4092c7b64cb16dc
.xword 0x02c76dc5dd5e013a
.xword 0x4e3f30469ee2e4b3
.xword 0xcd42312d47685b67
.xword 0x35d386e5bff16507
.xword 0x5466cf193437a76c
.xword 0x6f2d946a75933884






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
.xword 0x669f91b18474529b
.xword 0x9f2cb66b46734521
.xword 0x73ed73057b04470c
.xword 0x2f86487547b8c2be
.xword 0x41aaf3279821e569
.xword 0x51a42d23d6ebc0b3
.xword 0x5c66cca3821019ad
.xword 0x8d81a6ff80136fc5




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
.xword 0x5d6b364dff665653
.xword 0x0d6992f86ad9e4d2
.xword 0x5180dac82c63806c
.xword 0x408c75b0ca956ebc
.xword 0x78e44e06d175d4f9
.xword 0x46c0775f7f3d0b76
.xword 0x17354ad2e04a3d2d
.xword 0x92107bccf7d0e346




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
.xword 0x701ce96f11150203
.xword 0x52f71604d61926ec
.xword 0x4d7b23fb2c181577
.xword 0xe992f1307ea38e1d
.xword 0x3c3bb6be8cf72338
.xword 0x862d8230fa6d0d33
.xword 0x8b4b6093031b6671
.xword 0xb7868b02105fc99b




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
.xword 0x5e27accfd13b474d
.xword 0x0d99e0c3492c9a17
.xword 0xf53f5b50917f335d
.xword 0x85809093e29bbe90
.xword 0xaf8f1a02364f7a3e
.xword 0x863cfe194626f5bd
.xword 0x2458424aec8efcb6
.xword 0x723ee993b64a43c8




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
.xword 0xa78b35050a1e21d3
.xword 0xdbc7b79fbcfc3a91
.xword 0xad59e8c38ccabb52
.xword 0xc635ee42ceed935e
.xword 0xe1453b38be32d384
.xword 0x4d130e95da9c16a5
.xword 0xa57f1f9aa69fda23
.xword 0x3f23abf6d08e18c9




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
.xword 0x908116100059c87e
.xword 0x1fed6a7fa16d34e3
.xword 0x9df4d84efa8c73f2
.xword 0x575b72d6cc9f5b21
.xword 0x896a764c09d0311d
.xword 0x718d052c57c7ab8f
.xword 0x4b1ca96235840d1d
.xword 0xd152ac253f71e2dc




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
.xword 0x0ffd74c20dce7e1c
.xword 0xabb489997fbc9c96
.xword 0xdc6b73ec8a0e6fb8
.xword 0x68dca69d68ce9d16
.xword 0xb2592bb44d76570a
.xword 0x3425fe37f06fd299
.xword 0xa12154d2bde894df
.xword 0x64c9de6fc3010ab9




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
.xword 0x010890aef15d9f17
.xword 0x52b75dee9dc49816
.xword 0x270765b6e536188b
.xword 0x3dbe0abecc5e5592
.xword 0xe3216a548b99aa4d
.xword 0x08bb44b434a38437
.xword 0xe87251d76cbf5858
.xword 0xb738daa4a051aa45






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
.xword 0x28381f77577f48c8
.xword 0xb839c5814658e904
.xword 0x3ae35bd709d2795d
.xword 0xe1be6ffd423005b5
.xword 0xb59b4ce4bc18a349
.xword 0x34212b909fd3c3e5
.xword 0xd689a2260514199c
.xword 0xc708d545dd03715e




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
.xword 0x37b7efbafb2902e8
.xword 0x5069006b1a76faf5
.xword 0x86dcc920a0f7e114
.xword 0x9762ed02d434275b
.xword 0x6fb8bc850a9aab00
.xword 0x0c7bdb9de66c7749
.xword 0x333aa93acc00d2f8
.xword 0x1ce8f3787043e1eb




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
.xword 0xa245d4239b696c95
.xword 0xb81701b0a79629ae
.xword 0x20f8aba76e4775ac
.xword 0x2f99895ec7a1591d
.xword 0x2f487018727c1003
.xword 0x9e7862c04cf77287
.xword 0x3f31d14c0199a84f
.xword 0xd6a2cd837c3ef232




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
.xword 0x4902749f07787f38
.xword 0x68973a5ddf44fa7e
.xword 0x2ec1c68c9137a4b8
.xword 0x033f3a33dd35e824
.xword 0x72a5d835759ad799
.xword 0x61c72c3fb0c2fb63
.xword 0x6604ea1ef5bc5a23
.xword 0x666f674d4a0581c2




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
.xword 0x7aabf8a44bd4559a
.xword 0xf46c081360b56a17
.xword 0xe079f2a37a8ead18
.xword 0x54e9c7bd55571b2f
.xword 0x1a7b8d9377bf1b9f
.xword 0xf35eecfd27ecfce4
.xword 0xbdccbd1e4c5c5818
.xword 0x6733206ea0e03d4e




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
.xword 0x61d18d1b19276f9f
.xword 0x9f0772936c0b77f4
.xword 0x1abe388a074d46c6
.xword 0x2d09e5a223ee985f
.xword 0x5e9e0b5f0c5521f6
.xword 0xad38695dd665657a
.xword 0x5c0411880984ca50
.xword 0x1d034b3fefb4ee02




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
.xword 0x9efce456a57bd98e
.xword 0x542c51def4d0fe83
.xword 0x875a57bd43e7fb9d
.xword 0x3834dfc434fc9f09
.xword 0x1c784e5f85269c96
.xword 0xf3bd66f2bfa6cfed
.xword 0x51ba510216ecef5b
.xword 0xc1180621a60fe9b0




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
.xword 0xa36556381bcb72b5
.xword 0x548ed24d68a2f309
.xword 0x9225975470bd320c
.xword 0x011088653aff293d
.xword 0x268927ffb0702882
.xword 0x1f869adf6eafb4c8
.xword 0xab52962cd175fd2a
.xword 0xaa582af69073617f






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
.xword 0x61c29178c48894ec
.xword 0x8eccb3f594fe9c85
.xword 0xd7a4e48d3e43180f
.xword 0x8447da419e8c25db
.xword 0xc71e063ff874a45d
.xword 0xe9120cc14ea36903
.xword 0x75321a1e2cf6246d
.xword 0x2f91f87d93a611f1




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
.xword 0xe4580b9aaff46902
.xword 0x2f08f9a23a09deb4
.xword 0x03257fbea2ea40e4
.xword 0xdf6b1a2a928ca30d
.xword 0x0e02a0e70c02b9c6
.xword 0xe49b13ba346c7248
.xword 0x00a0a6ea9b2a65c0
.xword 0x3fc56ca69ac8cb3c




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
.xword 0xe1a2ba697ed360b5
.xword 0xd1646c49eae5c3c0
.xword 0x65d883fe8c83480b
.xword 0x08387c2283ac364e
.xword 0x5295a3b8a9969ac0
.xword 0x915257963ebe064d
.xword 0x555cdab7b32f789d
.xword 0x02749917b26bbd60




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
.xword 0x4a60e99fa5832963
.xword 0x964c2dbd5dd475d3
.xword 0x4d549b7f95687439
.xword 0x0bf682be9042712d
.xword 0xb9f4d81cb8027697
.xword 0x870cd109b0dd615e
.xword 0xa5902334a177a254
.xword 0xd80175c209ffa7e1




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
.xword 0xc555c76a0828fc41
.xword 0xc9156773e53a4c1d
.xword 0x334aa7d4875e98a6
.xword 0x0cd73517de8b62e7
.xword 0x462f00c343e44c0f
.xword 0x93d95b596d11fefd
.xword 0x9f68065e016ce6eb
.xword 0x874908d6d6f8010a




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
.xword 0x55210f6cf2bc063f
.xword 0x64ce09aff358d3db
.xword 0x0946427d482435db
.xword 0xc0e872c0a48a42a8
.xword 0xec640299250dbc84
.xword 0xe76e3266cc2ae3e0
.xword 0x1e34642ac59874ee
.xword 0xb0bc6ca33331c991




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
.xword 0x320a8dbe4b414a00
.xword 0x4cede883eebcebca
.xword 0xbd7c0ef54d312f1f
.xword 0x98ddeef46fdb5c67
.xword 0x25e43e756ba45cf7
.xword 0x45630b302abcf538
.xword 0xcbbe51a27209353a
.xword 0x9099cb2ab5338152




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
.xword 0xc8ee3dae701459d5
.xword 0x47ec189e0621b900
.xword 0xd1b4fdd64438f44b
.xword 0x64f1744b937f0fb5
.xword 0xb1a3070026d39295
.xword 0xe3a29830ff66efdb
.xword 0xad309f868888b920
.xword 0x8b6326254630a927






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
.xword 0xcff95ea1d52d4be2
.xword 0xb72fc15f407af5f7
.xword 0xc6a39226066b02f6
.xword 0x64692ffe81c03453
.xword 0x65e933ee516023c0
.xword 0x4b63b38ea39e0594
.xword 0x788337d1d2375d66
.xword 0xae0769d3ded7af97




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
.xword 0xfa932bc45d44df73
.xword 0x1c6a78bdb161c69e
.xword 0xcfa3108158945624
.xword 0x8a7b8db6e717a1de
.xword 0xf3ce10bedb0b72c7
.xword 0x9a45d067d5ac5cca
.xword 0x5c61505b68e65388
.xword 0x700ee161657cad75




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
.xword 0xdae6128fc4b269b3
.xword 0x8087e50dfe1af778
.xword 0x9e940bb5f57d46e7
.xword 0xf99aefb139103f56
.xword 0x27aefee9ccf89a0e
.xword 0x08e9935ac874bdc7
.xword 0x1350f282ba0014dd
.xword 0xa1ee4c9064f64b03




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
.xword 0x3cedd60821b9660f
.xword 0xe4f9ba790fb24429
.xword 0x6df99fdff318f2bf
.xword 0x43aa843a9a6c607c
.xword 0x5038ed8314efc834
.xword 0x74a49ecab87eefa1
.xword 0xf4ce7e9c219abfbe
.xword 0x311224cba488224b




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
.xword 0x7b097452dcf220ff
.xword 0x2a3502c4ce68d02a
.xword 0xec7a7c0a2e47211f
.xword 0x0071c1f6a66bb0d3
.xword 0x6756817464161dfe
.xword 0x8b2e3533d7ce4d61
.xword 0x14e65c969e5ffce0
.xword 0xc2d3cfd9cf9ea1b9




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
.xword 0x3a3af1dd1bb2d11a
.xword 0x6a22292974fc992f
.xword 0x9aff2d22a5568926
.xword 0x1687cd831a187ac0
.xword 0x2f85b97a56a85e08
.xword 0x804cced7c0366928
.xword 0xafcee389b199c0bb
.xword 0x32a25a8a988d0c23




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
.xword 0xdd9872fa730de648
.xword 0xb75dbb7a73f5d6e0
.xword 0x67c2447017bee79f
.xword 0x01f08b2fecf8e354
.xword 0x730c4da833db1f83
.xword 0x065b17051ea4eb80
.xword 0x2d322c05aba06751
.xword 0xf0b34bb614cdff5a




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
.xword 0x6b227b6248276bd6
.xword 0x1185bef9a542d476
.xword 0x33692fb53450ac5e
.xword 0x5660aeb171db0a20
.xword 0xbcb91d9cdc683c23
.xword 0xccf63b01f1f94e36
.xword 0x2cb2d160b06741a5
.xword 0x3071db8c353d60e7






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
.xword 0x1995f1523e830d33
.xword 0x3566d6c212b2099f
.xword 0x0c3ab3d670dfc657
.xword 0x451d9969828ea186
.xword 0xc274c81a0e85819d
.xword 0x7de5eb0c55e74089
.xword 0x6de6bd08ba321855
.xword 0xf62dc3e01087fe5e




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
.xword 0x85956e8792069276
.xword 0x6a635a38f6f039c7
.xword 0x7d733cd510b3067b
.xword 0x6aad373842b2e58b
.xword 0x3bd4aa7de68dbe64
.xword 0xc341eb0b5387c175
.xword 0x680e65ab2b8fc873
.xword 0x8abbae6a2636c481




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
.xword 0x4f6ba838b99d3b11
.xword 0x9268e7979ef4fe1a
.xword 0xb4b76facc46252ea
.xword 0xcbee1871a1ac8d06
.xword 0xd026b90084bc44ca
.xword 0xa18210469997940b
.xword 0xaa66fedd8f0c7b8d
.xword 0x01eef19d3fa349dd




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
.xword 0x2b05c254a9909b09
.xword 0x4dc2c7ff7ebe610f
.xword 0x6b4a01c8c11d5d64
.xword 0x73fa86198f01636f
.xword 0xa9d1d4c535198cb5
.xword 0x0aa1c6a0ed28f9fd
.xword 0x369767704566d3ae
.xword 0x390d8c7e03686a17




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
.xword 0x401510f00861b0d2
.xword 0x9a70b7db08d6e756
.xword 0x110fec8235cf104b
.xword 0x869b316de3c871a7
.xword 0xfa0f6c5c7bd03630
.xword 0x6a7b144a8d921d11
.xword 0x21008382fc4d785c
.xword 0xb84ad586de22eca4




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
.xword 0xebf319e394877abf
.xword 0x7136ba92fc028039
.xword 0xe173f11e28a4c2b7
.xword 0xdf128c3b392769ef
.xword 0xa4de2f6797b99087
.xword 0x3376c57dc2b5418e
.xword 0xe71a637a9814b5e6
.xword 0x7dc3488b282aa3db




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
.xword 0xbe66fe181a0874b5
.xword 0x982eaf423081ae17
.xword 0x5ff434bddf39de36
.xword 0xee9e6e7f2ce74bef
.xword 0x939bef01b25ff6bc
.xword 0xef2b6f53cfda7ab0
.xword 0xb0eefa138092b206
.xword 0xf336af00f7bfa3b7




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
.xword 0x639261c8b390c898
.xword 0xcac9a0a7adf22b55
.xword 0x86dd88dcc827a3fb
.xword 0x690f3bfcaeb8924a
.xword 0x4b1470eac6146e1c
.xword 0x5711ede499c43941
.xword 0x9accbb7d5db21a02
.xword 0xe53a7cef960d903f






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
.xword 0x63425ac0dfded386
.xword 0xf4d59e8b0bff7e41
.xword 0x0c4112b1a538e6ac
.xword 0xbcf0611e0543f51a
.xword 0x152b5d0d0dd20f52
.xword 0xcbc68fec785f75a9
.xword 0x2efa72a3fc885ded
.xword 0x2eec9ac7c65ae6e3




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
.xword 0xd472b066e0139d97
.xword 0x847c5f0a8654283e
.xword 0xc0c8f7026ce227f8
.xword 0xff030250b3200a7a
.xword 0x778694c57f4c7766
.xword 0x5553a35f7bbf3eda
.xword 0x3e835de22679cc13
.xword 0xbc9948c3d7646e70




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
.xword 0x7133cbc7dc68a6e2
.xword 0xb50649a82b65c768
.xword 0x66b803af4963f992
.xword 0x7609c07a54d6276c
.xword 0x0115b6ca8737448c
.xword 0x8bfba0227fc1d524
.xword 0x8e8e55256c175dcc
.xword 0x2b4eac9f4f823879




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
.xword 0x17e2fbe39db635d6
.xword 0x5e8c29d3958f70a9
.xword 0x010512005010ca2e
.xword 0x0256f57a98ce1325
.xword 0x9af9e201f3d45e10
.xword 0x8272ed397a7c013a
.xword 0x1241320d8b0e1cb4
.xword 0xa31e26071c7b731f




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
.xword 0x96d1a5a37f4a4769
.xword 0x24f69c738eabe144
.xword 0x696ef32463b71844
.xword 0x4bdc5940c5a1fe5c
.xword 0x003a52b449cddbd7
.xword 0x5915fc65033904e8
.xword 0xd5e79b0dc7827861
.xword 0xb63b837cb770541c




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
.xword 0x56e1ddffc3aa595c
.xword 0x7206d3949f8eac80
.xword 0xe6edfa863554231a
.xword 0x4a22a74a472ff6ad
.xword 0xc5c63d5e248a1b5f
.xword 0x51932f6f22012641
.xword 0xa9daf7069060b81f
.xword 0xb3671b022042bb6e




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
.xword 0xebb6598e1571db2d
.xword 0x1b1a9e677f6980c8
.xword 0x9282e5f6e76a045f
.xword 0x19552c3da5b892af
.xword 0xffc24569eeddf2b3
.xword 0xe07e580764dce244
.xword 0x75a33ef0fc0e9fd6
.xword 0x4fb99ecc2196c62a




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
.xword 0x408e05507fb9b24b
.xword 0x99a3da465e829fe2
.xword 0xc3bdc307d75bcd73
.xword 0x0707c712f7fc5bf0
.xword 0x32006d0967cbc8e9
.xword 0x3fd49733d4c3abe4
.xword 0xa5d3c76c53241171
.xword 0x8502bb7299730bce






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
.xword 0x6d1ca3653b6307d2
.xword 0x771941e813be3d95
.xword 0x99e5a062d4c866ad
.xword 0x4c0e502164d7a16d
.xword 0xaa7331bace989e94
.xword 0x6f70e026827ff62c
.xword 0xbad6a19f207e3cc6
.xword 0x5748b36c6ef39f6e




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
.xword 0xf485f653bd2af308
.xword 0x043805a15555e860
.xword 0x8c1ba4959b03a6ab
.xword 0xada575368196a3b2
.xword 0x5f6077d70fba1c41
.xword 0x17c6afb02696bd53
.xword 0xb14baef2f342f425
.xword 0xc4cec6aeaca34602




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
.xword 0x2a0bd8a4295b9684
.xword 0x7e6289c732e46eea
.xword 0x2df68eb9d2d1b9e4
.xword 0x72334f1bf88314a3
.xword 0x3f273a2987615333
.xword 0x55cf819e4a7082e3
.xword 0x26aabd3bc0588a5a
.xword 0x6fa972fb26433663




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
.xword 0x12b4db721ee1d0f2
.xword 0x1396cd9e6d0457b7
.xword 0x052052a23abc86c4
.xword 0x4fd4a4685d69bc19
.xword 0x729b0619488480fe
.xword 0xee064da666e3cbb2
.xword 0xac945da58768880b
.xword 0xc1ab6498b2f657b1




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
.xword 0x583b9cffd06c9b47
.xword 0xd90be6ef36744bdf
.xword 0xe8e89be0fd537cf5
.xword 0xcdae2fa4c0292ee6
.xword 0x0286e05e67a1fd4a
.xword 0x3802d4b6f36f48e3
.xword 0xf4be4d2b19a87ce3
.xword 0x57933fdbebb19fab




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
.xword 0xd96a4aafb923e9df
.xword 0xea1bf1f4d20f05aa
.xword 0x62ddb0f8dad798a7
.xword 0xefff47ab5f0319e3
.xword 0x22841a039486f66c
.xword 0xde5ee379cad4234e
.xword 0x024a95c8a5507533
.xword 0x140158746093202c




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
.xword 0x0f35fae007d090c2
.xword 0x056446f37d966714
.xword 0x33d7f51addfcfc81
.xword 0x8de4d0ba2f62e97b
.xword 0xc7147252c9790a2d
.xword 0xf1f2f450549c0c1b
.xword 0x76fb4eb0f6511124
.xword 0x353fb38f3818c586




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
.xword 0x4284acac896c81ea
.xword 0xae0869af68d94550
.xword 0x406819ec30847fb0
.xword 0x0b44d7be0fa1147d
.xword 0x6a26ed131a8cbee6
.xword 0x9f7be02e273a3bf7
.xword 0xf4b15a1bd36084af
.xword 0x90044073b0a3a1d6




#if 0
#endif
