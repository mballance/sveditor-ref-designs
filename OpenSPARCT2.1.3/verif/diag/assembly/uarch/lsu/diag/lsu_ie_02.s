/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_02.s
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
	setx 0x019fd40c6582bb02, %g1, %r2
	setx 0xfb6681f2b503df3c, %g1, %r3
	setx 0x785e2dd0eca26123, %g1, %r4
	setx 0x7cd9ee1ced2452e6, %g1, %r5
	setx 0xae469ec005be5747, %g1, %r6
	setx 0x95b6720e661c982d, %g1, %r7
	setx 0x0cae734f94b0c650, %g1, %r8

     mov %r2, %r1
CHANGE_PRIV0:
	ta	T_CHANGE_PRIV
CHANGE_R261:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP1:
	.word 0xc4ae455a  ! 2: STBA_R	stba	%r2, [%r25 + %r26] 0x2a
	.word 0xcab4101a  ! 4: STHA_R	stha	%r5, [%r16 + %r26] 0x80
NC_NUC2:
	.word 0xcadd409a  ! 6: LDXA_R	ldxa	[%r21, %r26] 0x04, %r5
	.word 0xcb9ad01a  ! 7: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xca2b001a  ! 8: STB_R	stb	%r5, [%r12 + %r26]
CHANGE_R263:
	add	%r26,	%r27,	%r26
CP_BIS_SEC3:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 10: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
	.word 0xcb84d13a  ! 12: LDFA_R	lda	[%r19, %r26], %f5
	.word 0xcb9c903a  ! 14: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcadc913a  ! 16: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
NC_BIS_AIUS4:
	.word 0xc8afc57a  ! 18: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
NC_BIS_SEC5:
	.word 0xd0b4dc7a  ! 20: STHA_R	stha	%r8, [%r19 + %r26] 0xe3
WR_LEASI_6:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_7:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcaaa911a  ! 22: STBA_R	stba	%r5, [%r10 + %r26] 0x88
	.word 0xca7b6018  ! 23: SWAP_I	swap	%r5, [%r13 + 0x0018]
	.word 0xcb9c501a  ! 25: LDDFA_R	ldda	[%r17, %r26], %f5
SET_TL1_8:
	ta	T_CHANGE_TO_TL1
CHANGE_R269:
	add	%r26,	%r27,	%r26
NC_BIS_NUC9:
	.word 0xc4a545fa  ! 27: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xca7b401a  ! 28: SWAP_R	swap	%r5, [%r13 + %r26]
NC_BIS_AIUS10:
	.word 0xc8afc47a  ! 30: STBA_R	stba	%r4, [%r31 + %r26] 0x23
	.word 0xcb9ad01a  ! 31: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcbbb501a  ! 32: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcb82905a  ! 33: LDFA_R	lda	[%r10, %r26], %f5
NC_AIUP11:
	.word 0xcaae421a  ! 35: STBA_R	stba	%r5, [%r25 + %r26] 0x10
	.word 0xca8cd03a  ! 37: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
NC_NUC12:
	.word 0xca95409a  ! 39: LDUHA_R	lduha	[%r21, %r26] 0x04, %r5
CP_AIUS13:
	.word 0xcacf823a  ! 41: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r5
CP_BIS_AIUP14:
	and	%r26,	%r28,	%r26
	.word 0xc49e055a  ! 43: LDDA_R	ldda	[%r24, %r26] 0x2a, %r2
	.word 0xcba3511a  ! 44: STFA_R	sta	%f5, [%r26, %r13]
CP_NUC15:
	.word 0xc8bd019a  ! 46: STDA_R	stda	%r4, [%r20 + %r26] 0x0c
	.word 0xcb9b901a  ! 48: LDDFA_R	ldda	[%r14, %r26], %f5
SET_TL0_16:
	ta	T_CHANGE_TO_TL0
CHANGE_R2617:
	add	%r26,	%r27,	%r26
NC_BIS_SEC17:
	.word 0xc4b4dc7a  ! 50: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
CP_BIS_QUAD_LD18:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 52: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc8bc903a  ! 54: STDA_R	stda	%r4, [%r18 + %r26] 0x81
SHORT_FP_PRI19:
	.word 0xcb9b1a5a  ! 56: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcadc913a  ! 58: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CHANGE_PRIV20:
	ta	T_CHANGE_PRIV
CHANGE_R2621:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP21:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 60: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
	.word 0xcaa4d03a  ! 62: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	.word 0xcba4d03a  ! 64: STFA_R	sta	%f5, [%r26, %r19]
CP_AIUP22:
	.word 0xcaae021a  ! 66: STBA_R	stba	%r5, [%r24 + %r26] 0x10
NC_BIS_AIUP23:
	.word 0xd0ae455a  ! 68: STBA_R	stba	%r8, [%r25 + %r26] 0x2a
	.word 0xcac2905a  ! 69: LDSWA_R	ldswa	[%r10, %r26] 0x82, %r5
CP_BIS_QUAD_LD24:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 71: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xcba4101a  ! 73: STFA_R	sta	%f5, [%r26, %r16]
	.word 0xca94101a  ! 75: LDUHA_R	lduha	[%r16, %r26] 0x80, %r5
NC_BLK_SEc25:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 77: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUS26:
	.word 0xca97833a  ! 79: LDUHA_R	lduha	[%r30, %r26] 0x19, %r5
CHANGE_USER27:
	ta	T_CHANGE_NONPRIV
CHANGE_R2628:
	add	%r26,	%r27,	%r26
