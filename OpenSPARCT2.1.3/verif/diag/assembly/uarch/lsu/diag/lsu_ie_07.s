/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_07.s
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
	setx 0x326680eaa8417081, %g1, %r2
	setx 0xe1acdf6943b47bc7, %g1, %r3
	setx 0xc10cf323c1c5d8a1, %g1, %r4
	setx 0x4801483b29870438, %g1, %r5
	setx 0xe0e937417ff307e2, %g1, %r6
	setx 0xea23aa65c7c3ab3b, %g1, %r7
	setx 0xa6c9c9ecb51e0dd2, %g1, %r8

     mov %r2, %r1
CHANGE_PRIV0:
	ta	T_CHANGE_PRIV
CHANGE_R261:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP1:
	.word 0xc4be445a  ! 2: STDA_R	stda	%r2, [%r25 + %r26] 0x22
CP_ATM_QUAD_LD2:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 4: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xd11b001a  ! 5: LDDF_R	ldd	[%r12, %r26], %f8
	.word 0xd0b3901a  ! 7: STHA_R	stha	%r8, [%r14 + %r26] 0x80
CP_PST_PRI3:
	.word 0xd1ba991a  ! 9: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd11ae000  ! 10: LDDF_I	ldd	[%r11, 0x0000], %f8
	.word 0xd1a4d03a  ! 12: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd0fad01a  ! 13: SWAPA_R	swapa	%r8, [%r11 + %r26] 0x80
CP_AIUS4:
	.word 0xd097823a  ! 15: LDUHA_R	lduha	[%r30, %r26] 0x11, %r8
SET_TL1_5:
	ta	T_CHANGE_TO_TL1
CHANGE_R266:
	add	%r26,	%r27,	%r26
NC_BIS_NUC6:
	.word 0xd0ad44fa  ! 17: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xd0bcd13a  ! 19: STDA_R	stda	%r8, [%r19 + %r26] 0x89
NC_BIS_AIUP7:
	.word 0xc8b6445a  ! 21: STHA_R	stha	%r4, [%r25 + %r26] 0x22
	.word 0xd084111a  ! 23: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r8
	.word 0xd122a004  ! 24: STF_I	st	%f8, [0x0004, %r10]
SET_TL0_8:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI9:
	.word 0xccabdc5a  ! 26: STBA_R	stba	%r6, [%r15 + %r26] 0xe2
CP_PST_PRI10:
	.word 0xd1bb185a  ! 28: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd07a801a  ! 29: SWAP_R	swap	%r8, [%r10 + %r26]
