/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_01.s
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
	setx 0xcb1ec19881bbf245, %g1, %r2
	setx 0x58d97db81e9fbfa7, %g1, %r3
	setx 0x48d051e1bebcd3af, %g1, %r4
	setx 0x46cd48dfdb40de37, %g1, %r5
	setx 0x4822c4ca10227dc5, %g1, %r6
	setx 0xe006a86421845ad6, %g1, %r7
	setx 0x8a00056eea7c2a14, %g1, %r8

     mov %r2, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC1:
NC_BIS_SEC2:
	.word 0xd0bcdd7a  ! 3: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
	.word 0xc6b4d03a  ! 5: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc6a4d13a  ! 7: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
CP_PST_PRI3:
	.word 0xc7ba989a  ! 9: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc7f2a01a  ! 10: CASXA_R	casxa	[%r10]%asi, %r26, %r3
NC_BIS_AIUP4:
	.word 0xcca6445a  ! 12: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xc6a4101a  ! 14: STWA_R	stwa	%r3, [%r16 + %r26] 0x80
CHANGE_USER5:
	ta	T_CHANGE_NONPRIV
CHANGE_R266:
	add	%r26,	%r27,	%r26
CP_BIS_PRI6:
	and	%r26,	%r28,	%r26
	.word 0xd0badc5a  ! 16: STDA_R	stda	%r8, [%r11 + %r26] 0xe2
BLK_PRI7:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 18: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc67b6010  ! 19: SWAP_I	swap	%r3, [%r13 + 0x0010]
	.word 0xc782d01a  ! 20: LDFA_R	lda	[%r11, %r26], %f3
	.word 0xc684903a  ! 22: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc6b4903a  ! 24: STHA_R	stha	%r3, [%r18 + %r26] 0x81
NC_BIS_PRI8:
	.word 0xc4bbdc5a  ! 26: STDA_R	stda	%r2, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS10:
	.word 0xc79fc33a  ! 28: LDDFA_R	ldda	[%r31, %r26], %f3
SET_TL1_11:
	ta	T_CHANGE_TO_TL1
CHANGE_R2612:
	add	%r26,	%r27,	%r26
NC_BIS_NUC12:
	.word 0xc4b544fa  ! 30: STHA_R	stha	%r2, [%r21 + %r26] 0x27
SET_TL0_13:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI14:
	.word 0xc4b39c5a  ! 32: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD15:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 34: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
CHANGE_R2616:
	add	%r26,	%r27,	%r26
CP_BIS_SEC16:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 36: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
	.word 0xc67ac01a  ! 37: SWAP_R	swap	%r3, [%r11 + %r26]
CP_BIS_QUAD_LD17:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 39: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc49c913a  ! 41: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc79b101a  ! 42: LDDFA_R	ldda	[%r12, %r26], %f3
	.word 0xc4ba901a  ! 43: STDA_R	stda	%r2, [%r10 + %r26] 0x80
	.word 0xc7bcd13a  ! 45: STDFA_R	stda	%f3, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC19:
	.word 0xc7bd409a  ! 47: STDFA_R	stda	%f3, [%r26, %r21]
	.word 0xc703401a  ! 48: LDF_R	ld	[%r13, %r26], %f3
	.word 0xc6d4913a  ! 50: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r3
CP_BIS_QUAD_LD20:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 52: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CHANGE_R2621:
	add	%r26,	%r27,	%r26
CP_BIS_SEC21:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9d7a  ! 54: LDDA_R	ldda	[%r18, %r26] 0xeb, %r6
CP_AIUP22:
	.word 0xc49e031a  ! 56: LDDA_R	ldda	[%r24, %r26] 0x18, %r2
CP_BIS_QUAD_LD23:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 58: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xc692d11a  ! 59: LDUHA_R	lduha	[%r11, %r26] 0x88, %r3
	.word 0xc6a4501a  ! 61: STWA_R	stwa	%r3, [%r17 + %r26] 0x80
BLK_PRI24:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 63: STDFA_R	stda	%f0, [%r26, %r13]
SHORT_FP_PRI25:
	.word 0xc7ba9a1a  ! 65: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6dc913a  ! 67: LDXA_R	ldxa	[%r18, %r26] 0x89, %r3
	.word 0xc722e010  ! 68: STF_I	st	%f3, [0x0010, %r11]
CP_NUC26:
	.word 0xc6cd009a  ! 70: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r3
	.word 0xc684d13a  ! 72: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r3
CHANGE_USER27:
	ta	T_CHANGE_NONPRIV
CHANGE_R2628:
	mov	%g0,	%r26
NC_BIS_PRI28:
	.word 0xd0ac5c5a  ! 74: STBA_R	stba	%r8, [%r17 + %r26] 0xe2
BLK_PRI29:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 76: LDDFA_R	ldda	[%r10, %r26], %f0
CHANGE_R2630:
	add	%r26,	%r27,	%r26
CP_BIS_SEC30:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 78: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
	.word 0xc65b401a  ! 79: LDX_R	ldx	[%r13 + %r26], %r3
CHANGE_PRIV31:
	ta	T_CHANGE_PRIV
CHANGE_R2632:
	add	%r26,	%r27,	%r26
CP_BIS_NUC32:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 81: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc694d03a  ! 83: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
	.word 0xc6c4d13a  ! 85: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
CHANGE_USER33:
	ta	T_CHANGE_NONPRIV
CHANGE_R2634:
	add	%r26,	%r27,	%r26