CP_BIS_PRI28:
	and	%r26,	%r28,	%r26
	.word 0xc4f31d5a  ! 81: STXA_R	stxa	%r2, [%r12 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS30:
	.word 0xca8fc23a  ! 83: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xc8bb911a  ! 85: STDA_R	stda	%r4, [%r14 + %r26] 0x88
CP_NUC31:
	.word 0xcaf5009a  ! 87: STXA_R	stxa	%r5, [%r20 + %r26] 0x04
NC_PST_PRI32:
	.word 0xcbbc181a  ! 89: STDFA_R	stda	%f5, [%r26, %r16]
CP_PST_PRI33:
	.word 0xcbbad81a  ! 91: STDFA_R	stda	%f5, [%r26, %r11]
NC_BIS_SEC34:
	.word 0xccacdd7a  ! 93: STBA_R	stba	%r6, [%r19 + %r26] 0xeb
CP_ATM_QUAD_LD35:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 95: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
SHORT_FP_PRI36:
	.word 0xcbbada1a  ! 97: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xca5ae018  ! 98: LDX_I	ldx	[%r11 + 0x0018], %r5
CHANGE_TLE37:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BLK_SEc38:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 101: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcaa4d03a  ! 103: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
SHORT_FP_PRI39:
	.word 0xcb9a9a1a  ! 105: LDDFA_R	ldda	[%r10, %r26], %f5
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP41:
	.word 0xcab6021a  ! 107: STHA_R	stha	%r5, [%r24 + %r26] 0x10
CP_AIUP42:
	.word 0xc89e031a  ! 109: LDDA_R	ldda	[%r24, %r26] 0x18, %r4
	.word 0xcbba901a  ! 110: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca4b601b  ! 111: LDSB_I	ldsb	[%r13 + 0x001b], %r5
NC_PST_PRI43:
	.word 0xcbbb985a  ! 113: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcb9c913a  ! 115: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xca94903a  ! 117: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcadcd13a  ! 119: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
NC_BIS_AIUP44:
	.word 0xc4b6445a  ! 121: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xcb83515a  ! 122: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xca6a801a  ! 123: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
CP_AIUS45:
	.word 0xcaa7833a  ! 125: STWA_R	stwa	%r5, [%r30 + %r26] 0x19
	.word 0xca7aa018  ! 126: SWAP_I	swap	%r5, [%r10 + 0x0018]
CP_BIS_NUC46:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 128: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
	.word 0xcaac903a  ! 130: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_BLK_SEc47:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 132: LDDFA_R	ldda	[%r19, %r26], %f16
SET_TL1_48:
	ta	T_CHANGE_TO_TL1
CHANGE_R2649:
	add	%r26,	%r27,	%r26
NC_BIS_NUC49:
	.word 0xc4f544fa  ! 134: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_BIS_NUC50:
	.word 0xd0a544fa  ! 136: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
	.word 0xca8cd03a  ! 138: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xca236018  ! 139: STW_I	stw	%r5, [%r13 + 0x0018]
	.word 0xcaa4903a  ! 141: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xca23401a  ! 142: STW_R	stw	%r5, [%r13 + %r26]
	.word 0xcaccd13a  ! 144: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
	.word 0xca0a801a  ! 145: LDUB_R	ldub	[%r10 + %r26], %r5
SHORT_FP_PRI51:
	.word 0xcb9a9b1a  ! 147: LDDFA_R	ldda	[%r10, %r26], %f5
CP_ATM_QUAD_LD52:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 149: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
CP_AIUP53:
	.word 0xca86021a  ! 151: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r5
CP_BIS_NUC54:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 153: STBA_R	stba	%r8, [%r20 + %r26] 0x27
	.word 0xcb1b401a  ! 154: LDDF_R	ldd	[%r13, %r26], %f5
	.word 0xca432018  ! 155: LDSW_I	ldsw	[%r12 + 0x0018], %r5
SHORT_FP_PRI55:
	.word 0xcbba9b1a  ! 157: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_AIUP56:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 159: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
	.word 0xcbf2e01a  ! 160: CASXA_R	casxa	[%r11]%asi, %r26, %r5
	.word 0xcb9cd03a  ! 162: LDDFA_R	ldda	[%r19, %r26], %f5
CP_ATM_QUAD_LD57:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 164: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
CP_PST_PRI58:
	.word 0xcbbb591a  ! 166: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcaa4903a  ! 168: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
NC_AIUS59:
	.word 0xc89fc23a  ! 170: LDDA_R	ldda	[%r31, %r26] 0x11, %r4
NC_AIUP60:
	.word 0xca96421a  ! 172: LDUHA_R	lduha	[%r25, %r26] 0x10, %r5
	.word 0xcacb911a  ! 174: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r5
CP_BIS_AIUP61:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 176: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
SET_TL0_62:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI63:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 178: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CHANGE_PRIV64:
	ta	T_CHANGE_PRIV
CHANGE_R2665:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS65:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 180: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xcbf3201a  ! 181: CASXA_R	casxa	[%r12]%asi, %r26, %r5
CP_PST_PRI66:
	.word 0xcbba989a  ! 183: STDFA_R	stda	%f5, [%r26, %r10]
NC_AIUP67:
	.word 0xcade421a  ! 185: LDXA_R	ldxa	[%r25, %r26] 0x10, %r5
SET_TL1_68:
	ta	T_CHANGE_TO_TL1
CHANGE_R2669:
	add	%r26,	%r27,	%r26
NC_BIS_NUC69:
	.word 0xc4bd44fa  ! 187: STDA_R	stda	%r2, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD70:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 189: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xca84d03a  ! 191: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
CP_ATM_QUAD_LD71:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 193: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
	.word 0xca5ac01a  ! 194: LDX_R	ldx	[%r11 + %r26], %r5
	.word 0xcada901a  ! 195: LDXA_R	ldxa	[%r10, %r26] 0x80, %r5
	.word 0xcba2d11a  ! 196: STFA_R	sta	%f5, [%r26, %r11]
SET_TL0_72:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI73:
	.word 0xc8abdd5a  ! 198: STBA_R	stba	%r4, [%r15 + %r26] 0xea
	.word 0xca84d03a  ! 200: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP75:
	.word 0xca86021a  ! 202: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r5
CP_BIS_AIUP76:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 204: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
	.word 0xc89b911a  ! 206: LDDA_R	ldda	[%r14, %r26] 0x88, %r4
	.word 0xcaf2901a  ! 207: STXA_R	stxa	%r5, [%r10 + %r26] 0x80
	.word 0xcb22a018  ! 208: STF_I	st	%f5, [0x0018, %r10]
	.word 0xcacb901a  ! 210: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r5
NC_BIS_AIUP77:
	.word 0xc8a6455a  ! 212: STWA_R	stwa	%r4, [%r25 + %r26] 0x2a
WR_LEASI_78:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_79:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcacc511a  ! 215: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r5
CHANGE_USER80:
	ta	T_CHANGE_NONPRIV
CHANGE_R2681:
	add	%r26,	%r27,	%r26
CP_BIS_PRI81:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 217: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xcadcd13a  ! 219: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
	.word 0xca8c903a  ! 221: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS83:
	.word 0xcba7833a  ! 223: STFA_R	sta	%f5, [%r26, %r30]
	.word 0xca7aa018  ! 224: SWAP_I	swap	%r5, [%r10 + 0x0018]
CP_BIS_NUC84:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 226: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
CHANGE_USER85:
	ta	T_CHANGE_NONPRIV
CHANGE_R2686:
	add	%r26,	%r27,	%r26
NC_BIS_PRI86:
	.word 0xd0bbdc5a  ! 228: STDA_R	stda	%r8, [%r15 + %r26] 0xe2
NC_BIS_PRI87:
	.word 0xc4f41c5a  ! 230: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
CHANGE_PRIV88:
	ta	T_CHANGE_PRIV
CHANGE_R2689:
	mov	%g0,	%r26
CP_BIS_AIUP89:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 232: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xca93911a  ! 234: LDUHA_R	lduha	[%r14, %r26] 0x88, %r5
NC_BIS_AIUP90:
	.word 0xc4b6445a  ! 236: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xca94511a  ! 238: LDUHA_R	lduha	[%r17, %r26] 0x88, %r5
	.word 0xca32801a  ! 239: STH_R	sth	%r5, [%r10 + %r26]
	.word 0xcaac913a  ! 241: STBA_R	stba	%r5, [%r18 + %r26] 0x89
CP_ATM_QUAD_LD91:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 243: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
	.word 0xcadc913a  ! 245: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
BLK_PRI92:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 247: STDFA_R	stda	%f16, [%r26, %r13]
CP_AIUS93:
	.word 0xcb9f823a  ! 249: LDDFA_R	ldda	[%r30, %r26], %f5
CP_AIUP94:
	.word 0xca96021a  ! 251: LDUHA_R	lduha	[%r24, %r26] 0x10, %r5
CHANGE_R2695:
	add	%r26,	%r27,	%r26
CP_BIS_SEC95:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 253: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
	.word 0xcb22c01a  ! 254: STF_R	st	%f5, [%r26, %r11]
	.word 0xcbba911a  ! 255: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcaac903a  ! 257: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xca93901a  ! 259: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
CP_BIS_NUC96:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 261: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
CP_NUC97:
	.word 0xca95009a  ! 263: LDUHA_R	lduha	[%r20, %r26] 0x04, %r5
CP_ATM_QUAD_LD98:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 265: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
	.word 0xcb9a915a  ! 266: LDDFA_R	ldda	[%r10, %r26], %f5
NC_NUC99:
	.word 0xc8bd419a  ! 268: STDA_R	stda	%r4, [%r21 + %r26] 0x0c
CP_AIUP100:
	.word 0xcade031a  ! 270: LDXA_R	ldxa	[%r24, %r26] 0x18, %r5
	.word 0xca8cd03a  ! 272: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
NC_BIS_AIUP101:
	.word 0xc8b6445a  ! 274: STHA_R	stha	%r4, [%r25 + %r26] 0x22
BLK_PRI102:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 276: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc83b001a  ! 277: STD_R	std	%r4, [%r12 + %r26]
NC_PST_PRI103:
	.word 0xcbbc199a  ! 279: STDFA_R	stda	%f5, [%r26, %r16]
CHANGE_R26104:
	add	%r26,	%r27,	%r26
CP_BIS_SEC104:
	and	%r26,	%r28,	%r26
	.word 0xccf49c7a  ! 281: STXA_R	stxa	%r6, [%r18 + %r26] 0xe3
	.word 0xcaab501a  ! 282: STBA_R	stba	%r5, [%r13 + %r26] 0x80
	.word 0xcaccd13a  ! 284: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
NC_PST_PRI105:
	.word 0xcbbc599a  ! 286: STDFA_R	stda	%f5, [%r26, %r17]
NC_BIS_AIUP106:
	.word 0xccb6455a  ! 288: STHA_R	stha	%r6, [%r25 + %r26] 0x2a
SHORT_FP_PRI107:
	.word 0xcb9a9b1a  ! 290: LDDFA_R	ldda	[%r10, %r26], %f5
CHANGE_USER108:
	ta	T_CHANGE_NONPRIV
CHANGE_R26109:
	add	%r26,	%r27,	%r26
NC_BIS_PRI109:
	.word 0xccab9d5a  ! 292: STBA_R	stba	%r6, [%r14 + %r26] 0xea
NC_BLK_SEc110:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 294: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xca84d13a  ! 296: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
	.word 0xcadc903a  ! 298: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xcba2901a  ! 299: STFA_R	sta	%f5, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC112:
	.word 0xcaed009a  ! 301: LDSTUBA_R	ldstuba	%r5, [%r20 + %r26] 0x04
BLK_PRI113:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5f1a  ! 303: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xca8cd03a  ! 305: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
CHANGE_CLE114:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcba3111a  ! 307: STFA_R	sta	%f5, [%r26, %r12]
	.word 0xcafb101a  ! 308: SWAPA_R	swapa	%r5, [%r12 + %r26] 0x80
BLK_PRI115:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 310: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_CLE116:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_PRI117:
	and	%r26,	%r28,	%r26
	.word 0xc8a29d5a  ! 313: STWA_R	stwa	%r4, [%r10 + %r26] 0xea
	.word 0xcad4101a  ! 315: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r5
BLK_PRI118:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 317: LDDFA_R	ldda	[%r10, %r26], %f0
CHANGE_PRIV119:
	ta	T_CHANGE_PRIV
CHANGE_R26120:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP120:
	and	%r26,	%r28,	%r26
	.word 0xcc9e055a  ! 319: LDDA_R	ldda	[%r24, %r26] 0x2a, %r6
	.word 0xcba2901a  ! 320: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcbbcd03a  ! 322: STDFA_R	stda	%f5, [%r26, %r19]
CHANGE_USER121:
	ta	T_CHANGE_NONPRIV
CHANGE_R26122:
	add	%r26,	%r27,	%r26
CP_BIS_PRI122:
	and	%r26,	%r28,	%r26
	.word 0xd0aa9c5a  ! 324: STBA_R	stba	%r8, [%r10 + %r26] 0xe2
	.word 0xcaac903a  ! 326: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_BLK_SEc123:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 328: LDDFA_R	ldda	[%r19, %r26], %f16
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP125:
	.word 0xcb9e421a  ! 330: LDDFA_R	ldda	[%r25, %r26], %f5
	.word 0xcbbb911a  ! 332: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xc83b6018  ! 333: STD_I	std	%r4, [%r13 + 0x0018]
CHANGE_USER126:
	ta	T_CHANGE_NONPRIV
CHANGE_R26127:
	mov	%g0,	%r26
CP_BIS_PRI127:
	and	%r26,	%r28,	%r26
	.word 0xd0a2dd5a  ! 335: STWA_R	stwa	%r8, [%r11 + %r26] 0xea
NC_PST_PRI128:
	.word 0xcbbb981a  ! 337: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcab4903a  ! 339: STHA_R	stha	%r5, [%r18 + %r26] 0x81
SET_TL1_129:
	ta	T_CHANGE_TO_TL1
CHANGE_R26130:
	add	%r26,	%r27,	%r26
NC_BIS_NUC130:
	.word 0xc4a545fa  ! 341: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xcaead11a  ! 342: LDSTUBA_R	ldstuba	%r5, [%r11 + %r26] 0x88
	.word 0xc8bcd03a  ! 345: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xcb3a801a  ! 346: STDF_R	std	%f5, [%r26, %r10]
	.word 0xcacc913a  ! 348: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r5
	.word 0xca02801a  ! 349: LDUW_R	lduw	[%r10 + %r26], %r5
	.word 0xca93d01a  ! 351: LDUHA_R	lduha	[%r15, %r26] 0x80, %r5
	.word 0xcac3901a  ! 353: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
SHORT_FP_PRI131:
	.word 0xcbbb1a5a  ! 355: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcad4d03a  ! 357: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xcba4903a  ! 359: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xc81b001a  ! 360: LDD_R	ldd	[%r12 + %r26], %r4
CP_BIS_NUC132:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 362: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
CP_AIUP133:
	.word 0xcaae021a  ! 364: STBA_R	stba	%r5, [%r24 + %r26] 0x10
SHORT_FP_PRI134:
	.word 0xcbbb5b5a  ! 366: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcb84d03a  ! 368: LDFA_R	lda	[%r19, %r26], %f5
NC_PST_PRI135:
	.word 0xcbbc585a  ! 370: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xcaf4101a  ! 372: STXA_R	stxa	%r5, [%r16 + %r26] 0x80
	.word 0xcba3901a  ! 374: STFA_R	sta	%f5, [%r26, %r14]
	.word 0xcbbb901a  ! 376: STDFA_R	stda	%f5, [%r26, %r14]
SET_TL0_136:
	ta	T_CHANGE_TO_TL0
CHANGE_R26137:
	add	%r26,	%r27,	%r26
NC_BIS_SEC137:
	.word 0xd0bcdc7a  ! 378: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xcadcd03a  ! 380: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP139:
	.word 0xcaa6421a  ! 382: STWA_R	stwa	%r5, [%r25 + %r26] 0x10
NC_SHORT_FP_SEC140:
	.word 0xcb9cda7a  ! 384: LDDFA_R	ldda	[%r19, %r26], %f5
NC_SHORT_FP_SEC141:
	.word 0xcb9cda7a  ! 386: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_TLE142:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcba2d01a  ! 388: STFA_R	sta	%f5, [%r26, %r11]
	.word 0xc89c903a  ! 390: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC144:
	.word 0xcb85419a  ! 392: LDFA_R	lda	[%r21, %r26], %f5
CP_AIUS145:
	.word 0xc89f823a  ! 394: LDDA_R	ldda	[%r30, %r26] 0x11, %r4
CHANGE_USER146:
	ta	T_CHANGE_NONPRIV
CHANGE_R26147:
	add	%r26,	%r27,	%r26
NC_BIS_PRI147:
	.word 0xc4f41d5a  ! 396: STXA_R	stxa	%r2, [%r16 + %r26] 0xea
NC_BLK_SEc148:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 398: LDDFA_R	ldda	[%r19, %r26], %f0
BLK_PRI149:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 400: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xcb9a905a  ! 401: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xca7aa018  ! 402: SWAP_I	swap	%r5, [%r10 + 0x0018]
	.word 0xcb232018  ! 403: STF_I	st	%f5, [0x0018, %r12]
CHANGE_PRIV150:
	ta	T_CHANGE_PRIV
CHANGE_R26151:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS151:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 405: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
	.word 0xca93d11a  ! 407: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
CP_AIUS152:
	.word 0xcac7823a  ! 409: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r5
	.word 0xcaa2901a  ! 410: STWA_R	stwa	%r5, [%r10 + %r26] 0x80
	.word 0xc81b2018  ! 411: LDD_I	ldd	[%r12 + 0x0018], %r4
	.word 0xca8cd13a  ! 413: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
CHANGE_USER153:
	ta	T_CHANGE_NONPRIV
CHANGE_R26154:
	add	%r26,	%r27,	%r26
NC_BIS_PRI154:
	.word 0xc8a45c5a  ! 415: STWA_R	stwa	%r4, [%r17 + %r26] 0xe2
CHANGE_PRIV155:
	ta	T_CHANGE_PRIV
CHANGE_R26156:
	mov	%g0,	%r26
CP_BIS_NUC156:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 417: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xcbbc111a  ! 419: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcb1ac01a  ! 420: LDDF_R	ldd	[%r11, %r26], %f5
BLK_PRI157:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 422: LDDFA_R	ldda	[%r11, %r26], %f16
CHANGE_USER158:
	ta	T_CHANGE_NONPRIV
CHANGE_R26159:
	add	%r26,	%r27,	%r26
CP_BIS_PRI159:
	and	%r26,	%r28,	%r26
	.word 0xc49b1c5a  ! 424: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xcb84d13a  ! 426: LDFA_R	lda	[%r19, %r26], %f5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC161:
	.word 0xcb9d409a  ! 428: LDDFA_R	ldda	[%r21, %r26], %f5
	.word 0xcbe2e01a  ! 429: CASA_R	casa	[%r11] %asi, %r26, %r5
	.word 0xc89cd03a  ! 431: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xc89b901a  ! 433: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
CP_AIUP162:
	.word 0xca8e021a  ! 435: LDUBA_R	lduba	[%r24, %r26] 0x10, %r5
	.word 0xc8bcd03a  ! 437: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc81a801a  ! 438: LDD_R	ldd	[%r10 + %r26], %r4
NC_AIUP163:
	.word 0xcab6421a  ! 440: STHA_R	stha	%r5, [%r25 + %r26] 0x10
	.word 0xc89cd13a  ! 442: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
SHORT_FP_PRI164:
	.word 0xcbba9a5a  ! 444: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcb84903a  ! 446: LDFA_R	lda	[%r18, %r26], %f5
WR_LEASI_165:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_166:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcb9cd03a  ! 449: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcb9c913a  ! 451: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcaa4d03a  ! 453: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CP_BIS_AIUS167:
	and	%r26,	%r28,	%r26
	.word 0xc8bf847a  ! 455: STDA_R	stda	%r4, [%r30 + %r26] 0x23
	.word 0xca8c501a  ! 457: LDUBA_R	lduba	[%r17, %r26] 0x80, %r5
	.word 0xca7a801a  ! 458: SWAP_R	swap	%r5, [%r10 + %r26]
CHANGE_USER168:
	ta	T_CHANGE_NONPRIV
CHANGE_R26169:
	add	%r26,	%r27,	%r26
NC_BIS_PRI169:
	.word 0xc4bbdc5a  ! 460: STDA_R	stda	%r2, [%r15 + %r26] 0xe2
	.word 0xcb22c01a  ! 461: STF_R	st	%f5, [%r26, %r11]
	.word 0xcb84903a  ! 463: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xca6a801a  ! 464: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xc89c903a  ! 466: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CHANGE_PRIV170:
	ta	T_CHANGE_PRIV
CHANGE_R26171:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD171:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 468: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
CP_PST_PRI172:
	.word 0xcbbb195a  ! 470: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcaf4d03a  ! 472: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xc89b901a  ! 474: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
BLK_PRI173:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 476: STDFA_R	stda	%f16, [%r26, %r10]
NC_AIUS174:
	.word 0xcacfc33a  ! 478: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r5
CHANGE_CLE175:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BIS_SEC176:
	.word 0xc4a4dc7a  ! 481: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
SHORT_FP_PRI177:
	.word 0xcbba9a1a  ! 483: STDFA_R	stda	%f5, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC179:
	.word 0xcb85409a  ! 485: LDFA_R	lda	[%r21, %r26], %f5
NC_PST_PRI180:
	.word 0xcbbc585a  ! 487: STDFA_R	stda	%f5, [%r26, %r17]
CP_BIS_NUC181:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 489: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
CP_NUC182:
	.word 0xcac5009a  ! 491: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r5
	.word 0xca8c913a  ! 493: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
	.word 0xcaf4913a  ! 495: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
	.word 0xcadb901a  ! 497: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
	.word 0xcb9ad01a  ! 498: LDDFA_R	ldda	[%r11, %r26], %f5
NC_NUC183:
	.word 0xcbbd409a  ! 500: STDFA_R	stda	%f5, [%r26, %r21]
	.word 0xcb032018  ! 501: LDF_I	ld	[%r12, 0x0018], %f5
CP_BIS_AIUS184:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 503: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xcb9c913a  ! 505: LDDFA_R	ldda	[%r18, %r26], %f5
CHANGE_R26185:
	add	%r26,	%r27,	%r26
CP_BIS_SEC185:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 507: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
CP_BIS_AIUP186:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 509: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
NC_BIS_AIUS187:
	.word 0xd0a7c47a  ! 511: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
SHORT_FP_PRI188:
	.word 0xcb9b1b1a  ! 513: LDDFA_R	ldda	[%r12, %r26], %f5
SET_TL1_189:
	ta	T_CHANGE_TO_TL1
CHANGE_R26190:
	add	%r26,	%r27,	%r26
NC_BIS_NUC190:
	.word 0xd0f544fa  ! 515: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
	.word 0xcba2911a  ! 516: STFA_R	sta	%f5, [%r26, %r10]
SET_TL0_191:
	ta	T_CHANGE_TO_TL0
WR_LEASI_192:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_193:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BLK_SEc194:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 519: STDFA_R	stda	%f16, [%r26, %r19]
NC_BIS_SEC195:
	.word 0xc8b4dc7a  ! 521: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
	.word 0xcb1b401a  ! 522: LDDF_R	ldd	[%r13, %r26], %f5
	.word 0xcb3ae018  ! 523: STDF_I	std	%f5, [0x0018, %r11]
CHANGE_CLE196:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_QUAD_LD197:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 526: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xcb036018  ! 527: LDF_I	ld	[%r13, 0x0018], %f5
CP_BIS_QUAD_LD198:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 529: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xcac4d03a  ! 531: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xc89cd13a  ! 533: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xcb1ae018  ! 534: LDDF_I	ldd	[%r11, 0x0018], %f5
	.word 0xcb9bd11a  ! 536: LDDFA_R	ldda	[%r15, %r26], %f5
	.word 0xca7aa018  ! 537: SWAP_I	swap	%r5, [%r10 + 0x0018]
CP_BIS_QUAD_LD199:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 539: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xca22a018  ! 540: STW_I	stw	%r5, [%r10 + 0x0018]
CHANGE_R26200:
	mov	%g0,	%r26
CP_BIS_SEC200:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 542: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
CHANGE_PRIV201:
	ta	T_CHANGE_PRIV
CHANGE_R26202:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD202:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 544: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
NC_BIS_SEC203:
	.word 0xc4a4dc7a  ! 546: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xcaf2d01a  ! 547: STXA_R	stxa	%r5, [%r11 + %r26] 0x80
CP_NUC204:
	.word 0xca8d009a  ! 549: LDUBA_R	lduba	[%r20, %r26] 0x04, %r5
	.word 0xca93901a  ! 551: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
CP_BIS_AIUP205:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 553: STBA_R	stba	%r4, [%r24 + %r26] 0x22
CHANGE_USER206:
	ta	T_CHANGE_NONPRIV
CHANGE_R26207:
	add	%r26,	%r27,	%r26
NC_BIS_PRI207:
	.word 0xc8ab9c5a  ! 555: STBA_R	stba	%r4, [%r14 + %r26] 0xe2
	.word 0xcada901a  ! 556: LDXA_R	ldxa	[%r10, %r26] 0x80, %r5
CHANGE_PRIV208:
	ta	T_CHANGE_PRIV
CHANGE_R26209:
	add	%r26,	%r27,	%r26
CP_BIS_NUC209:
	and	%r26,	%r28,	%r26
	.word 0xc8f504fa  ! 558: STXA_R	stxa	%r4, [%r20 + %r26] 0x27
	.word 0xcac3901a  ! 560: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
	.word 0xcbbad01a  ! 561: STDFA_R	stda	%f5, [%r26, %r11]
CP_PST_PRI210:
	.word 0xcbba995a  ! 563: STDFA_R	stda	%f5, [%r26, %r10]
SET_TL1_211:
	ta	T_CHANGE_TO_TL1
CHANGE_R26212:
	add	%r26,	%r27,	%r26
NC_BIS_NUC212:
	.word 0xc8ad45fa  ! 565: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
	.word 0xc8bbd01a  ! 567: STDA_R	stda	%r4, [%r15 + %r26] 0x80
	.word 0xc89c903a  ! 569: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xca5ac01a  ! 570: LDX_R	ldx	[%r11 + %r26], %r5
	.word 0xc8bc903a  ! 572: STDA_R	stda	%r4, [%r18 + %r26] 0x81
NC_NUC213:
	.word 0xcadd409a  ! 574: LDXA_R	ldxa	[%r21, %r26] 0x04, %r5
	.word 0xc89cd03a  ! 576: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xca12e01a  ! 577: LDUH_I	lduh	[%r11 + 0x001a], %r5
NC_BLK_SEc214:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 579: LDDFA_R	ldda	[%r19, %r26], %f16
NC_NUC215:
	.word 0xcba5409a  ! 581: STFA_R	sta	%f5, [%r26, %r21]
	.word 0xca6a801a  ! 582: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xca8cd13a  ! 584: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcb02801a  ! 585: LDF_R	ld	[%r10, %r26], %f5
NC_SHORT_FP_SEC216:
	.word 0xcb9cdb7a  ! 587: LDDFA_R	ldda	[%r19, %r26], %f5
SET_TL0_217:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI218:
	.word 0xc4ab9c5a  ! 589: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
CHANGE_PRIV219:
	ta	T_CHANGE_PRIV
CHANGE_R26220:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP220:
	and	%r26,	%r28,	%r26
	.word 0xccae055a  ! 591: STBA_R	stba	%r6, [%r24 + %r26] 0x2a
CP_BIS_NUC221:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 593: STDA_R	stda	%r2, [%r20 + %r26] 0x27
NC_BLK_SEc222:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 595: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcba4101a  ! 597: STFA_R	sta	%f5, [%r26, %r16]
CHANGE_R26223:
	add	%r26,	%r27,	%r26
CP_BIS_SEC223:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 599: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
WR_LEASI_224:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_225:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcbbcd13a  ! 602: STDFA_R	stda	%f5, [%r26, %r19]
NC_AIUP226:
	.word 0xcab6431a  ! 604: STHA_R	stha	%r5, [%r25 + %r26] 0x18
	.word 0xca23001a  ! 605: STW_R	stw	%r5, [%r12 + %r26]
NC_PST_PRI227:
	.word 0xcbbb999a  ! 607: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcaccd13a  ! 609: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
NC_AIUS228:
	.word 0xcac7c23a  ! 611: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r5
NC_BIS_AIUP229:
	.word 0xc4b6445a  ! 613: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xcaacd03a  ! 615: STBA_R	stba	%r5, [%r19 + %r26] 0x81
	.word 0xcad3d11a  ! 617: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r5
CHANGE_R26230:
	add	%r26,	%r27,	%r26
CP_BIS_SEC230:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 619: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
BLK_PRI231:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 621: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xcb9cd03a  ! 623: LDDFA_R	ldda	[%r19, %r26], %f5
CP_ATM_QUAD_LD232:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 625: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_PST_PRI233:
	.word 0xcbba995a  ! 627: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcb3b6018  ! 628: STDF_I	std	%f5, [0x0018, %r13]
SHORT_FP_PRI234:
	.word 0xcbbada5a  ! 630: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcadc501a  ! 632: LDXA_R	ldxa	[%r17, %r26] 0x80, %r5
	.word 0xca5aa018  ! 633: LDX_I	ldx	[%r10 + 0x0018], %r5
	.word 0xca8c903a  ! 635: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xcbbb501a  ! 636: STDFA_R	stda	%f5, [%r26, %r13]
NC_AIUS235:
	.word 0xcacfc23a  ! 638: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r5
NC_PST_PRI236:
	.word 0xcbbc581a  ! 640: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xcaa3d01a  ! 642: STWA_R	stwa	%r5, [%r15 + %r26] 0x80
BLK_PRI237:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 644: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xcb9a905a  ! 645: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcac4903a  ! 647: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
SHORT_FP_PRI238:
	.word 0xcb9b5a1a  ! 649: LDDFA_R	ldda	[%r13, %r26], %f5
CP_BIS_AIUS239:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 651: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
NC_BIS_SEC240:
	.word 0xc4a4dc7a  ! 653: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xcadcd03a  ! 655: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CP_AIUP241:
	.word 0xcaf6031a  ! 657: STXA_R	stxa	%r5, [%r24 + %r26] 0x18
BLK_PRI242:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5f1a  ! 659: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xcb3ae018  ! 660: STDF_I	std	%f5, [0x0018, %r11]
	.word 0xcb9b511a  ! 661: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xcab4903a  ! 663: STHA_R	stha	%r5, [%r18 + %r26] 0x81
NC_AIUS243:
	.word 0xcadfc33a  ! 665: LDXA_R	ldxa	[%r31, %r26] 0x19, %r5
BLK_PRI244:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 667: LDDFA_R	ldda	[%r10, %r26], %f16
BLK_PRI245:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 669: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xcb9c111a  ! 671: LDDFA_R	ldda	[%r16, %r26], %f5
	.word 0xcbbc903a  ! 673: STDFA_R	stda	%f5, [%r26, %r18]
SET_TL1_246:
	ta	T_CHANGE_TO_TL1
CHANGE_R26247:
	mov	%g0,	%r26
NC_BIS_NUC247:
	.word 0xc4f544fa  ! 675: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_AIUS248:
	.word 0xcbbfc23a  ! 677: STDFA_R	stda	%f5, [%r26, %r31]
NC_PST_PRI249:
	.word 0xcbbc191a  ! 679: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcaf4903a  ! 681: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcac4501a  ! 683: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
SHORT_FP_PRI250:
	.word 0xcb9adb1a  ! 685: LDDFA_R	ldda	[%r11, %r26], %f5
CP_AIUS251:
	.word 0xca87823a  ! 687: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r5
	.word 0xca94913a  ! 689: LDUHA_R	lduha	[%r18, %r26] 0x89, %r5
	.word 0xcadc913a  ! 691: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CP_ATM_QUAD_LD252:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 693: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xcb82901a  ! 694: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcaf3911a  ! 696: STXA_R	stxa	%r5, [%r14 + %r26] 0x88
CP_PST_PRI253:
	.word 0xcbba981a  ! 698: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xc89cd03a  ! 700: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
CP_AIUS254:
	.word 0xcb87823a  ! 702: LDFA_R	lda	[%r30, %r26], %f5
	.word 0xcb84903a  ! 704: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xcba2911a  ! 705: STFA_R	sta	%f5, [%r26, %r10]
NC_BIS_NUC255:
	.word 0xd0b544fa  ! 707: STHA_R	stha	%r8, [%r21 + %r26] 0x27
	.word 0xc89b901a  ! 709: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
	.word 0xcad4d03a  ! 711: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xcadb911a  ! 713: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
NC_AIUS256:
	.word 0xcbbfc23a  ! 715: STDFA_R	stda	%f5, [%r26, %r31]
CP_BIS_AIUS257:
	and	%r26,	%r28,	%r26
	.word 0xc4af857a  ! 717: STBA_R	stba	%r2, [%r30 + %r26] 0x2b
	.word 0xcaa4903a  ! 719: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcb23401a  ! 720: STF_R	st	%f5, [%r26, %r13]
CP_PST_PRI258:
	.word 0xcbba999a  ! 722: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca84511a  ! 724: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r5
	.word 0xca94d13a  ! 726: LDUHA_R	lduha	[%r19, %r26] 0x89, %r5
CP_BIS_QUAD_LD259:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 728: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
NC_BIS_AIUP260:
	.word 0xc8b6445a  ! 730: STHA_R	stha	%r4, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD261:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 732: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xcb9a915a  ! 733: LDDFA_R	ldda	[%r10, %r26], %f5
NC_BIS_AIUP262:
	.word 0xccf6455a  ! 735: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
	.word 0xcadc101a  ! 737: LDXA_R	ldxa	[%r16, %r26] 0x80, %r5
CP_AIUS263:
	.word 0xc8bf823a  ! 739: STDA_R	stda	%r4, [%r30 + %r26] 0x11
	.word 0xcac4d03a  ! 741: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
NC_BLK_SEc264:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 743: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUP265:
	.word 0xca8e031a  ! 745: LDUBA_R	lduba	[%r24, %r26] 0x18, %r5
NC_BLK_SEc266:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 747: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xca8b911a  ! 749: LDUBA_R	lduba	[%r14, %r26] 0x88, %r5
	.word 0xcafb501a  ! 750: SWAPA_R	swapa	%r5, [%r13 + %r26] 0x80
	.word 0xcb1a801a  ! 752: LDDF_R	ldd	[%r10, %r26], %f5
SET_TL0_267:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI268:
	and	%r26,	%r28,	%r26
	.word 0xd0f31c5a  ! 754: STXA_R	stxa	%r8, [%r12 + %r26] 0xe2
	.word 0xca6b201b  ! 755: LDSTUB_I	ldstub	%r5, [%r12 + 0x001b]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP270:
	.word 0xcaf6021a  ! 757: STXA_R	stxa	%r5, [%r24 + %r26] 0x10
SET_TL1_271:
	ta	T_CHANGE_TO_TL1
CHANGE_R26272:
	add	%r26,	%r27,	%r26
NC_BIS_NUC272:
	.word 0xc4a545fa  ! 759: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xcb1ae018  ! 760: LDDF_I	ldd	[%r11, 0x0018], %f5
	.word 0xcaac501a  ! 762: STBA_R	stba	%r5, [%r17 + %r26] 0x80
NC_BLK_SEc273:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 764: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc8ba901a  ! 765: STDA_R	stda	%r4, [%r10 + %r26] 0x80
	.word 0xca0aa01b  ! 766: LDUB_I	ldub	[%r10 + 0x001b], %r5
CP_NUC274:
	.word 0xcbbd009a  ! 768: STDFA_R	stda	%f5, [%r26, %r20]
	.word 0xcb22801a  ! 769: STF_R	st	%f5, [%r26, %r10]
	.word 0xca8c913a  ! 771: LDUBA_R	lduba	[%r18, %r26] 0x89, %r5
	.word 0xcaa4d03a  ! 773: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
NC_AIUP275:
	.word 0xcab6421a  ! 775: STHA_R	stha	%r5, [%r25 + %r26] 0x10
	.word 0xcacc903a  ! 777: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
	.word 0xcba4d13a  ! 779: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xca22a018  ! 780: STW_I	stw	%r5, [%r10 + 0x0018]
NC_PST_PRI276:
	.word 0xcbbc185a  ! 782: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcba4903a  ! 784: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcbbcd13a  ! 787: STDFA_R	stda	%f5, [%r26, %r19]
NC_AIUS277:
	.word 0xca8fc23a  ! 789: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcb1aa018  ! 790: LDDF_I	ldd	[%r10, 0x0018], %f5
NC_PST_PRI278:
	.word 0xcbbc581a  ! 792: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xe3ed595a  ! 794: PREFETCHA_R	prefetcha	[%r21, %r26] 0xca, #17
CP_NUC279:
	.word 0xcab5009a  ! 796: STHA_R	stha	%r5, [%r20 + %r26] 0x04
CP_NUC280:
	.word 0xcba5009a  ! 798: STFA_R	sta	%f5, [%r26, %r20]
	.word 0xc89c501a  ! 800: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
CP_ATM_QUAD_LD281:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 802: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
SET_TL0_282:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI283:
	.word 0xd0a39c5a  ! 804: STWA_R	stwa	%r8, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP285:
	.word 0xcba6431a  ! 806: STFA_R	sta	%f5, [%r26, %r25]
	.word 0xcaf3111a  ! 807: STXA_R	stxa	%r5, [%r12 + %r26] 0x88
CP_PST_PRI286:
	.word 0xcbbb581a  ! 809: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xca8cd13a  ! 811: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
BLK_PRI287:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 813: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xcb82901a  ! 814: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcbbb911a  ! 816: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcaf2911a  ! 817: STXA_R	stxa	%r5, [%r10 + %r26] 0x88
CHANGE_USER288:
	ta	T_CHANGE_NONPRIV
CHANGE_R26289:
	add	%r26,	%r27,	%r26
NC_BIS_PRI289:
	.word 0xc4bb9d5a  ! 819: STDA_R	stda	%r2, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS291:
	.word 0xca87823a  ! 821: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r5
CP_PST_PRI292:
	.word 0xcbba995a  ! 823: STDFA_R	stda	%f5, [%r26, %r10]
NC_NUC293:
	.word 0xcacd409a  ! 825: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r5
	.word 0xcbbb111a  ! 826: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xca72c01a  ! 827: STX_R	stx	%r5, [%r11 + %r26]
CP_BIS_NUC294:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 829: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
CP_BIS_AIUS295:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 831: STDA_R	stda	%r2, [%r30 + %r26] 0x23
NC_SHORT_FP_SEC296:
	.word 0xcbbcdb3a  ! 833: STDFA_R	stda	%f5, [%r26, %r19]
CP_BIS_AIUS297:
	and	%r26,	%r28,	%r26
	.word 0xc8b7847a  ! 835: STHA_R	stha	%r4, [%r30 + %r26] 0x23
NC_PST_PRI298:
	.word 0xcbbc595a  ! 837: STDFA_R	stda	%f5, [%r26, %r17]
NC_AIUS299:
	.word 0xcab7c23a  ! 839: STHA_R	stha	%r5, [%r31 + %r26] 0x11
	.word 0xcab3901a  ! 841: STHA_R	stha	%r5, [%r14 + %r26] 0x80
SHORT_FP_PRI300:
	.word 0xcbbb5b1a  ! 843: STDFA_R	stda	%f5, [%r26, %r13]
NC_AIUS301:
	.word 0xcac7c23a  ! 845: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r5
NC_AIUS302:
	.word 0xc8bfc23a  ! 847: STDA_R	stda	%r4, [%r31 + %r26] 0x11
	.word 0xcaa3901a  ! 849: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	.word 0xcb83105a  ! 850: LDFA_R	lda	[%r12, %r26], %f5
WR_LEASI_303:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_304:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcbba901a  ! 852: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcbe2a01a  ! 853: CASA_R	casa	[%r10] %asi, %r26, %r5
CP_AIUS305:
	.word 0xc8bf823a  ! 855: STDA_R	stda	%r4, [%r30 + %r26] 0x11
	.word 0xcaf3d01a  ! 857: STXA_R	stxa	%r5, [%r15 + %r26] 0x80
	.word 0xcaacd03a  ! 859: STBA_R	stba	%r5, [%r19 + %r26] 0x81
NC_AIUS306:
	.word 0xca97c23a  ! 861: LDUHA_R	lduha	[%r31, %r26] 0x11, %r5
	.word 0xc89cd03a  ! 863: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
NC_BLK_SEc307:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 865: STDFA_R	stda	%f16, [%r26, %r19]
CHANGE_USER308:
	ta	T_CHANGE_NONPRIV
CHANGE_R26309:
	add	%r26,	%r27,	%r26
CP_BIS_PRI309:
	and	%r26,	%r28,	%r26
	.word 0xd0bb5c5a  ! 867: STDA_R	stda	%r8, [%r13 + %r26] 0xe2
NC_BIS_PRI310:
	.word 0xc4f39c5a  ! 869: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
	.word 0xcbbb101a  ! 870: STDFA_R	stda	%f5, [%r26, %r12]
NC_BIS_SEC311:
	.word 0xd0f4dc7a  ! 872: STXA_R	stxa	%r8, [%r19 + %r26] 0xe3
	.word 0xcad4913a  ! 874: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcaf4d03a  ! 876: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
	.word 0xcb84903a  ! 878: LDFA_R	lda	[%r18, %r26], %f5
BLK_PRI312:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 880: LDDFA_R	ldda	[%r11, %r26], %f0
CHANGE_TLE313:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
SET_TL1_314:
	ta	T_CHANGE_TO_TL1
CHANGE_R26315:
	add	%r26,	%r27,	%r26
NC_BIS_NUC315:
	.word 0xccf544fa  ! 883: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
CP_BIS_AIUP316:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 885: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
	.word 0xcacc903a  ! 887: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
NC_SHORT_FP_SEC317:
	.word 0xcbbcda3a  ! 889: STDFA_R	stda	%f5, [%r26, %r19]
NC_BIS_AIUS318:
	.word 0xc4f7c47a  ! 891: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_BLK_SEc319:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 893: LDDFA_R	ldda	[%r19, %r26], %f0
SET_TL0_320:
	ta	T_CHANGE_TO_TL0
CHANGE_R26321:
	mov	%g0,	%r26
NC_BIS_SEC321:
	.word 0xc4bcdc7a  ! 895: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xcac2901a  ! 896: LDSWA_R	ldswa	[%r10, %r26] 0x80, %r5
	.word 0xca92901a  ! 897: LDUHA_R	lduha	[%r10, %r26] 0x80, %r5
CP_BIS_PRI322:
	and	%r26,	%r28,	%r26
	.word 0xd0bb5c5a  ! 899: STDA_R	stda	%r8, [%r13 + %r26] 0xe2
CP_PST_PRI323:
	.word 0xcbbad85a  ! 901: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcba3111a  ! 902: STFA_R	sta	%f5, [%r26, %r12]
SET_TL1_324:
	ta	T_CHANGE_TO_TL1
CHANGE_R26325:
	add	%r26,	%r27,	%r26
NC_BIS_NUC325:
	.word 0xc8f545fa  ! 904: STXA_R	stxa	%r4, [%r21 + %r26] 0x2f
	.word 0xcaabd11a  ! 906: STBA_R	stba	%r5, [%r15 + %r26] 0x88
	.word 0xcab3501a  ! 907: STHA_R	stha	%r5, [%r13 + %r26] 0x80
CP_PST_PRI326:
	.word 0xcbbb589a  ! 909: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcab4d13a  ! 911: STHA_R	stha	%r5, [%r19 + %r26] 0x89
NC_BIS_AIUP327:
	.word 0xccf6455a  ! 913: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
	.word 0xcb84d13a  ! 915: LDFA_R	lda	[%r19, %r26], %f5
NC_BIS_AIUP328:
	.word 0xccb6445a  ! 917: STHA_R	stha	%r6, [%r25 + %r26] 0x22
	.word 0xcaf4913a  ! 919: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
NC_BLK_SEc329:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 921: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xca8a901a  ! 922: LDUBA_R	lduba	[%r10, %r26] 0x80, %r5
CP_NUC330:
	.word 0xcab5009a  ! 924: STHA_R	stha	%r5, [%r20 + %r26] 0x04
	.word 0xcacb911a  ! 926: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r5
CP_BIS_AIUP331:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 928: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
	.word 0xcbe3601a  ! 929: CASA_R	casa	[%r13] %asi, %r26, %r5
NC_AIUP332:
	.word 0xcade421a  ! 931: LDXA_R	ldxa	[%r25, %r26] 0x10, %r5
NC_NUC333:
	.word 0xcacd419a  ! 933: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r5
NC_AIUS334:
	.word 0xcb87c23a  ! 935: LDFA_R	lda	[%r31, %r26], %f5
NC_NUC335:
	.word 0xca95419a  ! 937: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r5
NC_AIUS336:
	.word 0xca87c33a  ! 939: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r5
CP_BIS_AIUP337:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 941: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xcac4903a  ! 944: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xca02801a  ! 945: LDUW_R	lduw	[%r10 + %r26], %r5
	.word 0xcb83911a  ! 947: LDFA_R	lda	[%r14, %r26], %f5
NC_AIUS338:
	.word 0xcadfc23a  ! 949: LDXA_R	ldxa	[%r31, %r26] 0x11, %r5
	.word 0xcb9c903a  ! 951: LDDFA_R	ldda	[%r18, %r26], %f5
CHANGE_R26339:
	add	%r26,	%r27,	%r26
CP_BIS_SEC339:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 953: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
SET_TL0_340:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI341:
	.word 0xc8a3dc5a  ! 955: STWA_R	stwa	%r4, [%r15 + %r26] 0xe2
CHANGE_R26342:
	add	%r26,	%r27,	%r26
CP_BIS_SEC342:
	and	%r26,	%r28,	%r26
	.word 0xcca49d7a  ! 957: STWA_R	stwa	%r6, [%r18 + %r26] 0xeb
	.word 0xcaacd03a  ! 959: STBA_R	stba	%r5, [%r19 + %r26] 0x81
NC_SHORT_FP_SEC343:
	.word 0xcb9cdb3a  ! 961: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcb84903a  ! 963: LDFA_R	lda	[%r18, %r26], %f5
CHANGE_PRIV344:
	ta	T_CHANGE_PRIV
CHANGE_R26345:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP345:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 965: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
NC_AIUP346:
	.word 0xc89e431a  ! 967: LDDA_R	ldda	[%r25, %r26] 0x18, %r4
	.word 0xcad4d13a  ! 969: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
NC_BIS_AIUS347:
	.word 0xd0f7c47a  ! 971: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xcb84d13a  ! 973: LDFA_R	lda	[%r19, %r26], %f5
NC_PST_PRI348:
	.word 0xcbbb989a  ! 975: STDFA_R	stda	%f5, [%r26, %r14]
SET_TL1_349:
	ta	T_CHANGE_TO_TL1
CHANGE_R26350:
	add	%r26,	%r27,	%r26
NC_BIS_NUC350:
	.word 0xc4ad45fa  ! 977: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xca2ac01a  ! 978: STB_R	stb	%r5, [%r11 + %r26]
	.word 0xca8c101a  ! 980: LDUBA_R	lduba	[%r16, %r26] 0x80, %r5
CP_NUC351:
	.word 0xcbe5201a  ! 982: CASA_R	casa	[%r20] %asi, %r26, %r5
	.word 0xcb83515a  ! 983: LDFA_R	lda	[%r13, %r26], %f5
NC_AIUS352:
	.word 0xc89fc23a  ! 985: LDDA_R	ldda	[%r31, %r26] 0x11, %r4
	.word 0xca84903a  ! 987: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
	.word 0xcadbd01a  ! 989: LDXA_R	ldxa	[%r15, %r26] 0x80, %r5
NC_NUC353:
	.word 0xcb9d409a  ! 991: LDDFA_R	ldda	[%r21, %r26], %f5
NC_BIS_AIUP354:
	.word 0xc4ae445a  ! 993: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xcac4903a  ! 995: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
CP_BIS_QUAD_LD355:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 997: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
NC_AIUP356:
	.word 0xca8e421a  ! 999: LDUBA_R	lduba	[%r25, %r26] 0x10, %r5
	.word 0xc8bcd13a  ! 1001: STDA_R	stda	%r4, [%r19 + %r26] 0x89
CHANGE_R26357:
	add	%r26,	%r27,	%r26
CP_BIS_SEC357:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 1003: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xca6b401a  ! 1004: LDSTUB_R	ldstub	%r5, [%r13 + %r26]
NC_BIS_AIUP358:
	.word 0xd0a6445a  ! 1006: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD359:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 1008: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xcaa3901a  ! 1010: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
NC_BIS_AIUP360:
	.word 0xd0a6445a  ! 1012: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xcb84d03a  ! 1014: LDFA_R	lda	[%r19, %r26], %f5
CP_BIS_QUAD_LD361:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 1016: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xcba2901a  ! 1017: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcaacd13a  ! 1019: STBA_R	stba	%r5, [%r19 + %r26] 0x89
BLK_PRI362:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1021: STDFA_R	stda	%f0, [%r26, %r10]
SET_TL0_363:
	ta	T_CHANGE_TO_TL0
WR_LEASI_364:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_365:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcaa3d11a  ! 1024: STWA_R	stwa	%r5, [%r15 + %r26] 0x88
	.word 0xcaf4903a  ! 1026: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
CHANGE_PRIV366:
	ta	T_CHANGE_PRIV
CHANGE_R26367:
	add	%r26,	%r27,	%r26
CP_BIS_NUC367:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 1028: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
CP_BIS_AIUS368:
	and	%r26,	%r28,	%r26
	.word 0xd0af857a  ! 1030: STBA_R	stba	%r8, [%r30 + %r26] 0x2b
NC_NUC369:
	.word 0xcb9d409a  ! 1032: LDDFA_R	ldda	[%r21, %r26], %f5
	.word 0xcbbc903a  ! 1034: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcb9bd11a  ! 1036: LDDFA_R	ldda	[%r15, %r26], %f5
SET_TL1_370:
	ta	T_CHANGE_TO_TL1
CHANGE_R26371:
	mov	%g0,	%r26
NC_BIS_NUC371:
	.word 0xd0f544fa  ! 1038: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
SET_TL0_372:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI373:
	.word 0xc8abdc5a  ! 1040: STBA_R	stba	%r4, [%r15 + %r26] 0xe2
SET_TL1_374:
	ta	T_CHANGE_TO_TL1
CHANGE_R26375:
	add	%r26,	%r27,	%r26
NC_BIS_NUC375:
	.word 0xd0a544fa  ! 1042: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
	.word 0xc89cd03a  ! 1044: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
SET_TL0_376:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI377:
	.word 0xc4abdc5a  ! 1046: STBA_R	stba	%r2, [%r15 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC379:
	.word 0xcba5009a  ! 1048: STFA_R	sta	%f5, [%r26, %r20]
NC_AIUS380:
	.word 0xcaa7c23a  ! 1050: STWA_R	stwa	%r5, [%r31 + %r26] 0x11
CP_AIUS381:
	.word 0xc8bf823a  ! 1052: STDA_R	stda	%r4, [%r30 + %r26] 0x11
CHANGE_USER382:
	ta	T_CHANGE_NONPRIV
CHANGE_R26383:
	add	%r26,	%r27,	%r26
NC_BIS_PRI383:
	.word 0xc8a39c5a  ! 1054: STWA_R	stwa	%r4, [%r14 + %r26] 0xe2
NC_PST_PRI384:
	.word 0xcbbbd81a  ! 1056: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcbf2e01a  ! 1057: CASXA_R	casxa	[%r11]%asi, %r26, %r5
	.word 0xcadad01a  ! 1058: LDXA_R	ldxa	[%r11, %r26] 0x80, %r5
CP_PST_PRI385:
	.word 0xcbbad95a  ! 1060: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcb9c501a  ! 1062: LDDFA_R	ldda	[%r17, %r26], %f5
	.word 0xca8c903a  ! 1064: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CHANGE_TLE386:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_R26387:
	add	%r26,	%r27,	%r26
CP_BIS_SEC387:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 1067: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
NC_BLK_SEc388:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1069: LDDFA_R	ldda	[%r19, %r26], %f16
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP390:
	.word 0xcad6031a  ! 1071: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r5
	.word 0xca23401a  ! 1072: STW_R	stw	%r5, [%r13 + %r26]
	.word 0xca02c01a  ! 1073: LDUW_R	lduw	[%r11 + %r26], %r5
	.word 0xcaccd03a  ! 1075: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcaa4d13a  ! 1077: STWA_R	stwa	%r5, [%r19 + %r26] 0x89
CP_BIS_NUC391:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 1079: STBA_R	stba	%r2, [%r20 + %r26] 0x27
NC_BIS_AIUS392:
	.word 0xc4f7c57a  ! 1081: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xca8c903a  ! 1083: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xc89b901a  ! 1085: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
CP_BIS_QUAD_LD393:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1087: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xcba2901a  ! 1088: STFA_R	sta	%f5, [%r26, %r10]
CHANGE_R26394:
	add	%r26,	%r27,	%r26
CP_BIS_SEC394:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1090: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
	.word 0xcacb501a  ! 1091: LDSBA_R	ldsba	[%r13, %r26] 0x80, %r5
CP_PST_PRI395:
	.word 0xcbbad85a  ! 1093: STDFA_R	stda	%f5, [%r26, %r11]
NC_BIS_SEC396:
	.word 0xc4bcdd7a  ! 1095: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
SHORT_FP_PRI397:
	.word 0xcbbb5b1a  ! 1097: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xca8c101a  ! 1099: LDUBA_R	lduba	[%r16, %r26] 0x80, %r5
SHORT_FP_PRI398:
	.word 0xcb9ada5a  ! 1101: LDDFA_R	ldda	[%r11, %r26], %f5
SHORT_FP_PRI399:
	.word 0xcb9a9a1a  ! 1103: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaa4913a  ! 1105: STWA_R	stwa	%r5, [%r18 + %r26] 0x89
	.word 0xcab4d13a  ! 1107: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xca83901a  ! 1109: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r5
	.word 0xc36f801a  ! 1111: PREFETCH_R	prefetch	[%r30 + %r26], #one_read
	.word 0xcb84903a  ! 1113: LDFA_R	lda	[%r18, %r26], %f5
CP_AIUP400:
	.word 0xcab6021a  ! 1115: STHA_R	stha	%r5, [%r24 + %r26] 0x10
	.word 0xcad3d01a  ! 1117: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r5
NC_BIS_AIUS401:
	.word 0xcca7c47a  ! 1119: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
	.word 0xca8c903a  ! 1121: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xcbbb511a  ! 1122: STDFA_R	stda	%f5, [%r26, %r13]
CP_BIS_AIUP402:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1124: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xca8c903a  ! 1126: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CHANGE_USER403:
	ta	T_CHANGE_NONPRIV
CHANGE_R26404:
	add	%r26,	%r27,	%r26
CP_BIS_PRI404:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9c5a  ! 1128: STBA_R	stba	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP406:
	.word 0xcab6431a  ! 1130: STHA_R	stha	%r5, [%r25 + %r26] 0x18
	.word 0xcba4913a  ! 1132: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xc8bcd03a  ! 1134: STDA_R	stda	%r4, [%r19 + %r26] 0x81
NC_BIS_AIUP407:
	.word 0xc4b6455a  ! 1136: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
	.word 0xcaccd13a  ! 1138: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r5
CHANGE_R26408:
	add	%r26,	%r27,	%r26
CP_BIS_SEC408:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 1140: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
CP_BIS_AIUP409:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1142: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xca84511a  ! 1144: LDUWA_R	lduwa	[%r17, %r26] 0x88, %r5
SET_TL1_410:
	ta	T_CHANGE_TO_TL1
CHANGE_R26411:
	add	%r26,	%r27,	%r26
NC_BIS_NUC411:
	.word 0xc4a544fa  ! 1146: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
SHORT_FP_PRI412:
	.word 0xcb9adb1a  ! 1148: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcaa4d13a  ! 1150: STWA_R	stwa	%r5, [%r19 + %r26] 0x89
	.word 0xc89cd03a  ! 1152: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
CP_BIS_AIUS413:
	and	%r26,	%r28,	%r26
	.word 0xccaf847a  ! 1154: STBA_R	stba	%r6, [%r30 + %r26] 0x23
NC_BIS_AIUP414:
	.word 0xccb6445a  ! 1156: STHA_R	stha	%r6, [%r25 + %r26] 0x22
	.word 0xcaca905a  ! 1157: LDSBA_R	ldsba	[%r10, %r26] 0x82, %r5
CP_PST_PRI415:
	.word 0xcbbad91a  ! 1159: STDFA_R	stda	%f5, [%r26, %r11]
CHANGE_R26416:
	add	%r26,	%r27,	%r26
CP_BIS_SEC416:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1161: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
	.word 0xcac3901a  ! 1163: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r5
	.word 0xcaa3d01a  ! 1165: STWA_R	stwa	%r5, [%r15 + %r26] 0x80
NC_BIS_AIUP417:
	.word 0xc4be445a  ! 1167: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_AIUP418:
	.word 0xcba6421a  ! 1169: STFA_R	sta	%f5, [%r26, %r25]
CHANGE_R26419:
	add	%r26,	%r27,	%r26
CP_BIS_SEC419:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 1171: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
NC_BIS_AIUP420:
	.word 0xc8ae445a  ! 1173: STBA_R	stba	%r4, [%r25 + %r26] 0x22
CP_BIS_QUAD_LD421:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1175: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xcbbc903a  ! 1177: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcac4d13a  ! 1179: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
CP_BIS_QUAD_LD422:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1181: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
NC_BLK_SEc423:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1183: LDDFA_R	ldda	[%r19, %r26], %f0
NC_BIS_AIUP424:
	.word 0xc8be445a  ! 1185: STDA_R	stda	%r4, [%r25 + %r26] 0x22
	.word 0xca94d03a  ! 1187: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xca236018  ! 1188: STW_I	stw	%r5, [%r13 + 0x0018]
SET_TL0_425:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI426:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 1190: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
CHANGE_PRIV427:
	ta	T_CHANGE_PRIV
CHANGE_R26428:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS428:
	.word 0xc4f7c47a  ! 1192: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUS429:
	.word 0xccafc57a  ! 1194: STBA_R	stba	%r6, [%r31 + %r26] 0x2b
	.word 0xcad3901a  ! 1196: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
	.word 0xca8b111a  ! 1197: LDUBA_R	lduba	[%r12, %r26] 0x88, %r5
CP_BIS_NUC430:
	and	%r26,	%r28,	%r26
	.word 0xd0b505fa  ! 1199: STHA_R	stha	%r8, [%r20 + %r26] 0x2f
	.word 0xcb84903a  ! 1201: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xcba3901a  ! 1203: STFA_R	sta	%f5, [%r26, %r14]
	.word 0xcb83505a  ! 1204: LDFA_R	lda	[%r13, %r26], %f5
	.word 0xcaa3901a  ! 1206: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	.word 0xca94903a  ! 1208: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
CHANGE_USER431:
	ta	T_CHANGE_NONPRIV
CHANGE_R26432:
	add	%r26,	%r27,	%r26
NC_BIS_PRI432:
	.word 0xc4a39d5a  ! 1210: STWA_R	stwa	%r2, [%r14 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC434:
	.word 0xca8d409a  ! 1212: LDUBA_R	lduba	[%r21, %r26] 0x04, %r5
	.word 0xcba2911a  ! 1213: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcaf3901a  ! 1215: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
	.word 0xca8b901a  ! 1217: LDUBA_R	lduba	[%r14, %r26] 0x80, %r5
	.word 0xca83d01a  ! 1219: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r5
NC_AIUS435:
	.word 0xcadfc23a  ! 1221: LDXA_R	ldxa	[%r31, %r26] 0x11, %r5
	.word 0xcb84903a  ! 1223: LDFA_R	lda	[%r18, %r26], %f5
CHANGE_USER436:
	ta	T_CHANGE_NONPRIV
CHANGE_R26437:
	mov	%g0,	%r26
NC_BIS_PRI437:
	.word 0xc4b3dc5a  ! 1225: STHA_R	stha	%r2, [%r15 + %r26] 0xe2
	.word 0xcb032018  ! 1226: LDF_I	ld	[%r12, 0x0018], %f5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP439:
	.word 0xcbbe421a  ! 1228: STDFA_R	stda	%f5, [%r26, %r25]
CP_AIUS440:
	.word 0xcaf7823a  ! 1230: STXA_R	stxa	%r5, [%r30 + %r26] 0x11
NC_BLK_SEc441:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1232: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC442:
	.word 0xcaad009a  ! 1234: STBA_R	stba	%r5, [%r20 + %r26] 0x04
CP_AIUS443:
	.word 0xcb87833a  ! 1236: LDFA_R	lda	[%r30, %r26], %f5
	.word 0xc8bcd03a  ! 1238: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xca5ae018  ! 1239: LDX_I	ldx	[%r11 + 0x0018], %r5
BLK_PRI444:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1241: STDFA_R	stda	%f0, [%r26, %r10]
NC_BIS_SEC445:
	.word 0xc4a4dc7a  ! 1243: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xca84913a  ! 1245: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r5
	.word 0xc8bb501a  ! 1246: STDA_R	stda	%r4, [%r13 + %r26] 0x80
	.word 0xc81b401a  ! 1247: LDD_R	ldd	[%r13 + %r26], %r4
	.word 0xcb83101a  ! 1248: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xca6b601b  ! 1249: LDSTUB_I	ldstub	%r5, [%r13 + 0x001b]
	.word 0xcb02801a  ! 1250: LDF_R	ld	[%r10, %r26], %f5
CP_BIS_NUC446:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 1252: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xcb23001a  ! 1253: STF_R	st	%f5, [%r26, %r12]
	.word 0xca02a018  ! 1254: LDUW_I	lduw	[%r10 + 0x0018], %r5
NC_AIUP447:
	.word 0xca8e421a  ! 1256: LDUBA_R	lduba	[%r25, %r26] 0x10, %r5
SHORT_FP_PRI448:
	.word 0xcbbb5a1a  ! 1258: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xc81aa018  ! 1259: LDD_I	ldd	[%r10 + 0x0018], %r4
BLK_PRI449:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 1261: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xcb3a801a  ! 1262: STDF_R	std	%f5, [%r26, %r10]
	.word 0xcaa4d03a  ! 1264: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CHANGE_USER450:
	ta	T_CHANGE_NONPRIV
CHANGE_R26451:
	add	%r26,	%r27,	%r26
NC_BIS_PRI451:
	.word 0xc4b41c5a  ! 1266: STHA_R	stha	%r2, [%r16 + %r26] 0xe2
	.word 0xcbbbd11a  ! 1268: STDFA_R	stda	%f5, [%r26, %r15]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS453:
	.word 0xcadf823a  ! 1270: LDXA_R	ldxa	[%r30, %r26] 0x11, %r5
	.word 0xca93101a  ! 1271: LDUHA_R	lduha	[%r12, %r26] 0x80, %r5
	.word 0xcadb911a  ! 1273: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
	.word 0xcb84903a  ! 1275: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xc89cd03a  ! 1277: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xca2aa01b  ! 1278: STB_I	stb	%r5, [%r10 + 0x001b]
	.word 0xcba4903a  ! 1280: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcadc913a  ! 1282: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
	.word 0xcb1aa018  ! 1283: LDDF_I	ldd	[%r10, 0x0018], %f5
	.word 0xcac4913a  ! 1285: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
SET_TL1_454:
	ta	T_CHANGE_TO_TL1
CHANGE_R26455:
	add	%r26,	%r27,	%r26
NC_BIS_NUC455:
	.word 0xc4bd44fa  ! 1287: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xca84903a  ! 1289: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
SET_TL0_456:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI457:
	.word 0xd0a45d5a  ! 1291: STWA_R	stwa	%r8, [%r17 + %r26] 0xea
	.word 0xcba3901a  ! 1293: STFA_R	sta	%f5, [%r26, %r14]
	.word 0xca94d03a  ! 1295: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
CHANGE_R26458:
	add	%r26,	%r27,	%r26
CP_BIS_SEC458:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 1297: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	.word 0xcaccd03a  ! 1299: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcad2901a  ! 1300: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r5
CHANGE_PRIV459:
	ta	T_CHANGE_PRIV
CHANGE_R26460:
	add	%r26,	%r27,	%r26
CP_BIS_NUC460:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1302: STHA_R	stha	%r2, [%r20 + %r26] 0x27
NC_BIS_SEC461:
	.word 0xc4a4dd7a  ! 1304: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
SHORT_FP_PRI462:
	.word 0xcb9b5a5a  ! 1306: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xc89bd01a  ! 1308: LDDA_R	ldda	[%r15, %r26] 0x80, %r4
	.word 0xca4aa01b  ! 1309: LDSB_I	ldsb	[%r10 + 0x001b], %r5
CP_BIS_NUC463:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 1311: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xcaa4903a  ! 1313: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xca94101a  ! 1315: LDUHA_R	lduha	[%r16, %r26] 0x80, %r5
	.word 0xc8bc903a  ! 1317: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xcb9b501a  ! 1318: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xcaf4903a  ! 1320: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcaea901a  ! 1321: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x80
	.word 0xca6a801a  ! 1322: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xcba4903a  ! 1324: STFA_R	sta	%f5, [%r26, %r18]
SET_TL1_464:
	ta	T_CHANGE_TO_TL1
CHANGE_R26465:
	add	%r26,	%r27,	%r26
NC_BIS_NUC465:
	.word 0xc8ad44fa  ! 1326: STBA_R	stba	%r4, [%r21 + %r26] 0x27
SET_TL0_466:
	ta	T_CHANGE_TO_TL0
WR_LEASI_467:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_468:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc83ae018  ! 1328: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc56fc01a  ! 1330: PREFETCH_R	prefetch	[%r31 + %r26], #n_writes
CP_BIS_QUAD_LD469:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 1332: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xcb22a018  ! 1333: STF_I	st	%f5, [0x0018, %r10]
NC_BLK_SEc470:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1335: LDDFA_R	ldda	[%r19, %r26], %f0
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP472:
	.word 0xcba6021a  ! 1337: STFA_R	sta	%f5, [%r26, %r24]
	.word 0xca7b6018  ! 1338: SWAP_I	swap	%r5, [%r13 + 0x0018]
	.word 0xca7b2018  ! 1339: SWAP_I	swap	%r5, [%r12 + 0x0018]
NC_BLK_SEc473:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1341: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc89a905a  ! 1342: LDDA_R	ldda	[%r10, %r26] 0x82, %r4
	.word 0xcba4501a  ! 1344: STFA_R	sta	%f5, [%r26, %r17]
	.word 0xc8bc101a  ! 1346: STDA_R	stda	%r4, [%r16 + %r26] 0x80
	.word 0xcb9a911a  ! 1347: LDDFA_R	ldda	[%r10, %r26], %f5
CP_AIUS474:
	.word 0xcac7823a  ! 1349: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r5
	.word 0xcab3901a  ! 1351: STHA_R	stha	%r5, [%r14 + %r26] 0x80
	.word 0xcab4913a  ! 1353: STHA_R	stha	%r5, [%r18 + %r26] 0x89
NC_NUC475:
	.word 0xc8bd419a  ! 1355: STDA_R	stda	%r4, [%r21 + %r26] 0x0c
	.word 0xc89c511a  ! 1357: LDDA_R	ldda	[%r17, %r26] 0x88, %r4
SET_TL1_476:
	ta	T_CHANGE_TO_TL1
CHANGE_R26477:
	add	%r26,	%r27,	%r26
NC_BIS_NUC477:
	.word 0xc8f544fa  ! 1359: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
	.word 0xca22a018  ! 1360: STW_I	stw	%r5, [%r10 + 0x0018]
NC_AIUP478:
	.word 0xcb9e421a  ! 1362: LDDFA_R	ldda	[%r25, %r26], %f5
	.word 0xca94903a  ! 1364: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcaac511a  ! 1366: STBA_R	stba	%r5, [%r17 + %r26] 0x88
	.word 0xcaa2901a  ! 1367: STWA_R	stwa	%r5, [%r10 + %r26] 0x80
CP_BIS_AIUP479:
	and	%r26,	%r28,	%r26
	.word 0xccb6055a  ! 1369: STHA_R	stha	%r6, [%r24 + %r26] 0x2a
	.word 0xcba2901a  ! 1370: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xca02801a  ! 1371: LDUW_R	lduw	[%r10 + %r26], %r5
BLK_PRI480:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 1373: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc89b515a  ! 1374: LDDA_R	ldda	[%r13, %r26] 0x8a, %r4
	.word 0xcad4913a  ! 1376: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
CP_ATM_QUAD_LD481:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 1378: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xcac4913a  ! 1380: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
	.word 0xcad4d13a  ! 1382: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
CP_AIUS482:
	.word 0xc8bf833a  ! 1384: STDA_R	stda	%r4, [%r30 + %r26] 0x19
NC_PST_PRI483:
	.word 0xcbbb981a  ! 1386: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcb82911a  ! 1387: LDFA_R	lda	[%r10, %r26], %f5
SET_TL0_484:
	ta	T_CHANGE_TO_TL0
CHANGE_R26485:
	add	%r26,	%r27,	%r26
NC_BIS_SEC485:
	.word 0xc4bcdc7a  ! 1389: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV486:
	ta	T_CHANGE_PRIV
CHANGE_R26487:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS487:
	.word 0xd0bfc47a  ! 1391: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc8bbd11a  ! 1393: STDA_R	stda	%r4, [%r15 + %r26] 0x88
	.word 0xc36fe032  ! 1395: PREFETCH_I	prefetch	[%r31 + 0x0032], #one_read
	.word 0xcad3115a  ! 1396: LDSHA_R	ldsha	[%r12, %r26] 0x8a, %r5
	.word 0xc89c913a  ! 1398: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
NC_BIS_SEC488:
	.word 0xc8a4dc7a  ! 1400: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
CP_BIS_NUC489:
	and	%r26,	%r28,	%r26
	.word 0xcca504fa  ! 1402: STWA_R	stwa	%r6, [%r20 + %r26] 0x27
	.word 0xcab3d11a  ! 1404: STHA_R	stha	%r5, [%r15 + %r26] 0x88
	.word 0xc89c913a  ! 1406: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xcaa4501a  ! 1408: STWA_R	stwa	%r5, [%r17 + %r26] 0x80
CP_PST_PRI490:
	.word 0xcbbb199a  ! 1410: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcaf4d03a  ! 1412: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
CP_ATM_QUAD_LD491:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1414: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xca82901a  ! 1415: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r5
NC_BIS_AIUS492:
	.word 0xc4bfc47a  ! 1417: STDA_R	stda	%r2, [%r31 + %r26] 0x23
CP_NUC493:
	.word 0xca85009a  ! 1419: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r5
	.word 0xc5eb839a  ! 1421: PREFETCHA_R	prefetcha	[%r14, %r26] 0x1c, #n_writes
	.word 0xca72c01a  ! 1422: STX_R	stx	%r5, [%r11 + %r26]
	.word 0xcba4913a  ! 1424: STFA_R	sta	%f5, [%r26, %r18]
NC_BIS_SEC494:
	.word 0xd0f4dd7a  ! 1426: STXA_R	stxa	%r8, [%r19 + %r26] 0xeb
CP_BIS_NUC495:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 1428: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
	.word 0xca7b2018  ! 1429: SWAP_I	swap	%r5, [%r12 + 0x0018]
	.word 0xcb02a018  ! 1430: LDF_I	ld	[%r10, 0x0018], %f5
NC_BIS_AIUS496:
	.word 0xd0afc57a  ! 1432: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
CP_BIS_NUC497:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 1434: STBA_R	stba	%r6, [%r20 + %r26] 0x27
	.word 0xcbe3201a  ! 1435: CASA_R	casa	[%r12] %asi, %r26, %r5
	.word 0xc89c913a  ! 1437: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xcbbb511a  ! 1438: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xcad4d13a  ! 1440: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
CHANGE_R26498:
	add	%r26,	%r27,	%r26
CP_BIS_SEC498:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 1442: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xca7ae018  ! 1443: SWAP_I	swap	%r5, [%r11 + 0x0018]
SHORT_FP_PRI499:
	.word 0xcbba9a5a  ! 1445: STDFA_R	stda	%f5, [%r26, %r10]
SET_TL1_500:
	ta	T_CHANGE_TO_TL1
CHANGE_R26501:
	add	%r26,	%r27,	%r26
NC_BIS_NUC501:
	.word 0xc4f544fa  ! 1447: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CP_PST_PRI502:
	.word 0xcbbad91a  ! 1449: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaf2911a  ! 1450: STXA_R	stxa	%r5, [%r10 + %r26] 0x88
CP_BIS_AIUS503:
	and	%r26,	%r28,	%r26
	.word 0xc8a7847a  ! 1452: STWA_R	stwa	%r4, [%r30 + %r26] 0x23
NC_AIUS504:
	.word 0xca87c23a  ! 1454: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r5
SET_TL0_505:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI506:
	and	%r26,	%r28,	%r26
	.word 0xc8ab5c5a  ! 1456: STBA_R	stba	%r4, [%r13 + %r26] 0xe2
CHANGE_PRIV507:
	ta	T_CHANGE_PRIV
CHANGE_R26508:
	add	%r26,	%r27,	%r26
CP_BIS_NUC508:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 1458: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
CP_ATM_QUAD_LD509:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 1460: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
SET_TL1_510:
	ta	T_CHANGE_TO_TL1
CHANGE_R26511:
	add	%r26,	%r27,	%r26
NC_BIS_NUC511:
	.word 0xd0bd45fa  ! 1462: STDA_R	stda	%r8, [%r21 + %r26] 0x2f
	.word 0xcad4903a  ! 1464: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
NC_AIUS512:
	.word 0xca8fc33a  ! 1466: LDUBA_R	lduba	[%r31, %r26] 0x19, %r5
CP_BIS_AIUS513:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 1468: STBA_R	stba	%r2, [%r30 + %r26] 0x23
CP_NUC514:
	.word 0xcacd019a  ! 1470: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r5
	.word 0xc81ac01a  ! 1471: LDD_R	ldd	[%r11 + %r26], %r4
SET_TL0_515:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI516:
	and	%r26,	%r28,	%r26
	.word 0xc8ba9c5a  ! 1473: STDA_R	stda	%r4, [%r10 + %r26] 0xe2
BLK_PRI517:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 1475: LDDFA_R	ldda	[%r12, %r26], %f0
CHANGE_PRIV518:
	ta	T_CHANGE_PRIV
CHANGE_R26519:
	mov	%g0,	%r26
CP_BIS_AIUP519:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 1477: STHA_R	stha	%r2, [%r24 + %r26] 0x22
	.word 0xcaab911a  ! 1479: STBA_R	stba	%r5, [%r14 + %r26] 0x88
	.word 0xc8bcd03a  ! 1481: STDA_R	stda	%r4, [%r19 + %r26] 0x81
NC_BIS_AIUS520:
	.word 0xc8a7c57a  ! 1483: STWA_R	stwa	%r4, [%r31 + %r26] 0x2b
NC_AIUS521:
	.word 0xcadfc33a  ! 1485: LDXA_R	ldxa	[%r31, %r26] 0x19, %r5
	.word 0xcb02801a  ! 1486: LDF_R	ld	[%r10, %r26], %f5
NC_NUC522:
	.word 0xcb9d409a  ! 1488: LDDFA_R	ldda	[%r21, %r26], %f5
	.word 0xcb3a801a  ! 1489: STDF_R	std	%f5, [%r26, %r10]
CHANGE_R26523:
	add	%r26,	%r27,	%r26
CP_BIS_SEC523:
	and	%r26,	%r28,	%r26
	.word 0xc8b49c7a  ! 1491: STHA_R	stha	%r4, [%r18 + %r26] 0xe3
CP_AIUS524:
	.word 0xc89f823a  ! 1493: LDDA_R	ldda	[%r30, %r26] 0x11, %r4
CP_AIUP525:
	.word 0xca8e021a  ! 1495: LDUBA_R	lduba	[%r24, %r26] 0x10, %r5
	.word 0xcac4d03a  ! 1497: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xca84501a  ! 1499: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r5
CHANGE_R26526:
	add	%r26,	%r27,	%r26
CP_BIS_SEC526:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 1501: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
	.word 0xcac2905a  ! 1502: LDSWA_R	ldswa	[%r10, %r26] 0x82, %r5
NC_BLK_SEc527:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1504: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xca6ae01b  ! 1505: LDSTUB_I	ldstub	%r5, [%r11 + 0x001b]
NC_BIS_AIUS528:
	.word 0xd0f7c57a  ! 1507: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
NC_PST_PRI529:
	.word 0xcbbb985a  ! 1509: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xc8bad01a  ! 1510: STDA_R	stda	%r4, [%r11 + %r26] 0x80
	.word 0xca92905a  ! 1511: LDUHA_R	lduha	[%r10, %r26] 0x82, %r5
CHANGE_USER530:
	ta	T_CHANGE_NONPRIV
CHANGE_R26531:
	add	%r26,	%r27,	%r26
CP_BIS_PRI531:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 1513: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xcbbad01a  ! 1514: STDFA_R	stda	%f5, [%r26, %r11]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP533:
	.word 0xc89e031a  ! 1516: LDDA_R	ldda	[%r24, %r26] 0x18, %r4
	.word 0xcad4d13a  ! 1518: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
CP_AIUP534:
	.word 0xc89e021a  ! 1520: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
BLK_PRI535:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 1522: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xcb9a901a  ! 1523: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcac3115a  ! 1524: LDSWA_R	ldswa	[%r12, %r26] 0x8a, %r5
NC_NUC536:
	.word 0xc89d409a  ! 1526: LDDA_R	ldda	[%r21, %r26] 0x04, %r4
CHANGE_CLE537:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS539:
	.word 0xca97c23a  ! 1529: LDUHA_R	lduha	[%r31, %r26] 0x11, %r5
	.word 0xcaacd03a  ! 1531: STBA_R	stba	%r5, [%r19 + %r26] 0x81
	.word 0xcb84903a  ! 1533: LDFA_R	lda	[%r18, %r26], %f5
	.word 0xcab4903a  ! 1535: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xca8b115a  ! 1536: LDUBA_R	lduba	[%r12, %r26] 0x8a, %r5
	.word 0xcb83101a  ! 1537: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xcadcd13a  ! 1539: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
NC_PST_PRI540:
	.word 0xcbbb981a  ! 1541: STDFA_R	stda	%f5, [%r26, %r14]
CHANGE_USER541:
	ta	T_CHANGE_NONPRIV
CHANGE_R26542:
	add	%r26,	%r27,	%r26
NC_BIS_PRI542:
	.word 0xc4abdc5a  ! 1543: STBA_R	stba	%r2, [%r15 + %r26] 0xe2
CHANGE_PRIV543:
	ta	T_CHANGE_PRIV
CHANGE_R26544:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS544:
	.word 0xc4b7c57a  ! 1545: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
	.word 0xca94903a  ! 1547: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
NC_NUC545:
	.word 0xcaf5409a  ! 1549: STXA_R	stxa	%r5, [%r21 + %r26] 0x04
SHORT_FP_PRI546:
	.word 0xcbba9b1a  ! 1551: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca5b6018  ! 1552: LDX_I	ldx	[%r13 + 0x0018], %r5
SHORT_FP_PRI547:
	.word 0xcb9adb1a  ! 1554: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcac4903a  ! 1556: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xca6a801a  ! 1557: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xca83d01a  ! 1559: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r5
CHANGE_R26548:
	mov	%g0,	%r26
CP_BIS_SEC548:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 1561: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
NC_PST_PRI549:
	.word 0xcbbc599a  ! 1563: STDFA_R	stda	%f5, [%r26, %r17]
	.word 0xcb232018  ! 1564: STF_I	st	%f5, [0x0018, %r12]
SET_TL1_550:
	ta	T_CHANGE_TO_TL1
CHANGE_R26551:
	add	%r26,	%r27,	%r26
NC_BIS_NUC551:
	.word 0xc4f545fa  ! 1566: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
	.word 0xca6b001a  ! 1567: LDSTUB_R	ldstub	%r5, [%r12 + %r26]
	.word 0xca94501a  ! 1569: LDUHA_R	lduha	[%r17, %r26] 0x80, %r5
	.word 0xcb9b511a  ! 1570: LDDFA_R	ldda	[%r13, %r26], %f5
NC_NUC552:
	.word 0xca85409a  ! 1573: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r5
SET_TL0_553:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI554:
	and	%r26,	%r28,	%r26
	.word 0xc4a31c5a  ! 1575: STWA_R	stwa	%r2, [%r12 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP556:
	.word 0xc89e021a  ! 1577: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
	.word 0xca02a018  ! 1578: LDUW_I	lduw	[%r10 + 0x0018], %r5
NC_BIS_SEC557:
	.word 0xc4b4dc7a  ! 1580: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xca92d01a  ! 1581: LDUHA_R	lduha	[%r11, %r26] 0x80, %r5
	.word 0xcad4903a  ! 1583: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcab4903a  ! 1585: STHA_R	stha	%r5, [%r18 + %r26] 0x81
CP_NUC558:
	.word 0xc89d009a  ! 1587: LDDA_R	ldda	[%r20, %r26] 0x04, %r4
	.word 0xcab4d13a  ! 1589: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xcb84101a  ! 1591: LDFA_R	lda	[%r16, %r26], %f5
SHORT_FP_PRI559:
	.word 0xcb9b1b1a  ! 1593: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xcacc903a  ! 1595: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
CP_BIS_AIUP560:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 1597: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
NC_BIS_AIUP561:
	.word 0xc4b6445a  ! 1599: STHA_R	stha	%r2, [%r25 + %r26] 0x22
NC_SHORT_FP_SEC562:
	.word 0xcb9cda3a  ! 1601: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcb84d03a  ! 1603: LDFA_R	lda	[%r19, %r26], %f5
SET_TL1_563:
	ta	T_CHANGE_TO_TL1
CHANGE_R26564:
	add	%r26,	%r27,	%r26
NC_BIS_NUC564:
	.word 0xcca544fa  ! 1605: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD565:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 1607: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xcbbc903a  ! 1609: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcac4903a  ! 1611: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcaabd01a  ! 1613: STBA_R	stba	%r5, [%r15 + %r26] 0x80
	.word 0xcad4d03a  ! 1615: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
	.word 0xca94511a  ! 1617: LDUHA_R	lduha	[%r17, %r26] 0x88, %r5
	.word 0xcaaa901a  ! 1618: STBA_R	stba	%r5, [%r10 + %r26] 0x80
	.word 0xca7a801a  ! 1619: SWAP_R	swap	%r5, [%r10 + %r26]
NC_BIS_NUC566:
	.word 0xc4bd44fa  ! 1621: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_AIUS567:
	.word 0xca97c33a  ! 1623: LDUHA_R	lduha	[%r31, %r26] 0x19, %r5
	.word 0xca8cd03a  ! 1625: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xcbba901a  ! 1626: STDFA_R	stda	%f5, [%r26, %r10]
NC_BIS_AIUP568:
	.word 0xc4a6455a  ! 1628: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
	.word 0xcb236018  ! 1629: STF_I	st	%f5, [0x0018, %r13]
	.word 0xca94903a  ! 1631: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcaf4903a  ! 1633: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
SET_TL0_569:
	ta	T_CHANGE_TO_TL0
WR_LEASI_570:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_571:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8bcd03a  ! 1636: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xcab4903a  ! 1638: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xcb1b6018  ! 1639: LDDF_I	ldd	[%r13, 0x0018], %f5
SET_TL1_572:
	ta	T_CHANGE_TO_TL1
CHANGE_R26573:
	add	%r26,	%r27,	%r26
NC_BIS_NUC573:
	.word 0xc8b544fa  ! 1641: STHA_R	stha	%r4, [%r21 + %r26] 0x27
CP_AIUS574:
	.word 0xcb87823a  ! 1643: LDFA_R	lda	[%r30, %r26], %f5
	.word 0xca94903a  ! 1645: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcb9cd03a  ! 1647: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcb22801a  ! 1648: STF_R	st	%f5, [%r26, %r10]
	.word 0xcacbd01a  ! 1650: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r5
	.word 0xcb22e018  ! 1651: STF_I	st	%f5, [0x0018, %r11]
NC_AIUP575:
	.word 0xcac6421a  ! 1653: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r5
	.word 0xca6a801a  ! 1654: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
NC_BIS_AIUP576:
	.word 0xc4f6445a  ! 1656: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xcb83515a  ! 1657: LDFA_R	lda	[%r13, %r26], %f5
NC_BIS_NUC577:
	.word 0xc8ad45fa  ! 1659: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
SHORT_FP_PRI578:
	.word 0xcb9a9a1a  ! 1661: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaa4101a  ! 1663: STWA_R	stwa	%r5, [%r16 + %r26] 0x80
	.word 0xcb84d13a  ! 1665: LDFA_R	lda	[%r19, %r26], %f5
CP_BIS_NUC579:
	and	%r26,	%r28,	%r26
	.word 0xccad05fa  ! 1667: STBA_R	stba	%r6, [%r20 + %r26] 0x2f
	.word 0xca7b401a  ! 1668: SWAP_R	swap	%r5, [%r13 + %r26]
	.word 0xcac4d03a  ! 1670: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xca84d03a  ! 1672: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xca84913a  ! 1674: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r5
NC_AIUS580:
	.word 0xcac7c33a  ! 1676: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r5
NC_BLK_SEc581:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1678: STDFA_R	stda	%f0, [%r26, %r19]
CP_NUC582:
	.word 0xcbbd009a  ! 1680: STDFA_R	stda	%f5, [%r26, %r20]
CP_BIS_AIUP583:
	and	%r26,	%r28,	%r26
	.word 0xc8f6055a  ! 1682: STXA_R	stxa	%r4, [%r24 + %r26] 0x2a
	.word 0xcad2d15a  ! 1683: LDSHA_R	ldsha	[%r11, %r26] 0x8a, %r5
	.word 0xcb3aa018  ! 1684: STDF_I	std	%f5, [0x0018, %r10]
	.word 0xca02a018  ! 1685: LDUW_I	lduw	[%r10 + 0x0018], %r5
	.word 0xcad2905a  ! 1686: LDSHA_R	ldsha	[%r10, %r26] 0x82, %r5
SET_TL0_584:
	ta	T_CHANGE_TO_TL0
WR_LEASI_585:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_586:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xca6ae01b  ! 1688: LDSTUB_I	ldstub	%r5, [%r11 + 0x001b]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP588:
	.word 0xca96031a  ! 1690: LDUHA_R	lduha	[%r24, %r26] 0x18, %r5
	.word 0xcb232018  ! 1691: STF_I	st	%f5, [0x0018, %r12]
CP_PST_PRI589:
	.word 0xcbbad85a  ! 1693: STDFA_R	stda	%f5, [%r26, %r11]
CP_AIUS590:
	.word 0xca87823a  ! 1695: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r5
	.word 0xcac4903a  ! 1697: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcab2911a  ! 1698: STHA_R	stha	%r5, [%r10 + %r26] 0x88
NC_BLK_SEc591:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1700: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc89cd03a  ! 1702: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
BLK_PRI592:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1704: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_R26593:
	add	%r26,	%r27,	%r26
CP_BIS_SEC593:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 1706: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
NC_BIS_AIUP594:
	.word 0xc8be455a  ! 1708: STDA_R	stda	%r4, [%r25 + %r26] 0x2a
	.word 0xcb9a901a  ! 1709: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaa4903a  ! 1711: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcbbc913a  ! 1713: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcbbc903a  ! 1715: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xc8bcd03a  ! 1717: STDA_R	stda	%r4, [%r19 + %r26] 0x81
CHANGE_CLE595:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc16ce02b  ! 1720: PREFETCH_I	prefetch	[%r19 + 0x002b], #n_reads
CHANGE_PRIV596:
	ta	T_CHANGE_PRIV
CHANGE_R26597:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS597:
	.word 0xc8afc47a  ! 1722: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CP_NUC598:
	.word 0xca8d009a  ! 1724: LDUBA_R	lduba	[%r20, %r26] 0x04, %r5
NC_BIS_AIUS599:
	.word 0xc8afc57a  ! 1726: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
CP_BIS_AIUP600:
	and	%r26,	%r28,	%r26
	.word 0xccbe055a  ! 1728: STDA_R	stda	%r6, [%r24 + %r26] 0x2a
	.word 0xcab4101a  ! 1730: STHA_R	stha	%r5, [%r16 + %r26] 0x80
	.word 0xcad4913a  ! 1732: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
NC_NUC601:
	.word 0xcadd409a  ! 1734: LDXA_R	ldxa	[%r21, %r26] 0x04, %r5
NC_AIUS602:
	.word 0xcacfc33a  ! 1736: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r5
	.word 0xcacc501a  ! 1738: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r5
NC_AIUP603:
	.word 0xcb9e421a  ! 1740: LDDFA_R	ldda	[%r25, %r26], %f5
NC_BIS_AIUP604:
	.word 0xd0a6445a  ! 1742: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
	.word 0xcb9a901a  ! 1743: LDDFA_R	ldda	[%r10, %r26], %f5
CP_ATM_QUAD_LD605:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1745: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
SET_TL1_606:
	ta	T_CHANGE_TO_TL1
CHANGE_R26607:
	mov	%g0,	%r26
NC_BIS_NUC607:
	.word 0xc4f545fa  ! 1747: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
	.word 0xcb82d01a  ! 1748: LDFA_R	lda	[%r11, %r26], %f5
	.word 0xcb3b6018  ! 1749: STDF_I	std	%f5, [0x0018, %r13]
	.word 0xcb3aa018  ! 1750: STDF_I	std	%f5, [0x0018, %r10]
CP_ATM_QUAD_LD608:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1752: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xcad4501a  ! 1754: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r5
	.word 0xcaf4903a  ! 1756: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcadb505a  ! 1757: LDXA_R	ldxa	[%r13, %r26] 0x82, %r5
NC_BIS_NUC609:
	.word 0xc4bd44fa  ! 1759: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xca2b401a  ! 1760: STB_R	stb	%r5, [%r13 + %r26]
NC_AIUP610:
	.word 0xcad6431a  ! 1762: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r5
CP_BIS_AIUP611:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 1764: STBA_R	stba	%r6, [%r24 + %r26] 0x22
SHORT_FP_PRI612:
	.word 0xcb9b1a1a  ! 1766: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xca93d11a  ! 1768: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
	.word 0xcad4903a  ! 1770: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcb1b2018  ! 1771: LDDF_I	ldd	[%r12, 0x0018], %f5
SET_TL0_613:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI614:
	.word 0xc8b39c5a  ! 1773: STHA_R	stha	%r4, [%r14 + %r26] 0xe2
NC_BIS_SEC615:
	.word 0xccb4dc7a  ! 1775: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
CHANGE_PRIV616:
	ta	T_CHANGE_PRIV
CHANGE_R26617:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD617:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1777: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_BIS_NUC618:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 1779: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc8bc903a  ! 1781: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc81b001a  ! 1782: LDD_R	ldd	[%r12 + %r26], %r4
CP_BIS_AIUP619:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 1784: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xca84d03a  ! 1786: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r5
	.word 0xca84d13a  ! 1788: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
CP_AIUS620:
	.word 0xcadf823a  ! 1790: LDXA_R	ldxa	[%r30, %r26] 0x11, %r5
	.word 0xca8b105a  ! 1791: LDUBA_R	lduba	[%r12, %r26] 0x82, %r5
SHORT_FP_PRI621:
	.word 0xcbbb1a5a  ! 1793: STDFA_R	stda	%f5, [%r26, %r12]
NC_AIUP622:
	.word 0xcaae421a  ! 1795: STBA_R	stba	%r5, [%r25 + %r26] 0x10
CHANGE_R26623:
	add	%r26,	%r27,	%r26
CP_BIS_SEC623:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 1797: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
CHANGE_R26624:
	add	%r26,	%r27,	%r26
CP_BIS_SEC624:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 1799: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
CP_AIUS625:
	.word 0xcac7833a  ! 1801: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r5
	.word 0xcac4903a  ! 1803: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
CHANGE_USER626:
	ta	T_CHANGE_NONPRIV
CHANGE_R26627:
	add	%r26,	%r27,	%r26
CP_BIS_PRI627:
	and	%r26,	%r28,	%r26
	.word 0xd0b31c5a  ! 1805: STHA_R	stha	%r8, [%r12 + %r26] 0xe2
CHANGE_PRIV628:
	ta	T_CHANGE_PRIV
CHANGE_R26629:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD629:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1807: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xcbf3601a  ! 1808: CASXA_R	casxa	[%r13]%asi, %r26, %r5
NC_BIS_AIUS630:
	.word 0xd0bfc47a  ! 1810: STDA_R	stda	%r8, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD631:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 1812: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	.word 0xcb3b2018  ! 1813: STDF_I	std	%f5, [0x0018, %r12]
NC_NUC632:
	.word 0xca85409a  ! 1815: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r5
	.word 0xcb03001a  ! 1816: LDF_R	ld	[%r12, %r26], %f5
	.word 0xcb9a911a  ! 1817: LDDFA_R	ldda	[%r10, %r26], %f5
NC_BIS_AIUP633:
	.word 0xccb6445a  ! 1819: STHA_R	stha	%r6, [%r25 + %r26] 0x22
	.word 0xcadb911a  ! 1821: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
CP_AIUP634:
	.word 0xcb9e031a  ! 1823: LDDFA_R	ldda	[%r24, %r26], %f5
NC_BLK_SEc635:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1825: LDDFA_R	ldda	[%r19, %r26], %f16
CP_AIUP636:
	.word 0xcba6031a  ! 1827: STFA_R	sta	%f5, [%r26, %r24]
CP_BIS_QUAD_LD637:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1829: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
CP_AIUS638:
	.word 0xcadf833a  ! 1831: LDXA_R	ldxa	[%r30, %r26] 0x19, %r5
	.word 0xc8bbd01a  ! 1833: STDA_R	stda	%r4, [%r15 + %r26] 0x80
CP_BIS_NUC639:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 1835: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
	.word 0xc89b901a  ! 1837: LDDA_R	ldda	[%r14, %r26] 0x80, %r4
	.word 0xcaab501a  ! 1838: STBA_R	stba	%r5, [%r13 + %r26] 0x80
	.word 0xca94d03a  ! 1840: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
NC_NUC640:
	.word 0xcad5419a  ! 1842: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r5
	.word 0xcad3d11a  ! 1844: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r5
	.word 0xca92905a  ! 1845: LDUHA_R	lduha	[%r10, %r26] 0x82, %r5
NC_PST_PRI641:
	.word 0xcbbc591a  ! 1847: STDFA_R	stda	%f5, [%r26, %r17]
CP_ATM_QUAD_LD642:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 1849: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
BLK_PRI643:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 1851: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc7efd11a  ! 1853: PREFETCHA_R	prefetcha	[%r31, %r26] 0x88, #one_write
	.word 0xcaacd13a  ! 1855: STBA_R	stba	%r5, [%r19 + %r26] 0x89
NC_BLK_SEc644:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1857: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcb1b6018  ! 1858: LDDF_I	ldd	[%r13, 0x0018], %f5
	.word 0xc89c913a  ! 1860: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xcba4501a  ! 1862: STFA_R	sta	%f5, [%r26, %r17]
CP_AIUS645:
	.word 0xca8f823a  ! 1864: LDUBA_R	lduba	[%r30, %r26] 0x11, %r5
NC_PST_PRI646:
	.word 0xcbbb981a  ! 1866: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcbbcd03a  ! 1868: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xcbe2a01a  ! 1869: CASA_R	casa	[%r10] %asi, %r26, %r5
NC_BIS_SEC647:
	.word 0xccb4dc7a  ! 1871: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
	.word 0xcadcd03a  ! 1873: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
CP_AIUP648:
	.word 0xcaae021a  ! 1875: STBA_R	stba	%r5, [%r24 + %r26] 0x10
NC_BLK_SEc649:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1877: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xca33401a  ! 1878: STH_R	sth	%r5, [%r13 + %r26]
	.word 0xcafad01a  ! 1879: SWAPA_R	swapa	%r5, [%r11 + %r26] 0x80
CP_BIS_QUAD_LD650:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 1881: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
CHANGE_R26651:
	add	%r26,	%r27,	%r26
CP_BIS_SEC651:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 1883: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
	.word 0xcaa4903a  ! 1885: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcba4101a  ! 1887: STFA_R	sta	%f5, [%r26, %r16]
	.word 0xca8c903a  ! 1889: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
NC_BIS_SEC652:
	.word 0xccb4dd7a  ! 1891: STHA_R	stha	%r6, [%r19 + %r26] 0xeb
	.word 0xca94903a  ! 1893: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
SHORT_FP_PRI653:
	.word 0xcbba9b1a  ! 1895: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcaaa901a  ! 1896: STBA_R	stba	%r5, [%r10 + %r26] 0x80
	.word 0xcaacd03a  ! 1898: STBA_R	stba	%r5, [%r19 + %r26] 0x81
	.word 0xcba3901a  ! 1900: STFA_R	sta	%f5, [%r26, %r14]
	.word 0xcaac903a  ! 1902: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xcab4903a  ! 1904: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xc3efe01d  ! 1906: PREFETCHA_I	prefetcha	[%r31, + 0x001d] %asi, #one_read
SET_TL1_654:
	ta	T_CHANGE_TO_TL1
CHANGE_R26655:
	add	%r26,	%r27,	%r26
NC_BIS_NUC655:
	.word 0xc8a544fa  ! 1908: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD656:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 1910: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
BLK_PRI657:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1912: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xcad3901a  ! 1914: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
CP_AIUP658:
	.word 0xcbbe021a  ! 1916: STDFA_R	stda	%f5, [%r26, %r24]
	.word 0xca52e01a  ! 1917: LDSH_I	ldsh	[%r11 + 0x001a], %r5
	.word 0xca84111a  ! 1919: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r5
	.word 0xcad4d13a  ! 1921: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
	.word 0xcbbc101a  ! 1923: STDFA_R	stda	%f5, [%r26, %r16]
	.word 0xcbbcd03a  ! 1925: STDFA_R	stda	%f5, [%r26, %r19]
NC_BIS_NUC659:
	.word 0xc4b544fa  ! 1927: STHA_R	stha	%r2, [%r21 + %r26] 0x27
SET_TL0_660:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI661:
	and	%r26,	%r28,	%r26
	.word 0xc8aa9d5a  ! 1929: STBA_R	stba	%r4, [%r10 + %r26] 0xea
	.word 0xcac2915a  ! 1930: LDSWA_R	ldswa	[%r10, %r26] 0x8a, %r5
	.word 0xca7b2018  ! 1931: SWAP_I	swap	%r5, [%r12 + 0x0018]
WR_LEASI_662:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_663:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcaf2d01a  ! 1933: STXA_R	stxa	%r5, [%r11 + %r26] 0x80
	.word 0xca94d03a  ! 1935: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xcad4d13a  ! 1937: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r5
	.word 0xcbf2e01a  ! 1938: CASXA_R	casxa	[%r11]%asi, %r26, %r5
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS665:
	.word 0xcaafc33a  ! 1940: STBA_R	stba	%r5, [%r31 + %r26] 0x19
CP_BIS_QUAD_LD666:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 1942: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xc8bcd03a  ! 1944: STDA_R	stda	%r4, [%r19 + %r26] 0x81
CP_NUC667:
	.word 0xcb85009a  ! 1946: LDFA_R	lda	[%r20, %r26], %f5
CHANGE_USER668:
	ta	T_CHANGE_NONPRIV
CHANGE_R26669:
	add	%r26,	%r27,	%r26
CP_BIS_PRI669:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 1948: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	.word 0xcad4913a  ! 1950: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP671:
	.word 0xc89e431a  ! 1952: LDDA_R	ldda	[%r25, %r26] 0x18, %r4
CP_AIUP672:
	.word 0xca96031a  ! 1954: LDUHA_R	lduha	[%r24, %r26] 0x18, %r5
	.word 0xca93d01a  ! 1956: LDUHA_R	lduha	[%r15, %r26] 0x80, %r5
CP_AIUP673:
	.word 0xcab6021a  ! 1958: STHA_R	stha	%r5, [%r24 + %r26] 0x10
	.word 0xcb3aa018  ! 1959: STDF_I	std	%f5, [0x0018, %r10]
	.word 0xcb9cd03a  ! 1961: LDDFA_R	ldda	[%r19, %r26], %f5
NC_BIS_AIUS674:
	.word 0xc4bfc47a  ! 1963: STDA_R	stda	%r2, [%r31 + %r26] 0x23
CP_AIUP675:
	.word 0xcb9e021a  ! 1965: LDDFA_R	ldda	[%r24, %r26], %f5
	.word 0xcac4913a  ! 1967: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
CP_BIS_AIUP676:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1969: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CP_AIUS677:
	.word 0xca97823a  ! 1971: LDUHA_R	lduha	[%r30, %r26] 0x11, %r5
	.word 0xca94d03a  ! 1973: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
NC_PST_PRI678:
	.word 0xcbbbd99a  ! 1975: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xcab4d13a  ! 1977: STHA_R	stha	%r5, [%r19 + %r26] 0x89
CP_AIUS679:
	.word 0xcac7823a  ! 1979: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r5
CP_BIS_NUC680:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 1981: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
CP_PST_PRI681:
	.word 0xcbbb599a  ! 1983: STDFA_R	stda	%f5, [%r26, %r13]
SHORT_FP_PRI682:
	.word 0xcb9a9b5a  ! 1985: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaac903a  ! 1987: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xcad4903a  ! 1989: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xca7a801a  ! 1990: SWAP_R	swap	%r5, [%r10 + %r26]
	.word 0xcbbc903a  ! 1992: STDFA_R	stda	%f5, [%r26, %r18]
CP_ATM_QUAD_LD683:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1994: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xcba4d03a  ! 1996: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcb82901a  ! 1997: LDFA_R	lda	[%r10, %r26], %f5
NC_BIS_AIUS684:
	.word 0xc4afc57a  ! 1999: STBA_R	stba	%r2, [%r31 + %r26] 0x2b
	.word 0xca4b401a  ! 2000: LDSB_R	ldsb	[%r13 + %r26], %r5
CP_AIUP685:
	.word 0xc8be021a  ! 2002: STDA_R	stda	%r4, [%r24 + %r26] 0x10
BLK_PRI686:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2004: LDDFA_R	ldda	[%r12, %r26], %f0
SHORT_FP_PRI687:
	.word 0xcbba9a1a  ! 2006: STDFA_R	stda	%f5, [%r26, %r10]
SET_TL1_688:
	ta	T_CHANGE_TO_TL1
CHANGE_R26689:
	add	%r26,	%r27,	%r26
NC_BIS_NUC689:
	.word 0xc8ad44fa  ! 2008: STBA_R	stba	%r4, [%r21 + %r26] 0x27
SET_TL0_690:
	ta	T_CHANGE_TO_TL0
CHANGE_R26691:
	add	%r26,	%r27,	%r26
NC_BIS_SEC691:
	.word 0xccf4dc7a  ! 2010: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xcaa3d01a  ! 2012: STWA_R	stwa	%r5, [%r15 + %r26] 0x80
	.word 0xcab4d13a  ! 2014: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xcac4d13a  ! 2016: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC693:
	.word 0xca8d419a  ! 2018: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r5
	.word 0xcaa4903a  ! 2020: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
	.word 0xcb3ac01a  ! 2021: STDF_R	std	%f5, [%r26, %r11]
CHANGE_TLE694:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS696:
	.word 0xcaf7c23a  ! 2024: STXA_R	stxa	%r5, [%r31 + %r26] 0x11
	.word 0xcab2901a  ! 2025: STHA_R	stha	%r5, [%r10 + %r26] 0x80
CHANGE_R26697:
	add	%r26,	%r27,	%r26
CP_BIS_SEC697:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 2027: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
	.word 0xcb82915a  ! 2028: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xca94913a  ! 2030: LDUHA_R	lduha	[%r18, %r26] 0x89, %r5
	.word 0xcb9b111a  ! 2031: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xca7a801a  ! 2032: SWAP_R	swap	%r5, [%r10 + %r26]
BLK_PRI698:
	and	%r26,	%r29,	%r26
	.word 0xe19b1f1a  ! 2034: LDDFA_R	ldda	[%r12, %r26], %f16
NC_BIS_AIUP699:
	.word 0xd0ae445a  ! 2036: STBA_R	stba	%r8, [%r25 + %r26] 0x22
NC_BLK_SEc700:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2038: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcadb911a  ! 2040: LDXA_R	ldxa	[%r14, %r26] 0x88, %r5
NC_BIS_AIUS701:
	.word 0xccb7c57a  ! 2042: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
	.word 0xcaf3101a  ! 2043: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
NC_NUC702:
	.word 0xca95409a  ! 2045: LDUHA_R	lduha	[%r21, %r26] 0x04, %r5
	.word 0xcac4d03a  ! 2047: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xcaac913a  ! 2049: STBA_R	stba	%r5, [%r18 + %r26] 0x89
CP_BIS_QUAD_LD703:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 2051: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
	.word 0xcbbc913a  ! 2053: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcb82905a  ! 2054: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcac4913a  ! 2056: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
	.word 0xca8a901a  ! 2057: LDUBA_R	lduba	[%r10, %r26] 0x80, %r5
	.word 0xca02a018  ! 2058: LDUW_I	lduw	[%r10 + 0x0018], %r5
SET_TL1_704:
	ta	T_CHANGE_TO_TL1
CHANGE_R26705:
	mov	%g0,	%r26
NC_BIS_NUC705:
	.word 0xc8bd45fa  ! 2060: STDA_R	stda	%r4, [%r21 + %r26] 0x2f
CP_BIS_QUAD_LD706:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2062: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
SET_TL0_707:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI708:
	.word 0xc4a45c5a  ! 2064: STWA_R	stwa	%r2, [%r17 + %r26] 0xe2
	.word 0xcadc913a  ! 2066: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
	.word 0xcb84501a  ! 2068: LDFA_R	lda	[%r17, %r26], %f5
	.word 0xc89cd13a  ! 2070: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xcbbc903a  ! 2072: STDFA_R	stda	%f5, [%r26, %r18]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS710:
	.word 0xcad7823a  ! 2074: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r5
	.word 0xcba2901a  ! 2075: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcab3101a  ! 2076: STHA_R	stha	%r5, [%r12 + %r26] 0x80
	.word 0xc89cd13a  ! 2078: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
NC_BIS_AIUP711:
	.word 0xc4b6445a  ! 2080: STHA_R	stha	%r2, [%r25 + %r26] 0x22
CP_NUC712:
	.word 0xc89d009a  ! 2082: LDDA_R	ldda	[%r20, %r26] 0x04, %r4
CP_BIS_QUAD_LD713:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2084: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xcb83901a  ! 2086: LDFA_R	lda	[%r14, %r26], %f5
	.word 0xcaccd03a  ! 2088: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
NC_PST_PRI714:
	.word 0xcbbbd81a  ! 2090: STDFA_R	stda	%f5, [%r26, %r15]
	.word 0xca8bd01a  ! 2092: LDUBA_R	lduba	[%r15, %r26] 0x80, %r5
CP_BIS_AIUP715:
	and	%r26,	%r28,	%r26
	.word 0xc49e055a  ! 2094: LDDA_R	ldda	[%r24, %r26] 0x2a, %r2
	.word 0xcaab501a  ! 2095: STBA_R	stba	%r5, [%r13 + %r26] 0x80
CP_NUC716:
	.word 0xcba5009a  ! 2097: STFA_R	sta	%f5, [%r26, %r20]
	.word 0xc89cd13a  ! 2099: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xcacc903a  ! 2101: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
CP_BIS_QUAD_LD717:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 2103: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
SET_TL1_718:
	ta	T_CHANGE_TO_TL1
CHANGE_R26719:
	add	%r26,	%r27,	%r26
NC_BIS_NUC719:
	.word 0xd0bd44fa  ! 2105: STDA_R	stda	%r8, [%r21 + %r26] 0x27
SHORT_FP_PRI720:
	.word 0xcbba9b1a  ! 2107: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xc89c511a  ! 2109: LDDA_R	ldda	[%r17, %r26] 0x88, %r4
	.word 0xcab4d13a  ! 2111: STHA_R	stha	%r5, [%r19 + %r26] 0x89
BLK_PRI721:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2113: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xcab4511a  ! 2115: STHA_R	stha	%r5, [%r17 + %r26] 0x88
	.word 0xcba4d03a  ! 2117: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcaacd03a  ! 2119: STBA_R	stba	%r5, [%r19 + %r26] 0x81
SET_TL0_722:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI723:
	.word 0xcca45d5a  ! 2121: STWA_R	stwa	%r6, [%r17 + %r26] 0xea
	.word 0xc89c903a  ! 2123: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xc8bad01a  ! 2124: STDA_R	stda	%r4, [%r11 + %r26] 0x80
	.word 0xcb1aa018  ! 2125: LDDF_I	ldd	[%r10, 0x0018], %f5
	.word 0xcb84d03a  ! 2127: LDFA_R	lda	[%r19, %r26], %f5
CHANGE_R26724:
	add	%r26,	%r27,	%r26
CP_BIS_SEC724:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 2129: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
	.word 0xca84913a  ! 2131: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r5
	.word 0xca2b401a  ! 2132: STB_R	stb	%r5, [%r13 + %r26]
SHORT_FP_PRI725:
	.word 0xcb9a9b1a  ! 2134: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xcaab101a  ! 2135: STBA_R	stba	%r5, [%r12 + %r26] 0x80
NC_SHORT_FP_SEC726:
	.word 0xcb9cdb7a  ! 2137: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca94903a  ! 2139: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
	.word 0xcaac903a  ! 2141: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_SHORT_FP_SEC727:
	.word 0xcb9cdb7a  ! 2143: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcacbd01a  ! 2145: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r5
	.word 0xcaac903a  ! 2147: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xca92915a  ! 2148: LDUHA_R	lduha	[%r10, %r26] 0x8a, %r5
NC_BLK_SEc728:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2150: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcb9c111a  ! 2152: LDDFA_R	ldda	[%r16, %r26], %f5
	.word 0xcbf2e01a  ! 2153: CASXA_R	casxa	[%r11]%asi, %r26, %r5
	.word 0xcaf4903a  ! 2155: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
CP_BIS_PRI729:
	and	%r26,	%r28,	%r26
	.word 0xc89b1c5a  ! 2157: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
	.word 0xcba3501a  ! 2158: STFA_R	sta	%f5, [%r26, %r13]
	.word 0xca7a801a  ! 2159: SWAP_R	swap	%r5, [%r10 + %r26]
	.word 0xcb22801a  ! 2160: STF_R	st	%f5, [%r26, %r10]
	.word 0xcac4d13a  ! 2162: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r5
CHANGE_TLE730:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS732:
	.word 0xcacfc33a  ! 2165: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r5
	.word 0xcad3d11a  ! 2167: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r5
SHORT_FP_PRI733:
	.word 0xcb9a9a5a  ! 2169: LDDFA_R	ldda	[%r10, %r26], %f5
SHORT_FP_PRI734:
	.word 0xcb9a9a5a  ! 2171: LDDFA_R	ldda	[%r10, %r26], %f5
	.word 0xca83911a  ! 2173: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r5
	.word 0xcbbb901a  ! 2175: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcbe2a01a  ! 2176: CASA_R	casa	[%r10] %asi, %r26, %r5
CP_BIS_NUC735:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 2178: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
	.word 0xcb9b901a  ! 2180: LDDFA_R	ldda	[%r14, %r26], %f5
	.word 0xc89c913a  ! 2182: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
NC_AIUP736:
	.word 0xcace431a  ! 2184: LDSBA_R	ldsba	[%r25, %r26] 0x18, %r5
	.word 0xcba3511a  ! 2185: STFA_R	sta	%f5, [%r26, %r13]
CP_ATM_QUAD_LD737:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2187: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xcba2d01a  ! 2188: STFA_R	sta	%f5, [%r26, %r11]
	.word 0xcab4903a  ! 2190: STHA_R	stha	%r5, [%r18 + %r26] 0x81
	.word 0xca93901a  ! 2192: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
	.word 0xcafb511a  ! 2193: SWAPA_R	swapa	%r5, [%r13 + %r26] 0x88
	.word 0xcadc903a  ! 2195: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xca94d03a  ! 2197: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
	.word 0xcaca911a  ! 2198: LDSBA_R	ldsba	[%r10, %r26] 0x88, %r5
CP_PST_PRI738:
	.word 0xcbbb199a  ! 2200: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcad4913a  ! 2202: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcaccd03a  ! 2204: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcba3501a  ! 2205: STFA_R	sta	%f5, [%r26, %r13]
WR_LEASI_739:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_740:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_R26741:
	add	%r26,	%r27,	%r26
CP_BIS_SEC741:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 2208: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
NC_BLK_SEc742:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2210: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xcadcd03a  ! 2212: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
BLK_PRI743:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 2214: STDFA_R	stda	%f16, [%r26, %r11]
CP_ATM_QUAD_LD744:
	and	%r26,	%r29,	%r26
	.word 0xc89ac59a  ! 2216: LDDA_R	ldda	[%r11, %r26] 0x2c, %r4
SHORT_FP_PRI745:
	.word 0xcb9adb5a  ! 2218: LDDFA_R	ldda	[%r11, %r26], %f5
NC_BLK_SEc746:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2220: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcb9ad11a  ! 2221: LDDFA_R	ldda	[%r11, %r26], %f5
CHANGE_CLE747:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_PST_PRI748:
	.word 0xcbbb191a  ! 2224: STDFA_R	stda	%f5, [%r26, %r12]
CHANGE_PRIV749:
	ta	T_CHANGE_PRIV
CHANGE_R26750:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP750:
	and	%r26,	%r28,	%r26
	.word 0xc4a6055a  ! 2226: STWA_R	stwa	%r2, [%r24 + %r26] 0x2a
NC_BIS_SEC751:
	.word 0xc8bcdc7a  ! 2228: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
	.word 0xca94903a  ! 2230: LDUHA_R	lduha	[%r18, %r26] 0x81, %r5
CHANGE_CLE752:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcb83115a  ! 2232: LDFA_R	lda	[%r12, %r26], %f5
WR_LEASI_753:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_754:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcb83911a  ! 2235: LDFA_R	lda	[%r14, %r26], %f5
	.word 0xcb84d13a  ! 2237: LDFA_R	lda	[%r19, %r26], %f5
NC_BLK_SEc755:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2239: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_PRI756:
	and	%r26,	%r28,	%r26
	.word 0xc4ab1c5a  ! 2241: STBA_R	stba	%r2, [%r12 + %r26] 0xe2
NC_BIS_PRI757:
	.word 0xc4f3dc5a  ! 2243: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
NC_BIS_PRI758:
	.word 0xd0a41c5a  ! 2245: STWA_R	stwa	%r8, [%r16 + %r26] 0xe2
NC_SHORT_FP_SEC759:
	.word 0xcb9cda7a  ! 2247: LDDFA_R	ldda	[%r19, %r26], %f5
CP_PST_PRI760:
	.word 0xcbba981a  ! 2249: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xca84903a  ! 2251: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r5
	.word 0xca94501a  ! 2253: LDUHA_R	lduha	[%r17, %r26] 0x80, %r5
NC_BIS_SEC761:
	.word 0xc4bcdc7a  ! 2255: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV762:
	ta	T_CHANGE_PRIV
CHANGE_R26763:
	add	%r26,	%r27,	%r26
CP_BIS_NUC763:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 2257: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xca94101a  ! 2259: LDUHA_R	lduha	[%r16, %r26] 0x80, %r5
	.word 0xcaa4101a  ! 2261: STWA_R	stwa	%r5, [%r16 + %r26] 0x80
	.word 0xca53001a  ! 2262: LDSH_R	ldsh	[%r12 + %r26], %r5
	.word 0xcaeb511a  ! 2263: LDSTUBA_R	ldstuba	%r5, [%r13 + %r26] 0x88
	.word 0xcafad11a  ! 2264: SWAPA_R	swapa	%r5, [%r11 + %r26] 0x88
NC_BIS_AIUS764:
	.word 0xc4a7c47a  ! 2266: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
	.word 0xc89c903a  ! 2268: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xcad4913a  ! 2270: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcb032018  ! 2271: LDF_I	ld	[%r12, 0x0018], %f5
	.word 0xc83ac01a  ! 2272: STD_R	std	%r4, [%r11 + %r26]
	.word 0xcaacd13a  ! 2274: STBA_R	stba	%r5, [%r19 + %r26] 0x89
	.word 0xca83d01a  ! 2276: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r5
SET_TL1_765:
	ta	T_CHANGE_TO_TL1
CHANGE_R26766:
	mov	%g0,	%r26
NC_BIS_NUC766:
	.word 0xc4ad45fa  ! 2278: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
NC_SHORT_FP_SEC767:
	.word 0xcb9cda3a  ! 2280: LDDFA_R	ldda	[%r19, %r26], %f5
NC_NUC768:
	.word 0xcbbd409a  ! 2282: STDFA_R	stda	%f5, [%r26, %r21]
	.word 0xc8bcd13a  ! 2284: STDA_R	stda	%r4, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD769:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 2286: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
NC_AIUS770:
	.word 0xcacfc23a  ! 2288: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r5
NC_BIS_AIUP771:
	.word 0xd0ae455a  ! 2290: STBA_R	stba	%r8, [%r25 + %r26] 0x2a
CP_NUC772:
	.word 0xcbf5201a  ! 2292: CASXA_R	casxa	[%r20]%asi, %r26, %r5
	.word 0xcac4903a  ! 2294: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcad3901a  ! 2296: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
	.word 0xcaac913a  ! 2298: STBA_R	stba	%r5, [%r18 + %r26] 0x89
	.word 0xcbbc903a  ! 2300: STDFA_R	stda	%f5, [%r26, %r18]
CP_AIUS773:
	.word 0xca97823a  ! 2302: LDUHA_R	lduha	[%r30, %r26] 0x11, %r5
CHANGE_R26774:
	add	%r26,	%r27,	%r26
CP_BIS_SEC774:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2304: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_AIUP775:
	.word 0xcaf6021a  ! 2306: STXA_R	stxa	%r5, [%r24 + %r26] 0x10
	.word 0xcb02801a  ! 2307: LDF_R	ld	[%r10, %r26], %f5
CP_BIS_NUC776:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 2309: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
CP_NUC777:
	.word 0xca85009a  ! 2311: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r5
	.word 0xcad4903a  ! 2313: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r5
	.word 0xcbbcd03a  ! 2315: STDFA_R	stda	%f5, [%r26, %r19]
SET_TL0_778:
	ta	T_CHANGE_TO_TL0
CHANGE_R26779:
	add	%r26,	%r27,	%r26
NC_BIS_SEC779:
	.word 0xc8a4dc7a  ! 2317: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
NC_PST_PRI780:
	.word 0xcbbb995a  ! 2319: STDFA_R	stda	%f5, [%r26, %r14]
CHANGE_PRIV781:
	ta	T_CHANGE_PRIV
CHANGE_R26782:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS782:
	.word 0xc8b7c57a  ! 2321: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
NC_BLK_SEc783:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2323: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC784:
	.word 0xcbf5201a  ! 2325: CASXA_R	casxa	[%r20]%asi, %r26, %r5
NC_AIUP785:
	.word 0xcab6421a  ! 2327: STHA_R	stha	%r5, [%r25 + %r26] 0x10
NC_AIUS786:
	.word 0xcaafc23a  ! 2329: STBA_R	stba	%r5, [%r31 + %r26] 0x11
BLK_PRI787:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 2331: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc83a801a  ! 2332: STD_R	std	%r4, [%r10 + %r26]
SET_TL1_788:
	ta	T_CHANGE_TO_TL1
CHANGE_R26789:
	add	%r26,	%r27,	%r26
NC_BIS_NUC789:
	.word 0xc4ad45fa  ! 2334: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
CP_ATM_QUAD_LD790:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2336: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
NC_AIUS791:
	.word 0xcadfc23a  ! 2338: LDXA_R	ldxa	[%r31, %r26] 0x11, %r5
CP_BIS_NUC792:
	and	%r26,	%r28,	%r26
	.word 0xc8bd04fa  ! 2340: STDA_R	stda	%r4, [%r20 + %r26] 0x27
	.word 0xca84d13a  ! 2342: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r5
SHORT_FP_PRI793:
	.word 0xcbbb1a1a  ! 2344: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcadcd13a  ! 2346: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
	.word 0xca8cd03a  ! 2348: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
BLK_PRI794:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 2350: LDDFA_R	ldda	[%r13, %r26], %f16
CHANGE_R26795:
	add	%r26,	%r27,	%r26
CP_BIS_SEC795:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 2352: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
SHORT_FP_PRI796:
	.word 0xcb9b1a5a  ! 2354: LDDFA_R	ldda	[%r12, %r26], %f5
	.word 0xca94511a  ! 2356: LDUHA_R	lduha	[%r17, %r26] 0x88, %r5
	.word 0xca6a801a  ! 2357: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xcb9a911a  ! 2358: LDDFA_R	ldda	[%r10, %r26], %f5
CP_AIUS797:
	.word 0xcaaf823a  ! 2360: STBA_R	stba	%r5, [%r30 + %r26] 0x11
	.word 0xcba4903a  ! 2362: STFA_R	sta	%f5, [%r26, %r18]
	.word 0xcad3911a  ! 2364: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r5
CP_BIS_NUC798:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 2366: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
SET_TL0_799:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI800:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 2368: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xca7ae018  ! 2369: SWAP_I	swap	%r5, [%r11 + 0x0018]
CHANGE_PRIV801:
	ta	T_CHANGE_PRIV
CHANGE_R26802:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD802:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2371: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xca7aa018  ! 2372: SWAP_I	swap	%r5, [%r10 + 0x0018]
	.word 0xcb82915a  ! 2373: LDFA_R	lda	[%r10, %r26], %f5
	.word 0xcaa4501a  ! 2375: STWA_R	stwa	%r5, [%r17 + %r26] 0x80
	.word 0xcaf3101a  ! 2376: STXA_R	stxa	%r5, [%r12 + %r26] 0x80
	.word 0xcaf4903a  ! 2378: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcba2911a  ! 2379: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcb84903a  ! 2381: LDFA_R	lda	[%r18, %r26], %f5
CHANGE_USER803:
	ta	T_CHANGE_NONPRIV
CHANGE_R26804:
	add	%r26,	%r27,	%r26
CP_BIS_PRI804:
	and	%r26,	%r28,	%r26
	.word 0xd0f2dd5a  ! 2383: STXA_R	stxa	%r8, [%r11 + %r26] 0xea
	.word 0xcaaad11a  ! 2384: STBA_R	stba	%r5, [%r11 + %r26] 0x88
	.word 0xcb9a905a  ! 2385: LDDFA_R	ldda	[%r10, %r26], %f5
CP_PST_PRI805:
	.word 0xcbbad91a  ! 2387: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcac4d03a  ! 2389: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS807:
	.word 0xc89fc23a  ! 2391: LDDA_R	ldda	[%r31, %r26] 0x11, %r4
	.word 0xcbe2e01a  ! 2392: CASA_R	casa	[%r11] %asi, %r26, %r5
NC_BLK_SEc808:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2394: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xcaf3901a  ! 2396: STXA_R	stxa	%r5, [%r14 + %r26] 0x80
SET_TL1_809:
	ta	T_CHANGE_TO_TL1
CHANGE_R26810:
	add	%r26,	%r27,	%r26
NC_BIS_NUC810:
	.word 0xd0b545fa  ! 2398: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
	.word 0xcb83901a  ! 2400: LDFA_R	lda	[%r14, %r26], %f5
	.word 0xca94d03a  ! 2402: LDUHA_R	lduha	[%r19, %r26] 0x81, %r5
CP_ATM_QUAD_LD811:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 2404: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
CHANGE_R26812:
	add	%r26,	%r27,	%r26
CP_BIS_SEC812:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 2406: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
SET_TL0_813:
	ta	T_CHANGE_TO_TL0
WR_LEASI_814:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_815:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcba4d03a  ! 2409: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xcb9b901a  ! 2411: LDDFA_R	ldda	[%r14, %r26], %f5
	.word 0xcaacd03a  ! 2413: STBA_R	stba	%r5, [%r19 + %r26] 0x81
	.word 0xcaa4d03a  ! 2415: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC817:
	.word 0xca8d409a  ! 2417: LDUBA_R	lduba	[%r21, %r26] 0x04, %r5
BLK_PRI818:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 2419: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xcb9b101a  ! 2420: LDDFA_R	ldda	[%r12, %r26], %f5
NC_AIUS819:
	.word 0xca8fc23a  ! 2422: LDUBA_R	lduba	[%r31, %r26] 0x11, %r5
	.word 0xcad4d03a  ! 2424: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r5
BLK_PRI820:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 2426: STDFA_R	stda	%f0, [%r26, %r12]
NC_NUC821:
	.word 0xcba5419a  ! 2428: STFA_R	sta	%f5, [%r26, %r21]
	.word 0xcb3ac01a  ! 2429: STDF_R	std	%f5, [%r26, %r11]
	.word 0xca8cd03a  ! 2431: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
CHANGE_USER822:
	ta	T_CHANGE_NONPRIV
CHANGE_R26823:
	add	%r26,	%r27,	%r26
NC_BIS_PRI823:
	.word 0xc4f3dc5a  ! 2433: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
	.word 0xcacc903a  ! 2435: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC825:
	.word 0xcab5009a  ! 2437: STHA_R	stha	%r5, [%r20 + %r26] 0x04
CP_PST_PRI826:
	.word 0xcbbad99a  ! 2439: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcb23401a  ! 2440: STF_R	st	%f5, [%r26, %r13]
	.word 0xca236018  ! 2441: STW_I	stw	%r5, [%r13 + 0x0018]
CHANGE_R26827:
	add	%r26,	%r27,	%r26
CP_BIS_SEC827:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 2443: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
	.word 0xca8cd13a  ! 2445: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
CP_NUC828:
	.word 0xcab5019a  ! 2447: STHA_R	stha	%r5, [%r20 + %r26] 0x0c
	.word 0xe96a801a  ! 2449: PREFETCH_R	prefetch	[%r10 + %r26], #20
	.word 0xcb83111a  ! 2450: LDFA_R	lda	[%r12, %r26], %f5
SET_TL1_829:
	ta	T_CHANGE_TO_TL1
CHANGE_R26830:
	add	%r26,	%r27,	%r26
NC_BIS_NUC830:
	.word 0xc4ad44fa  ! 2452: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xcbbcd03a  ! 2454: STDFA_R	stda	%f5, [%r26, %r19]
	.word 0xc89c903a  ! 2456: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xca43001a  ! 2457: LDSW_R	ldsw	[%r12 + %r26], %r5
	.word 0xcad2915a  ! 2458: LDSHA_R	ldsha	[%r10, %r26] 0x8a, %r5
	.word 0xca7b6018  ! 2459: SWAP_I	swap	%r5, [%r13 + 0x0018]
	.word 0xcbbc903a  ! 2461: STDFA_R	stda	%f5, [%r26, %r18]
NC_BLK_SEc831:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2463: LDDFA_R	ldda	[%r19, %r26], %f16
CP_AIUP832:
	.word 0xca86021a  ! 2465: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r5
NC_BIS_NUC833:
	.word 0xccbd44fa  ! 2467: STDA_R	stda	%r6, [%r21 + %r26] 0x27
CP_AIUS834:
	.word 0xcab7823a  ! 2469: STHA_R	stha	%r5, [%r30 + %r26] 0x11
SHORT_FP_PRI835:
	.word 0xcbbb5b5a  ! 2471: STDFA_R	stda	%f5, [%r26, %r13]
CP_PST_PRI836:
	.word 0xcbbb199a  ! 2473: STDFA_R	stda	%f5, [%r26, %r12]
NC_NUC837:
	.word 0xcadd409a  ! 2475: LDXA_R	ldxa	[%r21, %r26] 0x04, %r5
CP_NUC838:
	.word 0xcad5009a  ! 2477: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r5
NC_NUC839:
	.word 0xcaad419a  ! 2479: STBA_R	stba	%r5, [%r21 + %r26] 0x0c
NC_AIUP840:
	.word 0xcaa6431a  ! 2481: STWA_R	stwa	%r5, [%r25 + %r26] 0x18
	.word 0xcafb111a  ! 2482: SWAPA_R	swapa	%r5, [%r12 + %r26] 0x88
	.word 0xcb9cd03a  ! 2484: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xcac2915a  ! 2485: LDSWA_R	ldswa	[%r10, %r26] 0x8a, %r5
CP_BIS_AIUP841:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2487: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
CP_BIS_AIUP842:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 2489: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
CP_PST_PRI843:
	.word 0xcbbb181a  ! 2491: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcaac913a  ! 2493: STBA_R	stba	%r5, [%r18 + %r26] 0x89
	.word 0xcadb901a  ! 2495: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
CP_AIUP844:
	.word 0xca8e021a  ! 2497: LDUBA_R	lduba	[%r24, %r26] 0x10, %r5
	.word 0xcaf4903a  ! 2499: STXA_R	stxa	%r5, [%r18 + %r26] 0x81
	.word 0xcbbc903a  ! 2501: STDFA_R	stda	%f5, [%r26, %r18]
CP_PST_PRI845:
	.word 0xcbbb181a  ! 2503: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xcb3a801a  ! 2504: STDF_R	std	%f5, [%r26, %r10]
CP_PST_PRI846:
	.word 0xcbbb191a  ! 2506: STDFA_R	stda	%f5, [%r26, %r12]
	.word 0xca8ad01a  ! 2507: LDUBA_R	lduba	[%r11, %r26] 0x80, %r5
CP_AIUS847:
	.word 0xcaa7823a  ! 2509: STWA_R	stwa	%r5, [%r30 + %r26] 0x11
CP_BIS_AIUP848:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2511: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xc89c903a  ! 2513: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CP_NUC849:
	.word 0xcadd009a  ! 2515: LDXA_R	ldxa	[%r20, %r26] 0x04, %r5
	.word 0xca8c903a  ! 2517: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
	.word 0xcacc903a  ! 2519: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
NC_AIUS850:
	.word 0xca97c23a  ! 2521: LDUHA_R	lduha	[%r31, %r26] 0x11, %r5
	.word 0xcb9bd01a  ! 2523: LDDFA_R	ldda	[%r15, %r26], %f5
	.word 0xc1eb200e  ! 2525: PREFETCHA_I	prefetcha	[%r12, + 0x000e] %asi, #n_reads
CP_BIS_QUAD_LD851:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 2527: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
SHORT_FP_PRI852:
	.word 0xcb9a9a5a  ! 2529: LDDFA_R	ldda	[%r10, %r26], %f5
CP_ATM_QUAD_LD853:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2531: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xcbbad01a  ! 2532: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcb9b101a  ! 2533: LDDFA_R	ldda	[%r12, %r26], %f5
CP_AIUP854:
	.word 0xca86031a  ! 2535: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r5
NC_AIUP855:
	.word 0xcaae421a  ! 2537: STBA_R	stba	%r5, [%r25 + %r26] 0x10
CP_AIUP856:
	.word 0xcb9e021a  ! 2539: LDDFA_R	ldda	[%r24, %r26], %f5
NC_PST_PRI857:
	.word 0xcbbb999a  ! 2541: STDFA_R	stda	%f5, [%r26, %r14]
NC_AIUP858:
	.word 0xcade421a  ! 2543: LDXA_R	ldxa	[%r25, %r26] 0x10, %r5
NC_BIS_AIUS859:
	.word 0xc4a7c57a  ! 2545: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
	.word 0xcbbb511a  ! 2546: STDFA_R	stda	%f5, [%r26, %r13]
CP_PST_PRI860:
	.word 0xcbbb581a  ! 2548: STDFA_R	stda	%f5, [%r26, %r13]
	.word 0xc8bc913a  ! 2550: STDA_R	stda	%r4, [%r18 + %r26] 0x89
SET_TL0_861:
	ta	T_CHANGE_TO_TL0
WR_LEASI_862:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_863:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS865:
	.word 0xc8bfc33a  ! 2553: STDA_R	stda	%r4, [%r31 + %r26] 0x19
CHANGE_R26866:
	add	%r26,	%r27,	%r26
CP_BIS_SEC866:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 2555: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
CP_NUC867:
	.word 0xcad5019a  ! 2557: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r5
	.word 0xca93901a  ! 2559: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
CP_AIUS868:
	.word 0xcad7823a  ! 2561: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r5
	.word 0xcb02a018  ! 2562: LDF_I	ld	[%r10, 0x0018], %f5
	.word 0xca94913a  ! 2564: LDUHA_R	lduha	[%r18, %r26] 0x89, %r5
	.word 0xcb1a801a  ! 2565: LDDF_R	ldd	[%r10, %r26], %f5
	.word 0xcb84101a  ! 2567: LDFA_R	lda	[%r16, %r26], %f5
	.word 0xcac4903a  ! 2569: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcbbad11a  ! 2570: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xcaab901a  ! 2572: STBA_R	stba	%r5, [%r14 + %r26] 0x80
NC_PST_PRI869:
	.word 0xcbbb981a  ! 2574: STDFA_R	stda	%f5, [%r26, %r14]
	.word 0xcba4511a  ! 2576: STFA_R	sta	%f5, [%r26, %r17]
NC_AIUP870:
	.word 0xca86431a  ! 2578: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r5
CP_AIUP871:
	.word 0xcb86031a  ! 2580: LDFA_R	lda	[%r24, %r26], %f5
CP_BIS_NUC872:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 2582: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
	.word 0xcaabd01a  ! 2584: STBA_R	stba	%r5, [%r15 + %r26] 0x80
CP_AIUP873:
	.word 0xca8e021a  ! 2586: LDUBA_R	lduba	[%r24, %r26] 0x10, %r5
	.word 0xca5a801a  ! 2587: LDX_R	ldx	[%r10 + %r26], %r5
WR_LEASI_874:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_875:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xcb9c903a  ! 2590: LDDFA_R	ldda	[%r18, %r26], %f5
	.word 0xcb83115a  ! 2591: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xc8bc913a  ! 2593: STDA_R	stda	%r4, [%r18 + %r26] 0x89
NC_AIUP876:
	.word 0xcbbe431a  ! 2595: STDFA_R	stda	%f5, [%r26, %r25]
NC_BIS_AIUP877:
	.word 0xc8a6445a  ! 2597: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
	.word 0xcaccd03a  ! 2599: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcba4511a  ! 2601: STFA_R	sta	%f5, [%r26, %r17]
NC_NUC878:
	.word 0xcaad409a  ! 2603: STBA_R	stba	%r5, [%r21 + %r26] 0x04
	.word 0xcab4d13a  ! 2605: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xc89c913a  ! 2607: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xc8bc111a  ! 2609: STDA_R	stda	%r4, [%r16 + %r26] 0x88
NC_AIUS879:
	.word 0xcb9fc23a  ! 2611: LDDFA_R	ldda	[%r31, %r26], %f5
CHANGE_R26880:
	add	%r26,	%r27,	%r26
CP_BIS_SEC880:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 2613: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
CP_ATM_QUAD_LD881:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 2615: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xcadbd01a  ! 2617: LDXA_R	ldxa	[%r15, %r26] 0x80, %r5
	.word 0xcbbc903a  ! 2619: STDFA_R	stda	%f5, [%r26, %r18]
	.word 0xcaea911a  ! 2620: LDSTUBA_R	ldstuba	%r5, [%r10 + %r26] 0x88
	.word 0xca8c903a  ! 2622: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CHANGE_R26882:
	add	%r26,	%r27,	%r26
CP_BIS_SEC882:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 2624: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
CP_PST_PRI883:
	.word 0xcbba995a  ! 2626: STDFA_R	stda	%f5, [%r26, %r10]
CP_PST_PRI884:
	.word 0xcbba991a  ! 2628: STDFA_R	stda	%f5, [%r26, %r10]
	.word 0xcacb901a  ! 2630: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r5
	.word 0xcb03001a  ! 2631: LDF_R	ld	[%r12, %r26], %f5
	.word 0xc8bad01a  ! 2632: STDA_R	stda	%r4, [%r11 + %r26] 0x80
	.word 0xcb02e018  ! 2633: LDF_I	ld	[%r11, 0x0018], %f5
	.word 0xcadb901a  ! 2635: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
NC_BIS_AIUP885:
	.word 0xc8ae445a  ! 2637: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xcb232018  ! 2638: STF_I	st	%f5, [0x0018, %r12]
CHANGE_CLE886:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xcb9cd03a  ! 2641: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca93901a  ! 2643: LDUHA_R	lduha	[%r14, %r26] 0x80, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC888:
	.word 0xcbbd419a  ! 2645: STDFA_R	stda	%f5, [%r26, %r21]
	.word 0xcac4913a  ! 2647: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r5
	.word 0xcac4d03a  ! 2649: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
NC_SHORT_FP_SEC889:
	.word 0xcb9cda7a  ! 2651: LDDFA_R	ldda	[%r19, %r26], %f5
CHANGE_R26890:
	add	%r26,	%r27,	%r26
CP_BIS_SEC890:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 2653: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
CP_AIUS891:
	.word 0xc8bf833a  ! 2655: STDA_R	stda	%r4, [%r30 + %r26] 0x19
	.word 0xcab4d13a  ! 2657: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xca8cd13a  ! 2659: LDUBA_R	lduba	[%r19, %r26] 0x89, %r5
	.word 0xcba4501a  ! 2661: STFA_R	sta	%f5, [%r26, %r17]
	.word 0xcb3a801a  ! 2662: STDF_R	std	%f5, [%r26, %r10]
	.word 0xcaf3501a  ! 2663: STXA_R	stxa	%r5, [%r13 + %r26] 0x80
CP_BIS_AIUP892:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 2665: STBA_R	stba	%r6, [%r24 + %r26] 0x22
CP_BIS_QUAD_LD893:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 2667: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
	.word 0xcab4d13a  ! 2669: STHA_R	stha	%r5, [%r19 + %r26] 0x89
	.word 0xcb83115a  ! 2670: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xca6a801a  ! 2671: LDSTUB_R	ldstub	%r5, [%r10 + %r26]
	.word 0xcba4913a  ! 2673: STFA_R	sta	%f5, [%r26, %r18]
NC_BIS_SEC894:
	.word 0xc8bcdc7a  ! 2675: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
NC_BIS_AIUP895:
	.word 0xc4b6445a  ! 2677: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xca2b401a  ! 2678: STB_R	stb	%r5, [%r13 + %r26]
	.word 0xca8b911a  ! 2680: LDUBA_R	lduba	[%r14, %r26] 0x88, %r5
CHANGE_USER896:
	ta	T_CHANGE_NONPRIV
CHANGE_R26897:
	add	%r26,	%r27,	%r26
CP_BIS_PRI897:
	and	%r26,	%r28,	%r26
	.word 0xd0aadc5a  ! 2682: STBA_R	stba	%r8, [%r11 + %r26] 0xe2
	.word 0xcba3901a  ! 2684: STFA_R	sta	%f5, [%r26, %r14]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP899:
	.word 0xc8be421a  ! 2686: STDA_R	stda	%r4, [%r25 + %r26] 0x10
NC_BIS_SEC900:
	.word 0xc4b4dc7a  ! 2688: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
CP_BIS_AIUP901:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 2690: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xcaccd03a  ! 2692: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
CP_BIS_AIUP902:
	and	%r26,	%r28,	%r26
	.word 0xc49e055a  ! 2694: LDDA_R	ldda	[%r24, %r26] 0x2a, %r2
	.word 0xcac4501a  ! 2696: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r5
NC_BIS_AIUS903:
	.word 0xc4f7c47a  ! 2698: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
CHANGE_USER904:
	ta	T_CHANGE_NONPRIV
CHANGE_R26905:
	mov	%g0,	%r26
NC_BIS_PRI905:
	.word 0xd0b3dc5a  ! 2700: STHA_R	stha	%r8, [%r15 + %r26] 0xe2
NC_BIS_SEC906:
	.word 0xccf4dc7a  ! 2702: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xcadcd03a  ! 2704: LDXA_R	ldxa	[%r19, %r26] 0x81, %r5
	.word 0xcb84d13a  ! 2706: LDFA_R	lda	[%r19, %r26], %f5
CHANGE_PRIV907:
	ta	T_CHANGE_PRIV
CHANGE_R26908:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS908:
	.word 0xc8afc57a  ! 2708: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
	.word 0xc3ec601c  ! 2710: PREFETCHA_I	prefetcha	[%r17, + 0x001c] %asi, #one_read
NC_BIS_AIUS909:
	.word 0xc4a7c47a  ! 2712: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
	.word 0xca02801a  ! 2713: LDUW_R	lduw	[%r10 + %r26], %r5
	.word 0xcbba901a  ! 2714: STDFA_R	stda	%f5, [%r26, %r10]
CHANGE_USER910:
	ta	T_CHANGE_NONPRIV
CHANGE_R26911:
	add	%r26,	%r27,	%r26
NC_BIS_PRI911:
	.word 0xc4b39c5a  ! 2716: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS913:
	.word 0xca8f823a  ! 2718: LDUBA_R	lduba	[%r30, %r26] 0x11, %r5
NC_BIS_AIUS914:
	.word 0xd0b7c57a  ! 2720: STHA_R	stha	%r8, [%r31 + %r26] 0x2b
NC_BIS_AIUP915:
	.word 0xc4f6445a  ! 2722: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xcaa4d13a  ! 2724: STWA_R	stwa	%r5, [%r19 + %r26] 0x89
	.word 0xcaa4903a  ! 2726: STWA_R	stwa	%r5, [%r18 + %r26] 0x81
NC_BIS_AIUS916:
	.word 0xd0bfc47a  ! 2728: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xca92915a  ! 2729: LDUHA_R	lduha	[%r10, %r26] 0x8a, %r5
	.word 0xcaa4d03a  ! 2731: STWA_R	stwa	%r5, [%r19 + %r26] 0x81
CP_BIS_NUC917:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2733: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
NC_AIUS918:
	.word 0xcaf7c23a  ! 2735: STXA_R	stxa	%r5, [%r31 + %r26] 0x11
CP_PST_PRI919:
	.word 0xcbba985a  ! 2737: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_NUC920:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 2739: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
	.word 0xca52e01a  ! 2740: LDSH_I	ldsh	[%r11 + 0x001a], %r5
	.word 0xcac4903a  ! 2742: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcb9cd03a  ! 2744: LDDFA_R	ldda	[%r19, %r26], %f5
CP_BIS_NUC921:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2746: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
	.word 0xca8c111a  ! 2748: LDUBA_R	lduba	[%r16, %r26] 0x88, %r5
	.word 0xcaac903a  ! 2750: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xcbba901a  ! 2751: STDFA_R	stda	%f5, [%r26, %r10]
CP_BIS_AIUP922:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 2753: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
CHANGE_USER923:
	ta	T_CHANGE_NONPRIV
CHANGE_R26924:
	add	%r26,	%r27,	%r26
CP_BIS_PRI924:
	and	%r26,	%r28,	%r26
	.word 0xcca2dc5a  ! 2755: STWA_R	stwa	%r6, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP926:
	.word 0xca96031a  ! 2757: LDUHA_R	lduha	[%r24, %r26] 0x18, %r5
	.word 0xcadc903a  ! 2759: LDXA_R	ldxa	[%r18, %r26] 0x81, %r5
	.word 0xc89cd13a  ! 2761: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xcadb901a  ! 2763: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
	.word 0xcaccd03a  ! 2765: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xe56aa033  ! 2767: PREFETCH_I	prefetch	[%r10 + 0x0033], #18
CHANGE_USER927:
	ta	T_CHANGE_NONPRIV
CHANGE_R26928:
	add	%r26,	%r27,	%r26
CP_BIS_PRI928:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 2769: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC930:
	.word 0xcaad409a  ! 2771: STBA_R	stba	%r5, [%r21 + %r26] 0x04
	.word 0xca6aa01b  ! 2772: LDSTUB_I	ldstub	%r5, [%r10 + 0x001b]
	.word 0xc8bc903a  ! 2774: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CP_ATM_QUAD_LD931:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2776: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xcba3d01a  ! 2778: STFA_R	sta	%f5, [%r26, %r15]
CP_BIS_QUAD_LD932:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2780: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xcadcd13a  ! 2782: LDXA_R	ldxa	[%r19, %r26] 0x89, %r5
NC_BIS_SEC933:
	.word 0xc8bcdd7a  ! 2784: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
CP_ATM_QUAD_LD934:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2786: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xca2a801a  ! 2787: STB_R	stb	%r5, [%r10 + %r26]
CP_BIS_NUC935:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2789: STBA_R	stba	%r4, [%r20 + %r26] 0x27
CP_BIS_AIUP936:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 2791: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
	.word 0xcadc913a  ! 2793: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
NC_NUC937:
	.word 0xcacd409a  ! 2795: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r5
	.word 0xcaac903a  ! 2797: STBA_R	stba	%r5, [%r18 + %r26] 0x81
	.word 0xcb9bd01a  ! 2799: LDDFA_R	ldda	[%r15, %r26], %f5
	.word 0xcba3d01a  ! 2801: STFA_R	sta	%f5, [%r26, %r15]
CHANGE_TLE938:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
BLK_PRI939:
	and	%r26,	%r29,	%r26
	.word 0xe19adf1a  ! 2804: LDDFA_R	ldda	[%r11, %r26], %f16
CHANGE_PRIV940:
	ta	T_CHANGE_PRIV
CHANGE_R26941:
	mov	%g0,	%r26
CP_BIS_NUC941:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 2806: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
	.word 0xcaa3901a  ! 2808: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	.word 0xca5ae018  ! 2809: LDX_I	ldx	[%r11 + 0x0018], %r5
SET_TL1_942:
	ta	T_CHANGE_TO_TL1
CHANGE_R26943:
	add	%r26,	%r27,	%r26
NC_BIS_NUC943:
	.word 0xc8f544fa  ! 2811: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
CP_BIS_NUC944:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2813: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
SET_TL0_945:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI946:
	and	%r26,	%r28,	%r26
	.word 0xc4aadc5a  ! 2815: STBA_R	stba	%r2, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC948:
	.word 0xcba5409a  ! 2817: STFA_R	sta	%f5, [%r26, %r21]
CHANGE_USER949:
	ta	T_CHANGE_NONPRIV
CHANGE_R26950:
	add	%r26,	%r27,	%r26
NC_BIS_PRI950:
	.word 0xc4ac5d5a  ! 2819: STBA_R	stba	%r2, [%r17 + %r26] 0xea
	.word 0xcbe3201a  ! 2820: CASA_R	casa	[%r12] %asi, %r26, %r5
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC952:
	.word 0xcb85019a  ! 2822: LDFA_R	lda	[%r20, %r26], %f5
	.word 0xcbe2e01a  ! 2823: CASA_R	casa	[%r11] %asi, %r26, %r5
	.word 0xcad3901a  ! 2825: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r5
	.word 0xc83b401a  ! 2826: STD_R	std	%r4, [%r13 + %r26]
CHANGE_USER953:
	ta	T_CHANGE_NONPRIV
CHANGE_R26954:
	add	%r26,	%r27,	%r26
NC_BIS_PRI954:
	.word 0xcca41c5a  ! 2828: STWA_R	stwa	%r6, [%r16 + %r26] 0xe2
	.word 0xcac4903a  ! 2830: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r5
	.word 0xcb9b505a  ! 2831: LDDFA_R	ldda	[%r13, %r26], %f5
	.word 0xc89c101a  ! 2833: LDDA_R	ldda	[%r16, %r26] 0x80, %r4
NC_BIS_PRI955:
	.word 0xc4ab9d5a  ! 2835: STBA_R	stba	%r2, [%r14 + %r26] 0xea
	.word 0xcb036018  ! 2836: LDF_I	ld	[%r13, 0x0018], %f5
	.word 0xcadc913a  ! 2838: LDXA_R	ldxa	[%r18, %r26] 0x89, %r5
CP_BIS_QUAD_LD956:
	and	%r26,	%r29,	%r26
	.word 0xc89b5d5a  ! 2840: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
	.word 0xca8cd03a  ! 2842: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
	.word 0xcba2d11a  ! 2843: STFA_R	sta	%f5, [%r26, %r11]
CP_PST_PRI957:
	.word 0xcbba989a  ! 2845: STDFA_R	stda	%f5, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS959:
	.word 0xcba7823a  ! 2847: STFA_R	sta	%f5, [%r26, %r30]
NC_BIS_AIUP960:
	.word 0xc4b6445a  ! 2849: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xcaf4913a  ! 2851: STXA_R	stxa	%r5, [%r18 + %r26] 0x89
CP_AIUS961:
	.word 0xc8bf823a  ! 2853: STDA_R	stda	%r4, [%r30 + %r26] 0x11
NC_NUC962:
	.word 0xca85409a  ! 2855: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r5
	.word 0xcaab501a  ! 2856: STBA_R	stba	%r5, [%r13 + %r26] 0x80
CP_BIS_AIUS963:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 2858: STHA_R	stha	%r2, [%r30 + %r26] 0x23
NC_AIUP964:
	.word 0xca8e421a  ! 2860: LDUBA_R	lduba	[%r25, %r26] 0x10, %r5
CP_BIS_QUAD_LD965:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2862: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xca7a801a  ! 2863: SWAP_R	swap	%r5, [%r10 + %r26]
CP_PST_PRI966:
	.word 0xcbba985a  ! 2865: STDFA_R	stda	%f5, [%r26, %r10]
CHANGE_R26967:
	add	%r26,	%r27,	%r26
CP_BIS_SEC967:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 2867: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
	.word 0xca72a018  ! 2868: STX_I	stx	%r5, [%r10 + 0x0018]
NC_BLK_SEc968:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2870: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xcac3911a  ! 2872: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r5
	.word 0xcadc101a  ! 2874: LDXA_R	ldxa	[%r16, %r26] 0x80, %r5
	.word 0xcb9ad01a  ! 2875: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcadb901a  ! 2877: LDXA_R	ldxa	[%r14, %r26] 0x80, %r5
	.word 0xcaf4d03a  ! 2879: STXA_R	stxa	%r5, [%r19 + %r26] 0x81
CP_ATM_QUAD_LD969:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 2881: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
SHORT_FP_PRI970:
	.word 0xcb9ada1a  ! 2883: LDDFA_R	ldda	[%r11, %r26], %f5
CP_NUC971:
	.word 0xcbf5201a  ! 2885: CASXA_R	casxa	[%r20]%asi, %r26, %r5
	.word 0xcba3d01a  ! 2887: STFA_R	sta	%f5, [%r26, %r15]
	.word 0xca94d13a  ! 2889: LDUHA_R	lduha	[%r19, %r26] 0x89, %r5
	.word 0xca0b001a  ! 2890: LDUB_R	ldub	[%r12 + %r26], %r5
	.word 0xcacc903a  ! 2892: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
NC_BIS_AIUP972:
	.word 0xd0be445a  ! 2894: STDA_R	stda	%r8, [%r25 + %r26] 0x22
	.word 0xcb3aa018  ! 2895: STDF_I	std	%f5, [0x0018, %r10]
	.word 0xcac3d01a  ! 2897: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r5
	.word 0xcaa3901a  ! 2899: STWA_R	stwa	%r5, [%r14 + %r26] 0x80
	.word 0xcaac903a  ! 2901: STBA_R	stba	%r5, [%r18 + %r26] 0x81
NC_AIUS973:
	.word 0xc89fc23a  ! 2903: LDDA_R	ldda	[%r31, %r26] 0x11, %r4
	.word 0xcba4d03a  ! 2905: STFA_R	sta	%f5, [%r26, %r19]
	.word 0xca8a901a  ! 2906: LDUBA_R	lduba	[%r10, %r26] 0x80, %r5
CP_BIS_AIUP974:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 2908: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xcaca905a  ! 2909: LDSBA_R	ldsba	[%r10, %r26] 0x82, %r5
CHANGE_USER975:
	ta	T_CHANGE_NONPRIV
CHANGE_R26976:
	mov	%g0,	%r26
NC_BIS_PRI976:
	.word 0xccf41c5a  ! 2911: STXA_R	stxa	%r6, [%r16 + %r26] 0xe2
NC_SHORT_FP_SEC977:
	.word 0xcbbcdb7a  ! 2913: STDFA_R	stda	%f5, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS979:
	.word 0xc8bf823a  ! 2915: STDA_R	stda	%r4, [%r30 + %r26] 0x11
NC_AIUS980:
	.word 0xcaafc33a  ! 2917: STBA_R	stba	%r5, [%r31 + %r26] 0x19
CP_BIS_NUC981:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 2919: STDA_R	stda	%r6, [%r20 + %r26] 0x27
	.word 0xcad2901a  ! 2920: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r5
CHANGE_R26982:
	add	%r26,	%r27,	%r26
CP_BIS_SEC982:
	and	%r26,	%r28,	%r26
	.word 0xc4f49c7a  ! 2922: STXA_R	stxa	%r2, [%r18 + %r26] 0xe3
SET_TL1_983:
	ta	T_CHANGE_TO_TL1
CHANGE_R26984:
	add	%r26,	%r27,	%r26
NC_BIS_NUC984:
	.word 0xcca544fa  ! 2924: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xca8bd01a  ! 2926: LDUBA_R	lduba	[%r15, %r26] 0x80, %r5
NC_AIUS985:
	.word 0xcaf7c23a  ! 2928: STXA_R	stxa	%r5, [%r31 + %r26] 0x11
	.word 0xcbbb111a  ! 2929: STDFA_R	stda	%f5, [%r26, %r12]
SET_TL0_986:
	ta	T_CHANGE_TO_TL0
CHANGE_R26987:
	add	%r26,	%r27,	%r26
NC_BIS_SEC987:
	.word 0xc4bcdc7a  ! 2931: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP989:
	.word 0xcace031a  ! 2933: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r5
	.word 0xcb83111a  ! 2934: LDFA_R	lda	[%r12, %r26], %f5
	.word 0xca52e01a  ! 2935: LDSH_I	ldsh	[%r11 + 0x001a], %r5
CP_ATM_QUAD_LD990:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 2937: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
BLK_PRI991:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 2939: LDDFA_R	ldda	[%r11, %r26], %f16
	.word 0xcb9c101a  ! 2941: LDDFA_R	ldda	[%r16, %r26], %f5
SHORT_FP_PRI992:
	.word 0xcb9ada1a  ! 2943: LDDFA_R	ldda	[%r11, %r26], %f5
	.word 0xcb82d01a  ! 2944: LDFA_R	lda	[%r11, %r26], %f5
	.word 0xca32a01a  ! 2945: STH_I	sth	%r5, [%r10 + 0x001a]
	.word 0xcbf2e01a  ! 2946: CASXA_R	casxa	[%r11]%asi, %r26, %r5
NC_BIS_AIUP993:
	.word 0xc4ae455a  ! 2948: STBA_R	stba	%r2, [%r25 + %r26] 0x2a
NC_NUC994:
	.word 0xcaa5419a  ! 2950: STWA_R	stwa	%r5, [%r21 + %r26] 0x0c
CP_PST_PRI995:
	.word 0xcbbad99a  ! 2952: STDFA_R	stda	%f5, [%r26, %r11]
	.word 0xca2aa01b  ! 2953: STB_I	stb	%r5, [%r10 + 0x001b]
NC_BIS_SEC996:
	.word 0xc8b4dd7a  ! 2955: STHA_R	stha	%r4, [%r19 + %r26] 0xeb
	.word 0xcba3501a  ! 2956: STFA_R	sta	%f5, [%r26, %r13]
	.word 0xca8cd03a  ! 2958: LDUBA_R	lduba	[%r19, %r26] 0x81, %r5
BLK_PRI997:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 2960: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xcb82901a  ! 2961: LDFA_R	lda	[%r10, %r26], %f5
NC_AIUP998:
	.word 0xcbbe421a  ! 2963: STDFA_R	stda	%f5, [%r26, %r25]
	.word 0xcbe2a01a  ! 2964: CASA_R	casa	[%r10] %asi, %r26, %r5
	.word 0xcb9cd13a  ! 2966: LDDFA_R	ldda	[%r19, %r26], %f5
	.word 0xca8c903a  ! 2968: LDUBA_R	lduba	[%r18, %r26] 0x81, %r5
CP_AIUS999:
	.word 0xcacf833a  ! 2970: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r5
	.word 0xcb02801a  ! 2971: LDF_R	ld	[%r10, %r26], %f5
	.word 0xcaac101a  ! 2973: STBA_R	stba	%r5, [%r16 + %r26] 0x80
	.word 0xcba2911a  ! 2974: STFA_R	sta	%f5, [%r26, %r10]
	.word 0xcad4913a  ! 2976: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r5
	.word 0xcac4d03a  ! 2978: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r5
	.word 0xca7b6018  ! 2979: SWAP_I	swap	%r5, [%r13 + 0x0018]
BLK_PRI1000:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2981: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_R261001:
	add	%r26,	%r27,	%r26
CP_BIS_SEC1001:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2983: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xca93d11a  ! 2985: LDUHA_R	lduha	[%r15, %r26] 0x88, %r5
	.word 0xcaccd03a  ! 2987: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r5
	.word 0xcacc903a  ! 2989: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r5
	.word 0xcb1b6018  ! 2990: LDDF_I	ldd	[%r13, 0x0018], %f5
SET_TL1_1002:
	ta	T_CHANGE_TO_TL1
CHANGE_R261003:
	add	%r26,	%r27,	%r26
NC_BIS_NUC1003:
	.word 0xc4a544fa  ! 2992: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD1004:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2994: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xcaa3101a  ! 2995: STWA_R	stwa	%r5, [%r12 + %r26] 0x80
SHORT_FP_PRI1005:
	.word 0xcbbb1b5a  ! 2997: STDFA_R	stda	%f5, [%r26, %r12]
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x806f4c96a3a670c1
.xword 0x91b7b7757e6cebe9
.xword 0xd318338606b88327
.xword 0xeee14ae9be2bc1c4
.xword 0x41e88cc65d0a2160
.xword 0x13233cb70e982c2b
.xword 0x5acf7052b2fa7feb
.xword 0x3154d31b9c922831
.xword 0x21c6cd37717dd445
.xword 0x556b21bd9fb48c03
.xword 0xe8b1358bf14a2ccd
.xword 0xb2c328bf8a665bef
.xword 0xd3bd11f6e1a349f0
.xword 0xafb86fed0f25349e
.xword 0xa3b4cfc089431856
.xword 0xeecdce747345a018
.xword 0x1743b276e3daac97
.xword 0xda9ac35a7fcb8ee9
.xword 0xea7dd61e433239f4
.xword 0xb4bbc69b9be7915b
.xword 0xd087dd458edf7a05
.xword 0xb6e277038f30af16
.xword 0x25da90fd4f978742
.xword 0x8001ecaa2c223acf
.xword 0x73abfe2f8536309e
.xword 0x0b1b3c5dfe8cd8c8
.xword 0x4d9cf060011570c0
.xword 0x139a829024fa87b3
.xword 0xc3119545f2036f65
.xword 0x4684b1e38e944dda
.xword 0x419145d3f116ed32
.xword 0x8eb6b0fcbd291b3c



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
.xword 0xc70c4ec0de58ab5c

.xword 0x9c0b82418dd570c0

.xword 0xf80ad811700094fb

.xword 0x1f3da2a6ab130227

.xword 0x357d3b3eae80b6f4

.xword 0x3860a91839dd35ce

.xword 0x3a860a0613363b92

.xword 0x7b236175b243d247

.xword 0x6621a9f294771847

.xword 0x5b5d2f27c179dc6c

.xword 0x50e7f06c08477cc6

.xword 0x97f235c7c7dd1b29

.xword 0x17c372240fd6413d

.xword 0x0fb6c1320a553cff

.xword 0x89df4bad532b0c96

.xword 0x59d62cfbfa22f6d8

.xword 0x10af66106afa9d44

.xword 0x1b9513348e3e1749

.xword 0xc5bf837d9cb838a5

.xword 0xf208ace7dd54579e

.xword 0x3b304da88e146510

.xword 0xdf822b3c7eedb7ca

.xword 0xf7faa944940430b2

.xword 0x1450cb3b2dc53d59

.xword 0xef5ca4573aae46c3

.xword 0x2a5f9a37fca81dc9

.xword 0xc43c7c015a54d70c

.xword 0x633defcf79e74da6

.xword 0x1339d5bedf6ccdf6

.xword 0xf4797ca76be6b093

.xword 0xee98b9ab9a54beea

.xword 0x1d493ce6bdcfe958




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
.xword 0x03e17e91e11e5b96
.xword 0xcd2ae8783bda48fd
.xword 0x1bc49da778266a17
.xword 0xe8c7ea259978250a
.xword 0xaf9cdf0b4ef95564
.xword 0x8124ae693a6c0004
.xword 0x4110f0b43676dce5
.xword 0x2c7fe1d8f1afb8cb
.xword 0x7bd9d4ada136f6d9




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
.xword 0xfe75e88766961051
.xword 0x592c28a0e802d615
.xword 0xe8169bda66c38a63
.xword 0x4f4d217c4c219ede
.xword 0xec34614ce642a0ca
.xword 0x2542b248a5ce2585
.xword 0xd57359bb0acfebab
.xword 0xaa396e5115c8226d
.xword 0xafb9099a2d57aa5e




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
.xword 0x745b0669f5c026d6
.xword 0x2b99ce8516ee3122
.xword 0xed78c3f648d7d37c
.xword 0xcb55d5db68ac174c
.xword 0x23d5d4297be80691
.xword 0x1aff23931b31cf7d
.xword 0xe5510b12a41cd2ea
.xword 0xfdcf62bb9f7523ed
.xword 0xb21c7e3ebc0e144e




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
.xword 0x246838fbb2b0a2b5
.xword 0xaafda16527723de0
.xword 0x5b206e5a0cf38280
.xword 0x488949db6cf42fd1
.xword 0xc095c18dd3f96fa5
.xword 0x38df9a483deffbce
.xword 0x305de244ca3b3493
.xword 0x48b18f71bc50c821
.xword 0xe2f941a01628a334




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
.xword 0xa7205377be760f30
.xword 0x1f43652a78ffbb2a
.xword 0x2f62528ff891150c
.xword 0xe1251cec33c86102
.xword 0xa707d02b7accfdc8
.xword 0xecbd9d62e21977f6
.xword 0x182be63a9c77b161
.xword 0xf3b873bca87ad414
.xword 0x38467c2a796e0e54




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
.xword 0x0e114de52ebe561a
.xword 0xc033e7de7cbce52b
.xword 0xdd3e199cb7aff4b7
.xword 0x959694b66526fb6c
.xword 0x1f153d1dac78f7e1
.xword 0x7514ead9b6dad6d8
.xword 0x090ad123b8bea50b
.xword 0x224d5ed2d7f16030
.xword 0x1846249bafea8df4




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
.xword 0x7609023f8222038f
.xword 0xefe272578a2a69a4
.xword 0x7a76b03861d6f1e8
.xword 0xd4bdbcb4b9adae70
.xword 0x22c95799e9010886
.xword 0x706ab17975e18d44
.xword 0x8b79394801608a0c
.xword 0x4bca9c34b447a789
.xword 0x301e0eba0e56b927




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
.xword 0xfbb7de0bf3917e94
.xword 0x4abbbb28fa68bbea
.xword 0x91d257bffa2be147
.xword 0x08274465a016d5c3
.xword 0xce142b46c9d614b3
.xword 0x2897a89eee7341aa
.xword 0x4dbc0c12bc99987d
.xword 0xfdeff0912ec13845
.xword 0x697ee3d23d795033




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
.xword 0x2147b8e787822db7
.xword 0xe9489ef48eae1ee5
.xword 0xf324992579d7b919
.xword 0xb824b51f87b5d97c
.xword 0x2744c97e1e266f1d
.xword 0xb18f4969910ad257
.xword 0xd0fc2121622bcb73
.xword 0x6d34af71c282cd25
.xword 0x00cb859d8ce4c745




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
.xword 0xff7bd5ebeb9c2fba
.xword 0x3746cacf96221cd5
.xword 0x2663181d7b141dff
.xword 0x4cc02ff38530de4e
.xword 0x5662e5ad19e76127
.xword 0x31f90fa052ed3d76
.xword 0x8fe75637421ec4d1
.xword 0xdb06e795c5079467
.xword 0x7da684099074699b




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
.xword 0x6cf57883fbe9ddd1
.xword 0xaa5e2f61bfda9142
.xword 0x84bc71dff95eb2b0
.xword 0x1f67614be2260308
.xword 0xd5116beb72083320
.xword 0xa7204add1018c9b9
.xword 0x6cc55bf208a3f583
.xword 0x758d7ffe2477b05c
.xword 0x73ed579c185b1acb




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
.xword 0x50a45f366954d9c4
.xword 0xa825342ca3c99ed9
.xword 0x4c3d98b3c7ab4246
.xword 0xe74e030b6cade474
.xword 0x7efb7c186a3e74cd
.xword 0xb32b524eb41b1dc1
.xword 0xcc839e47d3da8039
.xword 0x35dd5a47f73bec1f
.xword 0x429bef5c0b22022f




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
.xword 0xb68a6a5bbe6b3b37
.xword 0xfff2e3da465df88a
.xword 0xeecea4c18554016c
.xword 0x59f2e016afd51dba
.xword 0xa824124d8382ebc4
.xword 0x05f60b12abf332ef
.xword 0xdd8ed057f3549c57
.xword 0x6ed5189ea7af1e1b
.xword 0x463d43ec64c66d4e




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
.xword 0xd4aaa2dff2b1bcc1
.xword 0x69c6f739cc0b600d
.xword 0xbf92aef4d47cf34f
.xword 0x25b3dfc157f67032
.xword 0xa174f45d50760063
.xword 0xc289f2b51e0d0d41
.xword 0xac52034074fa0b57
.xword 0x40da5cb6c386d4a9
.xword 0x389be00597033982




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
.xword 0x3d43a7d8aad631ea
.xword 0x0e2d4c473b23661a
.xword 0xf65845ccc0e42129
.xword 0x9d850a9998a19015
.xword 0x8b3afc817bc47c2d
.xword 0x95631f14d0ec200b
.xword 0xf54fca993a8a8542
.xword 0xc6f623a045e2a4ce
.xword 0xb0f2d126a534d0eb




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
.xword 0x2f388494bad534a0
.xword 0x316bec8e6b165282
.xword 0xcbbec3ad459ca66a
.xword 0x4826b6b8631b8b49
.xword 0x85bbf4c7e8a9b115
.xword 0x923490de799eaa30
.xword 0x29aabb5b6649d70a
.xword 0xb6c3d3af60b4227f
.xword 0xb6d70de56ae89446




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
.xword 0x5667b059bebd1516
.xword 0x0295b1702d6a40a8
.xword 0x065c5893e9310bbf
.xword 0x4123292d0228ed44
.xword 0x28d423ffd01ccf7f
.xword 0x541da388785b74c6
.xword 0x6857b1948becad08
.xword 0x5aabb419d4ec4ecf
.xword 0xd1206953e9794e1a




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
.xword 0xbe22f696c6b0b48f
.xword 0xec0bb0ec732a10bf
.xword 0xcdb138ba4515aec4
.xword 0xef7ed0f824cc6cfd
.xword 0xbcaf402c95fe28d3
.xword 0x3035d8b122171a1f
.xword 0x95f939e299a2456f
.xword 0x9ab157bbfb1a1bb9
.xword 0x6d3cd76ecae3b2ec




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
.xword 0x661bb005c29c4cfc
.xword 0x496b11714ad88936
.xword 0x2b7462ac75a2d4de
.xword 0xb25d51ddda2f7f51
.xword 0xc9c1f7640a22505d
.xword 0x465009335b88760c
.xword 0x0ffed21ef8331f87
.xword 0xe80cbe88e2250366
.xword 0x76c4bf51bf4fdc25




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
.xword 0xde58d41dff987efb
.xword 0x812981812458e7bb
.xword 0xb9dbef8704708e91
.xword 0xd86a58f45d7118b7
.xword 0xdaa193e2a2f424dc
.xword 0x44ef6eb8b49ccb70
.xword 0x2ba74d23ee237a8c
.xword 0x66207a1ccab5cf08
.xword 0x93c916b4d998ea43




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
.xword 0x2d5916afa68cab05
.xword 0x751e5c77251b047b
.xword 0x21ec790cba2a0be4
.xword 0x016016abeee12810
.xword 0x5081268409369d84
.xword 0x94520c042717c652
.xword 0xf9b9fe7b86b7e618
.xword 0x7ab05275071b455f
.xword 0x65a72d8f0414f553




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
.xword 0x5252afc7ae98c3e2
.xword 0x84259a65cd1fd67b
.xword 0x9fc2c998bd507622
.xword 0x1bae5792001ec46b
.xword 0xca1a2f6d039bd94b
.xword 0x498426bad341d0e0
.xword 0xc20d2144f2468a8e
.xword 0x4ca4172a0dc52cae
.xword 0x719bd33df468edca




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
.xword 0x570d9a054615f5cd
.xword 0xb4e582aca2616545
.xword 0xe9faf15aa80e1d62
.xword 0xa2a4d641da8b209b
.xword 0x12243e4ad3ddc541
.xword 0x5d1a2bb89bc2792a
.xword 0x1af5671bc62077fd
.xword 0x99d05fa1582deb57
.xword 0xb7c0b70efa956c0f




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
.xword 0xbffc6826a3035877
.xword 0x2628953e6ef0b961
.xword 0xb35f2aa8bb493bfe
.xword 0xa91d72befdddbf3a
.xword 0x123c499bda8f3973
.xword 0x2bc316ff6c0416c7
.xword 0x0cf5a7d7a1c81aa6
.xword 0x640d928bd798b274
.xword 0xcb2ad1a1831f32d0




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
.xword 0x40a47be1f2454462
.xword 0x17169d34e7dde2ab
.xword 0x7b0d8f9ed2bac369
.xword 0xf0c325e4d90b6d9f
.xword 0x104890a27a842986
.xword 0x0081330c47a4cb81
.xword 0x21d84202d6e159ac
.xword 0x678cd8885c03a75a
.xword 0xec8f9ef116e9181c




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
.xword 0x72ed97c46d78c65d
.xword 0x1d2e9d08fa076257
.xword 0x8cdd0e3942bffc91
.xword 0x8e6b5ba5f703b1f4
.xword 0xb31d550ceeeb5002
.xword 0xbe25ee8c92ba62ba
.xword 0xaea0bacb98115ba5
.xword 0x7c1bd8e4c317eeec
.xword 0x2e5af751a872e469




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
.xword 0x3f52a0f653106242
.xword 0xd9f3c2e5cf972362
.xword 0xf0d4ff29faaabf52
.xword 0x3439086e3843a6c6
.xword 0xd280e1e1c74fa923
.xword 0x9334dc97594258c0
.xword 0x1028de3271df0e36
.xword 0x07cd070b128f7207
.xword 0xc7fef066123a1cfd




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
.xword 0x5c7365f76d9f4a03
.xword 0x4ca4b91648b6874a
.xword 0x0f261ab3464fc8fd
.xword 0x915bdd03e1afa96e
.xword 0x98d00ab24a5c9cf4
.xword 0x54f001a72f91d57f
.xword 0x83da679d9bc41809
.xword 0x4ace64c0f4a13100
.xword 0xe282d94fbb02f820




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
.xword 0xe39aa4b86d12c5dd
.xword 0x4677096535b81d70
.xword 0xec572e455c3260c5
.xword 0x7933d739f3d8916f
.xword 0x70e131f4cf177a52
.xword 0x2c9b2268201f5e3f
.xword 0x140eafd836a0df85
.xword 0xc41d8fdf058776e4
.xword 0x95e408fdfa73514f




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
.xword 0x151de29b16847557
.xword 0xb04b7c0c7c981da2
.xword 0x570bb4fb32831772
.xword 0xd5c15856dfbf08e5
.xword 0xf1879b7479e0a5b2
.xword 0xf4f445879ba92db2
.xword 0x4e2f92163ab4ee87
.xword 0xf3cdba10f04ebc96
.xword 0x5ee3ceb3a2644b1c




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
.xword 0xe9604cbfac34b4e8
.xword 0xfb974a79a21a3a14
.xword 0x1014a2dc35a6d002
.xword 0xa3f4e2d518e45e2f
.xword 0xbc0f02adc942ae4e
.xword 0xb5f2da656a111eed
.xword 0xefb2a08f3ce7aade
.xword 0x3b31e0a882beb369
.xword 0x9efa50e561777e4b






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
.xword 0xbdd6d27895b9f4b4
.xword 0x6d011bda59964e5f
.xword 0x5f9e345285d97eb5
.xword 0x59ed03c1074dae88
.xword 0xd3f7e934edb4e1d3
.xword 0x6803b9dda8399547
.xword 0xfc54b7733a081850
.xword 0xdebdd290f8aa87da



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
.xword 0xcf86b8fe2f384d53
.xword 0x7738cf8244e12c0e
.xword 0x0d45ca2bd7c00e10
.xword 0xe49bce03e9e9b6f2
.xword 0xf47ed5e2c7aa0310
.xword 0xe86f6d277533e365
.xword 0x760b8a305aee87f4
.xword 0x58e1541ab9b7aee5



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
.xword 0x08b52ff6dfb5fa29
.xword 0x259288a8628eae66
.xword 0xc6f8b8ab16eb1aed
.xword 0x6876d5b2ff6b7db2
.xword 0xe1d7894d912438ae
.xword 0x3b50bf2753c04d8f
.xword 0x7ccc0591c0c7703d
.xword 0x50d5d88abfc0591d



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
.xword 0xa40ac80571ef1b08
.xword 0x12fa541203c36eda
.xword 0xe1234b85ac050621
.xword 0xc3929b012ee90f29
.xword 0xe37a83b8f21257e6
.xword 0xc85b64efc211a120
.xword 0x7aece68b9a545448
.xword 0xd8f399d0f3152069



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
.xword 0xc9ec738209859244
.xword 0xe2230dc50d34e2f9
.xword 0x644f87cdb182228b
.xword 0x7dfa4bd481580dd4
.xword 0x365f285999d684e6
.xword 0x6afda5a8d3f0c657
.xword 0x5710b606a3ad203f
.xword 0x3f0bb2beaf604479



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
.xword 0xed79630989a1e54c
.xword 0xce829e48daa89916
.xword 0x21474394734da3b6
.xword 0xe7f83d936ce28d14
.xword 0x39a4e07fd17dd9dd
.xword 0x501fe185f5dce713
.xword 0x16588e23d1f3ad3f
.xword 0xa3b1ed86ede429a3



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
.xword 0x4202f067a38d3d2e
.xword 0xe9a76a05c4ead5eb
.xword 0x620d6b900fd1f434
.xword 0x7e71a6689591f029
.xword 0x039f1b741fc8d7c6
.xword 0x5f09859d4f2aec01
.xword 0xeada517047b6a013
.xword 0x2c8c5ce768736eb9



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
.xword 0x5d02f0577f492cfa
.xword 0xa9d02256d98827e8
.xword 0xd9e41eff9ca7a67c
.xword 0xeb104c34ea93b993
.xword 0x1f9bbfb3c8a54236
.xword 0x376b60658925dcd8
.xword 0x28fff8e606ab8cd5
.xword 0x64a6a3f4ef9fc6b3



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
.xword 0x00efeead4b57a905
.xword 0xad73bffd6f936d76
.xword 0x0b9fae06b48b3c4e
.xword 0x77085a631a7fe175
.xword 0xf5c48c7631097f9b
.xword 0x0afcadae021c3d57
.xword 0x0d6e0a45cd39651a
.xword 0xecf2f762eb9ccf9f



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
.xword 0x90c3f1e70c18f860
.xword 0x726e7ded91ea7c48
.xword 0x24828b80f8870362
.xword 0x854e7a16bb244daa
.xword 0xe7ad0cc2db599e0c
.xword 0x342d75cf93d8fb85
.xword 0xfc167b81c5f4b349
.xword 0x30ea8848b8613395



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
.xword 0x50f7bb32192f147a
.xword 0x7507d31c7767ebdd
.xword 0xf67ce2202443e21d
.xword 0x3ad65d813289189a
.xword 0xca14c05a2a255825
.xword 0x65029e3ce7df1bc5
.xword 0x38a7ce59b5df7cd0
.xword 0x7047fd001a86bef0



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
.xword 0xebe79b3a84b3cfaf
.xword 0xf50b891352e93e6b
.xword 0xbf85556acec9c276
.xword 0xfb9276893b2cf767
.xword 0x76c69c2225fa1d35
.xword 0xc1efd229843db0d0
.xword 0x7e0b2a8a9ebf24bb
.xword 0x41e67805ce0e19cd



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
.xword 0x6242ee759fcea281
.xword 0x72865a9b66be881b
.xword 0xc4669aa2fb46fd19
.xword 0x25f8c7eb832779cc
.xword 0x953deb149fe086ff
.xword 0x1d8ba7241efbbc95
.xword 0x3e4e60bb9fdfb6fa
.xword 0x6790706307c1300e



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
.xword 0xad60ef15c9e08556
.xword 0xbcafc2aad04dea49
.xword 0x3c6b8efe5b9260ce
.xword 0x780df8a37c882bac
.xword 0x91b211b5695e2e68
.xword 0x0df76b411568e3f7
.xword 0xf780f5ad20321b13
.xword 0x2e3611eff805caea



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
.xword 0x3013b6dc156f5c0a
.xword 0x1851dcf134bd6d44
.xword 0x3ab1ea54de303aee
.xword 0x3310d3b7e80bd26a
.xword 0x1d87dc06f8acc880
.xword 0x1aa5cb4d024662c0
.xword 0xd21d51043207e384
.xword 0xc0c147ff3ec34746



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
.xword 0x2dda8f8495a5b2b7
.xword 0x95daabd49c78a7d0
.xword 0x97822603a2599f4f
.xword 0xcffe75c3895b638c
.xword 0x83fd51c432940b64
.xword 0x13778303215d4eff
.xword 0x92f0388726f17a0b
.xword 0x488f44c9d04c9ebc



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
.xword 0x0e64ee9d724c379d
.xword 0xac2d2d87a21b7172
.xword 0xd829696146b0bdb4
.xword 0xa54e33723fc6875a
.xword 0x6c414f333bf51830
.xword 0x143bc88a15f43986
.xword 0xf9a925df04a9f9c2
.xword 0x96cdd29a408d355a



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
.xword 0x5d1ef91be9ea1ed1
.xword 0x422658e1176d11e7
.xword 0x864ce0abdad3b723
.xword 0x62b1393b2ff5d466
.xword 0x90b78d61b531576a
.xword 0xc5ad566564a66e62
.xword 0xb44fbb96abd36ead
.xword 0x343ff9938be01de5



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
.xword 0x9d7d51ef4ead42a7
.xword 0xb02e71954ac484f5
.xword 0xe4bb4b34551796d7
.xword 0x72d78505bcd63de0
.xword 0x4a2418fed100eef8
.xword 0x13512baa145ea5d8
.xword 0x926e244a129c03be
.xword 0xf5021c80afb0bcd3



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
.xword 0xc80762fa5caa3fe0
.xword 0xeaf2f1e82338b1d0
.xword 0xfd64ba334a8e6cf1
.xword 0xec200355ef4c73a2
.xword 0x38e5a3628f4c47cd
.xword 0xf331f0e3989a0baf
.xword 0x09e13892477d99e8
.xword 0x5ad7d23be6e63cb0



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
.xword 0x8bce346bcfac624e
.xword 0x384ffa13a2196965
.xword 0xfbedac2c19e3e0a4
.xword 0x44c1155fef0aabd9
.xword 0x83389736012c325b
.xword 0x678ebfd861800f7c
.xword 0xf0877f60e0a8ae6c
.xword 0x3d9a932c5592d92b



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
.xword 0x6ad8b56bb785e147
.xword 0x835ce00d3cf265a6
.xword 0x3a320f42b820eda4
.xword 0xbd7c1991d2a5df0e
.xword 0x19f3228799f25a38
.xword 0x65177603cd499be3
.xword 0x9567eceb1836a0c4
.xword 0xc8538289adbd5350



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
.xword 0x1ff96f2d34bcfa82
.xword 0x9ed516c839592d2b
.xword 0xf3f5948e35cb35dc
.xword 0x71ff5a629e83b92e
.xword 0x2ea13d84eda50872
.xword 0x37a3f61e71be8715
.xword 0x3238c4412463c05a
.xword 0xde28ccc20e1fee4e



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
.xword 0xdf30c3e4ad4db8c6
.xword 0xd91935d2c330b555
.xword 0x0c179238684bcee5
.xword 0x95f40422202d90f0
.xword 0x8e460830d1383ad1
.xword 0x66d2d663924b7225
.xword 0xb6d7eda2da7dc73b
.xword 0xdec3d975d6209cec



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
.xword 0xa47188a14a5c078d
.xword 0xdbdd6b6a83a96cb9
.xword 0xd74b8f754f964e97
.xword 0x2a021d104bd7f883
.xword 0x04b8b9f05724f793
.xword 0x08f54390344513fb
.xword 0x3eb7bf5f41b9df2f
.xword 0x02ceb30630a12693



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
.xword 0xfc878df1e4a8b7ce
.xword 0x763a1f8bf5fc91ae
.xword 0xa901e15dda2cfaaa
.xword 0x20738b9d8c5dd074
.xword 0x69e438d3e5315874
.xword 0x3f8e96cef109a4c0
.xword 0xc4614d2785d2f923
.xword 0x784989227fc8920e



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
.xword 0x3ad6a426c7591342
.xword 0x13967d04f5356c7b
.xword 0x5f8fcde2a3bf42a6
.xword 0x0a4e172439647c58
.xword 0x932a5d2753c3eba0
.xword 0x9695c76e794dcde2
.xword 0x562033b34b51874c
.xword 0x067eaf1e0abc6de5



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
.xword 0x35718146a840351c
.xword 0xda2e35bce7a8b668
.xword 0x97c80ad661971fd5
.xword 0x1aa213ae0bba37c2
.xword 0x3e65eb4468393217
.xword 0xce5f72a73b0c7117
.xword 0x3c629bf4cde0fc50
.xword 0x7eef2567e030500a



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
.xword 0xf932f947b8388646
.xword 0xcf067c2d3ba2a0b0
.xword 0x54bfa341ca3fbc9a
.xword 0xd9c4478061375123
.xword 0xf32ac07f4b565986
.xword 0xdc3de040ede5932f
.xword 0x33ba26ca27ba4970
.xword 0x2e743abc9529a280



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
.xword 0x22a5cd877d7f6a51
.xword 0x327ae45b75045b35
.xword 0xd72d6c467ba20052
.xword 0x1737207b5d1a95a6
.xword 0xb5a2ac5f3d868760
.xword 0x30add2ce96d878db
.xword 0xf22c630e4b57edf6
.xword 0x2bd4af2cb0574b03



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
.xword 0x89ba487548bc8a06
.xword 0x4c85d7b6aaaafba5
.xword 0xa7bbf1d5554f0854
.xword 0xd58b2f3a98907039
.xword 0xa6b5619d7911b1f4
.xword 0xe9b1cc019cd9128b
.xword 0x25b11abf9b9cedc3
.xword 0x8396cefd593e9b17



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
.xword 0x85acd96a69f97f15
.xword 0xc0809d7fa1358b77
.xword 0xa0e0b406a4d19348
.xword 0x4f8f1ca13d0a629b
.xword 0x3b1b7ffaebded448
.xword 0x58415ab83663e165
.xword 0x481c9d169908f8cb
.xword 0x2f2d81f26afb07c1





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
.xword 0x26bf8e50f6e3a616
.xword 0x7018ff83185745ef
.xword 0xd47309d62a3f9231
.xword 0x8ce8f9cd15891a93
.xword 0x0019ea5d0f4cb2e4
.xword 0xa70f04c27e3c0fc0
.xword 0x0ed6bfa4ff17e792
.xword 0x899c91d6183c4ec9




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
.xword 0x323c930a494207bb
.xword 0x57bdf23683ea3d0f
.xword 0x5798221b7d0a163a
.xword 0xb9decf6053ffee70
.xword 0xf512efd395cdaa18
.xword 0x3a6ad6ccbb5f481a
.xword 0xe83b736cac2a93a7
.xword 0x8c14522008ab5410




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
.xword 0xbc57df768a884652
.xword 0x514205d86baa5965
.xword 0x2d669f2bd5a91318
.xword 0x1858ad98114b1bf6
.xword 0x5b7c9c49b979db0a
.xword 0xa82b48e951ff2eb1
.xword 0x019548833ed88e7f
.xword 0x9a1fb3a3ff7056e8




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
.xword 0x8bdb29f0540fa8c9
.xword 0x7e103849e99f6160
.xword 0x314c07100f28f392
.xword 0x374712e852e7f53f
.xword 0x60e8a25d012a46f0
.xword 0x42f8ed37572a5d51
.xword 0xee6f429deb1ee342
.xword 0x90ff2ccb6ab5c4b9




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
.xword 0x078cb3bae2c2c2b2
.xword 0x3093cf0baa91d5f4
.xword 0x86b178f0498274a0
.xword 0xba628d3f68d36a82
.xword 0xcb282a32fee22604
.xword 0x1602cbf7bff25b81
.xword 0x9f99828b5c713a22
.xword 0xbd550f82fb11ecf1




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
.xword 0xaf680aa8152239c8
.xword 0x235e17ed5bc66722
.xword 0x5899fcd8d4eecd3d
.xword 0x50c68f2ca2dfc55f
.xword 0xe0341644b7958154
.xword 0x16a85863b646c4ec
.xword 0x66924f8b2a1865e7
.xword 0x89852510e39f4081




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
.xword 0x705089ef19191140
.xword 0x9b649818c5db1d4e
.xword 0xc0e379fcff43667c
.xword 0xb7419d71ea4b7604
.xword 0xe6bccde81c686145
.xword 0x214e62145efb634c
.xword 0x33fb86ab09f1564f
.xword 0x225963e26f4d0b25




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
.xword 0x19e5f95794e9ac60
.xword 0xdb10e60d5ee607b1
.xword 0xab5ec6c59fc2ccde
.xword 0xaa4a14d6a94de45f
.xword 0xec9ac2c633c7c60d
.xword 0x9a132d10f78f44b9
.xword 0xbf0510f8340a5eee
.xword 0x59cef632d2d7d4a4






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
.xword 0x3487af53de0b520d
.xword 0x62e22b943b4e5f57
.xword 0x83e78c692f8c3267
.xword 0xdefb5ecd7aa6e41b
.xword 0xf871755d5bb30b28
.xword 0xe1ab4af934e2d65b
.xword 0xedeb0ce1d11ee2da
.xword 0x1787e63c0a35de25




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
.xword 0x62e0902e0866c1d7
.xword 0x0d84fc34463a0c2d
.xword 0xfdc6a9595ec018c9
.xword 0xfe3434c744266b55
.xword 0xcec1554a2b757725
.xword 0x31d5ce1e4f5df1b2
.xword 0x862da8f06b224e7a
.xword 0x90a058af935eeb9b




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
.xword 0x3c240616ca0e71f3
.xword 0xe14e8fcc80977ee9
.xword 0x244d4cc61e353101
.xword 0xc36bb878bfc2684e
.xword 0x2a4731e93ea1c992
.xword 0xc09303fb8349fa8e
.xword 0x6b5ec8d740762fee
.xword 0x8399f1be56c3d756




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
.xword 0x3d42fb0ca9efd638
.xword 0x33b5c7f7916301a5
.xword 0xf2baa8164d6afd99
.xword 0xb0c1e7b68067ff19
.xword 0xc4635a8f7592048e
.xword 0x0a22e1ddb56c9673
.xword 0x9b3af42c9742c6fe
.xword 0x17b4a90ddc59fee7




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
.xword 0x0e46931ab2cfbf10
.xword 0x68eadce323e430ce
.xword 0x6c8d549731255b94
.xword 0xa6e1069fedbfb7e4
.xword 0x0031e58ac1ac89d5
.xword 0xa06b7a21acc9fd2c
.xword 0xcf39a7a1fadbaa90
.xword 0x1851964a2a9a2bab




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
.xword 0x6910ac38010fac9a
.xword 0x8acc23b644ffa977
.xword 0x8a1eddf07a2f7e69
.xword 0xfa4a04330504cc3e
.xword 0xbe55a692697700b2
.xword 0x86e52a993dd09501
.xword 0x93e7370e85c131e5
.xword 0x156a818085bb1b97




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
.xword 0x0061a1b3b612be70
.xword 0xc26df8f6dc1708e3
.xword 0xf1ca7053e836e3a7
.xword 0x58e8d8db641c2c42
.xword 0x2890de2502a0b2ba
.xword 0x8742f1e851d7fe6e
.xword 0x0ec4aebcc5283b7d
.xword 0x633b94e1af28e681




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
.xword 0x0f260623a47ea2b5
.xword 0x713b659b8040c431
.xword 0x53547150c85e9302
.xword 0xa8258a3278179f80
.xword 0xf3dda2425cab4009
.xword 0x3b91b4a8af64f31b
.xword 0x27cc19e9fe3c411e
.xword 0xc71359cb8a446bc8






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
.xword 0xfe6d01a1effcff2c
.xword 0xafe5514331bef5d2
.xword 0x9f8d1dd5143b6104
.xword 0x73fde691f8edab37
.xword 0xaf24a4bc6e78b7d6
.xword 0x23c4cf5a8d189aeb
.xword 0x44d86cd4ff25a873
.xword 0x4652a7f4a19860c4




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
.xword 0x05c5e902533ce862
.xword 0xf40255f4ed2d1cb3
.xword 0xbb9ea007438d48fd
.xword 0xa643e2097aa03fe0
.xword 0x9c28db6489acf1b6
.xword 0x0c48b16b7681e121
.xword 0xeb4b2994f6bb06ed
.xword 0x9cae6427cf92d50b




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
.xword 0x8b743ad2b8905a25
.xword 0x098f6ae214445303
.xword 0x3d7fa3cc20a996da
.xword 0x93b9219618082a5a
.xword 0xb3afe46a2286c70a
.xword 0x10e8500b6308c740
.xword 0x3b45ab4a18e9b30d
.xword 0x20c9e714a7296ca9




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
.xword 0xc2569dd7eabfbe80
.xword 0x6ed3b048015e6f32
.xword 0x99f34323167609a7
.xword 0xb0cf7a900cf7eef4
.xword 0x7baf6562616327d2
.xword 0x368f0ce70dc045bc
.xword 0x3fb7fd25259e068e
.xword 0x11236d22fadb2080




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
.xword 0x451165be51d3470a
.xword 0x6117e1d0a18a12ae
.xword 0x2cb479d73d8ae68a
.xword 0x7a482f3be74891b8
.xword 0x239d71636ffbb939
.xword 0x88555c0beed5df74
.xword 0xa375612f9279bf2b
.xword 0x4588b9de2a4306f4




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
.xword 0x4b5bd19d361030b8
.xword 0xb88d17b43652c802
.xword 0xfece4a74d12a432f
.xword 0xe77dee66f5f5f9cf
.xword 0x810b6826519b67db
.xword 0xa26422173a46a8b0
.xword 0xc1af3f1bea8338c7
.xword 0xe9f2de4f0812f364




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
.xword 0x040ea03dfca82406
.xword 0x5a0d180de2221d81
.xword 0xead8bcc0389c9977
.xword 0x7c18dc632f40ddfa
.xword 0x8c2b056bd07b6fe0
.xword 0x6e75720c35baf000
.xword 0x9d879560a5ff8802
.xword 0x48db6d6f6a863e77




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
.xword 0x7fd8989d0119132d
.xword 0xae232ee29933f0c9
.xword 0x648b1b8fccb7851d
.xword 0xfde011b691fc21a4
.xword 0x5d482281d7c4fdf9
.xword 0xddcf778c3841b485
.xword 0xea7b4ebea62e3c65
.xword 0x956d96d4355db33a






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
.xword 0x1509f635e4e827b3
.xword 0xe8ab6e679b877c96
.xword 0x50855dd61961a85b
.xword 0x20597a0d7d9aefd4
.xword 0x39cc39149baec473
.xword 0x39bf14ecd57348df
.xword 0xed4b26d09a5b15da
.xword 0x69c2c0f837aa8594




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
.xword 0x4bebe675c1e2cedf
.xword 0x3f031bc85a751996
.xword 0xb46607e58ede876b
.xword 0x4aca6b6057b1ff81
.xword 0xe1d1f05af0079fe8
.xword 0x762c24fee70971f9
.xword 0x997857088e40831d
.xword 0xcec3413c149c1bc3




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
.xword 0xa395dfa9b9014fb5
.xword 0xe594313c56884b2f
.xword 0x5befeb2ef04c8cae
.xword 0xc916f151512b7910
.xword 0x2b330ae1ecbb5066
.xword 0xf7183ab8683dcb59
.xword 0x8afecfab3f619a4a
.xword 0x44ff6e9ea00d7b42




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
.xword 0x97070340e648a23b
.xword 0x81b637c8ce676ee4
.xword 0x451782062d41f821
.xword 0x7ad0f9235f25cf89
.xword 0xb975cecd35bd1726
.xword 0x49322fb3fc1b1c22
.xword 0xf8b38fb012f3c00f
.xword 0x68022103749cab9d




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
.xword 0xc87c5c93602112aa
.xword 0x8e3a856520b52f05
.xword 0x44d62f96fa3549e9
.xword 0x4633e3a19396b9a6
.xword 0xe2e4429b5c3bd29e
.xword 0x48b2f4b7d4b6f43d
.xword 0x86aa8b915f29d39a
.xword 0x823bd3ce03c3e617




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
.xword 0xa1ba7b833eb187c4
.xword 0x14ae2a5880a8e1bf
.xword 0x267487e207ba0108
.xword 0x6d5fb22dcdf99d82
.xword 0x193dc7ee5ace9dbe
.xword 0x1d9c206a86e7f893
.xword 0xcee00167369cd658
.xword 0x2ec19441e0fd99e1




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
.xword 0x213e9b5dd2b525a4
.xword 0x33354dfc731a0256
.xword 0xa42e83a290045a79
.xword 0x1c505666cd1243fc
.xword 0x429f9ed7d9e7d096
.xword 0x54db951202d293b0
.xword 0x31221c9c4241b083
.xword 0xb3d252909a8cd6d9




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
.xword 0xc3073118c4c68b0e
.xword 0xd6200ed4a19fbedb
.xword 0x576dd2c8ba93e4da
.xword 0x9ce2cc833e9d6a21
.xword 0x01421f68d4f7c3fd
.xword 0x7b07bcd1493a96bd
.xword 0x820fbbf31a1cd706
.xword 0x9685867acd7d00f8






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
.xword 0xe306aabcd1d953ed
.xword 0x6fd0c569d30ccca6
.xword 0xba21d9280bf2ea41
.xword 0xb662ed1018ac2810
.xword 0xa6bb13f856a7a291
.xword 0x803abad3a1c0735d
.xword 0xe36b866ad7a9e8ac
.xword 0x0a48afb167ac2a92




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
.xword 0x3be70c8cd6e010f3
.xword 0xcd3d2d6c46d4bcde
.xword 0xb5c04e84b056c2a3
.xword 0x5e8993171dc36e75
.xword 0xba5234b1ede3f4db
.xword 0x10ad015bd2a5baa8
.xword 0x7f08134d34dc651d
.xword 0xab13d305703000f9




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
.xword 0xd35fc0a07648bfa2
.xword 0x66e063e1860081c7
.xword 0x6ad5c2defbe6681e
.xword 0x06f7d3a4a3534e95
.xword 0x888c642c606284a9
.xword 0x5a8ca8de3be9427c
.xword 0x7304b15d66c64ecd
.xword 0x89c045c82b781553




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
.xword 0x12ac745adf130e9f
.xword 0xe8615844c6ff4ff3
.xword 0x0bfd46acc4b8b36e
.xword 0x82be6a94c88c0c04
.xword 0x7d16fa749405ce42
.xword 0x3f3dfd1ac7b5bb2f
.xword 0x3a4e9c8fc6859730
.xword 0xd818948cf1d3e0e6




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
.xword 0x8fc7341303f5821a
.xword 0x6124ba446bf75fbc
.xword 0xa2126eb5c904a26d
.xword 0x6c6618b6a17f7c5b
.xword 0x5b1db67a7bd8a646
.xword 0x8a877b7ac395d2b2
.xword 0x0f862ba404f4d4bc
.xword 0xd2d9027fc90ad713




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
.xword 0x4d639e16df51a065
.xword 0xc9def8dcc4f93a49
.xword 0xe373419c0e726032
.xword 0x2949278cae647032
.xword 0x6c4ceb2a33d21a0b
.xword 0xb5c9c58a1ef2f9b8
.xword 0x90ec3a11ad06b011
.xword 0x49ab34b693f578ef




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
.xword 0xe17519d81e997746
.xword 0xebefff27d91b7011
.xword 0x3ed2d0a022d6046a
.xword 0xf2ce1d60b4095feb
.xword 0x097d6d7ccfc22ef9
.xword 0x78f0d0a4f3d3958e
.xword 0x88f484ff45dcb9ba
.xword 0xdb157e1acfe54335




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
.xword 0x310c5e4135c7332a
.xword 0x9aec14d8b67461bb
.xword 0x3db7f4e84f00713d
.xword 0xbe022af552579fc4
.xword 0x8d7e5aa2bd09d7f6
.xword 0xc0b70dbe6735f7ea
.xword 0x9ac736bfa9a548bc
.xword 0x70fc5ed31e83d256






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
.xword 0x67de2a4a5240b047
.xword 0xee1944086e8c0dd4
.xword 0xe6647682210ce345
.xword 0x23a6d8b7edb74aab
.xword 0xa9eae542dc372ce0
.xword 0x033a3d8cf1080d78
.xword 0xdebad5e0f79e2a64
.xword 0x21066f61357777fe




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
.xword 0xf34fabb78f58af91
.xword 0x3b53c1d95834ab4f
.xword 0xcdcbb346b232c3bf
.xword 0xe57e9d82f90c971f
.xword 0x445504775aefccc0
.xword 0xbe13f49aecbb8435
.xword 0x02616b1efdc6e010
.xword 0x5e501270b4ce2797




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
.xword 0x6ff3ac1a3d7526f0
.xword 0xfe2cd778c7d16cd2
.xword 0x75205a08e47a9749
.xword 0x81b8b7b86d694c96
.xword 0x0e85a756d8ee1906
.xword 0x977dda025e9c7c9a
.xword 0x5e999cf355f1bbc3
.xword 0x0d34d5308dff0078




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
.xword 0xb4764785c72afffe
.xword 0x7e99f2c677cf8e3e
.xword 0x3eb483cbb3e886f6
.xword 0x068c8f20d0afbba3
.xword 0x1c6ea98393408ca4
.xword 0xd6ab25780d7ff091
.xword 0x019f27f4f7b93e9d
.xword 0x03a25b6fc666b4fe




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
.xword 0x7320226d6b6480da
.xword 0x7b6ebc28779662e5
.xword 0x3a05868b48ece2fa
.xword 0x7aa1942881691810
.xword 0xe7bc3682b6df7c4f
.xword 0x077d5e53f23772b3
.xword 0xda6bc0d54c7d4891
.xword 0xeba339387db31ba2




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
.xword 0x163a5a258906ffcb
.xword 0xbf8e9810c8d3766b
.xword 0x3e033ac9bc4a74e1
.xword 0x3289ab6def383c90
.xword 0xd928f95b25c1507b
.xword 0x5bd4f7da6918fda1
.xword 0x5990c8d0a9936b2c
.xword 0x9e19e16b828e4a00




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
.xword 0x09b0e8213533d427
.xword 0x5bcb7e993db84f10
.xword 0xa52f2b1e720f143b
.xword 0x99b8c74c37b96046
.xword 0xee3d9e25f1eb5469
.xword 0x00783a960acf8f8b
.xword 0x1bb69935bac44611
.xword 0x956776a071dbc5c8




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
.xword 0xde73455b9e40f1f4
.xword 0x29fd867c6f175b02
.xword 0x1ed874198fd67135
.xword 0xf3292ba47a9679a4
.xword 0xcdf13af6f0fabdc2
.xword 0xa37d1254e2a95998
.xword 0xd81db2164d50f473
.xword 0x4c14db0b2855d0b4






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
.xword 0xe519e4688265c39a
.xword 0xaacc6d4018bb36ee
.xword 0x5b2db30598ef8503
.xword 0x10190a0501449575
.xword 0xc0c60c8562d92e8d
.xword 0xaf310f29730e7eac
.xword 0x89eb19e3f45d1ffe
.xword 0x67515cae6394f9ff




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
.xword 0x67dc04ccc5290e6e
.xword 0x14e7c4973a6bf50d
.xword 0x811677e47063fe4b
.xword 0x2bbce40d6e3ca527
.xword 0x231e059e9b00020f
.xword 0x69d18d70a32c5bb9
.xword 0x7f3e62e1617bda45
.xword 0xa82076764f61dcaf




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
.xword 0x3c7c53eb7c929a4c
.xword 0x6e908153115c8b4d
.xword 0xbb84debb0e78897b
.xword 0x5c7e60b903a76ec1
.xword 0x309221fc7265858c
.xword 0xa510eaaf2855c6cb
.xword 0x8a0d2e70da14193d
.xword 0xef2c48d34e62959a




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
.xword 0xbc63d1f189d19b16
.xword 0x3a815a77b4ae06a5
.xword 0xcd41023888796b38
.xword 0xed440ae02747e60e
.xword 0x5a3ff959ced3bb86
.xword 0xf0f83abb1a791c3e
.xword 0x14376d139af0c3c8
.xword 0x5bb06b2186a29a13




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
.xword 0xc33e7e538aacdff3
.xword 0xee59dac51f1d6533
.xword 0x569722c9f112a6b5
.xword 0x83f521a4fdfe4405
.xword 0xcd8a962a6c34132c
.xword 0xac5ff3a0d7c75f12
.xword 0xaad507455f68ddef
.xword 0x5eca0b4cad7c9297




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
.xword 0x27a2728bf1a4e13f
.xword 0x6b77e715e1fc1aae
.xword 0xdc74909829a1b7a4
.xword 0x7c48f0977b6fe554
.xword 0x957fa11bf858364c
.xword 0xc312feec25417500
.xword 0xefc10a89e878b91d
.xword 0x59fffb4fd6f06abf




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
.xword 0x1275a014f0c0e4c0
.xword 0x2087374cc498a1a3
.xword 0x110ead341c1d8420
.xword 0x007805162d4c4551
.xword 0x2608a8d9e4200bd2
.xword 0x0eebf8265b0d0599
.xword 0x968c14f16ab1290f
.xword 0xb2187f408fc01d61




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
.xword 0x5f25d81782e59cdf
.xword 0x55c764352c320405
.xword 0xc8110cfa7a93c245
.xword 0x52a6648a996beb77
.xword 0xd9d458338c3880ec
.xword 0x13da7448e9c1a965
.xword 0x3121782a4bfdfcc6
.xword 0x25fae11b261d5ce8






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
.xword 0x3e4ef5e0dd007cca
.xword 0x171fd90079d48173
.xword 0x00978b198d9a6542
.xword 0x418e0dab235e7ce1
.xword 0xfeea47e26dec47b1
.xword 0x16da6a8f657f99e1
.xword 0xce48758c47677c47
.xword 0x833f999a6e40fa80




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
.xword 0x27f3ec7e8e9cca36
.xword 0xbd5dd3807ef713aa
.xword 0x23c6091408c384f3
.xword 0x5c62455991f42e60
.xword 0x2e78b615c212af68
.xword 0x2eca5b9b731a0b5b
.xword 0x91d73eb02f2f904b
.xword 0x48313bc2f71e78e7




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
.xword 0x8a76e9e707b95c72
.xword 0x8381b14705f35694
.xword 0x1d5f608bc3a0b8e8
.xword 0x75a401902faf6a0c
.xword 0xfe69d0b5c27b74d7
.xword 0x99c4790b1e9f7e4a
.xword 0x52aa173332e11d4d
.xword 0x79cd4bc6e3adcceb




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
.xword 0x509a69b1caff1f37
.xword 0x5022279406abf0fc
.xword 0x33f44b1772d58d76
.xword 0xf630250bc899cdfe
.xword 0x531e89bfa8aa9319
.xword 0xf3ac64cb8b5e184c
.xword 0x313fde6c12ac117e
.xword 0x231a5fbe75b87419




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
.xword 0xee56d6027993638d
.xword 0x80124a9fe598849b
.xword 0xf9d37882baeb15ee
.xword 0x40693cf97d3ce610
.xword 0x22077585b8c0ced6
.xword 0x047016a021bc8ae2
.xword 0xba93e13e644cf18c
.xword 0xba7cda5da3a06185




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
.xword 0xfa6e591020445dec
.xword 0x7af91448bbf226de
.xword 0xa6d4649554f35de9
.xword 0x7f3ab33f8bffe1e7
.xword 0x251dcde6aef1eb96
.xword 0x68e8b20eac38a240
.xword 0xcab90649464baca7
.xword 0x38e6be8a6ff81491




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
.xword 0xe80a8fd4be1736c5
.xword 0xac75f7c08dcd16f7
.xword 0x9341cecd19169a9f
.xword 0x4eb72bfe1b59d261
.xword 0x0c7e1802d4a6e22e
.xword 0x0c2df3b8052c2dde
.xword 0xb920908cd89476e9
.xword 0x79719dcf7db4aa50




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
.xword 0x9c223522df56db24
.xword 0xd6cca4a1dd43b52d
.xword 0xb9baf8d6c41ab9fb
.xword 0xb192e29653e78d83
.xword 0xaf0b997deb2a1b58
.xword 0x125747da3b51e693
.xword 0xf9e6b122e716980c
.xword 0x2f36d179cfc019a7






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
.xword 0xa759f55c4fe075bb
.xword 0x9983e1545b236df4
.xword 0x8f39a401451bcd4a
.xword 0x3a66d7bd2aa502a9
.xword 0x8510093f3d002799
.xword 0x48fd3a0f2aa4f4a6
.xword 0x18d63030b3d02512
.xword 0x34c1af582073c2e8




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
.xword 0x09a598a07143437d
.xword 0x867f1d4aa811b0cc
.xword 0x1463fa3863c6b133
.xword 0xde941677bd70d460
.xword 0xfafef4b6125f9dd7
.xword 0x0253ec15c79d3abc
.xword 0x9380d39d8e3348aa
.xword 0x537ee66b76ecea74




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
.xword 0xca8082ee7dc630d2
.xword 0xf26f479ac5ecf240
.xword 0x0cbdd23c3209fb7a
.xword 0x217d0654e5a2fa91
.xword 0x4db33b3f851a7711
.xword 0x780c7b9763d57fed
.xword 0x2ff0b86fa2e1021b
.xword 0x36c3bc7d35f23472




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
.xword 0xc87e64e852c0dbef
.xword 0xf4865f4fc3674a58
.xword 0x4fabfddbe6d6c248
.xword 0x789ba32295979dce
.xword 0xcd06cc191b1431dc
.xword 0x2fe4b7c5fb7b99cb
.xword 0xfb3b4243d4a0885c
.xword 0xadb0510c4413471a




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
.xword 0x1b3a21e2e9e525c1
.xword 0xc2c5805fbcab36d3
.xword 0x8eb0017d024913da
.xword 0xcd99d0dd212f445c
.xword 0xe3ef2f9157670ca8
.xword 0xd1fd3fa2bdfbe424
.xword 0xed9b30209df9b515
.xword 0x7e80f9d63c0260ca




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
.xword 0x44c1600b0c74ae00
.xword 0x8e25ffc42cc8009d
.xword 0x84a3446ae6e8c211
.xword 0x0e028a17f4288ef9
.xword 0xe423761ae7bb0884
.xword 0x1eed8930f91fddba
.xword 0x59c2a9e1e811ffb1
.xword 0x8b829b6c1d923fc5




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
.xword 0x13683ab37fbc45d3
.xword 0x8922a1848cd2f32e
.xword 0x2a196f41eedd1cda
.xword 0x43c052f023a84735
.xword 0xd9499b1bce62ce07
.xword 0xcc134a244e98d197
.xword 0xd5b0648d9d48d111
.xword 0xbc893201de18c65f




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
.xword 0x5f05d102b14f8bf0
.xword 0xe2cd2bc918d43f3d
.xword 0x5350647c6b20e805
.xword 0xaef97e63109f708f
.xword 0x90e1e8adf9a298cf
.xword 0x3e08d483258eba56
.xword 0x1f66e64cd38a47eb
.xword 0xc129eb4805388992






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
.xword 0x42dfdaa8c719cf5b
.xword 0x4752cc68509e26c5
.xword 0x107123d9310fd75d
.xword 0x866d661e492b4054
.xword 0x7ff5705267fdb929
.xword 0x72c269f531380d55
.xword 0xc61f904d58f9ee74
.xword 0xa18b7c45ce25fd26




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
.xword 0xafbe329a23c4e601
.xword 0x296f258ee91904fc
.xword 0xd2aed01a70631771
.xword 0xcf3fe9f08ec0c0ac
.xword 0xd76cc2e0a0738120
.xword 0xedcefa3fff35756b
.xword 0x00729c6c0da2b722
.xword 0x67aed743012144f3




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
.xword 0x5e32a22ff41b7929
.xword 0xd9d2dc7df49c3396
.xword 0xaa4125239f33b328
.xword 0xda142994c9df1d22
.xword 0x10d31a863d618144
.xword 0x8af295417931c53e
.xword 0x409d7e280251f2d2
.xword 0x648d23c034873a11




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
.xword 0x2d3ea146b838419b
.xword 0x171951165f3a6cc6
.xword 0x51973f73be747a1d
.xword 0x5264893aba7cbd28
.xword 0xf74c89df9bb5ab2e
.xword 0x3f822db114d550f8
.xword 0x0532008c8fa27d08
.xword 0xe2c12bb48bbdc572




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
.xword 0x705e13869df349cc
.xword 0x1979a2489a4cbeba
.xword 0x81ea123774a490b0
.xword 0x13b05a9471f82f73
.xword 0x3edda2004e7528f6
.xword 0xc893e76ea4b3958a
.xword 0xdd521e76dc7b0fc3
.xword 0x8670b5436ce89ebe




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
.xword 0xe556bbe9577b7411
.xword 0xd782ff08462167f8
.xword 0x46cad8d155e1dfcc
.xword 0xb7e9ea7a37dc9dfb
.xword 0xb57795a5180d0405
.xword 0xa95c69e63e6961b8
.xword 0xc7ff516a815c0658
.xword 0x10c5ff026b18bf6c




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
.xword 0x8688da77205151ac
.xword 0xb26af0c7770c3c27
.xword 0xd6d425521b1d5c24
.xword 0x515682f2007a0fbd
.xword 0xbe33b28500afb4ab
.xword 0x9c67d30b4f42452c
.xword 0x713011a7db9ddcb7
.xword 0x661b54af36f1fd86




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
.xword 0x321c69586a1fe205
.xword 0xd2ed9f0a3933e476
.xword 0xc964e1042f5f204f
.xword 0x832e6d67f9a134ec
.xword 0xf8b1f02a8b07d51c
.xword 0xc72ebd89a7f17cd5
.xword 0x05fe5523198826ec
.xword 0x1f9468f14bd741a7




#if 0
#endif