NC_BIS_PRI11:
	.word 0xc4ab9d5a  ! 31: STBA_R	stba	%r2, [%r14 + %r26] 0xea
	.word 0xd1036004  ! 32: LDF_I	ld	[%r13, 0x0004], %f8
	.word 0xd0c4501a  ! 34: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r8
	.word 0xd102801a  ! 35: LDF_R	ld	[%r10, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS13:
	.word 0xd1bfc33a  ! 37: STDFA_R	stda	%f8, [%r26, %r31]
NC_PST_PRI14:
	.word 0xd1bb991a  ! 39: STDFA_R	stda	%f8, [%r26, %r14]
NC_BIS_SEC15:
	.word 0xd0f4dd7a  ! 41: STXA_R	stxa	%r8, [%r19 + %r26] 0xeb
	.word 0xd1a4d13a  ! 43: STFA_R	sta	%f8, [%r26, %r19]
NC_SHORT_FP_SEC16:
	.word 0xd1bcdb3a  ! 45: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0c4913a  ! 47: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
NC_BLK_SEc17:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 49: LDDFA_R	ldda	[%r19, %r26], %f0
SHORT_FP_PRI18:
	.word 0xd1bb1a1a  ! 51: STDFA_R	stda	%f8, [%r26, %r12]
NC_AIUS19:
	.word 0xd0afc23a  ! 53: STBA_R	stba	%r8, [%r31 + %r26] 0x11
	.word 0xd122a004  ! 54: STF_I	st	%f8, [0x0004, %r10]
BLK_PRI20:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 56: LDDFA_R	ldda	[%r13, %r26], %f16
CP_BIS_AIUP21:
	and	%r26,	%r28,	%r26
	.word 0xc4ae055a  ! 58: STBA_R	stba	%r2, [%r24 + %r26] 0x2a
	.word 0xd0cb901a  ! 60: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
CP_BIS_AIUS22:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 62: STDA_R	stda	%r2, [%r30 + %r26] 0x23
NC_PST_PRI23:
	.word 0xd1bbd81a  ! 64: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd1a3101a  ! 65: STFA_R	sta	%f8, [%r26, %r12]
	.word 0xd0ba901a  ! 66: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd102c01a  ! 67: LDF_R	ld	[%r11, %r26], %f8
	.word 0xd09cd03a  ! 69: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd0d4d03a  ! 71: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
NC_PST_PRI24:
	.word 0xd1bb995a  ! 73: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd082d05a  ! 74: LDUWA_R	lduwa	[%r11, %r26] 0x82, %r8
	.word 0xd0d4d13a  ! 76: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r8
	.word 0xd183101a  ! 77: LDFA_R	lda	[%r12, %r26], %f8
	.word 0xd0eb111a  ! 78: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x88
NC_BIS_SEC25:
	.word 0xccb4dc7a  ! 80: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
	.word 0xd094d03a  ! 82: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd09cd03a  ! 84: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd08c903a  ! 86: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd1a3d01a  ! 88: STFA_R	sta	%f8, [%r26, %r15]
	.word 0xd06aa007  ! 89: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
	.word 0xd182911a  ! 90: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd182915a  ! 91: LDFA_R	lda	[%r10, %r26], %f8
	.word 0xd11a801a  ! 92: LDDF_R	ldd	[%r10, %r26], %f8
NC_BIS_SEC26:
	.word 0xc4acdd7a  ! 94: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xd022801a  ! 95: STW_R	stw	%r8, [%r10 + %r26]
	.word 0xd1ba901a  ! 96: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd1a4903a  ! 98: STFA_R	sta	%f8, [%r26, %r18]
NC_AIUS27:
	.word 0xd09fc33a  ! 100: LDDA_R	ldda	[%r31, %r26] 0x19, %r8
	.word 0xd13ac01a  ! 101: STDF_R	std	%f8, [%r26, %r11]
	.word 0xd084d03a  ! 103: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
CP_BIS_NUC28:
	and	%r26,	%r28,	%r26
	.word 0xd0a504fa  ! 105: STWA_R	stwa	%r8, [%r20 + %r26] 0x27
	.word 0xd00a801a  ! 106: LDUB_R	ldub	[%r10 + %r26], %r8
	.word 0xd012a006  ! 107: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xd0d2d05a  ! 108: LDSHA_R	ldsha	[%r11, %r26] 0x82, %r8
CP_ATM_QUAD_LD29:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 110: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xd0d4913a  ! 112: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
	.word 0xd0a4511a  ! 114: STWA_R	stwa	%r8, [%r17 + %r26] 0x88
	.word 0xd0eb101a  ! 115: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
	.word 0xd093911a  ! 117: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
	.word 0xd0d4511a  ! 119: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r8
NC_BIS_AIUP30:
	.word 0xd0ae445a  ! 121: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xd1ba901a  ! 122: STDFA_R	stda	%f8, [%r26, %r10]
CP_NUC31:
	.word 0xd0a5009a  ! 124: STWA_R	stwa	%r8, [%r20 + %r26] 0x04
SET_TL1_32:
	ta	T_CHANGE_TO_TL1
CHANGE_R2633:
	add	%r26,	%r27,	%r26
NC_BIS_NUC33:
	.word 0xc4a544fa  ! 126: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xd1a4101a  ! 128: STFA_R	sta	%f8, [%r26, %r16]
	.word 0xd0ab501a  ! 129: STBA_R	stba	%r8, [%r13 + %r26] 0x80
NC_AIUP34:
	.word 0xd08e431a  ! 131: LDUBA_R	lduba	[%r25, %r26] 0x18, %r8
NC_AIUS35:
	.word 0xd097c23a  ! 133: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
CP_BIS_AIUS36:
	and	%r26,	%r28,	%r26
	.word 0xd0af847a  ! 135: STBA_R	stba	%r8, [%r30 + %r26] 0x23
NC_AIUP37:
	.word 0xd0f6431a  ! 137: STXA_R	stxa	%r8, [%r25 + %r26] 0x18
	.word 0xd0ab101a  ! 138: STBA_R	stba	%r8, [%r12 + %r26] 0x80
CP_BIS_NUC38:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 140: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xd184d03a  ! 142: LDFA_R	lda	[%r19, %r26], %f8
CP_NUC39:
	.word 0xd0c5009a  ! 144: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r8
	.word 0xd0ab101a  ! 145: STBA_R	stba	%r8, [%r12 + %r26] 0x80
NC_BLK_SEc40:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 147: STDFA_R	stda	%f16, [%r26, %r19]
SET_TL0_41:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI42:
	and	%r26,	%r28,	%r26
	.word 0xc4b35c5a  ! 149: STHA_R	stha	%r2, [%r13 + %r26] 0xe2
	.word 0xd0bc903a  ! 151: STDA_R	stda	%r8, [%r18 + %r26] 0x81
CHANGE_PRIV43:
	ta	T_CHANGE_PRIV
CHANGE_R2644:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP44:
	.word 0xc8ae455a  ! 153: STBA_R	stba	%r4, [%r25 + %r26] 0x2a
	.word 0xd13aa000  ! 154: STDF_I	std	%f8, [0x0000, %r10]
	.word 0xd0dcd03a  ! 156: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
WR_LEASI_45:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_46:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0c4903a  ! 159: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
	.word 0xd08cd03a  ! 161: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
NC_AIUP47:
	.word 0xd086431a  ! 163: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r8
NC_NUC48:
	.word 0xd0b5409a  ! 165: STHA_R	stha	%r8, [%r21 + %r26] 0x04
	.word 0xd083901a  ! 167: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
	.word 0xd02b6007  ! 168: STB_I	stb	%r8, [%r13 + 0x0007]
SHORT_FP_PRI49:
	.word 0xd1badb5a  ! 170: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd1ba911a  ! 171: STDFA_R	stda	%f8, [%r26, %r10]
NC_PST_PRI50:
	.word 0xd1bb989a  ! 173: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_NUC51:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 175: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
NC_BLK_SEc52:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 177: STDFA_R	stda	%f0, [%r26, %r19]
NC_BLK_SEc53:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 179: LDDFA_R	ldda	[%r19, %r26], %f16
CP_BIS_NUC54:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 181: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
	.word 0xd023001a  ! 182: STW_R	stw	%r8, [%r12 + %r26]
NC_BIS_AIUP55:
	.word 0xc8ae445a  ! 184: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xd00aa007  ! 185: LDUB_I	ldub	[%r10 + 0x0007], %r8
CP_PST_PRI56:
	.word 0xd1bb595a  ! 187: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd1e2e01a  ! 188: CASA_R	casa	[%r11] %asi, %r26, %r8
NC_BIS_AIUS57:
	.word 0xc4b7c57a  ! 190: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
	.word 0xd08c913a  ! 192: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd0bb501a  ! 193: STDA_R	stda	%r8, [%r13 + %r26] 0x80
NC_NUC58:
	.word 0xd085419a  ! 195: LDUWA_R	lduwa	[%r21, %r26] 0x0c, %r8
CP_AIUP59:
	.word 0xd0ce021a  ! 197: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r8
NC_BIS_AIUP60:
	.word 0xc4be445a  ! 199: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUS61:
	.word 0xccb7c47a  ! 201: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xd123401a  ! 202: STF_R	st	%f8, [%r26, %r13]
BLK_PRI62:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 204: LDDFA_R	ldda	[%r10, %r26], %f0
NC_SHORT_FP_SEC63:
	.word 0xd19cdb3a  ! 206: LDDFA_R	ldda	[%r19, %r26], %f8
SHORT_FP_PRI64:
	.word 0xd1ba9a1a  ! 208: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0dc903a  ! 210: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd084903a  ! 212: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd08cd13a  ! 214: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
NC_BLK_SEc65:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 216: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd07aa004  ! 217: SWAP_I	swap	%r8, [%r10 + 0x0004]
CP_BIS_AIUP66:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 219: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd0ccd13a  ! 221: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
CP_ATM_QUAD_LD67:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 223: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd094d13a  ! 225: LDUHA_R	lduha	[%r19, %r26] 0x89, %r8
CP_NUC68:
	.word 0xd0f5009a  ! 227: STXA_R	stxa	%r8, [%r20 + %r26] 0x04
NC_AIUP69:
	.word 0xd0de421a  ! 229: LDXA_R	ldxa	[%r25, %r26] 0x10, %r8
CHANGE_R2670:
	add	%r26,	%r27,	%r26
CP_BIS_SEC70:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 231: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
SET_TL1_71:
	ta	T_CHANGE_TO_TL1
CHANGE_R2672:
	add	%r26,	%r27,	%r26
NC_BIS_NUC72:
	.word 0xc4bd45fa  ! 233: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
	.word 0xd0dcd03a  ! 235: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
CP_AIUP73:
	.word 0xd086021a  ! 237: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r8
	.word 0xd1bcd03a  ! 239: STDFA_R	stda	%f8, [%r26, %r19]
NC_PST_PRI74:
	.word 0xd1bb989a  ! 241: STDFA_R	stda	%f8, [%r26, %r14]
CP_AIUS75:
	.word 0xd0c7833a  ! 243: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r8
NC_NUC76:
	.word 0xd1bd409a  ! 245: STDFA_R	stda	%f8, [%r26, %r21]
SET_TL0_77:
	ta	T_CHANGE_TO_TL0
CHANGE_R2678:
	mov	%g0,	%r26
NC_BIS_SEC78:
	.word 0xc8a4dc7a  ! 247: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xd072a000  ! 248: STX_I	stx	%r8, [%r10 + 0x0000]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC80:
	.word 0xd08d419a  ! 250: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r8
	.word 0xd102a004  ! 251: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xd02b2007  ! 252: STB_I	stb	%r8, [%r12 + 0x0007]
CP_AIUS81:
	.word 0xd0df823a  ! 254: LDXA_R	ldxa	[%r30, %r26] 0x11, %r8
SET_TL1_82:
	ta	T_CHANGE_TO_TL1
CHANGE_R2683:
	add	%r26,	%r27,	%r26
NC_BIS_NUC83:
	.word 0xc4a544fa  ! 256: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
SET_TL0_84:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI85:
	.word 0xc8f41c5a  ! 258: STXA_R	stxa	%r4, [%r16 + %r26] 0xe2
CHANGE_PRIV86:
	ta	T_CHANGE_PRIV
CHANGE_R2687:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD87:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 260: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
NC_AIUS88:
	.word 0xd0afc23a  ! 262: STBA_R	stba	%r8, [%r31 + %r26] 0x11
NC_BIS_AIUS89:
	.word 0xc8b7c47a  ! 264: STHA_R	stha	%r4, [%r31 + %r26] 0x23
NC_BIS_AIUP90:
	.word 0xccf6455a  ! 266: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
NC_BIS_AIUP91:
	.word 0xc8be445a  ! 268: STDA_R	stda	%r4, [%r25 + %r26] 0x22
NC_BIS_AIUS92:
	.word 0xccb7c47a  ! 270: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xd09cd03a  ! 272: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CP_BIS_AIUS93:
	and	%r26,	%r28,	%r26
	.word 0xd0a7847a  ! 274: STWA_R	stwa	%r8, [%r30 + %r26] 0x23
	.word 0xd0f4101a  ! 276: STXA_R	stxa	%r8, [%r16 + %r26] 0x80
	.word 0xd0ead01a  ! 277: LDSTUBA_R	ldstuba	%r8, [%r11 + %r26] 0x80
	.word 0xd0d4d03a  ! 279: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
	.word 0xd0ac913a  ! 281: STBA_R	stba	%r8, [%r18 + %r26] 0x89
CP_NUC94:
	.word 0xd0bd019a  ! 283: STDA_R	stda	%r8, [%r20 + %r26] 0x0c
	.word 0xd0a4903a  ! 285: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
CP_BIS_NUC95:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 287: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
	.word 0xd01ae000  ! 288: LDD_I	ldd	[%r11 + 0x0000], %r8
SHORT_FP_PRI96:
	.word 0xd19b1a1a  ! 290: LDDFA_R	ldda	[%r12, %r26], %f8
CP_BIS_NUC97:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 292: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
NC_PST_PRI98:
	.word 0xd1bb981a  ! 294: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd092d11a  ! 295: LDUHA_R	lduha	[%r11, %r26] 0x88, %r8
	.word 0xd0dc501a  ! 297: LDXA_R	ldxa	[%r17, %r26] 0x80, %r8
CP_BIS_QUAD_LD99:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 299: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
NC_AIUP100:
	.word 0xd096421a  ! 301: LDUHA_R	lduha	[%r25, %r26] 0x10, %r8
	.word 0xd0a3501a  ! 302: STWA_R	stwa	%r8, [%r13 + %r26] 0x80
NC_BIS_AIUP101:
	.word 0xcca6445a  ! 304: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
CHANGE_USER102:
	ta	T_CHANGE_NONPRIV
CHANGE_R26103:
	add	%r26,	%r27,	%r26
CP_BIS_PRI103:
	and	%r26,	%r28,	%r26
	.word 0xc4f29d5a  ! 306: STXA_R	stxa	%r2, [%r10 + %r26] 0xea
BLK_PRI104:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 308: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xd0acd03a  ! 310: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CHANGE_PRIV105:
	ta	T_CHANGE_PRIV
CHANGE_R26106:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP106:
	.word 0xc8be445a  ! 312: STDA_R	stda	%r4, [%r25 + %r26] 0x22
SHORT_FP_PRI107:
	.word 0xd1ba9b1a  ! 314: STDFA_R	stda	%f8, [%r26, %r10]
CP_PST_PRI108:
	.word 0xd1ba981a  ! 316: STDFA_R	stda	%f8, [%r26, %r10]
NC_AIUP109:
	.word 0xd096421a  ! 318: LDUHA_R	lduha	[%r25, %r26] 0x10, %r8
	.word 0xd02aa007  ! 319: STB_I	stb	%r8, [%r10 + 0x0007]
NC_PST_PRI110:
	.word 0xd1bc585a  ! 321: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0bbd01a  ! 323: STDA_R	stda	%r8, [%r15 + %r26] 0x80
	.word 0xd0a2901a  ! 324: STWA_R	stwa	%r8, [%r10 + %r26] 0x80
	.word 0xd0f4101a  ! 326: STXA_R	stxa	%r8, [%r16 + %r26] 0x80
	.word 0xd182901a  ! 327: LDFA_R	lda	[%r10, %r26], %f8
NC_BIS_AIUP111:
	.word 0xc8be455a  ! 329: STDA_R	stda	%r4, [%r25 + %r26] 0x2a
	.word 0xd03aa000  ! 330: STD_I	std	%r8, [%r10 + 0x0000]
CP_BIS_AIUP112:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 332: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
CP_BIS_AIUS113:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 334: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xd1bc903a  ! 336: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd08cd03a  ! 338: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
CHANGE_USER114:
	ta	T_CHANGE_NONPRIV
CHANGE_R26115:
	add	%r26,	%r27,	%r26
CP_BIS_PRI115:
	and	%r26,	%r28,	%r26
	.word 0xcc9adc5a  ! 340: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xd0acd03a  ! 342: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd084d03a  ! 344: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
SET_TL1_116:
	ta	T_CHANGE_TO_TL1
CHANGE_R26117:
	add	%r26,	%r27,	%r26
NC_BIS_NUC117:
	.word 0xc8a544fa  ! 346: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xd0b2911a  ! 347: STHA_R	stha	%r8, [%r10 + %r26] 0x88
	.word 0xd11a801a  ! 348: LDDF_R	ldd	[%r10, %r26], %f8
NC_BIS_AIUP118:
	.word 0xc8be445a  ! 350: STDA_R	stda	%r4, [%r25 + %r26] 0x22
	.word 0xd08c903a  ! 352: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
CP_BIS_AIUP119:
	and	%r26,	%r28,	%r26
	.word 0xd0b6055a  ! 354: STHA_R	stha	%r8, [%r24 + %r26] 0x2a
CP_AIUP120:
	.word 0xd1be021a  ! 357: STDFA_R	stda	%f8, [%r26, %r24]
	.word 0xd0f4d13a  ! 359: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD121:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 361: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
	.word 0xd002e004  ! 362: LDUW_I	lduw	[%r11 + 0x0004], %r8
	.word 0xd1bb901a  ! 364: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd05a801a  ! 365: LDX_R	ldx	[%r10 + %r26], %r8
NC_BIS_AIUS122:
	.word 0xc8f7c47a  ! 367: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
	.word 0xd1bcd03a  ! 369: STDFA_R	stda	%f8, [%r26, %r19]
NC_SHORT_FP_SEC123:
	.word 0xd1bcdb7a  ! 371: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd094501a  ! 373: LDUHA_R	lduha	[%r17, %r26] 0x80, %r8
	.word 0xd13a801a  ! 374: STDF_R	std	%f8, [%r26, %r10]
CP_BIS_QUAD_LD124:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 376: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_NUC125:
	.word 0xc4bd44fa  ! 378: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xd19c913a  ! 380: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd1bc903a  ! 382: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd19a901a  ! 383: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd1e2a01a  ! 384: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd0b4913a  ! 386: STHA_R	stha	%r8, [%r18 + %r26] 0x89
	.word 0xd184d13a  ! 388: LDFA_R	lda	[%r19, %r26], %f8
NC_AIUP126:
	.word 0xd1be421a  ! 390: STDFA_R	stda	%f8, [%r26, %r25]
	.word 0xd094d03a  ! 392: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
	.word 0xd094101a  ! 394: LDUHA_R	lduha	[%r16, %r26] 0x80, %r8
	.word 0xd11ae000  ! 395: LDDF_I	ldd	[%r11, 0x0000], %f8
	.word 0xd1e2a01a  ! 396: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd002e004  ! 397: LDUW_I	lduw	[%r11 + 0x0004], %r8
	.word 0xd0b4903a  ! 399: STHA_R	stha	%r8, [%r18 + %r26] 0x81
CP_NUC127:
	.word 0xd0b5009a  ! 401: STHA_R	stha	%r8, [%r20 + %r26] 0x04
	.word 0xd0dcd13a  ! 403: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
CP_ATM_QUAD_LD128:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 405: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
SET_TL0_129:
	ta	T_CHANGE_TO_TL0
CHANGE_R26130:
	mov	%g0,	%r26
NC_BIS_SEC130:
	.word 0xc4acdc7a  ! 407: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd183515a  ! 408: LDFA_R	lda	[%r13, %r26], %f8
	.word 0xd093901a  ! 410: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
	.word 0xd084501a  ! 412: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
	.word 0xd0dcd03a  ! 414: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
CHANGE_PRIV131:
	ta	T_CHANGE_PRIV
CHANGE_R26132:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS132:
	.word 0xc4f7c47a  ! 416: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd08ad05a  ! 417: LDUBA_R	lduba	[%r11, %r26] 0x82, %r8
	.word 0xd0ac903a  ! 419: STBA_R	stba	%r8, [%r18 + %r26] 0x81
SHORT_FP_PRI133:
	.word 0xd19a9a5a  ! 421: LDDFA_R	ldda	[%r10, %r26], %f8
CP_BIS_AIUS134:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 423: STBA_R	stba	%r2, [%r30 + %r26] 0x23
	.word 0xd0dc101a  ! 425: LDXA_R	ldxa	[%r16, %r26] 0x80, %r8
	.word 0xd0d4913a  ! 427: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
	.word 0xd184903a  ! 429: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0ab911a  ! 431: STBA_R	stba	%r8, [%r14 + %r26] 0x88
CP_BIS_NUC135:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 433: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
CP_NUC136:
	.word 0xd0d5009a  ! 435: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r8
CP_ATM_QUAD_LD137:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 437: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
	.word 0xd084501a  ! 439: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r8
CHANGE_CLE138:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0ab911a  ! 442: STBA_R	stba	%r8, [%r14 + %r26] 0x88
	.word 0xd1bc101a  ! 444: STDFA_R	stda	%f8, [%r26, %r16]
SET_TL1_139:
	ta	T_CHANGE_TO_TL1
CHANGE_R26140:
	add	%r26,	%r27,	%r26
NC_BIS_NUC140:
	.word 0xc8f544fa  ! 446: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
NC_NUC141:
	.word 0xd1bd409a  ! 448: STDFA_R	stda	%f8, [%r26, %r21]
NC_BIS_AIUP142:
	.word 0xc8f6455a  ! 450: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
CP_BIS_AIUP143:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 452: STDA_R	stda	%r2, [%r24 + %r26] 0x22
CP_BIS_AIUP144:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 454: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
NC_BIS_NUC145:
	.word 0xc4ad44fa  ! 456: STBA_R	stba	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUP146:
	.word 0xc4a6445a  ! 458: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xd1232004  ! 459: STF_I	st	%f8, [0x0004, %r12]
CP_BIS_NUC147:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 461: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xd093901a  ! 463: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
	.word 0xd183901a  ! 465: LDFA_R	lda	[%r14, %r26], %f8
NC_AIUP148:
	.word 0xd0be421a  ! 467: STDA_R	stda	%r8, [%r25 + %r26] 0x10
NC_NUC149:
	.word 0xd0d5409a  ! 469: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r8
CP_BIS_AIUP150:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 471: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xd00a801a  ! 472: LDUB_R	ldub	[%r10 + %r26], %r8
	.word 0xd183901a  ! 474: LDFA_R	lda	[%r14, %r26], %f8
	.word 0xd07b6004  ! 475: SWAP_I	swap	%r8, [%r13 + 0x0004]
CP_BIS_AIUP151:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 477: STDA_R	stda	%r4, [%r24 + %r26] 0x22
	.word 0xd0c3d11a  ! 480: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r8
NC_BIS_NUC152:
	.word 0xc4f545fa  ! 482: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
NC_BIS_AIUS153:
	.word 0xc8afc47a  ! 484: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CHANGE_R26154:
	add	%r26,	%r27,	%r26
CP_BIS_SEC154:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 486: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
	.word 0xd0a2901a  ! 487: STWA_R	stwa	%r8, [%r10 + %r26] 0x80
	.word 0xd03a801a  ! 488: STD_R	std	%r8, [%r10 + %r26]
	.word 0xd094903a  ! 490: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_PST_PRI155:
	.word 0xd1bb985a  ! 492: STDFA_R	stda	%f8, [%r26, %r14]
NC_PST_PRI156:
	.word 0xd1bb995a  ! 494: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd042a004  ! 495: LDSW_I	ldsw	[%r10 + 0x0004], %r8
BLK_PRI157:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 497: STDFA_R	stda	%f16, [%r26, %r13]
CP_ATM_QUAD_LD158:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 499: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_AIUS159:
	.word 0xd1bf823a  ! 501: STDFA_R	stda	%f8, [%r26, %r30]
	.word 0xd0d4913a  ! 503: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
NC_AIUS160:
	.word 0xd08fc23a  ! 505: LDUBA_R	lduba	[%r31, %r26] 0x11, %r8
CP_BIS_NUC161:
	and	%r26,	%r28,	%r26
	.word 0xd09d05fa  ! 507: LDDA_R	ldda	[%r20, %r26] 0x2f, %r8
	.word 0xd19cd03a  ! 509: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd1a4913a  ! 511: STFA_R	sta	%f8, [%r26, %r18]
CP_NUC162:
	.word 0xd1bd009a  ! 513: STDFA_R	stda	%f8, [%r26, %r20]
	.word 0xd0ac903a  ! 515: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd08c913a  ! 517: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
NC_BIS_AIUP163:
	.word 0xccb6455a  ! 519: STHA_R	stha	%r6, [%r25 + %r26] 0x2a
	.word 0xd1a4903a  ! 521: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd0b2d11a  ! 522: STHA_R	stha	%r8, [%r11 + %r26] 0x88
	.word 0xd01b001a  ! 523: LDD_R	ldd	[%r12 + %r26], %r8
	.word 0xd0f4903a  ! 525: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd0f4d03a  ! 527: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
NC_BIS_AIUP164:
	.word 0xd0b6455a  ! 529: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
SET_TL0_165:
	ta	T_CHANGE_TO_TL0
CHANGE_R26166:
	add	%r26,	%r27,	%r26
NC_BIS_SEC166:
	.word 0xc4a4dc7a  ! 532: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xd13b2000  ! 533: STDF_I	std	%f8, [0x0000, %r12]
CHANGE_PRIV167:
	ta	T_CHANGE_PRIV
CHANGE_R26168:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS168:
	.word 0xc4f7c57a  ! 535: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd06aa007  ! 536: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
	.word 0xd093911a  ! 538: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
	.word 0xd1a4903a  ! 540: STFA_R	sta	%f8, [%r26, %r18]
BLK_PRI169:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 542: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xd0ba901a  ! 543: STDA_R	stda	%r8, [%r10 + %r26] 0x80
SET_TL1_170:
	ta	T_CHANGE_TO_TL1
CHANGE_R26171:
	add	%r26,	%r27,	%r26
NC_BIS_NUC171:
	.word 0xc8a545fa  ! 545: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
NC_AIUP172:
	.word 0xd0d6431a  ! 547: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r8
BLK_PRI173:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 549: LDDFA_R	ldda	[%r13, %r26], %f0
NC_NUC174:
	.word 0xd095409a  ! 551: LDUHA_R	lduha	[%r21, %r26] 0x04, %r8
	.word 0xd0ead01a  ! 552: LDSTUBA_R	ldstuba	%r8, [%r11 + %r26] 0x80
NC_AIUS175:
	.word 0xd097c33a  ! 554: LDUHA_R	lduha	[%r31, %r26] 0x19, %r8
	.word 0xd11b001a  ! 555: LDDF_R	ldd	[%r12, %r26], %f8
SET_TL0_176:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI177:
	.word 0xc4f41d5a  ! 557: STXA_R	stxa	%r2, [%r16 + %r26] 0xea
	.word 0xd1e3201a  ! 558: CASA_R	casa	[%r12] %asi, %r26, %r8
CHANGE_R26178:
	add	%r26,	%r27,	%r26
CP_BIS_SEC178:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 560: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
	.word 0xd11aa000  ! 561: LDDF_I	ldd	[%r10, 0x0000], %f8
CHANGE_PRIV179:
	ta	T_CHANGE_PRIV
CHANGE_R26180:
	mov	%g0,	%r26
CP_BIS_NUC180:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 563: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xd1a2901a  ! 564: STFA_R	sta	%f8, [%r26, %r10]
CP_BIS_NUC181:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 566: STDA_R	stda	%r2, [%r20 + %r26] 0x27
CP_AIUP182:
	.word 0xd0be021a  ! 568: STDA_R	stda	%r8, [%r24 + %r26] 0x10
	.word 0xd0dcd13a  ! 570: LDXA_R	ldxa	[%r19, %r26] 0x89, %r8
	.word 0xd08c903a  ! 572: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
CP_BIS_AIUP183:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 574: STDA_R	stda	%r4, [%r24 + %r26] 0x22
NC_AIUP184:
	.word 0xd0be431a  ! 576: STDA_R	stda	%r8, [%r25 + %r26] 0x18
	.word 0xd184d03a  ! 578: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd05aa000  ! 579: LDX_I	ldx	[%r10 + 0x0000], %r8
	.word 0xd003001a  ! 580: LDUW_R	lduw	[%r12 + %r26], %r8
NC_BIS_AIUS185:
	.word 0xc4f7c57a  ! 582: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd1a2901a  ! 583: STFA_R	sta	%f8, [%r26, %r10]
BLK_PRI186:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 585: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xd1f2e01a  ! 586: CASXA_R	casxa	[%r11]%asi, %r26, %r8
NC_BIS_SEC187:
	.word 0xcca4dc7a  ! 588: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
NC_BIS_SEC188:
	.word 0xc8f4dd7a  ! 590: STXA_R	stxa	%r4, [%r19 + %r26] 0xeb
NC_BIS_SEC189:
	.word 0xc4f4dc7a  ! 592: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
NC_AIUP190:
	.word 0xd0d6421a  ! 594: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r8
NC_AIUS191:
	.word 0xd097c23a  ! 596: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
	.word 0xd0d4913a  ! 598: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
NC_NUC192:
	.word 0xd09d409a  ! 600: LDDA_R	ldda	[%r21, %r26] 0x04, %r8
CP_BIS_NUC193:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 602: STHA_R	stha	%r2, [%r20 + %r26] 0x27
SET_TL1_194:
	ta	T_CHANGE_TO_TL1
CHANGE_R26195:
	add	%r26,	%r27,	%r26
NC_BIS_NUC195:
	.word 0xc4a544fa  ! 604: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xd012a006  ! 605: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xd0dc913a  ! 607: LDXA_R	ldxa	[%r18, %r26] 0x89, %r8
CP_AIUP196:
	.word 0xd096021a  ! 609: LDUHA_R	lduha	[%r24, %r26] 0x10, %r8
CP_BIS_QUAD_LD197:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 611: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd0fa901a  ! 612: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x80
	.word 0xd1bb901a  ! 614: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd0a2d01a  ! 615: STWA_R	stwa	%r8, [%r11 + %r26] 0x80
CP_BIS_QUAD_LD198:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 617: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
CP_NUC199:
	.word 0xd0b5009a  ! 619: STHA_R	stha	%r8, [%r20 + %r26] 0x04
	.word 0xd11ac01a  ! 620: LDDF_R	ldd	[%r11, %r26], %f8
SHORT_FP_PRI200:
	.word 0xd19b5a1a  ! 622: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd0b4d03a  ! 624: STHA_R	stha	%r8, [%r19 + %r26] 0x81
CP_NUC201:
	.word 0xd1e5201a  ! 626: CASA_R	casa	[%r20] %asi, %r26, %r8
	.word 0xd11aa000  ! 627: LDDF_I	ldd	[%r10, 0x0000], %f8
CP_BIS_QUAD_LD202:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 629: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
SET_TL0_203:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI204:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 631: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS206:
	.word 0xd0c7823a  ! 633: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
	.word 0xd19a911a  ! 634: LDDFA_R	ldda	[%r10, %r26], %f8
CP_AIUP207:
	.word 0xd086031a  ! 636: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r8
	.word 0xd0d4903a  ! 638: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
SET_TL1_208:
	ta	T_CHANGE_TO_TL1
CHANGE_R26209:
	add	%r26,	%r27,	%r26
NC_BIS_NUC209:
	.word 0xc8bd44fa  ! 640: STDA_R	stda	%r4, [%r21 + %r26] 0x27
SET_TL0_210:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI211:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 642: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
	.word 0xd0cb901a  ! 644: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
BLK_PRI212:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 646: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xd08a915a  ! 647: LDUBA_R	lduba	[%r10, %r26] 0x8a, %r8
CHANGE_PRIV213:
	ta	T_CHANGE_PRIV
CHANGE_R26214:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS214:
	.word 0xc4afc57a  ! 649: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xd1bc903a  ! 651: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd0b4903a  ! 653: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	.word 0xd1a4101a  ! 655: STFA_R	sta	%f8, [%r26, %r16]
CHANGE_TLE215:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC217:
	.word 0xd0c5019a  ! 658: LDSWA_R	ldswa	[%r20, %r26] 0x0c, %r8
	.word 0xd0f4903a  ! 660: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd122a004  ! 661: STF_I	st	%f8, [0x0004, %r10]
SET_TL1_218:
	ta	T_CHANGE_TO_TL1
CHANGE_R26219:
	add	%r26,	%r27,	%r26
NC_BIS_NUC219:
	.word 0xccad45fa  ! 663: STBA_R	stba	%r6, [%r21 + %r26] 0x2f
	.word 0xd184d03a  ! 665: LDFA_R	lda	[%r19, %r26], %f8
NC_BIS_AIUP220:
	.word 0xc4ae445a  ! 667: STBA_R	stba	%r2, [%r25 + %r26] 0x22
CP_AIUP221:
	.word 0xd186021a  ! 669: LDFA_R	lda	[%r24, %r26], %f8
	.word 0xd053401a  ! 670: LDSH_R	ldsh	[%r13 + %r26], %r8
	.word 0xd0c3911a  ! 672: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r8
	.word 0xd0bc511a  ! 674: STDA_R	stda	%r8, [%r17 + %r26] 0x88
CP_NUC222:
	.word 0xd0c5019a  ! 676: LDSWA_R	ldswa	[%r20, %r26] 0x0c, %r8
	.word 0xd0b3111a  ! 677: STHA_R	stha	%r8, [%r12 + %r26] 0x88
	.word 0xd0cc903a  ! 679: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd012a006  ! 680: LDUH_I	lduh	[%r10 + 0x0006], %r8
	.word 0xd0ac501a  ! 682: STBA_R	stba	%r8, [%r17 + %r26] 0x80
SHORT_FP_PRI223:
	.word 0xd19a9b1a  ! 684: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd0d4d03a  ! 686: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
SET_TL0_224:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI225:
	and	%r26,	%r28,	%r26
	.word 0xc8aa9d5a  ! 688: STBA_R	stba	%r4, [%r10 + %r26] 0xea
	.word 0xd183d11a  ! 690: LDFA_R	lda	[%r15, %r26], %f8
	.word 0xd0cc903a  ! 692: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd0ac903a  ! 694: STBA_R	stba	%r8, [%r18 + %r26] 0x81
CHANGE_PRIV226:
	ta	T_CHANGE_PRIV
CHANGE_R26227:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP227:
	.word 0xccae455a  ! 696: STBA_R	stba	%r6, [%r25 + %r26] 0x2a
	.word 0xd08c903a  ! 698: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
CP_BIS_NUC228:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 700: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xd0c3901a  ! 702: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r8
CP_AIUP229:
	.word 0xd0d6031a  ! 704: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r8
CP_AIUP230:
	.word 0xd096021a  ! 706: LDUHA_R	lduha	[%r24, %r26] 0x10, %r8
	.word 0xd0bc903a  ! 708: STDA_R	stda	%r8, [%r18 + %r26] 0x81
	.word 0xd0d4d03a  ! 710: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
CP_BIS_NUC231:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 712: STDA_R	stda	%r2, [%r20 + %r26] 0x27
	.word 0xd0b4903a  ! 714: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_BIS_SEC232:
	.word 0xd0a4dc7a  ! 716: STWA_R	stwa	%r8, [%r19 + %r26] 0xe3
	.word 0xd0dc903a  ! 718: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
CP_AIUS233:
	.word 0xd097823a  ! 720: LDUHA_R	lduha	[%r30, %r26] 0x11, %r8
	.word 0xd09bd11a  ! 722: LDDA_R	ldda	[%r15, %r26] 0x88, %r8
	.word 0xd094d13a  ! 724: LDUHA_R	lduha	[%r19, %r26] 0x89, %r8
	.word 0xd09c913a  ! 726: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
CP_AIUP234:
	.word 0xd19e031a  ! 728: LDDFA_R	ldda	[%r24, %r26], %f8
NC_BIS_AIUS235:
	.word 0xc4bfc47a  ! 730: STDA_R	stda	%r2, [%r31 + %r26] 0x23
NC_BLK_SEc236:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 732: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0ab901a  ! 734: STBA_R	stba	%r8, [%r14 + %r26] 0x80
NC_BLK_SEc237:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 736: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_QUAD_LD238:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 738: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
CP_BIS_NUC239:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 740: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
CP_NUC240:
	.word 0xd0b5009a  ! 742: STHA_R	stha	%r8, [%r20 + %r26] 0x04
CP_AIUS241:
	.word 0xd1a7823a  ! 744: STFA_R	sta	%f8, [%r26, %r30]
CP_BIS_NUC242:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 746: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
CP_PST_PRI243:
	.word 0xd1bad89a  ! 748: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd0eb101a  ! 749: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
	.word 0xd0dc903a  ! 751: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
SHORT_FP_PRI244:
	.word 0xd1bb5b1a  ! 753: STDFA_R	stda	%f8, [%r26, %r13]
NC_AIUS245:
	.word 0xd087c23a  ! 755: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r8
	.word 0xd1a4913a  ! 757: STFA_R	sta	%f8, [%r26, %r18]
NC_BIS_AIUP246:
	.word 0xc4f6455a  ! 759: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
CP_PST_PRI247:
	.word 0xd1ba985a  ! 761: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0d3901a  ! 763: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
	.word 0xd08cd03a  ! 765: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd08c903a  ! 767: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd19c903a  ! 769: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd06a801a  ! 770: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
	.word 0xd1f2a01a  ! 771: CASXA_R	casxa	[%r10]%asi, %r26, %r8
CP_AIUP248:
	.word 0xd0be031a  ! 773: STDA_R	stda	%r8, [%r24 + %r26] 0x18
NC_AIUS249:
	.word 0xd1a7c23a  ! 775: STFA_R	sta	%f8, [%r26, %r31]
	.word 0xd0a4d13a  ! 777: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
	.word 0xd0f3d11a  ! 779: STXA_R	stxa	%r8, [%r15 + %r26] 0x88
	.word 0xd183111a  ! 780: LDFA_R	lda	[%r12, %r26], %f8
	.word 0xd05b401a  ! 781: LDX_R	ldx	[%r13 + %r26], %r8
NC_BIS_AIUS250:
	.word 0xc4f7c57a  ! 783: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
BLK_PRI251:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 785: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xd08bd01a  ! 787: LDUBA_R	lduba	[%r15, %r26] 0x80, %r8
CHANGE_R26252:
	mov	%g0,	%r26
CP_BIS_SEC252:
	and	%r26,	%r28,	%r26
	.word 0xc8a49d7a  ! 789: STWA_R	stwa	%r4, [%r18 + %r26] 0xeb
CP_BIS_QUAD_LD253:
	and	%r26,	%r29,	%r26
	.word 0xcc9add5a  ! 791: LDDA_R	ldda	[%r11, %r26] 0xea, %r6
	.word 0xd0f4111a  ! 793: STXA_R	stxa	%r8, [%r16 + %r26] 0x88
NC_BIS_AIUP254:
	.word 0xd0b6445a  ! 795: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xd1bb501a  ! 796: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd04b6007  ! 797: LDSB_I	ldsb	[%r13 + 0x0007], %r8
SHORT_FP_PRI255:
	.word 0xd1bb5a1a  ! 799: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd02aa007  ! 800: STB_I	stb	%r8, [%r10 + 0x0007]
	.word 0xd0db911a  ! 802: LDXA_R	ldxa	[%r14, %r26] 0x88, %r8
CP_ATM_QUAD_LD256:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 804: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xd084903a  ! 806: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CHANGE_USER257:
	ta	T_CHANGE_NONPRIV
CHANGE_R26258:
	add	%r26,	%r27,	%r26
NC_BIS_PRI258:
	.word 0xd0a45c5a  ! 808: STWA_R	stwa	%r8, [%r17 + %r26] 0xe2
	.word 0xd13ac01a  ! 809: STDF_R	std	%f8, [%r26, %r11]
	.word 0xd08cd03a  ! 811: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd11b2000  ! 812: LDDF_I	ldd	[%r12, 0x0000], %f8
CHANGE_PRIV259:
	ta	T_CHANGE_PRIV
CHANGE_R26260:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD260:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 814: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_BIS_AIUS261:
	and	%r26,	%r28,	%r26
	.word 0xc8f7857a  ! 816: STXA_R	stxa	%r4, [%r30 + %r26] 0x2b
NC_BIS_AIUP262:
	.word 0xc4f6445a  ! 818: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xd0cad05a  ! 819: LDSBA_R	ldsba	[%r11, %r26] 0x82, %r8
NC_BIS_SEC263:
	.word 0xc4acdc7a  ! 821: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
CHANGE_USER264:
	ta	T_CHANGE_NONPRIV
CHANGE_R26265:
	add	%r26,	%r27,	%r26
CP_BIS_PRI265:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 823: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
NC_BIS_SEC266:
	.word 0xccb4dc7a  ! 825: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
	.word 0xd0b4d03a  ! 827: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xd1e3601a  ! 828: CASA_R	casa	[%r13] %asi, %r26, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC268:
	.word 0xd0b5409a  ! 830: STHA_R	stha	%r8, [%r21 + %r26] 0x04
	.word 0xd00a801a  ! 831: LDUB_R	ldub	[%r10 + %r26], %r8
BLK_PRI269:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 833: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xd0bc913a  ! 835: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd1bc903a  ! 837: STDFA_R	stda	%f8, [%r26, %r18]
CHANGE_R26270:
	add	%r26,	%r27,	%r26
CP_BIS_SEC270:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 839: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
NC_PST_PRI271:
	.word 0xd1bbd91a  ! 841: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd06b001a  ! 842: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
	.word 0xd09c913a  ! 844: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
CHANGE_USER272:
	ta	T_CHANGE_NONPRIV
CHANGE_R26273:
	add	%r26,	%r27,	%r26
NC_BIS_PRI273:
	.word 0xc4b39d5a  ! 846: STHA_R	stha	%r2, [%r14 + %r26] 0xea
	.word 0xd19c913a  ! 848: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd0ab901a  ! 850: STBA_R	stba	%r8, [%r14 + %r26] 0x80
CP_BIS_PRI274:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 852: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
	.word 0xd0c4903a  ! 854: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC276:
	.word 0xd0cd009a  ! 856: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r8
	.word 0xd093911a  ! 858: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
WR_LEASI_277:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_278:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd094913a  ! 861: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd0532006  ! 862: LDSH_I	ldsh	[%r12 + 0x0006], %r8
	.word 0xd083901a  ! 864: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
CHANGE_USER279:
	ta	T_CHANGE_NONPRIV
CHANGE_R26280:
	mov	%g0,	%r26
NC_BIS_PRI280:
	.word 0xc4ac5d5a  ! 866: STBA_R	stba	%r2, [%r17 + %r26] 0xea
	.word 0xd08c101a  ! 868: LDUBA_R	lduba	[%r16, %r26] 0x80, %r8
	.word 0xd0acd03a  ! 870: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD281:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 872: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xd1f2a01a  ! 873: CASXA_R	casxa	[%r10]%asi, %r26, %r8
	.word 0xd09cd13a  ! 875: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS283:
	.word 0xd0bfc33a  ! 877: STDA_R	stda	%r8, [%r31 + %r26] 0x19
CHANGE_R26284:
	add	%r26,	%r27,	%r26
CP_BIS_SEC284:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 879: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
	.word 0xd1032004  ! 880: LDF_I	ld	[%r12, 0x0004], %f8
NC_BIS_AIUP285:
	.word 0xc4f6445a  ! 882: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_AIUS286:
	.word 0xd0cf833a  ! 884: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r8
	.word 0xd0bc903a  ! 886: STDA_R	stda	%r8, [%r18 + %r26] 0x81
	.word 0xd07ae004  ! 887: SWAP_I	swap	%r8, [%r11 + 0x0004]
	.word 0xd123001a  ! 888: STF_R	st	%f8, [%r26, %r12]
CP_BIS_NUC287:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 890: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xd084903a  ! 892: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd0bb911a  ! 894: STDA_R	stda	%r8, [%r14 + %r26] 0x88
	.word 0xd0dbd01a  ! 896: LDXA_R	ldxa	[%r15, %r26] 0x80, %r8
	.word 0xd09a911a  ! 897: LDDA_R	ldda	[%r10, %r26] 0x88, %r8
	.word 0xd19a915a  ! 898: LDDFA_R	ldda	[%r10, %r26], %f8
CHANGE_USER288:
	ta	T_CHANGE_NONPRIV
CHANGE_R26289:
	add	%r26,	%r27,	%r26
CP_BIS_PRI289:
	and	%r26,	%r28,	%r26
	.word 0xc8aa9c5a  ! 900: STBA_R	stba	%r4, [%r10 + %r26] 0xe2
NC_PST_PRI290:
	.word 0xd1bc181a  ! 902: STDFA_R	stda	%f8, [%r26, %r16]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC292:
	.word 0xd0bd419a  ! 904: STDA_R	stda	%r8, [%r21 + %r26] 0x0c
CP_BIS_AIUP293:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 906: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xd0a4903a  ! 908: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
NC_BIS_AIUS294:
	.word 0xc4a7c57a  ! 910: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
CHANGE_R26295:
	add	%r26,	%r27,	%r26
CP_BIS_SEC295:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 912: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
CHANGE_USER296:
	ta	T_CHANGE_NONPRIV
CHANGE_R26297:
	add	%r26,	%r27,	%r26
CP_BIS_PRI297:
	and	%r26,	%r28,	%r26
	.word 0xd0f29c5a  ! 914: STXA_R	stxa	%r8, [%r10 + %r26] 0xe2
CHANGE_PRIV298:
	ta	T_CHANGE_PRIV
CHANGE_R26299:
	add	%r26,	%r27,	%r26
CP_BIS_NUC299:
	and	%r26,	%r28,	%r26
	.word 0xd09d05fa  ! 916: LDDA_R	ldda	[%r20, %r26] 0x2f, %r8
	.word 0xd08c903a  ! 918: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd03ac01a  ! 919: STD_R	std	%r8, [%r11 + %r26]
	.word 0xd052c01a  ! 920: LDSH_R	ldsh	[%r11 + %r26], %r8
	.word 0xd0ea901a  ! 921: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
	.word 0xd0dcd03a  ! 923: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0a4903a  ! 925: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
	.word 0xd183d11a  ! 927: LDFA_R	lda	[%r15, %r26], %f8
	.word 0xd0f4903a  ! 929: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd0db901a  ! 931: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
	.word 0xd0c4d13a  ! 933: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
	.word 0xd1a2911a  ! 934: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd002a004  ! 935: LDUW_I	lduw	[%r10 + 0x0004], %r8
	.word 0xd082901a  ! 936: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r8
	.word 0xd1f3601a  ! 937: CASXA_R	casxa	[%r13]%asi, %r26, %r8
NC_BIS_AIUS300:
	.word 0xc8a7c47a  ! 939: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
	.word 0xd13b6000  ! 940: STDF_I	std	%f8, [0x0000, %r13]
	.word 0xd042801a  ! 941: LDSW_R	ldsw	[%r10 + %r26], %r8
	.word 0xd184903a  ! 943: LDFA_R	lda	[%r18, %r26], %f8
WR_LEASI_301:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_302:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUS303:
	.word 0xd0f7c33a  ! 946: STXA_R	stxa	%r8, [%r31 + %r26] 0x19
	.word 0xd0f4903a  ! 948: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd1a4d03a  ! 950: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd083901a  ! 952: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
CP_BIS_AIUP304:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 954: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
CP_BIS_AIUS305:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 956: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
	.word 0xd0d3105a  ! 957: LDSHA_R	ldsha	[%r12, %r26] 0x82, %r8
CP_BIS_NUC306:
	and	%r26,	%r28,	%r26
	.word 0xd0b504fa  ! 959: STHA_R	stha	%r8, [%r20 + %r26] 0x27
	.word 0xd0a4913a  ! 961: STWA_R	stwa	%r8, [%r18 + %r26] 0x89
	.word 0xd08c913a  ! 963: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
NC_NUC307:
	.word 0xd1bd419a  ! 965: STDFA_R	stda	%f8, [%r26, %r21]
NC_PST_PRI308:
	.word 0xd1bc589a  ! 967: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0f3901a  ! 969: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
	.word 0xd0acd03a  ! 971: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CP_AIUP309:
	.word 0xd0f6021a  ! 973: STXA_R	stxa	%r8, [%r24 + %r26] 0x10
CHANGE_USER310:
	ta	T_CHANGE_NONPRIV
CHANGE_R26311:
	mov	%g0,	%r26
CP_BIS_PRI311:
	and	%r26,	%r28,	%r26
	.word 0xc4a35d5a  ! 975: STWA_R	stwa	%r2, [%r13 + %r26] 0xea
CHANGE_PRIV312:
	ta	T_CHANGE_PRIV
CHANGE_R26313:
	add	%r26,	%r27,	%r26
CP_BIS_NUC313:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 977: STBA_R	stba	%r6, [%r20 + %r26] 0x27
NC_BIS_SEC314:
	.word 0xc8acdd7a  ! 979: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
NC_AIUP315:
	.word 0xd0f6431a  ! 981: STXA_R	stxa	%r8, [%r25 + %r26] 0x18
	.word 0xd0a4903a  ! 983: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
NC_SHORT_FP_SEC316:
	.word 0xd19cdb7a  ! 985: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd09c913a  ! 987: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd13b6000  ! 988: STDF_I	std	%f8, [0x0000, %r13]
	.word 0xd07b401a  ! 989: SWAP_R	swap	%r8, [%r13 + %r26]
	.word 0xd1a4d03a  ! 991: STFA_R	sta	%f8, [%r26, %r19]
CHANGE_USER317:
	ta	T_CHANGE_NONPRIV
CHANGE_R26318:
	add	%r26,	%r27,	%r26
NC_BIS_PRI318:
	.word 0xc4bc1c5a  ! 993: STDA_R	stda	%r2, [%r16 + %r26] 0xe2
SET_TL1_319:
	ta	T_CHANGE_TO_TL1
CHANGE_R26320:
	add	%r26,	%r27,	%r26
NC_BIS_NUC320:
	.word 0xc4bd44fa  ! 995: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xd06aa007  ! 996: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
	.word 0xd07aa004  ! 997: SWAP_I	swap	%r8, [%r10 + 0x0004]
NC_PST_PRI321:
	.word 0xd1bb999a  ! 999: STDFA_R	stda	%f8, [%r26, %r14]
NC_BIS_NUC322:
	.word 0xccb544fa  ! 1001: STHA_R	stha	%r6, [%r21 + %r26] 0x27
NC_PST_PRI323:
	.word 0xd1bc595a  ! 1003: STDFA_R	stda	%f8, [%r26, %r17]
NC_NUC324:
	.word 0xd0cd419a  ! 1005: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r8
	.word 0xd08cd03a  ! 1007: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd1036004  ! 1008: LDF_I	ld	[%r13, 0x0004], %f8
CP_BIS_NUC325:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1010: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
NC_BIS_AIUP326:
	.word 0xd0be445a  ! 1012: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CP_ATM_QUAD_LD327:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 1014: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
SET_TL0_328:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI329:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1017: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	.word 0xd1a4d13a  ! 1019: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd182911a  ! 1020: LDFA_R	lda	[%r10, %r26], %f8
NC_BIS_PRI330:
	.word 0xc4b39c5a  ! 1022: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC332:
	.word 0xd0bd009a  ! 1024: STDA_R	stda	%r8, [%r20 + %r26] 0x04
	.word 0xd0b4d03a  ! 1026: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xd102801a  ! 1027: LDF_R	ld	[%r10, %r26], %f8
NC_BIS_AIUP333:
	.word 0xc4be455a  ! 1029: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
CP_BIS_QUAD_LD334:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1031: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
NC_BIS_AIUS335:
	.word 0xc8b7c57a  ! 1033: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
	.word 0xd094903a  ! 1035: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_BLK_SEc336:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1037: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0d4903a  ! 1039: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd0c4d03a  ! 1041: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd0ba901a  ! 1042: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd11ac01a  ! 1043: LDDF_R	ldd	[%r11, %r26], %f8
	.word 0xd13a801a  ! 1044: STDF_R	std	%f8, [%r26, %r10]
	.word 0xd094913a  ! 1046: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd183105a  ! 1047: LDFA_R	lda	[%r12, %r26], %f8
NC_AIUS337:
	.word 0xd0cfc23a  ! 1049: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r8
	.word 0xd0b3901a  ! 1051: STHA_R	stha	%r8, [%r14 + %r26] 0x80
NC_BIS_SEC338:
	.word 0xcca4dc7a  ! 1053: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xd0d3911a  ! 1055: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r8
BLK_PRI339:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 1057: LDDFA_R	ldda	[%r13, %r26], %f16
SET_TL1_340:
	ta	T_CHANGE_TO_TL1
CHANGE_R26341:
	add	%r26,	%r27,	%r26
NC_BIS_NUC341:
	.word 0xc4a545fa  ! 1059: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
CP_BIS_AIUS342:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 1061: STBA_R	stba	%r2, [%r30 + %r26] 0x23
NC_BIS_AIUS343:
	.word 0xd0f7c47a  ! 1063: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
CP_AIUP344:
	.word 0xd19e021a  ! 1065: LDDFA_R	ldda	[%r24, %r26], %f8
	.word 0xd0a4101a  ! 1067: STWA_R	stwa	%r8, [%r16 + %r26] 0x80
	.word 0xd094111a  ! 1069: LDUHA_R	lduha	[%r16, %r26] 0x88, %r8
CP_ATM_QUAD_LD345:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 1071: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xd09b911a  ! 1073: LDDA_R	ldda	[%r14, %r26] 0x88, %r8
NC_BIS_AIUS346:
	.word 0xc4b7c47a  ! 1075: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xd084d03a  ! 1077: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd0aad01a  ! 1078: STBA_R	stba	%r8, [%r11 + %r26] 0x80
SET_TL0_347:
	ta	T_CHANGE_TO_TL0
WR_LEASI_348:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_349:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_PRIV350:
	ta	T_CHANGE_PRIV
CHANGE_R26351:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS351:
	.word 0xc4f7c47a  ! 1081: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xd0cc903a  ! 1083: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd00b401a  ! 1084: LDUB_R	ldub	[%r13 + %r26], %r8
CP_ATM_QUAD_LD352:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 1086: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
	.word 0xd0fa911a  ! 1087: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x88
	.word 0xd184d03a  ! 1089: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd09b911a  ! 1091: LDDA_R	ldda	[%r14, %r26] 0x88, %r8
	.word 0xd1e2a01a  ! 1092: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd0b4501a  ! 1094: STHA_R	stha	%r8, [%r17 + %r26] 0x80
NC_BIS_AIUP353:
	.word 0xccf6445a  ! 1096: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xd1bc511a  ! 1098: STDFA_R	stda	%f8, [%r26, %r17]
SHORT_FP_PRI354:
	.word 0xd1ba9b5a  ! 1100: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd084903a  ! 1102: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CP_BIS_NUC355:
	and	%r26,	%r28,	%r26
	.word 0xccad05fa  ! 1104: STBA_R	stba	%r6, [%r20 + %r26] 0x2f
	.word 0xd09cd03a  ! 1106: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
SET_TL1_356:
	ta	T_CHANGE_TO_TL1
CHANGE_R26357:
	add	%r26,	%r27,	%r26
NC_BIS_NUC357:
	.word 0xc8a544fa  ! 1108: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
SHORT_FP_PRI358:
	.word 0xd19a9a1a  ! 1110: LDDFA_R	ldda	[%r10, %r26], %f8
NC_BIS_AIUS359:
	.word 0xd0f7c47a  ! 1112: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xd0c3d01a  ! 1114: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r8
	.word 0xd1a4d03a  ! 1116: STFA_R	sta	%f8, [%r26, %r19]
SHORT_FP_PRI360:
	.word 0xd19b1a5a  ! 1118: LDDFA_R	ldda	[%r12, %r26], %f8
CP_NUC361:
	.word 0xd0c5009a  ! 1120: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r8
SET_TL0_362:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI363:
	and	%r26,	%r28,	%r26
	.word 0xc4aadc5a  ! 1122: STBA_R	stba	%r2, [%r11 + %r26] 0xe2
	.word 0xd04b401a  ! 1123: LDSB_R	ldsb	[%r13 + %r26], %r8
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS365:
	.word 0xd19fc23a  ! 1125: LDDFA_R	ldda	[%r31, %r26], %f8
SET_TL1_366:
	ta	T_CHANGE_TO_TL1
CHANGE_R26367:
	add	%r26,	%r27,	%r26
NC_BIS_NUC367:
	.word 0xd0ad45fa  ! 1127: STBA_R	stba	%r8, [%r21 + %r26] 0x2f
NC_PST_PRI368:
	.word 0xd1bc199a  ! 1129: STDFA_R	stda	%f8, [%r26, %r16]
	.word 0xd0c4d03a  ! 1131: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd1a3101a  ! 1132: STFA_R	sta	%f8, [%r26, %r12]
SET_TL0_369:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI370:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 1134: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	.word 0xd0a2901a  ! 1135: STWA_R	stwa	%r8, [%r10 + %r26] 0x80
	.word 0xd09ad01a  ! 1136: LDDA_R	ldda	[%r11, %r26] 0x80, %r8
NC_BLK_SEc371:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1138: LDDFA_R	ldda	[%r19, %r26], %f0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC373:
	.word 0xd0ad409a  ! 1140: STBA_R	stba	%r8, [%r21 + %r26] 0x04
	.word 0xd0dc913a  ! 1142: LDXA_R	ldxa	[%r18, %r26] 0x89, %r8
	.word 0xd06b2007  ! 1143: LDSTUB_I	ldstub	%r8, [%r12 + 0x0007]
	.word 0xd0ccd13a  ! 1145: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
NC_BIS_SEC374:
	.word 0xc4a4dd7a  ! 1147: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
NC_AIUS375:
	.word 0xd0d7c33a  ! 1149: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r8
CHANGE_R26376:
	add	%r26,	%r27,	%r26
CP_BIS_SEC376:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 1151: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xd1a4511a  ! 1153: STFA_R	sta	%f8, [%r26, %r17]
NC_AIUP377:
	.word 0xd0f6421a  ! 1155: STXA_R	stxa	%r8, [%r25 + %r26] 0x10
CP_NUC378:
	.word 0xd08d019a  ! 1157: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r8
WR_LEASI_379:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_380:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_ATM_QUAD_LD381:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1160: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xd0dc903a  ! 1162: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd0d4903a  ! 1164: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd0732000  ! 1165: STX_I	stx	%r8, [%r12 + 0x0000]
SHORT_FP_PRI382:
	.word 0xd19b1b1a  ! 1167: LDDFA_R	ldda	[%r12, %r26], %f8
CHANGE_USER383:
	ta	T_CHANGE_NONPRIV
CHANGE_R26384:
	add	%r26,	%r27,	%r26
NC_BIS_PRI384:
	.word 0xc8bc1c5a  ! 1169: STDA_R	stda	%r4, [%r16 + %r26] 0xe2
	.word 0xd0cc101a  ! 1171: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP386:
	.word 0xd0d6031a  ! 1173: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r8
	.word 0xd0d4101a  ! 1175: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r8
CP_AIUS387:
	.word 0xd0df823a  ! 1177: LDXA_R	ldxa	[%r30, %r26] 0x11, %r8
CP_BIS_AIUP388:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 1179: STHA_R	stha	%r8, [%r24 + %r26] 0x22
	.word 0xd0fb511a  ! 1180: SWAPA_R	swapa	%r8, [%r13 + %r26] 0x88
NC_BIS_AIUS389:
	.word 0xc4f7c57a  ! 1182: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
CP_BIS_AIUP390:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 1184: STHA_R	stha	%r2, [%r24 + %r26] 0x22
	.word 0xd1bb111a  ! 1185: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd19b911a  ! 1187: LDDFA_R	ldda	[%r14, %r26], %f8
NC_BIS_SEC391:
	.word 0xd0a4dd7a  ! 1189: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	.word 0xd0bcd13a  ! 1191: STDA_R	stda	%r8, [%r19 + %r26] 0x89
NC_AIUS392:
	.word 0xd0a7c23a  ! 1193: STWA_R	stwa	%r8, [%r31 + %r26] 0x11
	.word 0xd0ac913a  ! 1195: STBA_R	stba	%r8, [%r18 + %r26] 0x89
	.word 0xd00b001a  ! 1196: LDUB_R	ldub	[%r12 + %r26], %r8
	.word 0xd08cd13a  ! 1198: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
	.word 0xd0ac913a  ! 1200: STBA_R	stba	%r8, [%r18 + %r26] 0x89
CP_PST_PRI393:
	.word 0xd1ba981a  ! 1202: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0a3d01a  ! 1204: STWA_R	stwa	%r8, [%r15 + %r26] 0x80
CP_AIUP394:
	.word 0xd0be031a  ! 1206: STDA_R	stda	%r8, [%r24 + %r26] 0x18
	.word 0xd0b4903a  ! 1208: STHA_R	stha	%r8, [%r18 + %r26] 0x81
CP_BIS_AIUS395:
	and	%r26,	%r28,	%r26
	.word 0xd0a7857a  ! 1210: STWA_R	stwa	%r8, [%r30 + %r26] 0x2b
NC_BIS_AIUS396:
	.word 0xc8afc47a  ! 1212: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CP_BIS_AIUS397:
	and	%r26,	%r28,	%r26
	.word 0xc8bf857a  ! 1214: STDA_R	stda	%r4, [%r30 + %r26] 0x2b
NC_BIS_SEC398:
	.word 0xd0a4dd7a  ! 1216: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
NC_BIS_AIUS399:
	.word 0xccafc47a  ! 1218: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xd11aa000  ! 1219: LDDF_I	ldd	[%r10, 0x0000], %f8
	.word 0xd0c4913a  ! 1221: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd09c913a  ! 1223: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
BLK_PRI400:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1225: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd1236004  ! 1226: STF_I	st	%f8, [0x0004, %r13]
	.word 0xd0bc903a  ! 1228: STDA_R	stda	%r8, [%r18 + %r26] 0x81
WR_LEASI_401:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_402:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BLK_SEc403:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1231: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd1bc903a  ! 1233: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd0a4913a  ! 1235: STWA_R	stwa	%r8, [%r18 + %r26] 0x89
NC_BIS_AIUS404:
	.word 0xc4a7c57a  ! 1237: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
	.word 0xd09c511a  ! 1239: LDDA_R	ldda	[%r17, %r26] 0x88, %r8
	.word 0xd102c01a  ! 1240: LDF_R	ld	[%r11, %r26], %f8
	.word 0xd1a3d01a  ! 1242: STFA_R	sta	%f8, [%r26, %r15]
NC_BIS_AIUP405:
	.word 0xc4be445a  ! 1244: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xd0f4d03a  ! 1246: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
	.word 0xd184903a  ! 1248: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd103401a  ! 1249: LDF_R	ld	[%r13, %r26], %f8
	.word 0xd093d01a  ! 1251: LDUHA_R	lduha	[%r15, %r26] 0x80, %r8
	.word 0xd0dc903a  ! 1253: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
NC_AIUS406:
	.word 0xd0afc33a  ! 1255: STBA_R	stba	%r8, [%r31 + %r26] 0x19
	.word 0xd0d4903a  ! 1257: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
CP_BIS_NUC407:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 1259: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
BLK_PRI408:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1261: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd1a3501a  ! 1262: STFA_R	sta	%f8, [%r26, %r13]
	.word 0xd093515a  ! 1263: LDUHA_R	lduha	[%r13, %r26] 0x8a, %r8
	.word 0xd11b2000  ! 1264: LDDF_I	ldd	[%r12, 0x0000], %f8
	.word 0xd184d03a  ! 1266: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd1f3201a  ! 1267: CASXA_R	casxa	[%r12]%asi, %r26, %r8
	.word 0xd0acd03a  ! 1269: STBA_R	stba	%r8, [%r19 + %r26] 0x81
NC_NUC409:
	.word 0xd0c5409a  ! 1271: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r8
	.word 0xd19cd03a  ! 1273: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd094913a  ! 1275: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd084913a  ! 1277: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r8
NC_AIUP410:
	.word 0xd0de421a  ! 1279: LDXA_R	ldxa	[%r25, %r26] 0x10, %r8
	.word 0xd0cb901a  ! 1281: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
	.word 0xd073001a  ! 1282: STX_R	stx	%r8, [%r12 + %r26]
	.word 0xd094913a  ! 1284: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
CP_PST_PRI411:
	.word 0xd1ba989a  ! 1286: STDFA_R	stda	%f8, [%r26, %r10]
CP_NUC412:
	.word 0xd1f5201a  ! 1288: CASXA_R	casxa	[%r20]%asi, %r26, %r8
	.word 0xd06b401a  ! 1289: LDSTUB_R	ldstub	%r8, [%r13 + %r26]
	.word 0xd1a4d03a  ! 1291: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd0b2d11a  ! 1292: STHA_R	stha	%r8, [%r11 + %r26] 0x88
SET_TL1_413:
	ta	T_CHANGE_TO_TL1
CHANGE_R26414:
	add	%r26,	%r27,	%r26
NC_BIS_NUC414:
	.word 0xd0b545fa  ! 1294: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
CP_AIUP415:
	.word 0xd0d6021a  ! 1296: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r8
CP_BIS_QUAD_LD416:
	and	%r26,	%r29,	%r26
	.word 0xd09b5d5a  ! 1298: LDDA_R	ldda	[%r13, %r26] 0xea, %r8
	.word 0xd083111a  ! 1299: LDUWA_R	lduwa	[%r12, %r26] 0x88, %r8
NC_BLK_SEc417:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1301: LDDFA_R	ldda	[%r19, %r26], %f16
CP_PST_PRI418:
	.word 0xd1ba981a  ! 1303: STDFA_R	stda	%f8, [%r26, %r10]
NC_BIS_AIUP419:
	.word 0xc4b6445a  ! 1305: STHA_R	stha	%r2, [%r25 + %r26] 0x22
NC_AIUS420:
	.word 0xd1bfc23a  ! 1307: STDFA_R	stda	%f8, [%r26, %r31]
	.word 0xd032c01a  ! 1308: STH_R	sth	%r8, [%r11 + %r26]
	.word 0xd0b3501a  ! 1309: STHA_R	stha	%r8, [%r13 + %r26] 0x80
NC_NUC421:
	.word 0xd0c5409a  ! 1311: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r8
	.word 0xd0bb101a  ! 1312: STDA_R	stda	%r8, [%r12 + %r26] 0x80
NC_BLK_SEc422:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1314: STDFA_R	stda	%f16, [%r26, %r19]
NC_BIS_AIUS423:
	.word 0xccf7c47a  ! 1316: STXA_R	stxa	%r6, [%r31 + %r26] 0x23
CP_AIUS424:
	.word 0xd087833a  ! 1318: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r8
	.word 0xd0bb901a  ! 1320: STDA_R	stda	%r8, [%r14 + %r26] 0x80
SET_TL0_425:
	ta	T_CHANGE_TO_TL0
WR_LEASI_426:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_427:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP429:
	.word 0xd09e421a  ! 1323: LDDA_R	ldda	[%r25, %r26] 0x10, %r8
NC_BIS_AIUP430:
	.word 0xccf6445a  ! 1325: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
SET_TL1_431:
	ta	T_CHANGE_TO_TL1
CHANGE_R26432:
	mov	%g0,	%r26
NC_BIS_NUC432:
	.word 0xccf544fa  ! 1327: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
	.word 0xd19b101a  ! 1328: LDDFA_R	ldda	[%r12, %r26], %f8
	.word 0xd002e004  ! 1329: LDUW_I	lduw	[%r11 + 0x0004], %r8
CP_BIS_NUC433:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 1331: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xd08b911a  ! 1333: LDUBA_R	lduba	[%r14, %r26] 0x88, %r8
NC_BIS_AIUS434:
	.word 0xd0afc47a  ! 1335: STBA_R	stba	%r8, [%r31 + %r26] 0x23
NC_BIS_AIUS435:
	.word 0xd0afc47a  ! 1337: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xd0c3901a  ! 1339: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r8
NC_BLK_SEc436:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1341: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUS437:
	.word 0xc4f7c57a  ! 1343: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd092905a  ! 1344: LDUHA_R	lduha	[%r10, %r26] 0x82, %r8
NC_BIS_AIUS438:
	.word 0xc8afc57a  ! 1346: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
	.word 0xd0ba901a  ! 1347: STDA_R	stda	%r8, [%r10 + %r26] 0x80
NC_BLK_SEc439:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1349: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_QUAD_LD440:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 1351: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
CP_AIUS441:
	.word 0xd0cf833a  ! 1353: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r8
SET_TL0_442:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI443:
	.word 0xc4f45d5a  ! 1355: STXA_R	stxa	%r2, [%r17 + %r26] 0xea
	.word 0xd0f4d03a  ! 1357: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
CHANGE_PRIV444:
	ta	T_CHANGE_PRIV
CHANGE_R26445:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP445:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1359: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
NC_SHORT_FP_SEC446:
	.word 0xd19cda3a  ! 1361: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd13ae000  ! 1362: STDF_I	std	%f8, [0x0000, %r11]
	.word 0xd0b4913a  ! 1364: STHA_R	stha	%r8, [%r18 + %r26] 0x89
	.word 0xd1bcd13a  ! 1366: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd184903a  ! 1368: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0d4d03a  ! 1370: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
SHORT_FP_PRI447:
	.word 0xd19a9a1a  ! 1372: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd0bbd11a  ! 1374: STDA_R	stda	%r8, [%r15 + %r26] 0x88
	.word 0xd07b401a  ! 1375: SWAP_R	swap	%r8, [%r13 + %r26]
	.word 0xd07b2004  ! 1376: SWAP_I	swap	%r8, [%r12 + 0x0004]
NC_NUC448:
	.word 0xd0a5409a  ! 1378: STWA_R	stwa	%r8, [%r21 + %r26] 0x04
	.word 0xd0bcd13a  ! 1380: STDA_R	stda	%r8, [%r19 + %r26] 0x89
	.word 0xd19a911a  ! 1381: LDDFA_R	ldda	[%r10, %r26], %f8
CP_BIS_NUC449:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 1383: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
BLK_PRI450:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1385: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd06b001a  ! 1386: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
	.word 0xd1a4d03a  ! 1388: STFA_R	sta	%f8, [%r26, %r19]
NC_AIUP451:
	.word 0xd19e421a  ! 1390: LDDFA_R	ldda	[%r25, %r26], %f8
	.word 0xd0dcd03a  ! 1392: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0b4d03a  ! 1394: STHA_R	stha	%r8, [%r19 + %r26] 0x81
NC_BIS_AIUP452:
	.word 0xc4a6455a  ! 1396: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
NC_BLK_SEc453:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1398: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_AIUP454:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 1400: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CP_NUC455:
	.word 0xd1bd009a  ! 1402: STDFA_R	stda	%f8, [%r26, %r20]
	.word 0xd1a4903a  ! 1404: STFA_R	sta	%f8, [%r26, %r18]
CP_PST_PRI456:
	.word 0xd1bb181a  ! 1406: STDFA_R	stda	%f8, [%r26, %r12]
NC_BLK_SEc457:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1408: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_USER458:
	ta	T_CHANGE_NONPRIV
CHANGE_R26459:
	add	%r26,	%r27,	%r26
NC_BIS_PRI459:
	.word 0xc4bbdc5a  ! 1410: STDA_R	stda	%r2, [%r15 + %r26] 0xe2
CP_BIS_QUAD_LD460:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 1412: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xd11ae000  ! 1413: LDDF_I	ldd	[%r11, 0x0000], %f8
CHANGE_PRIV461:
	ta	T_CHANGE_PRIV
CHANGE_R26462:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP462:
	.word 0xc4f6445a  ! 1415: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
SET_TL1_463:
	ta	T_CHANGE_TO_TL1
CHANGE_R26464:
	add	%r26,	%r27,	%r26
NC_BIS_NUC464:
	.word 0xc8f545fa  ! 1417: STXA_R	stxa	%r4, [%r21 + %r26] 0x2f
SET_TL0_465:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI466:
	and	%r26,	%r28,	%r26
	.word 0xcca31c5a  ! 1419: STWA_R	stwa	%r6, [%r12 + %r26] 0xe2
	.word 0xd0ccd03a  ! 1421: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
	.word 0xd19c903a  ! 1423: LDDFA_R	ldda	[%r18, %r26], %f8
CHANGE_PRIV467:
	ta	T_CHANGE_PRIV
CHANGE_R26468:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP468:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 1425: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
	.word 0xd0cc511a  ! 1427: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r8
	.word 0xd083911a  ! 1429: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r8
	.word 0xd0f2901a  ! 1430: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
CP_ATM_QUAD_LD469:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 1432: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
NC_BIS_AIUP470:
	.word 0xc4b6455a  ! 1434: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
	.word 0xd06b001a  ! 1435: LDSTUB_R	ldstub	%r8, [%r12 + %r26]
	.word 0xd09c913a  ! 1437: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
NC_SHORT_FP_SEC471:
	.word 0xd1bcda3a  ! 1439: STDFA_R	stda	%f8, [%r26, %r19]
NC_BIS_AIUS472:
	.word 0xd0b7c57a  ! 1441: STHA_R	stha	%r8, [%r31 + %r26] 0x2b
NC_BIS_AIUP473:
	.word 0xc4b6455a  ! 1443: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
CP_AIUS474:
	.word 0xd0d7823a  ! 1445: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r8
CHANGE_USER475:
	ta	T_CHANGE_NONPRIV
CHANGE_R26476:
	add	%r26,	%r27,	%r26
CP_BIS_PRI476:
	and	%r26,	%r28,	%r26
	.word 0xccf29c5a  ! 1447: STXA_R	stxa	%r6, [%r10 + %r26] 0xe2
	.word 0xd092911a  ! 1448: LDUHA_R	lduha	[%r10, %r26] 0x88, %r8
	.word 0xd0ccd13a  ! 1450: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r8
BLK_PRI477:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1452: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xd084d03a  ! 1454: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
NC_PST_PRI478:
	.word 0xd1bbd81a  ! 1456: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd023001a  ! 1457: STW_R	stw	%r8, [%r12 + %r26]
	.word 0xd102a004  ! 1458: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xd03b001a  ! 1459: STD_R	std	%r8, [%r12 + %r26]
	.word 0xd08bd01a  ! 1461: LDUBA_R	lduba	[%r15, %r26] 0x80, %r8
SET_TL1_479:
	ta	T_CHANGE_TO_TL1
CHANGE_R26480:
	add	%r26,	%r27,	%r26
NC_BIS_NUC480:
	.word 0xccb545fa  ! 1463: STHA_R	stha	%r6, [%r21 + %r26] 0x2f
	.word 0xd19ad01a  ! 1464: LDDFA_R	ldda	[%r11, %r26], %f8
	.word 0xd094101a  ! 1466: LDUHA_R	lduha	[%r16, %r26] 0x80, %r8
CP_AIUS481:
	.word 0xd0cf823a  ! 1468: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r8
	.word 0xd13b401a  ! 1469: STDF_R	std	%f8, [%r26, %r13]
	.word 0xd102a004  ! 1470: LDF_I	ld	[%r10, 0x0004], %f8
NC_NUC482:
	.word 0xd0cd409a  ! 1472: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r8
	.word 0xd0bc913a  ! 1474: STDA_R	stda	%r8, [%r18 + %r26] 0x89
CHANGE_R26483:
	mov	%g0,	%r26
CP_BIS_SEC483:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 1476: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
SHORT_FP_PRI484:
	.word 0xd1bb1b5a  ! 1478: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd184d13a  ! 1480: LDFA_R	lda	[%r19, %r26], %f8
NC_BIS_NUC485:
	.word 0xccbd44fa  ! 1482: STDA_R	stda	%r6, [%r21 + %r26] 0x27
BLK_PRI486:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 1484: LDDFA_R	ldda	[%r13, %r26], %f16
NC_BIS_NUC487:
	.word 0xc4f544fa  ! 1486: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xd0c4913a  ! 1488: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
NC_BIS_NUC488:
	.word 0xd0bd44fa  ! 1490: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xd0cbd01a  ! 1492: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r8
NC_PST_PRI489:
	.word 0xd1bb985a  ! 1494: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd1bcd13a  ! 1496: STDFA_R	stda	%f8, [%r26, %r19]
SET_TL0_490:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI491:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 1498: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
CHANGE_R26492:
	add	%r26,	%r27,	%r26
CP_BIS_SEC492:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 1500: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
	.word 0xd1f2a01a  ! 1501: CASXA_R	casxa	[%r10]%asi, %r26, %r8
	.word 0xd0a3901a  ! 1503: STWA_R	stwa	%r8, [%r14 + %r26] 0x80
CHANGE_PRIV493:
	ta	T_CHANGE_PRIV
CHANGE_R26494:
	add	%r26,	%r27,	%r26
CP_BIS_NUC494:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 1505: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
CP_BIS_AIUP495:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1507: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd0cc501a  ! 1509: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r8
	.word 0xd13aa000  ! 1510: STDF_I	std	%f8, [0x0000, %r10]
NC_PST_PRI496:
	.word 0xd1bc181a  ! 1512: STDFA_R	stda	%f8, [%r26, %r16]
CP_BIS_QUAD_LD497:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 1514: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xd0cc903a  ! 1516: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
CP_AIUS498:
	.word 0xd0df823a  ! 1518: LDXA_R	ldxa	[%r30, %r26] 0x11, %r8
CHANGE_R26499:
	add	%r26,	%r27,	%r26
CP_BIS_SEC499:
	and	%r26,	%r28,	%r26
	.word 0xcca49d7a  ! 1520: STWA_R	stwa	%r6, [%r18 + %r26] 0xeb
CHANGE_R26500:
	add	%r26,	%r27,	%r26
CP_BIS_SEC500:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 1522: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
	.word 0xd0f4903a  ! 1524: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
CHANGE_USER501:
	ta	T_CHANGE_NONPRIV
CHANGE_R26502:
	add	%r26,	%r27,	%r26
CP_BIS_PRI502:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 1526: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd032a006  ! 1527: STH_I	sth	%r8, [%r10 + 0x0006]
	.word 0xd0ccd03a  ! 1529: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CHANGE_PRIV503:
	ta	T_CHANGE_PRIV
CHANGE_R26504:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP504:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1531: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xd07a801a  ! 1532: SWAP_R	swap	%r8, [%r10 + %r26]
CP_BIS_AIUP505:
	and	%r26,	%r28,	%r26
	.word 0xd0be045a  ! 1534: STDA_R	stda	%r8, [%r24 + %r26] 0x22
	.word 0xd0bc501a  ! 1536: STDA_R	stda	%r8, [%r17 + %r26] 0x80
CP_PST_PRI506:
	.word 0xd1ba991a  ! 1538: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0d4913a  ! 1540: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
	.word 0xd183d01a  ! 1542: LDFA_R	lda	[%r15, %r26], %f8
BLK_PRI507:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 1544: STDFA_R	stda	%f0, [%r26, %r11]
NC_AIUS508:
	.word 0xd0b7c33a  ! 1546: STHA_R	stha	%r8, [%r31 + %r26] 0x19
	.word 0xd07ac01a  ! 1547: SWAP_R	swap	%r8, [%r11 + %r26]
	.word 0xd0acd13a  ! 1549: STBA_R	stba	%r8, [%r19 + %r26] 0x89
CHANGE_R26509:
	add	%r26,	%r27,	%r26
CP_BIS_SEC509:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 1551: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
CP_BIS_NUC510:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 1553: STBA_R	stba	%r8, [%r20 + %r26] 0x27
	.word 0xd1a2d11a  ! 1554: STFA_R	sta	%f8, [%r26, %r11]
BLK_PRI511:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1556: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xd0f4913a  ! 1558: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
	.word 0xd06aa007  ! 1559: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
CP_AIUS512:
	.word 0xd0d7823a  ! 1561: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r8
NC_NUC513:
	.word 0xd1bd409a  ! 1563: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd19c501a  ! 1565: LDDFA_R	ldda	[%r17, %r26], %f8
NC_AIUS514:
	.word 0xd097c23a  ! 1567: LDUHA_R	lduha	[%r31, %r26] 0x11, %r8
	.word 0xd184903a  ! 1569: LDFA_R	lda	[%r18, %r26], %f8
CHANGE_R26515:
	mov	%g0,	%r26
CP_BIS_SEC515:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 1571: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
BLK_PRI516:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 1573: STDFA_R	stda	%f16, [%r26, %r10]
CP_PST_PRI517:
	.word 0xd1ba981a  ! 1575: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd093901a  ! 1577: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
	.word 0xd0bcd13a  ! 1579: STDA_R	stda	%r8, [%r19 + %r26] 0x89
	.word 0xe96d601e  ! 1581: PREFETCH_I	prefetch	[%r21 + 0x001e], #20
BLK_PRI518:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1583: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd0b3911a  ! 1585: STHA_R	stha	%r8, [%r14 + %r26] 0x88
CP_BIS_QUAD_LD519:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1587: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_BIS_NUC520:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 1589: STBA_R	stba	%r4, [%r20 + %r26] 0x27
CHANGE_USER521:
	ta	T_CHANGE_NONPRIV
CHANGE_R26522:
	add	%r26,	%r27,	%r26
NC_BIS_PRI522:
	.word 0xc8f39c5a  ! 1591: STXA_R	stxa	%r4, [%r14 + %r26] 0xe2
	.word 0xd0c4d03a  ! 1593: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
NC_BLK_SEc523:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1595: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xd08cd03a  ! 1597: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
NC_BLK_SEc524:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1599: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BLK_SEc525:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1601: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd07a801a  ! 1602: SWAP_R	swap	%r8, [%r10 + %r26]
BLK_PRI526:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1604: LDDFA_R	ldda	[%r10, %r26], %f0
CP_PST_PRI527:
	.word 0xd1ba981a  ! 1606: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd08b101a  ! 1607: LDUBA_R	lduba	[%r12, %r26] 0x80, %r8
	.word 0xd0cc913a  ! 1609: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r8
CHANGE_PRIV528:
	ta	T_CHANGE_PRIV
CHANGE_R26529:
	add	%r26,	%r27,	%r26
CP_BIS_NUC529:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1611: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CP_AIUP530:
	.word 0xd0be031a  ! 1613: STDA_R	stda	%r8, [%r24 + %r26] 0x18
	.word 0xd002801a  ! 1614: LDUW_R	lduw	[%r10 + %r26], %r8
NC_BIS_AIUS531:
	.word 0xccafc47a  ! 1616: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xd0cc913a  ! 1618: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r8
BLK_PRI532:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 1620: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xd1bc903a  ! 1622: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd082911a  ! 1623: LDUWA_R	lduwa	[%r10, %r26] 0x88, %r8
NC_AIUS533:
	.word 0xd187c23a  ! 1625: LDFA_R	lda	[%r31, %r26], %f8
	.word 0xd13ae000  ! 1626: STDF_I	std	%f8, [0x0000, %r11]
	.word 0xd0bcd03a  ! 1628: STDA_R	stda	%r8, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD534:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 1630: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
CHANGE_TLE535:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP537:
	.word 0xd0a6421a  ! 1633: STWA_R	stwa	%r8, [%r25 + %r26] 0x10
	.word 0xd0b3901a  ! 1635: STHA_R	stha	%r8, [%r14 + %r26] 0x80
SET_TL1_538:
	ta	T_CHANGE_TO_TL1
CHANGE_R26539:
	add	%r26,	%r27,	%r26
NC_BIS_NUC539:
	.word 0xc4ad44fa  ! 1637: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xd1a2911a  ! 1638: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd084d03a  ! 1640: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd0aa901a  ! 1641: STBA_R	stba	%r8, [%r10 + %r26] 0x80
	.word 0xd182d15a  ! 1642: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd02b401a  ! 1643: STB_R	stb	%r8, [%r13 + %r26]
NC_BLK_SEc540:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1645: STDFA_R	stda	%f16, [%r26, %r19]
SET_TL0_541:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI542:
	and	%r26,	%r28,	%r26
	.word 0xc4a2dc5a  ! 1647: STWA_R	stwa	%r2, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS544:
	.word 0xd0d7c23a  ! 1649: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r8
CP_AIUP545:
	.word 0xd0be021a  ! 1651: STDA_R	stda	%r8, [%r24 + %r26] 0x10
CHANGE_USER546:
	ta	T_CHANGE_NONPRIV
CHANGE_R26547:
	add	%r26,	%r27,	%r26
NC_BIS_PRI547:
	.word 0xc4b45c5a  ! 1653: STHA_R	stha	%r2, [%r17 + %r26] 0xe2
NC_BIS_PRI548:
	.word 0xccb3dd5a  ! 1655: STHA_R	stha	%r6, [%r15 + %r26] 0xea
CHANGE_TLE549:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_PRI550:
	and	%r26,	%r28,	%r26
	.word 0xc8f35c5a  ! 1658: STXA_R	stxa	%r4, [%r13 + %r26] 0xe2
	.word 0xd1f2a01a  ! 1659: CASXA_R	casxa	[%r10]%asi, %r26, %r8
NC_PST_PRI551:
	.word 0xd1bc589a  ! 1661: STDFA_R	stda	%f8, [%r26, %r17]
SHORT_FP_PRI552:
	.word 0xd1bb5b5a  ! 1663: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd094d13a  ! 1665: LDUHA_R	lduha	[%r19, %r26] 0x89, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC554:
	.word 0xd1bd019a  ! 1667: STDFA_R	stda	%f8, [%r26, %r20]
	.word 0xd08b111a  ! 1668: LDUBA_R	lduba	[%r12, %r26] 0x88, %r8
NC_BIS_AIUP555:
	.word 0xc4f6445a  ! 1670: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_BIS_AIUP556:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 1672: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
	.word 0xd093901a  ! 1674: LDUHA_R	lduha	[%r14, %r26] 0x80, %r8
	.word 0xd094101a  ! 1676: LDUHA_R	lduha	[%r16, %r26] 0x80, %r8
SHORT_FP_PRI557:
	.word 0xd1bb1b1a  ! 1678: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd084903a  ! 1680: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
	.word 0xd1a4d13a  ! 1682: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd102801a  ! 1683: LDF_R	ld	[%r10, %r26], %f8
	.word 0xd0c4913a  ! 1685: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd1bc913a  ! 1687: STDFA_R	stda	%f8, [%r26, %r18]
	.word 0xd0b3901a  ! 1689: STHA_R	stha	%r8, [%r14 + %r26] 0x80
WR_LEASI_558:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_559:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_AIUP560:
	.word 0xd096021a  ! 1692: LDUHA_R	lduha	[%r24, %r26] 0x10, %r8
	.word 0xd184d13a  ! 1694: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd0cb515a  ! 1695: LDSBA_R	ldsba	[%r13, %r26] 0x8a, %r8
CP_AIUS561:
	.word 0xd0c7823a  ! 1697: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
	.word 0xd1a3901a  ! 1699: STFA_R	sta	%f8, [%r26, %r14]
NC_SHORT_FP_SEC562:
	.word 0xd19cda3a  ! 1701: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd03b2000  ! 1702: STD_I	std	%r8, [%r12 + 0x0000]
NC_BIS_SEC563:
	.word 0xc4acdd7a  ! 1704: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
CP_BIS_NUC564:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 1706: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
CP_ATM_QUAD_LD565:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1708: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CHANGE_USER566:
	ta	T_CHANGE_NONPRIV
CHANGE_R26567:
	mov	%g0,	%r26
NC_BIS_PRI567:
	.word 0xc4f45c5a  ! 1710: STXA_R	stxa	%r2, [%r17 + %r26] 0xe2
	.word 0xd0f4d13a  ! 1712: STXA_R	stxa	%r8, [%r19 + %r26] 0x89
CHANGE_TLE568:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd08c913a  ! 1715: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd06a801a  ! 1716: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP570:
	.word 0xd186421a  ! 1718: LDFA_R	lda	[%r25, %r26], %f8
	.word 0xd1bc913a  ! 1720: STDFA_R	stda	%f8, [%r26, %r18]
NC_BIS_SEC571:
	.word 0xccf4dd7a  ! 1722: STXA_R	stxa	%r6, [%r19 + %r26] 0xeb
CP_BIS_AIUP572:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1724: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CP_BIS_AIUS573:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 1726: STDA_R	stda	%r2, [%r30 + %r26] 0x23
	.word 0xd09cd03a  ! 1728: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd07b2004  ! 1729: SWAP_I	swap	%r8, [%r12 + 0x0004]
CP_AIUP574:
	.word 0xd1a6031a  ! 1731: STFA_R	sta	%f8, [%r26, %r24]
	.word 0xd1a3901a  ! 1733: STFA_R	sta	%f8, [%r26, %r14]
	.word 0xd07b2004  ! 1734: SWAP_I	swap	%r8, [%r12 + 0x0004]
CP_NUC575:
	.word 0xd1bd009a  ! 1736: STDFA_R	stda	%f8, [%r26, %r20]
	.word 0xd09c913a  ! 1738: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
NC_BIS_AIUP576:
	.word 0xc8f6455a  ! 1740: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
SHORT_FP_PRI577:
	.word 0xd1bb5b1a  ! 1742: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd06aa007  ! 1743: LDSTUB_I	ldstub	%r8, [%r10 + 0x0007]
	.word 0xd0f4903a  ! 1745: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
CP_BIS_NUC578:
	and	%r26,	%r28,	%r26
	.word 0xd0bd05fa  ! 1747: STDA_R	stda	%r8, [%r20 + %r26] 0x2f
	.word 0xd19c101a  ! 1749: LDDFA_R	ldda	[%r16, %r26], %f8
	.word 0xd0a4d03a  ! 1751: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
NC_BIS_SEC579:
	.word 0xc8acdc7a  ! 1753: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
NC_AIUS580:
	.word 0xd087c23a  ! 1755: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r8
	.word 0xd0cc101a  ! 1757: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r8
	.word 0xd102a004  ! 1758: LDF_I	ld	[%r10, 0x0004], %f8
NC_PST_PRI581:
	.word 0xd1bc581a  ! 1760: STDFA_R	stda	%f8, [%r26, %r17]
CP_NUC582:
	.word 0xd1f5201a  ! 1762: CASXA_R	casxa	[%r20]%asi, %r26, %r8
BLK_PRI583:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1764: LDDFA_R	ldda	[%r10, %r26], %f0
CP_BIS_AIUP584:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1766: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd0bc903a  ! 1768: STDA_R	stda	%r8, [%r18 + %r26] 0x81
NC_BIS_AIUP585:
	.word 0xd0f6445a  ! 1770: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
NC_SHORT_FP_SEC586:
	.word 0xd19cda3a  ! 1772: LDDFA_R	ldda	[%r19, %r26], %f8
CP_ATM_QUAD_LD587:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1774: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_AIUP588:
	.word 0xd0a6431a  ! 1776: STWA_R	stwa	%r8, [%r25 + %r26] 0x18
CP_ATM_QUAD_LD589:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1778: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
CHANGE_USER590:
	ta	T_CHANGE_NONPRIV
CHANGE_R26591:
	add	%r26,	%r27,	%r26
CP_BIS_PRI591:
	and	%r26,	%r28,	%r26
	.word 0xc4aadc5a  ! 1780: STBA_R	stba	%r2, [%r11 + %r26] 0xe2
	.word 0xd02b401a  ! 1781: STB_R	stb	%r8, [%r13 + %r26]
	.word 0xd0bb901a  ! 1783: STDA_R	stda	%r8, [%r14 + %r26] 0x80
CHANGE_R26592:
	add	%r26,	%r27,	%r26
CP_BIS_SEC592:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1785: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xd09cd03a  ! 1787: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS594:
	.word 0xd0df833a  ! 1789: LDXA_R	ldxa	[%r30, %r26] 0x19, %r8
	.word 0xd084d03a  ! 1791: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd0ac913a  ! 1793: STBA_R	stba	%r8, [%r18 + %r26] 0x89
	.word 0xd07b2004  ! 1794: SWAP_I	swap	%r8, [%r12 + 0x0004]
	.word 0xd0d3d01a  ! 1796: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r8
	.word 0xd06a801a  ! 1797: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
CP_BIS_QUAD_LD595:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1799: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_BIS_NUC596:
	and	%r26,	%r28,	%r26
	.word 0xc8ad05fa  ! 1801: STBA_R	stba	%r4, [%r20 + %r26] 0x2f
	.word 0xd0d3901a  ! 1803: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
	.word 0xd1a2901a  ! 1804: STFA_R	sta	%f8, [%r26, %r10]
CP_PST_PRI597:
	.word 0xd1bb189a  ! 1806: STDFA_R	stda	%f8, [%r26, %r12]
SHORT_FP_PRI598:
	.word 0xd19b5b1a  ! 1808: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd03b6000  ! 1809: STD_I	std	%r8, [%r13 + 0x0000]
	.word 0xd0a3d01a  ! 1811: STWA_R	stwa	%r8, [%r15 + %r26] 0x80
NC_BIS_AIUP599:
	.word 0xd0be455a  ! 1813: STDA_R	stda	%r8, [%r25 + %r26] 0x2a
	.word 0xd0c3d11a  ! 1815: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r8
CP_PST_PRI600:
	.word 0xd1ba991a  ! 1817: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd08c101a  ! 1819: LDUBA_R	lduba	[%r16, %r26] 0x80, %r8
WR_LEASI_601:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_602:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0f3d11a  ! 1822: STXA_R	stxa	%r8, [%r15 + %r26] 0x88
	.word 0xd08b901a  ! 1824: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
	.word 0xd083901a  ! 1826: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
	.word 0xd094511a  ! 1828: LDUHA_R	lduha	[%r17, %r26] 0x88, %r8
	.word 0xd19a901a  ! 1829: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd0c4913a  ! 1831: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r8
	.word 0xd0c4903a  ! 1833: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
NC_BLK_SEc603:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1835: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd0d4913a  ! 1837: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
NC_AIUP604:
	.word 0xd08e421a  ! 1839: LDUBA_R	lduba	[%r25, %r26] 0x10, %r8
SET_TL1_605:
	ta	T_CHANGE_TO_TL1
CHANGE_R26606:
	add	%r26,	%r27,	%r26
NC_BIS_NUC606:
	.word 0xc8b545fa  ! 1841: STHA_R	stha	%r4, [%r21 + %r26] 0x2f
	.word 0xd0cc903a  ! 1843: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
CP_AIUP607:
	.word 0xd0de021a  ! 1845: LDXA_R	ldxa	[%r24, %r26] 0x10, %r8
	.word 0xd0fb111a  ! 1846: SWAPA_R	swapa	%r8, [%r12 + %r26] 0x88
	.word 0xd0dad05a  ! 1847: LDXA_R	ldxa	[%r11, %r26] 0x82, %r8
SET_TL0_608:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI609:
	.word 0xccbc1c5a  ! 1849: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
	.word 0xd0cc913a  ! 1851: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r8
SET_TL1_610:
	ta	T_CHANGE_TO_TL1
CHANGE_R26611:
	add	%r26,	%r27,	%r26
NC_BIS_NUC611:
	.word 0xc4ad45fa  ! 1853: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xd094d03a  ! 1855: LDUHA_R	lduha	[%r19, %r26] 0x81, %r8
CP_BIS_NUC612:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 1857: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
CP_BIS_AIUP613:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1859: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd08c913a  ! 1861: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
NC_BIS_NUC614:
	.word 0xccb544fa  ! 1863: STHA_R	stha	%r6, [%r21 + %r26] 0x27
	.word 0xd0a4d13a  ! 1865: STWA_R	stwa	%r8, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD615:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1867: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xd093911a  ! 1869: LDUHA_R	lduha	[%r14, %r26] 0x88, %r8
	.word 0xd094913a  ! 1871: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd19c903a  ! 1873: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd103001a  ! 1874: LDF_R	ld	[%r12, %r26], %f8
SET_TL0_616:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI617:
	and	%r26,	%r28,	%r26
	.word 0xc8ab5c5a  ! 1876: STBA_R	stba	%r4, [%r13 + %r26] 0xe2
	.word 0xd0dc903a  ! 1878: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd08c903a  ! 1880: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd0acd03a  ! 1882: STBA_R	stba	%r8, [%r19 + %r26] 0x81
CHANGE_PRIV618:
	ta	T_CHANGE_PRIV
CHANGE_R26619:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP619:
	.word 0xc8f6455a  ! 1884: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
SHORT_FP_PRI620:
	.word 0xd19b5a1a  ! 1886: LDDFA_R	ldda	[%r13, %r26], %f8
SHORT_FP_PRI621:
	.word 0xd1bb1a1a  ! 1888: STDFA_R	stda	%f8, [%r26, %r12]
NC_NUC622:
	.word 0xd19d409a  ! 1890: LDDFA_R	ldda	[%r21, %r26], %f8
	.word 0xd08c913a  ! 1892: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
NC_AIUP623:
	.word 0xd0c6421a  ! 1894: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r8
NC_BIS_AIUS624:
	.word 0xc8afc47a  ! 1896: STBA_R	stba	%r4, [%r31 + %r26] 0x23
	.word 0xd11aa000  ! 1897: LDDF_I	ldd	[%r10, 0x0000], %f8
	.word 0xd19ad15a  ! 1898: LDDFA_R	ldda	[%r11, %r26], %f8
NC_BIS_SEC625:
	.word 0xccf4dd7a  ! 1900: STXA_R	stxa	%r6, [%r19 + %r26] 0xeb
	.word 0xd084913a  ! 1902: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r8
CHANGE_USER626:
	ta	T_CHANGE_NONPRIV
CHANGE_R26627:
	mov	%g0,	%r26
CP_BIS_PRI627:
	and	%r26,	%r28,	%r26
	.word 0xc8f2dc5a  ! 1904: STXA_R	stxa	%r4, [%r11 + %r26] 0xe2
	.word 0xd0c2911a  ! 1905: LDSWA_R	ldswa	[%r10, %r26] 0x88, %r8
CHANGE_R26628:
	add	%r26,	%r27,	%r26
CP_BIS_SEC628:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 1907: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
NC_BIS_SEC629:
	.word 0xc4acdd7a  ! 1909: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xd09cd03a  ! 1911: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd1bb901a  ! 1913: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd0a4101a  ! 1915: STWA_R	stwa	%r8, [%r16 + %r26] 0x80
CP_PST_PRI630:
	.word 0xd1bb191a  ! 1917: STDFA_R	stda	%f8, [%r26, %r12]
CHANGE_PRIV631:
	ta	T_CHANGE_PRIV
CHANGE_R26632:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS632:
	.word 0xc8a7c47a  ! 1919: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
NC_BIS_AIUS633:
	.word 0xd0a7c47a  ! 1921: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
	.word 0xd184101a  ! 1923: LDFA_R	lda	[%r16, %r26], %f8
	.word 0xd0c2d01a  ! 1924: LDSWA_R	ldswa	[%r11, %r26] 0x80, %r8
CP_PST_PRI634:
	.word 0xd1bad91a  ! 1926: STDFA_R	stda	%f8, [%r26, %r11]
	.word 0xd1a2901a  ! 1927: STFA_R	sta	%f8, [%r26, %r10]
CP_ATM_QUAD_LD635:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1929: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd184903a  ! 1931: LDFA_R	lda	[%r18, %r26], %f8
SET_TL1_636:
	ta	T_CHANGE_TO_TL1
CHANGE_R26637:
	add	%r26,	%r27,	%r26
NC_BIS_NUC637:
	.word 0xc4a544fa  ! 1933: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
CP_NUC638:
	.word 0xd085019a  ! 1936: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r8
NC_BLK_SEc639:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1938: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd083d11a  ! 1940: LDUWA_R	lduwa	[%r15, %r26] 0x88, %r8
	.word 0xd11b001a  ! 1941: LDDF_R	ldd	[%r12, %r26], %f8
	.word 0xd08b511a  ! 1942: LDUBA_R	lduba	[%r13, %r26] 0x88, %r8
	.word 0xd08cd13a  ! 1944: LDUBA_R	lduba	[%r19, %r26] 0x89, %r8
NC_BIS_AIUP640:
	.word 0xc4b6445a  ! 1946: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd0acd13a  ! 1948: STBA_R	stba	%r8, [%r19 + %r26] 0x89
NC_AIUP641:
	.word 0xd08e431a  ! 1950: LDUBA_R	lduba	[%r25, %r26] 0x18, %r8
	.word 0xd19c511a  ! 1952: LDDFA_R	ldda	[%r17, %r26], %f8
SET_TL0_642:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI643:
	and	%r26,	%r28,	%r26
	.word 0xc4b31c5a  ! 1954: STHA_R	stha	%r2, [%r12 + %r26] 0xe2
SET_TL1_644:
	ta	T_CHANGE_TO_TL1
CHANGE_R26645:
	add	%r26,	%r27,	%r26
NC_BIS_NUC645:
	.word 0xc4a545fa  ! 1956: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
NC_SHORT_FP_SEC646:
	.word 0xd19cdb3a  ! 1958: LDDFA_R	ldda	[%r19, %r26], %f8
CP_BIS_QUAD_LD647:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 1960: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
NC_BLK_SEc648:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1962: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd1a3101a  ! 1963: STFA_R	sta	%f8, [%r26, %r12]
NC_BIS_AIUP649:
	.word 0xc4a6445a  ! 1965: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD650:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1967: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd08c913a  ! 1969: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
CP_BIS_AIUP651:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 1971: STBA_R	stba	%r6, [%r24 + %r26] 0x22
CP_BIS_NUC652:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 1973: STDA_R	stda	%r2, [%r20 + %r26] 0x27
	.word 0xd0d4903a  ! 1975: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd1bb501a  ! 1976: STDFA_R	stda	%f8, [%r26, %r13]
CP_PST_PRI653:
	.word 0xd1bad81a  ! 1978: STDFA_R	stda	%f8, [%r26, %r11]
CP_AIUP654:
	.word 0xd0ae031a  ! 1980: STBA_R	stba	%r8, [%r24 + %r26] 0x18
CP_BIS_AIUS655:
	and	%r26,	%r28,	%r26
	.word 0xd0bf847a  ! 1982: STDA_R	stda	%r8, [%r30 + %r26] 0x23
SET_TL0_656:
	ta	T_CHANGE_TO_TL0
CHANGE_R26657:
	add	%r26,	%r27,	%r26
NC_BIS_SEC657:
	.word 0xccbcdd7a  ! 1984: STDA_R	stda	%r6, [%r19 + %r26] 0xeb
	.word 0xd1a2d11a  ! 1985: STFA_R	sta	%f8, [%r26, %r11]
CHANGE_PRIV658:
	ta	T_CHANGE_PRIV
CHANGE_R26659:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS659:
	.word 0xc4f7c47a  ! 1987: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUS660:
	.word 0xc8a7c47a  ! 1989: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
NC_PST_PRI661:
	.word 0xd1bb985a  ! 1991: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd183901a  ! 1993: LDFA_R	lda	[%r14, %r26], %f8
NC_BIS_SEC662:
	.word 0xd0bcdc7a  ! 1995: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xd0b3d01a  ! 1997: STHA_R	stha	%r8, [%r15 + %r26] 0x80
NC_PST_PRI663:
	.word 0xd1bc591a  ! 1999: STDFA_R	stda	%f8, [%r26, %r17]
CP_ATM_QUAD_LD664:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2001: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
NC_BIS_AIUP665:
	.word 0xc4ae445a  ! 2003: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_AIUS666:
	.word 0xd19fc33a  ! 2005: LDDFA_R	ldda	[%r31, %r26], %f8
	.word 0xd0c4d03a  ! 2007: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r8
	.word 0xd09b101a  ! 2008: LDDA_R	ldda	[%r12, %r26] 0x80, %r8
CP_BIS_NUC667:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 2010: STHA_R	stha	%r4, [%r20 + %r26] 0x27
	.word 0xd1bc913a  ! 2012: STDFA_R	stda	%f8, [%r26, %r18]
NC_PST_PRI668:
	.word 0xd1bc195a  ! 2014: STDFA_R	stda	%f8, [%r26, %r16]
NC_BLK_SEc669:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2016: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_R26670:
	add	%r26,	%r27,	%r26
CP_BIS_SEC670:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 2018: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
	.word 0xd0b2d01a  ! 2019: STHA_R	stha	%r8, [%r11 + %r26] 0x80
	.word 0xd03ac01a  ! 2020: STD_R	std	%r8, [%r11 + %r26]
	.word 0xd0ab501a  ! 2021: STBA_R	stba	%r8, [%r13 + %r26] 0x80
CP_AIUS671:
	.word 0xd097823a  ! 2023: LDUHA_R	lduha	[%r30, %r26] 0x11, %r8
SET_TL1_672:
	ta	T_CHANGE_TO_TL1
CHANGE_R26673:
	mov	%g0,	%r26
NC_BIS_NUC673:
	.word 0xc4ad44fa  ! 2025: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xd08cd03a  ! 2027: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
	.word 0xd0a2911a  ! 2028: STWA_R	stwa	%r8, [%r10 + %r26] 0x88
	.word 0xd07ac01a  ! 2029: SWAP_R	swap	%r8, [%r11 + %r26]
	.word 0xd0cb901a  ! 2031: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
CP_BIS_NUC674:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 2033: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
CP_BIS_NUC675:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 2035: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xd19c111a  ! 2037: LDDFA_R	ldda	[%r16, %r26], %f8
	.word 0xd0a3511a  ! 2038: STWA_R	stwa	%r8, [%r13 + %r26] 0x88
NC_BIS_NUC676:
	.word 0xc4a545fa  ! 2040: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xd0abd01a  ! 2042: STBA_R	stba	%r8, [%r15 + %r26] 0x80
NC_BLK_SEc677:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2044: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd19bd11a  ! 2046: LDDFA_R	ldda	[%r15, %r26], %f8
NC_BIS_AIUS678:
	.word 0xccbfc47a  ! 2048: STDA_R	stda	%r6, [%r31 + %r26] 0x23
SET_TL0_679:
	ta	T_CHANGE_TO_TL0
CHANGE_R26680:
	add	%r26,	%r27,	%r26
NC_BIS_SEC680:
	.word 0xc4acdd7a  ! 2050: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xd19c903a  ! 2052: LDDFA_R	ldda	[%r18, %r26], %f8
	.word 0xd0b4d13a  ! 2054: STHA_R	stha	%r8, [%r19 + %r26] 0x89
CHANGE_PRIV681:
	ta	T_CHANGE_PRIV
CHANGE_R26682:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS682:
	.word 0xc4f7c47a  ! 2056: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
CP_PST_PRI683:
	.word 0xd1bb195a  ! 2058: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd0c4101a  ! 2060: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r8
	.word 0xd0cc903a  ! 2062: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r8
	.word 0xd0d4903a  ! 2064: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd19b105a  ! 2065: LDDFA_R	ldda	[%r12, %r26], %f8
	.word 0xd0d4d03a  ! 2067: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r8
	.word 0xd0b3501a  ! 2068: STHA_R	stha	%r8, [%r13 + %r26] 0x80
CHANGE_CLE684:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0bb101a  ! 2070: STDA_R	stda	%r8, [%r12 + %r26] 0x80
	.word 0xd08c511a  ! 2072: LDUBA_R	lduba	[%r17, %r26] 0x88, %r8
	.word 0xd19a911a  ! 2073: LDDFA_R	ldda	[%r10, %r26], %f8
	.word 0xd19b101a  ! 2074: LDDFA_R	ldda	[%r12, %r26], %f8
	.word 0xd182d05a  ! 2075: LDFA_R	lda	[%r11, %r26], %f8
	.word 0xd08ad01a  ! 2076: LDUBA_R	lduba	[%r11, %r26] 0x80, %r8
CHANGE_PRIV685:
	ta	T_CHANGE_PRIV
CHANGE_R26686:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP686:
	.word 0xd0f6455a  ! 2078: STXA_R	stxa	%r8, [%r25 + %r26] 0x2a
	.word 0xd094d13a  ! 2080: LDUHA_R	lduha	[%r19, %r26] 0x89, %r8
	.word 0xd084913a  ! 2082: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r8
CP_AIUP687:
	.word 0xd0be021a  ! 2084: STDA_R	stda	%r8, [%r24 + %r26] 0x10
CP_ATM_QUAD_LD688:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2086: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xd06b2007  ! 2087: LDSTUB_I	ldstub	%r8, [%r12 + 0x0007]
	.word 0xd094903a  ! 2089: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_BIS_AIUP689:
	.word 0xccbe445a  ! 2091: STDA_R	stda	%r6, [%r25 + %r26] 0x22
CHANGE_USER690:
	ta	T_CHANGE_NONPRIV
CHANGE_R26691:
	add	%r26,	%r27,	%r26
NC_BIS_PRI691:
	.word 0xc4bc1d5a  ! 2093: STDA_R	stda	%r2, [%r16 + %r26] 0xea
	.word 0xd0ea911a  ! 2094: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x88
	.word 0xd0f4903a  ! 2096: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
CHANGE_PRIV692:
	ta	T_CHANGE_PRIV
CHANGE_R26693:
	add	%r26,	%r27,	%r26
CP_BIS_NUC693:
	and	%r26,	%r28,	%r26
	.word 0xd09d05fa  ! 2098: LDDA_R	ldda	[%r20, %r26] 0x2f, %r8
	.word 0xd122a004  ! 2099: STF_I	st	%f8, [0x0004, %r10]
NC_BIS_AIUP694:
	.word 0xccae445a  ! 2101: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xd19a911a  ! 2102: LDDFA_R	ldda	[%r10, %r26], %f8
CP_ATM_QUAD_LD695:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 2104: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
CHANGE_USER696:
	ta	T_CHANGE_NONPRIV
CHANGE_R26697:
	add	%r26,	%r27,	%r26
CP_BIS_PRI697:
	and	%r26,	%r28,	%r26
	.word 0xc49a9d5a  ! 2106: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xd0bad11a  ! 2107: STDA_R	stda	%r8, [%r11 + %r26] 0x88
SHORT_FP_PRI698:
	.word 0xd19a9a1a  ! 2109: LDDFA_R	ldda	[%r10, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP700:
	.word 0xd0f6421a  ! 2111: STXA_R	stxa	%r8, [%r25 + %r26] 0x10
NC_SHORT_FP_SEC701:
	.word 0xd19cda3a  ! 2113: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd0a3511a  ! 2114: STWA_R	stwa	%r8, [%r13 + %r26] 0x88
	.word 0xd0a2d11a  ! 2115: STWA_R	stwa	%r8, [%r11 + %r26] 0x88
CP_BIS_QUAD_LD702:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2117: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
CHANGE_USER703:
	ta	T_CHANGE_NONPRIV
CHANGE_R26704:
	mov	%g0,	%r26
NC_BIS_PRI704:
	.word 0xc4a39c5a  ! 2119: STWA_R	stwa	%r2, [%r14 + %r26] 0xe2
	.word 0xd1bc903a  ! 2121: STDFA_R	stda	%f8, [%r26, %r18]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC706:
	.word 0xd1a5409a  ! 2123: STFA_R	sta	%f8, [%r26, %r21]
	.word 0xd102a004  ! 2124: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xd0a4903a  ! 2126: STWA_R	stwa	%r8, [%r18 + %r26] 0x81
	.word 0xd0a4511a  ! 2128: STWA_R	stwa	%r8, [%r17 + %r26] 0x88
	.word 0xd0dc903a  ! 2130: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
	.word 0xd0ccd03a  ! 2132: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CHANGE_USER707:
	ta	T_CHANGE_NONPRIV
CHANGE_R26708:
	add	%r26,	%r27,	%r26
NC_BIS_PRI708:
	.word 0xd0b39d5a  ! 2134: STHA_R	stha	%r8, [%r14 + %r26] 0xea
	.word 0xd1a3101a  ! 2135: STFA_R	sta	%f8, [%r26, %r12]
CHANGE_PRIV709:
	ta	T_CHANGE_PRIV
CHANGE_R26710:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD710:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2137: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xd0a3901a  ! 2139: STWA_R	stwa	%r8, [%r14 + %r26] 0x80
	.word 0xd0ccd03a  ! 2141: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
SET_TL1_711:
	ta	T_CHANGE_TO_TL1
CHANGE_R26712:
	add	%r26,	%r27,	%r26
NC_BIS_NUC712:
	.word 0xc4a545fa  ! 2143: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xd1f2a01a  ! 2144: CASXA_R	casxa	[%r10]%asi, %r26, %r8
SET_TL0_713:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI714:
	.word 0xd0a3dc5a  ! 2146: STWA_R	stwa	%r8, [%r15 + %r26] 0xe2
	.word 0xd042a004  ! 2147: LDSW_I	ldsw	[%r10 + 0x0004], %r8
	.word 0xd094903a  ! 2149: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_BLK_SEc715:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2151: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd094913a  ! 2153: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
CHANGE_PRIV716:
	ta	T_CHANGE_PRIV
CHANGE_R26717:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD717:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 2155: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
	.word 0xd094903a  ! 2157: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
NC_BIS_AIUP718:
	.word 0xc4a6445a  ! 2159: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
NC_BIS_SEC719:
	.word 0xc8a4dc7a  ! 2161: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xd0a4d03a  ! 2163: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
NC_NUC720:
	.word 0xd0b5419a  ! 2165: STHA_R	stha	%r8, [%r21 + %r26] 0x0c
CP_BIS_AIUP721:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 2167: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xd184d13a  ! 2169: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd084d13a  ! 2171: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
	.word 0xd083d01a  ! 2173: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r8
	.word 0xd0ac903a  ! 2175: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd1a3911a  ! 2177: STFA_R	sta	%f8, [%r26, %r14]
	.word 0xd09c913a  ! 2179: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
NC_AIUS722:
	.word 0xd087c23a  ! 2181: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r8
CP_BIS_AIUS723:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 2183: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
NC_BIS_AIUS724:
	.word 0xccb7c57a  ! 2185: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
	.word 0xd08cd03a  ! 2187: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
CP_NUC725:
	.word 0xd09d009a  ! 2189: LDDA_R	ldda	[%r20, %r26] 0x04, %r8
NC_BIS_AIUS726:
	.word 0xd0afc47a  ! 2191: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xd094903a  ! 2193: LDUHA_R	lduha	[%r18, %r26] 0x81, %r8
	.word 0xd0d3901a  ! 2195: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
	.word 0xd09c903a  ! 2197: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd0f3501a  ! 2198: STXA_R	stxa	%r8, [%r13 + %r26] 0x80
CP_BIS_NUC727:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2200: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
CP_AIUP728:
	.word 0xd086021a  ! 2202: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r8
CP_BIS_NUC729:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2204: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xd0b4903a  ! 2206: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_BIS_SEC730:
	.word 0xd0acdc7a  ! 2208: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
	.word 0xd0ccd03a  ! 2210: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CHANGE_R26731:
	add	%r26,	%r27,	%r26
CP_BIS_SEC731:
	and	%r26,	%r28,	%r26
	.word 0xd0b49d7a  ! 2212: STHA_R	stha	%r8, [%r18 + %r26] 0xeb
CP_BIS_NUC732:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2214: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xd19cd03a  ! 2216: LDDFA_R	ldda	[%r19, %r26], %f8
CP_AIUP733:
	.word 0xd09e031a  ! 2218: LDDA_R	ldda	[%r24, %r26] 0x18, %r8
	.word 0xd0bc913a  ! 2220: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd184913a  ! 2222: LDFA_R	lda	[%r18, %r26], %f8
CHANGE_USER734:
	ta	T_CHANGE_NONPRIV
CHANGE_R26735:
	add	%r26,	%r27,	%r26
NC_BIS_PRI735:
	.word 0xc8a3dd5a  ! 2224: STWA_R	stwa	%r4, [%r15 + %r26] 0xea
	.word 0xd0b4913a  ! 2226: STHA_R	stha	%r8, [%r18 + %r26] 0x89
	.word 0xd0ac903a  ! 2228: STBA_R	stba	%r8, [%r18 + %r26] 0x81
BLK_PRI736:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 2230: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xd1a4d03a  ! 2232: STFA_R	sta	%f8, [%r26, %r19]
CHANGE_PRIV737:
	ta	T_CHANGE_PRIV
CHANGE_R26738:
	mov	%g0,	%r26
CP_BIS_AIUP738:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 2234: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xd08cd03a  ! 2236: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
CP_ATM_QUAD_LD739:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 2238: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
	.word 0xd19c903a  ! 2240: LDDFA_R	ldda	[%r18, %r26], %f8
SET_TL1_740:
	ta	T_CHANGE_TO_TL1
CHANGE_R26741:
	add	%r26,	%r27,	%r26
NC_BIS_NUC741:
	.word 0xd0b545fa  ! 2242: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
BLK_PRI742:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 2244: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xd084d13a  ! 2246: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
NC_AIUS743:
	.word 0xd1a7c33a  ! 2248: STFA_R	sta	%f8, [%r26, %r31]
	.word 0xd0f2901a  ! 2249: STXA_R	stxa	%r8, [%r10 + %r26] 0x80
CP_BIS_NUC744:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2251: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xd0cb901a  ! 2253: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r8
NC_BLK_SEc745:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2255: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd0bcd03a  ! 2257: STDA_R	stda	%r8, [%r19 + %r26] 0x81
NC_PST_PRI746:
	.word 0xd1bb981a  ! 2259: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd0ac903a  ! 2261: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd0acd13a  ! 2263: STBA_R	stba	%r8, [%r19 + %r26] 0x89
NC_PST_PRI747:
	.word 0xd1bbd99a  ! 2265: STDFA_R	stda	%f8, [%r26, %r15]
CP_BIS_QUAD_LD748:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2267: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xd052a006  ! 2268: LDSH_I	ldsh	[%r10 + 0x0006], %r8
NC_SHORT_FP_SEC749:
	.word 0xd19cda3a  ! 2270: LDDFA_R	ldda	[%r19, %r26], %f8
NC_NUC750:
	.word 0xd0ad409a  ! 2272: STBA_R	stba	%r8, [%r21 + %r26] 0x04
NC_BLK_SEc751:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2274: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_NUC752:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2276: STBA_R	stba	%r4, [%r20 + %r26] 0x27
CHANGE_R26753:
	add	%r26,	%r27,	%r26
CP_BIS_SEC753:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2278: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_AIUP754:
	.word 0xd0de031a  ! 2281: LDXA_R	ldxa	[%r24, %r26] 0x18, %r8
NC_NUC755:
	.word 0xd185419a  ! 2283: LDFA_R	lda	[%r21, %r26], %f8
	.word 0xd0f2911a  ! 2284: STXA_R	stxa	%r8, [%r10 + %r26] 0x88
	.word 0xd084d03a  ! 2286: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
	.word 0xd0f3901a  ! 2288: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
	.word 0xd053401a  ! 2289: LDSH_R	ldsh	[%r13 + %r26], %r8
	.word 0xd07aa004  ! 2290: SWAP_I	swap	%r8, [%r10 + 0x0004]
	.word 0xd0acd03a  ! 2292: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	.word 0xd083901a  ! 2294: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
	.word 0xd08c903a  ! 2296: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd0f2d01a  ! 2297: STXA_R	stxa	%r8, [%r11 + %r26] 0x80
	.word 0xd19b901a  ! 2299: LDDFA_R	ldda	[%r14, %r26], %f8
	.word 0xd09c913a  ! 2301: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd13b6000  ! 2302: STDF_I	std	%f8, [0x0000, %r13]
NC_BLK_SEc756:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2304: STDFA_R	stda	%f16, [%r26, %r19]
CP_AIUP757:
	.word 0xd1a6031a  ! 2306: STFA_R	sta	%f8, [%r26, %r24]
CP_ATM_QUAD_LD758:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 2308: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
CP_AIUS759:
	.word 0xd0cf823a  ! 2310: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r8
	.word 0xd08c903a  ! 2312: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	.word 0xd08b901a  ! 2314: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
	.word 0xd0ea911a  ! 2315: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x88
NC_BIS_NUC760:
	.word 0xc4ad45fa  ! 2317: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xd09c501a  ! 2319: LDDA_R	ldda	[%r17, %r26] 0x80, %r8
CP_BIS_QUAD_LD761:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 2321: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
	.word 0xd0dcd03a  ! 2323: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
NC_BIS_AIUS762:
	.word 0xcca7c47a  ! 2325: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
CP_BIS_AIUS763:
	and	%r26,	%r28,	%r26
	.word 0xccb7847a  ! 2327: STHA_R	stha	%r6, [%r30 + %r26] 0x23
	.word 0xd1a4d13a  ! 2329: STFA_R	sta	%f8, [%r26, %r19]
	.word 0xd13b2000  ! 2330: STDF_I	std	%f8, [0x0000, %r12]
CHANGE_R26764:
	add	%r26,	%r27,	%r26
CP_BIS_SEC764:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 2332: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD765:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2334: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
SET_TL0_766:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI767:
	and	%r26,	%r28,	%r26
	.word 0xcca31c5a  ! 2336: STWA_R	stwa	%r6, [%r12 + %r26] 0xe2
	.word 0xd08c903a  ! 2338: LDUBA_R	lduba	[%r18, %r26] 0x81, %r8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC769:
	.word 0xd1bd409a  ! 2340: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd1e2a01a  ! 2341: CASA_R	casa	[%r10] %asi, %r26, %r8
	.word 0xd13a801a  ! 2342: STDF_R	std	%f8, [%r26, %r10]
NC_BLK_SEc770:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2344: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd13a801a  ! 2345: STDF_R	std	%f8, [%r26, %r10]
	.word 0xd184913a  ! 2347: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd0b2901a  ! 2348: STHA_R	stha	%r8, [%r10 + %r26] 0x80
NC_BIS_AIUS771:
	.word 0xc4bfc47a  ! 2350: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xd07a801a  ! 2351: SWAP_R	swap	%r8, [%r10 + %r26]
NC_PST_PRI772:
	.word 0xd1bbd81a  ! 2353: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd0b3901a  ! 2355: STHA_R	stha	%r8, [%r14 + %r26] 0x80
	.word 0xd0fa911a  ! 2356: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x88
	.word 0xd0ac903a  ! 2358: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd083d01a  ! 2360: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r8
	.word 0xd094913a  ! 2362: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
	.word 0xd1bad11a  ! 2363: STDFA_R	stda	%f8, [%r26, %r11]
NC_AIUP773:
	.word 0xd0de421a  ! 2365: LDXA_R	ldxa	[%r25, %r26] 0x10, %r8
CP_PST_PRI774:
	.word 0xd1ba989a  ! 2367: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd1a4111a  ! 2369: STFA_R	sta	%f8, [%r26, %r16]
	.word 0xd1a4913a  ! 2371: STFA_R	sta	%f8, [%r26, %r18]
	.word 0xd0b4d03a  ! 2373: STHA_R	stha	%r8, [%r19 + %r26] 0x81
NC_BIS_AIUP775:
	.word 0xccbe445a  ! 2375: STDA_R	stda	%r6, [%r25 + %r26] 0x22
	.word 0xd1bbd11a  ! 2377: STDFA_R	stda	%f8, [%r26, %r15]
	.word 0xd0b4d03a  ! 2379: STHA_R	stha	%r8, [%r19 + %r26] 0x81
CHANGE_R26776:
	add	%r26,	%r27,	%r26
CP_BIS_SEC776:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 2381: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
	.word 0xd0f3d01a  ! 2383: STXA_R	stxa	%r8, [%r15 + %r26] 0x80
	.word 0xd19cd03a  ! 2385: LDDFA_R	ldda	[%r19, %r26], %f8
	.word 0xd094101a  ! 2387: LDUHA_R	lduha	[%r16, %r26] 0x80, %r8
CP_BIS_QUAD_LD777:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 2389: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xd07aa004  ! 2390: SWAP_I	swap	%r8, [%r10 + 0x0004]
CP_PST_PRI778:
	.word 0xd1bad95a  ! 2392: STDFA_R	stda	%f8, [%r26, %r11]
CP_PST_PRI779:
	.word 0xd1bb585a  ! 2394: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0d4913a  ! 2396: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r8
NC_BIS_SEC780:
	.word 0xc4bcdc7a  ! 2398: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_NUC781:
	.word 0xd0a5009a  ! 2400: STWA_R	stwa	%r8, [%r20 + %r26] 0x04
NC_BIS_AIUP782:
	.word 0xccbe445a  ! 2402: STDA_R	stda	%r6, [%r25 + %r26] 0x22
	.word 0xd0d4501a  ! 2404: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r8
CP_NUC783:
	.word 0xd08d009a  ! 2406: LDUBA_R	lduba	[%r20, %r26] 0x04, %r8
CP_PST_PRI784:
	.word 0xd1bb581a  ! 2408: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd083901a  ! 2410: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
CP_ATM_QUAD_LD785:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2412: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
SET_TL1_786:
	ta	T_CHANGE_TO_TL1
CHANGE_R26787:
	add	%r26,	%r27,	%r26
NC_BIS_NUC787:
	.word 0xc8a544fa  ! 2414: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xd13aa000  ! 2415: STDF_I	std	%f8, [0x0000, %r10]
NC_AIUP788:
	.word 0xd1be431a  ! 2417: STDFA_R	stda	%f8, [%r26, %r25]
NC_PST_PRI789:
	.word 0xd1bb985a  ! 2419: STDFA_R	stda	%f8, [%r26, %r14]
	.word 0xd0a3511a  ! 2420: STWA_R	stwa	%r8, [%r13 + %r26] 0x88
NC_BIS_NUC790:
	.word 0xc4b544fa  ! 2422: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xd0d2d01a  ! 2423: LDSHA_R	ldsha	[%r11, %r26] 0x80, %r8
	.word 0xd052801a  ! 2424: LDSH_R	ldsh	[%r10 + %r26], %r8
NC_PST_PRI791:
	.word 0xd1bc581a  ! 2426: STDFA_R	stda	%f8, [%r26, %r17]
NC_NUC792:
	.word 0xd19d409a  ! 2428: LDDFA_R	ldda	[%r21, %r26], %f8
SET_TL0_793:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI794:
	and	%r26,	%r28,	%r26
	.word 0xc49b5d5a  ! 2430: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
	.word 0xd1bb101a  ! 2431: STDFA_R	stda	%f8, [%r26, %r12]
CHANGE_TLE795:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
SET_TL1_796:
	ta	T_CHANGE_TO_TL1
CHANGE_R26797:
	add	%r26,	%r27,	%r26
NC_BIS_NUC797:
	.word 0xc8a545fa  ! 2434: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
CP_BIS_AIUS798:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 2436: STBA_R	stba	%r2, [%r30 + %r26] 0x23
CP_PST_PRI799:
	.word 0xd1bb599a  ! 2438: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd0b4903a  ! 2440: STHA_R	stha	%r8, [%r18 + %r26] 0x81
NC_PST_PRI800:
	.word 0xd1bc189a  ! 2442: STDFA_R	stda	%f8, [%r26, %r16]
CP_ATM_QUAD_LD801:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2444: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
CHANGE_R26802:
	mov	%g0,	%r26
CP_BIS_SEC802:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 2446: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
SET_TL0_803:
	ta	T_CHANGE_TO_TL0
CHANGE_R26804:
	add	%r26,	%r27,	%r26
NC_BIS_SEC804:
	.word 0xc4b4dd7a  ! 2448: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
CHANGE_PRIV805:
	ta	T_CHANGE_PRIV
CHANGE_R26806:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS806:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 2450: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
NC_BIS_AIUP807:
	.word 0xc4b6445a  ! 2452: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd11ac01a  ! 2453: LDDF_R	ldd	[%r11, %r26], %f8
CP_PST_PRI808:
	.word 0xd1bb195a  ! 2455: STDFA_R	stda	%f8, [%r26, %r12]
NC_BIS_AIUS809:
	.word 0xc4a7c47a  ! 2457: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
	.word 0xd1bcd03a  ! 2459: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd09cd03a  ! 2461: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CHANGE_USER810:
	ta	T_CHANGE_NONPRIV
CHANGE_R26811:
	add	%r26,	%r27,	%r26
CP_BIS_PRI811:
	and	%r26,	%r28,	%r26
	.word 0xc8aa9d5a  ! 2463: STBA_R	stba	%r4, [%r10 + %r26] 0xea
	.word 0xd1a2901a  ! 2464: STFA_R	sta	%f8, [%r26, %r10]
	.word 0xd0acd03a  ! 2466: STBA_R	stba	%r8, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC813:
	.word 0xd0ad409a  ! 2468: STBA_R	stba	%r8, [%r21 + %r26] 0x04
	.word 0xd08b901a  ! 2470: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
CP_BIS_AIUS814:
	and	%r26,	%r28,	%r26
	.word 0xd0a7857a  ! 2472: STWA_R	stwa	%r8, [%r30 + %r26] 0x2b
	.word 0xd0ac511a  ! 2474: STBA_R	stba	%r8, [%r17 + %r26] 0x88
CHANGE_USER815:
	ta	T_CHANGE_NONPRIV
CHANGE_R26816:
	add	%r26,	%r27,	%r26
NC_BIS_PRI816:
	.word 0xc4bb9c5a  ! 2476: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
	.word 0xd0a4501a  ! 2478: STWA_R	stwa	%r8, [%r17 + %r26] 0x80
	.word 0xd02ac01a  ! 2479: STB_R	stb	%r8, [%r11 + %r26]
	.word 0xd08b911a  ! 2481: LDUBA_R	lduba	[%r14, %r26] 0x88, %r8
	.word 0xd0c4903a  ! 2483: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r8
NC_SHORT_FP_SEC817:
	.word 0xd1bcdb3a  ! 2485: STDFA_R	stda	%f8, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC819:
	.word 0xd0cd419a  ! 2487: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r8
CP_NUC820:
	.word 0xd0c5009a  ! 2489: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r8
	.word 0xd0c4511a  ! 2491: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r8
	.word 0xd0d4903a  ! 2493: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r8
	.word 0xd084913a  ! 2495: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r8
	.word 0xd0f3901a  ! 2497: STXA_R	stxa	%r8, [%r14 + %r26] 0x80
	.word 0xd122e004  ! 2498: STF_I	st	%f8, [0x0004, %r11]
	.word 0xd19c903a  ! 2500: LDDFA_R	ldda	[%r18, %r26], %f8
CP_BIS_AIUP821:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 2502: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
CP_BIS_NUC822:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 2504: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
CP_BIS_AIUP823:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 2506: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
	.word 0xd084101a  ! 2508: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r8
CP_BIS_NUC824:
	and	%r26,	%r28,	%r26
	.word 0xd0b504fa  ! 2510: STHA_R	stha	%r8, [%r20 + %r26] 0x27
	.word 0xd083911a  ! 2512: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r8
NC_BIS_AIUP825:
	.word 0xc4a6455a  ! 2514: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
CP_PST_PRI826:
	.word 0xd1ba995a  ! 2516: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd184913a  ! 2518: LDFA_R	lda	[%r18, %r26], %f8
SHORT_FP_PRI827:
	.word 0xd19b5a1a  ! 2520: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd0332006  ! 2521: STH_I	sth	%r8, [%r12 + 0x0006]
	.word 0xd0dc903a  ! 2523: LDXA_R	ldxa	[%r18, %r26] 0x81, %r8
SHORT_FP_PRI828:
	.word 0xd1ba9a5a  ! 2525: STDFA_R	stda	%f8, [%r26, %r10]
SHORT_FP_PRI829:
	.word 0xd19b1a1a  ! 2527: LDDFA_R	ldda	[%r12, %r26], %f8
CHANGE_USER830:
	ta	T_CHANGE_NONPRIV
CHANGE_R26831:
	add	%r26,	%r27,	%r26
NC_BIS_PRI831:
	.word 0xd0a3dc5a  ! 2529: STWA_R	stwa	%r8, [%r15 + %r26] 0xe2
	.word 0xd0f4903a  ! 2531: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
	.word 0xd083901a  ! 2533: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r8
	.word 0xd0c2905a  ! 2534: LDSWA_R	ldswa	[%r10, %r26] 0x82, %r8
	.word 0xd07ae004  ! 2535: SWAP_I	swap	%r8, [%r11 + 0x0004]
	.word 0xd08c913a  ! 2537: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
	.word 0xd0b4d13a  ! 2539: STHA_R	stha	%r8, [%r19 + %r26] 0x89
	.word 0xd0a3101a  ! 2540: STWA_R	stwa	%r8, [%r12 + %r26] 0x80
CHANGE_PRIV832:
	ta	T_CHANGE_PRIV
CHANGE_R26833:
	mov	%g0,	%r26
NC_BIS_AIUS833:
	.word 0xc8afc47a  ! 2542: STBA_R	stba	%r4, [%r31 + %r26] 0x23
	.word 0xd084111a  ! 2544: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r8
	.word 0xd0db901a  ! 2546: LDXA_R	ldxa	[%r14, %r26] 0x80, %r8
CP_AIUS834:
	.word 0xd0d7823a  ! 2548: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r8
	.word 0xd1bcd13a  ! 2550: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd1a4101a  ! 2552: STFA_R	sta	%f8, [%r26, %r16]
NC_BIS_SEC835:
	.word 0xc4a4dd7a  ! 2554: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
NC_AIUP836:
	.word 0xd0f6431a  ! 2556: STXA_R	stxa	%r8, [%r25 + %r26] 0x18
	.word 0xd042801a  ! 2557: LDSW_R	ldsw	[%r10 + %r26], %r8
	.word 0xd0acd13a  ! 2559: STBA_R	stba	%r8, [%r19 + %r26] 0x89
	.word 0xd084d03a  ! 2561: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
BLK_PRI837:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 2563: LDDFA_R	ldda	[%r10, %r26], %f0
CP_BIS_QUAD_LD838:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2565: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd084511a  ! 2567: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r8
	.word 0xd0b4d03a  ! 2569: STHA_R	stha	%r8, [%r19 + %r26] 0x81
	.word 0xd084903a  ! 2571: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
NC_BLK_SEc839:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2573: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0b4913a  ! 2575: STHA_R	stha	%r8, [%r18 + %r26] 0x89
	.word 0xd084913a  ! 2577: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r8
	.word 0xd0d3901a  ! 2579: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r8
	.word 0xd1ba911a  ! 2580: STDFA_R	stda	%f8, [%r26, %r10]
NC_AIUP840:
	.word 0xd09e431a  ! 2582: LDDA_R	ldda	[%r25, %r26] 0x18, %r8
	.word 0xd0c4511a  ! 2584: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r8
	.word 0xd0eb101a  ! 2585: LDSTUBA_R	ldstuba	%r8, [%r12 + %r26] 0x80
NC_NUC841:
	.word 0xd1bd409a  ! 2587: STDFA_R	stda	%f8, [%r26, %r21]
	.word 0xd1a3111a  ! 2588: STFA_R	sta	%f8, [%r26, %r12]
NC_BIS_SEC842:
	.word 0xd0f4dc7a  ! 2590: STXA_R	stxa	%r8, [%r19 + %r26] 0xe3
NC_AIUS843:
	.word 0xd0d7c23a  ! 2592: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r8
	.word 0xd08bd01a  ! 2594: LDUBA_R	lduba	[%r15, %r26] 0x80, %r8
	.word 0xd1a2911a  ! 2595: STFA_R	sta	%f8, [%r26, %r10]
NC_BIS_AIUP844:
	.word 0xc4f6455a  ! 2597: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xd1a2911a  ! 2598: STFA_R	sta	%f8, [%r26, %r10]
NC_BIS_AIUS845:
	.word 0xc8b7c47a  ! 2600: STHA_R	stha	%r4, [%r31 + %r26] 0x23
NC_BIS_AIUP846:
	.word 0xc4a6445a  ! 2602: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xd0bc903a  ! 2604: STDA_R	stda	%r8, [%r18 + %r26] 0x81
	.word 0xd05aa000  ! 2605: LDX_I	ldx	[%r10 + 0x0000], %r8
	.word 0xd19a901a  ! 2606: LDDFA_R	ldda	[%r10, %r26], %f8
NC_AIUS847:
	.word 0xd19fc23a  ! 2608: LDDFA_R	ldda	[%r31, %r26], %f8
CHANGE_USER848:
	ta	T_CHANGE_NONPRIV
CHANGE_R26849:
	add	%r26,	%r27,	%r26
NC_BIS_PRI849:
	.word 0xd0b41d5a  ! 2610: STHA_R	stha	%r8, [%r16 + %r26] 0xea
	.word 0xd0ac111a  ! 2612: STBA_R	stba	%r8, [%r16 + %r26] 0x88
	.word 0xd07aa004  ! 2613: SWAP_I	swap	%r8, [%r10 + 0x0004]
CHANGE_PRIV850:
	ta	T_CHANGE_PRIV
CHANGE_R26851:
	add	%r26,	%r27,	%r26
CP_BIS_NUC851:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2615: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
BLK_PRI852:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 2617: STDFA_R	stda	%f16, [%r26, %r13]
CP_BIS_AIUP853:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 2619: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CHANGE_USER854:
	ta	T_CHANGE_NONPRIV
CHANGE_R26855:
	add	%r26,	%r27,	%r26
CP_BIS_PRI855:
	and	%r26,	%r28,	%r26
	.word 0xd0ab5d5a  ! 2621: STBA_R	stba	%r8, [%r13 + %r26] 0xea
	.word 0xd0ccd03a  ! 2623: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
SHORT_FP_PRI856:
	.word 0xd1ba9a5a  ! 2625: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd084d03a  ! 2627: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
CP_BIS_QUAD_LD857:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2629: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xd0db511a  ! 2630: LDXA_R	ldxa	[%r13, %r26] 0x88, %r8
	.word 0xd0c2d01a  ! 2631: LDSWA_R	ldswa	[%r11, %r26] 0x80, %r8
CP_PST_PRI858:
	.word 0xd1bad85a  ! 2633: STDFA_R	stda	%f8, [%r26, %r11]
CP_BIS_QUAD_LD859:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 2635: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
CHANGE_PRIV860:
	ta	T_CHANGE_PRIV
CHANGE_R26861:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP861:
	and	%r26,	%r28,	%r26
	.word 0xd0ae055a  ! 2637: STBA_R	stba	%r8, [%r24 + %r26] 0x2a
NC_BIS_AIUS862:
	.word 0xc8afc47a  ! 2639: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CP_BIS_AIUP863:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 2641: STDA_R	stda	%r6, [%r24 + %r26] 0x22
NC_BIS_AIUS864:
	.word 0xc4afc47a  ! 2643: STBA_R	stba	%r2, [%r31 + %r26] 0x23
	.word 0xd0b3d01a  ! 2645: STHA_R	stha	%r8, [%r15 + %r26] 0x80
	.word 0xd0fa901a  ! 2646: SWAPA_R	swapa	%r8, [%r10 + %r26] 0x80
NC_BIS_AIUP865:
	.word 0xd0be445a  ! 2648: STDA_R	stda	%r8, [%r25 + %r26] 0x22
	.word 0xd11b6000  ! 2649: LDDF_I	ldd	[%r13, 0x0000], %f8
	.word 0xd073401a  ! 2650: STX_R	stx	%r8, [%r13 + %r26]
NC_BIS_AIUS866:
	.word 0xc4bfc47a  ! 2652: STDA_R	stda	%r2, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD867:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2654: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
NC_AIUP868:
	.word 0xd08e431a  ! 2656: LDUBA_R	lduba	[%r25, %r26] 0x18, %r8
	.word 0xd07aa004  ! 2657: SWAP_I	swap	%r8, [%r10 + 0x0004]
	.word 0xd012801a  ! 2658: LDUH_R	lduh	[%r10 + %r26], %r8
	.word 0xd02ac01a  ! 2659: STB_R	stb	%r8, [%r11 + %r26]
	.word 0xd1e2a01a  ! 2660: CASA_R	casa	[%r10] %asi, %r26, %r8
NC_AIUS869:
	.word 0xd0afc33a  ! 2662: STBA_R	stba	%r8, [%r31 + %r26] 0x19
	.word 0xd084d03a  ! 2664: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r8
NC_BLK_SEc870:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2666: STDFA_R	stda	%f16, [%r26, %r19]
CHANGE_R26871:
	add	%r26,	%r27,	%r26
CP_BIS_SEC871:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 2668: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xd0cc111a  ! 2670: LDSBA_R	ldsba	[%r16, %r26] 0x88, %r8
NC_BLK_SEc872:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2672: STDFA_R	stda	%f0, [%r26, %r19]
CP_ATM_QUAD_LD873:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2674: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xd0b4903a  ! 2676: STHA_R	stha	%r8, [%r18 + %r26] 0x81
	.word 0xd09c913a  ! 2678: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd07b6004  ! 2679: SWAP_I	swap	%r8, [%r13 + 0x0004]
CP_AIUS874:
	.word 0xd1a7833a  ! 2681: STFA_R	sta	%f8, [%r26, %r30]
	.word 0xd0ab901a  ! 2683: STBA_R	stba	%r8, [%r14 + %r26] 0x80
	.word 0xd08cd03a  ! 2685: LDUBA_R	lduba	[%r19, %r26] 0x81, %r8
CHANGE_USER875:
	ta	T_CHANGE_NONPRIV
CHANGE_R26876:
	add	%r26,	%r27,	%r26
CP_BIS_PRI876:
	and	%r26,	%r28,	%r26
	.word 0xccbb5d5a  ! 2687: STDA_R	stda	%r6, [%r13 + %r26] 0xea
CP_PST_PRI877:
	.word 0xd1ba995a  ! 2689: STDFA_R	stda	%f8, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS879:
	.word 0xd0df823a  ! 2691: LDXA_R	ldxa	[%r30, %r26] 0x11, %r8
CHANGE_USER880:
	ta	T_CHANGE_NONPRIV
CHANGE_R26881:
	mov	%g0,	%r26
CP_BIS_PRI881:
	and	%r26,	%r28,	%r26
	.word 0xc4bb5d5a  ! 2693: STDA_R	stda	%r2, [%r13 + %r26] 0xea
CHANGE_CLE882:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0dc101a  ! 2696: LDXA_R	ldxa	[%r16, %r26] 0x80, %r8
WR_LEASI_883:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_884:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_PRIV885:
	ta	T_CHANGE_PRIV
CHANGE_R26886:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP886:
	.word 0xd0a6445a  ! 2699: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xd0f4913a  ! 2701: STXA_R	stxa	%r8, [%r18 + %r26] 0x89
CHANGE_TLE887:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd0dcd03a  ! 2704: LDXA_R	ldxa	[%r19, %r26] 0x81, %r8
	.word 0xd0ea901a  ! 2705: LDSTUBA_R	ldstuba	%r8, [%r10 + %r26] 0x80
	.word 0xd0bc913a  ! 2707: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd0f3d01a  ! 2709: STXA_R	stxa	%r8, [%r15 + %r26] 0x80
	.word 0xd05ac01a  ! 2710: LDX_R	ldx	[%r11 + %r26], %r8
	.word 0xd1bb511a  ! 2711: STDFA_R	stda	%f8, [%r26, %r13]
NC_SHORT_FP_SEC888:
	.word 0xd19cdb3a  ! 2713: LDDFA_R	ldda	[%r19, %r26], %f8
NC_BIS_SEC889:
	.word 0xc8a4dc7a  ! 2715: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
CHANGE_PRIV890:
	ta	T_CHANGE_PRIV
CHANGE_R26891:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS891:
	.word 0xc4bfc57a  ! 2717: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
NC_NUC892:
	.word 0xd1bd419a  ! 2719: STDFA_R	stda	%f8, [%r26, %r21]
NC_BLK_SEc893:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2721: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_USER894:
	ta	T_CHANGE_NONPRIV
CHANGE_R26895:
	add	%r26,	%r27,	%r26
CP_BIS_PRI895:
	and	%r26,	%r28,	%r26
	.word 0xc8f2dc5a  ! 2723: STXA_R	stxa	%r4, [%r11 + %r26] 0xe2
	.word 0xd084111a  ! 2725: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r8
	.word 0xd0bb501a  ! 2726: STDA_R	stda	%r8, [%r13 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP897:
	.word 0xd0de431a  ! 2728: LDXA_R	ldxa	[%r25, %r26] 0x18, %r8
	.word 0xd06a801a  ! 2729: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
	.word 0xd08c913a  ! 2731: LDUBA_R	lduba	[%r18, %r26] 0x89, %r8
CP_AIUP898:
	.word 0xd096021a  ! 2733: LDUHA_R	lduha	[%r24, %r26] 0x10, %r8
CP_NUC899:
	.word 0xd0ed009a  ! 2735: LDSTUBA_R	ldstuba	%r8, [%r20 + %r26] 0x04
SHORT_FP_PRI900:
	.word 0xd1ba9a5a  ! 2737: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd06b6007  ! 2738: LDSTUB_I	ldstub	%r8, [%r13 + 0x0007]
CHANGE_USER901:
	ta	T_CHANGE_NONPRIV
CHANGE_R26902:
	add	%r26,	%r27,	%r26
NC_BIS_PRI902:
	.word 0xc4f39c5a  ! 2740: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	.word 0xd09c903a  ! 2742: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd183d01a  ! 2744: LDFA_R	lda	[%r15, %r26], %f8
	.word 0xd06a801a  ! 2745: LDSTUB_R	ldstub	%r8, [%r10 + %r26]
CHANGE_PRIV903:
	ta	T_CHANGE_PRIV
CHANGE_R26904:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS904:
	and	%r26,	%r28,	%r26
	.word 0xc8af857a  ! 2747: STBA_R	stba	%r4, [%r30 + %r26] 0x2b
NC_BIS_AIUS905:
	.word 0xc8bfc57a  ! 2749: STDA_R	stda	%r4, [%r31 + %r26] 0x2b
	.word 0xd0bc913a  ! 2751: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd084d13a  ! 2753: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
CHANGE_USER906:
	ta	T_CHANGE_NONPRIV
CHANGE_R26907:
	add	%r26,	%r27,	%r26
NC_BIS_PRI907:
	.word 0xd0f39c5a  ! 2755: STXA_R	stxa	%r8, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD908:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 2757: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
SHORT_FP_PRI909:
	.word 0xd1ba9a1a  ! 2759: STDFA_R	stda	%f8, [%r26, %r10]
CHANGE_PRIV910:
	ta	T_CHANGE_PRIV
CHANGE_R26911:
	mov	%g0,	%r26
NC_BIS_AIUS911:
	.word 0xc8a7c47a  ! 2761: STWA_R	stwa	%r4, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD912:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 2763: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
CHANGE_USER913:
	ta	T_CHANGE_NONPRIV
CHANGE_R26914:
	add	%r26,	%r27,	%r26
CP_BIS_PRI914:
	and	%r26,	%r28,	%r26
	.word 0xc8b29c5a  ! 2765: STHA_R	stha	%r4, [%r10 + %r26] 0xe2
NC_BLK_SEc915:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2767: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd0f4d03a  ! 2769: STXA_R	stxa	%r8, [%r19 + %r26] 0x81
	.word 0xd1f3601a  ! 2770: CASXA_R	casxa	[%r13]%asi, %r26, %r8
CHANGE_R26916:
	add	%r26,	%r27,	%r26
CP_BIS_SEC916:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2772: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xd032e006  ! 2773: STH_I	sth	%r8, [%r11 + 0x0006]
BLK_PRI917:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2775: LDDFA_R	ldda	[%r12, %r26], %f0
CHANGE_PRIV918:
	ta	T_CHANGE_PRIV
CHANGE_R26919:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD919:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 2777: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
	.word 0xd0c4d13a  ! 2779: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r8
	.word 0xd0cbd11a  ! 2781: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r8
	.word 0xd1bb101a  ! 2782: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd1bb501a  ! 2783: STDFA_R	stda	%f8, [%r26, %r13]
	.word 0xd084903a  ! 2785: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
CHANGE_USER920:
	ta	T_CHANGE_NONPRIV
CHANGE_R26921:
	add	%r26,	%r27,	%r26
NC_BIS_PRI921:
	.word 0xd0bbdc5a  ! 2787: STDA_R	stda	%r8, [%r15 + %r26] 0xe2
	.word 0xd08bd11a  ! 2789: LDUBA_R	lduba	[%r15, %r26] 0x88, %r8
	.word 0xd19cd13a  ! 2791: LDDFA_R	ldda	[%r19, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS923:
	.word 0xd097823a  ! 2793: LDUHA_R	lduha	[%r30, %r26] 0x11, %r8
	.word 0xd07aa004  ! 2794: SWAP_I	swap	%r8, [%r10 + 0x0004]
NC_AIUP924:
	.word 0xd0f6421a  ! 2796: STXA_R	stxa	%r8, [%r25 + %r26] 0x10
CP_AIUS925:
	.word 0xd19f833a  ! 2798: LDDFA_R	ldda	[%r30, %r26], %f8
	.word 0xd0336006  ! 2799: STH_I	sth	%r8, [%r13 + 0x0006]
SET_TL1_926:
	ta	T_CHANGE_TO_TL1
CHANGE_R26927:
	add	%r26,	%r27,	%r26
NC_BIS_NUC927:
	.word 0xc8ad45fa  ! 2801: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
NC_SHORT_FP_SEC928:
	.word 0xd1bcda7a  ! 2803: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0bb101a  ! 2804: STDA_R	stda	%r8, [%r12 + %r26] 0x80
NC_SHORT_FP_SEC929:
	.word 0xd19cda3a  ! 2807: LDDFA_R	ldda	[%r19, %r26], %f8
CP_AIUS930:
	.word 0xd0cf823a  ! 2809: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r8
	.word 0xd00aa007  ! 2810: LDUB_I	ldub	[%r10 + 0x0007], %r8
CP_NUC931:
	.word 0xd0d5009a  ! 2812: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r8
CP_BIS_AIUP932:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 2814: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xd0a3911a  ! 2816: STWA_R	stwa	%r8, [%r14 + %r26] 0x88
CP_AIUS933:
	.word 0xd08f823a  ! 2818: LDUBA_R	lduba	[%r30, %r26] 0x11, %r8
CP_BIS_AIUP934:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 2820: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
NC_SHORT_FP_SEC935:
	.word 0xd1bcda7a  ! 2822: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd19b501a  ! 2823: LDDFA_R	ldda	[%r13, %r26], %f8
	.word 0xd0b4d03a  ! 2825: STHA_R	stha	%r8, [%r19 + %r26] 0x81
NC_BIS_AIUP936:
	.word 0xc8ae445a  ! 2827: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xd094913a  ! 2829: LDUHA_R	lduha	[%r18, %r26] 0x89, %r8
SET_TL0_937:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI938:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 2831: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
NC_BLK_SEc939:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2833: LDDFA_R	ldda	[%r19, %r26], %f0
CP_PST_PRI940:
	.word 0xd1bb591a  ! 2835: STDFA_R	stda	%f8, [%r26, %r13]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS942:
	.word 0xd0c7823a  ! 2837: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r8
NC_NUC943:
	.word 0xd0dd409a  ! 2839: LDXA_R	ldxa	[%r21, %r26] 0x04, %r8
	.word 0xd07b401a  ! 2840: SWAP_R	swap	%r8, [%r13 + %r26]
CP_BIS_QUAD_LD944:
	and	%r26,	%r29,	%r26
	.word 0xd09b1c5a  ! 2842: LDDA_R	ldda	[%r12, %r26] 0xe2, %r8
BLK_PRI945:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2844: LDDFA_R	ldda	[%r12, %r26], %f16
NC_BIS_AIUP946:
	.word 0xc4f6445a  ! 2846: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xd123401a  ! 2847: STF_R	st	%f8, [%r26, %r13]
CP_NUC947:
	.word 0xd1f5201a  ! 2849: CASXA_R	casxa	[%r20]%asi, %r26, %r8
	.word 0xd1bcd03a  ! 2851: STDFA_R	stda	%f8, [%r26, %r19]
	.word 0xd0ccd03a  ! 2853: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r8
CHANGE_R26948:
	mov	%g0,	%r26
CP_BIS_SEC948:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 2855: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
NC_BIS_AIUP949:
	.word 0xd0a6445a  ! 2857: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xd0232004  ! 2858: STW_I	stw	%r8, [%r12 + 0x0004]
NC_AIUP950:
	.word 0xd186421a  ! 2860: LDFA_R	lda	[%r25, %r26], %f8
	.word 0xd0ab111a  ! 2861: STBA_R	stba	%r8, [%r12 + %r26] 0x88
	.word 0xd1ba911a  ! 2862: STDFA_R	stda	%f8, [%r26, %r10]
CP_BIS_NUC951:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 2864: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
SET_TL1_952:
	ta	T_CHANGE_TO_TL1
CHANGE_R26953:
	add	%r26,	%r27,	%r26
NC_BIS_NUC953:
	.word 0xc8b544fa  ! 2866: STHA_R	stha	%r4, [%r21 + %r26] 0x27
NC_PST_PRI954:
	.word 0xd1bb991a  ! 2868: STDFA_R	stda	%f8, [%r26, %r14]
CP_BIS_AIUP955:
	and	%r26,	%r28,	%r26
	.word 0xd0be055a  ! 2870: STDA_R	stda	%r8, [%r24 + %r26] 0x2a
CP_ATM_QUAD_LD956:
	and	%r26,	%r29,	%r26
	.word 0xc89ac59a  ! 2872: LDDA_R	ldda	[%r11, %r26] 0x2c, %r4
CP_PST_PRI957:
	.word 0xd1bb181a  ! 2874: STDFA_R	stda	%f8, [%r26, %r12]
	.word 0xd0ac903a  ! 2876: STBA_R	stba	%r8, [%r18 + %r26] 0x81
	.word 0xd19b901a  ! 2878: LDDFA_R	ldda	[%r14, %r26], %f8
SET_TL0_958:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI959:
	and	%r26,	%r28,	%r26
	.word 0xc49b5c5a  ! 2880: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP961:
	.word 0xd0be421a  ! 2882: STDA_R	stda	%r8, [%r25 + %r26] 0x10
NC_BLK_SEc962:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2884: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd1a2d11a  ! 2885: STFA_R	sta	%f8, [%r26, %r11]
NC_AIUS963:
	.word 0xd0a7c23a  ! 2887: STWA_R	stwa	%r8, [%r31 + %r26] 0x11
	.word 0xd184d13a  ! 2889: LDFA_R	lda	[%r19, %r26], %f8
	.word 0xd0a4d03a  ! 2891: STWA_R	stwa	%r8, [%r19 + %r26] 0x81
	.word 0xd13b6000  ! 2892: STDF_I	std	%f8, [0x0000, %r13]
	.word 0xd1ba901a  ! 2893: STDFA_R	stda	%f8, [%r26, %r10]
	.word 0xd0d3911a  ! 2895: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r8
	.word 0xd0f4903a  ! 2897: STXA_R	stxa	%r8, [%r18 + %r26] 0x81
SET_TL1_964:
	ta	T_CHANGE_TO_TL1
CHANGE_R26965:
	add	%r26,	%r27,	%r26
NC_BIS_NUC965:
	.word 0xc4bd45fa  ! 2899: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
	.word 0xd0dbd01a  ! 2901: LDXA_R	ldxa	[%r15, %r26] 0x80, %r8
NC_BIS_AIUP966:
	.word 0xd0a6455a  ! 2903: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
CHANGE_R26967:
	add	%r26,	%r27,	%r26
CP_BIS_SEC967:
	and	%r26,	%r28,	%r26
	.word 0xd09c9d7a  ! 2905: LDDA_R	ldda	[%r18, %r26] 0xeb, %r8
	.word 0xd07b2004  ! 2906: SWAP_I	swap	%r8, [%r12 + 0x0004]
	.word 0xd19c903a  ! 2908: LDDFA_R	ldda	[%r18, %r26], %f8
CP_BIS_AIUP968:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2910: STHA_R	stha	%r6, [%r24 + %r26] 0x22
NC_SHORT_FP_SEC969:
	.word 0xd1bcdb3a  ! 2912: STDFA_R	stda	%f8, [%r26, %r19]
CP_AIUP970:
	.word 0xd09e031a  ! 2914: LDDA_R	ldda	[%r24, %r26] 0x18, %r8
NC_NUC971:
	.word 0xd0d5409a  ! 2916: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r8
SET_TL0_972:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI973:
	and	%r26,	%r28,	%r26
	.word 0xc4b35d5a  ! 2918: STHA_R	stha	%r2, [%r13 + %r26] 0xea
	.word 0xd0bb901a  ! 2920: STDA_R	stda	%r8, [%r14 + %r26] 0x80
	.word 0xd183901a  ! 2922: LDFA_R	lda	[%r14, %r26], %f8
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP975:
	.word 0xd0ae031a  ! 2924: STBA_R	stba	%r8, [%r24 + %r26] 0x18
NC_NUC976:
	.word 0xd0d5409a  ! 2926: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r8
	.word 0xd003401a  ! 2927: LDUW_R	lduw	[%r13 + %r26], %r8
	.word 0xd0f3501a  ! 2928: STXA_R	stxa	%r8, [%r13 + %r26] 0x80
BLK_PRI977:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 2930: LDDFA_R	ldda	[%r10, %r26], %f0
NC_PST_PRI978:
	.word 0xd1bb991a  ! 2932: STDFA_R	stda	%f8, [%r26, %r14]
NC_BLK_SEc979:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2934: LDDFA_R	ldda	[%r19, %r26], %f16
NC_AIUP980:
	.word 0xd19e431a  ! 2936: LDDFA_R	ldda	[%r25, %r26], %f8
CP_AIUS981:
	.word 0xd0d7823a  ! 2938: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r8
NC_PST_PRI982:
	.word 0xd1bc585a  ! 2940: STDFA_R	stda	%f8, [%r26, %r17]
	.word 0xd0db515a  ! 2941: LDXA_R	ldxa	[%r13, %r26] 0x8a, %r8
NC_AIUP983:
	.word 0xd0ae421a  ! 2943: STBA_R	stba	%r8, [%r25 + %r26] 0x10
WR_LEASI_984:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_985:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd0bcd03a  ! 2946: STDA_R	stda	%r8, [%r19 + %r26] 0x81
NC_NUC986:
	.word 0xd0bd409a  ! 2948: STDA_R	stda	%r8, [%r21 + %r26] 0x04
	.word 0xd084d13a  ! 2950: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r8
	.word 0xd0f3101a  ! 2951: STXA_R	stxa	%r8, [%r12 + %r26] 0x80
	.word 0xd01ae000  ! 2952: LDD_I	ldd	[%r11 + 0x0000], %r8
SET_TL1_987:
	ta	T_CHANGE_TO_TL1
CHANGE_R26988:
	add	%r26,	%r27,	%r26
NC_BIS_NUC988:
	.word 0xd0b544fa  ! 2954: STHA_R	stha	%r8, [%r21 + %r26] 0x27
CP_AIUP989:
	.word 0xd0de021a  ! 2956: LDXA_R	ldxa	[%r24, %r26] 0x10, %r8
	.word 0xd184913a  ! 2958: LDFA_R	lda	[%r18, %r26], %f8
	.word 0xd11b001a  ! 2959: LDDF_R	ldd	[%r12, %r26], %f8
	.word 0xd11a801a  ! 2960: LDDF_R	ldd	[%r10, %r26], %f8
NC_PST_PRI990:
	.word 0xd1bc181a  ! 2962: STDFA_R	stda	%f8, [%r26, %r16]
CP_ATM_QUAD_LD991:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 2964: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
	.word 0xd08b901a  ! 2966: LDUBA_R	lduba	[%r14, %r26] 0x80, %r8
CHANGE_R26992:
	add	%r26,	%r27,	%r26
CP_BIS_SEC992:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 2968: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	.word 0xd0ac501a  ! 2970: STBA_R	stba	%r8, [%r17 + %r26] 0x80
CP_AIUP993:
	.word 0xd0f6021a  ! 2972: STXA_R	stxa	%r8, [%r24 + %r26] 0x10
SET_TL0_994:
	ta	T_CHANGE_TO_TL0
CHANGE_R26995:
	mov	%g0,	%r26
NC_BIS_SEC995:
	.word 0xc8bcdd7a  ! 2974: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
	.word 0xd022801a  ! 2975: STW_R	stw	%r8, [%r10 + %r26]
SHORT_FP_PRI996:
	.word 0xd19ada1a  ! 2977: LDDFA_R	ldda	[%r11, %r26], %f8
	.word 0xd19cd03a  ! 2979: LDDFA_R	ldda	[%r19, %r26], %f8
CHANGE_PRIV997:
	ta	T_CHANGE_PRIV
CHANGE_R26998:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP998:
	.word 0xc4ae445a  ! 2981: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xd1a4101a  ! 2983: STFA_R	sta	%f8, [%r26, %r16]
CP_NUC999:
	.word 0xd0fd009a  ! 2985: SWAPA_R	swapa	%r8, [%r20 + %r26] 0x04
	.word 0xd084903a  ! 2987: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r8
NC_BLK_SEc1000:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2989: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd0bc913a  ! 2991: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd1bcd03a  ! 2993: STDFA_R	stda	%f8, [%r26, %r19]
NC_PST_PRI1001:
	.word 0xd1bc585a  ! 2995: STDFA_R	stda	%f8, [%r26, %r17]
BLK_PRI1002:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 2997: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xd1ba901a  ! 2998: STDFA_R	stda	%f8, [%r26, %r10]
SHORT_FP_PRI1003:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x77ded8a966ceb1f7
.xword 0xb20ce61450ee2e13
.xword 0x1109322d1c0ad996
.xword 0xe470ee897148e683
.xword 0x91a5407f245974dc
.xword 0x57cbd5e938fe9ac1
.xword 0x0c75c72953338aba
.xword 0xd3d72bef735d704c
.xword 0xc865e76586580531
.xword 0x9574e7d3a486b29f
.xword 0xd428dc562d8e8890
.xword 0x7df12f8209e689ad
.xword 0xf4fd2f12716cc53c
.xword 0xcf534b03d0785d85
.xword 0x6e2599e7dd85afc6
.xword 0xe6aaa95ff12335ac
.xword 0xc40d8c7ccbb51fb5
.xword 0x91220378dee5c5e0
.xword 0xdda272c9eb64245a
.xword 0xabfa66c563ca824d
.xword 0x44f48cefdb9a4b87
.xword 0xbfe8ac906e14a7d8
.xword 0x4bf665f8f28596d5
.xword 0x671d496af1197333
.xword 0xa229519eed2ad647
.xword 0x452b04dac02dd63f
.xword 0x68f7c6c8115274e1
.xword 0xd16e9f15d491cacd
.xword 0xb05b3acd62b42c44
.xword 0x135c39da94d52c58
.xword 0xca487e7cbe54b557
.xword 0xcc04b31d3b89ba3d



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
.xword 0x0588836a2825ff15

.xword 0x02de12fbe878037f

.xword 0x9d567273a70d924c

.xword 0x091745d47bbedf28

.xword 0x7593db4db9e0072a

.xword 0xff420937dc42f09a

.xword 0xfff6d391e09e9be1

.xword 0x9f8d731f45925440

.xword 0x59aadac031aaab67

.xword 0xfb3d4ea64f33dae0

.xword 0x3c217bd88bf461de

.xword 0xea58072943672a8f

.xword 0x9d44a2d5ee192bbd

.xword 0xbdfba06bfaab0b1b

.xword 0x751f04e7be9dd230

.xword 0xc411a11152db18cd

.xword 0xfc1efbb8137204ba

.xword 0x61bf860c5a0190e8

.xword 0x9d87e49c86fcb9eb

.xword 0xc03dc647f6933d45

.xword 0x86f2bb0364e628be

.xword 0xda61183c811e031c

.xword 0x82aa20b00b0865fd

.xword 0xa7e7bf2b8deafc19

.xword 0xd085cfe4071796bc

.xword 0xb36ad4b7d36ef718

.xword 0x0b5eb6777748cfec

.xword 0x34d97d9576ff6c64

.xword 0x43b784908e47f207

.xword 0x9d8f27700ffbc6ec

.xword 0x62568636c55e642a

.xword 0xc134ec64f3ed95d8




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
.xword 0xad478d2b275cf950
.xword 0x4b28c457dbafd9c5
.xword 0xce9bdddd669394d6
.xword 0xd5f6b19ca200ce65
.xword 0x4e4fd64ab52eed7f
.xword 0x402171a61657e36d
.xword 0xbdc0a02b11893735
.xword 0x2d3e771cc0adf6bf
.xword 0x8f2c2ffc707c5be8




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
.xword 0xee0808d85a707467
.xword 0x87fc9d63e7399286
.xword 0xf97387e1c44d5ca6
.xword 0x08985898f4eb23fa
.xword 0x80fffb20f66f2a0b
.xword 0x8c818b8d77398fff
.xword 0x19b681bdc7d685c8
.xword 0xeede7136b4d3b471
.xword 0xc0385456567c5642




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
.xword 0x1cd82e742e79fd4f
.xword 0xb44ae3670d6ebe93
.xword 0xf95874af1bbfb484
.xword 0x0ce05d0645488e7a
.xword 0x5877299b1f9065c8
.xword 0x4995e20f9f12db5d
.xword 0x8779f5eb3e14ab9f
.xword 0x8c037091ccee7ac6
.xword 0x253ea1fb36d5c437




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
.xword 0x19d18ffbdf1635ad
.xword 0xf87b76e5abc6904d
.xword 0xbbbd33620535b569
.xword 0xec2e31b59ee75318
.xword 0x46b73de7d6bc2dab
.xword 0x335a255db7847c0f
.xword 0xd77ab845430c3da8
.xword 0x296cb9a2c23a8a18
.xword 0x214f0854abd5b3e3




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
.xword 0x8b3f0c8ab61b81b5
.xword 0xe9115fe607bde849
.xword 0x898876c1265563a3
.xword 0x8efdb6ec0fe5bd3a
.xword 0x87019752a49c537c
.xword 0xb8f213644acf53a1
.xword 0xfb92c06a85694a96
.xword 0x6d1c6ff75b3bba91
.xword 0x6e4c63605d32ce98




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
.xword 0x05812beb1029f3db
.xword 0xd5ae47aaa44509e4
.xword 0x9d118098c35f9f6a
.xword 0x708fd8c707cd8d23
.xword 0xc3e71034688d915c
.xword 0x0d787dabf4a1997c
.xword 0x21c863994e7510fd
.xword 0x66b5d6ea4d3ec3fe
.xword 0x8c48421226013a68




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
.xword 0x6da22b47984eaa7f
.xword 0x8fcf910eecb16597
.xword 0x656dca0c29528315
.xword 0x4e758dda90f5cddc
.xword 0x83e3e8d8b63f02b1
.xword 0x1ba5af4ce3b78af2
.xword 0x3775e0591650097a
.xword 0xf7ea941972a9ee84
.xword 0xdf14459b4d90dd0c




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
.xword 0xa9524742db765c9a
.xword 0x289003030dbef44c
.xword 0x8d995a35affcee79
.xword 0x87f9ce0b3aa27a34
.xword 0x3a75c15bb7136199
.xword 0x2c130629ca4903b2
.xword 0xd725274b33778d11
.xword 0xdaae8d8a1673576d
.xword 0x205189ec5d3e646d




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
.xword 0x5d826bca0a10836e
.xword 0x9c391955b735b19b
.xword 0xc8bfaf3b6c76e2a5
.xword 0xb9e741174f7b4112
.xword 0x334873752eb7609f
.xword 0x93e5631ae089f081
.xword 0x671992e4c83821c6
.xword 0x853beb0efb033e47
.xword 0xc25eb335b76686fc




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
.xword 0x36708f4a3c2fc09e
.xword 0x6b4e4d23cbec3147
.xword 0x601e84d3b8edf069
.xword 0x16e7a58b7eb6ca5a
.xword 0xabd91ed7dd9b84a6
.xword 0x1dbeb2ca6fe9e9ca
.xword 0x35a0f8fe84be4d62
.xword 0xdbe7c303e126799a
.xword 0x356840f8b074e964




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
.xword 0x0d2698169a0a8849
.xword 0xa503ba2aab8ecd4b
.xword 0x92393f9dbd6d075c
.xword 0x688b5684b22b365e
.xword 0x0d65980f11924442
.xword 0x1b8ec7afc8770dc0
.xword 0x7a2918c5db63be16
.xword 0x4c80ca0253e4d096
.xword 0xf3a01fba4d1e8a02




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
.xword 0x90f8c642e6d0ddd1
.xword 0x8f6fe2f2034f7253
.xword 0x503552485e1a018f
.xword 0x8623e31e20b8b09d
.xword 0x44135a68a3386e1c
.xword 0xb83f3a38e6a43c0d
.xword 0x3824197106f215d2
.xword 0x67a661a08a4b8c0b
.xword 0x03ed69272af4eaab




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
.xword 0x5e489ab68b16ec34
.xword 0x543d10c8bf5770ba
.xword 0x9f64f23eaee301ee
.xword 0xf4a2ffc52dc2cd63
.xword 0x4cdf23232fe0ff4c
.xword 0xab5e93021a3260c6
.xword 0x80897c148c506c46
.xword 0x9eca4c39a0db3cf3
.xword 0xb5034a6c7c8163e9




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
.xword 0x7c1f58f04d30dd75
.xword 0x7ba44a0a9538e976
.xword 0xede4324a0800a88d
.xword 0x336e9aac706c9096
.xword 0xa1af0bfdeafdef76
.xword 0x4f0ef1ea61fc6b80
.xword 0xb086e3d9d1f5a03e
.xword 0x59ce7e25a14af0e0
.xword 0x08c181cdc95d668c




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
.xword 0x26429f67c6e9512f
.xword 0x976e1de6020f907d
.xword 0x4133e17d0b79ff9e
.xword 0x5f00307929088124
.xword 0xafa1586ad442f303
.xword 0x5f4b48c6f3194b9a
.xword 0xaa4525132749e126
.xword 0xa7e235d95dec54a4
.xword 0x30e13f5bd73e3af0




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
.xword 0xbd4c2c35ebebe834
.xword 0x45034fa82118e383
.xword 0xf4d1253e71cb545a
.xword 0x7deac7d537636462
.xword 0x31b1cfd0790340e9
.xword 0x12f79a1dae6f7666
.xword 0xbcc94642e664a0a1
.xword 0x5d966899db1cb4f2
.xword 0xc645c8fa7536d540




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
.xword 0xd4f3fad6e92d9110
.xword 0x1f91678238a70cef
.xword 0xa51aba0925488b7b
.xword 0xda7589824d90e3c2
.xword 0xb07bed91ceb42145
.xword 0x0b4952eb96a4facf
.xword 0xd84b174020526359
.xword 0x03f08e40d33c2d45
.xword 0x432f35535e9f5377




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
.xword 0x8cb493b6e844a973
.xword 0x303c182d26005f99
.xword 0xc56eef6aeb234449
.xword 0x3706d6ca36713315
.xword 0x90bc8a1ae46795f1
.xword 0x953163a9aedaadea
.xword 0xc93de0b719ae61a2
.xword 0x1a056919f6f0b6ec
.xword 0x7e1391340e3a83c7




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
.xword 0x4c47c0eb076d040c
.xword 0x56b4b792e9708a14
.xword 0xe9541f0dc51d4395
.xword 0x4394585eceb81d56
.xword 0x616e94648c54b9a5
.xword 0x44882fbb47ac9918
.xword 0xa3cab73462c774e1
.xword 0xe0111cbe6724c295
.xword 0x4049b1e49371ee5b




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
.xword 0xe7c435fb4fe9f582
.xword 0x15d5e0b9a019e6ad
.xword 0x9ce250e9cd60ad6f
.xword 0x463023521db3306c
.xword 0xe4571f8b0d760523
.xword 0xc08748bae6492c24
.xword 0x2e85bc67135ce55b
.xword 0x0d2b29e1d8c267d2
.xword 0xb4e9b91ff2fd355c




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
.xword 0x5a6cd7e4f3b50490
.xword 0xba202d112f726b98
.xword 0x634103afd9537b75
.xword 0xbd9a437f919c0d77
.xword 0x3876d5c9b06b8ffc
.xword 0xbc9c210a11d604fd
.xword 0xdf1862114640d45f
.xword 0x10cbe864533e046d
.xword 0x48b3a2faa2cee5ab




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
.xword 0x39834f0a687665eb
.xword 0xd6bd0aad10d2aef5
.xword 0x6390015324b20a83
.xword 0x1f71af46adc5394b
.xword 0xa910183f9c02e226
.xword 0x98bc9a26bc2f9a7b
.xword 0x89ba74b703cbf7fe
.xword 0xdfbd52b8e1921df1
.xword 0x0ceecc3a3cff601e




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
.xword 0x4a442346dedb018c
.xword 0x567c58587fd33ea2
.xword 0xffded4c36cf8c77e
.xword 0xfe7278480940984f
.xword 0x67ef75af39838c20
.xword 0xc3544e6ef999797e
.xword 0xd02eaec4f9a4c737
.xword 0x14c137289ec8e032
.xword 0x40ec0b8b061efd45




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
.xword 0xd7ba4f47e86ecc90
.xword 0x9483a2cfd5e03798
.xword 0x195fbc4db7db9b17
.xword 0xf08555a5d07b7cd9
.xword 0x70f3785772e929c8
.xword 0xa535e1616838d4b2
.xword 0x20fc0453829af345
.xword 0x022f5286454c6a3e
.xword 0xaca6a9b5d80acae0




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
.xword 0xce93d1ab85d3f281
.xword 0xe0c9cce147317769
.xword 0x83c5589821a8e229
.xword 0x1454802cadb86d20
.xword 0x61d4760d51b39652
.xword 0xd02c42907da61540
.xword 0x345d70fbad86fadf
.xword 0x8b8399e65d56c6b6
.xword 0x02435ead2daf889c




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
.xword 0xf6670933021624ba
.xword 0xfab3be1c6af15236
.xword 0x6a8ea063e1b132a6
.xword 0x5eaec92b8f261aa7
.xword 0x08b4531f9bad0227
.xword 0x29438f05a2c660d5
.xword 0x6dee00ba406555fd
.xword 0xbcada3d56f986d43
.xword 0x5aebf43751a7f153




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
.xword 0x98fed94f2767d894
.xword 0x55eeb63e516d959f
.xword 0x52e611a4c8b75406
.xword 0x16ebef7ce51b9d26
.xword 0xff8509ef8b0a5e59
.xword 0xbc7f0f477a0a606b
.xword 0xdc8757cb939a0a49
.xword 0x451c6aafd6cfe075
.xword 0x1e20261a37464dd0




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
.xword 0xb4ea80eae9533c80
.xword 0x0f09f2ae4652f294
.xword 0xc6d21de1f5341822
.xword 0xd86b05e4a377d8a9
.xword 0x9085e839667e7e54
.xword 0x965d6956ab4a5808
.xword 0x06e2f24970b45286
.xword 0xe84c8a8919d1f50c
.xword 0xd078f5f798f15cc2




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
.xword 0x1b7cc9497284eb2d
.xword 0x477f0b5d7d2fce0f
.xword 0x889c22e97d485441
.xword 0x1adb2bf4f8a10ec6
.xword 0xa3f4deb09166dcb4
.xword 0xfdd332dcc6231e41
.xword 0xf48f010bd50e0941
.xword 0x6405cb0bfe0e52be
.xword 0xe3c283786a07e91a




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
.xword 0x6f5c2aaaefd553dd
.xword 0xfd5ef3a5a9b24ca1
.xword 0x88fb01cca4b8a298
.xword 0x43b87f104d052801
.xword 0xe3789df6ab656cd7
.xword 0x9b6b0cc8dfec4ce2
.xword 0x1d1ddac8b8c287ed
.xword 0x830931389b508ab4
.xword 0xa9eec0f8622558c5




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
.xword 0x45bb95b32b2b1f32
.xword 0x9561387f7af4ef7e
.xword 0x7f060f724609aa16
.xword 0xe0c885933c1b651d
.xword 0x9f3ac4d7f0d2d1ab
.xword 0xefeb0d35fbc6711f
.xword 0xc2457b23b3a4e272
.xword 0x6b0f4f81b0a1a9c1
.xword 0x86dd794b4621e813






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
.xword 0x9272c5ec36983087
.xword 0xcb46f47a3a374309
.xword 0xe19302056f8318a3
.xword 0xc99e73e61c2207f1
.xword 0x21842fb66a11a704
.xword 0x8314a3b22d427973
.xword 0x43c0a468c4f167b8
.xword 0xcc1cb2601c770844



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
.xword 0xaa28071dc0bbc657
.xword 0xab431bc7aa7877c8
.xword 0x8ef510739a0480f1
.xword 0x678d16a1e0d93631
.xword 0x2a7fd476af127023
.xword 0x60148047baf3b1a0
.xword 0x92f513c86c6689a8
.xword 0x471e068f36afa75b



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
.xword 0x7d12cd1df4a1067c
.xword 0x1b1ec74e71f494b9
.xword 0x2ae155cf7b174a5b
.xword 0x7b51d2d8ec2a61ad
.xword 0xfe838581501ff310
.xword 0x0a0b794cc9dddd66
.xword 0x2672c963502f44d6
.xword 0x864a1af83474d237



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
.xword 0xd8f0f5dbc90e2bc4
.xword 0x16503a85e573f82a
.xword 0x154cbd00b66d39bd
.xword 0xc1289871e20698b8
.xword 0x7ce7e412bbf3ef73
.xword 0x17b8849bbde71814
.xword 0xfb979707d55eca50
.xword 0xb518009f4e3e74e3



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
.xword 0xf7ced759859a07e7
.xword 0x1ed07f179d516ee0
.xword 0x519dd8ca73c83043
.xword 0x91bd5ed85b73d5a7
.xword 0x3c762b0ce17bf4ee
.xword 0x38de79abaae03353
.xword 0x7050ba0271a1f49c
.xword 0x2be2e6c71503cbb5



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
.xword 0x7b661fc4294199ff
.xword 0xa4ce0396887d28e5
.xword 0xe8968c3c291ae43d
.xword 0x63201bb619926df8
.xword 0x4f9c4b0d616388ba
.xword 0xa6e13321a1f9365c
.xword 0x28b9ce83a0555344
.xword 0xf764142cba1987e3



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
.xword 0xd5393aa0a9777545
.xword 0xdcaec4ed171d5446
.xword 0x1d20ce876bc2cdd6
.xword 0xd59e2a65f8ee4c8a
.xword 0xbd9fae30618b2059
.xword 0xf2eefaa63c30c2fc
.xword 0x23847695804cf117
.xword 0x43aa5fa7363902c6



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
.xword 0x6efca77b676bdbba
.xword 0xd0ff72309fcf820e
.xword 0x2f9cfb519f0c3f71
.xword 0x8f2b0dd09471e9d5
.xword 0x7d28ba360231d47d
.xword 0xc1432cbc0fc1e407
.xword 0x52f1b264a0105699
.xword 0x5479b37a829e15f8



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
.xword 0xed306a400d3127cb
.xword 0xdd5e9a5200f10901
.xword 0xd72dc14fd0a69816
.xword 0x3b174eeeba1f2611
.xword 0xc0fa3d14c4001931
.xword 0x138a94bce8aa7cdf
.xword 0x4bb55239337fcb83
.xword 0xb51bd3e90f6044b4



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
.xword 0xb120a543ae961963
.xword 0x4b43f4dde3ab8005
.xword 0x598008a6ab560348
.xword 0xc34d7f73db507ec7
.xword 0xf03c31edcf775f37
.xword 0x3e0f555b5fa19f80
.xword 0xf971881de1aedefa
.xword 0x159efc4848d4588e



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
.xword 0xf6b0fc6fd2edbf25
.xword 0x85206156cd708646
.xword 0x3bcc3fc3309cb743
.xword 0x1c5c9fd68e408b9a
.xword 0x732fe24e4367e062
.xword 0xab388fc1089c770e
.xword 0x3e25e1c8a2553ea9
.xword 0xf3695129989c993f



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
.xword 0xd60ef95dd6807d59
.xword 0x7bcc1f6aaf8212dd
.xword 0x35d82db3176b13d9
.xword 0xb1dfd98f49ea5bf7
.xword 0x5bc9bfaff698966b
.xword 0xfe0dfe551a7c2200
.xword 0xacc4d69d029a7f4a
.xword 0x48dad976d9a7993e



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
.xword 0x4bd3bdfc3a061519
.xword 0xd6dc17a3b4f0a791
.xword 0x7a59b3c9579a0c18
.xword 0x11a2f48fc35f3845
.xword 0xf7b715856a07c109
.xword 0x9ddd93fb6579ee42
.xword 0x1649866c183b999b
.xword 0x3dbe2fe30c40c496



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
.xword 0x426a895d3c207540
.xword 0x9fd30d385e37e263
.xword 0x1b16a710186f0a56
.xword 0x43f0d5022caa6090
.xword 0x546a85135a2ab8e4
.xword 0x8162666dd09b6715
.xword 0xd87619f5de4551de
.xword 0x3cd7e6e72bead97f



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
.xword 0x9035563f275855b0
.xword 0x491f27cde107994b
.xword 0x26b05ac6cfdc4c8e
.xword 0xf1cd3c1ae63e36bc
.xword 0x64fac2ea1e8cd2e6
.xword 0x17d6aa8b067ce379
.xword 0xa172e357aa2786fb
.xword 0xc83f8319b2198740



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
.xword 0x2a3d6d41de0fa5a3
.xword 0xb419007eef865b23
.xword 0x0a254de3368f0797
.xword 0x8faa717e49341cb6
.xword 0xeae8e248de3573db
.xword 0x542ce62774589c79
.xword 0x3493181a1a6dc9ad
.xword 0xef0766f3185e8f7c



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
.xword 0xf8f3e5020f5aa314
.xword 0xe7e68dfdb98aeab4
.xword 0x82a4d606c366b71e
.xword 0x8c692d9d89bec5f1
.xword 0x9e577481dbaf115e
.xword 0xe6018c8ae64a46f7
.xword 0x5845fc3e4038c5ba
.xword 0x302230a2d4b6d16d



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
.xword 0x153660292e471797
.xword 0x23d52568e955c239
.xword 0xb205b082c16603a4
.xword 0x98b63a464a1cd4cf
.xword 0xab9f10e0410bc26f
.xword 0x40dbe07397abf8d0
.xword 0x03d7c112e5125f44
.xword 0x67f13461a29d7b4f



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
.xword 0x65a5cd914376b38f
.xword 0xdebd589cba287e24
.xword 0x7d541b1c5bca14e5
.xword 0x65adf6859e0a849b
.xword 0xd53a939700c60d58
.xword 0x07a021f7495d1803
.xword 0xac8ec23777cff7f5
.xword 0xab946523f8ebd558



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
.xword 0x0896b3142032d956
.xword 0x6ac2ecbf062f5a5e
.xword 0x58a199b2ee598d05
.xword 0x0865ea619a649ea9
.xword 0x4911ee04b5cef0ab
.xword 0x4d22a2ca548916a7
.xword 0xe8001369136acf03
.xword 0x2dd3b491110c766a



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
.xword 0xf468cc88cb76179c
.xword 0x997acc7e2820e78e
.xword 0x1ad013a0963c55c7
.xword 0x5b553b69677f9b01
.xword 0xb60c70274363fe8e
.xword 0xc02b6400532e4009
.xword 0x9f488770d0805e88
.xword 0x382e012e747b08bd



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
.xword 0x3b883482211e6886
.xword 0xceba5882ab9ef669
.xword 0x0e78a3e3e95ecc65
.xword 0xba17229353df684b
.xword 0x608c6de2d88fb405
.xword 0x9ef38364d71d31f7
.xword 0xe9b41a99ae0613e1
.xword 0x5ead32be353c5a14



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
.xword 0x2c8b2a844b2cc3c1
.xword 0xc0656cdf9a7a6f59
.xword 0x8102397655b7289c
.xword 0xd0a29c555bf941ca
.xword 0x391ae5615a9e1b4d
.xword 0xf8e108b07f34465f
.xword 0xeaa9cdb81d7ab16f
.xword 0x0bac0d420cf27b25



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
.xword 0x8dc766a8f3746f6d
.xword 0x4b336d2c02d92873
.xword 0xf2b18606210cf561
.xword 0x4c25c764d0552142
.xword 0xf97209133d1a93d1
.xword 0x68ec990dd9e94585
.xword 0x809cafa4574b281d
.xword 0xe3d5d9b84a219752



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
.xword 0x9cfc00eb865b00e3
.xword 0xd4fe610425234f60
.xword 0x241b7ecdfddf7886
.xword 0xd897d87cc55ecb35
.xword 0xe3ea09c194cc939a
.xword 0x7e7bc921e3abc994
.xword 0x7a17e31d11655ffd
.xword 0xf7ca9924cdf33057



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
.xword 0xbd223682a31df957
.xword 0xd83d00b47a431922
.xword 0xfef7260cf78e4a63
.xword 0x07b1a5a0d1de38af
.xword 0xbb3cb180f0b3b4e7
.xword 0x6466813cd991e1ee
.xword 0x49049ae47c65a7a5
.xword 0x9da20e3362dc7784



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
.xword 0x2e59671e401a141b
.xword 0x03fa5ceae6cc168f
.xword 0xd141d395fce70d6e
.xword 0xaad7cdb44181eb22
.xword 0x31d3c61545cc33f6
.xword 0x56efa23bd535d728
.xword 0x7b4693eaadc71764
.xword 0x616fc6cec760efad



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
.xword 0x8c3a6bfa25e1ba8d
.xword 0x7d0e8453ac078f90
.xword 0xb5d927e0e14ce5d1
.xword 0x833bc8fea9138d85
.xword 0x9be96ced48f616ba
.xword 0xa3d6d65d3f712611
.xword 0xd166a9a7f78a6734
.xword 0x19f32420642b9b5d



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
.xword 0x195dd5073dbac059
.xword 0x42938af1002b3d9f
.xword 0x7f1e8bff4e6b88e8
.xword 0x49039b98cceb2ff8
.xword 0x491cb628e3961f2d
.xword 0x4baee59bfad08d60
.xword 0xcc8bbd39cc1658c3
.xword 0xa322418f923e8a24



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
.xword 0x466041eddc50c43d
.xword 0xe8a8e168fa77c2bb
.xword 0x490017548b4b2be5
.xword 0xe0181bf7f2b99680
.xword 0x89888f278e466035
.xword 0x7367e8a0132052e2
.xword 0xf4ab04995b60deca
.xword 0x9aea51e12936455f



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
.xword 0x87bd80f04e7708d0
.xword 0x87484ac4f6794c9a
.xword 0x893126702270754f
.xword 0xa7f8235d61d4a624
.xword 0x2f01e877dde9fccf
.xword 0x2a9fe65ab17bc7c0
.xword 0x9cf495a191e455d4
.xword 0x87c36b711be8b418



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
.xword 0x72934aceff3f61a0
.xword 0x32012cc1c42a029e
.xword 0x9f3199e579562b0a
.xword 0xfa26461bbbf4e8ad
.xword 0x9b9695ae043e1567
.xword 0x8100e025debca9a4
.xword 0xfebe79bc702de267
.xword 0x57cfc316a165c169





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
.xword 0x0467d10b4b7aba6d
.xword 0xd5d9cae25d985feb
.xword 0x67dea020927112e9
.xword 0xeab0267f0118106a
.xword 0x887d83f1e3265eb4
.xword 0x4bf8e4cd888b6d19
.xword 0xcfc6502ed0577af7
.xword 0x18c881dc7513c714




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
.xword 0x6f8a81e68725db10
.xword 0xf479bb2675f44593
.xword 0x43406ed37aed5bca
.xword 0x61143f25e62b14f0
.xword 0x54c61097b670cc7b
.xword 0x880740a059210210
.xword 0x5fef42b6784b3d31
.xword 0x01bb165b6a02ecb6




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
.xword 0xf33876325d545ccc
.xword 0xb6aad3bf53bde361
.xword 0x460996d937666833
.xword 0xd9fa190219a80024
.xword 0x79f6409928c27394
.xword 0x83a155f1bad126f5
.xword 0x8a52484edb9ba89d
.xword 0x0a56d0e60d98d944




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
.xword 0x8fa0b3fa05c4e8d1
.xword 0xe40f93717727fb75
.xword 0xf2021e272a2b04f2
.xword 0xb60d7f02c89f98b4
.xword 0xf0ec25f022a38ff6
.xword 0xb49cb33b4f5cce97
.xword 0x7af703c21ecc557c
.xword 0x5ff5147254568109




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
.xword 0x456e9e9f072d7a80
.xword 0x28fbb9ec7f609949
.xword 0xa7dce680ee8deaa6
.xword 0x98e4feddfd4381dc
.xword 0xebf8813cd19a2537
.xword 0xe44544e3aabc2055
.xword 0x07d2f77654d0abd5
.xword 0xf6d5656aa1f37809




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
.xword 0xce2971d01bfac524
.xword 0x5daf76eb2319eed3
.xword 0x91f397dfcd8463cc
.xword 0x98c73652c46af4c8
.xword 0x102c69c9243e61e6
.xword 0xfb32123f2e33f590
.xword 0x4ad1c957552064f6
.xword 0xcec028f215cedac7




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
.xword 0x3f390472f0564dc9
.xword 0x92f1c0baa3b9019a
.xword 0x0c82b4e63ce0b805
.xword 0x01feb59cd0f7f106
.xword 0xf753e2df4488dbc5
.xword 0x39cbe19b86516a9e
.xword 0x5ccabe815142bbc1
.xword 0x18afbf729847ce61




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
.xword 0x06de1ef887a464cf
.xword 0xf2adc01d64bfe49b
.xword 0xb50111e4bfb12e0a
.xword 0x6d3ae2c666cf044b
.xword 0x42a92789467a0b8f
.xword 0x2410a07ee022f832
.xword 0xd15abda19297f4e6
.xword 0x85b6ab5e5b564581






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
.xword 0xd74029e8e15ebe7a
.xword 0x18a3025ecd59c996
.xword 0xdacaa006c04f51e2
.xword 0x7a258246aa98a764
.xword 0xa3f67faeb8d2e53c
.xword 0xebf2a355823c2309
.xword 0xadc65f3b10edc822
.xword 0xbaa00f3747ba7d52




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
.xword 0x0bae99c98d63d5cd
.xword 0x9ed43cb1c9d0e4a0
.xword 0x6d9212a1051861e4
.xword 0x74af4f523e65c2e1
.xword 0x69737a442ce91616
.xword 0xcfe80ea5cc722ac5
.xword 0x8afe982655819abe
.xword 0x2364f5d41de8bcc2




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
.xword 0x7db8086cc748ec96
.xword 0x9b77024d4f66ca4f
.xword 0x6af1415e7fee543d
.xword 0xfb20e326151d21d1
.xword 0x33dda27abc7d1e12
.xword 0x9a00cfba6349c9ba
.xword 0x5c5f334f0888a761
.xword 0x25551079894721ce




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
.xword 0x0460e85587fa290d
.xword 0xd4ddd077b9757942
.xword 0xc3fcc8864bdf1ce8
.xword 0x2c74f35b2a668172
.xword 0x7b77d799a771a7df
.xword 0x15f2ca1b5fe92638
.xword 0x9cf061d6c31b301a
.xword 0xab61fd5870818169




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
.xword 0x5ee6ca2fc4e42a22
.xword 0xd2981e4b908eda32
.xword 0xc5b40a032721762d
.xword 0x21e4d66801b924d0
.xword 0xb32468c73a8ec5e2
.xword 0xb2a2cd2ec340f826
.xword 0x9df8b0c785e624b7
.xword 0x9093a74f215990bd




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
.xword 0xbc8bf1c81645ad56
.xword 0x3fa773f706ddbf7f
.xword 0x391fb35007b67e13
.xword 0x5910ffd8e20aabb4
.xword 0xf27cd8f48c0b6728
.xword 0x1d2f4810dbe27a31
.xword 0x64b6582da63eaedf
.xword 0xdac0f22662b98d55




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
.xword 0x39ec08571b37d282
.xword 0x8d8acb9f49d9b928
.xword 0xb5294a60a6e5d5ce
.xword 0x25baa26ef0cd36e4
.xword 0x1428eaa0d2fe2704
.xword 0xb749c33d1c324a68
.xword 0x0b9157f59696fda7
.xword 0xcd6f9454639ae400




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
.xword 0x29b34fafe4c1db23
.xword 0xda04afd7cdfd4b22
.xword 0x650768b5495fbf50
.xword 0x75cadde34f0b886a
.xword 0xb794d536e8d22f45
.xword 0xc9f278c130bd4541
.xword 0x44ab769b14131346
.xword 0x3a72b003684d4d75






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
.xword 0x57ccd15bb086411f
.xword 0xfff53506e352113e
.xword 0xcacd829b4a1d6bee
.xword 0x8ce6fb6225bf1d13
.xword 0x6ccce60f41962d38
.xword 0x591c54f8f29f14b6
.xword 0xca93b97518318fb1
.xword 0x8511dd66386139f6




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
.xword 0x22ac3a7de27ac17a
.xword 0x0f3303b53e22049f
.xword 0x418c25b63bb32087
.xword 0xc0f4aa038d868d4b
.xword 0xed81dd66e42c1813
.xword 0xba34b773b54cd1e6
.xword 0x6dd61d57069284ca
.xword 0xb96781b4b879b0df




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
.xword 0x6f9f7ca2ae6052d2
.xword 0x51247177d3fbf987
.xword 0x30d5929691412187
.xword 0xb7d73745ba8d0f3a
.xword 0x1ab56b2757b5f864
.xword 0x9ee2e6c54ebdbdcf
.xword 0xb2740512dadcfabe
.xword 0x523facc201dbf45f




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
.xword 0x7bd0e4504e643994
.xword 0x3e24c156c8308d42
.xword 0x00f53612ba7ffdae
.xword 0x4d7c9c7daf318b01
.xword 0x20d67849dbc8c486
.xword 0x37b99ce71013e6af
.xword 0xe453ba3d42a9a1a2
.xword 0xacf6375eba683cd1




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
.xword 0x4aa11648b3d5c917
.xword 0xa58655da80f43d14
.xword 0x75bcc7b8bcbf78e8
.xword 0xf626b13cd1dab146
.xword 0xb03c141541785040
.xword 0x12b088798ac01e1d
.xword 0xbb9d3055f73d4e98
.xword 0x46725ad84eb670e7




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
.xword 0x50be4d9dfc525f12
.xword 0x1f88f36e7a06dec6
.xword 0x8786eaa64c5660d9
.xword 0x41093e21e137f212
.xword 0x6f2ee546edb3a64d
.xword 0x435cbf8bf947a17a
.xword 0x192818a2810b0da6
.xword 0xaf5e851bb126ff6d




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
.xword 0x1f22ac1e6e609724
.xword 0x2fe56d5cf971980b
.xword 0x6eaf44a09ae27ae8
.xword 0xa1cb2bc8214d27f7
.xword 0xc35e01b3fca47528
.xword 0x99f35c07c19f6ff7
.xword 0x230da707e05801f2
.xword 0x495bb22e408a8088




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
.xword 0xc6a92b104aec0435
.xword 0xbe3699ec0c553360
.xword 0x127a6c53e353dc8e
.xword 0xee0d3e9476ce5907
.xword 0x4b4c6c6f78a30001
.xword 0x6f5e594dfbb5b598
.xword 0xdc5c18f0f4499066
.xword 0x90d31018b64e92ef






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
.xword 0xaa90f5f8c85dbb41
.xword 0x6c8526404db3bf3f
.xword 0x11b73d31cdb1745a
.xword 0x597558ca4d8f1a9b
.xword 0x27111940e1d5c882
.xword 0x89d30023d140288c
.xword 0x402f495ab925abc7
.xword 0x196bfe98f2257117




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
.xword 0xb3d8da3465e97443
.xword 0x12becef0282a7ae8
.xword 0x3bf40731a6dee5c5
.xword 0xf19f6d743c49805f
.xword 0x5bb3691c433cf18d
.xword 0x157452d07d801dd7
.xword 0xd227c58bc30eebab
.xword 0x95aac9ae1b72ee1f




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
.xword 0x247bc7056ce6d378
.xword 0xb0844c5a713974c6
.xword 0x31efe4953b982b66
.xword 0x4cd9be7d5ba43cab
.xword 0xe6fc9d9c9ae809e6
.xword 0x1aae57dbe30c1ee1
.xword 0x8b56136ee45025f3
.xword 0xeda875d84a4eba2a




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
.xword 0xe2cf645871f40d63
.xword 0xacaf78340423aeed
.xword 0x9562ddc4a0321380
.xword 0x78627f09e70c078c
.xword 0x2c5243a3c5b0d577
.xword 0x87cdee8efb83c77c
.xword 0x938dd46b70a52dfb
.xword 0xa930da6d6872801a




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
.xword 0xaf3d55ce014b41aa
.xword 0xc89355790f63fbb9
.xword 0x55d8b6abdab6fbe7
.xword 0x4701e35dd796de48
.xword 0xd13900b6ba8c9226
.xword 0x270d1f4bb4744c9b
.xword 0xb51b0a13fb2f87d5
.xword 0x9c16b711e2ce411a




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
.xword 0xe567e2a64145b98b
.xword 0x52bb719cabb3d415
.xword 0x56a91a6750fa6816
.xword 0xdba75d729f6100a3
.xword 0x21ee3350cb6a6e47
.xword 0x0875f128b44b4a62
.xword 0x8b58cdd6b266c601
.xword 0x10661502117dcd72




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
.xword 0xcc342c28fd2e9c6d
.xword 0xee3d1c03c1a07a75
.xword 0xce860f4827937226
.xword 0xc2dff6a849856027
.xword 0xc9b79ded834630a3
.xword 0x458c7c561716304e
.xword 0x7a015a8557dd7e4a
.xword 0x96494d2d1556c516




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
.xword 0x6e4625cb893b5a08
.xword 0x6564bb0ca1f8d719
.xword 0x9de71c5f25846724
.xword 0x5035ebb157c64341
.xword 0x16f75577ffbfe0ad
.xword 0xe1c936b16e55f53d
.xword 0xc40fe5f1915585a7
.xword 0x099743bcbed230f4






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
.xword 0x6c62168ed3655960
.xword 0x41a245399226911f
.xword 0x4c713aec72228d3b
.xword 0x47d3898bc2a73b22
.xword 0xe08c777519ba90db
.xword 0x00d8c3e82bf3b4f3
.xword 0xaeb09094014fd866
.xword 0x0b9ad987faf10155




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
.xword 0x8bed0a9a9c0e4569
.xword 0x471a2bf485e75972
.xword 0x4b32884ec1883878
.xword 0x5e206379464c54e7
.xword 0xa16097fc179296b0
.xword 0xf94a69ed685187a3
.xword 0xf29920700ac8c8ee
.xword 0x228801883a78d66f




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
.xword 0x085d7f53e4a8e3d0
.xword 0x2fad60117a719f34
.xword 0x51cf463db4dadebe
.xword 0x291e99fe49321d20
.xword 0xfef0939f35d29423
.xword 0x4f77c1c43d7b4df0
.xword 0x061a3c82ed891d81
.xword 0x42c5219275a2d5ef




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
.xword 0x44706b8e8fe52b26
.xword 0x600e61c279d72c9c
.xword 0x5194f03b2948493e
.xword 0x974560566893319b
.xword 0x0d0ab9f0a04c71ba
.xword 0xc9ea55fa71a27075
.xword 0x1c3e25d50e081f37
.xword 0x9bae62f5b03cfe09




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
.xword 0xea82ceb8fa78e45a
.xword 0xfdd06737411c122c
.xword 0x6b397712d6c6dd82
.xword 0x6376380ed4147c76
.xword 0x67095a7ce9d8a9d2
.xword 0x9b5d30f669b33c06
.xword 0xb2d0534a8ee85c3e
.xword 0xcd9ce6079681b560




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
.xword 0xc552b67cf46e2933
.xword 0xf5635c90cf0b4c13
.xword 0x6717e973829d7a17
.xword 0x33ed76bb0e658661
.xword 0xb1dd23d4784efbe8
.xword 0x78e4e6fca92fe0ff
.xword 0xad3fd45fe320151c
.xword 0xd4789bcb0fe08519




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
.xword 0x2a8573fb36e99df7
.xword 0x62b4ef687d6272c5
.xword 0x94362cbd467f7648
.xword 0x8a7e7c345588910c
.xword 0xea497dc854cd4bf8
.xword 0x6404c32c0c85f8a7
.xword 0x2c482cce7c2436f9
.xword 0xab75643d35fe7126




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
.xword 0x366d7ddf2650a66d
.xword 0xf6b7577c27bea5d3
.xword 0xa2d2254ee2ac8f85
.xword 0x5cc9d703f667f404
.xword 0x23e7ab17a67e153a
.xword 0x718c07bfe392afab
.xword 0x8ab00e171fa5cbb9
.xword 0x8872fa39a8f6465d






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
.xword 0xfafc8155d5ade1f9
.xword 0x29b81fc3f7d56705
.xword 0xfbe8434d14082b4f
.xword 0xd2b463cf6a9c9f84
.xword 0x7c7e9287e5fbe06d
.xword 0x296a37c3455eb008
.xword 0x39df7e2d881cd477
.xword 0xf1ae748b645146c2




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
.xword 0xcf745d7971f48ac7
.xword 0x1141779e73b9be38
.xword 0xc964415ddd2a0e75
.xword 0xb247b52da2bfb3e3
.xword 0x1cd3b44de27243d4
.xword 0xfc149d398fac06aa
.xword 0xeb41a94c238f6b20
.xword 0xbdde86989218ae94




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
.xword 0x9d4837f848d63632
.xword 0x5dbd0dc04d4fe37c
.xword 0x24e4459461d32e2f
.xword 0x2430664197c16495
.xword 0xef94ecba36a0324c
.xword 0x31f03d3a78d97a87
.xword 0xd87890c62e162195
.xword 0x43b5fc5b03de3258




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
.xword 0xbfbeedfe4d9fa9b0
.xword 0x3552da96bfcd2a54
.xword 0x7ed8770e4314b1a3
.xword 0x2dde396dd4a97cc0
.xword 0xd9207c45e8d83bbb
.xword 0x17c301ccf9e29e39
.xword 0x7a031103cb819225
.xword 0x9a38f5c899212871




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
.xword 0x30b4b63dd1d4b417
.xword 0x9da09e11ba9326a2
.xword 0x4eedef3e2324464b
.xword 0xdba15ed9b705333f
.xword 0xd40596848e527a8c
.xword 0xa1c748bf6b92f6d0
.xword 0x945a607e45c699bc
.xword 0xb34ecef82bda80f7




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
.xword 0x23f8c9b6aa964abb
.xword 0xced99d15f3fa837b
.xword 0xcc5a02c11d52a308
.xword 0xb808fec445e3d94f
.xword 0xf60b87042ea6354f
.xword 0xcc3d11731c125f84
.xword 0xd160f96611a227f2
.xword 0x68ef7cfc4039e5ce




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
.xword 0x60a1e11746da02f4
.xword 0xb699040f8abf1be2
.xword 0xbf47277ca5c38a66
.xword 0xda89deca079a9712
.xword 0xa34c646e0ab34267
.xword 0xdb6cac8fbcb08bc4
.xword 0x1fdb46daee3752bb
.xword 0xd881baad47bbe1f1




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
.xword 0xe0398886092cc58d
.xword 0x4d866edd0dd91caf
.xword 0x2ffe58a06d04a62d
.xword 0xd71b3fb18c1d74f1
.xword 0x86f43612ead5bb3e
.xword 0x59d901008c632045
.xword 0xdd3d778dcd36084e
.xword 0x8c206d8ff539b67d






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
.xword 0x41a21437c1c36896
.xword 0x678e00bcf0617df9
.xword 0x0e0634cfd4ccacfb
.xword 0xbf762c6f2c1cb129
.xword 0x85a1f212d0111ecf
.xword 0x6a08f664f973a9c9
.xword 0x05ca62f3e5c4da7b
.xword 0xdefbfc72f1cb2c42




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
.xword 0x6284b210aaefa7d7
.xword 0x03704a33559596df
.xword 0x00e144ba05bfa189
.xword 0xef89049f5776e235
.xword 0xbd625a9e91afb877
.xword 0x6bbf2ded3ffd1660
.xword 0x4f192a57a01ea24d
.xword 0x90fa1a374bf454f0




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
.xword 0x30acb269c7956ce1
.xword 0x4509e16427f497c0
.xword 0x205e082085ed603f
.xword 0x0756122eaf7747f4
.xword 0xbb216fe8db6322aa
.xword 0x72fcfaa7322ef59f
.xword 0x2cef0408eecfaea6
.xword 0xb04101f889bc99aa




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
.xword 0x4783febf8b0c6ccc
.xword 0xcbe084b5176eca49
.xword 0xc16b9b94bcd0be36
.xword 0xf19391565354a26c
.xword 0x73ddfc67953e7e10
.xword 0xa55d25b1789e1924
.xword 0xa95fe24c40b62e06
.xword 0x67d91328dddb5ea9




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
.xword 0xafc2ea3553bb060c
.xword 0xae5718df19d6ce60
.xword 0xe0fbfc92e13c5a79
.xword 0x0637c75877738d8c
.xword 0x988c4bc37b92fc46
.xword 0xac0f8ee2eec24a10
.xword 0x094adbb81c81ed62
.xword 0x7f5135654979a5cf




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
.xword 0x5ac0c3260e1a6203
.xword 0xff9822610292c7b5
.xword 0xf97ae8b7780c1310
.xword 0x8c3309e61f863ae3
.xword 0xfeaa4a01f993f086
.xword 0xb42b84943a6fdee3
.xword 0xb3267650339b8bb9
.xword 0x0b9357f6d4cffe4c




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
.xword 0xb25c8418bb4885e8
.xword 0x8a79c99f9d2a8a82
.xword 0x988bd7e69add6f76
.xword 0x72aa61adea5b1986
.xword 0xf69b2c40370ad6cf
.xword 0xbc729f0a104d8735
.xword 0x6bd49f3d212de053
.xword 0x5d4c84f8623fefb7




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
.xword 0xfb9ab7e45c25938e
.xword 0xa07cade9f6d870f6
.xword 0xd5d9cdcfa8840e89
.xword 0x99c748a053b812ab
.xword 0x3fc37e6e4ab3731d
.xword 0xba82be5fe5b9dce5
.xword 0x4ae96be4e143aef7
.xword 0xdcf7f326ca52b56c






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
.xword 0x5ae0bde95686e0f3
.xword 0x5be36f6e6c28a146
.xword 0x9fc344be832b69e9
.xword 0x2cf69a91dcfc6746
.xword 0xf53322ce784f52d5
.xword 0xbff2c319433d1a7f
.xword 0x62f8d2b9496713c7
.xword 0xf22b04379ba02dc2




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
.xword 0x1506f04de52ec179
.xword 0xbf2e60d51b978d65
.xword 0x7bb9c3c0422594c1
.xword 0x5f97f884f2d72621
.xword 0x433f26161a715cb3
.xword 0x69b5c2d1209df524
.xword 0x483fce51372ac7a7
.xword 0x74996e447b0e8d98




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
.xword 0x1e9986209c1085b3
.xword 0x9c003aecd6a6412c
.xword 0x25028412a8e5f0fc
.xword 0x1769e9643564e1f4
.xword 0x60edf56e4c1a1655
.xword 0xe378e3bf80ee3f58
.xword 0xd38bc8de78bb9c2c
.xword 0x7b680aa93701c199




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
.xword 0xb500e05328178bcc
.xword 0x3eb0682d671288e0
.xword 0x5eab71c76bfcc6a5
.xword 0x799da4d7bb7b1178
.xword 0xb5439f9dc76cbb37
.xword 0xde26a2d8cf960a09
.xword 0x06c56a6023e406b4
.xword 0x32bfb1cb0b52ba6b




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
.xword 0x34b7cc32444122f4
.xword 0xf43dac59eb4feedb
.xword 0xa4eccad70c2c3f2a
.xword 0x7cf5eb877b44c9a9
.xword 0x1c6075a4283aad31
.xword 0x7d3d582f14eba728
.xword 0x70cd07f79261e4a9
.xword 0x0070ddbcbc47dd1b




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
.xword 0x2139d4f9cdba33cd
.xword 0x32dbc77335f7a7cc
.xword 0x74166aa61e239a1a
.xword 0x9c83a641491ae038
.xword 0x0404b7a181418f49
.xword 0xfb0681614d353a59
.xword 0xc07a2206b45369dc
.xword 0x129243e43bb31520




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
.xword 0x91c211fad0f5f844
.xword 0x7690cb58e14bf391
.xword 0xb1f7504ffb11da2f
.xword 0x24e134297584542d
.xword 0x5706bfdbd73c4790
.xword 0x8120e8aa7be11c18
.xword 0xdb819f0b7873f28a
.xword 0x82d9d1072dec4308




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
.xword 0xa8a4bafb6a13f48c
.xword 0xce9365a46be504fe
.xword 0x755849e7a875e1bb
.xword 0xc9d0eb088d132e10
.xword 0xafe7a06b380dfc72
.xword 0x9802016b36976d5d
.xword 0xe43c244be0d162c6
.xword 0xd973b93169ea0b8e






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
.xword 0xd8ab9bbbdcba86f9
.xword 0xef2b2f957b9a41cf
.xword 0xe167720123157263
.xword 0x55fc319e7343f99a
.xword 0x95c3479856dcc980
.xword 0xa2fe7e5031ca3469
.xword 0xd1c39749817e2e03
.xword 0x058d23e3c8359abf




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
.xword 0xdbaf027f11f8a8cb
.xword 0x22531530a8de3af7
.xword 0x256f14eb639a5319
.xword 0x4a8e9a54561d43fd
.xword 0xfe240522325449bf
.xword 0xcbe949b9db3bbee5
.xword 0xf5ccd0c5c8c7a96f
.xword 0x8e284e371a2dec42




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
.xword 0xd66576819e465e50
.xword 0xb4124c1d9d941e3a
.xword 0x3461ab475116f543
.xword 0xfae5e8eaac7c1f8f
.xword 0xa0c5763bc2c59b99
.xword 0x4d6cd4aa7f8ca43b
.xword 0x0fdf1a57350a45d2
.xword 0xb1a836d039140859




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
.xword 0x0f11c974d2278a67
.xword 0x81c3f7033027f77a
.xword 0x412241f4afea2256
.xword 0x864fd9c517ce393f
.xword 0xfca27b99d1a899f6
.xword 0x4f29ff489b68f9f7
.xword 0x4979b8c490319c02
.xword 0x22ff715dee64177e




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
.xword 0x2b7c7010247dfab1
.xword 0x811dbeaf10f5765e
.xword 0xeee294be374af748
.xword 0x7dc4b6b5f41df221
.xword 0xec63463b2c449a9a
.xword 0xb98be40d6a01a31c
.xword 0x4c6575fdab9b730b
.xword 0xbdc815ddea0d9530




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
.xword 0xec73a488d1f3506f
.xword 0x30caf6a4dddad54c
.xword 0x615d52183eec851e
.xword 0x5af071acac801140
.xword 0x32bff2e9e2aef8ea
.xword 0x6956e3288e8207b3
.xword 0x398149e6faa7e2bd
.xword 0x6d1a7e0fb66f5301




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
.xword 0xd485ee5e8662ecac
.xword 0xb61d45647a049cb9
.xword 0x8388717248e7dae5
.xword 0xb5b0a001af71b4bf
.xword 0x3b5a653737195034
.xword 0x7e240e6110d58966
.xword 0xb255ff29e0f2268d
.xword 0x34fad44d82ea60b9




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
.xword 0xefac0bba63dcd0f2
.xword 0xf9e1398f56c71657
.xword 0x5f64ad1bd7930675
.xword 0x35c3322f62c7d792
.xword 0x4fc9d4e3c17b36e4
.xword 0x9631996e3798de35
.xword 0x5b0cb78620a598ab
.xword 0x7ab6c774defd255c






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
.xword 0xde4111a76c2e9b88
.xword 0xe2775724a7111308
.xword 0xb8d493cd057d851d
.xword 0xa9c81a77f9edb4df
.xword 0xc2ed71f31a5c2ff3
.xword 0xc21ac3cb4cc6fc02
.xword 0x48a0cc79dd698838
.xword 0x350f6226d5845f7c




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
.xword 0x9a17a3a3f0613656
.xword 0x56abcca2d78d13ec
.xword 0x2d48e0cbe526fd5c
.xword 0x8f7a39ccd5afa26a
.xword 0xdf5fbdc45d2dc770
.xword 0x4200e474621548f9
.xword 0x94cd2a63965c5898
.xword 0x75b4d4875cb2d3c0




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
.xword 0x11301e5578742286
.xword 0x9a6078bf55407caf
.xword 0xd66d81b1fc8e70f9
.xword 0x3b5d13a96a1ec2fc
.xword 0x76c7ac8010cdca37
.xword 0x21843c075a416bf5
.xword 0x38af8b941b1b9a5b
.xword 0xf70560df2b5e98aa




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
.xword 0x2617d852fe210265
.xword 0x7f82e66375020618
.xword 0x8c1878227bf32b61
.xword 0x948fb94dae33093e
.xword 0x5de60a688e5e1f5a
.xword 0xf04511101c7809b5
.xword 0xf030ad906192862d
.xword 0x86f13c7399f4820d




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
.xword 0x46165bfcefe658a3
.xword 0x8131fded849fccd4
.xword 0x6d11d772fdecd6b7
.xword 0xcb17bfc93bef2b0e
.xword 0x86a95b317ed35fce
.xword 0x4f3cef6c3a6b2eeb
.xword 0xf7bb074bffbde47e
.xword 0xfac582b4e00aa96e




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
.xword 0xdbcb67f58cf2263b
.xword 0xd56433b1f1cf667d
.xword 0x07ea77c6d63f8ea6
.xword 0x22c5444aa4bac7cc
.xword 0x96557d9e35f77e32
.xword 0x888c18d9f804daf3
.xword 0x52070e46c7e2b46d
.xword 0x3b00435f1389b5d2




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
.xword 0x4800914f8945e47d
.xword 0x73d530f23cc7c4e7
.xword 0xcbc023ca370138a1
.xword 0xf863ea55859cae48
.xword 0xada92eb498c4ad85
.xword 0xed3ec5088435d4b5
.xword 0xfc9687aeefdaa14d
.xword 0x276f6c18bc6452f5




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
.xword 0x2063124e78d222b5
.xword 0x6d3289e20b80fcb1
.xword 0x5b9da8987caba915
.xword 0xc836e40090ff5e93
.xword 0x6df2e9a344d8caa5
.xword 0x618ee572734e3082
.xword 0x248700abfdbed38e
.xword 0xdf13235fa73e2805




#if 0
#endif