CP_BIS_PRI34:
	and	%r26,	%r28,	%r26
	.word 0xd0b35d5a  ! 87: STHA_R	stha	%r8, [%r13 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC36:
	.word 0xc6d5019a  ! 89: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r3
CP_BIS_AIUS37:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 91: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xc6ac903a  ! 93: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc79b901a  ! 95: LDDFA_R	ldda	[%r14, %r26], %f3
	.word 0xc6cc913a  ! 97: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r3
NC_PST_PRI38:
	.word 0xc7bb999a  ! 99: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc7e2e01a  ! 100: CASA_R	casa	[%r11] %asi, %r26, %r3
	.word 0xc6cb901a  ! 102: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r3
	.word 0xc6d3901a  ! 104: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
	.word 0xc67aa010  ! 105: SWAP_I	swap	%r3, [%r10 + 0x0010]
NC_BLK_SEc39:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 107: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc6f4913a  ! 109: STXA_R	stxa	%r3, [%r18 + %r26] 0x89
	.word 0xc684d03a  ! 111: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r3
	.word 0xc49c913a  ! 113: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc7bc913a  ! 115: STDFA_R	stda	%f3, [%r26, %r18]
BLK_PRI40:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 117: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc79cd13a  ! 119: LDDFA_R	ldda	[%r19, %r26], %f3
NC_PST_PRI41:
	.word 0xc7bb995a  ! 121: STDFA_R	stda	%f3, [%r26, %r14]
NC_BIS_AIUS42:
	.word 0xccb7c57a  ! 123: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
NC_BIS_SEC43:
	.word 0xc4b4dc7a  ! 125: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xc6d4903a  ! 127: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
	.word 0xc7bad01a  ! 128: STDFA_R	stda	%f3, [%r26, %r11]
CP_ATM_QUAD_LD44:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 130: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc6b4d03a  ! 132: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc7f2e01a  ! 133: CASXA_R	casxa	[%r11]%asi, %r26, %r3
CP_PST_PRI45:
	.word 0xc7bb589a  ! 135: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc622c01a  ! 136: STW_R	stw	%r3, [%r11 + %r26]
	.word 0xc7f3201a  ! 137: CASXA_R	casxa	[%r12]%asi, %r26, %r3
	.word 0xc6fb511a  ! 138: SWAPA_R	swapa	%r3, [%r13 + %r26] 0x88
	.word 0xc73a801a  ! 139: STDF_R	std	%f3, [%r26, %r10]
CP_ATM_QUAD_LD46:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 141: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
CHANGE_R2647:
	add	%r26,	%r27,	%r26
CP_BIS_SEC47:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 143: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
CP_NUC48:
	.word 0xc685009a  ! 145: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r3
	.word 0xc68ad01a  ! 146: LDUBA_R	lduba	[%r11, %r26] 0x80, %r3
NC_AIUP49:
	.word 0xc6ae421a  ! 148: STBA_R	stba	%r3, [%r25 + %r26] 0x10
CHANGE_USER50:
	ta	T_CHANGE_NONPRIV
CHANGE_R2651:
	add	%r26,	%r27,	%r26
NC_BIS_PRI51:
	.word 0xc8bb9c5a  ! 150: STDA_R	stda	%r4, [%r14 + %r26] 0xe2
NC_BIS_SEC52:
	.word 0xd0bcdc7a  ! 152: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xc6c3901a  ! 154: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP54:
	.word 0xc7a6021a  ! 156: STFA_R	sta	%f3, [%r26, %r24]
NC_BIS_SEC55:
	.word 0xc4acdd7a  ! 158: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
SHORT_FP_PRI56:
	.word 0xc7bb5a1a  ! 160: STDFA_R	stda	%f3, [%r26, %r13]
CHANGE_USER57:
	ta	T_CHANGE_NONPRIV
CHANGE_R2658:
	mov	%g0,	%r26
CP_BIS_PRI58:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 162: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	.word 0xc6d4903a  ! 164: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
CP_BIS_QUAD_LD59:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1d5a  ! 166: LDDA_R	ldda	[%r12, %r26] 0xea, %r6
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS61:
	.word 0xc6afc23a  ! 168: STBA_R	stba	%r3, [%r31 + %r26] 0x11
CHANGE_USER62:
	ta	T_CHANGE_NONPRIV
CHANGE_R2663:
	add	%r26,	%r27,	%r26
NC_BIS_PRI63:
	.word 0xd0ac5c5a  ! 170: STBA_R	stba	%r8, [%r17 + %r26] 0xe2
	.word 0xc6fad01a  ! 171: SWAPA_R	swapa	%r3, [%r11 + %r26] 0x80
SHORT_FP_PRI64:
	.word 0xc7ba9a1a  ! 173: STDFA_R	stda	%f3, [%r26, %r10]
CP_BIS_QUAD_LD65:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 175: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
	.word 0xc49c501a  ! 177: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
	.word 0xc6b4501a  ! 179: STHA_R	stha	%r3, [%r17 + %r26] 0x80
	.word 0xc694913a  ! 181: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
CHANGE_PRIV66:
	ta	T_CHANGE_PRIV
CHANGE_R2667:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD67:
	and	%r26,	%r29,	%r26
	.word 0xc89ac59a  ! 183: LDDA_R	ldda	[%r11, %r26] 0x2c, %r4
	.word 0xc6dcd03a  ! 185: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
	.word 0xc703001a  ! 186: LDF_R	ld	[%r12, %r26], %f3
CP_ATM_QUAD_LD68:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 188: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
	.word 0xc784903a  ! 190: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc71a801a  ! 191: LDDF_R	ldd	[%r10, %r26], %f3
	.word 0xc722e010  ! 192: STF_I	st	%f3, [0x0010, %r11]
NC_BIS_AIUP69:
	.word 0xd0a6445a  ! 194: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xc622c01a  ! 195: STW_R	stw	%r3, [%r11 + %r26]
	.word 0xc784913a  ! 197: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc6c4903a  ! 199: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r3
	.word 0xc6b4d03a  ! 201: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc6a4d03a  ! 203: STWA_R	stwa	%r3, [%r19 + %r26] 0x81
NC_BIS_AIUS70:
	.word 0xd0afc57a  ! 205: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
CP_AIUS71:
	.word 0xc6cf823a  ! 207: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r3
CP_PST_PRI72:
	.word 0xc7bb189a  ! 209: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc66aa013  ! 210: LDSTUB_I	ldstub	%r3, [%r10 + 0x0013]
	.word 0xc6b3901a  ! 212: STHA_R	stha	%r3, [%r14 + %r26] 0x80
	.word 0xc782915a  ! 213: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc79cd03a  ! 215: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc6ab901a  ! 217: STBA_R	stba	%r3, [%r14 + %r26] 0x80
SET_TL1_73:
	ta	T_CHANGE_TO_TL1
CHANGE_R2674:
	add	%r26,	%r27,	%r26
NC_BIS_NUC74:
	.word 0xc4bd45fa  ! 219: STDA_R	stda	%r2, [%r21 + %r26] 0x2f
CP_PST_PRI75:
	.word 0xc7ba989a  ! 221: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6ac913a  ! 223: STBA_R	stba	%r3, [%r18 + %r26] 0x89
SHORT_FP_PRI76:
	.word 0xc7badb5a  ! 225: STDFA_R	stda	%f3, [%r26, %r11]
	.word 0xc7a2911a  ! 226: STFA_R	sta	%f3, [%r26, %r10]
CP_ATM_QUAD_LD77:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 228: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc68bd01a  ! 230: LDUBA_R	lduba	[%r15, %r26] 0x80, %r3
NC_BIS_AIUS78:
	.word 0xc4afc47a  ! 232: STBA_R	stba	%r2, [%r31 + %r26] 0x23
SET_TL0_79:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI80:
	and	%r26,	%r28,	%r26
	.word 0xc4bb5c5a  ! 234: STDA_R	stda	%r2, [%r13 + %r26] 0xe2
	.word 0xc6ac501a  ! 236: STBA_R	stba	%r3, [%r17 + %r26] 0x80
	.word 0xc6dc903a  ! 238: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
NC_BIS_PRI81:
	.word 0xc8a45c5a  ! 240: STWA_R	stwa	%r4, [%r17 + %r26] 0xe2
CHANGE_PRIV82:
	ta	T_CHANGE_PRIV
CHANGE_R2683:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP83:
	.word 0xd0be445a  ! 242: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CP_PST_PRI84:
	.word 0xc7ba991a  ! 244: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc784111a  ! 246: LDFA_R	lda	[%r16, %r26], %f3
	.word 0xc6ccd03a  ! 248: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
	.word 0xc6cc111a  ! 250: LDSBA_R	ldsba	[%r16, %r26] 0x88, %r3
	.word 0xc6c3901a  ! 252: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
	.word 0xc684903a  ! 254: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
CHANGE_USER85:
	ta	T_CHANGE_NONPRIV
CHANGE_R2686:
	add	%r26,	%r27,	%r26
CP_BIS_PRI86:
	and	%r26,	%r28,	%r26
	.word 0xc4f35c5a  ! 256: STXA_R	stxa	%r2, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS88:
	.word 0xc6f7833a  ! 258: STXA_R	stxa	%r3, [%r30 + %r26] 0x19
	.word 0xc684913a  ! 260: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r3
CHANGE_R2689:
	mov	%g0,	%r26
CP_BIS_SEC89:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 262: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
NC_AIUS90:
	.word 0xc79fc23a  ! 264: LDDFA_R	ldda	[%r31, %r26], %f3
CHANGE_USER91:
	ta	T_CHANGE_NONPRIV
CHANGE_R2692:
	add	%r26,	%r27,	%r26
NC_BIS_PRI92:
	.word 0xc4a39d5a  ! 266: STWA_R	stwa	%r2, [%r14 + %r26] 0xea
	.word 0xc783505a  ! 267: LDFA_R	lda	[%r13, %r26], %f3
NC_BIS_SEC93:
	.word 0xc4bcdd7a  ! 269: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
CP_PST_PRI94:
	.word 0xc7ba985a  ! 271: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc68c511a  ! 273: LDUBA_R	lduba	[%r17, %r26] 0x88, %r3
	.word 0xc6ac903a  ! 275: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc41aa010  ! 276: LDD_I	ldd	[%r10 + 0x0010], %r2
NC_BIS_SEC95:
	.word 0xc8acdd7a  ! 278: STBA_R	stba	%r4, [%r19 + %r26] 0xeb
	.word 0xc6fb101a  ! 279: SWAPA_R	swapa	%r3, [%r12 + %r26] 0x80
	.word 0xc7a4913a  ! 281: STFA_R	sta	%f3, [%r26, %r18]
WR_LEASI_96:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_97:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_R2698:
	add	%r26,	%r27,	%r26
CP_BIS_SEC98:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 284: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
BLK_PRI99:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 286: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xc6acd03a  ! 288: STBA_R	stba	%r3, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC101:
	.word 0xc695009a  ! 290: LDUHA_R	lduha	[%r20, %r26] 0x04, %r3
	.word 0xc6b3901a  ! 292: STHA_R	stha	%r3, [%r14 + %r26] 0x80
	.word 0xc79cd03a  ! 294: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc694913a  ! 296: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
	.word 0xc784913a  ! 298: LDFA_R	lda	[%r18, %r26], %f3
CP_BIS_QUAD_LD102:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 300: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc783111a  ! 301: LDFA_R	lda	[%r12, %r26], %f3
CHANGE_USER103:
	ta	T_CHANGE_NONPRIV
CHANGE_R26104:
	add	%r26,	%r27,	%r26
CP_BIS_PRI104:
	and	%r26,	%r28,	%r26
	.word 0xd0f2dd5a  ! 303: STXA_R	stxa	%r8, [%r11 + %r26] 0xea
NC_BLK_SEc105:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 305: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc6b3d11a  ! 307: STHA_R	stha	%r3, [%r15 + %r26] 0x88
CP_BIS_QUAD_LD106:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 309: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xc6c4d03a  ! 311: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r3
	.word 0xc7bc913a  ! 313: STDFA_R	stda	%f3, [%r26, %r18]
SHORT_FP_PRI107:
	.word 0xc7ba9b5a  ! 315: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc7032010  ! 316: LDF_I	ld	[%r12, 0x0010], %f3
CHANGE_PRIV108:
	ta	T_CHANGE_PRIV
CHANGE_R26109:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP109:
	and	%r26,	%r28,	%r26
	.word 0xcc9e055a  ! 318: LDDA_R	ldda	[%r24, %r26] 0x2a, %r6
CP_BIS_QUAD_LD110:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 320: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc66aa013  ! 321: LDSTUB_I	ldstub	%r3, [%r10 + 0x0013]
	.word 0xc6a4d13a  ! 323: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD111:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 325: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc694913a  ! 327: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
	.word 0xc6acd13a  ! 329: STBA_R	stba	%r3, [%r19 + %r26] 0x89
NC_SHORT_FP_SEC112:
	.word 0xc7bcdb3a  ! 331: STDFA_R	stda	%f3, [%r26, %r19]
NC_BIS_AIUP113:
	.word 0xc4b6455a  ! 333: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
	.word 0xc7a4903a  ! 335: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc784d13a  ! 337: LDFA_R	lda	[%r19, %r26], %f3
CP_BIS_QUAD_LD114:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 339: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc7bb511a  ! 340: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc16fa03d  ! 342: PREFETCH_I	prefetch	[%r30 + 0x003d], #n_reads
CP_NUC115:
	.word 0xc49d019a  ! 344: LDDA_R	ldda	[%r20, %r26] 0x0c, %r2
	.word 0xc693901a  ! 346: LDUHA_R	lduha	[%r14, %r26] 0x80, %r3
CP_AIUP116:
	.word 0xc6ce021a  ! 348: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r3
	.word 0xc784d03a  ! 350: LDFA_R	lda	[%r19, %r26], %f3
SET_TL1_117:
	ta	T_CHANGE_TO_TL1
CHANGE_R26118:
	add	%r26,	%r27,	%r26
NC_BIS_NUC118:
	.word 0xc4ad44fa  ! 352: STBA_R	stba	%r2, [%r21 + %r26] 0x27
CP_NUC119:
	.word 0xc685019a  ! 354: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r3
	.word 0xc7a4d13a  ! 356: STFA_R	sta	%f3, [%r26, %r19]
NC_BIS_AIUP120:
	.word 0xccf6455a  ! 358: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
NC_BIS_NUC121:
	.word 0xd0f545fa  ! 360: STXA_R	stxa	%r8, [%r21 + %r26] 0x2f
	.word 0xc673401a  ! 361: STX_R	stx	%r3, [%r13 + %r26]
	.word 0xc6a3901a  ! 363: STWA_R	stwa	%r3, [%r14 + %r26] 0x80
	.word 0xc6cc903a  ! 365: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
	.word 0xc684501a  ! 367: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r3
CP_AIUP122:
	.word 0xc68e021a  ! 369: LDUBA_R	lduba	[%r24, %r26] 0x10, %r3
NC_AIUS123:
	.word 0xc697c33a  ! 371: LDUHA_R	lduha	[%r31, %r26] 0x19, %r3
	.word 0xe36fe01a  ! 373: PREFETCH_I	prefetch	[%r31 + 0x001a], #17
	.word 0xc49b901a  ! 375: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
SET_TL0_124:
	ta	T_CHANGE_TO_TL0
CHANGE_R26125:
	add	%r26,	%r27,	%r26
NC_BIS_SEC125:
	.word 0xc4bcdd7a  ! 377: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
	.word 0xc6a4d13a  ! 379: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP127:
	.word 0xc6de421a  ! 381: LDXA_R	ldxa	[%r25, %r26] 0x10, %r3
	.word 0xc6fb501a  ! 382: SWAPA_R	swapa	%r3, [%r13 + %r26] 0x80
	.word 0xc7bb101a  ! 383: STDFA_R	stda	%f3, [%r26, %r12]
CP_ATM_QUAD_LD128:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 385: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xc6d4913a  ! 387: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r3
	.word 0xc723401a  ! 388: STF_R	st	%f3, [%r26, %r13]
	.word 0xc7032010  ! 389: LDF_I	ld	[%r12, 0x0010], %f3
	.word 0xc7e2e01a  ! 390: CASA_R	casa	[%r11] %asi, %r26, %r3
CP_BIS_NUC129:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 392: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
CHANGE_USER130:
	ta	T_CHANGE_NONPRIV
CHANGE_R26131:
	add	%r26,	%r27,	%r26
NC_BIS_PRI131:
	.word 0xc8f39d5a  ! 394: STXA_R	stxa	%r4, [%r14 + %r26] 0xea
	.word 0xc6cc903a  ! 396: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC133:
	.word 0xc79d019a  ! 398: LDDFA_R	ldda	[%r20, %r26], %f3
	.word 0xc6c4d13a  ! 400: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
NC_BLK_SEc134:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 402: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc6b3901a  ! 404: STHA_R	stha	%r3, [%r14 + %r26] 0x80
	.word 0xc68cd13a  ! 406: LDUBA_R	lduba	[%r19, %r26] 0x89, %r3
	.word 0xc684d03a  ! 408: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r3
CP_BIS_NUC135:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 410: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
	.word 0xc79cd03a  ! 412: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc7ba901a  ! 413: STDFA_R	stda	%f3, [%r26, %r10]
CP_BIS_AIUP136:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 415: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
CP_AIUP137:
	.word 0xc68e021a  ! 417: LDUBA_R	lduba	[%r24, %r26] 0x10, %r3
	.word 0xc6ccd03a  ! 419: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
	.word 0xc7a3111a  ! 420: STFA_R	sta	%f3, [%r26, %r12]
	.word 0xc6d4d03a  ! 422: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
	.word 0xc4bc101a  ! 424: STDA_R	stda	%r2, [%r16 + %r26] 0x80
CP_BIS_QUAD_LD138:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 426: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xc632801a  ! 427: STH_R	sth	%r3, [%r10 + %r26]
	.word 0xc7bc903a  ! 429: STDFA_R	stda	%f3, [%r26, %r18]
CP_PST_PRI139:
	.word 0xc7ba995a  ! 431: STDFA_R	stda	%f3, [%r26, %r10]
CP_PST_PRI140:
	.word 0xc7ba999a  ! 433: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc7bc101a  ! 435: STDFA_R	stda	%f3, [%r26, %r16]
CP_PST_PRI141:
	.word 0xc7ba985a  ! 437: STDFA_R	stda	%f3, [%r26, %r10]
CP_BIS_NUC142:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 439: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CP_PST_PRI143:
	.word 0xc7bad95a  ! 441: STDFA_R	stda	%f3, [%r26, %r11]
CP_PST_PRI144:
	.word 0xc7bb581a  ! 443: STDFA_R	stda	%f3, [%r26, %r13]
SHORT_FP_PRI145:
	.word 0xc79b1a1a  ! 445: LDDFA_R	ldda	[%r12, %r26], %f3
CP_NUC146:
	.word 0xc4bd009a  ! 447: STDA_R	stda	%r2, [%r20 + %r26] 0x04
CHANGE_R26147:
	add	%r26,	%r27,	%r26
CP_BIS_SEC147:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 449: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_BIS_AIUS148:
	and	%r26,	%r28,	%r26
	.word 0xc8f7847a  ! 451: STXA_R	stxa	%r4, [%r30 + %r26] 0x23
CHANGE_USER149:
	ta	T_CHANGE_NONPRIV
CHANGE_R26150:
	add	%r26,	%r27,	%r26
NC_BIS_PRI150:
	.word 0xd0ac1c5a  ! 453: STBA_R	stba	%r8, [%r16 + %r26] 0xe2
NC_BIS_SEC151:
	.word 0xc4bcdc7a  ! 455: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC153:
	.word 0xc7e5201a  ! 457: CASA_R	casa	[%r20] %asi, %r26, %r3
CP_BIS_NUC154:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 459: STBA_R	stba	%r2, [%r20 + %r26] 0x27
SET_TL1_155:
	ta	T_CHANGE_TO_TL1
CHANGE_R26156:
	add	%r26,	%r27,	%r26
NC_BIS_NUC156:
	.word 0xc4f544fa  ! 461: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CP_NUC157:
	.word 0xc6d5009a  ! 463: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r3
	.word 0xc6c4913a  ! 465: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r3
	.word 0xc7bcd03a  ! 467: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc6f2901a  ! 468: STXA_R	stxa	%r3, [%r10 + %r26] 0x80
	.word 0xc6b4903a  ! 470: STHA_R	stha	%r3, [%r18 + %r26] 0x81
CP_ATM_QUAD_LD158:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 472: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xc6f4d03a  ! 474: STXA_R	stxa	%r3, [%r19 + %r26] 0x81
NC_BIS_AIUS159:
	.word 0xcca7c47a  ! 476: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
CP_BIS_NUC160:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 478: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
NC_NUC161:
	.word 0xc7a5409a  ! 480: STFA_R	sta	%f3, [%r26, %r21]
	.word 0xc7a2901a  ! 481: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc79c101a  ! 483: LDDFA_R	ldda	[%r16, %r26], %f3
	.word 0xc6fb101a  ! 484: SWAPA_R	swapa	%r3, [%r12 + %r26] 0x80
	.word 0xc694903a  ! 486: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
NC_AIUS162:
	.word 0xc697c23a  ! 488: LDUHA_R	lduha	[%r31, %r26] 0x11, %r3
	.word 0xc6d3901a  ! 490: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
SET_TL0_163:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI164:
	and	%r26,	%r28,	%r26
	.word 0xc4b35c5a  ! 492: STHA_R	stha	%r2, [%r13 + %r26] 0xe2
	.word 0xc7bcd13a  ! 494: STDFA_R	stda	%f3, [%r26, %r19]
SHORT_FP_PRI165:
	.word 0xc7ba9a1a  ! 496: STDFA_R	stda	%f3, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP167:
	.word 0xc6c6031a  ! 498: LDSWA_R	ldswa	[%r24, %r26] 0x18, %r3
	.word 0xc64aa013  ! 499: LDSB_I	ldsb	[%r10 + 0x0013], %r3
	.word 0xc68c903a  ! 501: LDUBA_R	lduba	[%r18, %r26] 0x81, %r3
	.word 0xc6d3115a  ! 502: LDSHA_R	ldsha	[%r12, %r26] 0x8a, %r3
NC_NUC168:
	.word 0xc7bd419a  ! 504: STDFA_R	stda	%f3, [%r26, %r21]
NC_NUC169:
	.word 0xc79d409a  ! 506: LDDFA_R	ldda	[%r21, %r26], %f3
CP_PST_PRI170:
	.word 0xc7bb591a  ! 508: STDFA_R	stda	%f3, [%r26, %r13]
NC_BIS_AIUS171:
	.word 0xd0a7c47a  ! 510: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
CP_PST_PRI172:
	.word 0xc7ba991a  ! 512: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6c3901a  ! 514: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
CHANGE_CLE173:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC175:
	.word 0xc685409a  ! 517: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r3
	.word 0xc7bb901a  ! 519: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6b2901a  ! 520: STHA_R	stha	%r3, [%r10 + %r26] 0x80
	.word 0xc7bb901a  ! 522: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc68c903a  ! 524: LDUBA_R	lduba	[%r18, %r26] 0x81, %r3
	.word 0xc6ca901a  ! 525: LDSBA_R	ldsba	[%r10, %r26] 0x80, %r3
	.word 0xc6c3901a  ! 527: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
	.word 0xc6f3101a  ! 528: STXA_R	stxa	%r3, [%r12 + %r26] 0x80
CP_BIS_AIUP176:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 530: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
CP_AIUS177:
	.word 0xc6c7833a  ! 532: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r3
CP_BIS_AIUP178:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 534: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xc702801a  ! 535: LDF_R	ld	[%r10, %r26], %f3
	.word 0xc6a4d03a  ! 537: STWA_R	stwa	%r3, [%r19 + %r26] 0x81
SET_TL1_179:
	ta	T_CHANGE_TO_TL1
CHANGE_R26180:
	add	%r26,	%r27,	%r26
NC_BIS_NUC180:
	.word 0xc4ad44fa  ! 539: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xc6ac101a  ! 541: STBA_R	stba	%r3, [%r16 + %r26] 0x80
	.word 0xc68a911a  ! 542: LDUBA_R	lduba	[%r10, %r26] 0x88, %r3
	.word 0xc6d4d03a  ! 544: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
	.word 0xe7eb457a  ! 546: PREFETCHA_R	prefetcha	[%r13, %r26] 0x2b, #19
CP_NUC181:
	.word 0xc6f5019a  ! 548: STXA_R	stxa	%r3, [%r20 + %r26] 0x0c
NC_NUC182:
	.word 0xc6cd409a  ! 550: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r3
SHORT_FP_PRI183:
	.word 0xc7bb5b5a  ! 552: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc693501a  ! 553: LDUHA_R	lduha	[%r13, %r26] 0x80, %r3
	.word 0xc694913a  ! 555: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
	.word 0xc6a4501a  ! 557: STWA_R	stwa	%r3, [%r17 + %r26] 0x80
	.word 0xc68b911a  ! 559: LDUBA_R	lduba	[%r14, %r26] 0x88, %r3
SHORT_FP_PRI184:
	.word 0xc7bb1b5a  ! 561: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc693911a  ! 563: LDUHA_R	lduha	[%r14, %r26] 0x88, %r3
	.word 0xc49cd03a  ! 565: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
CHANGE_R26185:
	add	%r26,	%r27,	%r26
CP_BIS_SEC185:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 567: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
NC_BIS_AIUP186:
	.word 0xc8f6445a  ! 569: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
SET_TL0_187:
	ta	T_CHANGE_TO_TL0
CHANGE_R26188:
	add	%r26,	%r27,	%r26
NC_BIS_SEC188:
	.word 0xcca4dc7a  ! 571: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
CHANGE_R26189:
	add	%r26,	%r27,	%r26
CP_BIS_SEC189:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 573: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC191:
	.word 0xc7f5201a  ! 575: CASXA_R	casxa	[%r20]%asi, %r26, %r3
NC_BLK_SEc192:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 577: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc7a3901a  ! 579: STFA_R	sta	%f3, [%r26, %r14]
CHANGE_USER193:
	ta	T_CHANGE_NONPRIV
CHANGE_R26194:
	add	%r26,	%r27,	%r26
NC_BIS_PRI194:
	.word 0xd0ac5d5a  ! 581: STBA_R	stba	%r8, [%r17 + %r26] 0xea
	.word 0xc643401a  ! 582: LDSW_R	ldsw	[%r13 + %r26], %r3
CHANGE_PRIV195:
	ta	T_CHANGE_PRIV
CHANGE_R26196:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP196:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 584: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xc4bb501a  ! 585: STDA_R	stda	%r2, [%r13 + %r26] 0x80
	.word 0xc6a3911a  ! 587: STWA_R	stwa	%r3, [%r14 + %r26] 0x88
CP_ATM_QUAD_LD197:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 589: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc6dc913a  ! 591: LDXA_R	ldxa	[%r18, %r26] 0x89, %r3
WR_LEASI_198:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_199:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_CLE200:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc783d01a  ! 595: LDFA_R	lda	[%r15, %r26], %f3
	.word 0xc6c3901a  ! 597: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
	.word 0xc67a801a  ! 598: SWAP_R	swap	%r3, [%r10 + %r26]
NC_PST_PRI201:
	.word 0xc7bc185a  ! 600: STDFA_R	stda	%f3, [%r26, %r16]
CHANGE_R26202:
	mov	%g0,	%r26
CP_BIS_SEC202:
	and	%r26,	%r28,	%r26
	.word 0xc8b49d7a  ! 602: STHA_R	stha	%r4, [%r18 + %r26] 0xeb
	.word 0xc6dc903a  ! 604: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
SET_TL1_203:
	ta	T_CHANGE_TO_TL1
CHANGE_R26204:
	add	%r26,	%r27,	%r26
NC_BIS_NUC204:
	.word 0xc4f545fa  ! 606: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
NC_AIUP205:
	.word 0xc7a6431a  ! 608: STFA_R	sta	%f3, [%r26, %r25]
	.word 0xc783115a  ! 609: LDFA_R	lda	[%r12, %r26], %f3
	.word 0xc7bb101a  ! 610: STDFA_R	stda	%f3, [%r26, %r12]
CP_AIUP206:
	.word 0xc696021a  ! 612: LDUHA_R	lduha	[%r24, %r26] 0x10, %r3
	.word 0xc6d4d03a  ! 614: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
	.word 0xc7a3101a  ! 615: STFA_R	sta	%f3, [%r26, %r12]
	.word 0xc67a801a  ! 616: SWAP_R	swap	%r3, [%r10 + %r26]
CP_ATM_QUAD_LD207:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 618: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
	.word 0xc622c01a  ! 619: STW_R	stw	%r3, [%r11 + %r26]
	.word 0xc6dc903a  ! 621: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
NC_NUC208:
	.word 0xc6ad409a  ! 623: STBA_R	stba	%r3, [%r21 + %r26] 0x04
NC_NUC209:
	.word 0xc7bd409a  ! 625: STDFA_R	stda	%f3, [%r26, %r21]
	.word 0xc49b515a  ! 626: LDDA_R	ldda	[%r13, %r26] 0x8a, %r2
CHANGE_R26210:
	add	%r26,	%r27,	%r26
CP_BIS_SEC210:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 628: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD211:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 630: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
NC_NUC212:
	.word 0xc6d5409a  ! 632: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r3
NC_BIS_NUC213:
	.word 0xd0f544fa  ! 634: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
	.word 0xc684101a  ! 636: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r3
CP_BIS_AIUP214:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 638: STDA_R	stda	%r4, [%r24 + %r26] 0x22
CHANGE_R26215:
	add	%r26,	%r27,	%r26
CP_BIS_SEC215:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 640: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
CP_AIUS216:
	.word 0xc6af833a  ! 642: STBA_R	stba	%r3, [%r30 + %r26] 0x19
	.word 0xc49c101a  ! 644: LDDA_R	ldda	[%r16, %r26] 0x80, %r2
CP_AIUP217:
	.word 0xc7be031a  ! 646: STDFA_R	stda	%f3, [%r26, %r24]
	.word 0xc672a010  ! 647: STX_I	stx	%r3, [%r10 + 0x0010]
NC_AIUP218:
	.word 0xc6c6431a  ! 649: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r3
	.word 0xc60b001a  ! 650: LDUB_R	ldub	[%r12 + %r26], %r3
NC_BIS_AIUS219:
	.word 0xccbfc47a  ! 652: STDA_R	stda	%r6, [%r31 + %r26] 0x23
NC_PST_PRI220:
	.word 0xc7bb999a  ! 654: STDFA_R	stda	%f3, [%r26, %r14]
NC_BIS_AIUP221:
	.word 0xc4b6445a  ! 656: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xc7f2a01a  ! 657: CASXA_R	casxa	[%r10]%asi, %r26, %r3
	.word 0xc79c903a  ! 659: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc79cd03a  ! 661: LDDFA_R	ldda	[%r19, %r26], %f3
SET_TL0_222:
	ta	T_CHANGE_TO_TL0
CHANGE_R26223:
	add	%r26,	%r27,	%r26
NC_BIS_SEC223:
	.word 0xccf4dd7a  ! 663: STXA_R	stxa	%r6, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP225:
	.word 0xc6d6421a  ! 665: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r3
NC_BIS_AIUS226:
	.word 0xc4b7c57a  ! 667: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
	.word 0xc49c111a  ! 669: LDDA_R	ldda	[%r16, %r26] 0x88, %r2
SET_TL1_227:
	ta	T_CHANGE_TO_TL1
CHANGE_R26228:
	add	%r26,	%r27,	%r26
NC_BIS_NUC228:
	.word 0xc4a545fa  ! 671: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc6dcd13a  ! 673: LDXA_R	ldxa	[%r19, %r26] 0x89, %r3
	.word 0xc7a3901a  ! 675: STFA_R	sta	%f3, [%r26, %r14]
	.word 0xc7a2d01a  ! 676: STFA_R	sta	%f3, [%r26, %r11]
CP_BIS_QUAD_LD229:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 678: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
NC_SHORT_FP_SEC230:
	.word 0xc7bcda7a  ! 680: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc684d03a  ! 682: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r3
CP_NUC231:
	.word 0xc49d009a  ! 684: LDDA_R	ldda	[%r20, %r26] 0x04, %r2
	.word 0xc3efa03e  ! 686: PREFETCHA_I	prefetcha	[%r30, + 0x003e] %asi, #one_read
	.word 0xc4bcd13a  ! 688: STDA_R	stda	%r2, [%r19 + %r26] 0x89
NC_AIUP232:
	.word 0xc6d6421a  ! 690: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r3
	.word 0xc722c01a  ! 691: STF_R	st	%f3, [%r26, %r11]
	.word 0xc79b101a  ! 692: LDDFA_R	ldda	[%r12, %r26], %f3
CP_BIS_QUAD_LD233:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 694: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
SHORT_FP_PRI234:
	.word 0xc79adb1a  ! 696: LDDFA_R	ldda	[%r11, %r26], %f3
CP_BIS_AIUS235:
	and	%r26,	%r28,	%r26
	.word 0xd0a7847a  ! 698: STWA_R	stwa	%r8, [%r30 + %r26] 0x23
	.word 0xc49c903a  ! 700: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc4bcd03a  ! 702: STDA_R	stda	%r2, [%r19 + %r26] 0x81
CP_AIUP236:
	.word 0xc4be021a  ! 704: STDA_R	stda	%r2, [%r24 + %r26] 0x10
CP_BIS_AIUS237:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 706: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
CP_NUC238:
	.word 0xc6ad009a  ! 708: STBA_R	stba	%r3, [%r20 + %r26] 0x04
	.word 0xc7a2901a  ! 709: STFA_R	sta	%f3, [%r26, %r10]
NC_NUC239:
	.word 0xc6c5409a  ! 711: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r3
NC_BLK_SEc240:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 713: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc672e010  ! 714: STX_I	stx	%r3, [%r11 + 0x0010]
	.word 0xc66b401a  ! 715: LDSTUB_R	ldstub	%r3, [%r13 + %r26]
	.word 0xc6c4511a  ! 717: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r3
	.word 0xc6aad01a  ! 718: STBA_R	stba	%r3, [%r11 + %r26] 0x80
NC_BIS_AIUP241:
	.word 0xc8f6445a  ! 720: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD242:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 722: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
	.word 0xc49c903a  ! 724: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc6b3d01a  ! 726: STHA_R	stha	%r3, [%r15 + %r26] 0x80
SHORT_FP_PRI243:
	.word 0xc79a9b5a  ! 728: LDDFA_R	ldda	[%r10, %r26], %f3
NC_SHORT_FP_SEC244:
	.word 0xc79cdb7a  ! 730: LDDFA_R	ldda	[%r19, %r26], %f3
CP_BIS_AIUS245:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 732: STBA_R	stba	%r2, [%r30 + %r26] 0x23
NC_AIUS246:
	.word 0xc6b7c23a  ! 734: STHA_R	stha	%r3, [%r31 + %r26] 0x11
	.word 0xc6a3901a  ! 736: STWA_R	stwa	%r3, [%r14 + %r26] 0x80
	.word 0xc49c501a  ! 738: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
	.word 0xc6dbd11a  ! 740: LDXA_R	ldxa	[%r15, %r26] 0x88, %r3
	.word 0xc784903a  ! 742: LDFA_R	lda	[%r18, %r26], %f3
CP_NUC247:
	.word 0xc6d5019a  ! 744: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r3
	.word 0xc6c4d03a  ! 746: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r3
NC_AIUP248:
	.word 0xc79e421a  ! 748: LDDFA_R	ldda	[%r25, %r26], %f3
NC_AIUS249:
	.word 0xc79fc23a  ! 750: LDDFA_R	ldda	[%r31, %r26], %f3
CP_AIUP250:
	.word 0xc68e021a  ! 752: LDUBA_R	lduba	[%r24, %r26] 0x10, %r3
CP_NUC251:
	.word 0xc785009a  ! 754: LDFA_R	lda	[%r20, %r26], %f3
NC_AIUP252:
	.word 0xc49e431a  ! 756: LDDA_R	ldda	[%r25, %r26] 0x18, %r2
	.word 0xc43b6010  ! 757: STD_I	std	%r2, [%r13 + 0x0010]
	.word 0xc49c903a  ! 759: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
CP_NUC253:
	.word 0xc6c5019a  ! 761: LDSWA_R	ldswa	[%r20, %r26] 0x0c, %r3
	.word 0xc79a911a  ! 762: LDDFA_R	ldda	[%r10, %r26], %f3
NC_NUC254:
	.word 0xc695409a  ! 764: LDUHA_R	lduha	[%r21, %r26] 0x04, %r3
	.word 0xc7e2e01a  ! 765: CASA_R	casa	[%r11] %asi, %r26, %r3
	.word 0xc702c01a  ! 766: LDF_R	ld	[%r11, %r26], %f3
CP_PST_PRI255:
	.word 0xc7ba995a  ! 768: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6c2901a  ! 769: LDSWA_R	ldswa	[%r10, %r26] 0x80, %r3
	.word 0xc79c903a  ! 771: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc684101a  ! 773: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r3
	.word 0xc71a801a  ! 774: LDDF_R	ldd	[%r10, %r26], %f3
	.word 0xc64aa013  ! 775: LDSB_I	ldsb	[%r10 + 0x0013], %r3
	.word 0xc6c4913a  ! 777: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r3
SHORT_FP_PRI256:
	.word 0xc7ba9b5a  ! 779: STDFA_R	stda	%f3, [%r26, %r10]
NC_BIS_AIUS257:
	.word 0xc4bfc57a  ! 781: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
	.word 0xc6ca901a  ! 782: LDSBA_R	ldsba	[%r10, %r26] 0x80, %r3
	.word 0xc6acd03a  ! 784: STBA_R	stba	%r3, [%r19 + %r26] 0x81
NC_BLK_SEc258:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 786: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BLK_SEc259:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 788: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc49cd03a  ! 790: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
CP_NUC260:
	.word 0xc4bd009a  ! 792: STDA_R	stda	%r2, [%r20 + %r26] 0x04
	.word 0xc68cd13a  ! 794: LDUBA_R	lduba	[%r19, %r26] 0x89, %r3
	.word 0xc6cc903a  ! 796: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
	.word 0xc6ac913a  ! 798: STBA_R	stba	%r3, [%r18 + %r26] 0x89
SET_TL0_261:
	ta	T_CHANGE_TO_TL0
WR_LEASI_262:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_263:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
BLK_PRI264:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 801: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc66ac01a  ! 802: LDSTUB_R	ldstub	%r3, [%r11 + %r26]
CHANGE_PRIV265:
	ta	T_CHANGE_PRIV
CHANGE_R26266:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS266:
	and	%r26,	%r28,	%r26
	.word 0xcca7847a  ! 804: STWA_R	stwa	%r6, [%r30 + %r26] 0x23
	.word 0xc7bc903a  ! 806: STDFA_R	stda	%f3, [%r26, %r18]
NC_AIUS267:
	.word 0xc687c33a  ! 808: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r3
	.word 0xc7bb501a  ! 809: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc7f2e01a  ! 810: CASXA_R	casxa	[%r11]%asi, %r26, %r3
CHANGE_USER268:
	ta	T_CHANGE_NONPRIV
CHANGE_R26269:
	mov	%g0,	%r26
NC_BIS_PRI269:
	.word 0xc4f39c5a  ! 812: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS271:
	.word 0xc79f833a  ! 814: LDDFA_R	ldda	[%r30, %r26], %f3
CP_AIUP272:
	.word 0xc7a6021a  ! 816: STFA_R	sta	%f3, [%r26, %r24]
	.word 0xc79c903a  ! 818: LDDFA_R	ldda	[%r18, %r26], %f3
NC_AIUP273:
	.word 0xc79e431a  ! 820: LDDFA_R	ldda	[%r25, %r26], %f3
WR_LEASI_274:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_275:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_PST_PRI276:
	.word 0xc7bb991a  ! 823: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc694d13a  ! 825: LDUHA_R	lduha	[%r19, %r26] 0x89, %r3
	.word 0xc6b4d13a  ! 827: STHA_R	stha	%r3, [%r19 + %r26] 0x89
	.word 0xc6a2911a  ! 828: STWA_R	stwa	%r3, [%r10 + %r26] 0x88
	.word 0xc68a901a  ! 829: LDUBA_R	lduba	[%r10, %r26] 0x80, %r3
CHANGE_R26277:
	add	%r26,	%r27,	%r26
CP_BIS_SEC277:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 831: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
	.word 0xc602801a  ! 832: LDUW_R	lduw	[%r10 + %r26], %r3
	.word 0xc6c4d13a  ! 834: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
	.word 0xc68c913a  ! 836: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
	.word 0xc6f4d03a  ! 838: STXA_R	stxa	%r3, [%r19 + %r26] 0x81
	.word 0xc7bc903a  ! 840: STDFA_R	stda	%f3, [%r26, %r18]
CHANGE_USER278:
	ta	T_CHANGE_NONPRIV
CHANGE_R26279:
	add	%r26,	%r27,	%r26
CP_BIS_PRI279:
	and	%r26,	%r28,	%r26
	.word 0xccaa9c5a  ! 842: STBA_R	stba	%r6, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP281:
	.word 0xc6f6421a  ! 844: STXA_R	stxa	%r3, [%r25 + %r26] 0x10
CP_BIS_QUAD_LD282:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 846: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
	.word 0xc71a801a  ! 847: LDDF_R	ldd	[%r10, %r26], %f3
CP_PST_PRI283:
	.word 0xc7bb181a  ! 849: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc7a3901a  ! 851: STFA_R	sta	%f3, [%r26, %r14]
	.word 0xc7036010  ! 852: LDF_I	ld	[%r13, 0x0010], %f3
CP_BIS_NUC284:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 854: STDA_R	stda	%r2, [%r20 + %r26] 0x27
CP_AIUS285:
	.word 0xc7bf833a  ! 856: STDFA_R	stda	%f3, [%r26, %r30]
NC_BLK_SEc286:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 858: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc7a4903a  ! 860: STFA_R	sta	%f3, [%r26, %r18]
CP_ATM_QUAD_LD287:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 862: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc6f4d03a  ! 864: STXA_R	stxa	%r3, [%r19 + %r26] 0x81
SET_TL1_288:
	ta	T_CHANGE_TO_TL1
CHANGE_R26289:
	add	%r26,	%r27,	%r26
NC_BIS_NUC289:
	.word 0xccf545fa  ! 866: STXA_R	stxa	%r6, [%r21 + %r26] 0x2f
	.word 0xc6b2d01a  ! 867: STHA_R	stha	%r3, [%r11 + %r26] 0x80
SET_TL0_290:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI291:
	.word 0xd0ac1c5a  ! 869: STBA_R	stba	%r8, [%r16 + %r26] 0xe2
	.word 0xc7a2901a  ! 870: STFA_R	sta	%f3, [%r26, %r10]
SET_TL1_292:
	ta	T_CHANGE_TO_TL1
CHANGE_R26293:
	add	%r26,	%r27,	%r26
NC_BIS_NUC293:
	.word 0xc4b545fa  ! 872: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
	.word 0xc6cad01a  ! 873: LDSBA_R	ldsba	[%r11, %r26] 0x80, %r3
	.word 0xc79b511a  ! 874: LDDFA_R	ldda	[%r13, %r26], %f3
CP_PST_PRI294:
	.word 0xc7bad95a  ! 876: STDFA_R	stda	%f3, [%r26, %r11]
CP_AIUP295:
	.word 0xc79e031a  ! 878: LDDFA_R	ldda	[%r24, %r26], %f3
	.word 0xc68a911a  ! 879: LDUBA_R	lduba	[%r10, %r26] 0x88, %r3
NC_AIUS296:
	.word 0xc6dfc33a  ! 881: LDXA_R	ldxa	[%r31, %r26] 0x19, %r3
	.word 0xc67b6010  ! 882: SWAP_I	swap	%r3, [%r13 + 0x0010]
CP_BIS_QUAD_LD297:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 884: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
NC_PST_PRI298:
	.word 0xc7bb981a  ! 886: STDFA_R	stda	%f3, [%r26, %r14]
NC_BIS_AIUP299:
	.word 0xccf6445a  ! 888: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xc6cc501a  ! 890: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r3
	.word 0xc6f3501a  ! 891: STXA_R	stxa	%r3, [%r13 + %r26] 0x80
	.word 0xc4bcd13a  ! 893: STDA_R	stda	%r2, [%r19 + %r26] 0x89
	.word 0xc6ccd13a  ! 895: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
	.word 0xc7032010  ! 896: LDF_I	ld	[%r12, 0x0010], %f3
SET_TL0_300:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI301:
	.word 0xc4bb9c5a  ! 898: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
SHORT_FP_PRI302:
	.word 0xc79a9b1a  ! 900: LDDFA_R	ldda	[%r10, %r26], %f3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS304:
	.word 0xc6c7833a  ! 902: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r3
	.word 0xc782d15a  ! 903: LDFA_R	lda	[%r11, %r26], %f3
NC_BLK_SEc305:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 905: STDFA_R	stda	%f0, [%r26, %r19]
NC_AIUS306:
	.word 0xc6b7c23a  ! 907: STHA_R	stha	%r3, [%r31 + %r26] 0x11
NC_BIS_AIUP307:
	.word 0xc4be445a  ! 909: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xc6a2901a  ! 910: STWA_R	stwa	%r3, [%r10 + %r26] 0x80
	.word 0xc693901a  ! 912: LDUHA_R	lduha	[%r14, %r26] 0x80, %r3
CP_BIS_AIUP308:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 914: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
NC_AIUP309:
	.word 0xc6f6421a  ! 916: STXA_R	stxa	%r3, [%r25 + %r26] 0x10
NC_AIUS310:
	.word 0xc49fc33a  ! 918: LDDA_R	ldda	[%r31, %r26] 0x19, %r2
CP_BIS_NUC311:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 920: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc68c913a  ! 922: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
	.word 0xc6d4d03a  ! 924: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
NC_NUC312:
	.word 0xc685419a  ! 926: LDUWA_R	lduwa	[%r21, %r26] 0x0c, %r3
	.word 0xc6dcd03a  ! 928: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
NC_SHORT_FP_SEC313:
	.word 0xc7bcdb3a  ! 930: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc68bd01a  ! 932: LDUBA_R	lduba	[%r15, %r26] 0x80, %r3
	.word 0xc6332012  ! 933: STH_I	sth	%r3, [%r12 + 0x0012]
NC_AIUP314:
	.word 0xc6f6421a  ! 935: STXA_R	stxa	%r3, [%r25 + %r26] 0x10
	.word 0xc43b2010  ! 936: STD_I	std	%r2, [%r12 + 0x0010]
	.word 0xc6a4d13a  ! 938: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
	.word 0xc7bbd11a  ! 940: STDFA_R	stda	%f3, [%r26, %r15]
	.word 0xc6cc903a  ! 942: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
	.word 0xc68c913a  ! 944: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
CP_AIUP315:
	.word 0xc686021a  ! 946: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r3
CP_BIS_AIUS316:
	and	%r26,	%r28,	%r26
	.word 0xc4a7857a  ! 948: STWA_R	stwa	%r2, [%r30 + %r26] 0x2b
NC_SHORT_FP_SEC317:
	.word 0xc7bcdb3a  ! 950: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc7bc903a  ! 952: STDFA_R	stda	%f3, [%r26, %r18]
	.word 0xc6ccd03a  ! 954: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
NC_BIS_AIUS318:
	.word 0xc8f7c57a  ! 956: STXA_R	stxa	%r4, [%r31 + %r26] 0x2b
	.word 0xc7a2901a  ! 957: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc7232010  ! 958: STF_I	st	%f3, [0x0010, %r12]
	.word 0xc684903a  ! 960: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
CP_BIS_AIUP319:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 962: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
	.word 0xc73ae010  ! 963: STDF_I	std	%f3, [0x0010, %r11]
CP_AIUS320:
	.word 0xc6f7833a  ! 965: STXA_R	stxa	%r3, [%r30 + %r26] 0x19
NC_BIS_SEC321:
	.word 0xc8f4dc7a  ! 967: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
NC_AIUS322:
	.word 0xc697c33a  ! 969: LDUHA_R	lduha	[%r31, %r26] 0x19, %r3
SET_TL1_323:
	ta	T_CHANGE_TO_TL1
CHANGE_R26324:
	mov	%g0,	%r26
NC_BIS_NUC324:
	.word 0xd0ad44fa  ! 971: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xc702c01a  ! 972: LDF_R	ld	[%r11, %r26], %f3
NC_NUC325:
	.word 0xc685409a  ! 974: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r3
CHANGE_R26326:
	add	%r26,	%r27,	%r26
CP_BIS_SEC326:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 976: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xc66b6013  ! 977: LDSTUB_I	ldstub	%r3, [%r13 + 0x0013]
BLK_PRI327:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 979: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc694d13a  ! 981: LDUHA_R	lduha	[%r19, %r26] 0x89, %r3
	.word 0xc673001a  ! 982: STX_R	stx	%r3, [%r12 + %r26]
	.word 0xc66ac01a  ! 983: LDSTUB_R	ldstub	%r3, [%r11 + %r26]
	.word 0xc682901a  ! 984: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r3
CP_BIS_AIUP328:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 986: STDA_R	stda	%r2, [%r24 + %r26] 0x22
NC_NUC329:
	.word 0xc6b5409a  ! 988: STHA_R	stha	%r3, [%r21 + %r26] 0x04
	.word 0xc6dc903a  ! 990: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
	.word 0xc4bcd13a  ! 992: STDA_R	stda	%r2, [%r19 + %r26] 0x89
	.word 0xc694903a  ! 994: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
SET_TL0_330:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI331:
	.word 0xc4bb9c5a  ! 996: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
WR_LEASI_332:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_333:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc784d03a  ! 999: LDFA_R	lda	[%r19, %r26], %f3
	.word 0xc6ac913a  ! 1001: STBA_R	stba	%r3, [%r18 + %r26] 0x89
CHANGE_PRIV334:
	ta	T_CHANGE_PRIV
CHANGE_R26335:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP335:
	.word 0xc4be455a  ! 1003: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
CHANGE_USER336:
	ta	T_CHANGE_NONPRIV
CHANGE_R26337:
	add	%r26,	%r27,	%r26
CP_BIS_PRI337:
	and	%r26,	%r28,	%r26
	.word 0xc8b35c5a  ! 1005: STHA_R	stha	%r4, [%r13 + %r26] 0xe2
	.word 0xc66ac01a  ! 1006: LDSTUB_R	ldstub	%r3, [%r11 + %r26]
	.word 0xc6c3901a  ! 1008: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r3
	.word 0xc4bcd13a  ! 1010: STDA_R	stda	%r2, [%r19 + %r26] 0x89
BLK_PRI338:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 1012: LDDFA_R	ldda	[%r10, %r26], %f16
CHANGE_R26339:
	add	%r26,	%r27,	%r26
CP_BIS_SEC339:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9d7a  ! 1014: STBA_R	stba	%r4, [%r18 + %r26] 0xeb
	.word 0xc7bb501a  ! 1015: STDFA_R	stda	%f3, [%r26, %r13]
CP_BIS_PRI340:
	and	%r26,	%r28,	%r26
	.word 0xc89a9c5a  ! 1017: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xc632c01a  ! 1018: STH_R	sth	%r3, [%r11 + %r26]
	.word 0xc6dc903a  ! 1020: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
	.word 0xc4bcd03a  ! 1022: STDA_R	stda	%r2, [%r19 + %r26] 0x81
	.word 0xc67b2010  ! 1023: SWAP_I	swap	%r3, [%r12 + 0x0010]
CHANGE_PRIV341:
	ta	T_CHANGE_PRIV
CHANGE_R26342:
	add	%r26,	%r27,	%r26
CP_BIS_NUC342:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 1025: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xc6ab901a  ! 1027: STBA_R	stba	%r3, [%r14 + %r26] 0x80
	.word 0xc7a4903a  ! 1029: STFA_R	sta	%f3, [%r26, %r18]
NC_PST_PRI343:
	.word 0xc7bb985a  ! 1031: STDFA_R	stda	%f3, [%r26, %r14]
CHANGE_USER344:
	ta	T_CHANGE_NONPRIV
CHANGE_R26345:
	add	%r26,	%r27,	%r26
CP_BIS_PRI345:
	and	%r26,	%r28,	%r26
	.word 0xc4bb5d5a  ! 1033: STDA_R	stda	%r2, [%r13 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP347:
	.word 0xc6de021a  ! 1035: LDXA_R	ldxa	[%r24, %r26] 0x10, %r3
	.word 0xc6ac501a  ! 1037: STBA_R	stba	%r3, [%r17 + %r26] 0x80
CHANGE_USER348:
	ta	T_CHANGE_NONPRIV
CHANGE_R26349:
	mov	%g0,	%r26
NC_BIS_PRI349:
	.word 0xd0f3dc5a  ! 1039: STXA_R	stxa	%r8, [%r15 + %r26] 0xe2
	.word 0xc694903a  ! 1041: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
CHANGE_PRIV350:
	ta	T_CHANGE_PRIV
CHANGE_R26351:
	add	%r26,	%r27,	%r26
CP_BIS_NUC351:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 1043: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc6dc501a  ! 1045: LDXA_R	ldxa	[%r17, %r26] 0x80, %r3
	.word 0xc4bbd01a  ! 1047: STDA_R	stda	%r2, [%r15 + %r26] 0x80
NC_AIUP352:
	.word 0xc6de421a  ! 1049: LDXA_R	ldxa	[%r25, %r26] 0x10, %r3
NC_SHORT_FP_SEC353:
	.word 0xc79cda3a  ! 1051: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc6d3901a  ! 1053: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
CHANGE_R26354:
	add	%r26,	%r27,	%r26
CP_BIS_SEC354:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 1055: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
NC_PST_PRI355:
	.word 0xc7bb989a  ! 1057: STDFA_R	stda	%f3, [%r26, %r14]
NC_BLK_SEc356:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1059: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_R26357:
	add	%r26,	%r27,	%r26
CP_BIS_SEC357:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 1061: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
CP_AIUS358:
	.word 0xc6cf833a  ! 1063: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r3
CP_AIUP359:
	.word 0xc786021a  ! 1065: LDFA_R	lda	[%r24, %r26], %f3
	.word 0xc7a4903a  ! 1067: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc6b3901a  ! 1069: STHA_R	stha	%r3, [%r14 + %r26] 0x80
	.word 0xc62ae013  ! 1070: STB_I	stb	%r3, [%r11 + 0x0013]
	.word 0xc6a4d03a  ! 1072: STWA_R	stwa	%r3, [%r19 + %r26] 0x81
CHANGE_R26360:
	add	%r26,	%r27,	%r26
CP_BIS_SEC360:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 1074: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
	.word 0xc7ba911a  ! 1075: STDFA_R	stda	%f3, [%r26, %r10]
CHANGE_USER361:
	ta	T_CHANGE_NONPRIV
CHANGE_R26362:
	add	%r26,	%r27,	%r26
NC_BIS_PRI362:
	.word 0xc4b41c5a  ! 1077: STHA_R	stha	%r2, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP364:
	.word 0xc6ce421a  ! 1079: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r3
	.word 0xc49bd11a  ! 1081: LDDA_R	ldda	[%r15, %r26] 0x88, %r2
	.word 0xc6acd13a  ! 1083: STBA_R	stba	%r3, [%r19 + %r26] 0x89
	.word 0xc7a4903a  ! 1085: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc7bcd13a  ! 1087: STDFA_R	stda	%f3, [%r26, %r19]
NC_PST_PRI365:
	.word 0xc7bc199a  ! 1089: STDFA_R	stda	%f3, [%r26, %r16]
SHORT_FP_PRI366:
	.word 0xc7badb5a  ! 1091: STDFA_R	stda	%f3, [%r26, %r11]
	.word 0xc49c913a  ! 1093: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
CP_AIUS367:
	.word 0xc7bf823a  ! 1095: STDFA_R	stda	%f3, [%r26, %r30]
CP_BIS_NUC368:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1097: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xc684913a  ! 1099: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r3
CP_NUC369:
	.word 0xc685019a  ! 1101: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r3
	.word 0xc6fad01a  ! 1102: SWAPA_R	swapa	%r3, [%r11 + %r26] 0x80
	.word 0xc684903a  ! 1104: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc783911a  ! 1106: LDFA_R	lda	[%r14, %r26], %f3
CP_PST_PRI370:
	.word 0xc7bb589a  ! 1108: STDFA_R	stda	%f3, [%r26, %r13]
SET_TL1_371:
	ta	T_CHANGE_TO_TL1
CHANGE_R26372:
	add	%r26,	%r27,	%r26
NC_BIS_NUC372:
	.word 0xccf544fa  ! 1110: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
	.word 0xc4bc501a  ! 1112: STDA_R	stda	%r2, [%r17 + %r26] 0x80
NC_BLK_SEc373:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1114: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc694d13a  ! 1116: LDUHA_R	lduha	[%r19, %r26] 0x89, %r3
	.word 0xc6d4903a  ! 1118: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
NC_BLK_SEc374:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1120: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc6f3101a  ! 1121: STXA_R	stxa	%r3, [%r12 + %r26] 0x80
SET_TL0_375:
	ta	T_CHANGE_TO_TL0
WR_LEASI_376:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_377:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4bcd03a  ! 1124: STDA_R	stda	%r2, [%r19 + %r26] 0x81
CHANGE_PRIV378:
	ta	T_CHANGE_PRIV
CHANGE_R26379:
	mov	%g0,	%r26
CP_BIS_AIUP379:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 1126: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
	.word 0xc782905a  ! 1127: LDFA_R	lda	[%r10, %r26], %f3
SHORT_FP_PRI380:
	.word 0xc79b5a1a  ! 1129: LDDFA_R	ldda	[%r13, %r26], %f3
NC_BIS_AIUS381:
	.word 0xc4afc47a  ! 1131: STBA_R	stba	%r2, [%r31 + %r26] 0x23
	.word 0xc79b111a  ! 1132: LDDFA_R	ldda	[%r12, %r26], %f3
NC_AIUS382:
	.word 0xc6dfc33a  ! 1134: LDXA_R	ldxa	[%r31, %r26] 0x19, %r3
CP_BIS_AIUS383:
	and	%r26,	%r28,	%r26
	.word 0xcc9f857a  ! 1136: LDDA_R	ldda	[%r30, %r26] 0x2b, %r6
CHANGE_USER384:
	ta	T_CHANGE_NONPRIV
CHANGE_R26385:
	add	%r26,	%r27,	%r26
NC_BIS_PRI385:
	.word 0xd0f45d5a  ! 1138: STXA_R	stxa	%r8, [%r17 + %r26] 0xea
	.word 0xc6f4d13a  ! 1140: STXA_R	stxa	%r3, [%r19 + %r26] 0x89
	.word 0xc684913a  ! 1142: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r3
	.word 0xc6a3111a  ! 1143: STWA_R	stwa	%r3, [%r12 + %r26] 0x88
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS387:
	.word 0xc7a7823a  ! 1145: STFA_R	sta	%f3, [%r26, %r30]
	.word 0xc6ccd03a  ! 1147: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
NC_AIUP388:
	.word 0xc6b6421a  ! 1149: STHA_R	stha	%r3, [%r25 + %r26] 0x10
CHANGE_R26389:
	add	%r26,	%r27,	%r26
CP_BIS_SEC389:
	and	%r26,	%r28,	%r26
	.word 0xc8a49d7a  ! 1151: STWA_R	stwa	%r4, [%r18 + %r26] 0xeb
CHANGE_R26390:
	add	%r26,	%r27,	%r26
CP_BIS_SEC390:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1153: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
	.word 0xc6acd13a  ! 1155: STBA_R	stba	%r3, [%r19 + %r26] 0x89
	.word 0xc6736010  ! 1156: STX_I	stx	%r3, [%r13 + 0x0010]
NC_PST_PRI391:
	.word 0xc7bc589a  ! 1158: STDFA_R	stda	%f3, [%r26, %r17]
	.word 0xc6d4913a  ! 1160: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r3
	.word 0xc4ba901a  ! 1161: STDA_R	stda	%r2, [%r10 + %r26] 0x80
	.word 0xc64ac01a  ! 1162: LDSB_R	ldsb	[%r11 + %r26], %r3
CP_AIUS392:
	.word 0xc68f833a  ! 1164: LDUBA_R	lduba	[%r30, %r26] 0x19, %r3
	.word 0xc6d3d01a  ! 1166: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r3
	.word 0xc6b2901a  ! 1167: STHA_R	stha	%r3, [%r10 + %r26] 0x80
	.word 0xc7a4d03a  ! 1169: STFA_R	sta	%f3, [%r26, %r19]
	.word 0xc6a4d03a  ! 1171: STWA_R	stwa	%r3, [%r19 + %r26] 0x81
	.word 0xc6d4903a  ! 1173: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
	.word 0xc702e010  ! 1174: LDF_I	ld	[%r11, 0x0010], %f3
NC_BIS_AIUP393:
	.word 0xc8be445a  ! 1176: STDA_R	stda	%r4, [%r25 + %r26] 0x22
CP_NUC394:
	.word 0xc6cd009a  ! 1178: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r3
	.word 0xc6a4903a  ! 1180: STWA_R	stwa	%r3, [%r18 + %r26] 0x81
	.word 0xc6dad11a  ! 1181: LDXA_R	ldxa	[%r11, %r26] 0x88, %r3
SET_TL1_395:
	ta	T_CHANGE_TO_TL1
CHANGE_R26396:
	add	%r26,	%r27,	%r26
NC_BIS_NUC396:
	.word 0xc4f544fa  ! 1183: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUP397:
	.word 0xc8ae445a  ! 1185: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xc62aa013  ! 1186: STB_I	stb	%r3, [%r10 + 0x0013]
	.word 0xc622e010  ! 1187: STW_I	stw	%r3, [%r11 + 0x0010]
	.word 0xc6cb511a  ! 1188: LDSBA_R	ldsba	[%r13, %r26] 0x88, %r3
	.word 0xc723001a  ! 1189: STF_R	st	%f3, [%r26, %r12]
	.word 0xc60a801a  ! 1190: LDUB_R	ldub	[%r10 + %r26], %r3
NC_BLK_SEc398:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1192: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc684d03a  ! 1194: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r3
BLK_PRI399:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 1196: LDDFA_R	ldda	[%r10, %r26], %f16
NC_BIS_AIUP400:
	.word 0xc8b6455a  ! 1198: STHA_R	stha	%r4, [%r25 + %r26] 0x2a
	.word 0xc7e2a01a  ! 1199: CASA_R	casa	[%r10] %asi, %r26, %r3
CP_NUC401:
	.word 0xc79d009a  ! 1201: LDDFA_R	ldda	[%r20, %r26], %f3
NC_BLK_SEc402:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1203: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc694903a  ! 1205: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
	.word 0xc6f4913a  ! 1207: STXA_R	stxa	%r3, [%r18 + %r26] 0x89
	.word 0xc784903a  ! 1209: LDFA_R	lda	[%r18, %r26], %f3
CP_BIS_QUAD_LD403:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1211: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
CP_AIUP404:
	.word 0xc6a6031a  ! 1213: STWA_R	stwa	%r3, [%r24 + %r26] 0x18
NC_BLK_SEc405:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1215: STDFA_R	stda	%f16, [%r26, %r19]
CP_BIS_NUC406:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 1217: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
NC_PST_PRI407:
	.word 0xc7bb981a  ! 1219: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6dcd03a  ! 1221: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
NC_BLK_SEc408:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1223: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc7bc111a  ! 1225: STDFA_R	stda	%f3, [%r26, %r16]
SET_TL0_409:
	ta	T_CHANGE_TO_TL0
WR_LEASI_410:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_411:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_PST_PRI412:
	.word 0xc7bc581a  ! 1228: STDFA_R	stda	%f3, [%r26, %r17]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC414:
	.word 0xc49d009a  ! 1230: LDDA_R	ldda	[%r20, %r26] 0x04, %r2
	.word 0xc68c913a  ! 1232: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
	.word 0xc6ab901a  ! 1234: STBA_R	stba	%r3, [%r14 + %r26] 0x80
	.word 0xc6c4111a  ! 1236: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r3
	.word 0xc694d13a  ! 1238: LDUHA_R	lduha	[%r19, %r26] 0x89, %r3
CP_BIS_AIUP415:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1240: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xc6c4d13a  ! 1242: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
	.word 0xc79c903a  ! 1244: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc6b4d13a  ! 1246: STHA_R	stha	%r3, [%r19 + %r26] 0x89
	.word 0xc6b4d03a  ! 1248: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc6b4903a  ! 1250: STHA_R	stha	%r3, [%r18 + %r26] 0x81
NC_NUC416:
	.word 0xc6a5409a  ! 1252: STWA_R	stwa	%r3, [%r21 + %r26] 0x04
	.word 0xc68cd03a  ! 1254: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
	.word 0xc79cd03a  ! 1256: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc7a2911a  ! 1257: STFA_R	sta	%f3, [%r26, %r10]
NC_AIUP417:
	.word 0xc696421a  ! 1259: LDUHA_R	lduha	[%r25, %r26] 0x10, %r3
	.word 0xc64aa013  ! 1260: LDSB_I	ldsb	[%r10 + 0x0013], %r3
SET_TL1_418:
	ta	T_CHANGE_TO_TL1
CHANGE_R26419:
	add	%r26,	%r27,	%r26
NC_BIS_NUC419:
	.word 0xc8bd45fa  ! 1262: STDA_R	stda	%r4, [%r21 + %r26] 0x2f
	.word 0xc783111a  ! 1263: LDFA_R	lda	[%r12, %r26], %f3
SET_TL0_420:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI421:
	.word 0xccbc1d5a  ! 1265: STDA_R	stda	%r6, [%r16 + %r26] 0xea
	.word 0xc6f4d13a  ! 1267: STXA_R	stxa	%r3, [%r19 + %r26] 0x89
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC423:
	.word 0xc7a5019a  ! 1269: STFA_R	sta	%f3, [%r26, %r20]
CP_AIUP424:
	.word 0xc6c6031a  ! 1271: LDSWA_R	ldswa	[%r24, %r26] 0x18, %r3
BLK_PRI425:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1273: STDFA_R	stda	%f0, [%r26, %r10]
CP_BIS_QUAD_LD426:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1275: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CHANGE_R26427:
	add	%r26,	%r27,	%r26
CP_BIS_SEC427:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 1277: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xc694d03a  ! 1279: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
CP_AIUS428:
	.word 0xc49f833a  ! 1281: LDDA_R	ldda	[%r30, %r26] 0x19, %r2
	.word 0xc6ccd13a  ! 1283: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
	.word 0xc49b901a  ! 1285: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc6fb501a  ! 1286: SWAPA_R	swapa	%r3, [%r13 + %r26] 0x80
	.word 0xc684501a  ! 1288: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r3
	.word 0xc694d03a  ! 1290: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
	.word 0xc7a3501a  ! 1291: STFA_R	sta	%f3, [%r26, %r13]
CHANGE_USER429:
	ta	T_CHANGE_NONPRIV
CHANGE_R26430:
	add	%r26,	%r27,	%r26
CP_BIS_PRI430:
	and	%r26,	%r28,	%r26
	.word 0xc4a35c5a  ! 1293: STWA_R	stwa	%r2, [%r13 + %r26] 0xe2
	.word 0xc7a2901a  ! 1294: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc43b2010  ! 1295: STD_I	std	%r2, [%r12 + 0x0010]
CHANGE_PRIV431:
	ta	T_CHANGE_PRIV
CHANGE_R26432:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS432:
	.word 0xc4b7c47a  ! 1297: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xc43aa010  ! 1298: STD_I	std	%r2, [%r10 + 0x0010]
WR_LEASI_433:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_434:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc6ab111a  ! 1300: STBA_R	stba	%r3, [%r12 + %r26] 0x88
	.word 0xc7f2a01a  ! 1301: CASXA_R	casxa	[%r10]%asi, %r26, %r3
CHANGE_USER435:
	ta	T_CHANGE_NONPRIV
CHANGE_R26436:
	add	%r26,	%r27,	%r26
NC_BIS_PRI436:
	.word 0xc4a3dd5a  ! 1303: STWA_R	stwa	%r2, [%r15 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP438:
	.word 0xc6c6421a  ! 1305: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r3
NC_AIUP439:
	.word 0xc7be431a  ! 1307: STDFA_R	stda	%f3, [%r26, %r25]
CP_AIUS440:
	.word 0xc787823a  ! 1309: LDFA_R	lda	[%r30, %r26], %f3
CP_BIS_AIUS441:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 1311: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
CP_BIS_NUC442:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1313: STHA_R	stha	%r2, [%r20 + %r26] 0x27
NC_BIS_SEC443:
	.word 0xccb4dd7a  ! 1315: STHA_R	stha	%r6, [%r19 + %r26] 0xeb
NC_AIUP444:
	.word 0xc79e431a  ! 1317: LDDFA_R	ldda	[%r25, %r26], %f3
	.word 0xc6ab501a  ! 1318: STBA_R	stba	%r3, [%r13 + %r26] 0x80
	.word 0xc782905a  ! 1319: LDFA_R	lda	[%r10, %r26], %f3
NC_SHORT_FP_SEC445:
	.word 0xc79cdb3a  ! 1321: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc722c01a  ! 1322: STF_R	st	%f3, [%r26, %r11]
	.word 0xc7036010  ! 1323: LDF_I	ld	[%r13, 0x0010], %f3
	.word 0xc784913a  ! 1325: LDFA_R	lda	[%r18, %r26], %f3
CHANGE_TLE446:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc6b4d03a  ! 1328: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc68c913a  ! 1330: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
	.word 0xc783515a  ! 1331: LDFA_R	lda	[%r13, %r26], %f3
	.word 0xc694d03a  ! 1333: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
CHANGE_PRIV447:
	ta	T_CHANGE_PRIV
CHANGE_R26448:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS448:
	.word 0xc8bfc47a  ! 1335: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xc6acd13a  ! 1337: STBA_R	stba	%r3, [%r19 + %r26] 0x89
	.word 0xc71ac01a  ! 1338: LDDF_R	ldd	[%r11, %r26], %f3
	.word 0xc68cd03a  ! 1340: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
NC_AIUS449:
	.word 0xc6c7c33a  ! 1342: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r3
	.word 0xc694903a  ! 1344: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
NC_PST_PRI450:
	.word 0xc7bbd91a  ! 1346: STDFA_R	stda	%f3, [%r26, %r15]
CP_NUC451:
	.word 0xc7e5201a  ! 1348: CASA_R	casa	[%r20] %asi, %r26, %r3
CP_BIS_NUC452:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 1350: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xc602e010  ! 1351: LDUW_I	lduw	[%r11 + 0x0010], %r3
NC_BIS_AIUS453:
	.word 0xccb7c47a  ! 1353: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xc1ef8e3a  ! 1355: PREFETCHA_R	prefetcha	[%r30, %r26] 0x71, #n_reads
	.word 0xc79a911a  ! 1356: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc684903a  ! 1358: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
CP_NUC454:
	.word 0xc6cd019a  ! 1360: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r3
CP_ATM_QUAD_LD455:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 1362: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
NC_BLK_SEc456:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1364: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_USER457:
	ta	T_CHANGE_NONPRIV
CHANGE_R26458:
	add	%r26,	%r27,	%r26
NC_BIS_PRI458:
	.word 0xc4bb9c5a  ! 1366: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS460:
	.word 0xc6c7833a  ! 1368: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r3
NC_BIS_AIUS461:
	.word 0xccbfc47a  ! 1370: STDA_R	stda	%r6, [%r31 + %r26] 0x23
CHANGE_USER462:
	ta	T_CHANGE_NONPRIV
CHANGE_R26463:
	add	%r26,	%r27,	%r26
CP_BIS_PRI463:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 1372: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	.word 0xc782911a  ! 1373: LDFA_R	lda	[%r10, %r26], %f3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC465:
	.word 0xc4bd419a  ! 1375: STDA_R	stda	%r2, [%r21 + %r26] 0x0c
CP_AIUS466:
	.word 0xc79f833a  ! 1377: LDDFA_R	ldda	[%r30, %r26], %f3
	.word 0xc49c903a  ! 1379: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
CP_PST_PRI467:
	.word 0xc7bad81a  ! 1381: STDFA_R	stda	%f3, [%r26, %r11]
	.word 0xc73aa010  ! 1382: STDF_I	std	%f3, [0x0010, %r10]
CHANGE_TLE468:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP470:
	.word 0xc49e421a  ! 1385: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
	.word 0xc4bbd01a  ! 1387: STDA_R	stda	%r2, [%r15 + %r26] 0x80
	.word 0xc71b401a  ! 1388: LDDF_R	ldd	[%r13, %r26], %f3
	.word 0xc7e2a01a  ! 1389: CASA_R	casa	[%r10] %asi, %r26, %r3
NC_PST_PRI471:
	.word 0xc7bb981a  ! 1391: STDFA_R	stda	%f3, [%r26, %r14]
CHANGE_USER472:
	ta	T_CHANGE_NONPRIV
CHANGE_R26473:
	add	%r26,	%r27,	%r26
CP_BIS_PRI473:
	and	%r26,	%r28,	%r26
	.word 0xcca29c5a  ! 1393: STWA_R	stwa	%r6, [%r10 + %r26] 0xe2
	.word 0xc67b401a  ! 1394: SWAP_R	swap	%r3, [%r13 + %r26]
	.word 0xc79c903a  ! 1396: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc6f2d01a  ! 1397: STXA_R	stxa	%r3, [%r11 + %r26] 0x80
	.word 0xc7a4d03a  ! 1399: STFA_R	sta	%f3, [%r26, %r19]
	.word 0xc7a2d01a  ! 1400: STFA_R	sta	%f3, [%r26, %r11]
NC_BIS_SEC474:
	.word 0xc4f4dd7a  ! 1402: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
	.word 0xc7f2a01a  ! 1403: CASXA_R	casxa	[%r10]%asi, %r26, %r3
CHANGE_PRIV475:
	ta	T_CHANGE_PRIV
CHANGE_R26476:
	add	%r26,	%r27,	%r26
CP_BIS_NUC476:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 1405: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc684903a  ! 1407: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc7a3d11a  ! 1409: STFA_R	sta	%f3, [%r26, %r15]
CHANGE_R26477:
	add	%r26,	%r27,	%r26
CP_BIS_SEC477:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 1411: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
BLK_PRI478:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 1413: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc6c4913a  ! 1415: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r3
CP_BIS_NUC479:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1417: STHA_R	stha	%r2, [%r20 + %r26] 0x27
SHORT_FP_PRI480:
	.word 0xc79a9a1a  ! 1419: LDDFA_R	ldda	[%r10, %r26], %f3
NC_BLK_SEc481:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1421: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc6c4d13a  ! 1423: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
	.word 0xc6b4101a  ! 1425: STHA_R	stha	%r3, [%r16 + %r26] 0x80
	.word 0xc684101a  ! 1427: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r3
	.word 0xc6dc101a  ! 1429: LDXA_R	ldxa	[%r16, %r26] 0x80, %r3
NC_PST_PRI482:
	.word 0xc7bb985a  ! 1431: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6b4d03a  ! 1433: STHA_R	stha	%r3, [%r19 + %r26] 0x81
NC_AIUP483:
	.word 0xc696421a  ! 1435: LDUHA_R	lduha	[%r25, %r26] 0x10, %r3
	.word 0xc6a3911a  ! 1437: STWA_R	stwa	%r3, [%r14 + %r26] 0x88
NC_BIS_AIUS484:
	.word 0xc8bfc47a  ! 1439: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xc7a3501a  ! 1440: STFA_R	sta	%f3, [%r26, %r13]
CP_BIS_QUAD_LD485:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 1442: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
CHANGE_TLE486:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
BLK_PRI487:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 1445: STDFA_R	stda	%f16, [%r26, %r10]
NC_BLK_SEc488:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1447: LDDFA_R	ldda	[%r19, %r26], %f0
NC_BIS_SEC489:
	.word 0xc4acdc7a  ! 1449: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc783d11a  ! 1451: LDFA_R	lda	[%r15, %r26], %f3
CP_PST_PRI490:
	.word 0xc7bad99a  ! 1453: STDFA_R	stda	%f3, [%r26, %r11]
NC_BIS_SEC491:
	.word 0xc4f4dc7a  ! 1455: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xc6d4913a  ! 1457: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r3
	.word 0xc694913a  ! 1459: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
	.word 0xc7a2901a  ! 1460: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc782901a  ! 1461: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc6c4903a  ! 1463: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC493:
	.word 0xc68d019a  ! 1465: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r3
NC_BLK_SEc494:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1467: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc7a4903a  ! 1469: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc65b401a  ! 1470: LDX_R	ldx	[%r13 + %r26], %r3
	.word 0xc79cd13a  ! 1472: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc68cd03a  ! 1474: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
	.word 0xc694501a  ! 1476: LDUHA_R	lduha	[%r17, %r26] 0x80, %r3
NC_BIS_AIUP495:
	.word 0xccb6445a  ! 1478: STHA_R	stha	%r6, [%r25 + %r26] 0x22
CHANGE_TLE496:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_SHORT_FP_SEC497:
	.word 0xc79cda7a  ! 1481: LDDFA_R	ldda	[%r19, %r26], %f3
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC499:
	.word 0xc7a5019a  ! 1483: STFA_R	sta	%f3, [%r26, %r20]
CP_NUC500:
	.word 0xc79d009a  ! 1485: LDDFA_R	ldda	[%r20, %r26], %f3
NC_AIUS501:
	.word 0xc687c23a  ! 1487: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r3
CP_PST_PRI502:
	.word 0xc7ba991a  ! 1489: STDFA_R	stda	%f3, [%r26, %r10]
CP_BIS_AIUP503:
	and	%r26,	%r28,	%r26
	.word 0xc8be055a  ! 1491: STDA_R	stda	%r4, [%r24 + %r26] 0x2a
	.word 0xc68b911a  ! 1493: LDUBA_R	lduba	[%r14, %r26] 0x88, %r3
	.word 0xc684903a  ! 1495: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
NC_BIS_SEC504:
	.word 0xc4a4dc7a  ! 1497: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xc784d03a  ! 1499: LDFA_R	lda	[%r19, %r26], %f3
NC_NUC505:
	.word 0xc785419a  ! 1501: LDFA_R	lda	[%r21, %r26], %f3
CHANGE_USER506:
	ta	T_CHANGE_NONPRIV
CHANGE_R26507:
	add	%r26,	%r27,	%r26
NC_BIS_PRI507:
	.word 0xd0b39c5a  ! 1503: STHA_R	stha	%r8, [%r14 + %r26] 0xe2
	.word 0xc684903a  ! 1505: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
CP_BIS_QUAD_LD508:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1507: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS510:
	.word 0xc49f823a  ! 1509: LDDA_R	ldda	[%r30, %r26] 0x11, %r2
	.word 0xc68bd11a  ! 1511: LDUBA_R	lduba	[%r15, %r26] 0x88, %r3
	.word 0xc7a4111a  ! 1513: STFA_R	sta	%f3, [%r26, %r16]
	.word 0xc6d4903a  ! 1515: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
	.word 0xc67b2010  ! 1516: SWAP_I	swap	%r3, [%r12 + 0x0010]
	.word 0xc7ba901a  ! 1517: STDFA_R	stda	%f3, [%r26, %r10]
CP_ATM_QUAD_LD511:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 1519: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
CP_ATM_QUAD_LD512:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1521: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc783901a  ! 1523: LDFA_R	lda	[%r14, %r26], %f3
CHANGE_R26513:
	add	%r26,	%r27,	%r26
CP_BIS_SEC513:
	and	%r26,	%r28,	%r26
	.word 0xd0b49d7a  ! 1525: STHA_R	stha	%r8, [%r18 + %r26] 0xeb
	.word 0xc6b4101a  ! 1527: STHA_R	stha	%r3, [%r16 + %r26] 0x80
NC_BIS_SEC514:
	.word 0xc4bcdc7a  ! 1529: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_ATM_QUAD_LD515:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1531: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
NC_BIS_SEC516:
	.word 0xc8bcdc7a  ! 1533: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
	.word 0xc6f4d13a  ! 1535: STXA_R	stxa	%r3, [%r19 + %r26] 0x89
	.word 0xc6ccd03a  ! 1537: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
	.word 0xc79c913a  ! 1539: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc6dcd03a  ! 1541: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
	.word 0xc49c913a  ! 1543: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
CP_ATM_QUAD_LD517:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1545: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_BIS_AIUP518:
	.word 0xc8f6445a  ! 1547: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
NC_BIS_SEC519:
	.word 0xc8f4dc7a  ! 1549: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xc62b6013  ! 1550: STB_I	stb	%r3, [%r13 + 0x0013]
	.word 0xc6fb501a  ! 1551: SWAPA_R	swapa	%r3, [%r13 + %r26] 0x80
	.word 0xc64a801a  ! 1552: LDSB_R	ldsb	[%r10 + %r26], %r3
NC_BIS_SEC520:
	.word 0xccb4dc7a  ! 1554: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
	.word 0xc7bbd01a  ! 1556: STDFA_R	stda	%f3, [%r26, %r15]
	.word 0xc7efa020  ! 1558: PREFETCHA_I	prefetcha	[%r30, + 0x0020] %asi, #one_write
NC_PST_PRI521:
	.word 0xc7bbd85a  ! 1560: STDFA_R	stda	%f3, [%r26, %r15]
NC_PST_PRI522:
	.word 0xc7bc581a  ! 1562: STDFA_R	stda	%f3, [%r26, %r17]
	.word 0xc49c903a  ! 1564: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc6dbd01a  ! 1566: LDXA_R	ldxa	[%r15, %r26] 0x80, %r3
	.word 0xc6c3d01a  ! 1568: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r3
	.word 0xc622c01a  ! 1569: STW_R	stw	%r3, [%r11 + %r26]
NC_PST_PRI523:
	.word 0xc7bb981a  ! 1571: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc694d03a  ! 1573: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
	.word 0xc6cc903a  ! 1575: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
CP_BIS_AIUS524:
	and	%r26,	%r28,	%r26
	.word 0xc8b7847a  ! 1577: STHA_R	stha	%r4, [%r30 + %r26] 0x23
	.word 0xc6cc511a  ! 1579: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r3
NC_AIUP525:
	.word 0xc6de431a  ! 1581: LDXA_R	ldxa	[%r25, %r26] 0x18, %r3
	.word 0xc6732010  ! 1582: STX_I	stx	%r3, [%r12 + 0x0010]
NC_SHORT_FP_SEC526:
	.word 0xc7bcda3a  ! 1584: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc66b401a  ! 1585: LDSTUB_R	ldstub	%r3, [%r13 + %r26]
	.word 0xc784903a  ! 1587: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc79b111a  ! 1588: LDDFA_R	ldda	[%r12, %r26], %f3
CP_ATM_QUAD_LD527:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 1590: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
CHANGE_R26528:
	add	%r26,	%r27,	%r26
CP_BIS_SEC528:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 1592: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
BLK_PRI529:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1594: STDFA_R	stda	%f0, [%r26, %r13]
SET_TL1_530:
	ta	T_CHANGE_TO_TL1
CHANGE_R26531:
	add	%r26,	%r27,	%r26
NC_BIS_NUC531:
	.word 0xccf544fa  ! 1596: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
	.word 0xc7eb6011  ! 1598: PREFETCHA_I	prefetcha	[%r13, + 0x0011] %asi, #one_write
CHANGE_R26532:
	add	%r26,	%r27,	%r26
CP_BIS_SEC532:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1600: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
SET_TL0_533:
	ta	T_CHANGE_TO_TL0
WR_LEASI_534:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_535:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_PRI536:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 1603: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
SET_TL1_537:
	ta	T_CHANGE_TO_TL1
CHANGE_R26538:
	add	%r26,	%r27,	%r26
NC_BIS_NUC538:
	.word 0xccb544fa  ! 1605: STHA_R	stha	%r6, [%r21 + %r26] 0x27
	.word 0xc7ba901a  ! 1606: STDFA_R	stda	%f3, [%r26, %r10]
SHORT_FP_PRI539:
	.word 0xc79a9a5a  ! 1608: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc6c3d01a  ! 1610: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r3
NC_BIS_AIUS540:
	.word 0xc4a7c57a  ! 1612: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
	.word 0xc7a2901a  ! 1613: STFA_R	sta	%f3, [%r26, %r10]
CP_BIS_AIUP541:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 1615: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
	.word 0xc4bcd03a  ! 1617: STDA_R	stda	%r2, [%r19 + %r26] 0x81
	.word 0xc67b401a  ! 1618: SWAP_R	swap	%r3, [%r13 + %r26]
CP_AIUS542:
	.word 0xc6df823a  ! 1620: LDXA_R	ldxa	[%r30, %r26] 0x11, %r3
	.word 0xc682905a  ! 1622: LDUWA_R	lduwa	[%r10, %r26] 0x82, %r3
	.word 0xc6db911a  ! 1624: LDXA_R	ldxa	[%r14, %r26] 0x88, %r3
	.word 0xc43b401a  ! 1625: STD_R	std	%r2, [%r13 + %r26]
	.word 0xc79bd11a  ! 1627: LDDFA_R	ldda	[%r15, %r26], %f3
	.word 0xc6d4d03a  ! 1629: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
	.word 0xc67b6010  ! 1630: SWAP_I	swap	%r3, [%r13 + 0x0010]
	.word 0xc782901a  ! 1631: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc6acd03a  ! 1633: STBA_R	stba	%r3, [%r19 + %r26] 0x81
	.word 0xc6f2901a  ! 1634: STXA_R	stxa	%r3, [%r10 + %r26] 0x80
NC_NUC543:
	.word 0xc68d419a  ! 1636: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r3
NC_AIUP544:
	.word 0xc49e421a  ! 1638: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
	.word 0xc6a3901a  ! 1640: STWA_R	stwa	%r3, [%r14 + %r26] 0x80
	.word 0xc784d13a  ! 1642: LDFA_R	lda	[%r19, %r26], %f3
CP_ATM_QUAD_LD545:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 1644: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
	.word 0xc6db515a  ! 1645: LDXA_R	ldxa	[%r13, %r26] 0x8a, %r3
CP_PST_PRI546:
	.word 0xc7bb185a  ! 1647: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc6c4101a  ! 1649: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r3
	.word 0xc784913a  ! 1651: LDFA_R	lda	[%r18, %r26], %f3
NC_PST_PRI547:
	.word 0xc7bc581a  ! 1653: STDFA_R	stda	%f3, [%r26, %r17]
	.word 0xc784903a  ! 1655: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc7bc903a  ! 1657: STDFA_R	stda	%f3, [%r26, %r18]
	.word 0xc6dc903a  ! 1659: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
CP_PST_PRI548:
	.word 0xc7bb181a  ! 1661: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc6b4903a  ! 1663: STHA_R	stha	%r3, [%r18 + %r26] 0x81
	.word 0xc6b4d03a  ! 1665: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc684d13a  ! 1667: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r3
	.word 0xc49a901a  ! 1668: LDDA_R	ldda	[%r10, %r26] 0x80, %r2
NC_BIS_AIUS549:
	.word 0xc4b7c57a  ! 1670: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
SET_TL0_550:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI551:
	and	%r26,	%r28,	%r26
	.word 0xc89a9d5a  ! 1672: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
CP_PST_PRI552:
	.word 0xc7bad91a  ! 1674: STDFA_R	stda	%f3, [%r26, %r11]
CP_BIS_QUAD_LD553:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 1676: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
NC_BIS_SEC554:
	.word 0xd0b4dd7a  ! 1678: STHA_R	stha	%r8, [%r19 + %r26] 0xeb
CHANGE_PRIV555:
	ta	T_CHANGE_PRIV
CHANGE_R26556:
	mov	%g0,	%r26
CP_BIS_AIUP556:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 1680: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xc6b3911a  ! 1682: STHA_R	stha	%r3, [%r14 + %r26] 0x88
	.word 0xc6b3901a  ! 1684: STHA_R	stha	%r3, [%r14 + %r26] 0x80
NC_AIUS557:
	.word 0xc68fc23a  ! 1686: LDUBA_R	lduba	[%r31, %r26] 0x11, %r3
	.word 0xc6732010  ! 1687: STX_I	stx	%r3, [%r12 + 0x0010]
	.word 0xc6b3911a  ! 1689: STHA_R	stha	%r3, [%r14 + %r26] 0x88
	.word 0xc6acd03a  ! 1691: STBA_R	stba	%r3, [%r19 + %r26] 0x81
SET_TL1_558:
	ta	T_CHANGE_TO_TL1
CHANGE_R26559:
	add	%r26,	%r27,	%r26
NC_BIS_NUC559:
	.word 0xd0b544fa  ! 1693: STHA_R	stha	%r8, [%r21 + %r26] 0x27
	.word 0xc79b111a  ! 1694: LDDFA_R	ldda	[%r12, %r26], %f3
	.word 0xc723401a  ! 1695: STF_R	st	%f3, [%r26, %r13]
CP_BIS_AIUP560:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 1697: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xc6ccd13a  ! 1699: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
	.word 0xc79a901a  ! 1700: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc4bbd11a  ! 1702: STDA_R	stda	%r2, [%r15 + %r26] 0x88
	.word 0xc73ae010  ! 1703: STDF_I	std	%f3, [0x0010, %r11]
	.word 0xc693d11a  ! 1705: LDUHA_R	lduha	[%r15, %r26] 0x88, %r3
	.word 0xc49c501a  ! 1707: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
NC_BLK_SEc561:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1709: STDFA_R	stda	%f16, [%r26, %r19]
CP_NUC562:
	.word 0xc49d019a  ! 1711: LDDA_R	ldda	[%r20, %r26] 0x0c, %r2
NC_SHORT_FP_SEC563:
	.word 0xc7bcda7a  ! 1713: STDFA_R	stda	%f3, [%r26, %r19]
NC_NUC564:
	.word 0xc695409a  ! 1715: LDUHA_R	lduha	[%r21, %r26] 0x04, %r3
	.word 0xc6ac903a  ! 1717: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc73aa010  ! 1718: STDF_I	std	%f3, [0x0010, %r10]
NC_NUC565:
	.word 0xc7a5419a  ! 1720: STFA_R	sta	%f3, [%r26, %r21]
	.word 0xc6f3111a  ! 1721: STXA_R	stxa	%r3, [%r12 + %r26] 0x88
	.word 0xc694d03a  ! 1723: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
CP_BIS_NUC566:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 1725: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
CP_AIUP567:
	.word 0xc786021a  ! 1727: LDFA_R	lda	[%r24, %r26], %f3
	.word 0xc6dc903a  ! 1729: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
	.word 0xc79cd13a  ! 1731: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc6ab901a  ! 1733: STBA_R	stba	%r3, [%r14 + %r26] 0x80
	.word 0xc6b4d13a  ! 1735: STHA_R	stha	%r3, [%r19 + %r26] 0x89
NC_AIUS568:
	.word 0xc6a7c23a  ! 1737: STWA_R	stwa	%r3, [%r31 + %r26] 0x11
CP_ATM_QUAD_LD569:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1739: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc41b6010  ! 1740: LDD_I	ldd	[%r13 + 0x0010], %r2
NC_NUC570:
	.word 0xc6ad419a  ! 1742: STBA_R	stba	%r3, [%r21 + %r26] 0x0c
SHORT_FP_PRI571:
	.word 0xc7ba9a1a  ! 1744: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc7bc903a  ! 1746: STDFA_R	stda	%f3, [%r26, %r18]
	.word 0xc652a012  ! 1747: LDSH_I	ldsh	[%r10 + 0x0012], %r3
	.word 0xc683901a  ! 1749: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r3
	.word 0xc6f4903a  ! 1751: STXA_R	stxa	%r3, [%r18 + %r26] 0x81
	.word 0xc6d3901a  ! 1753: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
CP_AIUS572:
	.word 0xc687833a  ! 1755: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r3
	.word 0xc6c4d13a  ! 1757: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
	.word 0xc67b6010  ! 1758: SWAP_I	swap	%r3, [%r13 + 0x0010]
NC_BLK_SEc573:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1760: LDDFA_R	ldda	[%r19, %r26], %f16
SHORT_FP_PRI574:
	.word 0xc79ada1a  ! 1762: LDDFA_R	ldda	[%r11, %r26], %f3
CP_BIS_QUAD_LD575:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1764: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc7a4903a  ! 1766: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc6d3501a  ! 1767: LDSHA_R	ldsha	[%r13, %r26] 0x80, %r3
	.word 0xc68b111a  ! 1768: LDUBA_R	lduba	[%r12, %r26] 0x88, %r3
SET_TL0_576:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI577:
	and	%r26,	%r28,	%r26
	.word 0xc8f35d5a  ! 1770: STXA_R	stxa	%r4, [%r13 + %r26] 0xea
	.word 0xc782905a  ! 1771: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc7a2d01a  ! 1772: STFA_R	sta	%f3, [%r26, %r11]
SET_TL1_578:
	ta	T_CHANGE_TO_TL1
CHANGE_R26579:
	add	%r26,	%r27,	%r26
NC_BIS_NUC579:
	.word 0xc8f544fa  ! 1774: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
	.word 0xc7a3511a  ! 1775: STFA_R	sta	%f3, [%r26, %r13]
	.word 0xc79bd01a  ! 1777: LDDFA_R	ldda	[%r15, %r26], %f3
	.word 0xc4bc511a  ! 1779: STDA_R	stda	%r2, [%r17 + %r26] 0x88
NC_BIS_AIUS580:
	.word 0xc8afc47a  ! 1781: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CP_BIS_AIUP581:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 1783: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
	.word 0xc49b901a  ! 1785: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
SET_TL0_582:
	ta	T_CHANGE_TO_TL0
CHANGE_R26583:
	add	%r26,	%r27,	%r26
NC_BIS_SEC583:
	.word 0xc8acdc7a  ! 1787: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
NC_BIS_SEC584:
	.word 0xc4b4dc7a  ! 1789: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV585:
	ta	T_CHANGE_PRIV
CHANGE_R26586:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP586:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1791: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
CP_BIS_AIUP587:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 1793: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
CP_PST_PRI588:
	.word 0xc7bad95a  ! 1795: STDFA_R	stda	%f3, [%r26, %r11]
NC_AIUS589:
	.word 0xc68fc23a  ! 1797: LDUBA_R	lduba	[%r31, %r26] 0x11, %r3
CP_NUC590:
	.word 0xc6cd009a  ! 1799: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r3
NC_NUC591:
	.word 0xc4bd409a  ! 1801: STDA_R	stda	%r2, [%r21 + %r26] 0x04
	.word 0xc7bc913a  ! 1803: STDFA_R	stda	%f3, [%r26, %r18]
	.word 0xc6c4903a  ! 1805: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r3
	.word 0xc702a010  ! 1806: LDF_I	ld	[%r10, 0x0010], %f3
	.word 0xc6a4d13a  ! 1808: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
CP_PST_PRI592:
	.word 0xc7ba981a  ! 1810: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6ac903a  ! 1812: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc7a4d03a  ! 1814: STFA_R	sta	%f3, [%r26, %r19]
CP_AIUP593:
	.word 0xc6d6021a  ! 1816: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r3
NC_NUC594:
	.word 0xc685409a  ! 1818: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r3
NC_BIS_AIUP595:
	.word 0xc8f6455a  ! 1820: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
	.word 0xc722c01a  ! 1821: STF_R	st	%f3, [%r26, %r11]
CHANGE_USER596:
	ta	T_CHANGE_NONPRIV
CHANGE_R26597:
	add	%r26,	%r27,	%r26
NC_BIS_PRI597:
	.word 0xc4bbdd5a  ! 1823: STDA_R	stda	%r2, [%r15 + %r26] 0xea
	.word 0xc6ac903a  ! 1825: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc6d4d03a  ! 1827: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
CP_PST_PRI598:
	.word 0xc7bb581a  ! 1829: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc7bc903a  ! 1831: STDFA_R	stda	%f3, [%r26, %r18]
SET_TL1_599:
	ta	T_CHANGE_TO_TL1
CHANGE_R26600:
	add	%r26,	%r27,	%r26
NC_BIS_NUC600:
	.word 0xc4b545fa  ! 1833: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
NC_BLK_SEc601:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1835: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc6cbd01a  ! 1837: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r3
CP_BIS_AIUS602:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 1839: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
NC_AIUP603:
	.word 0xc6d6431a  ! 1841: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r3
	.word 0xc6db501a  ! 1842: LDXA_R	ldxa	[%r13, %r26] 0x80, %r3
	.word 0xc6ac903a  ! 1844: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc6cc501a  ! 1846: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r3
	.word 0xc6436010  ! 1847: LDSW_I	ldsw	[%r13 + 0x0010], %r3
NC_BIS_AIUS604:
	.word 0xc4f7c47a  ! 1849: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUS605:
	.word 0xc8f7c47a  ! 1851: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
NC_NUC606:
	.word 0xc4bd419a  ! 1853: STDA_R	stda	%r2, [%r21 + %r26] 0x0c
NC_PST_PRI607:
	.word 0xc7bc181a  ! 1855: STDFA_R	stda	%f3, [%r26, %r16]
BLK_PRI608:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 1857: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc784d03a  ! 1859: LDFA_R	lda	[%r19, %r26], %f3
	.word 0xc6c4501a  ! 1861: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r3
NC_NUC609:
	.word 0xc6d5419a  ! 1863: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r3
CP_AIUS610:
	.word 0xc6f7823a  ! 1865: STXA_R	stxa	%r3, [%r30 + %r26] 0x11
SET_TL0_611:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI612:
	.word 0xc4ab9d5a  ! 1867: STBA_R	stba	%r2, [%r14 + %r26] 0xea
	.word 0xc68c501a  ! 1869: LDUBA_R	lduba	[%r17, %r26] 0x80, %r3
SET_TL1_613:
	ta	T_CHANGE_TO_TL1
CHANGE_R26614:
	add	%r26,	%r27,	%r26
NC_BIS_NUC614:
	.word 0xccad44fa  ! 1871: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xc6f4501a  ! 1873: STXA_R	stxa	%r3, [%r17 + %r26] 0x80
SET_TL0_615:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI616:
	.word 0xccac1d5a  ! 1875: STBA_R	stba	%r6, [%r16 + %r26] 0xea
NC_BIS_SEC617:
	.word 0xc8a4dc7a  ! 1877: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xc633001a  ! 1878: STH_R	sth	%r3, [%r12 + %r26]
WR_LEASI_618:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_619:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC621:
	.word 0xc6c5409a  ! 1881: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r3
CP_BIS_AIUP622:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 1883: STHA_R	stha	%r6, [%r24 + %r26] 0x22
	.word 0xc6ab901a  ! 1885: STBA_R	stba	%r3, [%r14 + %r26] 0x80
CHANGE_USER623:
	ta	T_CHANGE_NONPRIV
CHANGE_R26624:
	add	%r26,	%r27,	%r26
CP_BIS_PRI624:
	and	%r26,	%r28,	%r26
	.word 0xd0a31c5a  ! 1887: STWA_R	stwa	%r8, [%r12 + %r26] 0xe2
	.word 0xc783501a  ! 1888: LDFA_R	lda	[%r13, %r26], %f3
	.word 0xc7a4d03a  ! 1890: STFA_R	sta	%f3, [%r26, %r19]
	.word 0xc6dc903a  ! 1892: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
	.word 0xc79c913a  ! 1894: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc653001a  ! 1895: LDSH_R	ldsh	[%r12 + %r26], %r3
	.word 0xc782d01a  ! 1896: LDFA_R	lda	[%r11, %r26], %f3
NC_PST_PRI625:
	.word 0xc7bb985a  ! 1898: STDFA_R	stda	%f3, [%r26, %r14]
CHANGE_R26626:
	add	%r26,	%r27,	%r26
CP_BIS_SEC626:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 1900: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC628:
	.word 0xc785409a  ! 1902: LDFA_R	lda	[%r21, %r26], %f3
NC_PST_PRI629:
	.word 0xc7bbd81a  ! 1904: STDFA_R	stda	%f3, [%r26, %r15]
CP_AIUP630:
	.word 0xc686021a  ! 1906: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r3
BLK_PRI631:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 1908: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xc6f4d03a  ! 1910: STXA_R	stxa	%r3, [%r19 + %r26] 0x81
	.word 0xc784d03a  ! 1912: LDFA_R	lda	[%r19, %r26], %f3
	.word 0xc6c3d01a  ! 1914: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r3
BLK_PRI632:
	and	%r26,	%r29,	%r26
	.word 0xc1badf1a  ! 1916: STDFA_R	stda	%f0, [%r26, %r11]
CHANGE_USER633:
	ta	T_CHANGE_NONPRIV
CHANGE_R26634:
	add	%r26,	%r27,	%r26
NC_BIS_PRI634:
	.word 0xd0a45d5a  ! 1918: STWA_R	stwa	%r8, [%r17 + %r26] 0xea
CP_BIS_QUAD_LD635:
	and	%r26,	%r29,	%r26
	.word 0xd09b1c5a  ! 1920: LDDA_R	ldda	[%r12, %r26] 0xe2, %r8
NC_BIS_PRI636:
	.word 0xd0b39c5a  ! 1922: STHA_R	stha	%r8, [%r14 + %r26] 0xe2
	.word 0xc6dc903a  ! 1924: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
NC_PST_PRI637:
	.word 0xc7bb981a  ! 1926: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc79a911a  ! 1927: LDDFA_R	ldda	[%r10, %r26], %f3
NC_BIS_SEC638:
	.word 0xc4f4dc7a  ! 1929: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS640:
	.word 0xc6a7823a  ! 1931: STWA_R	stwa	%r3, [%r30 + %r26] 0x11
	.word 0xc7bcd03a  ! 1933: STDFA_R	stda	%f3, [%r26, %r19]
CHANGE_R26641:
	add	%r26,	%r27,	%r26
CP_BIS_SEC641:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 1935: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
	.word 0xc6c3d01a  ! 1937: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r3
	.word 0xc49c913a  ! 1939: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc703401a  ! 1940: LDF_R	ld	[%r13, %r26], %f3
CHANGE_USER642:
	ta	T_CHANGE_NONPRIV
CHANGE_R26643:
	add	%r26,	%r27,	%r26
NC_BIS_PRI643:
	.word 0xc8bb9d5a  ! 1942: STDA_R	stda	%r4, [%r14 + %r26] 0xea
CP_BIS_PRI644:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 1944: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	.word 0xc7bcd03a  ! 1946: STDFA_R	stda	%f3, [%r26, %r19]
NC_BIS_PRI645:
	.word 0xccb39c5a  ! 1948: STHA_R	stha	%r6, [%r14 + %r26] 0xe2
NC_BIS_PRI646:
	.word 0xccbc1c5a  ! 1950: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
NC_BIS_PRI647:
	.word 0xc8bb9d5a  ! 1952: STDA_R	stda	%r4, [%r14 + %r26] 0xea
CP_PST_PRI648:
	.word 0xc7bad81a  ! 1954: STDFA_R	stda	%f3, [%r26, %r11]
NC_BLK_SEc649:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1956: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_PRIV650:
	ta	T_CHANGE_PRIV
CHANGE_R26651:
	mov	%g0,	%r26
CP_ATM_QUAD_LD651:
	and	%r26,	%r29,	%r26
	.word 0xd09b459a  ! 1958: LDDA_R	ldda	[%r13, %r26] 0x2c, %r8
	.word 0xc7a4903a  ! 1960: STFA_R	sta	%f3, [%r26, %r18]
CP_BIS_QUAD_LD652:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1962: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc694101a  ! 1964: LDUHA_R	lduha	[%r16, %r26] 0x80, %r3
	.word 0xc784903a  ! 1966: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc6d4913a  ! 1968: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r3
NC_BLK_SEc653:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1970: STDFA_R	stda	%f16, [%r26, %r19]
CHANGE_R26654:
	add	%r26,	%r27,	%r26
CP_BIS_SEC654:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 1972: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
CP_AIUS655:
	.word 0xc4bf823a  ! 1974: STDA_R	stda	%r2, [%r30 + %r26] 0x11
NC_BIS_SEC656:
	.word 0xc4b4dd7a  ! 1976: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
NC_NUC657:
	.word 0xc6b5409a  ! 1978: STHA_R	stha	%r3, [%r21 + %r26] 0x04
	.word 0xc782901a  ! 1979: LDFA_R	lda	[%r10, %r26], %f3
CP_AIUP658:
	.word 0xc6de021a  ! 1981: LDXA_R	ldxa	[%r24, %r26] 0x10, %r3
	.word 0xc6dcd03a  ! 1983: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
	.word 0xc6f4501a  ! 1985: STXA_R	stxa	%r3, [%r17 + %r26] 0x80
CP_BIS_QUAD_LD659:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 1987: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
NC_NUC660:
	.word 0xc6c5409a  ! 1989: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r3
	.word 0xc79ad01a  ! 1990: LDDFA_R	ldda	[%r11, %r26], %f3
SHORT_FP_PRI661:
	.word 0xc7badb5a  ! 1992: STDFA_R	stda	%f3, [%r26, %r11]
CHANGE_CLE662:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS664:
	.word 0xc697c33a  ! 1995: LDUHA_R	lduha	[%r31, %r26] 0x19, %r3
	.word 0xc62b2013  ! 1996: STB_I	stb	%r3, [%r12 + 0x0013]
	.word 0xc6ab901a  ! 1998: STBA_R	stba	%r3, [%r14 + %r26] 0x80
NC_BIS_AIUP665:
	.word 0xc4be455a  ! 2000: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
	.word 0xc7bb501a  ! 2001: STDFA_R	stda	%f3, [%r26, %r13]
CHANGE_USER666:
	ta	T_CHANGE_NONPRIV
CHANGE_R26667:
	add	%r26,	%r27,	%r26
CP_BIS_PRI667:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 2003: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV668:
	ta	T_CHANGE_PRIV
CHANGE_R26669:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP669:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 2005: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
NC_AIUS670:
	.word 0xc787c23a  ! 2007: LDFA_R	lda	[%r31, %r26], %f3
	.word 0xc703001a  ! 2008: LDF_R	ld	[%r12, %r26], %f3
	.word 0xc4bcd13a  ! 2010: STDA_R	stda	%r2, [%r19 + %r26] 0x89
NC_BIS_AIUP671:
	.word 0xd0a6445a  ! 2012: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xc79ad11a  ! 2013: LDDFA_R	ldda	[%r11, %r26], %f3
CP_BIS_QUAD_LD672:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 2015: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
	.word 0xc784903a  ! 2017: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc6c4d13a  ! 2019: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r3
BLK_PRI673:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 2021: LDDFA_R	ldda	[%r11, %r26], %f16
	.word 0xc68cd03a  ! 2023: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
NC_BIS_AIUS674:
	.word 0xd0bfc47a  ! 2025: STDA_R	stda	%r8, [%r31 + %r26] 0x23
CP_ATM_QUAD_LD675:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2027: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc6d4d13a  ! 2029: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r3
NC_PST_PRI676:
	.word 0xc7bb999a  ! 2031: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6a4903a  ! 2033: STWA_R	stwa	%r3, [%r18 + %r26] 0x81
CP_BIS_NUC677:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 2035: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
NC_NUC678:
	.word 0xc4bd409a  ! 2037: STDA_R	stda	%r2, [%r21 + %r26] 0x04
CP_PST_PRI679:
	.word 0xc7bad85a  ! 2039: STDFA_R	stda	%f3, [%r26, %r11]
NC_BIS_AIUP680:
	.word 0xc4be445a  ! 2041: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_NUC681:
	.word 0xc49d409a  ! 2043: LDDA_R	ldda	[%r21, %r26] 0x04, %r2
	.word 0xc7bb511a  ! 2044: STDFA_R	stda	%f3, [%r26, %r13]
CP_AIUS682:
	.word 0xc7a7833a  ! 2046: STFA_R	sta	%f3, [%r26, %r30]
	.word 0xc6d4d03a  ! 2048: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
CP_AIUP683:
	.word 0xc686021a  ! 2050: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r3
	.word 0xc6dad15a  ! 2051: LDXA_R	ldxa	[%r11, %r26] 0x8a, %r3
	.word 0xc6d3901a  ! 2053: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
CP_BIS_AIUP684:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2055: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xc65b6010  ! 2056: LDX_I	ldx	[%r13 + 0x0010], %r3
CHANGE_USER685:
	ta	T_CHANGE_NONPRIV
CHANGE_R26686:
	add	%r26,	%r27,	%r26
CP_BIS_PRI686:
	and	%r26,	%r28,	%r26
	.word 0xd0a29d5a  ! 2058: STWA_R	stwa	%r8, [%r10 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS688:
	.word 0xc6af823a  ! 2060: STBA_R	stba	%r3, [%r30 + %r26] 0x11
BLK_PRI689:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2062: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc7bc913a  ! 2064: STDFA_R	stda	%f3, [%r26, %r18]
	.word 0xc4bcd13a  ! 2066: STDA_R	stda	%r2, [%r19 + %r26] 0x89
	.word 0xc68b901a  ! 2068: LDUBA_R	lduba	[%r14, %r26] 0x80, %r3
	.word 0xc6f4913a  ! 2070: STXA_R	stxa	%r3, [%r18 + %r26] 0x89
	.word 0xc6f4d13a  ! 2072: STXA_R	stxa	%r3, [%r19 + %r26] 0x89
	.word 0xc68cd13a  ! 2074: LDUBA_R	lduba	[%r19, %r26] 0x89, %r3
	.word 0xc652a012  ! 2075: LDSH_I	ldsh	[%r10 + 0x0012], %r3
	.word 0xc602c01a  ! 2076: LDUW_R	lduw	[%r11 + %r26], %r3
	.word 0xc7bb501a  ! 2077: STDFA_R	stda	%f3, [%r26, %r13]
CP_BIS_QUAD_LD690:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2079: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_SEC691:
	.word 0xd0b4dc7a  ! 2081: STHA_R	stha	%r8, [%r19 + %r26] 0xe3
	.word 0xc694111a  ! 2083: LDUHA_R	lduha	[%r16, %r26] 0x88, %r3
	.word 0xc6fad01a  ! 2084: SWAPA_R	swapa	%r3, [%r11 + %r26] 0x80
NC_NUC692:
	.word 0xc6c5409a  ! 2086: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r3
	.word 0xc6536012  ! 2087: LDSH_I	ldsh	[%r13 + 0x0012], %r3
	.word 0xc79c903a  ! 2089: LDDFA_R	ldda	[%r18, %r26], %f3
CP_PST_PRI693:
	.word 0xc7bad85a  ! 2091: STDFA_R	stda	%f3, [%r26, %r11]
	.word 0xc622801a  ! 2092: STW_R	stw	%r3, [%r10 + %r26]
CP_AIUS694:
	.word 0xc697833a  ! 2094: LDUHA_R	lduha	[%r30, %r26] 0x19, %r3
	.word 0xc6da915a  ! 2095: LDXA_R	ldxa	[%r10, %r26] 0x8a, %r3
	.word 0xc6a4d13a  ! 2097: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
	.word 0xc73ae010  ! 2098: STDF_I	std	%f3, [0x0010, %r11]
CP_NUC695:
	.word 0xc49d009a  ! 2100: LDDA_R	ldda	[%r20, %r26] 0x04, %r2
	.word 0xc64a801a  ! 2101: LDSB_R	ldsb	[%r10 + %r26], %r3
SHORT_FP_PRI696:
	.word 0xc7bb1b1a  ! 2103: STDFA_R	stda	%f3, [%r26, %r12]
CP_AIUS697:
	.word 0xc68f823a  ! 2105: LDUBA_R	lduba	[%r30, %r26] 0x11, %r3
WR_LEASI_698:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_699:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc784913a  ! 2108: LDFA_R	lda	[%r18, %r26], %f3
NC_BIS_AIUS700:
	.word 0xc4f7c47a  ! 2110: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
	.word 0xc784913a  ! 2112: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc6fa901a  ! 2113: SWAPA_R	swapa	%r3, [%r10 + %r26] 0x80
NC_PST_PRI701:
	.word 0xc7bb991a  ! 2115: STDFA_R	stda	%f3, [%r26, %r14]
BLK_PRI702:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 2117: STDFA_R	stda	%f0, [%r26, %r11]
NC_BIS_SEC703:
	.word 0xcca4dd7a  ! 2119: STWA_R	stwa	%r6, [%r19 + %r26] 0xeb
NC_BLK_SEc704:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2121: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc4bb101a  ! 2122: STDA_R	stda	%r2, [%r12 + %r26] 0x80
	.word 0xc73a801a  ! 2123: STDF_R	std	%f3, [%r26, %r10]
	.word 0xc694913a  ! 2125: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
NC_SHORT_FP_SEC705:
	.word 0xc79cda3a  ! 2127: LDDFA_R	ldda	[%r19, %r26], %f3
NC_BLK_SEc706:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2129: LDDFA_R	ldda	[%r19, %r26], %f16
CP_NUC707:
	.word 0xc49d009a  ! 2131: LDDA_R	ldda	[%r20, %r26] 0x04, %r2
CP_BIS_AIUS708:
	and	%r26,	%r28,	%r26
	.word 0xc4f7847a  ! 2133: STXA_R	stxa	%r2, [%r30 + %r26] 0x23
	.word 0xc68c913a  ! 2135: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
NC_BLK_SEc709:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2137: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_CLE710:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc7a4903a  ! 2140: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc79cd03a  ! 2142: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc79c903a  ! 2144: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc73aa010  ! 2145: STDF_I	std	%f3, [0x0010, %r10]
	.word 0xc6d4511a  ! 2147: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r3
	.word 0xc694903a  ! 2149: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
CP_BIS_QUAD_LD711:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 2151: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xc7236010  ! 2152: STF_I	st	%f3, [0x0010, %r13]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP713:
	.word 0xc6ae421a  ! 2154: STBA_R	stba	%r3, [%r25 + %r26] 0x10
CHANGE_R26714:
	mov	%g0,	%r26
CP_BIS_SEC714:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 2156: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
CP_ATM_QUAD_LD715:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2158: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xc4bb111a  ! 2159: STDA_R	stda	%r2, [%r12 + %r26] 0x88
CP_NUC716:
	.word 0xc79d019a  ! 2161: LDDFA_R	ldda	[%r20, %r26], %f3
	.word 0xc6f2901a  ! 2162: STXA_R	stxa	%r3, [%r10 + %r26] 0x80
	.word 0xc66b401a  ! 2163: LDSTUB_R	ldstub	%r3, [%r13 + %r26]
CP_AIUS717:
	.word 0xc6c7833a  ! 2165: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r3
	.word 0xc6db511a  ! 2166: LDXA_R	ldxa	[%r13, %r26] 0x88, %r3
	.word 0xc7a3501a  ! 2167: STFA_R	sta	%f3, [%r26, %r13]
	.word 0xc6b4d03a  ! 2169: STHA_R	stha	%r3, [%r19 + %r26] 0x81
CHANGE_USER718:
	ta	T_CHANGE_NONPRIV
CHANGE_R26719:
	add	%r26,	%r27,	%r26
NC_BIS_PRI719:
	.word 0xd0ab9c5a  ! 2171: STBA_R	stba	%r8, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD720:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 2173: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xc7e3601a  ! 2174: CASA_R	casa	[%r13] %asi, %r26, %r3
	.word 0xc6332012  ! 2175: STH_I	sth	%r3, [%r12 + 0x0012]
	.word 0xc68a911a  ! 2176: LDUBA_R	lduba	[%r10, %r26] 0x88, %r3
CP_PST_PRI721:
	.word 0xc7bb189a  ! 2178: STDFA_R	stda	%f3, [%r26, %r12]
	.word 0xc79ad05a  ! 2179: LDDFA_R	ldda	[%r11, %r26], %f3
	.word 0xc6dcd13a  ! 2181: LDXA_R	ldxa	[%r19, %r26] 0x89, %r3
	.word 0xc43ae010  ! 2182: STD_I	std	%r2, [%r11 + 0x0010]
CHANGE_R26722:
	add	%r26,	%r27,	%r26
CP_BIS_SEC722:
	and	%r26,	%r28,	%r26
	.word 0xd0b49d7a  ! 2184: STHA_R	stha	%r8, [%r18 + %r26] 0xeb
CHANGE_TLE723:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc49b901a  ! 2187: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc6b4903a  ! 2189: STHA_R	stha	%r3, [%r18 + %r26] 0x81
WR_LEASI_724:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_725:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc7a4913a  ! 2192: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc7a2901a  ! 2193: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc6dc913a  ! 2195: LDXA_R	ldxa	[%r18, %r26] 0x89, %r3
SET_TL1_726:
	ta	T_CHANGE_TO_TL1
CHANGE_R26727:
	add	%r26,	%r27,	%r26
NC_BIS_NUC727:
	.word 0xccb544fa  ! 2197: STHA_R	stha	%r6, [%r21 + %r26] 0x27
CP_PST_PRI728:
	.word 0xc7bad95a  ! 2199: STDFA_R	stda	%f3, [%r26, %r11]
CHANGE_R26729:
	add	%r26,	%r27,	%r26
CP_BIS_SEC729:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 2201: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xc4bb511a  ! 2202: STDA_R	stda	%r2, [%r13 + %r26] 0x88
	.word 0xc4bcd03a  ! 2204: STDA_R	stda	%r2, [%r19 + %r26] 0x81
NC_BIS_AIUP730:
	.word 0xc8ae445a  ! 2206: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xc43b401a  ! 2207: STD_R	std	%r2, [%r13 + %r26]
CP_PST_PRI731:
	.word 0xc7ba989a  ! 2209: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6acd03a  ! 2211: STBA_R	stba	%r3, [%r19 + %r26] 0x81
	.word 0xc6cc903a  ! 2213: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
NC_BIS_AIUS732:
	.word 0xc4afc57a  ! 2215: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
NC_NUC733:
	.word 0xc6f5409a  ! 2217: STXA_R	stxa	%r3, [%r21 + %r26] 0x04
	.word 0xc49c913a  ! 2219: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc6ea901a  ! 2220: LDSTUBA_R	ldstuba	%r3, [%r10 + %r26] 0x80
	.word 0xc6dcd03a  ! 2222: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
	.word 0xc66b401a  ! 2223: LDSTUB_R	ldstub	%r3, [%r13 + %r26]
CP_AIUS734:
	.word 0xc6a7823a  ! 2225: STWA_R	stwa	%r3, [%r30 + %r26] 0x11
	.word 0xc6f3901a  ! 2227: STXA_R	stxa	%r3, [%r14 + %r26] 0x80
	.word 0xc7f3201a  ! 2228: CASXA_R	casxa	[%r12]%asi, %r26, %r3
	.word 0xc6b4d03a  ! 2230: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc6a4d03a  ! 2232: STWA_R	stwa	%r3, [%r19 + %r26] 0x81
	.word 0xc7bb101a  ! 2234: STDFA_R	stda	%f3, [%r26, %r12]
BLK_PRI735:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 2236: LDDFA_R	ldda	[%r10, %r26], %f16
CP_ATM_QUAD_LD736:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2238: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_ATM_QUAD_LD737:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 2240: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
NC_BIS_AIUS738:
	.word 0xd0f7c57a  ! 2242: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
	.word 0xc60ac01a  ! 2243: LDUB_R	ldub	[%r11 + %r26], %r3
NC_BIS_AIUS739:
	.word 0xccafc47a  ! 2245: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xc6f3111a  ! 2246: STXA_R	stxa	%r3, [%r12 + %r26] 0x88
CP_BIS_AIUS740:
	and	%r26,	%r28,	%r26
	.word 0xc4af857a  ! 2248: STBA_R	stba	%r2, [%r30 + %r26] 0x2b
CP_PST_PRI741:
	.word 0xc7bb589a  ! 2250: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc6d4d03a  ! 2252: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
	.word 0xc6fa901a  ! 2253: SWAPA_R	swapa	%r3, [%r10 + %r26] 0x80
	.word 0xc66ae013  ! 2254: LDSTUB_I	ldstub	%r3, [%r11 + 0x0013]
CP_ATM_QUAD_LD742:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2256: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc62aa013  ! 2257: STB_I	stb	%r3, [%r10 + 0x0013]
	.word 0xc694903a  ! 2259: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
	.word 0xc6acd03a  ! 2261: STBA_R	stba	%r3, [%r19 + %r26] 0x81
NC_PST_PRI743:
	.word 0xc7bb999a  ! 2263: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6b2901a  ! 2264: STHA_R	stha	%r3, [%r10 + %r26] 0x80
	.word 0xc7bcd13a  ! 2266: STDFA_R	stda	%f3, [%r26, %r19]
SET_TL0_744:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI745:
	.word 0xd0b39c5a  ! 2268: STHA_R	stha	%r8, [%r14 + %r26] 0xe2
	.word 0xc49c501a  ! 2270: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
	.word 0xc7a4903a  ! 2272: STFA_R	sta	%f3, [%r26, %r18]
CHANGE_PRIV746:
	ta	T_CHANGE_PRIV
CHANGE_R26747:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP747:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2274: STHA_R	stha	%r6, [%r24 + %r26] 0x22
NC_BIS_SEC748:
	.word 0xcca4dc7a  ! 2276: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
CHANGE_USER749:
	ta	T_CHANGE_NONPRIV
CHANGE_R26750:
	add	%r26,	%r27,	%r26
CP_BIS_PRI750:
	and	%r26,	%r28,	%r26
	.word 0xd0f2dd5a  ! 2278: STXA_R	stxa	%r8, [%r11 + %r26] 0xea
CP_BIS_QUAD_LD751:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2280: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc694d13a  ! 2282: LDUHA_R	lduha	[%r19, %r26] 0x89, %r3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC753:
	.word 0xc6a5009a  ! 2284: STWA_R	stwa	%r3, [%r20 + %r26] 0x04
NC_AIUS754:
	.word 0xc6afc33a  ! 2286: STBA_R	stba	%r3, [%r31 + %r26] 0x19
NC_NUC755:
	.word 0xc6ad409a  ! 2288: STBA_R	stba	%r3, [%r21 + %r26] 0x04
	.word 0xc71ac01a  ! 2289: LDDF_R	ldd	[%r11, %r26], %f3
	.word 0xc79c903a  ! 2291: LDDFA_R	ldda	[%r18, %r26], %f3
	.word 0xc7bc903a  ! 2293: STDFA_R	stda	%f3, [%r26, %r18]
CP_BIS_QUAD_LD756:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2295: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
SET_TL1_757:
	ta	T_CHANGE_TO_TL1
CHANGE_R26758:
	mov	%g0,	%r26
NC_BIS_NUC758:
	.word 0xc4f545fa  ! 2297: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
CP_BIS_NUC759:
	and	%r26,	%r28,	%r26
	.word 0xccb505fa  ! 2299: STHA_R	stha	%r6, [%r20 + %r26] 0x2f
	.word 0xc6acd03a  ! 2301: STBA_R	stba	%r3, [%r19 + %r26] 0x81
NC_AIUS760:
	.word 0xc4bfc33a  ! 2303: STDA_R	stda	%r2, [%r31 + %r26] 0x19
CP_BIS_QUAD_LD761:
	and	%r26,	%r29,	%r26
	.word 0xc89b1d5a  ! 2305: LDDA_R	ldda	[%r12, %r26] 0xea, %r4
	.word 0xc722801a  ! 2306: STF_R	st	%f3, [%r26, %r10]
SET_TL0_762:
	ta	T_CHANGE_TO_TL0
WR_LEASI_763:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_764:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SHORT_FP_PRI765:
	.word 0xc7bb5a1a  ! 2309: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc6b4903a  ! 2311: STHA_R	stha	%r3, [%r18 + %r26] 0x81
SET_TL1_766:
	ta	T_CHANGE_TO_TL1
CHANGE_R26767:
	add	%r26,	%r27,	%r26
NC_BIS_NUC767:
	.word 0xc4a545fa  ! 2313: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc4bcd03a  ! 2315: STDA_R	stda	%r2, [%r19 + %r26] 0x81
CP_PST_PRI768:
	.word 0xc7ba985a  ! 2317: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc7e2e01a  ! 2318: CASA_R	casa	[%r11] %asi, %r26, %r3
CP_PST_PRI769:
	.word 0xc7bb185a  ! 2320: STDFA_R	stda	%f3, [%r26, %r12]
CP_NUC770:
	.word 0xc6f5009a  ! 2322: STXA_R	stxa	%r3, [%r20 + %r26] 0x04
SET_TL0_771:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI772:
	.word 0xc8f3dd5a  ! 2324: STXA_R	stxa	%r4, [%r15 + %r26] 0xea
CP_PST_PRI773:
	.word 0xc7ba985a  ! 2326: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc684511a  ! 2328: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r3
	.word 0xc49c111a  ! 2330: LDDA_R	ldda	[%r16, %r26] 0x88, %r2
	.word 0xc7a4d03a  ! 2332: STFA_R	sta	%f3, [%r26, %r19]
NC_SHORT_FP_SEC774:
	.word 0xc7bcdb7a  ! 2334: STDFA_R	stda	%f3, [%r26, %r19]
CHANGE_PRIV775:
	ta	T_CHANGE_PRIV
CHANGE_R26776:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD776:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2336: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc79b515a  ! 2337: LDDFA_R	ldda	[%r13, %r26], %f3
	.word 0xc6f4903a  ! 2339: STXA_R	stxa	%r3, [%r18 + %r26] 0x81
	.word 0xc683d11a  ! 2341: LDUWA_R	lduwa	[%r15, %r26] 0x88, %r3
CP_NUC777:
	.word 0xc6d5019a  ! 2343: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r3
SHORT_FP_PRI778:
	.word 0xc79a9a1a  ! 2345: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc67a801a  ! 2346: SWAP_R	swap	%r3, [%r10 + %r26]
WR_LEASI_779:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_780:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP781:
	.word 0xc696421a  ! 2349: LDUHA_R	lduha	[%r25, %r26] 0x10, %r3
	.word 0xc67b6010  ! 2350: SWAP_I	swap	%r3, [%r13 + 0x0010]
SET_TL1_782:
	ta	T_CHANGE_TO_TL1
CHANGE_R26783:
	add	%r26,	%r27,	%r26
NC_BIS_NUC783:
	.word 0xd0ad44fa  ! 2352: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xc79cd13a  ! 2354: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc6b3d11a  ! 2356: STHA_R	stha	%r3, [%r15 + %r26] 0x88
NC_BIS_AIUS784:
	.word 0xd0a7c57a  ! 2358: STWA_R	stwa	%r8, [%r31 + %r26] 0x2b
	.word 0xc6d4d13a  ! 2360: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r3
	.word 0xc6aa901a  ! 2361: STBA_R	stba	%r3, [%r10 + %r26] 0x80
CP_ATM_QUAD_LD785:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2363: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc684903a  ! 2365: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc6c4d03a  ! 2367: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r3
	.word 0xc71b001a  ! 2368: LDDF_R	ldd	[%r12, %r26], %f3
CP_AIUP786:
	.word 0xc6d6021a  ! 2370: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r3
NC_BIS_AIUP787:
	.word 0xd0a6455a  ! 2372: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
SHORT_FP_PRI788:
	.word 0xc79a9b1a  ! 2374: LDDFA_R	ldda	[%r10, %r26], %f3
CP_BIS_AIUP789:
	and	%r26,	%r28,	%r26
	.word 0xcca6055a  ! 2376: STWA_R	stwa	%r6, [%r24 + %r26] 0x2a
	.word 0xc7e3201a  ! 2377: CASA_R	casa	[%r12] %asi, %r26, %r3
CP_ATM_QUAD_LD790:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2379: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xc6c3911a  ! 2381: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r3
	.word 0xc6c3911a  ! 2383: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r3
SET_TL0_791:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI792:
	.word 0xd0b41c5a  ! 2385: STHA_R	stha	%r8, [%r16 + %r26] 0xe2
	.word 0xc73b001a  ! 2386: STDF_R	std	%f3, [%r26, %r12]
	.word 0xc67a801a  ! 2387: SWAP_R	swap	%r3, [%r10 + %r26]
NC_BIS_PRI793:
	.word 0xd0a39d5a  ! 2389: STWA_R	stwa	%r8, [%r14 + %r26] 0xea
NC_BIS_SEC794:
	.word 0xc4f4dc7a  ! 2391: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP796:
	.word 0xc686421a  ! 2393: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r3
	.word 0xc6fb111a  ! 2394: SWAPA_R	swapa	%r3, [%r12 + %r26] 0x88
	.word 0xc73ac01a  ! 2395: STDF_R	std	%f3, [%r26, %r11]
CP_BIS_NUC797:
	and	%r26,	%r28,	%r26
	.word 0xc8bd04fa  ! 2397: STDA_R	stda	%r4, [%r20 + %r26] 0x27
	.word 0xc62b2013  ! 2398: STB_I	stb	%r3, [%r12 + 0x0013]
	.word 0xc6b3911a  ! 2400: STHA_R	stha	%r3, [%r14 + %r26] 0x88
CP_AIUS798:
	.word 0xc6f7823a  ! 2402: STXA_R	stxa	%r3, [%r30 + %r26] 0x11
CP_BIS_AIUP799:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2404: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc6d2d15a  ! 2405: LDSHA_R	ldsha	[%r11, %r26] 0x8a, %r3
	.word 0xc6a4913a  ! 2407: STWA_R	stwa	%r3, [%r18 + %r26] 0x89
CP_BIS_AIUS800:
	and	%r26,	%r28,	%r26
	.word 0xc8bf857a  ! 2409: STDA_R	stda	%r4, [%r30 + %r26] 0x2b
SET_TL1_801:
	ta	T_CHANGE_TO_TL1
CHANGE_R26802:
	add	%r26,	%r27,	%r26
NC_BIS_NUC802:
	.word 0xc4f545fa  ! 2411: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
NC_BIS_AIUP803:
	.word 0xc8f6445a  ! 2413: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xc6db911a  ! 2415: LDXA_R	ldxa	[%r14, %r26] 0x88, %r3
NC_AIUS804:
	.word 0xc6cfc23a  ! 2417: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r3
	.word 0xc6c4d03a  ! 2419: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r3
	.word 0xc683515a  ! 2420: LDUWA_R	lduwa	[%r13, %r26] 0x8a, %r3
NC_BIS_NUC805:
	.word 0xc4b544fa  ! 2422: STHA_R	stha	%r2, [%r21 + %r26] 0x27
BLK_PRI806:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 2424: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xc684903a  ! 2426: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
NC_PST_PRI807:
	.word 0xc7bb981a  ! 2428: STDFA_R	stda	%f3, [%r26, %r14]
BLK_PRI808:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2430: STDFA_R	stda	%f0, [%r26, %r10]
NC_BIS_AIUS809:
	.word 0xc4afc57a  ! 2432: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xc6c4d03a  ! 2434: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r3
	.word 0xc68cd03a  ! 2436: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
	.word 0xc694913a  ! 2438: LDUHA_R	lduha	[%r18, %r26] 0x89, %r3
CHANGE_R26810:
	add	%r26,	%r27,	%r26
CP_BIS_SEC810:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 2440: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xc784101a  ! 2442: LDFA_R	lda	[%r16, %r26], %f3
CHANGE_R26811:
	add	%r26,	%r27,	%r26
CP_BIS_SEC811:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 2444: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
CP_AIUS812:
	.word 0xc6df823a  ! 2446: LDXA_R	ldxa	[%r30, %r26] 0x11, %r3
NC_BIS_AIUS813:
	.word 0xd0a7c47a  ! 2448: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
NC_AIUP814:
	.word 0xc696421a  ! 2450: LDUHA_R	lduha	[%r25, %r26] 0x10, %r3
	.word 0xc784903a  ! 2452: LDFA_R	lda	[%r18, %r26], %f3
	.word 0xc782915a  ! 2453: LDFA_R	lda	[%r10, %r26], %f3
CP_AIUP815:
	.word 0xc7a6031a  ! 2455: STFA_R	sta	%f3, [%r26, %r24]
	.word 0xc68cd13a  ! 2457: LDUBA_R	lduba	[%r19, %r26] 0x89, %r3
	.word 0xc6d3901a  ! 2459: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r3
	.word 0xc6dc903a  ! 2461: LDXA_R	ldxa	[%r18, %r26] 0x81, %r3
	.word 0xc6ccd13a  ! 2463: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
SHORT_FP_PRI816:
	.word 0xc79a9b5a  ! 2465: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc6a4903a  ! 2467: STWA_R	stwa	%r3, [%r18 + %r26] 0x81
CP_ATM_QUAD_LD817:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2469: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc79b901a  ! 2471: LDDFA_R	ldda	[%r14, %r26], %f3
SET_TL0_818:
	ta	T_CHANGE_TO_TL0
CHANGE_R26819:
	mov	%g0,	%r26
NC_BIS_SEC819:
	.word 0xc4f4dc7a  ! 2473: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV820:
	ta	T_CHANGE_PRIV
CHANGE_R26821:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS821:
	.word 0xc4f7c57a  ! 2475: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xc6ac903a  ! 2477: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc49c903a  ! 2479: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
SET_TL1_822:
	ta	T_CHANGE_TO_TL1
CHANGE_R26823:
	add	%r26,	%r27,	%r26
NC_BIS_NUC823:
	.word 0xc4b544fa  ! 2481: STHA_R	stha	%r2, [%r21 + %r26] 0x27
NC_AIUP824:
	.word 0xc68e421a  ! 2483: LDUBA_R	lduba	[%r25, %r26] 0x10, %r3
	.word 0xc4bcd03a  ! 2485: STDA_R	stda	%r2, [%r19 + %r26] 0x81
	.word 0xc6ca915a  ! 2486: LDSBA_R	ldsba	[%r10, %r26] 0x8a, %r3
BLK_PRI825:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 2488: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xc6f4d03a  ! 2490: STXA_R	stxa	%r3, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD826:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 2492: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
CP_NUC827:
	.word 0xc6ed019a  ! 2494: LDSTUBA_R	ldstuba	%r3, [%r20 + %r26] 0x0c
CP_AIUS828:
	.word 0xc6c7823a  ! 2496: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r3
CP_AIUP829:
	.word 0xc6a6021a  ! 2498: STWA_R	stwa	%r3, [%r24 + %r26] 0x10
	.word 0xc7bb901a  ! 2500: STDFA_R	stda	%f3, [%r26, %r14]
SET_TL0_830:
	ta	T_CHANGE_TO_TL0
WR_LEASI_831:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_832:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BLK_SEc833:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2503: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc694d03a  ! 2505: LDUHA_R	lduha	[%r19, %r26] 0x81, %r3
NC_PST_PRI834:
	.word 0xc7bbd89a  ! 2507: STDFA_R	stda	%f3, [%r26, %r15]
SHORT_FP_PRI835:
	.word 0xc79a9a5a  ! 2509: LDDFA_R	ldda	[%r10, %r26], %f3
NC_SHORT_FP_SEC836:
	.word 0xc79cda7a  ! 2511: LDDFA_R	ldda	[%r19, %r26], %f3
CP_BIS_PRI837:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 2513: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
	.word 0xc7bcd03a  ! 2515: STDFA_R	stda	%f3, [%r26, %r19]
	.word 0xc7f2e01a  ! 2516: CASXA_R	casxa	[%r11]%asi, %r26, %r3
CP_BIS_QUAD_LD838:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2518: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc7a2911a  ! 2519: STFA_R	sta	%f3, [%r26, %r10]
	.word 0xc71ac01a  ! 2520: LDDF_R	ldd	[%r11, %r26], %f3
	.word 0xc7a4d13a  ! 2522: STFA_R	sta	%f3, [%r26, %r19]
	.word 0xc672e010  ! 2523: STX_I	stx	%r3, [%r11 + 0x0010]
SET_TL1_839:
	ta	T_CHANGE_TO_TL1
CHANGE_R26840:
	add	%r26,	%r27,	%r26
NC_BIS_NUC840:
	.word 0xd0a544fa  ! 2525: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
NC_BLK_SEc841:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2527: STDFA_R	stda	%f0, [%r26, %r19]
CP_NUC842:
	.word 0xc695009a  ! 2529: LDUHA_R	lduha	[%r20, %r26] 0x04, %r3
CP_BIS_NUC843:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 2531: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
SET_TL0_844:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI845:
	and	%r26,	%r28,	%r26
	.word 0xc4ab5c5a  ! 2533: STBA_R	stba	%r2, [%r13 + %r26] 0xe2
CHANGE_PRIV846:
	ta	T_CHANGE_PRIV
CHANGE_R26847:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP847:
	.word 0xc8be455a  ! 2535: STDA_R	stda	%r4, [%r25 + %r26] 0x2a
NC_BIS_AIUS848:
	.word 0xc8bfc47a  ! 2537: STDA_R	stda	%r4, [%r31 + %r26] 0x23
SET_TL1_849:
	ta	T_CHANGE_TO_TL1
CHANGE_R26850:
	add	%r26,	%r27,	%r26
NC_BIS_NUC850:
	.word 0xc4a545fa  ! 2539: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
NC_SHORT_FP_SEC851:
	.word 0xc79cdb7a  ! 2541: LDDFA_R	ldda	[%r19, %r26], %f3
	.word 0xc612e012  ! 2542: LDUH_I	lduh	[%r11 + 0x0012], %r3
	.word 0xc6dcd03a  ! 2544: LDXA_R	ldxa	[%r19, %r26] 0x81, %r3
	.word 0xc7a4903a  ! 2546: STFA_R	sta	%f3, [%r26, %r18]
NC_AIUP852:
	.word 0xc6d6421a  ! 2548: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r3
	.word 0xc694903a  ! 2550: LDUHA_R	lduha	[%r18, %r26] 0x81, %r3
	.word 0xc783d01a  ! 2552: LDFA_R	lda	[%r15, %r26], %f3
SHORT_FP_PRI853:
	.word 0xc7ba9a5a  ! 2554: STDFA_R	stda	%f3, [%r26, %r10]
CP_AIUS854:
	.word 0xc6b7823a  ! 2556: STHA_R	stha	%r3, [%r30 + %r26] 0x11
	.word 0xc79c101a  ! 2558: LDDFA_R	ldda	[%r16, %r26], %f3
	.word 0xc49b901a  ! 2560: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
CP_BIS_NUC855:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 2562: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xc62b001a  ! 2563: STB_R	stb	%r3, [%r12 + %r26]
	.word 0xc7a2901a  ! 2564: STFA_R	sta	%f3, [%r26, %r10]
CP_BIS_AIUP856:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 2566: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
	.word 0xc784501a  ! 2568: LDFA_R	lda	[%r17, %r26], %f3
	.word 0xc6ccd03a  ! 2570: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
	.word 0xc784903a  ! 2572: LDFA_R	lda	[%r18, %r26], %f3
NC_BLK_SEc857:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2574: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc783115a  ! 2575: LDFA_R	lda	[%r12, %r26], %f3
NC_AIUS858:
	.word 0xc6cfc33a  ! 2577: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r3
BLK_PRI859:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 2579: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xc684101a  ! 2581: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r3
	.word 0xc67b2010  ! 2582: SWAP_I	swap	%r3, [%r12 + 0x0010]
SET_TL0_860:
	ta	T_CHANGE_TO_TL0
CHANGE_R26861:
	add	%r26,	%r27,	%r26
NC_BIS_SEC861:
	.word 0xc4f4dc7a  ! 2584: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP863:
	.word 0xc6b6421a  ! 2586: STHA_R	stha	%r3, [%r25 + %r26] 0x10
	.word 0xc71a801a  ! 2587: LDDF_R	ldd	[%r10, %r26], %f3
BLK_PRI864:
	and	%r26,	%r29,	%r26
	.word 0xe19b5f1a  ! 2589: LDDFA_R	ldda	[%r13, %r26], %f16
	.word 0xc49c903a  ! 2591: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc49b901a  ! 2593: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
SET_TL1_865:
	ta	T_CHANGE_TO_TL1
CHANGE_R26866:
	mov	%g0,	%r26
NC_BIS_NUC866:
	.word 0xc4b544fa  ! 2595: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc73ac01a  ! 2596: STDF_R	std	%f3, [%r26, %r11]
	.word 0xc722a010  ! 2597: STF_I	st	%f3, [0x0010, %r10]
CP_AIUS867:
	.word 0xc6f7823a  ! 2599: STXA_R	stxa	%r3, [%r30 + %r26] 0x11
	.word 0xc6cb515a  ! 2600: LDSBA_R	ldsba	[%r13, %r26] 0x8a, %r3
	.word 0xc73aa010  ! 2601: STDF_I	std	%f3, [0x0010, %r10]
	.word 0xc684501a  ! 2603: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r3
CP_NUC868:
	.word 0xc6ed009a  ! 2605: LDSTUBA_R	ldstuba	%r3, [%r20 + %r26] 0x04
SET_TL0_869:
	ta	T_CHANGE_TO_TL0
CHANGE_R26870:
	add	%r26,	%r27,	%r26
NC_BIS_SEC870:
	.word 0xd0bcdd7a  ! 2607: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
	.word 0xc784903a  ! 2609: LDFA_R	lda	[%r18, %r26], %f3
BLK_PRI871:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 2611: LDDFA_R	ldda	[%r10, %r26], %f16
NC_BIS_PRI872:
	.word 0xccb3dc5a  ! 2613: STHA_R	stha	%r6, [%r15 + %r26] 0xe2
	.word 0xc6ac903a  ! 2615: STBA_R	stba	%r3, [%r18 + %r26] 0x81
	.word 0xc79b511a  ! 2616: LDDFA_R	ldda	[%r13, %r26], %f3
	.word 0xc6da901a  ! 2617: LDXA_R	ldxa	[%r10, %r26] 0x80, %r3
WR_LEASI_873:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_874:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS876:
	.word 0xc6a7c23a  ! 2620: STWA_R	stwa	%r3, [%r31 + %r26] 0x11
	.word 0xc693d11a  ! 2622: LDUHA_R	lduha	[%r15, %r26] 0x88, %r3
SET_TL1_877:
	ta	T_CHANGE_TO_TL1
CHANGE_R26878:
	add	%r26,	%r27,	%r26
NC_BIS_NUC878:
	.word 0xc4ad45fa  ! 2624: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xc6ac903a  ! 2626: STBA_R	stba	%r3, [%r18 + %r26] 0x81
NC_AIUS879:
	.word 0xc68fc33a  ! 2628: LDUBA_R	lduba	[%r31, %r26] 0x19, %r3
NC_BIS_AIUS880:
	.word 0xc8f7c47a  ! 2630: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
CP_AIUS881:
	.word 0xc787823a  ! 2632: LDFA_R	lda	[%r30, %r26], %f3
CP_AIUS882:
	.word 0xc6af823a  ! 2634: STBA_R	stba	%r3, [%r30 + %r26] 0x11
NC_BIS_NUC883:
	.word 0xc4a544fa  ! 2636: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
CP_NUC884:
	.word 0xc49d009a  ! 2638: LDDA_R	ldda	[%r20, %r26] 0x04, %r2
	.word 0xc684903a  ! 2640: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
NC_NUC885:
	.word 0xc6dd419a  ! 2642: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r3
	.word 0xc6d4d03a  ! 2644: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r3
CP_BIS_QUAD_LD886:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2646: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
SET_TL0_887:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI888:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 2648: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
	.word 0xc694501a  ! 2650: LDUHA_R	lduha	[%r17, %r26] 0x80, %r3
	.word 0xc6dc913a  ! 2652: LDXA_R	ldxa	[%r18, %r26] 0x89, %r3
CHANGE_PRIV889:
	ta	T_CHANGE_PRIV
CHANGE_R26890:
	add	%r26,	%r27,	%r26
CP_BIS_NUC890:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2654: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc66ac01a  ! 2655: LDSTUB_R	ldstub	%r3, [%r11 + %r26]
NC_PST_PRI891:
	.word 0xc7bb991a  ! 2657: STDFA_R	stda	%f3, [%r26, %r14]
	.word 0xc6cc511a  ! 2659: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r3
NC_PST_PRI892:
	.word 0xc7bbd81a  ! 2661: STDFA_R	stda	%f3, [%r26, %r15]
	.word 0xc602a010  ! 2662: LDUW_I	lduw	[%r10 + 0x0010], %r3
	.word 0xc6fad01a  ! 2663: SWAPA_R	swapa	%r3, [%r11 + %r26] 0x80
CHANGE_R26893:
	add	%r26,	%r27,	%r26
CP_BIS_SEC893:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2665: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_BIS_AIUP894:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 2667: STHA_R	stha	%r2, [%r24 + %r26] 0x22
	.word 0xc6f4903a  ! 2669: STXA_R	stxa	%r3, [%r18 + %r26] 0x81
	.word 0xc6b4d03a  ! 2671: STHA_R	stha	%r3, [%r19 + %r26] 0x81
	.word 0xc6db105a  ! 2672: LDXA_R	ldxa	[%r12, %r26] 0x82, %r3
NC_BIS_SEC895:
	.word 0xd0acdc7a  ! 2674: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
NC_NUC896:
	.word 0xc6c5409a  ! 2676: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r3
	.word 0xc68c903a  ! 2678: LDUBA_R	lduba	[%r18, %r26] 0x81, %r3
CP_BIS_NUC897:
	and	%r26,	%r28,	%r26
	.word 0xd0ad05fa  ! 2680: STBA_R	stba	%r8, [%r20 + %r26] 0x2f
	.word 0xc79c501a  ! 2682: LDDFA_R	ldda	[%r17, %r26], %f3
	.word 0xc7bc913a  ! 2684: STDFA_R	stda	%f3, [%r26, %r18]
NC_BIS_SEC898:
	.word 0xc8a4dd7a  ! 2686: STWA_R	stwa	%r4, [%r19 + %r26] 0xeb
	.word 0xc7f2a01a  ! 2687: CASXA_R	casxa	[%r10]%asi, %r26, %r3
NC_AIUS899:
	.word 0xc6a7c23a  ! 2689: STWA_R	stwa	%r3, [%r31 + %r26] 0x11
CHANGE_TLE900:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc782911a  ! 2691: LDFA_R	lda	[%r10, %r26], %f3
CHANGE_PRIV901:
	ta	T_CHANGE_PRIV
CHANGE_R26902:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP902:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 2693: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
NC_BLK_SEc903:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2695: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc6b2d01a  ! 2696: STHA_R	stha	%r3, [%r11 + %r26] 0x80
	.word 0xc684903a  ! 2698: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc6b4d13a  ! 2700: STHA_R	stha	%r3, [%r19 + %r26] 0x89
	.word 0xc6c4111a  ! 2702: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r3
CHANGE_USER904:
	ta	T_CHANGE_NONPRIV
CHANGE_R26905:
	add	%r26,	%r27,	%r26
NC_BIS_PRI905:
	.word 0xc4f39d5a  ! 2704: STXA_R	stxa	%r2, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS907:
	.word 0xc68f833a  ! 2706: LDUBA_R	lduba	[%r30, %r26] 0x19, %r3
CP_BIS_QUAD_LD908:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 2708: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
CP_BIS_QUAD_LD909:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 2710: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
	.word 0xc49c913a  ! 2712: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc4bc903a  ! 2714: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc6dc501a  ! 2716: LDXA_R	ldxa	[%r17, %r26] 0x80, %r3
	.word 0xc6dc913a  ! 2718: LDXA_R	ldxa	[%r18, %r26] 0x89, %r3
	.word 0xc6f3901a  ! 2720: STXA_R	stxa	%r3, [%r14 + %r26] 0x80
CP_BIS_NUC910:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2722: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc7a2d11a  ! 2723: STFA_R	sta	%f3, [%r26, %r11]
NC_BIS_AIUP911:
	.word 0xd0ae445a  ! 2725: STBA_R	stba	%r8, [%r25 + %r26] 0x22
NC_PST_PRI912:
	.word 0xc7bc581a  ! 2727: STDFA_R	stda	%f3, [%r26, %r17]
	.word 0xc673401a  ! 2728: STX_R	stx	%r3, [%r13 + %r26]
NC_PST_PRI913:
	.word 0xc7bbd99a  ! 2730: STDFA_R	stda	%f3, [%r26, %r15]
CP_NUC914:
	.word 0xc6fd009a  ! 2732: SWAPA_R	swapa	%r3, [%r20 + %r26] 0x04
	.word 0xc703401a  ! 2733: LDF_R	ld	[%r13, %r26], %f3
CP_BIS_AIUP915:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 2735: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc73a801a  ! 2736: STDF_R	std	%f3, [%r26, %r10]
NC_NUC916:
	.word 0xc685409a  ! 2738: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r3
	.word 0xc76ae016  ! 2740: PREFETCH_I	prefetch	[%r11 + 0x0016], #one_write
NC_AIUP917:
	.word 0xc6b6431a  ! 2742: STHA_R	stha	%r3, [%r25 + %r26] 0x18
CHANGE_CLE918:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BLK_SEc919:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2745: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_PRIV920:
	ta	T_CHANGE_PRIV
CHANGE_R26921:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD921:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2747: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc6d4511a  ! 2749: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r3
NC_BLK_SEc922:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2751: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc7a4903a  ! 2753: STFA_R	sta	%f3, [%r26, %r18]
	.word 0xc6a2901a  ! 2754: STWA_R	stwa	%r3, [%r10 + %r26] 0x80
NC_AIUP923:
	.word 0xc7be431a  ! 2756: STDFA_R	stda	%f3, [%r26, %r25]
CP_BIS_AIUS924:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 2758: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
NC_AIUP925:
	.word 0xc7be421a  ! 2760: STDFA_R	stda	%f3, [%r26, %r25]
BLK_PRI926:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2762: LDDFA_R	ldda	[%r12, %r26], %f16
CP_PST_PRI927:
	.word 0xc7ba995a  ! 2764: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6ccd13a  ! 2766: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
CHANGE_USER928:
	ta	T_CHANGE_NONPRIV
CHANGE_R26929:
	add	%r26,	%r27,	%r26
CP_BIS_PRI929:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dd5a  ! 2768: STXA_R	stxa	%r2, [%r11 + %r26] 0xea
	.word 0xc6c4903a  ! 2770: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r3
	.word 0xc71aa010  ! 2771: LDDF_I	ldd	[%r10, 0x0010], %f3
CHANGE_PRIV930:
	ta	T_CHANGE_PRIV
CHANGE_R26931:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD931:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2773: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
SHORT_FP_PRI932:
	.word 0xc79a9b5a  ! 2775: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc79c913a  ! 2777: LDDFA_R	ldda	[%r18, %r26], %f3
CHANGE_TLE933:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV934:
	ta	T_CHANGE_PRIV
CHANGE_R26935:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS935:
	and	%r26,	%r28,	%r26
	.word 0xc8f7857a  ! 2780: STXA_R	stxa	%r4, [%r30 + %r26] 0x2b
	.word 0xc6ccd03a  ! 2782: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
NC_AIUP936:
	.word 0xc6b6421a  ! 2784: STHA_R	stha	%r3, [%r25 + %r26] 0x10
NC_BIS_AIUP937:
	.word 0xccbe445a  ! 2786: STDA_R	stda	%r6, [%r25 + %r26] 0x22
	.word 0xc684913a  ! 2788: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r3
	.word 0xc68cd03a  ! 2790: LDUBA_R	lduba	[%r19, %r26] 0x81, %r3
NC_BLK_SEc938:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2792: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_R26939:
	add	%r26,	%r27,	%r26
CP_BIS_SEC939:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 2794: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
	.word 0xc7bb901a  ! 2796: STDFA_R	stda	%f3, [%r26, %r14]
NC_BIS_SEC940:
	.word 0xc8bcdc7a  ! 2798: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
	.word 0xc66aa013  ! 2799: LDSTUB_I	ldstub	%r3, [%r10 + 0x0013]
CP_PST_PRI941:
	.word 0xc7bb595a  ! 2801: STDFA_R	stda	%f3, [%r26, %r13]
	.word 0xc79c101a  ! 2803: LDDFA_R	ldda	[%r16, %r26], %f3
CHANGE_USER942:
	ta	T_CHANGE_NONPRIV
CHANGE_R26943:
	add	%r26,	%r27,	%r26
CP_BIS_PRI943:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9d5a  ! 2805: STBA_R	stba	%r2, [%r10 + %r26] 0xea
WR_LEASI_944:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_945:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc6a4d13a  ! 2808: STWA_R	stwa	%r3, [%r19 + %r26] 0x89
NC_BLK_SEc946:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2810: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc782905a  ! 2811: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc6ccd03a  ! 2813: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
CP_BIS_QUAD_LD947:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2815: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xc49c903a  ! 2817: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
SHORT_FP_PRI948:
	.word 0xc7ba9b1a  ! 2819: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc6fad11a  ! 2820: SWAPA_R	swapa	%r3, [%r11 + %r26] 0x88
	.word 0xc6d4903a  ! 2822: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP950:
	.word 0xc7a6031a  ! 2824: STFA_R	sta	%f3, [%r26, %r24]
NC_NUC951:
	.word 0xc785409a  ! 2826: LDFA_R	lda	[%r21, %r26], %f3
	.word 0xc7ba911a  ! 2827: STDFA_R	stda	%f3, [%r26, %r10]
	.word 0xc4bb101a  ! 2828: STDA_R	stda	%r2, [%r12 + %r26] 0x80
	.word 0xc6cc903a  ! 2830: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
WR_LEASI_952:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_953:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc7bb101a  ! 2832: STDFA_R	stda	%f3, [%r26, %r12]
CP_NUC954:
	.word 0xc6fd019a  ! 2834: SWAPA_R	swapa	%r3, [%r20 + %r26] 0x0c
CP_BIS_QUAD_LD955:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 2836: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
	.word 0xc7bc111a  ! 2838: STDFA_R	stda	%f3, [%r26, %r16]
	.word 0xc684903a  ! 2840: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r3
	.word 0xc6c4913a  ! 2842: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r3
NC_AIUP956:
	.word 0xc7a6421a  ! 2844: STFA_R	sta	%f3, [%r26, %r25]
NC_BIS_AIUP957:
	.word 0xc4f6445a  ! 2846: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
NC_AIUP958:
	.word 0xc79e421a  ! 2848: LDDFA_R	ldda	[%r25, %r26], %f3
	.word 0xc6a4501a  ! 2850: STWA_R	stwa	%r3, [%r17 + %r26] 0x80
	.word 0xc723001a  ! 2851: STF_R	st	%f3, [%r26, %r12]
NC_BIS_AIUP959:
	.word 0xccb6445a  ! 2853: STHA_R	stha	%r6, [%r25 + %r26] 0x22
	.word 0xc68c903a  ! 2855: LDUBA_R	lduba	[%r18, %r26] 0x81, %r3
WR_LEASI_960:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_961:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BIS_AIUP962:
	.word 0xc4a6455a  ! 2858: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
CHANGE_TLE963:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc6cc903a  ! 2861: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r3
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC965:
	.word 0xc6c5009a  ! 2863: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r3
NC_BLK_SEc966:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2865: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc784d13a  ! 2867: LDFA_R	lda	[%r19, %r26], %f3
SHORT_FP_PRI967:
	.word 0xc79a9a1a  ! 2869: LDDFA_R	ldda	[%r10, %r26], %f3
	.word 0xc7a3501a  ! 2870: STFA_R	sta	%f3, [%r26, %r13]
	.word 0xc68c913a  ! 2872: LDUBA_R	lduba	[%r18, %r26] 0x89, %r3
	.word 0xc67b2010  ! 2873: SWAP_I	swap	%r3, [%r12 + 0x0010]
NC_BLK_SEc968:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2875: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_AIUP969:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 2877: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
	.word 0xc6ccd03a  ! 2879: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r3
NC_BLK_SEc970:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2881: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc632a012  ! 2882: STH_I	sth	%r3, [%r10 + 0x0012]
CHANGE_USER971:
	ta	T_CHANGE_NONPRIV
CHANGE_R26972:
	add	%r26,	%r27,	%r26
CP_BIS_PRI972:
	and	%r26,	%r28,	%r26
	.word 0xc8f2dc5a  ! 2884: STXA_R	stxa	%r4, [%r11 + %r26] 0xe2
	.word 0xc7bc501a  ! 2886: STDFA_R	stda	%f3, [%r26, %r17]
NC_BLK_SEc973:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2888: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc6dcd13a  ! 2890: LDXA_R	ldxa	[%r19, %r26] 0x89, %r3
CP_BIS_PRI974:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 2892: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP976:
	.word 0xc7be431a  ! 2894: STDFA_R	stda	%f3, [%r26, %r25]
	.word 0xc79b515a  ! 2895: LDDFA_R	ldda	[%r13, %r26], %f3
NC_AIUP977:
	.word 0xc686421a  ! 2897: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r3
	.word 0xc722a010  ! 2898: STF_I	st	%f3, [0x0010, %r10]
NC_AIUS978:
	.word 0xc6cfc23a  ! 2900: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r3
CP_AIUP979:
	.word 0xc79e021a  ! 2902: LDDFA_R	ldda	[%r24, %r26], %f3
	.word 0xc782905a  ! 2903: LDFA_R	lda	[%r10, %r26], %f3
NC_SHORT_FP_SEC980:
	.word 0xc79cda3a  ! 2905: LDDFA_R	ldda	[%r19, %r26], %f3
NC_AIUS981:
	.word 0xc6c7c23a  ! 2907: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r3
CP_AIUP982:
	.word 0xc6d6021a  ! 2909: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r3
	.word 0xc49b901a  ! 2911: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
CP_BIS_NUC983:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 2913: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
	.word 0xc4bc101a  ! 2915: STDA_R	stda	%r2, [%r16 + %r26] 0x80
CP_BIS_QUAD_LD984:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 2917: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xc7032010  ! 2918: LDF_I	ld	[%r12, 0x0010], %f3
CP_AIUP985:
	.word 0xc6ae021a  ! 2920: STBA_R	stba	%r3, [%r24 + %r26] 0x10
	.word 0xc6c3911a  ! 2922: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r3
NC_AIUS986:
	.word 0xc79fc23a  ! 2924: LDDFA_R	ldda	[%r31, %r26], %f3
	.word 0xc66a801a  ! 2925: LDSTUB_R	ldstub	%r3, [%r10 + %r26]
CHANGE_R26987:
	add	%r26,	%r27,	%r26
CP_BIS_SEC987:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 2927: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xc6f4903a  ! 2929: STXA_R	stxa	%r3, [%r18 + %r26] 0x81
	.word 0xc49b501a  ! 2930: LDDA_R	ldda	[%r13, %r26] 0x80, %r2
NC_AIUP988:
	.word 0xc6ae421a  ! 2932: STBA_R	stba	%r3, [%r25 + %r26] 0x10
	.word 0xc782901a  ! 2933: LDFA_R	lda	[%r10, %r26], %f3
	.word 0xc783105a  ! 2934: LDFA_R	lda	[%r12, %r26], %f3
SET_TL1_989:
	ta	T_CHANGE_TO_TL1
CHANGE_R26990:
	add	%r26,	%r27,	%r26
NC_BIS_NUC990:
	.word 0xc8bd45fa  ! 2936: STDA_R	stda	%r4, [%r21 + %r26] 0x2f
CP_ATM_QUAD_LD991:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2938: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
SET_TL0_992:
	ta	T_CHANGE_TO_TL0
WR_LEASI_993:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_994:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_PRI995:
	and	%r26,	%r28,	%r26
	.word 0xc4b2dd5a  ! 2941: STHA_R	stha	%r2, [%r11 + %r26] 0xea
CHANGE_PRIV996:
	ta	T_CHANGE_PRIV
CHANGE_R26997:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP997:
	.word 0xd0b6455a  ! 2943: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
NC_NUC998:
	.word 0xc49d409a  ! 2945: LDDA_R	ldda	[%r21, %r26] 0x04, %r2
CP_BIS_QUAD_LD999:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 2947: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	.word 0xc7a3101a  ! 2948: STFA_R	sta	%f3, [%r26, %r12]
	.word 0xc79bd11a  ! 2950: LDDFA_R	ldda	[%r15, %r26], %f3
CP_BIS_AIUS1000:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 2952: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
SHORT_FP_PRI1001:
	.word 0xc79a9a5a  ! 2954: LDDFA_R	ldda	[%r10, %r26], %f3
CHANGE_USER1002:
	ta	T_CHANGE_NONPRIV
CHANGE_R261003:
	add	%r26,	%r27,	%r26
CP_BIS_PRI1003:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 2956: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP1005:
	.word 0xc4be421a  ! 2958: STDA_R	stda	%r2, [%r25 + %r26] 0x10
	.word 0xc6ccd13a  ! 2960: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r3
	.word 0xc4bcd13a  ! 2962: STDA_R	stda	%r2, [%r19 + %r26] 0x89
NC_AIUS1006:
	.word 0xc6d7c33a  ! 2964: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r3
	.word 0xc6b4903a  ! 2966: STHA_R	stha	%r3, [%r18 + %r26] 0x81
CHANGE_USER1007:
	ta	T_CHANGE_NONPRIV
CHANGE_R261008:
	mov	%g0,	%r26
CP_BIS_PRI1008:
	and	%r26,	%r28,	%r26
	.word 0xd0aadd5a  ! 2968: STBA_R	stba	%r8, [%r11 + %r26] 0xea
	.word 0xc49cd03a  ! 2970: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
CHANGE_PRIV1009:
	ta	T_CHANGE_PRIV
CHANGE_R261010:
	add	%r26,	%r27,	%r26
CP_BIS_NUC1010:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2972: STBA_R	stba	%r4, [%r20 + %r26] 0x27
CP_BIS_AIUP1011:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 2974: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
CHANGE_USER1012:
	ta	T_CHANGE_NONPRIV
CHANGE_R261013:
	add	%r26,	%r27,	%r26
NC_BIS_PRI1013:
	.word 0xcca3dc5a  ! 2976: STWA_R	stwa	%r6, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS1015:
	.word 0xc6f7c23a  ! 2978: STXA_R	stxa	%r3, [%r31 + %r26] 0x11
CP_BIS_NUC1016:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 2980: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
	.word 0xc4bc511a  ! 2982: STDA_R	stda	%r2, [%r17 + %r26] 0x88
NC_NUC1017:
	.word 0xc6cd409a  ! 2984: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r3
	.word 0xc6c4903a  ! 2986: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r3
BLK_PRI1018:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2988: LDDFA_R	ldda	[%r12, %r26], %f0
CP_BIS_AIUP1019:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 2990: STDA_R	stda	%r6, [%r24 + %r26] 0x22
CP_BIS_AIUP1020:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 2992: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
	.word 0xc7bb511a  ! 2993: STDFA_R	stda	%f3, [%r26, %r13]
SHORT_FP_PRI1021:
	.word 0xc79a9b5a  ! 2995: LDDFA_R	ldda	[%r10, %r26], %f3
NC_AIUS1022:
	.word 0xc6c7c33a  ! 2997: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r3
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x1f24b7310dbd635d
.xword 0x628f0e3421bdf5e5
.xword 0xe33ccac1f74955f8
.xword 0xe04f37e465b441a7
.xword 0xa3c2e6beddcff1d9
.xword 0xf707d2fc832939ae
.xword 0x1524d7412b10891e
.xword 0xe35281ed16248dbb
.xword 0x7cdac1ea31955970
.xword 0x1c540ee0af5ac655
.xword 0x3fd4dcebf0ee71ce
.xword 0xb3a7237985215b05
.xword 0xc9d5129756b24106
.xword 0x574b33fb1ba65684
.xword 0xa32ba6effcb041de
.xword 0x278df4c6aa15f051
.xword 0x0640443b5bf0487a
.xword 0xbbdbf93e04c88e30
.xword 0xe423e900d377c3e8
.xword 0x276daaae0663b580
.xword 0x914768a63e16c087
.xword 0xe60a4854c5a835c8
.xword 0x0418221d0897a9d9
.xword 0x62489bc458b2c0f0
.xword 0x9c185b38d3530b68
.xword 0x8911eac65150ba50
.xword 0xe313ed2932f66452
.xword 0xe4bdb8dea27ce5ef
.xword 0x8167047e91cde615
.xword 0x26a095b2729583e1
.xword 0xe77fd31c9de44c1a
.xword 0x3f0224b05fa7054b



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
.xword 0x97f15da42ebad5ea

.xword 0xb09cdee61826bfe4

.xword 0x63370828395b0df4

.xword 0xaffabd8c4c008d83

.xword 0x570daf101d445f0e

.xword 0xb3df8e98274ca7a2

.xword 0xd9d27f48663e8530

.xword 0x8b94e57c2d97447b

.xword 0x8825dca1fc9a0ada

.xword 0x19cd2c19dba72eb1

.xword 0x09f2e2b1761120f1

.xword 0x157ab4f696d17e32

.xword 0x40f00ff38dbda108

.xword 0x4c25006243ffcf65

.xword 0x42f36aca5130387d

.xword 0x51424a8216f04ac4

.xword 0x0d0eb6a2419c2fa0

.xword 0xb3881855fdf9158a

.xword 0x7203ec15855beef2

.xword 0xd7e21f3449cb0aad

.xword 0x049efe5f4a8e9eb1

.xword 0x9ddc12627e2e3bf3

.xword 0x7f7da2611f5d414b

.xword 0xf69638318849c454

.xword 0xcdf8e4f614839695

.xword 0x2ec0f20132309c89

.xword 0x5d2d6449c04253b9

.xword 0x2826ff42758f8308

.xword 0xd0c328ab706283ec

.xword 0x37447707d7cb61af

.xword 0x4e039feafff9588a

.xword 0x5ffb87dccbd02f7d




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
.xword 0xd1cbdb94b391c6a9
.xword 0xefdbec2c19b156be
.xword 0x8358b6dc9be29c90
.xword 0x31a25959851c963f
.xword 0xe692c36ec5dfb1af
.xword 0xc8288e5e2727b413
.xword 0x3ef370d242fb136e
.xword 0xed5bcb24e675567d
.xword 0x488bb61349768fe6




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
.xword 0xf9c882a5b510433f
.xword 0xe731e8bc1fea35b4
.xword 0x01bd9d2a6f8d2525
.xword 0x723193eb9ac2d18f
.xword 0x58be749c11b7a3a5
.xword 0x5df7a4cfa2ad65f9
.xword 0x8bc40206c4a8ec83
.xword 0x4bc8f1996d75080c
.xword 0x2212090208ea617e




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
.xword 0xff32b6d605d62600
.xword 0x1dbe93033e765ab2
.xword 0x4b7d6aa4de07490e
.xword 0xf6c2e0cda4a4cb61
.xword 0xd4f9a1fdebb2a10b
.xword 0x62aa78484cd57dbc
.xword 0x3e21f4ff9cd35fa0
.xword 0x7c289c6369f31f46
.xword 0xe05d65fc0c714800




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
.xword 0x2656850e16b12a31
.xword 0xfd1b3766200857ac
.xword 0x77cfbc911c506789
.xword 0x4f784e81c905e677
.xword 0x92c18a7e22f5fd04
.xword 0xcee6de25b772c470
.xword 0x91585ca25d58a4f8
.xword 0x75350fe71c385369
.xword 0x826350a6506836d1




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
.xword 0x9c31e3bcd40a5e6c
.xword 0x6487c50571acf02d
.xword 0x6ea139bdf627d215
.xword 0x0fb179760184a8ca
.xword 0x2f16104386606bb6
.xword 0xd17f95055a058170
.xword 0xda691957d7637e99
.xword 0xcae0bf5356f6d8c7
.xword 0xaa258ef7b60e0a3c




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
.xword 0x57995af9cd29194f
.xword 0xb6ca0e0b9c1348c1
.xword 0x91a22f8da1f13d26
.xword 0x7610f15e987303e8
.xword 0x8e0f5e6b609495aa
.xword 0xd8a9a9fafc094295
.xword 0xb8414393d69adb02
.xword 0xec1b5c1de6968a4f
.xword 0x9d4f09ac55106d10




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
.xword 0x4b28efb253b469db
.xword 0xa8b3a072908239d9
.xword 0x87d9539157ecb359
.xword 0x6f1b162152ac1627
.xword 0x08d19016b8ee899d
.xword 0xc6d23c58d5587457
.xword 0xda24b0f8cdf328e6
.xword 0x0374214db8a6fd66
.xword 0xce399037215a17ff




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
.xword 0xaf714261f14e2cc9
.xword 0x80f938ab2b24ef9b
.xword 0x4cfcd30cbce7fffa
.xword 0x37e8cedf66ef58ee
.xword 0xfeb904f9ad02821c
.xword 0x76b5af0764c303a1
.xword 0x90a0b3eab2a294a0
.xword 0xac41b47e9c8a2395
.xword 0x1492e4dc8aae3153




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
.xword 0x0167b1a7a8beaf22
.xword 0x791fdafe925d4596
.xword 0xda658b8c01c6fd34
.xword 0x656e05b2bcff159f
.xword 0x8c084a9ef08ad6ab
.xword 0x7fb262e8d3a7309c
.xword 0xc4d739c6c7e5bb5f
.xword 0x9f76206c7b629e16
.xword 0x0aae7ebc83de47e0




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
.xword 0xff20b8a158b61056
.xword 0x72b5c063c06b3055
.xword 0x66288749c9144470
.xword 0xb801a4df82fda864
.xword 0xb66c02312ec6a8fe
.xword 0x63ada78e66d5ebb9
.xword 0x4e7c589ffc7fbbce
.xword 0x1abeeee8048ee4e6
.xword 0x31011f14c64036b9




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
.xword 0x9eb0f61070db1568
.xword 0x245e930c76cce70b
.xword 0x62df003df69d79fb
.xword 0xfc33e7dae544fe68
.xword 0x0646f309b7cfef6f
.xword 0x1e5b5b4d111d56b1
.xword 0xcef347d63108a747
.xword 0x037307d3a3a56e24
.xword 0x7db6e373987b0724




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
.xword 0x4093b75f41b13e21
.xword 0x72583b7e2e5370c5
.xword 0x739bbda476041eb3
.xword 0xe8429cc956366545
.xword 0xbdf2570e4c0dcc54
.xword 0xbff63932bb4a75a6
.xword 0x39679effd82045b6
.xword 0x198db362dce08994
.xword 0xb1c24622b311269f




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
.xword 0xc7fe8d5f109f3ede
.xword 0x8d9605a35bd797b6
.xword 0x1379ca49284a3d59
.xword 0x3602be01f16979fe
.xword 0x62953d5ede72df87
.xword 0xa3bb5c935b81cde4
.xword 0x97bbc3d3dee98a46
.xword 0x31f1a25352ca4e11
.xword 0xfc790d8676e22d05




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
.xword 0xddc453b236a32c77
.xword 0x1cd148c875c0a29a
.xword 0x6590b9293d204ab6
.xword 0x83869a138011b462
.xword 0x28fb5e46e72ad209
.xword 0xa919c9984d69fecb
.xword 0x73071739de38558b
.xword 0xf04f08f2381832a4
.xword 0x7b5e8c4f2c6e8e17




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
.xword 0x22fa760fe7d5b81c
.xword 0x704d91838def82a1
.xword 0x1d58c868519fe953
.xword 0x7e2f31b288ab8401
.xword 0x9082360adacb85c9
.xword 0xdaa83967bc95dd02
.xword 0x50f2a519e308cb0f
.xword 0xbd132940f8e50fbc
.xword 0x650f6bf1387e1cab




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
.xword 0x34feb5777bff034c
.xword 0x145b07438f318caf
.xword 0x9507cf93cb174594
.xword 0x137b2024d96c5521
.xword 0x04e4e92b78c7e721
.xword 0x489358eba809acd9
.xword 0x8dd0f8edc8eb1695
.xword 0x6a2e726cd0be0808
.xword 0x100ee146382534b8




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
.xword 0xc238cab85ee68880
.xword 0xc2ab49a2af61d127
.xword 0xaf169ef70492240a
.xword 0x150b444e5ce3a94f
.xword 0x00d4c61e38ceb040
.xword 0xbc68647239f7f951
.xword 0x08edd7bbfddc7eb7
.xword 0x45f17969e36a2a53
.xword 0xbf8e1cc6ad6afa10




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
.xword 0xe1f5caa302261320
.xword 0x61b59e061e38a10e
.xword 0xc088f72e00cc903c
.xword 0xa7694d8565dc5d9b
.xword 0x1160e4dc4623d1ba
.xword 0xb7953d8a5dfcbc22
.xword 0x550c8bb57592c8c8
.xword 0x7476fd1f981b1e10
.xword 0xf5517c53aa16dc12




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
.xword 0x1fedfa1abc98aa9a
.xword 0x347da973bbc90327
.xword 0x19a0f16270be5943
.xword 0x149da192a965d833
.xword 0x81e4182fb0bfdce2
.xword 0x9ed582ec498206b3
.xword 0x8c72c346e94213f5
.xword 0x0222f780540bce2a
.xword 0xe76f437fd8496d8b




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
.xword 0x4db24e4275725e25
.xword 0x1144b191639c14fc
.xword 0x12beecbc952b0029
.xword 0x5953923f55fe7129
.xword 0xe0e31644c6533f33
.xword 0xb615ba66ad7cb703
.xword 0x2973a26f3c3a1300
.xword 0xb40edee45223c36c
.xword 0x45d4c2cd709ef4c9




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
.xword 0xf9d69db380e120dc
.xword 0xb56e8a52c20557b7
.xword 0xf5ffc2901b88ad9e
.xword 0x34e03debab9e95bb
.xword 0x6005e4e2dc5647e6
.xword 0xafe07c264e5530e7
.xword 0x2e5b81f33d165b92
.xword 0x0b9a564c5bee5069
.xword 0x7a165e187a53c569




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
.xword 0x26f3bf5c57ed6e36
.xword 0xb6d2770f66193620
.xword 0xfc8b25a8333cf33d
.xword 0xd2aeefa9f1813847
.xword 0x484fa3326de2ac4d
.xword 0x3e6eeddd1cbc3ae0
.xword 0x4e18bb042e6477c1
.xword 0x7acd11db36b01c70
.xword 0x26222382059e9f22




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
.xword 0x9a26395ea0d592bd
.xword 0x7dcbfb19f54efea3
.xword 0xf7ad83d8648a931a
.xword 0xea836511bd6dd9d6
.xword 0xa2874b2530c51909
.xword 0x6185767345043e2f
.xword 0x9e8f65a208b2eb8c
.xword 0x357418dd03021fe0
.xword 0x6dd757ab0e174eae




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
.xword 0x60025354e7dcd79b
.xword 0x5148a11135be418b
.xword 0x02e734b74d0b9f39
.xword 0x2e0f26171c263acd
.xword 0xb2b4f3f90cd44aed
.xword 0x2f6f72bb20793e06
.xword 0xe448b3526fca4f96
.xword 0x5943f9d3cbe844db
.xword 0xccd09ca43ba6de6a




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
.xword 0xf092337ed866a7c1
.xword 0x87829c1b55a0822a
.xword 0x3edd01c7333135a5
.xword 0x7d1dc5f5f1c95118
.xword 0x34144c95e8cb800f
.xword 0xcae0a2f837039886
.xword 0x409a28f4a06504a1
.xword 0x9a28be36792d26a8
.xword 0xa9f11a2ffe00163f




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
.xword 0x964a4d789bfe2e76
.xword 0x3a56760ede514312
.xword 0xdd72b1721c2f91b1
.xword 0x5a58bc3f898c0fa6
.xword 0xa22af40929c08562
.xword 0xa71cddb027107a9c
.xword 0x14e283dbd98e2643
.xword 0x4bdeecaad4056948
.xword 0x610c5ed310291417




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
.xword 0x0977846a3cba1ec3
.xword 0x97d2b1618e331848
.xword 0xb57e188189cdfb53
.xword 0xadb93a7f54b4b056
.xword 0x13ef3c0ce42bc731
.xword 0x2b1e3ba99a21d212
.xword 0xdb80b156c9cbcd4c
.xword 0xc70b6aacc89dfca0
.xword 0x4b2e780b3d187c75




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
.xword 0x705efd15269bed4d
.xword 0xc82c0a9b9d1652d4
.xword 0x12299e34f4716932
.xword 0x0fddc029cead640d
.xword 0x45e852aedcf5c530
.xword 0x037c1663396fd2b0
.xword 0x02d89af33a8f7c2c
.xword 0x476c1e3a354e2c20
.xword 0xc02b06dbbd188722




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
.xword 0x362c32572b1c807b
.xword 0x0e2f013252fc74d6
.xword 0x20af1d3bcb17bf8d
.xword 0xf66f6372a3fb017d
.xword 0xf20f9375b3a2f83b
.xword 0xa3686bc972997903
.xword 0x49a6667b2b761753
.xword 0x4a6d016e422e54e9
.xword 0x651ee41795534e1e




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
.xword 0x9d8cd2259f6b6741
.xword 0x55c05f9055ac5139
.xword 0x7d8a326ddc46461a
.xword 0xb214e17c1a61e2bc
.xword 0x4ce8dfe440a5e46c
.xword 0xc963152cdf3bfd78
.xword 0x8e82642f7d5e9b24
.xword 0x6e450c618aae685e
.xword 0x871da2e849b9f107




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
.xword 0x1d6594b8670a8cbd
.xword 0x50f66feb83e48d6a
.xword 0x117addf5f8ca222e
.xword 0xa9e0df359b3cf8f6
.xword 0x26a966678ac98487
.xword 0x8b5d70b453db9a76
.xword 0x8bf3e4cb6b0eb1da
.xword 0xbd57612227e00947
.xword 0xada9e6e3f6559935






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
.xword 0x0511ec32fa1f3d72
.xword 0x3cfa8106d8ed489a
.xword 0x429110de6dbdefbe
.xword 0x0f9e5659167cb87a
.xword 0x842e3796c2236d14
.xword 0x3b37b41a47373131
.xword 0x21116df768d58016
.xword 0x62cb770055f0940e



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
.xword 0x6b38b9e0a69786d0
.xword 0x0825bd87fbb44a68
.xword 0x1f91ccdb30186b08
.xword 0x5802860ee9df81c3
.xword 0x50b1f6415ca94b4a
.xword 0x15a530f61f3f5959
.xword 0xaacdc0715a588f89
.xword 0x32ddbd8821f1c2d0



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
.xword 0x3df1252a070a9032
.xword 0xe2b241c5d4ce1c11
.xword 0xe3a65ed4e6bc13fd
.xword 0x5c11c48cfc396f55
.xword 0xdd12a815758de779
.xword 0xba88f752bce2a9b0
.xword 0xb02a86eec9808ba0
.xword 0x62ca3d16a115e476



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
.xword 0x79bd7801b5f16440
.xword 0x53d9524051bfc6e5
.xword 0xc1c3190eefbaf29d
.xword 0x3b4c005f37190ecf
.xword 0xf6c5f3905b29ab28
.xword 0x23ef1639bdf4884c
.xword 0x4055abd1ed1e5ecc
.xword 0x5c18483ad7b7ab3d



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
.xword 0x59dbff8bbb0eb3ca
.xword 0xd48c8b430add458a
.xword 0xd7ae0b9f290863a9
.xword 0xf2196d95ef8471a6
.xword 0x513de16402cc5cf4
.xword 0x50d4e54e5df16e7d
.xword 0x40248a7f456532d4
.xword 0xad7dc2ab4ed2f931



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
.xword 0xfe45234db708739d
.xword 0x8ef266a1f9dd7b22
.xword 0x8cca3aee5f6204eb
.xword 0x9817b76c4371ecb6
.xword 0x620589ceac9c2c4c
.xword 0xd3dc250ee6b6e58d
.xword 0x3a4f9f6e217eecd9
.xword 0x97250fc97277e23d



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
.xword 0xb4efe11bfad412ef
.xword 0x33e8a9e37ea72061
.xword 0x4c2ec041236e7825
.xword 0x50f40cc7a9e58eee
.xword 0x13e8a69df9b8e143
.xword 0xc07559d064ad1549
.xword 0x2567845277fc3ba9
.xword 0x161f37983bd756c4



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
.xword 0x9ff9b6b637c54875
.xword 0x033b5eee95637bee
.xword 0xf9ad859982c98936
.xword 0x6f3ca44c7d8be490
.xword 0x229c645c66d4760f
.xword 0x5f4af68e8e011563
.xword 0x7225ff70157dd05e
.xword 0xdbe35d43f0465bfb



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
.xword 0xff01f333e62df57a
.xword 0xe4fe37bac83bc4eb
.xword 0xc125ba4f9dd13454
.xword 0x73baf53524cc4eea
.xword 0x3bfcdd38146fad99
.xword 0x501c30445f3a36f1
.xword 0xe473c63674206dcc
.xword 0x46efe27e4c953ab3



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
.xword 0x378a7f63115b3e31
.xword 0x4850b2331bab2430
.xword 0x15107f9c954ee099
.xword 0xd1effa86d59e9f87
.xword 0x484e7f13bd713781
.xword 0x98f4f51088e44654
.xword 0x1c85e7281953c9eb
.xword 0xd15a21cc676ae194



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
.xword 0xff0c299935270546
.xword 0x346b97b489cf8290
.xword 0xd8b0d5059e768b81
.xword 0x04eeb8e5c570ae26
.xword 0xa00ef2fd2abdb694
.xword 0x9f5c804c600647f2
.xword 0xf55937f70f3a524e
.xword 0xc84066f6dd55364a



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
.xword 0xbe0ea659078b1ad3
.xword 0xedcd52961fa02622
.xword 0xcc9c355b01c05333
.xword 0xe428b0f3b3afc402
.xword 0x0c46cfad8320a7d5
.xword 0xc52808c24b8fb116
.xword 0xb78b8a5aebc70a9a
.xword 0x9a6cd283a8d5b69b



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
.xword 0xda83586741468d66
.xword 0x33505c925f1cdd9c
.xword 0xb4b34c73ed673851
.xword 0x614fbf3b37780e94
.xword 0x65794929ee54170f
.xword 0x348a27ba032855a3
.xword 0x5ea4158ff6384a2a
.xword 0x156aea3e12692e12



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
.xword 0xada2b6ae3eb57df1
.xword 0xa126f99710e667a6
.xword 0x581d928eba918942
.xword 0x6adecbb1a273c179
.xword 0xa6cc4d199cda4eb4
.xword 0x92d2a617149ed3b0
.xword 0x316d20da0f5ac16a
.xword 0x817e772135429a03



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
.xword 0x02eb734fe9d01157
.xword 0x25e1da6503f952a1
.xword 0x842fdfce1682ce46
.xword 0xb1cf33bee960fa76
.xword 0x0da844521a18c2db
.xword 0xc383944373ced582
.xword 0xd2d7d6d853c7656c
.xword 0x511d492e8907d63d



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
.xword 0x1f0cf5fefa7ebf30
.xword 0xbb2fe65ee4285450
.xword 0xc0478c0777ff2e07
.xword 0xbce3da8d6742b193
.xword 0x1f71d57af3b41176
.xword 0xe92fe72920425322
.xword 0x0c249559ca6a6b80
.xword 0x90aab9aecd2dd01f



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
.xword 0xaf81f7d7a9a86b7e
.xword 0xba05294948f42726
.xword 0x0c4c8ddcdca81863
.xword 0xf4a8070e91d2cea6
.xword 0x984e5915ba7f9833
.xword 0xe9b56c9829b43bf8
.xword 0xf136b98a73b433a7
.xword 0x6dff4e3e43075959



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
.xword 0xb9e372aee3df63c1
.xword 0x6da0246e0c5b7b54
.xword 0xe3cfb37834f7c536
.xword 0xb9b9cad2f991a80f
.xword 0x7ad75f8e638e8ebd
.xword 0xe209d96076dfd5f2
.xword 0xfb894c54fb678f1a
.xword 0x23f77c12bb7e0f59



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
.xword 0x55becc87ff001e67
.xword 0x8f527746e0f308fe
.xword 0x1fec594c388ff4a3
.xword 0xc391c45ad4eab7af
.xword 0x8aecfc016c976ec3
.xword 0x6af6fad5c15a9d32
.xword 0x048412a06102bc95
.xword 0x54f7ef0702bf6445



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
.xword 0x43dfce7dc04e63bb
.xword 0xd593791a650b39e9
.xword 0x7b87eb57115e6781
.xword 0x76c1160ed1ce6cd4
.xword 0x717b1e10cc14cd00
.xword 0x78d45203ceb9223f
.xword 0x8df7d71083705ad1
.xword 0x74069fa304da96c0



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
.xword 0x9f88717461ac519d
.xword 0x29dbd984ae1a307d
.xword 0x004a8b7721cdf199
.xword 0xb2f795b5648cdff6
.xword 0xed2783f5b89faa82
.xword 0x8de50d136e883fe6
.xword 0xe28fe5ea7eb0658e
.xword 0x11f1a9f4d5b33513



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
.xword 0xf77e777fe43e0988
.xword 0x683cd7ee988af6b3
.xword 0x3d57c5157b00a981
.xword 0xa1d377757f2dd9f8
.xword 0x0e563d9a9fc2d524
.xword 0x2b97a32b5a7c0d69
.xword 0xcbe5ec8fbf0b4cd6
.xword 0x9c90a3d288a74825



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
.xword 0x77fd798e6eb56d93
.xword 0x9ca9a9516198d60e
.xword 0x5cd658da43511227
.xword 0x7a27c6088487b619
.xword 0xb7ecb0fa47f551a1
.xword 0xa2fd013fcc82c1aa
.xword 0x673df2810e7101cb
.xword 0x39eef40b0ed62a9c



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
.xword 0x92ebe05b44d3de0d
.xword 0xd24d28ef3ced5ba4
.xword 0x51f1f853693fe3a3
.xword 0xa1f5fcb38786455f
.xword 0xe879694c40f8ca62
.xword 0xa94892a51055e0ed
.xword 0x27a9a411c2196566
.xword 0x68e3dc034ea09787



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
.xword 0x300a51b7d33d044d
.xword 0x49194ff9b73637a0
.xword 0xaa3f231fd9b89d9d
.xword 0xc5c41790781cb32d
.xword 0x1264d24d9c037a1f
.xword 0x951ce41e2ee5a392
.xword 0x245f92dd7eb90b20
.xword 0x9264d43ff498c4af



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
.xword 0x43b5f30ace8ff579
.xword 0x1a6bbd75841e2bd3
.xword 0x8a00c984befb5344
.xword 0xb65a596a168ff081
.xword 0x52d770807b613bde
.xword 0x5eecc23bfa7a60b3
.xword 0x69d16920fa3c3182
.xword 0x22d68813e71473d6



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
.xword 0x0501bee586eb204c
.xword 0xbfc8bd77e0e2a1c9
.xword 0x7e4b099ed28e7fb9
.xword 0x0cb5abd572430af8
.xword 0x15d2290dffcdf8e9
.xword 0x18b6b4870d3a4c35
.xword 0x58dc7f175e296a20
.xword 0x1f8033ccf2c2ae75



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
.xword 0x1f2055a39910ee5d
.xword 0xdbea65e2371e8481
.xword 0xf1b45a0d73c0e0fc
.xword 0xe2af47048ed6f953
.xword 0xb43178c1acd4de4b
.xword 0xe9023a77cfade35b
.xword 0xce163dc20aee992d
.xword 0xa648ed9f3d5f447c



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
.xword 0x9a72a4d007469130
.xword 0x7bf8778bd1b1d6d9
.xword 0xc3b43577feb68cfc
.xword 0xb36cea5f4ac1aa7c
.xword 0xd687a8ee0d2ad901
.xword 0xb40241d69aab6bac
.xword 0x46eb5bed776dd465
.xword 0xf61687d7c2c2a6d5



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
.xword 0x791fe6175ab383e8
.xword 0x1122827462679455
.xword 0xb31bcfca154040c9
.xword 0x4b42f27e81f046fe
.xword 0x4f4037bddb520b62
.xword 0x2791869703e7e7d0
.xword 0xd538c01f359a0a97
.xword 0x75c9319b91d735a8



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
.xword 0xdbbd6802091ddc39
.xword 0x855a98b4a513cb5a
.xword 0x43803e78f9239a30
.xword 0xdef39e9528f154d8
.xword 0x74a220e8a70d7ce9
.xword 0x94976f2a4b0e8bae
.xword 0x128594f10c5d06a5
.xword 0x07256885c5623ed4



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
.xword 0x642c254f83b0ceaa
.xword 0xca294972b0578802
.xword 0x4e8b8b781a90118f
.xword 0xd97271890a717153
.xword 0x88979357bd476180
.xword 0x590b546bc508bb4b
.xword 0xaabc703fb97e14eb
.xword 0x97698f215e8e4fc0





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
.xword 0x6ca440f0940b1a17
.xword 0xf44504a01637b79c
.xword 0x915ee7bb2850a6af
.xword 0xc235b72de8646a62
.xword 0x916dc4e977f35ac6
.xword 0x0e1ebabc46be6ae7
.xword 0x4e88723bf05b8524
.xword 0x9cffe0be85559c6a




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
.xword 0xf04141cd1ffbf0e7
.xword 0xddb0e5bf23d63108
.xword 0x4bd05e97249e7d9c
.xword 0xa15a1048ec4d8676
.xword 0x5c9a89169e2d2cfe
.xword 0xb09e58a2e8429d0b
.xword 0x808905a816a7d9b2
.xword 0xdaaf30825bfb13f1




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
.xword 0xecd3dde78fa89d11
.xword 0x4fe7cda2c48eb6ca
.xword 0xa35313ae0508cc9c
.xword 0xc778e8ac917378b9
.xword 0xfc02fb3977c8b779
.xword 0xd43303266d1f63f5
.xword 0xb8e1ebd606327789
.xword 0x3c7592f5186cf0f6




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
.xword 0x5a16e6a47866e931
.xword 0xc30a53a3525f2a97
.xword 0xf5dca107430c1415
.xword 0x191cf849f7043fd8
.xword 0x4270c4b9a9cd43de
.xword 0x83acc26f410b18f2
.xword 0xa267c6733d124a97
.xword 0x0d483ec567a243c3




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
.xword 0x04d0b95893b1bf1a
.xword 0x5e0341842d90748d
.xword 0xff7410442052fe8b
.xword 0x56a284562545dd3b
.xword 0x9d1985082b60e9ed
.xword 0xca510dfeb2100be8
.xword 0x3c5903292f17b72a
.xword 0x8a6564902d594cb6




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
.xword 0x7893cd2530705ba5
.xword 0xd1e8db9801cf6ef4
.xword 0x2c8d20f3ac12cc65
.xword 0x683278f04dc0b613
.xword 0x92c90cebad483090
.xword 0x8541f5dd6a88f054
.xword 0x039d0c8c1d5b8e93
.xword 0x917f9e79648366cf




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
.xword 0xa8d878d0a4107743
.xword 0xfaed7dfbe7a094af
.xword 0xdc5cb70a37b49427
.xword 0xff6e859680670ecc
.xword 0x4139ec648dc6d849
.xword 0xad9e8faf76036390
.xword 0x950db2942f44d787
.xword 0x169dea1bf071dca8




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
.xword 0x6862cd58921114c7
.xword 0xc0105d0dd73a335d
.xword 0x7491a40b6fcaa7f8
.xword 0xad3168e1681db925
.xword 0xa953be61ffb9efbd
.xword 0xebb957d2281843b3
.xword 0x52a0e990d5ca08b7
.xword 0xa268a1f0e59019a4






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
.xword 0x71059382f4cf28ee
.xword 0xd935e4c20a92eb19
.xword 0xa2a5195be88fa7e7
.xword 0x4d81dc97678f239b
.xword 0xe12558e7b7f4a645
.xword 0x849d0ffd3862593b
.xword 0x6720a702416723c4
.xword 0xdf4cf1890002a15a




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
.xword 0xd4d7ddf2cc016a12
.xword 0x09dae47ddaec0a9b
.xword 0xd61a3c818e67d177
.xword 0x3694168484039340
.xword 0x772aa8239e60b4f2
.xword 0xb6638053080a151b
.xword 0x0c313d5c00535188
.xword 0x509e25c7aad9feaa




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
.xword 0x7162db78d90c7531
.xword 0x90c641ecf3374d3a
.xword 0x40d9f19119470fbf
.xword 0xc46062c3401b871f
.xword 0x645b33c7b423c5c1
.xword 0xfc2079569023f3e2
.xword 0x43bf7cc16229d0cc
.xword 0x818b4dc6f322bd69




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
.xword 0x9ff7b8f7596c2611
.xword 0x77269aa655eba66a
.xword 0xa4bce1d7af96fb8e
.xword 0x6a3c78f7931e925a
.xword 0x4e6fe88c812c0630
.xword 0xe3fc8084b9f1f646
.xword 0xef9af13f7a5b2bae
.xword 0xceba8c417b4fb526




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
.xword 0x37fa117efe66ba26
.xword 0x419ce63c7f918094
.xword 0xef9e8fe68ac6e22b
.xword 0xc352e08b66d2c36c
.xword 0x7266dea86341eb3c
.xword 0x44acc5645fa4bebd
.xword 0x3366d20d5c538348
.xword 0x1911bbcdbba52da0




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
.xword 0x9b555cf8cdca8986
.xword 0xa144a4a5cb99e2d1
.xword 0x0140606294db1ceb
.xword 0x738bb9fcd5a61b3f
.xword 0x41c2798e9d97a271
.xword 0x34364eca10f0163d
.xword 0x21a96d4bc55e70be
.xword 0x612b95632d8dedf8




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
.xword 0x4ec217053774a4aa
.xword 0x56c2b01aec7e7128
.xword 0x612976a47f8bc21c
.xword 0xa039192bcb031a97
.xword 0x0fae9a0a183e535e
.xword 0xeef164bd19000182
.xword 0x23db1f137c7e3fe9
.xword 0x53fff0f9f4ecb5b6




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
.xword 0xacd13f94301bdb5a
.xword 0x531699fd999ad015
.xword 0xefdcf285e7508e87
.xword 0xdcd22946ce5b7c52
.xword 0x3fee02f25c550601
.xword 0x14da7003170eb143
.xword 0xd81d3f8318992aac
.xword 0xa51c762c40578082






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
.xword 0x67039b3e2646e815
.xword 0x009732970cb1c1e8
.xword 0x43bb40560078efad
.xword 0x317350782ef6548a
.xword 0x1eb741d0882462f1
.xword 0x4a423aa8b0d73b98
.xword 0xedf62c2e509ec864
.xword 0x7d5b6a790e6c89bf




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
.xword 0x513cdee307577a0c
.xword 0x83bbc0b04df2f71d
.xword 0x831300cb20eab0eb
.xword 0x47965f605b4969bc
.xword 0x478653f032135c8f
.xword 0xb4c01494c6d943ba
.xword 0x3772cf437f68c150
.xword 0x159d54dd6445150a




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
.xword 0x8910e63969709cf5
.xword 0xd1876ec86683bc86
.xword 0x40fd36d0b383ecb1
.xword 0x3433ce7fb92101aa
.xword 0x9f34552129da9270
.xword 0x6bb64d0b9881f149
.xword 0x4f86ecb221090f0a
.xword 0x5e99c75a948f2f7e




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
.xword 0xc786cf2880b7d4da
.xword 0x8d10344a87225766
.xword 0x17285a37a022dae9
.xword 0xcbd6744b65864e48
.xword 0x0628b60f3295c1d1
.xword 0x0776934048b6b81e
.xword 0x841b25ab31df7eac
.xword 0x3b3003f4087ccaed




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
.xword 0xdb086292d08783fd
.xword 0x7f03efaff873d239
.xword 0xb43c28f84a5f34ad
.xword 0xa313000b17a34b99
.xword 0x4b298bb7ee4aa71c
.xword 0x4568e47006fe69a3
.xword 0xda9055734a9e8d1f
.xword 0xfbd92603d44efb26




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
.xword 0xd629eeb77ac2557d
.xword 0x1d372a07163f51a6
.xword 0x7bcf74c5ac8bd0d1
.xword 0x16d46122fff3dd92
.xword 0x116d0884c8ff00fa
.xword 0x5e54831f5070da03
.xword 0xa05157a32f9bf5de
.xword 0x4edaf4adc2ac0988




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
.xword 0x35a53bf94568933f
.xword 0xcc50a216eb3ecb34
.xword 0x28105ed1ed7bf134
.xword 0x73b98af15e818873
.xword 0x18b423f24cd50ec7
.xword 0x73d68234ae13df53
.xword 0xa83bc773ae7542b8
.xword 0x1efb48c05e9254f7




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
.xword 0xe5f092d4774d1491
.xword 0x64c805b2bc3736cf
.xword 0x766f23b54778cf90
.xword 0xbfdec6e3deb579f7
.xword 0x65aced3cf343cb36
.xword 0x958f37beb0545102
.xword 0x3104efd166ffbc00
.xword 0x094acc3b7d0a182b






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
.xword 0xf3c1e1c24227eb47
.xword 0x761c8a233a6863c1
.xword 0x909e81dc2b493483
.xword 0x914d409a73297afa
.xword 0x922b57fd5cddad1d
.xword 0xf6b7879fe1c0535c
.xword 0x978abe7117100917
.xword 0xf5ce3a6d8152b471




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
.xword 0x99e995db72524eee
.xword 0x3642f0922afc1c15
.xword 0x1b95d606d709c501
.xword 0xf259ef80cb4d4308
.xword 0xc176a3b94db32783
.xword 0xb0007d183514c5d7
.xword 0x612275f4e789611e
.xword 0xff906d3396b78069




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
.xword 0x636ee9c72a849260
.xword 0x5e9e311f17c6d5fd
.xword 0x9589f793b1e883c4
.xword 0xd1c32e36a0d79ac5
.xword 0x993479403ec0a44d
.xword 0x6ec431a55ad4f161
.xword 0x375c8d5ef246ba7c
.xword 0x5c05516ef81cf46c




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
.xword 0x70bcbcde77def026
.xword 0x1fc88d025ed03b1b
.xword 0x966996ee78745813
.xword 0xb34db4a9f2c00f41
.xword 0x0e6985ad561286a6
.xword 0x43396a214673401a
.xword 0x5fa978b6fdbdd87d
.xword 0x7d69b0cdedc549fa




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
.xword 0x4599f78bbab8cba6
.xword 0x3f9e1767b769f214
.xword 0xa15f93abd6851943
.xword 0x34ed5ff07bb24d9b
.xword 0x86019067d6a192d1
.xword 0x5f2706c2a0d0e92c
.xword 0xacc698ee4a5b8557
.xword 0x0e29a006796651a3




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
.xword 0x9b95a790c443dc06
.xword 0x11b90fcba27b9bbf
.xword 0x672e241f86f15c91
.xword 0x9986f56722fe6691
.xword 0xb758bd2c224de6ff
.xword 0xcd860a31a37b6ba2
.xword 0xd60f3403e1266ae9
.xword 0x2f4b24341428172b




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
.xword 0x9b83d3e3a894addd
.xword 0x9ee31ea7a48ba868
.xword 0x0e5b1bb6345b305d
.xword 0x32641b8b0530f987
.xword 0x6754281678d7fb95
.xword 0x150dc20fdf378493
.xword 0xe9237f3c065fd082
.xword 0xb79b27df0443666d




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
.xword 0x3cb846e975d8d86a
.xword 0x9b39d9ae5733f012
.xword 0xc4ad7b3c5986d0ef
.xword 0xe8a5600c8868d34f
.xword 0x9630c56570fdf7f8
.xword 0x4b1c431c8dc3b0a6
.xword 0x6827ef326205833f
.xword 0x4b6a59d3c86a93b3






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
.xword 0x257e578f7459c61d
.xword 0x11f3c95f5166f8e5
.xword 0x504778823c981da7
.xword 0x7331ae10ed6f8504
.xword 0x8d961d4e1800dd64
.xword 0xf8c7ea7adc35db3d
.xword 0xdf3676982628f89b
.xword 0x1828e08756383775




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
.xword 0x8648f73c596057c6
.xword 0xea099c72fba4ea10
.xword 0xf51cee41ae2bab0f
.xword 0x754f940694f77eb2
.xword 0xec0fd87abd9822b5
.xword 0xc65958109c93dcab
.xword 0x1d8f79092b4a3026
.xword 0x55bd11a97f364fe4




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
.xword 0x9ef04c820d51edf3
.xword 0x16518d8e4befde7e
.xword 0x14130ed3f2780869
.xword 0x88ab298856cf9be3
.xword 0xd1d3c9d6305ab1de
.xword 0x7877430212e9ad0e
.xword 0x1bcbd432b3325e81
.xword 0x7646139e25220f2f




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
.xword 0x684c23ac810d0033
.xword 0x36b9e4a861efe7ce
.xword 0x4e047399efa8b8e6
.xword 0x68b7ebd2d95ffb56
.xword 0x03155f7b0c761c80
.xword 0x9d6dd1d7757bb202
.xword 0x85731beea3e8e06f
.xword 0xf9108eedb80ff50a




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
.xword 0x829bc942b323d095
.xword 0x84fc141ab20b5d81
.xword 0xca88d0b73dc15a65
.xword 0x7850c90f4bffa01c
.xword 0xb5459482a8482701
.xword 0x9fd98753768ec5e1
.xword 0x8d21bbac95525516
.xword 0x77bd1492d1bf4592




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
.xword 0x885ad64c5592f248
.xword 0x15f9df52e5a98554
.xword 0x1ffa1ed4d5235256
.xword 0x31b1f61b356b00a8
.xword 0xa31c1172a0a5fda0
.xword 0xca559a7235224072
.xword 0x9323d01a00e6be63
.xword 0xb198cf8a957c19e3




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
.xword 0xe6fe406aac03b325
.xword 0x86d254d3889addc0
.xword 0x76439d4de73d31b9
.xword 0x71833e39383292a0
.xword 0x87ab8116eb4644f4
.xword 0xba54663f55adb813
.xword 0x7c4e77f6cb8ced82
.xword 0xdf6e37fded156ffd




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
.xword 0xd6ae777bd5a073b9
.xword 0xddcdfaace854fb35
.xword 0x546ec5ceea840ec6
.xword 0xd2ee47ab2bcdcf4a
.xword 0x3794824bf4973066
.xword 0x9304a8fe3d7e5938
.xword 0x0a05d84165aec103
.xword 0x751cfab7212a3bf7






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
.xword 0x1bef688a0855c3cd
.xword 0xf689bb39b06df2f9
.xword 0xebd797a862652c19
.xword 0x7b3da8a130a21a4b
.xword 0xc937d76a511a8664
.xword 0xf1a65c5e4f8b68ed
.xword 0x9c092055cfa8a3b4
.xword 0xbce14a4fd39e5093




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
.xword 0xb5ad72b6997f6899
.xword 0x91d7879be0ca3fde
.xword 0x8eefb7c0d7c53d2a
.xword 0xa01e70ac30c3fd21
.xword 0x58d441f4582800d6
.xword 0xbcf7be18fc0c15b4
.xword 0x41152f08721be400
.xword 0xc8f6f6955552078c




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
.xword 0xc8c7b311ff938465
.xword 0x40daa3f1aa803cdf
.xword 0x2d83d9244df57821
.xword 0x3e0b9005466b1d17
.xword 0x0731f78cd082ddc7
.xword 0xa2a981379ef34bcd
.xword 0x90d610b6b0dc1645
.xword 0xa1350e7352493ee8




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
.xword 0xe245291aafa3069f
.xword 0xfa03d6384dc7e860
.xword 0xb65de103ec33a658
.xword 0x7ad7340815b18da7
.xword 0xaa7c2e79bcc75a8b
.xword 0x44df64f9c24df98b
.xword 0x2acd18857f0dc0f7
.xword 0x8abb2fa9946afdb9




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
.xword 0xde4b42c1c03701e1
.xword 0x39ac698fba645e2e
.xword 0x88e837e3d9700aa0
.xword 0x860a3ea1af4889b9
.xword 0xa5231b0dbb4c991c
.xword 0xede2d7312f9db29e
.xword 0x70cd275057edc01d
.xword 0x8d92a370a4a09f71




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
.xword 0xf2f37db18f8880f3
.xword 0x3dd8c4cbf25612be
.xword 0x0f38816037ea7dc8
.xword 0xa5c4400ffa82d2f2
.xword 0x7ea572f764185743
.xword 0xf14d04477077b644
.xword 0x9ce55b56734b4595
.xword 0x34e212e81c0b8782




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
.xword 0xcf773756689481d4
.xword 0x97ecda82854d5912
.xword 0x2246e281cd5a1772
.xword 0xeff8a38cf6e7d5d2
.xword 0x0ebd62bc7a45f55c
.xword 0xd8a8c8d9599d5924
.xword 0x07364c386a30f10b
.xword 0xae09b5d3dd9ff4d0




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
.xword 0xd166faca90dd08c9
.xword 0xb15e37e3e282dd2a
.xword 0xc76e5800752bc6ca
.xword 0x00b09328bcabe456
.xword 0x6111e11de87b9261
.xword 0xd352005f18bf6986
.xword 0x6105cdbd88ecc725
.xword 0xdd738916dd988db5






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
.xword 0x5ee3e2288c277c75
.xword 0x9f5a2692969cbebb
.xword 0x4c8c8b06631a0e95
.xword 0xc0a77b0a3b7ba339
.xword 0x94f642b179c214e7
.xword 0xdf44282dd06f34f0
.xword 0xfc9a2fd54144b74c
.xword 0x63ffaa3483e4a845




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
.xword 0x15c4f854c0a887ee
.xword 0x43e37b3e90fab329
.xword 0x19b18de4c1c4e397
.xword 0x7362987211e33ed5
.xword 0xc36063f6767b9b40
.xword 0xbc6d71db9f631228
.xword 0x8ec65142bf97b75c
.xword 0xabd13f4718623375




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
.xword 0xc7a0766bb0016974
.xword 0xbc01d348ad45e09d
.xword 0xe3c86be7b48621f2
.xword 0xd466f9ea1159d063
.xword 0xb6728269cab0a591
.xword 0x4872578996ade69d
.xword 0x7a9f1f4cd764cf5f
.xword 0x7249b4ce1c4f365a




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
.xword 0x2d89c93c50232d96
.xword 0x4fbd64ef9c357212
.xword 0xdda3d16690b356cf
.xword 0x7ce55de7c916c371
.xword 0x387a41dd33ebc655
.xword 0xd1872f5e2e42cf6a
.xword 0x8cc78f5545e88fdf
.xword 0x097047dad59db043




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
.xword 0xb5c578f5e3c69de7
.xword 0xe5a43066f1ebbed7
.xword 0x47886ff6d9725473
.xword 0xa1c6faf0cfaf24c8
.xword 0xcc2c105b262784a2
.xword 0xc9643525888dbcf0
.xword 0x1acb0e7c93ec4fe0
.xword 0xe3e96cd38171d43a




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
.xword 0xf9dccb2d58150751
.xword 0x97718b7086ae17e7
.xword 0xe1bc31e138e5e48f
.xword 0xf9ef888b8af6b342
.xword 0x7271b4d9ed7adb88
.xword 0x726dd38f1506a784
.xword 0x886eaf8f64ec59f9
.xword 0xf5f4509f17d7b65d




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
.xword 0x903dca8cacb7da0b
.xword 0xd1c6d9e08c3d7522
.xword 0x57a08456661b5b27
.xword 0x4ee71da3778b1087
.xword 0x6231ffd5c7d0a67e
.xword 0x61cb8980637d1074
.xword 0x7ef9d4a8d44975c4
.xword 0x0e0a7808b6e7bc03




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
.xword 0x76fda9a7360844a1
.xword 0xaab1ad587244ec4b
.xword 0x942f70792a49774d
.xword 0xb272c24dd4ccd347
.xword 0xa4c3de6d01484247
.xword 0x13b5d77a1d73fda4
.xword 0xb6f35c5b2dcc8412
.xword 0x551ab8bd90a7f029






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
.xword 0xbd7a7799862fc864
.xword 0x1509a9f636f7fa75
.xword 0xc5e260d155fd31c8
.xword 0xffd26257462599c1
.xword 0xdc757bb5f5491072
.xword 0x8d4a323b415be183
.xword 0xc9df4addd8de867f
.xword 0x5b00ee4264d4afb7




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
.xword 0xe2a282ea8d230fb6
.xword 0x27e8d589c2ad6272
.xword 0x17c9d263f0c9b0ec
.xword 0xec73cf6accb55d7e
.xword 0xe698bafa923a38c0
.xword 0xa8b180f34c37bffb
.xword 0xf782703b8304fb50
.xword 0x09004c981eccf2d0




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
.xword 0x031e7b37ae1579e6
.xword 0x478f964468b5a2e2
.xword 0x29fe49de71f519cf
.xword 0xb16a2dcc87694787
.xword 0xf8a243aee4d41982
.xword 0x849349fb9c7a9867
.xword 0x170ab674af003c33
.xword 0x1cb91062ef846a5f




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
.xword 0xd5c3e7f0e4f2b36b
.xword 0xa9c9188388cfc936
.xword 0x6effbda58e16c559
.xword 0xbd362f5426dfca82
.xword 0xc290500779d226c5
.xword 0xe310130d724d14b4
.xword 0x45154d76efeef906
.xword 0x437f9f91364d7c2e




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
.xword 0x3990eeee2e4a3448
.xword 0xba8b9b76e3bcbea6
.xword 0xaf53daea6c2b97da
.xword 0xaa9a21e5896079c1
.xword 0x5e55146fe9c8b74e
.xword 0xbf39c766a1e21e4d
.xword 0xef01530d57f1a5a7
.xword 0x1df3c8e4b30dd352




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
.xword 0xd2aedbcab924f6e2
.xword 0x71a92fc80d4b6282
.xword 0x099618e22a1d2676
.xword 0x9b97d2b680dc47a1
.xword 0xcb4fa96c7ca93ee4
.xword 0x3053e38d78d1c5d4
.xword 0x7f5a1790ed606e3e
.xword 0x21b3067f0cdd0e4a




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
.xword 0x5d7ea757c45c8777
.xword 0xaf547a164547706e
.xword 0xb88e48a35bb69acf
.xword 0x966f8c410808099a
.xword 0x2346d730ad9e690c
.xword 0xf51e07bc0f237dc5
.xword 0x60074ab5bd65a65d
.xword 0x02b6b93d82b86b4a




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
.xword 0xd17f1fbdcccd1a53
.xword 0x982f3b6134f06a80
.xword 0x8854b95b90740830
.xword 0x59b5089c9222fa4e
.xword 0xe775ee47385ae0ca
.xword 0xf7278778b9a4e009
.xword 0x1d7239edbdc13f08
.xword 0x93e49622b4adc41a






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
.xword 0xdd493aff588b6c61
.xword 0x46fb492022413e58
.xword 0xf03b6597ea5366fb
.xword 0xac34f72f0bb7dfa5
.xword 0x0aa727e369ff6c0a
.xword 0xf9d5cfb17fa4e517
.xword 0xb1a15af9a3c83338
.xword 0xa77d7e4a4f82fc0b




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
.xword 0x0766d54d0cb100b7
.xword 0x49ff4ef4c0d671c6
.xword 0xe4b962a133c806dd
.xword 0x3abd7ff7024d23df
.xword 0x448e4f39ecfc0755
.xword 0xf4ca632232a62250
.xword 0xc55499f59721c559
.xword 0x85527ace504577ac




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
.xword 0x4e26edca75fe565d
.xword 0x17ef5880259c4335
.xword 0x58e0fb4124e50350
.xword 0x69b3e5140f883403
.xword 0x861c83687cfcb0d7
.xword 0x732439e52be95cc5
.xword 0xe2b9057ea2358f53
.xword 0x891f76a72a545176




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
.xword 0x26614ed884dd7f43
.xword 0x38bf0590d8e2f75a
.xword 0x0f2b659a9d735690
.xword 0x20ba673789167b34
.xword 0xb849512ec6650525
.xword 0xe5d50e4726d9345d
.xword 0x46c061ab62be427c
.xword 0xcb0baf461b7d5561




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
.xword 0x97475a30414f07ae
.xword 0xabbce9c86f35e6f9
.xword 0xcde1f1148f339e63
.xword 0xb04e61123208d72c
.xword 0x1274c15ad76c7a31
.xword 0x4a6b728353909036
.xword 0x36d4c42a4db38335
.xword 0x9b3eb155f9efe615




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
.xword 0xd87d22676afbabdd
.xword 0x9da8dc15880d3551
.xword 0xe79b1856895a66b8
.xword 0x5bb2093398cedab2
.xword 0xa36881d2a5ffa743
.xword 0x7961e992ff82b39e
.xword 0x0c77b0f30b613691
.xword 0x6438b0995da24538




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
.xword 0x91e58fc2331d8eb0
.xword 0xf12078b5a39f311d
.xword 0x23825e309663e6b6
.xword 0x580ca7824d67f5a5
.xword 0x1a8fd40eb748701c
.xword 0xa32cbc8db3db55c6
.xword 0xa8e82f3912bf3cc6
.xword 0xe57b78fc96477739




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
.xword 0x7290cbfec6b4c5a0
.xword 0x3ac5e8e8f40d24ed
.xword 0xf62c1e75dafd9659
.xword 0x3d481aa178ed3d25
.xword 0x7e492fb66fcb3707
.xword 0x437bf27259a356ea
.xword 0xf0c6c7f5d9f18b15
.xword 0xf2418c0c3af1e2b8






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
.xword 0xe9c6cb67b3229e2b
.xword 0x26c690554bee3736
.xword 0x6f121a2481c841c1
.xword 0x36c531670ddc34a3
.xword 0xa6d9a90fdb97f3a2
.xword 0x495ee220f1c88766
.xword 0x2b75a642248b1726
.xword 0x04606dd244407de3




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
.xword 0x9e18068b6ed958b3
.xword 0xf09582dfd98618a8
.xword 0x5b8c0e9985f1963b
.xword 0x19a1ce65807caec3
.xword 0x74278cf837c90f98
.xword 0x127716fb4c76029a
.xword 0xda79bbec48594dde
.xword 0xcd080d53e4c48fee




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
.xword 0x0a1693147bc21716
.xword 0x6dd5d4e3f1248c52
.xword 0x80054ce89d739593
.xword 0x99e8a75082b781eb
.xword 0x48f097cdeecbc3cd
.xword 0xac7adf65fe64ef0e
.xword 0x9cc42bc74c630ec4
.xword 0x107a5b469096e643




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
.xword 0x6d7e67c1d8bf6d46
.xword 0x0ea5c9db65024094
.xword 0x3de7eb14f6f7de37
.xword 0x43760d4f30644ad0
.xword 0xd88b30a91dacb8ba
.xword 0xd6a7dbea3bb84a23
.xword 0x9e563ff4a30bb986
.xword 0x81ecc5ec6cd75942




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
.xword 0xe1e9c7850dd38ee1
.xword 0x400f213e948d3301
.xword 0x6301afc71d94977b
.xword 0x659bd811d33e1b39
.xword 0x799a51aa819c1999
.xword 0x9628e69b5517d0d0
.xword 0x0117e48aa43fa605
.xword 0x9b3f8259065332b6




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
.xword 0x6ab969286cb57c07
.xword 0xe80e59693bdd6f1a
.xword 0x1de306c054bc27d4
.xword 0x83004aa7b2ba849b
.xword 0x8b4e62cd3411b309
.xword 0x50d7ec203ea41ba5
.xword 0x47a8869291e170bd
.xword 0xeef544eacba3bf03




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
.xword 0x4a57441f1d0ef158
.xword 0x479671694944b697
.xword 0x1382420151e9c8bf
.xword 0xab11129bda82e0ae
.xword 0x0ae2e99bc8b7989c
.xword 0x9f7defffdd2e6605
.xword 0xc11f5802095057cc
.xword 0x4b908f909ec33c08




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
.xword 0xd58d200a9d37d8b6
.xword 0xeae421ed062d351a
.xword 0x2348707e6a041364
.xword 0x088c9d65b478500e
.xword 0x76f3df9c0cb485c7
.xword 0x74aab6e3d052a3b9
.xword 0xcaa0e274b6fbe032
.xword 0x7eb919b5aec0b955




#if 0
#endif
