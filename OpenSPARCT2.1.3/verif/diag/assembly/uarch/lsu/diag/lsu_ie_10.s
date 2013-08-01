/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_10.s
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
	setx 0x6285706e984e7cb2, %g1, %r2
	setx 0x0a5d56ab0385ce30, %g1, %r3
	setx 0x82df1eee12a5ebe5, %g1, %r4
	setx 0x9ee9be8c7e5d7de3, %g1, %r5
	setx 0x232aef8f032eafec, %g1, %r6
	setx 0xac0c8cf7b99ad6ce, %g1, %r7
	setx 0xb50c9d3160b6787e, %g1, %r8

     mov %r2, %r1
NC_BIS_SEC0:
	.word 0xd302a02c  ! 2: LDF_I	ld	[%r10, 0x002c], %f9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS2:
	.word 0xd2d7c23a  ! 4: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r9
NC_AIUP3:
	.word 0xd2ae431a  ! 6: STBA_R	stba	%r9, [%r25 + %r26] 0x18
	.word 0xd2cb911a  ! 8: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r9
NC_BLK_SEc4:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 10: STDFA_R	stda	%f16, [%r26, %r19]
CP_ATM_QUAD_LD5:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 12: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_BLK_SEc6:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 14: STDFA_R	stda	%f0, [%r26, %r19]
NC_BLK_SEc7:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 16: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd293911a  ! 18: LDUHA_R	lduha	[%r14, %r26] 0x88, %r9
	.word 0xd3bc913a  ! 20: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xd3bcd03a  ! 22: STDFA_R	stda	%f9, [%r26, %r19]
CP_BIS_NUC8:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 24: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xd2ab101a  ! 25: STBA_R	stba	%r9, [%r12 + %r26] 0x80
	.word 0xd3bc903a  ! 27: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xe7efc5da  ! 29: PREFETCHA_R	prefetcha	[%r31, %r26] 0x2e, #19
	.word 0xd233401a  ! 30: STH_R	sth	%r9, [%r13 + %r26]
	.word 0xd2c4d13a  ! 32: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r9
NC_AIUP9:
	.word 0xd2ce421a  ! 34: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r9
	.word 0xd28cd03a  ! 36: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
	.word 0xd33aa028  ! 37: STDF_I	std	%f9, [0x0028, %r10]
	.word 0xd2a4913a  ! 39: STWA_R	stwa	%r9, [%r18 + %r26] 0x89
CP_BIS_NUC10:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 41: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
CP_AIUS11:
	.word 0xd2af833a  ! 43: STBA_R	stba	%r9, [%r30 + %r26] 0x19
NC_BIS_AIUP12:
	.word 0xc8a6445a  ! 45: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
	.word 0xd2ac101a  ! 47: STBA_R	stba	%r9, [%r16 + %r26] 0x80
	.word 0xd03b2028  ! 48: STD_I	std	%r8, [%r12 + 0x0028]
	.word 0xd2ac903a  ! 50: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd2f4d13a  ! 52: STXA_R	stxa	%r9, [%r19 + %r26] 0x89
CP_AIUP13:
	.word 0xd386021a  ! 54: LDFA_R	lda	[%r24, %r26], %f9
CHANGE_R2614:
	add	%r26,	%r27,	%r26
CP_BIS_SEC14:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 56: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
WR_LEASI_15:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_16:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd3a4d13a  ! 59: STFA_R	sta	%f9, [%r26, %r19]
	.word 0xd284903a  ! 61: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r9
CP_PST_PRI17:
	.word 0xd3bb591a  ! 63: STDFA_R	stda	%f9, [%r26, %r13]
NC_PST_PRI18:
	.word 0xd3bc185a  ! 65: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd27a801a  ! 66: SWAP_R	swap	%r9, [%r10 + %r26]
	.word 0xd27b602c  ! 67: SWAP_I	swap	%r9, [%r13 + 0x002c]
NC_BIS_SEC19:
	.word 0xc8f4dc7a  ! 69: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
CP_ATM_QUAD_LD20:
	and	%r26,	%r29,	%r26
	.word 0xc89b059a  ! 71: LDDA_R	ldda	[%r12, %r26] 0x2c, %r4
	.word 0xd2cb911a  ! 73: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r9
	.word 0xd2a4d13a  ! 75: STWA_R	stwa	%r9, [%r19 + %r26] 0x89
	.word 0xd2a4903a  ! 77: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
	.word 0xd302c01a  ! 78: LDF_R	ld	[%r11, %r26], %f9
	.word 0xd2c4903a  ! 80: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
WR_LEASI_21:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_22:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd2ccd03a  ! 83: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
NC_BIS_AIUS23:
	.word 0xccafc47a  ! 85: STBA_R	stba	%r6, [%r31 + %r26] 0x23
CHANGE_R2624:
	add	%r26,	%r27,	%r26
CP_BIS_SEC24:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 87: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
	.word 0xd28c903a  ! 89: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
NC_BIS_AIUP25:
	.word 0xc4f6455a  ! 91: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xd2c4903a  ! 93: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
NC_BIS_SEC26:
	.word 0xc4acdd7a  ! 95: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
CP_BIS_NUC27:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 97: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
NC_SHORT_FP_SEC28:
	.word 0xd39cda3a  ! 99: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd384d13a  ! 101: LDFA_R	lda	[%r19, %r26], %f9
	.word 0xd3a4913a  ! 103: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd28c501a  ! 105: LDUBA_R	lduba	[%r17, %r26] 0x80, %r9
NC_BLK_SEc29:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 107: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd33ae028  ! 108: STDF_I	std	%f9, [0x0028, %r11]
	.word 0xd2b4d13a  ! 110: STHA_R	stha	%r9, [%r19 + %r26] 0x89
CP_BIS_AIUP30:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 112: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
	.word 0xd283105a  ! 113: LDUWA_R	lduwa	[%r12, %r26] 0x82, %r9
	.word 0xd2b3111a  ! 114: STHA_R	stha	%r9, [%r12 + %r26] 0x88
	.word 0xd26b602f  ! 115: LDSTUB_I	ldstub	%r9, [%r13 + 0x002f]
	.word 0xd3bcd13a  ! 117: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd2b4913a  ! 119: STHA_R	stha	%r9, [%r18 + %r26] 0x89
	.word 0xd26aa02f  ! 120: LDSTUB_I	ldstub	%r9, [%r10 + 0x002f]
	.word 0xd2acd03a  ! 122: STBA_R	stba	%r9, [%r19 + %r26] 0x81
SET_TL1_31:
	ta	T_CHANGE_TO_TL1
CHANGE_R2632:
	add	%r26,	%r27,	%r26
NC_BIS_NUC32:
	.word 0xc8b544fa  ! 124: STHA_R	stha	%r4, [%r21 + %r26] 0x27
	.word 0xd0bb911a  ! 126: STDA_R	stda	%r8, [%r14 + %r26] 0x88
CP_AIUP33:
	.word 0xd28e031a  ! 128: LDUBA_R	lduba	[%r24, %r26] 0x18, %r9
CP_NUC34:
	.word 0xd2d5009a  ! 130: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r9
	.word 0xd28c913a  ! 132: LDUBA_R	lduba	[%r18, %r26] 0x89, %r9
	.word 0xd2a2911a  ! 133: STWA_R	stwa	%r9, [%r10 + %r26] 0x88
	.word 0xd2cb911a  ! 135: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r9
SET_TL0_35:
	ta	T_CHANGE_TO_TL0
CHANGE_R2636:
	add	%r26,	%r27,	%r26
NC_BIS_SEC36:
	.word 0xc4a4dc7a  ! 137: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
SET_TL1_37:
	ta	T_CHANGE_TO_TL1
CHANGE_R2638:
	add	%r26,	%r27,	%r26
NC_BIS_NUC38:
	.word 0xc4b544fa  ! 139: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xd2db911a  ! 141: LDXA_R	ldxa	[%r14, %r26] 0x88, %r9
	.word 0xd28b901a  ! 143: LDUBA_R	lduba	[%r14, %r26] 0x80, %r9
	.word 0xd0bb911a  ! 145: STDA_R	stda	%r8, [%r14 + %r26] 0x88
	.word 0xd3e3201a  ! 146: CASA_R	casa	[%r12] %asi, %r26, %r9
	.word 0xd3f2a01a  ! 147: CASXA_R	casxa	[%r10]%asi, %r26, %r9
	.word 0xd2ac903a  ! 149: STBA_R	stba	%r9, [%r18 + %r26] 0x81
CP_BIS_NUC39:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 151: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
	.word 0xc76aa027  ! 153: PREFETCH_I	prefetch	[%r10 + 0x0027], #one_write
CP_BIS_AIUS40:
	and	%r26,	%r28,	%r26
	.word 0xc4bf857a  ! 155: STDA_R	stda	%r2, [%r30 + %r26] 0x2b
	.word 0xd2a4d03a  ! 157: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
CP_PST_PRI41:
	.word 0xd3ba999a  ! 159: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2dc101a  ! 161: LDXA_R	ldxa	[%r16, %r26] 0x80, %r9
CP_ATM_QUAD_LD42:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 163: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd2ac101a  ! 165: STBA_R	stba	%r9, [%r16 + %r26] 0x80
	.word 0xd0bcd03a  ! 167: STDA_R	stda	%r8, [%r19 + %r26] 0x81
CP_BIS_QUAD_LD43:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 169: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xd2ac903a  ! 171: STBA_R	stba	%r9, [%r18 + %r26] 0x81
CP_NUC44:
	.word 0xd2cd019a  ! 173: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r9
NC_BLK_SEc45:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 175: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd2f4d03a  ! 177: STXA_R	stxa	%r9, [%r19 + %r26] 0x81
NC_BIS_AIUS46:
	.word 0xc8b7c47a  ! 179: STHA_R	stha	%r4, [%r31 + %r26] 0x23
	.word 0xd2cb901a  ! 181: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r9
SET_TL0_47:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI48:
	and	%r26,	%r28,	%r26
	.word 0xd0a35c5a  ! 183: STWA_R	stwa	%r8, [%r13 + %r26] 0xe2
	.word 0xd284d13a  ! 185: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r9
CP_PST_PRI49:
	.word 0xd3ba989a  ! 187: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd223602c  ! 188: STW_I	stw	%r9, [%r13 + 0x002c]
CP_PST_PRI50:
	.word 0xd3bb581a  ! 190: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd3a4903a  ! 192: STFA_R	sta	%f9, [%r26, %r18]
CP_PST_PRI51:
	.word 0xd3ba995a  ! 194: STDFA_R	stda	%f9, [%r26, %r10]
CP_BIS_QUAD_LD52:
	and	%r26,	%r29,	%r26
	.word 0xd09add5a  ! 196: LDDA_R	ldda	[%r11, %r26] 0xea, %r8
	.word 0xd2ccd03a  ! 198: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
CHANGE_PRIV53:
	ta	T_CHANGE_PRIV
CHANGE_R2654:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP54:
	.word 0xc8f6445a  ! 200: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xd2acd13a  ! 202: STBA_R	stba	%r9, [%r19 + %r26] 0x89
	.word 0xd27b001a  ! 203: SWAP_R	swap	%r9, [%r12 + %r26]
WR_LEASI_55:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_56:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd282d01a  ! 205: LDUWA_R	lduwa	[%r11, %r26] 0x80, %r9
	.word 0xd28cd03a  ! 207: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
CP_AIUP57:
	.word 0xd2f6031a  ! 209: STXA_R	stxa	%r9, [%r24 + %r26] 0x18
NC_BIS_AIUP58:
	.word 0xd0be445a  ! 211: STDA_R	stda	%r8, [%r25 + %r26] 0x22
CHANGE_TLE59:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd3e2e01a  ! 213: CASA_R	casa	[%r11] %asi, %r26, %r9
	.word 0xd284101a  ! 215: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r9
BLK_PRI60:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 217: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xd383115a  ! 218: LDFA_R	lda	[%r12, %r26], %f9
BLK_PRI61:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 220: LDDFA_R	ldda	[%r10, %r26], %f0
CHANGE_PRIV62:
	ta	T_CHANGE_PRIV
CHANGE_R2663:
	mov	%g0,	%r26
CP_ATM_QUAD_LD63:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 222: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
CP_BIS_QUAD_LD64:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 224: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
CP_BIS_QUAD_LD65:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 226: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
WR_LEASI_66:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_67:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd2dc101a  ! 229: LDXA_R	ldxa	[%r16, %r26] 0x80, %r9
CP_AIUP68:
	.word 0xd2ce031a  ! 231: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r9
CP_NUC69:
	.word 0xd28d019a  ! 233: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r9
CP_BIS_NUC70:
	and	%r26,	%r28,	%r26
	.word 0xc4f505fa  ! 235: STXA_R	stxa	%r2, [%r20 + %r26] 0x2f
NC_BIS_SEC71:
	.word 0xc8b4dd7a  ! 237: STHA_R	stha	%r4, [%r19 + %r26] 0xeb
SHORT_FP_PRI72:
	.word 0xd39b1a1a  ! 239: LDDFA_R	ldda	[%r12, %r26], %f9
NC_BIS_AIUS73:
	.word 0xc4f7c57a  ! 241: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd3a3511a  ! 242: STFA_R	sta	%f9, [%r26, %r13]
WR_LEASI_74:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_75:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd39a905a  ! 244: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd3bcd03a  ! 246: STDFA_R	stda	%f9, [%r26, %r19]
CHANGE_R2676:
	add	%r26,	%r27,	%r26
CP_BIS_SEC76:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9d7a  ! 248: LDDA_R	ldda	[%r18, %r26] 0xeb, %r6
CP_NUC77:
	.word 0xd3a5009a  ! 250: STFA_R	sta	%f9, [%r26, %r20]
NC_PST_PRI78:
	.word 0xd3bc191a  ! 252: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd2cc501a  ! 254: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r9
	.word 0xd202801a  ! 255: LDUW_R	lduw	[%r10 + %r26], %r9
SET_TL1_79:
	ta	T_CHANGE_TO_TL1
CHANGE_R2680:
	add	%r26,	%r27,	%r26
NC_BIS_NUC80:
	.word 0xc8f544fa  ! 257: STXA_R	stxa	%r4, [%r21 + %r26] 0x27
CP_BIS_AIUS81:
	and	%r26,	%r28,	%r26
	.word 0xcc9f847a  ! 259: LDDA_R	ldda	[%r30, %r26] 0x23, %r6
CP_AIUP82:
	.word 0xd2b6021a  ! 261: STHA_R	stha	%r9, [%r24 + %r26] 0x10
	.word 0xd2f4913a  ! 263: STXA_R	stxa	%r9, [%r18 + %r26] 0x89
	.word 0xd39b511a  ! 264: LDDFA_R	ldda	[%r13, %r26], %f9
	.word 0xd213001a  ! 265: LDUH_R	lduh	[%r12 + %r26], %r9
CP_PST_PRI83:
	.word 0xd3bb191a  ! 267: STDFA_R	stda	%f9, [%r26, %r12]
CP_AIUP84:
	.word 0xd386021a  ! 269: LDFA_R	lda	[%r24, %r26], %f9
NC_BIS_AIUP85:
	.word 0xc8b6445a  ! 271: STHA_R	stha	%r4, [%r25 + %r26] 0x22
	.word 0xd09c903a  ! 273: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
SET_TL0_86:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI87:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 275: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS89:
	.word 0xd2a7823a  ! 277: STWA_R	stwa	%r9, [%r30 + %r26] 0x11
CP_BIS_NUC90:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 279: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
	.word 0xd28c511a  ! 281: LDUBA_R	lduba	[%r17, %r26] 0x88, %r9
	.word 0xd2dc903a  ! 283: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
	.word 0xd3a4903a  ! 285: STFA_R	sta	%f9, [%r26, %r18]
CP_ATM_QUAD_LD91:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 287: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
CHANGE_USER92:
	ta	T_CHANGE_NONPRIV
CHANGE_R2693:
	add	%r26,	%r27,	%r26
CP_BIS_PRI93:
	and	%r26,	%r28,	%r26
	.word 0xd0b29c5a  ! 289: STHA_R	stha	%r8, [%r10 + %r26] 0xe2
CP_BIS_PRI94:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 291: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP96:
	.word 0xd09e021a  ! 293: LDDA_R	ldda	[%r24, %r26] 0x10, %r8
	.word 0xd39cd03a  ! 295: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd232e02e  ! 296: STH_I	sth	%r9, [%r11 + 0x002e]
CP_NUC97:
	.word 0xd3bd019a  ! 298: STDFA_R	stda	%f9, [%r26, %r20]
	.word 0xd39ad05a  ! 299: LDDFA_R	ldda	[%r11, %r26], %f9
CP_PST_PRI98:
	.word 0xd3bb589a  ! 301: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd39c913a  ! 303: LDDFA_R	ldda	[%r18, %r26], %f9
	.word 0xd3f2e01a  ! 304: CASXA_R	casxa	[%r11]%asi, %r26, %r9
NC_SHORT_FP_SEC99:
	.word 0xd39cdb3a  ! 306: LDDFA_R	ldda	[%r19, %r26], %f9
CP_BIS_QUAD_LD100:
	and	%r26,	%r29,	%r26
	.word 0xd09b1d5a  ! 308: LDDA_R	ldda	[%r12, %r26] 0xea, %r8
NC_BIS_SEC101:
	.word 0xc4acdc7a  ! 310: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
CP_AIUP102:
	.word 0xd2ce031a  ! 312: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r9
SET_TL1_103:
	ta	T_CHANGE_TO_TL1
CHANGE_R26104:
	add	%r26,	%r27,	%r26
NC_BIS_NUC104:
	.word 0xcca544fa  ! 314: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xd383d01a  ! 316: LDFA_R	lda	[%r15, %r26], %f9
SET_TL0_105:
	ta	T_CHANGE_TO_TL0
CHANGE_R26106:
	add	%r26,	%r27,	%r26
NC_BIS_SEC106:
	.word 0xccbcdd7a  ! 318: STDA_R	stda	%r6, [%r19 + %r26] 0xeb
NC_BIS_SEC107:
	.word 0xc8f4dc7a  ! 320: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xd2dc101a  ! 322: LDXA_R	ldxa	[%r16, %r26] 0x80, %r9
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUP109:
	.word 0xd0be021a  ! 324: STDA_R	stda	%r8, [%r24 + %r26] 0x10
	.word 0xd2ac903a  ! 326: STBA_R	stba	%r9, [%r18 + %r26] 0x81
CHANGE_USER110:
	ta	T_CHANGE_NONPRIV
CHANGE_R26111:
	add	%r26,	%r27,	%r26
NC_BIS_PRI111:
	.word 0xcca3dc5a  ! 328: STWA_R	stwa	%r6, [%r15 + %r26] 0xe2
	.word 0xd2ccd13a  ! 330: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd2b4903a  ! 332: STHA_R	stha	%r9, [%r18 + %r26] 0x81
	.word 0xd2b4d03a  ! 334: STHA_R	stha	%r9, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS113:
	.word 0xd3bf833a  ! 336: STDFA_R	stda	%f9, [%r26, %r30]
CHANGE_USER114:
	ta	T_CHANGE_NONPRIV
CHANGE_R26115:
	add	%r26,	%r27,	%r26
CP_BIS_PRI115:
	and	%r26,	%r28,	%r26
	.word 0xc8ab1c5a  ! 338: STBA_R	stba	%r4, [%r12 + %r26] 0xe2
CHANGE_PRIV116:
	ta	T_CHANGE_PRIV
CHANGE_R26117:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS117:
	.word 0xd0f7c57a  ! 340: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
	.word 0xd2c3901a  ! 342: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r9
CHANGE_USER118:
	ta	T_CHANGE_NONPRIV
CHANGE_R26119:
	add	%r26,	%r27,	%r26
NC_BIS_PRI119:
	.word 0xc8a45d5a  ! 344: STWA_R	stwa	%r4, [%r17 + %r26] 0xea
NC_PST_PRI120:
	.word 0xd3bc185a  ! 346: STDFA_R	stda	%f9, [%r26, %r16]
CP_BIS_QUAD_LD121:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 348: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CHANGE_PRIV122:
	ta	T_CHANGE_PRIV
CHANGE_R26123:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS123:
	.word 0xcca7c47a  ! 350: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
	.word 0xd0bcd13a  ! 352: STDA_R	stda	%r8, [%r19 + %r26] 0x89
	.word 0xd2b4903a  ! 354: STHA_R	stha	%r9, [%r18 + %r26] 0x81
CP_AIUP124:
	.word 0xd28e021a  ! 356: LDUBA_R	lduba	[%r24, %r26] 0x10, %r9
	.word 0xd2d4903a  ! 358: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
	.word 0xd284111a  ! 360: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r9
NC_BLK_SEc125:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 362: LDDFA_R	ldda	[%r19, %r26], %f0
NC_PST_PRI126:
	.word 0xd3bb989a  ! 364: STDFA_R	stda	%f9, [%r26, %r14]
SET_TL1_127:
	ta	T_CHANGE_TO_TL1
CHANGE_R26128:
	add	%r26,	%r27,	%r26
NC_BIS_NUC128:
	.word 0xc4f544fa  ! 366: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xd3bc913a  ! 368: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xd2c4d03a  ! 370: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
SET_TL0_129:
	ta	T_CHANGE_TO_TL0
CHANGE_R26130:
	mov	%g0,	%r26
NC_BIS_SEC130:
	.word 0xc4acdc7a  ! 372: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
CP_BIS_PRI131:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 374: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd2dc903a  ! 376: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
CP_BIS_QUAD_LD132:
	and	%r26,	%r29,	%r26
	.word 0xd09b1d5a  ! 378: LDDA_R	ldda	[%r12, %r26] 0xea, %r8
	.word 0xd2a3d11a  ! 380: STWA_R	stwa	%r9, [%r15 + %r26] 0x88
CHANGE_R26133:
	add	%r26,	%r27,	%r26
CP_BIS_SEC133:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 382: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
SET_TL1_134:
	ta	T_CHANGE_TO_TL1
CHANGE_R26135:
	add	%r26,	%r27,	%r26
NC_BIS_NUC135:
	.word 0xd0ad44fa  ! 384: STBA_R	stba	%r8, [%r21 + %r26] 0x27
	.word 0xd302801a  ! 385: LDF_R	ld	[%r10, %r26], %f9
	.word 0xd2da901a  ! 386: LDXA_R	ldxa	[%r10, %r26] 0x80, %r9
CP_AIUP136:
	.word 0xd296031a  ! 388: LDUHA_R	lduha	[%r24, %r26] 0x18, %r9
NC_AIUP137:
	.word 0xd28e431a  ! 390: LDUBA_R	lduba	[%r25, %r26] 0x18, %r9
	.word 0xd22a801a  ! 391: STB_R	stb	%r9, [%r10 + %r26]
SET_TL0_138:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI139:
	.word 0xccbb9c5a  ! 393: STDA_R	stda	%r6, [%r14 + %r26] 0xe2
	.word 0xd3a4913a  ! 395: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd09c903a  ! 397: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd3bc913a  ! 399: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xd3a4903a  ! 401: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd2f4d13a  ! 403: STXA_R	stxa	%r9, [%r19 + %r26] 0x89
CP_BIS_QUAD_LD140:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 405: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xd252c01a  ! 406: LDSH_R	ldsh	[%r11 + %r26], %r9
NC_PST_PRI141:
	.word 0xd3bc599a  ! 408: STDFA_R	stda	%f9, [%r26, %r17]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP143:
	.word 0xd2ce421a  ! 410: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r9
	.word 0xd3a4511a  ! 412: STFA_R	sta	%f9, [%r26, %r17]
	.word 0xd39c111a  ! 414: LDDFA_R	ldda	[%r16, %r26], %f9
NC_BIS_AIUS144:
	.word 0xccafc57a  ! 416: STBA_R	stba	%r6, [%r31 + %r26] 0x2b
NC_NUC145:
	.word 0xd2b5409a  ! 418: STHA_R	stha	%r9, [%r21 + %r26] 0x04
CP_AIUP146:
	.word 0xd2f6031a  ! 420: STXA_R	stxa	%r9, [%r24 + %r26] 0x18
CP_BIS_AIUS147:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 422: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xd2d4d03a  ! 424: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r9
CP_BIS_AIUP148:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 426: STDA_R	stda	%r2, [%r24 + %r26] 0x22
CP_NUC149:
	.word 0xd295019a  ! 428: LDUHA_R	lduha	[%r20, %r26] 0x0c, %r9
	.word 0xd09cd03a  ! 430: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd3e2e01a  ! 431: CASA_R	casa	[%r11] %asi, %r26, %r9
NC_PST_PRI150:
	.word 0xd3bb989a  ! 433: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd2cc913a  ! 435: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
CP_PST_PRI151:
	.word 0xd3bb191a  ! 437: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd2cc903a  ! 439: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
CP_AIUS152:
	.word 0xd39f823a  ! 441: LDDFA_R	ldda	[%r30, %r26], %f9
	.word 0xd294d03a  ! 443: LDUHA_R	lduha	[%r19, %r26] 0x81, %r9
	.word 0xd2b3111a  ! 444: STHA_R	stha	%r9, [%r12 + %r26] 0x88
	.word 0xd2dc101a  ! 446: LDXA_R	ldxa	[%r16, %r26] 0x80, %r9
	.word 0xd3a4101a  ! 448: STFA_R	sta	%f9, [%r26, %r16]
CP_NUC153:
	.word 0xd2ed019a  ! 450: LDSTUBA_R	ldstuba	%r9, [%r20 + %r26] 0x0c
CP_ATM_QUAD_LD154:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 452: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd09cd03a  ! 454: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CHANGE_USER155:
	ta	T_CHANGE_NONPRIV
CHANGE_R26156:
	add	%r26,	%r27,	%r26
CP_BIS_PRI156:
	and	%r26,	%r28,	%r26
	.word 0xc4aadd5a  ! 456: STBA_R	stba	%r2, [%r11 + %r26] 0xea
	.word 0xd294d03a  ! 458: LDUHA_R	lduha	[%r19, %r26] 0x81, %r9
BLK_PRI157:
	and	%r26,	%r29,	%r26
	.word 0xe19adf1a  ! 460: LDDFA_R	ldda	[%r11, %r26], %f16
CHANGE_PRIV158:
	ta	T_CHANGE_PRIV
CHANGE_R26159:
	add	%r26,	%r27,	%r26
CP_BIS_NUC159:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 462: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xd0ba911a  ! 463: STDA_R	stda	%r8, [%r10 + %r26] 0x88
CP_AIUP160:
	.word 0xd39e031a  ! 465: LDDFA_R	ldda	[%r24, %r26], %f9
SHORT_FP_PRI161:
	.word 0xd3bb5b1a  ! 467: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd28bd11a  ! 469: LDUBA_R	lduba	[%r15, %r26] 0x88, %r9
CP_BIS_NUC162:
	and	%r26,	%r28,	%r26
	.word 0xc8f505fa  ! 471: STXA_R	stxa	%r4, [%r20 + %r26] 0x2f
	.word 0xd09c903a  ! 473: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
NC_AIUS163:
	.word 0xd2dfc33a  ! 475: LDXA_R	ldxa	[%r31, %r26] 0x19, %r9
	.word 0xd0bcd03a  ! 477: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd3bc501a  ! 479: STDFA_R	stda	%f9, [%r26, %r17]
CP_ATM_QUAD_LD164:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 481: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
CHANGE_USER165:
	ta	T_CHANGE_NONPRIV
CHANGE_R26166:
	add	%r26,	%r27,	%r26
CP_BIS_PRI166:
	and	%r26,	%r28,	%r26
	.word 0xcc9adc5a  ! 483: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xd0bb501a  ! 484: STDA_R	stda	%r8, [%r13 + %r26] 0x80
	.word 0xd2ccd03a  ! 486: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
	.word 0xd26a801a  ! 487: LDSTUB_R	ldstub	%r9, [%r10 + %r26]
	.word 0xd3a3501a  ! 488: STFA_R	sta	%f9, [%r26, %r13]
	.word 0xd2ab901a  ! 490: STBA_R	stba	%r9, [%r14 + %r26] 0x80
	.word 0xd2b4903a  ! 492: STHA_R	stha	%r9, [%r18 + %r26] 0x81
CP_BIS_PRI167:
	and	%r26,	%r28,	%r26
	.word 0xc8b29c5a  ! 494: STHA_R	stha	%r4, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC169:
	.word 0xd28d419a  ! 496: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r9
CP_PST_PRI170:
	.word 0xd3bb591a  ! 498: STDFA_R	stda	%f9, [%r26, %r13]
NC_BIS_AIUP171:
	.word 0xd0be455a  ! 500: STDA_R	stda	%r8, [%r25 + %r26] 0x2a
	.word 0xd39b911a  ! 502: LDDFA_R	ldda	[%r14, %r26], %f9
	.word 0xd284913a  ! 504: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
CHANGE_CLE172:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV173:
	ta	T_CHANGE_PRIV
CHANGE_R26174:
	mov	%g0,	%r26
CP_BIS_AIUP174:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 507: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xd2d3d01a  ! 509: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r9
	.word 0xd284913a  ! 511: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
	.word 0xd2eb101a  ! 512: LDSTUBA_R	ldstuba	%r9, [%r12 + %r26] 0x80
CP_BIS_NUC175:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 514: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
CP_PST_PRI176:
	.word 0xd3ba995a  ! 516: STDFA_R	stda	%f9, [%r26, %r10]
CHANGE_R26177:
	add	%r26,	%r27,	%r26
CP_BIS_SEC177:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 518: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
CP_BIS_AIUP178:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 520: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
	.word 0xd2dc903a  ! 522: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
	.word 0xd39b101a  ! 523: LDDFA_R	ldda	[%r12, %r26], %f9
	.word 0xd2a4d13a  ! 525: STWA_R	stwa	%r9, [%r19 + %r26] 0x89
CHANGE_R26179:
	add	%r26,	%r27,	%r26
CP_BIS_SEC179:
	and	%r26,	%r28,	%r26
	.word 0xd09c9d7a  ! 527: LDDA_R	ldda	[%r18, %r26] 0xeb, %r8
CP_BIS_QUAD_LD180:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 529: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xd39b901a  ! 531: LDDFA_R	ldda	[%r14, %r26], %f9
	.word 0xd302a02c  ! 532: LDF_I	ld	[%r10, 0x002c], %f9
NC_PST_PRI181:
	.word 0xd3bb991a  ! 534: STDFA_R	stda	%f9, [%r26, %r14]
CHANGE_R26182:
	add	%r26,	%r27,	%r26
CP_BIS_SEC182:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 536: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
CHANGE_R26183:
	add	%r26,	%r27,	%r26
CP_BIS_SEC183:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 538: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
	.word 0xd27b602c  ! 539: SWAP_I	swap	%r9, [%r13 + 0x002c]
NC_BIS_SEC184:
	.word 0xd0acdc7a  ! 541: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
	.word 0xd294d13a  ! 543: LDUHA_R	lduha	[%r19, %r26] 0x89, %r9
	.word 0xd294511a  ! 545: LDUHA_R	lduha	[%r17, %r26] 0x88, %r9
	.word 0xd293501a  ! 546: LDUHA_R	lduha	[%r13, %r26] 0x80, %r9
	.word 0xd302c01a  ! 547: LDF_R	ld	[%r11, %r26], %f9
	.word 0xd282901a  ! 548: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r9
CP_PST_PRI185:
	.word 0xd3bb581a  ! 550: STDFA_R	stda	%f9, [%r26, %r13]
CHANGE_USER186:
	ta	T_CHANGE_NONPRIV
CHANGE_R26187:
	add	%r26,	%r27,	%r26
CP_BIS_PRI187:
	and	%r26,	%r28,	%r26
	.word 0xd0a31d5a  ! 552: STWA_R	stwa	%r8, [%r12 + %r26] 0xea
	.word 0xd283901a  ! 554: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r9
NC_SHORT_FP_SEC188:
	.word 0xd3bcda3a  ! 556: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd2ac101a  ! 558: STBA_R	stba	%r9, [%r16 + %r26] 0x80
SET_TL1_189:
	ta	T_CHANGE_TO_TL1
CHANGE_R26190:
	add	%r26,	%r27,	%r26
NC_BIS_NUC190:
	.word 0xc8bd44fa  ! 560: STDA_R	stda	%r4, [%r21 + %r26] 0x27
CHANGE_R26191:
	add	%r26,	%r27,	%r26
CP_BIS_SEC191:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 562: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
	.word 0xd382d01a  ! 563: LDFA_R	lda	[%r11, %r26], %f9
SHORT_FP_PRI192:
	.word 0xd39a9a5a  ! 565: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd28c501a  ! 567: LDUBA_R	lduba	[%r17, %r26] 0x80, %r9
	.word 0xd22a801a  ! 568: STB_R	stb	%r9, [%r10 + %r26]
	.word 0xd39b501a  ! 569: LDDFA_R	ldda	[%r13, %r26], %f9
	.word 0xd223202c  ! 570: STW_I	stw	%r9, [%r12 + 0x002c]
CP_AIUS193:
	.word 0xd0bf823a  ! 572: STDA_R	stda	%r8, [%r30 + %r26] 0x11
	.word 0xd384903a  ! 574: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd3a3101a  ! 575: STFA_R	sta	%f9, [%r26, %r12]
BLK_PRI194:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 577: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xd2b2d01a  ! 578: STHA_R	stha	%r9, [%r11 + %r26] 0x80
	.word 0xd2ccd13a  ! 580: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
SHORT_FP_PRI195:
	.word 0xd3badb5a  ! 582: STDFA_R	stda	%f9, [%r26, %r11]
SET_TL0_196:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI197:
	and	%r26,	%r28,	%r26
	.word 0xd0b31d5a  ! 584: STHA_R	stha	%r8, [%r12 + %r26] 0xea
CHANGE_TLE198:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV199:
	ta	T_CHANGE_PRIV
CHANGE_R26200:
	mov	%g0,	%r26
CP_BIS_AIUP200:
	and	%r26,	%r28,	%r26
	.word 0xc8f6055a  ! 587: STXA_R	stxa	%r4, [%r24 + %r26] 0x2a
	.word 0xd09c511a  ! 589: LDDA_R	ldda	[%r17, %r26] 0x88, %r8
SET_TL1_201:
	ta	T_CHANGE_TO_TL1
CHANGE_R26202:
	add	%r26,	%r27,	%r26
NC_BIS_NUC202:
	.word 0xccad44fa  ! 591: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xd2b4903a  ! 593: STHA_R	stha	%r9, [%r18 + %r26] 0x81
CHANGE_R26203:
	add	%r26,	%r27,	%r26
CP_BIS_SEC203:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 595: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
CP_BIS_NUC204:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 597: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xd3a4101a  ! 599: STFA_R	sta	%f9, [%r26, %r16]
	.word 0xd2b4d03a  ! 601: STHA_R	stha	%r9, [%r19 + %r26] 0x81
BLK_PRI205:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 603: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xd2c4903a  ! 605: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
NC_NUC206:
	.word 0xd28d419a  ! 607: LDUBA_R	lduba	[%r21, %r26] 0x0c, %r9
CP_AIUS207:
	.word 0xd09f823a  ! 609: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
SET_TL0_208:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI209:
	.word 0xccac5c5a  ! 611: STBA_R	stba	%r6, [%r17 + %r26] 0xe2
	.word 0xd39c903a  ! 613: LDDFA_R	ldda	[%r18, %r26], %f9
NC_BIS_SEC210:
	.word 0xc4f4dd7a  ! 615: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
SHORT_FP_PRI211:
	.word 0xd3bb1a1a  ! 617: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd2ab111a  ! 618: STBA_R	stba	%r9, [%r12 + %r26] 0x88
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP213:
	.word 0xd2f6421a  ! 620: STXA_R	stxa	%r9, [%r25 + %r26] 0x10
CP_BIS_QUAD_LD214:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 622: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
CP_BIS_AIUS215:
	and	%r26,	%r28,	%r26
	.word 0xcc9f847a  ! 624: LDDA_R	ldda	[%r30, %r26] 0x23, %r6
	.word 0xd3a4913a  ! 626: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd384d13a  ! 628: LDFA_R	lda	[%r19, %r26], %f9
SHORT_FP_PRI216:
	.word 0xd39ada1a  ! 630: LDDFA_R	ldda	[%r11, %r26], %f9
SHORT_FP_PRI217:
	.word 0xd39b1b5a  ! 632: LDDFA_R	ldda	[%r12, %r26], %f9
CP_BIS_AIUS218:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 634: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
CP_BIS_NUC219:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 636: STHA_R	stha	%r4, [%r20 + %r26] 0x27
CP_BIS_AIUP220:
	and	%r26,	%r28,	%r26
	.word 0xd0f6045a  ! 638: STXA_R	stxa	%r8, [%r24 + %r26] 0x22
	.word 0xd2c3d11a  ! 640: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r9
CP_ATM_QUAD_LD221:
	and	%r26,	%r29,	%r26
	.word 0xcc9b059a  ! 642: LDDA_R	ldda	[%r12, %r26] 0x2c, %r6
CHANGE_USER222:
	ta	T_CHANGE_NONPRIV
CHANGE_R26223:
	add	%r26,	%r27,	%r26
CP_BIS_PRI223:
	and	%r26,	%r28,	%r26
	.word 0xc4a35c5a  ! 644: STWA_R	stwa	%r2, [%r13 + %r26] 0xe2
BLK_PRI224:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 646: LDDFA_R	ldda	[%r11, %r26], %f16
	.word 0xd284d03a  ! 648: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r9
	.word 0xd2dbd01a  ! 650: LDXA_R	ldxa	[%r15, %r26] 0x80, %r9
	.word 0xd2ab901a  ! 652: STBA_R	stba	%r9, [%r14 + %r26] 0x80
CHANGE_TLE225:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BLK_SEc226:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 655: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_PRIV227:
	ta	T_CHANGE_PRIV
CHANGE_R26228:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD228:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 657: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
CP_BIS_QUAD_LD229:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1d5a  ! 659: LDDA_R	ldda	[%r12, %r26] 0xea, %r6
NC_AIUS230:
	.word 0xd2dfc23a  ! 661: LDXA_R	ldxa	[%r31, %r26] 0x11, %r9
CP_BIS_QUAD_LD231:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 663: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xd3a4511a  ! 665: STFA_R	sta	%f9, [%r26, %r17]
SET_TL1_232:
	ta	T_CHANGE_TO_TL1
CHANGE_R26233:
	add	%r26,	%r27,	%r26
NC_BIS_NUC233:
	.word 0xc4f544fa  ! 667: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xd2d2901a  ! 668: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r9
	.word 0xd2ab901a  ! 670: STBA_R	stba	%r9, [%r14 + %r26] 0x80
	.word 0xd39a915a  ! 671: LDDFA_R	ldda	[%r10, %r26], %f9
CP_AIUP234:
	.word 0xd09e021a  ! 673: LDDA_R	ldda	[%r24, %r26] 0x10, %r8
CP_NUC235:
	.word 0xd3e5201a  ! 675: CASA_R	casa	[%r20] %asi, %r26, %r9
	.word 0xd384903a  ! 677: LDFA_R	lda	[%r18, %r26], %f9
CP_BIS_AIUP236:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 679: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
CP_BIS_NUC237:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 681: STBA_R	stba	%r4, [%r20 + %r26] 0x27
	.word 0xd3bcd03a  ! 683: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd2a4903a  ! 685: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
	.word 0xd294d13a  ! 687: LDUHA_R	lduha	[%r19, %r26] 0x89, %r9
	.word 0xd03ac01a  ! 688: STD_R	std	%r8, [%r11 + %r26]
	.word 0xd384903a  ! 690: LDFA_R	lda	[%r18, %r26], %f9
NC_NUC238:
	.word 0xd2cd419a  ! 692: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r9
CP_BIS_AIUS239:
	and	%r26,	%r28,	%r26
	.word 0xd0b7847a  ! 694: STHA_R	stha	%r8, [%r30 + %r26] 0x23
	.word 0xd2c4511a  ! 696: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r9
	.word 0xd382911a  ! 697: LDFA_R	lda	[%r10, %r26], %f9
NC_BLK_SEc240:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 699: STDFA_R	stda	%f0, [%r26, %r19]
NC_NUC241:
	.word 0xd385409a  ! 701: LDFA_R	lda	[%r21, %r26], %f9
CHANGE_R26242:
	add	%r26,	%r27,	%r26
CP_BIS_SEC242:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 703: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
NC_BIS_NUC243:
	.word 0xccbd44fa  ! 705: STDA_R	stda	%r6, [%r21 + %r26] 0x27
NC_PST_PRI244:
	.word 0xd3bbd91a  ! 707: STDFA_R	stda	%f9, [%r26, %r15]
	.word 0xd0bc913a  ! 709: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd2a3901a  ! 711: STWA_R	stwa	%r9, [%r14 + %r26] 0x80
	.word 0xd2b4903a  ! 713: STHA_R	stha	%r9, [%r18 + %r26] 0x81
CP_BIS_AIUS245:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 715: STBA_R	stba	%r2, [%r30 + %r26] 0x23
	.word 0xd31ac01a  ! 716: LDDF_R	ldd	[%r11, %r26], %f9
	.word 0xc76e401a  ! 718: PREFETCH_R	prefetch	[%r25 + %r26], #one_write
SET_TL0_246:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI247:
	.word 0xd0ab9c5a  ! 720: STBA_R	stba	%r8, [%r14 + %r26] 0xe2
	.word 0xd3bbd11a  ! 722: STDFA_R	stda	%f9, [%r26, %r15]
	.word 0xd2cc501a  ! 724: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r9
	.word 0xd2b4913a  ! 726: STHA_R	stha	%r9, [%r18 + %r26] 0x89
	.word 0xd2ac501a  ! 728: STBA_R	stba	%r9, [%r17 + %r26] 0x80
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC249:
	.word 0xd3a5019a  ! 730: STFA_R	sta	%f9, [%r26, %r20]
WR_LEASI_250:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_251:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd39c501a  ! 733: LDDFA_R	ldda	[%r17, %r26], %f9
CP_AIUP252:
	.word 0xd286031a  ! 735: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r9
	.word 0xd3a2901a  ! 736: STFA_R	sta	%f9, [%r26, %r10]
CHANGE_TLE253:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV254:
	ta	T_CHANGE_PRIV
CHANGE_R26255:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD255:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 739: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xd243202c  ! 740: LDSW_I	ldsw	[%r12 + 0x002c], %r9
CHANGE_R26256:
	add	%r26,	%r27,	%r26
CP_BIS_SEC256:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 742: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CP_BIS_NUC257:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 744: STHA_R	stha	%r2, [%r20 + %r26] 0x27
NC_BIS_SEC258:
	.word 0xcca4dd7a  ! 746: STWA_R	stwa	%r6, [%r19 + %r26] 0xeb
	.word 0xd2f4d03a  ! 748: STXA_R	stxa	%r9, [%r19 + %r26] 0x81
	.word 0xd384d03a  ! 750: LDFA_R	lda	[%r19, %r26], %f9
NC_BIS_AIUP259:
	.word 0xc8f6455a  ! 752: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
NC_PST_PRI260:
	.word 0xd3bc589a  ! 754: STDFA_R	stda	%f9, [%r26, %r17]
NC_NUC261:
	.word 0xd385409a  ! 756: LDFA_R	lda	[%r21, %r26], %f9
	.word 0xd33b2028  ! 757: STDF_I	std	%f9, [0x0028, %r12]
	.word 0xd2f2911a  ! 758: STXA_R	stxa	%r9, [%r10 + %r26] 0x88
CHANGE_USER262:
	ta	T_CHANGE_NONPRIV
CHANGE_R26263:
	add	%r26,	%r27,	%r26
CP_BIS_PRI263:
	and	%r26,	%r28,	%r26
	.word 0xd0b31c5a  ! 760: STHA_R	stha	%r8, [%r12 + %r26] 0xe2
	.word 0xd39b101a  ! 761: LDDFA_R	ldda	[%r12, %r26], %f9
	.word 0xd232a02e  ! 762: STH_I	sth	%r9, [%r10 + 0x002e]
BLK_PRI264:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 764: LDDFA_R	ldda	[%r11, %r26], %f0
CP_BIS_QUAD_LD265:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 766: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC267:
	.word 0xd3a5419a  ! 768: STFA_R	sta	%f9, [%r26, %r21]
	.word 0xd2dc903a  ! 770: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
NC_BIS_AIUS268:
	.word 0xd0b7c57a  ! 772: STHA_R	stha	%r8, [%r31 + %r26] 0x2b
	.word 0xd3a3901a  ! 774: STFA_R	sta	%f9, [%r26, %r14]
	.word 0xd2fb511a  ! 775: SWAPA_R	swapa	%r9, [%r13 + %r26] 0x88
	.word 0xd302c01a  ! 776: LDF_R	ld	[%r11, %r26], %f9
NC_AIUS269:
	.word 0xd09fc33a  ! 778: LDDA_R	ldda	[%r31, %r26] 0x19, %r8
	.word 0xd39b901a  ! 780: LDDFA_R	ldda	[%r14, %r26], %f9
CP_NUC270:
	.word 0xd285019a  ! 782: LDUWA_R	lduwa	[%r20, %r26] 0x0c, %r9
WR_LEASI_271:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_272:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_NUC273:
	.word 0xd2a5009a  ! 785: STWA_R	stwa	%r9, [%r20 + %r26] 0x04
CHANGE_R26274:
	add	%r26,	%r27,	%r26
CP_BIS_SEC274:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 787: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
SHORT_FP_PRI275:
	.word 0xd39a9b5a  ! 789: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd27a801a  ! 790: SWAP_R	swap	%r9, [%r10 + %r26]
	.word 0xd09b505a  ! 791: LDDA_R	ldda	[%r13, %r26] 0x82, %r8
CP_BIS_AIUS276:
	and	%r26,	%r28,	%r26
	.word 0xccaf857a  ! 793: STBA_R	stba	%r6, [%r30 + %r26] 0x2b
CP_ATM_QUAD_LD277:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 795: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
NC_AIUS278:
	.word 0xd287c23a  ! 797: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r9
	.word 0xd2cc903a  ! 799: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
	.word 0xd2a3901a  ! 801: STWA_R	stwa	%r9, [%r14 + %r26] 0x80
CP_BIS_AIUP279:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 803: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
NC_AIUS280:
	.word 0xd2c7c23a  ! 805: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r9
	.word 0xd2ac913a  ! 807: STBA_R	stba	%r9, [%r18 + %r26] 0x89
	.word 0xd3bcd13a  ! 809: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd2cb911a  ! 811: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r9
	.word 0xd294913a  ! 813: LDUHA_R	lduha	[%r18, %r26] 0x89, %r9
	.word 0xd3a4903a  ! 815: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd3a4d13a  ! 817: STFA_R	sta	%f9, [%r26, %r19]
	.word 0xd2ccd13a  ! 819: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd28cd13a  ! 821: LDUBA_R	lduba	[%r19, %r26] 0x89, %r9
	.word 0xd24ac01a  ! 822: LDSB_R	ldsb	[%r11 + %r26], %r9
CP_BIS_AIUP281:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 824: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
	.word 0xd384d13a  ! 826: LDFA_R	lda	[%r19, %r26], %f9
CP_BIS_AIUS282:
	and	%r26,	%r28,	%r26
	.word 0xd0af847a  ! 828: STBA_R	stba	%r8, [%r30 + %r26] 0x23
	.word 0xd22a801a  ! 829: STB_R	stb	%r9, [%r10 + %r26]
CP_BIS_QUAD_LD283:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 831: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
NC_BIS_AIUS284:
	.word 0xd0f7c47a  ! 833: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xd3a4d03a  ! 835: STFA_R	sta	%f9, [%r26, %r19]
NC_AIUP285:
	.word 0xd2c6421a  ! 837: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r9
NC_AIUP286:
	.word 0xd2a6431a  ! 839: STWA_R	stwa	%r9, [%r25 + %r26] 0x18
	.word 0xd2d3901a  ! 841: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r9
CP_AIUS287:
	.word 0xd28f833a  ! 843: LDUBA_R	lduba	[%r30, %r26] 0x19, %r9
CP_AIUS288:
	.word 0xd2c7823a  ! 845: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r9
	.word 0xd2c4501a  ! 847: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r9
	.word 0xd2dc913a  ! 849: LDXA_R	ldxa	[%r18, %r26] 0x89, %r9
	.word 0xd0bc101a  ! 851: STDA_R	stda	%r8, [%r16 + %r26] 0x80
NC_BIS_SEC289:
	.word 0xc8f4dc7a  ! 853: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xd2ccd13a  ! 855: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd2fa901a  ! 856: SWAPA_R	swapa	%r9, [%r10 + %r26] 0x80
	.word 0xd2d4903a  ! 858: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
NC_AIUP290:
	.word 0xd39e421a  ! 860: LDDFA_R	ldda	[%r25, %r26], %f9
	.word 0xd2d4101a  ! 862: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r9
	.word 0xd2fad11a  ! 863: SWAPA_R	swapa	%r9, [%r11 + %r26] 0x88
NC_BIS_AIUS291:
	.word 0xccb7c57a  ! 865: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
	.word 0xd2f2911a  ! 866: STXA_R	stxa	%r9, [%r10 + %r26] 0x88
CP_ATM_QUAD_LD292:
	and	%r26,	%r29,	%r26
	.word 0xd09b459a  ! 868: LDDA_R	ldda	[%r13, %r26] 0x2c, %r8
CP_BIS_AIUP293:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 870: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xd2c4903a  ! 872: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
	.word 0xd2f4903a  ! 874: STXA_R	stxa	%r9, [%r18 + %r26] 0x81
	.word 0xd2fad11a  ! 875: SWAPA_R	swapa	%r9, [%r11 + %r26] 0x88
SHORT_FP_PRI294:
	.word 0xd39a9b1a  ! 877: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd384913a  ! 879: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd2c4d03a  ! 881: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
	.word 0xd3bc903a  ! 883: STDFA_R	stda	%f9, [%r26, %r18]
CP_BIS_AIUP295:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 885: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xd2d3901a  ! 887: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r9
	.word 0xd39c913a  ! 889: LDDFA_R	ldda	[%r18, %r26], %f9
NC_BIS_SEC296:
	.word 0xc8bcdc7a  ! 891: STDA_R	stda	%r4, [%r19 + %r26] 0xe3
	.word 0xd222801a  ! 892: STW_R	stw	%r9, [%r10 + %r26]
CP_AIUP297:
	.word 0xd09e031a  ! 894: LDDA_R	ldda	[%r24, %r26] 0x18, %r8
	.word 0xd2b3111a  ! 895: STHA_R	stha	%r9, [%r12 + %r26] 0x88
	.word 0xd39ad01a  ! 896: LDDFA_R	ldda	[%r11, %r26], %f9
NC_BIS_SEC298:
	.word 0xd0acdd7a  ! 898: STBA_R	stba	%r8, [%r19 + %r26] 0xeb
WR_LEASI_299:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_300:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP301:
	.word 0xd2d6421a  ! 901: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r9
	.word 0xd39cd03a  ! 903: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd2cbd01a  ! 905: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r9
	.word 0xd2b2911a  ! 906: STHA_R	stha	%r9, [%r10 + %r26] 0x88
NC_NUC302:
	.word 0xd09d419a  ! 908: LDDA_R	ldda	[%r21, %r26] 0x0c, %r8
	.word 0xd2b4101a  ! 910: STHA_R	stha	%r9, [%r16 + %r26] 0x80
	.word 0xd294913a  ! 912: LDUHA_R	lduha	[%r18, %r26] 0x89, %r9
	.word 0xd383511a  ! 913: LDFA_R	lda	[%r13, %r26], %f9
CP_BIS_AIUP303:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 915: STHA_R	stha	%r2, [%r24 + %r26] 0x22
SHORT_FP_PRI304:
	.word 0xd39ada1a  ! 917: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd03a801a  ! 918: STD_R	std	%r8, [%r10 + %r26]
NC_AIUS305:
	.word 0xd2a7c33a  ! 920: STWA_R	stwa	%r9, [%r31 + %r26] 0x19
	.word 0xd284913a  ! 922: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
	.word 0xd2acd13a  ! 924: STBA_R	stba	%r9, [%r19 + %r26] 0x89
NC_BIS_AIUS306:
	.word 0xd0afc47a  ! 926: STBA_R	stba	%r8, [%r31 + %r26] 0x23
	.word 0xd284d13a  ! 928: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r9
	.word 0xd09cd03a  ! 930: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CP_BIS_QUAD_LD307:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 932: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
CP_NUC308:
	.word 0xd2dd009a  ! 934: LDXA_R	ldxa	[%r20, %r26] 0x04, %r9
CP_AIUS309:
	.word 0xd0bf833a  ! 936: STDA_R	stda	%r8, [%r30 + %r26] 0x19
	.word 0xd2b4903a  ! 938: STHA_R	stha	%r9, [%r18 + %r26] 0x81
SET_TL1_310:
	ta	T_CHANGE_TO_TL1
CHANGE_R26311:
	add	%r26,	%r27,	%r26
NC_BIS_NUC311:
	.word 0xc8a545fa  ! 940: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
NC_BLK_SEc312:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 942: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC313:
	.word 0xd2b5019a  ! 944: STHA_R	stha	%r9, [%r20 + %r26] 0x0c
BLK_PRI314:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 946: STDFA_R	stda	%f16, [%r26, %r10]
NC_BIS_AIUS315:
	.word 0xc4b7c57a  ! 948: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
	.word 0xd09c501a  ! 950: LDDA_R	ldda	[%r17, %r26] 0x80, %r8
	.word 0xd2f4d13a  ! 952: STXA_R	stxa	%r9, [%r19 + %r26] 0x89
NC_BIS_NUC316:
	.word 0xc8a545fa  ! 954: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
CP_BIS_AIUP317:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 956: STBA_R	stba	%r2, [%r24 + %r26] 0x22
NC_PST_PRI318:
	.word 0xd3bb981a  ! 958: STDFA_R	stda	%f9, [%r26, %r14]
SHORT_FP_PRI319:
	.word 0xd39b5a5a  ! 960: LDDFA_R	ldda	[%r13, %r26], %f9
CP_AIUS320:
	.word 0xd28f823a  ! 962: LDUBA_R	lduba	[%r30, %r26] 0x11, %r9
SHORT_FP_PRI321:
	.word 0xd3ba9b5a  ! 964: STDFA_R	stda	%f9, [%r26, %r10]
NC_BIS_AIUS322:
	.word 0xc4bfc57a  ! 966: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
	.word 0xd284d13a  ! 968: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r9
	.word 0xd09c903a  ! 970: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
NC_NUC323:
	.word 0xd2d5409a  ! 972: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r9
	.word 0xd2f4903a  ! 974: STXA_R	stxa	%r9, [%r18 + %r26] 0x81
	.word 0xd2ac903a  ! 976: STBA_R	stba	%r9, [%r18 + %r26] 0x81
CP_AIUS324:
	.word 0xd09f823a  ! 978: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
	.word 0xd302801a  ! 979: LDF_R	ld	[%r10, %r26], %f9
	.word 0xd284d03a  ! 981: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r9
	.word 0xd203001a  ! 982: LDUW_R	lduw	[%r12 + %r26], %r9
NC_BIS_NUC325:
	.word 0xc4a544fa  ! 984: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xd3bc101a  ! 986: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd2c4d13a  ! 989: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r9
	.word 0xd302801a  ! 990: LDF_R	ld	[%r10, %r26], %f9
CP_BIS_QUAD_LD326:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 992: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xd3f3601a  ! 993: CASXA_R	casxa	[%r13]%asi, %r26, %r9
	.word 0xd222c01a  ! 994: STW_R	stw	%r9, [%r11 + %r26]
	.word 0xd294903a  ! 996: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
	.word 0xd2d4913a  ! 998: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r9
	.word 0xe7eca022  ! 1000: PREFETCHA_I	prefetcha	[%r18, + 0x0022] %asi, #19
NC_AIUP327:
	.word 0xd3a6421a  ! 1002: STFA_R	sta	%f9, [%r26, %r25]
CP_AIUS328:
	.word 0xd39f823a  ! 1004: LDDFA_R	ldda	[%r30, %r26], %f9
NC_BIS_AIUP329:
	.word 0xc4b6455a  ! 1006: STHA_R	stha	%r2, [%r25 + %r26] 0x2a
	.word 0xd3bb101a  ! 1008: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd284913a  ! 1010: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
SET_TL0_330:
	ta	T_CHANGE_TO_TL0
CHANGE_R26331:
	add	%r26,	%r27,	%r26
NC_BIS_SEC331:
	.word 0xc8b4dc7a  ! 1012: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
	.word 0xd2dcd03a  ! 1014: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS333:
	.word 0xd297823a  ! 1016: LDUHA_R	lduha	[%r30, %r26] 0x11, %r9
CP_BIS_AIUP334:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1018: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
NC_NUC335:
	.word 0xd295419a  ! 1020: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r9
	.word 0xd384903a  ! 1022: LDFA_R	lda	[%r18, %r26], %f9
NC_BIS_AIUP336:
	.word 0xc4b6445a  ! 1024: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd2ac903a  ! 1026: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd3bc903a  ! 1028: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xd2c4101a  ! 1030: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r9
CP_BIS_AIUP337:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1032: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CHANGE_USER338:
	ta	T_CHANGE_NONPRIV
CHANGE_R26339:
	add	%r26,	%r27,	%r26
NC_BIS_PRI339:
	.word 0xd0a39d5a  ! 1034: STWA_R	stwa	%r8, [%r14 + %r26] 0xea
SHORT_FP_PRI340:
	.word 0xd39b5a1a  ! 1036: LDDFA_R	ldda	[%r13, %r26], %f9
CHANGE_PRIV341:
	ta	T_CHANGE_PRIV
CHANGE_R26342:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP342:
	.word 0xc4f6455a  ! 1038: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
CHANGE_R26343:
	add	%r26,	%r27,	%r26
CP_BIS_SEC343:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1040: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xd27b001a  ! 1041: SWAP_R	swap	%r9, [%r12 + %r26]
NC_BIS_AIUP344:
	.word 0xc8b6455a  ! 1043: STHA_R	stha	%r4, [%r25 + %r26] 0x2a
CHANGE_R26345:
	add	%r26,	%r27,	%r26
CP_BIS_SEC345:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 1045: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD346:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 1047: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xd3a4903a  ! 1049: STFA_R	sta	%f9, [%r26, %r18]
NC_BIS_AIUS347:
	.word 0xc4bfc57a  ! 1051: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
	.word 0xd33ac01a  ! 1052: STDF_R	std	%f9, [%r26, %r11]
	.word 0xd3e2a01a  ! 1053: CASA_R	casa	[%r10] %asi, %r26, %r9
	.word 0xd2c3901a  ! 1055: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r9
	.word 0xd2dc913a  ! 1057: LDXA_R	ldxa	[%r18, %r26] 0x89, %r9
	.word 0xd2acd03a  ! 1059: STBA_R	stba	%r9, [%r19 + %r26] 0x81
	.word 0xd3a4501a  ! 1061: STFA_R	sta	%f9, [%r26, %r17]
CP_AIUS348:
	.word 0xd39f833a  ! 1063: LDDFA_R	ldda	[%r30, %r26], %f9
	.word 0xd294903a  ! 1065: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_AIUP349:
	.word 0xd3a6431a  ! 1067: STFA_R	sta	%f9, [%r26, %r25]
CP_ATM_QUAD_LD350:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 1069: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
CHANGE_TLE351:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV352:
	ta	T_CHANGE_PRIV
CHANGE_R26353:
	add	%r26,	%r27,	%r26
CP_BIS_NUC353:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 1072: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xd2ea901a  ! 1073: LDSTUBA_R	ldstuba	%r9, [%r10 + %r26] 0x80
SET_TL1_354:
	ta	T_CHANGE_TO_TL1
CHANGE_R26355:
	add	%r26,	%r27,	%r26
NC_BIS_NUC355:
	.word 0xd0b545fa  ! 1075: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
NC_AIUS356:
	.word 0xd287c33a  ! 1077: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r9
	.word 0xd2b4d03a  ! 1079: STHA_R	stha	%r9, [%r19 + %r26] 0x81
NC_AIUP357:
	.word 0xd2de431a  ! 1081: LDXA_R	ldxa	[%r25, %r26] 0x18, %r9
	.word 0xd384111a  ! 1083: LDFA_R	lda	[%r16, %r26], %f9
SET_TL0_358:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI359:
	and	%r26,	%r28,	%r26
	.word 0xd0aa9c5a  ! 1085: STBA_R	stba	%r8, [%r10 + %r26] 0xe2
	.word 0xd3f3201a  ! 1086: CASXA_R	casxa	[%r12]%asi, %r26, %r9
SET_TL1_360:
	ta	T_CHANGE_TO_TL1
CHANGE_R26361:
	add	%r26,	%r27,	%r26
NC_BIS_NUC361:
	.word 0xccad44fa  ! 1088: STBA_R	stba	%r6, [%r21 + %r26] 0x27
CP_BIS_NUC362:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 1090: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xd3bc903a  ! 1092: STDFA_R	stda	%f9, [%r26, %r18]
CP_BIS_AIUS363:
	and	%r26,	%r28,	%r26
	.word 0xccaf847a  ! 1094: STBA_R	stba	%r6, [%r30 + %r26] 0x23
NC_AIUP364:
	.word 0xd2f6421a  ! 1096: STXA_R	stxa	%r9, [%r25 + %r26] 0x10
	.word 0xd2c4d13a  ! 1098: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r9
CP_BIS_AIUP365:
	and	%r26,	%r28,	%r26
	.word 0xccb6055a  ! 1100: STHA_R	stha	%r6, [%r24 + %r26] 0x2a
	.word 0xd0ba901a  ! 1101: STDA_R	stda	%r8, [%r10 + %r26] 0x80
SET_TL0_366:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI367:
	.word 0xd0b41c5a  ! 1103: STHA_R	stha	%r8, [%r16 + %r26] 0xe2
NC_PST_PRI368:
	.word 0xd3bbd81a  ! 1105: STDFA_R	stda	%f9, [%r26, %r15]
	.word 0xd0ba901a  ! 1106: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd2a4903a  ! 1108: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
	.word 0xd3f2a01a  ! 1109: CASXA_R	casxa	[%r10]%asi, %r26, %r9
	.word 0xd20b001a  ! 1110: LDUB_R	ldub	[%r12 + %r26], %r9
	.word 0xe76fe02b  ! 1112: PREFETCH_I	prefetch	[%r31 + 0x002b], #19
CP_BIS_PRI369:
	and	%r26,	%r28,	%r26
	.word 0xd0a31c5a  ! 1114: STWA_R	stwa	%r8, [%r12 + %r26] 0xe2
	.word 0xd31b2028  ! 1115: LDDF_I	ldd	[%r12, 0x0028], %f9
	.word 0xd323401a  ! 1116: STF_R	st	%f9, [%r26, %r13]
	.word 0xd2c4d03a  ! 1118: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS371:
	.word 0xd2df823a  ! 1120: LDXA_R	ldxa	[%r30, %r26] 0x11, %r9
	.word 0xd2dc111a  ! 1122: LDXA_R	ldxa	[%r16, %r26] 0x88, %r9
SHORT_FP_PRI372:
	.word 0xd39adb5a  ! 1124: LDDFA_R	ldda	[%r11, %r26], %f9
CHANGE_TLE373:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd202a02c  ! 1126: LDUW_I	lduw	[%r10 + 0x002c], %r9
	.word 0xd2c4903a  ! 1128: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
	.word 0xd2b4903a  ! 1130: STHA_R	stha	%r9, [%r18 + %r26] 0x81
NC_PST_PRI374:
	.word 0xd3bc189a  ! 1132: STDFA_R	stda	%f9, [%r26, %r16]
NC_SHORT_FP_SEC375:
	.word 0xd3bcda7a  ! 1134: STDFA_R	stda	%f9, [%r26, %r19]
SHORT_FP_PRI376:
	.word 0xd39a9a1a  ! 1136: LDDFA_R	ldda	[%r10, %r26], %f9
NC_BLK_SEc377:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1138: LDDFA_R	ldda	[%r19, %r26], %f0
SHORT_FP_PRI378:
	.word 0xd39adb5a  ! 1140: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd3f2e01a  ! 1141: CASXA_R	casxa	[%r11]%asi, %r26, %r9
	.word 0xd2b4101a  ! 1143: STHA_R	stha	%r9, [%r16 + %r26] 0x80
CHANGE_PRIV379:
	ta	T_CHANGE_PRIV
CHANGE_R26380:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS380:
	.word 0xd0bfc47a  ! 1145: STDA_R	stda	%r8, [%r31 + %r26] 0x23
NC_NUC381:
	.word 0xd2c5419a  ! 1147: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r9
	.word 0xd28b901a  ! 1149: LDUBA_R	lduba	[%r14, %r26] 0x80, %r9
CP_NUC382:
	.word 0xd2fd009a  ! 1151: SWAPA_R	swapa	%r9, [%r20 + %r26] 0x04
	.word 0xd384d03a  ! 1153: LDFA_R	lda	[%r19, %r26], %f9
SHORT_FP_PRI383:
	.word 0xd3bb1a1a  ! 1155: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd28c903a  ! 1157: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
	.word 0xd322e02c  ! 1158: STF_I	st	%f9, [0x002c, %r11]
CP_PST_PRI384:
	.word 0xd3ba999a  ! 1160: STDFA_R	stda	%f9, [%r26, %r10]
CP_BIS_AIUP385:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1162: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xd3bcd13a  ! 1164: STDFA_R	stda	%f9, [%r26, %r19]
NC_BIS_AIUS386:
	.word 0xd0bfc57a  ! 1166: STDA_R	stda	%r8, [%r31 + %r26] 0x2b
	.word 0xd284913a  ! 1168: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
	.word 0xd284903a  ! 1170: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r9
NC_NUC387:
	.word 0xd2f5419a  ! 1172: STXA_R	stxa	%r9, [%r21 + %r26] 0x0c
	.word 0xd284913a  ! 1174: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
NC_BIS_SEC388:
	.word 0xc4b4dd7a  ! 1176: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
NC_PST_PRI389:
	.word 0xd3bc595a  ! 1178: STDFA_R	stda	%f9, [%r26, %r17]
	.word 0xd2f4d03a  ! 1180: STXA_R	stxa	%r9, [%r19 + %r26] 0x81
CHANGE_R26390:
	add	%r26,	%r27,	%r26
CP_BIS_SEC390:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 1182: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
	.word 0xd294d03a  ! 1184: LDUHA_R	lduha	[%r19, %r26] 0x81, %r9
CHANGE_USER391:
	ta	T_CHANGE_NONPRIV
CHANGE_R26392:
	add	%r26,	%r27,	%r26
NC_BIS_PRI392:
	.word 0xc4f41c5a  ! 1186: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
SHORT_FP_PRI393:
	.word 0xd3ba9b1a  ! 1188: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2cc913a  ! 1190: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
SHORT_FP_PRI394:
	.word 0xd39b5a1a  ! 1192: LDDFA_R	ldda	[%r13, %r26], %f9
	.word 0xd28c903a  ! 1194: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
	.word 0xd28cd13a  ! 1196: LDUBA_R	lduba	[%r19, %r26] 0x89, %r9
	.word 0xd384903a  ! 1198: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd284101a  ! 1200: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS396:
	.word 0xd2cf823a  ! 1202: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r9
BLK_PRI397:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 1204: LDDFA_R	ldda	[%r13, %r26], %f16
	.word 0xd283901a  ! 1206: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r9
	.word 0xd2abd01a  ! 1208: STBA_R	stba	%r9, [%r15 + %r26] 0x80
CP_BIS_AIUS398:
	and	%r26,	%r28,	%r26
	.word 0xc4b7857a  ! 1210: STHA_R	stha	%r2, [%r30 + %r26] 0x2b
BLK_PRI399:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1212: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xd27a801a  ! 1213: SWAP_R	swap	%r9, [%r10 + %r26]
CP_AIUP400:
	.word 0xd2c6021a  ! 1215: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r9
	.word 0xd3bb501a  ! 1216: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd203202c  ! 1217: LDUW_I	lduw	[%r12 + 0x002c], %r9
	.word 0xd39cd13a  ! 1219: LDDFA_R	ldda	[%r19, %r26], %f9
CP_ATM_QUAD_LD401:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 1221: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xd31b401a  ! 1222: LDDF_R	ldd	[%r13, %r26], %f9
CP_BIS_AIUP402:
	and	%r26,	%r28,	%r26
	.word 0xccb6055a  ! 1224: STHA_R	stha	%r6, [%r24 + %r26] 0x2a
	.word 0xd39a915a  ! 1225: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd09cd13a  ! 1227: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
NC_NUC403:
	.word 0xd295409a  ! 1229: LDUHA_R	lduha	[%r21, %r26] 0x04, %r9
	.word 0xd28cd03a  ! 1231: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
CHANGE_USER404:
	ta	T_CHANGE_NONPRIV
CHANGE_R26405:
	add	%r26,	%r27,	%r26
CP_BIS_PRI405:
	and	%r26,	%r28,	%r26
	.word 0xc8f29d5a  ! 1233: STXA_R	stxa	%r4, [%r10 + %r26] 0xea
CP_BIS_QUAD_LD406:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 1235: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xd3a4903a  ! 1237: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd293d01a  ! 1239: LDUHA_R	lduha	[%r15, %r26] 0x80, %r9
	.word 0xd22ac01a  ! 1240: STB_R	stb	%r9, [%r11 + %r26]
	.word 0xd2eb101a  ! 1241: LDSTUBA_R	ldstuba	%r9, [%r12 + %r26] 0x80
	.word 0xd384903a  ! 1243: LDFA_R	lda	[%r18, %r26], %f9
SET_TL1_407:
	ta	T_CHANGE_TO_TL1
CHANGE_R26408:
	add	%r26,	%r27,	%r26
NC_BIS_NUC408:
	.word 0xc4f544fa  ! 1245: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xd2ac903a  ! 1247: STBA_R	stba	%r9, [%r18 + %r26] 0x81
NC_NUC409:
	.word 0xd295419a  ! 1249: LDUHA_R	lduha	[%r21, %r26] 0x0c, %r9
	.word 0xd31a801a  ! 1250: LDDF_R	ldd	[%r10, %r26], %f9
	.word 0xd2ccd13a  ! 1252: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd2ab911a  ! 1254: STBA_R	stba	%r9, [%r14 + %r26] 0x88
	.word 0xd2a4101a  ! 1256: STWA_R	stwa	%r9, [%r16 + %r26] 0x80
	.word 0xd2c3901a  ! 1258: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r9
	.word 0xd27b001a  ! 1259: SWAP_R	swap	%r9, [%r12 + %r26]
	.word 0xd302e02c  ! 1260: LDF_I	ld	[%r11, 0x002c], %f9
SET_TL0_410:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI411:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 1262: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
	.word 0xd2cc913a  ! 1264: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS413:
	.word 0xd2d7823a  ! 1266: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r9
	.word 0xd27a801a  ! 1267: SWAP_R	swap	%r9, [%r10 + %r26]
SHORT_FP_PRI414:
	.word 0xd3badb1a  ! 1269: STDFA_R	stda	%f9, [%r26, %r11]
	.word 0xd2d4903a  ! 1271: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
CP_BIS_AIUP415:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1273: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
NC_NUC416:
	.word 0xd2cd419a  ! 1275: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r9
	.word 0xd39ad01a  ! 1276: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd384d13a  ! 1278: LDFA_R	lda	[%r19, %r26], %f9
NC_AIUS417:
	.word 0xd0bfc23a  ! 1280: STDA_R	stda	%r8, [%r31 + %r26] 0x11
	.word 0xd322e02c  ! 1281: STF_I	st	%f9, [0x002c, %r11]
	.word 0xd09b901a  ! 1283: LDDA_R	ldda	[%r14, %r26] 0x80, %r8
CHANGE_USER418:
	ta	T_CHANGE_NONPRIV
CHANGE_R26419:
	mov	%g0,	%r26
NC_BIS_PRI419:
	.word 0xc8f39c5a  ! 1285: STXA_R	stxa	%r4, [%r14 + %r26] 0xe2
	.word 0xd3bcd03a  ! 1287: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd0bc101a  ! 1289: STDA_R	stda	%r8, [%r16 + %r26] 0x80
	.word 0xd2c4d03a  ! 1291: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
NC_BLK_SEc420:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1293: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_QUAD_LD421:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 1295: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
NC_BIS_SEC422:
	.word 0xc8f4dc7a  ! 1297: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
NC_BLK_SEc423:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1299: STDFA_R	stda	%f0, [%r26, %r19]
SHORT_FP_PRI424:
	.word 0xd3bb1b1a  ! 1301: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd33ac01a  ! 1302: STDF_R	std	%f9, [%r26, %r11]
	.word 0xd2acd03a  ! 1304: STBA_R	stba	%r9, [%r19 + %r26] 0x81
	.word 0xd2f3901a  ! 1306: STXA_R	stxa	%r9, [%r14 + %r26] 0x80
	.word 0xd3bb111a  ! 1307: STDFA_R	stda	%f9, [%r26, %r12]
CHANGE_R26425:
	add	%r26,	%r27,	%r26
CP_BIS_SEC425:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1309: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CHANGE_TLE426:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP428:
	.word 0xd2c6431a  ! 1312: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r9
CP_ATM_QUAD_LD429:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 1314: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
	.word 0xd253202e  ! 1315: LDSH_I	ldsh	[%r12 + 0x002e], %r9
	.word 0xd27aa02c  ! 1316: SWAP_I	swap	%r9, [%r10 + 0x002c]
	.word 0xd09c913a  ! 1318: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
CP_BIS_AIUS430:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 1320: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
SHORT_FP_PRI431:
	.word 0xd3ba9b5a  ! 1322: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2d4903a  ! 1324: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
NC_SHORT_FP_SEC432:
	.word 0xd3bcdb3a  ! 1326: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd3e2a01a  ! 1327: CASA_R	casa	[%r10] %asi, %r26, %r9
	.word 0xd3f2a01a  ! 1328: CASXA_R	casxa	[%r10]%asi, %r26, %r9
NC_BIS_SEC433:
	.word 0xc4bcdd7a  ! 1330: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
NC_NUC434:
	.word 0xd2ad409a  ! 1332: STBA_R	stba	%r9, [%r21 + %r26] 0x04
	.word 0xd22a801a  ! 1333: STB_R	stb	%r9, [%r10 + %r26]
	.word 0xd2d3d11a  ! 1335: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r9
CHANGE_R26435:
	add	%r26,	%r27,	%r26
CP_BIS_SEC435:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1337: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
BLK_PRI436:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 1339: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xd2cb901a  ! 1341: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r9
	.word 0xd09ad01a  ! 1342: LDDA_R	ldda	[%r11, %r26] 0x80, %r8
	.word 0xd3a2901a  ! 1343: STFA_R	sta	%f9, [%r26, %r10]
	.word 0xd2ac903a  ! 1345: STBA_R	stba	%r9, [%r18 + %r26] 0x81
NC_BIS_SEC437:
	.word 0xc4acdc7a  ! 1347: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd382905a  ! 1348: LDFA_R	lda	[%r10, %r26], %f9
	.word 0xd2c4913a  ! 1350: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r9
	.word 0xd0bc913a  ! 1352: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd28b105a  ! 1353: LDUBA_R	lduba	[%r12, %r26] 0x82, %r9
SET_TL1_438:
	ta	T_CHANGE_TO_TL1
CHANGE_R26439:
	add	%r26,	%r27,	%r26
NC_BIS_NUC439:
	.word 0xc4ad44fa  ! 1355: STBA_R	stba	%r2, [%r21 + %r26] 0x27
SET_TL0_440:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI441:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 1357: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	.word 0xd33a801a  ! 1358: STDF_R	std	%f9, [%r26, %r10]
CP_BIS_PRI442:
	and	%r26,	%r28,	%r26
	.word 0xc8aadc5a  ! 1360: STBA_R	stba	%r4, [%r11 + %r26] 0xe2
	.word 0xd39ad15a  ! 1361: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd28c903a  ! 1363: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
	.word 0xd2b4913a  ! 1365: STHA_R	stha	%r9, [%r18 + %r26] 0x89
	.word 0xd25aa028  ! 1366: LDX_I	ldx	[%r10 + 0x0028], %r9
	.word 0xd3a4d03a  ! 1368: STFA_R	sta	%f9, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC444:
	.word 0xd39d019a  ! 1370: LDDFA_R	ldda	[%r20, %r26], %f9
CP_ATM_QUAD_LD445:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1372: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd2cc913a  ! 1374: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
	.word 0xd2dc903a  ! 1376: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
	.word 0xd28cd03a  ! 1378: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
	.word 0xd24aa02f  ! 1379: LDSB_I	ldsb	[%r10 + 0x002f], %r9
	.word 0xd2cc903a  ! 1381: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
	.word 0xd28bd01a  ! 1383: LDUBA_R	lduba	[%r15, %r26] 0x80, %r9
CHANGE_R26446:
	add	%r26,	%r27,	%r26
CP_BIS_SEC446:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 1385: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
NC_AIUS447:
	.word 0xd2cfc23a  ! 1387: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r9
	.word 0xd3bb901a  ! 1389: STDFA_R	stda	%f9, [%r26, %r14]
CP_BIS_QUAD_LD448:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1391: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CP_AIUP449:
	.word 0xd296031a  ! 1393: LDUHA_R	lduha	[%r24, %r26] 0x18, %r9
	.word 0xd3bb511a  ! 1394: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd2db911a  ! 1396: LDXA_R	ldxa	[%r14, %r26] 0x88, %r9
NC_SHORT_FP_SEC450:
	.word 0xd3bcda3a  ! 1398: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd3ba911a  ! 1399: STDFA_R	stda	%f9, [%r26, %r10]
CP_BIS_AIUP451:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 1401: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
	.word 0xd383901a  ! 1403: LDFA_R	lda	[%r14, %r26], %f9
CHANGE_R26452:
	add	%r26,	%r27,	%r26
CP_BIS_SEC452:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 1405: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
NC_AIUP453:
	.word 0xd2c6421a  ! 1407: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r9
NC_PST_PRI454:
	.word 0xd3bb985a  ! 1409: STDFA_R	stda	%f9, [%r26, %r14]
NC_SHORT_FP_SEC455:
	.word 0xd39cdb3a  ! 1411: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd303202c  ! 1412: LDF_I	ld	[%r12, 0x002c], %f9
	.word 0xd3a4d03a  ! 1414: STFA_R	sta	%f9, [%r26, %r19]
CP_AIUS456:
	.word 0xd09f823a  ! 1416: LDDA_R	ldda	[%r30, %r26] 0x11, %r8
NC_BIS_AIUS457:
	.word 0xc4bfc47a  ! 1418: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xd31b6028  ! 1419: LDDF_I	ldd	[%r13, 0x0028], %f9
	.word 0xd33b6028  ! 1420: STDF_I	std	%f9, [0x0028, %r13]
	.word 0xd2abd11a  ! 1422: STBA_R	stba	%r9, [%r15 + %r26] 0x88
	.word 0xd33aa028  ! 1423: STDF_I	std	%f9, [0x0028, %r10]
	.word 0xd3a2901a  ! 1424: STFA_R	sta	%f9, [%r26, %r10]
CP_BIS_NUC458:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 1426: STBA_R	stba	%r6, [%r20 + %r26] 0x27
CP_BIS_QUAD_LD459:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1428: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xd2fb511a  ! 1429: SWAPA_R	swapa	%r9, [%r13 + %r26] 0x88
	.word 0xd3a4903a  ! 1431: STFA_R	sta	%f9, [%r26, %r18]
NC_AIUS460:
	.word 0xd2b7c23a  ! 1433: STHA_R	stha	%r9, [%r31 + %r26] 0x11
	.word 0xd33ac01a  ! 1434: STDF_R	std	%f9, [%r26, %r11]
CP_ATM_QUAD_LD461:
	and	%r26,	%r29,	%r26
	.word 0xc89b049a  ! 1436: LDDA_R	ldda	[%r12, %r26] 0x24, %r4
NC_BIS_AIUS462:
	.word 0xc4bfc47a  ! 1438: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xd31b2028  ! 1439: LDDF_I	ldd	[%r12, 0x0028], %f9
CP_BIS_NUC463:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 1441: STDA_R	stda	%r2, [%r20 + %r26] 0x27
NC_AIUP464:
	.word 0xd3a6421a  ! 1443: STFA_R	sta	%f9, [%r26, %r25]
CP_BIS_NUC465:
	and	%r26,	%r28,	%r26
	.word 0xd0f505fa  ! 1445: STXA_R	stxa	%r8, [%r20 + %r26] 0x2f
CP_PST_PRI466:
	.word 0xd3bb185a  ! 1447: STDFA_R	stda	%f9, [%r26, %r12]
	.word 0xd09cd13a  ! 1449: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
BLK_PRI467:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1451: STDFA_R	stda	%f0, [%r26, %r10]
CP_NUC468:
	.word 0xd09d009a  ! 1453: LDDA_R	ldda	[%r20, %r26] 0x04, %r8
	.word 0xd20a801a  ! 1454: LDUB_R	ldub	[%r10 + %r26], %r9
	.word 0xd323602c  ! 1455: STF_I	st	%f9, [0x002c, %r13]
	.word 0xd39c913a  ! 1457: LDDFA_R	ldda	[%r18, %r26], %f9
	.word 0xd2c4903a  ! 1459: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
	.word 0xd2ac913a  ! 1461: STBA_R	stba	%r9, [%r18 + %r26] 0x89
	.word 0xd33ae028  ! 1462: STDF_I	std	%f9, [0x0028, %r11]
	.word 0xd2b2d11a  ! 1463: STHA_R	stha	%r9, [%r11 + %r26] 0x88
NC_BIS_AIUP469:
	.word 0xd0b6445a  ! 1465: STHA_R	stha	%r8, [%r25 + %r26] 0x22
CP_AIUS470:
	.word 0xd3bf833a  ! 1467: STDFA_R	stda	%f9, [%r26, %r30]
NC_AIUS471:
	.word 0xd39fc33a  ! 1469: LDDFA_R	ldda	[%r31, %r26], %f9
	.word 0xd293901a  ! 1471: LDUHA_R	lduha	[%r14, %r26] 0x80, %r9
NC_BIS_AIUS472:
	.word 0xc4afc47a  ! 1473: STBA_R	stba	%r2, [%r31 + %r26] 0x23
	.word 0xd2f4d03a  ! 1475: STXA_R	stxa	%r9, [%r19 + %r26] 0x81
CP_AIUS473:
	.word 0xd2f7833a  ! 1477: STXA_R	stxa	%r9, [%r30 + %r26] 0x19
NC_BIS_AIUP474:
	.word 0xc4b6445a  ! 1479: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd3a3d01a  ! 1481: STFA_R	sta	%f9, [%r26, %r15]
	.word 0xd39cd13a  ! 1483: LDDFA_R	ldda	[%r19, %r26], %f9
CP_BIS_AIUP475:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1485: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
NC_PST_PRI476:
	.word 0xd3bc185a  ! 1487: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd2ab911a  ! 1489: STBA_R	stba	%r9, [%r14 + %r26] 0x88
	.word 0xd2eb101a  ! 1490: LDSTUBA_R	ldstuba	%r9, [%r12 + %r26] 0x80
	.word 0xd3a2901a  ! 1491: STFA_R	sta	%f9, [%r26, %r10]
	.word 0xd3bb111a  ! 1492: STDFA_R	stda	%f9, [%r26, %r12]
CHANGE_USER477:
	ta	T_CHANGE_NONPRIV
CHANGE_R26478:
	mov	%g0,	%r26
CP_BIS_PRI478:
	and	%r26,	%r28,	%r26
	.word 0xc49a9d5a  ! 1494: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
NC_BIS_PRI479:
	.word 0xc8f41d5a  ! 1496: STXA_R	stxa	%r4, [%r16 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP481:
	.word 0xd386421a  ! 1498: LDFA_R	lda	[%r25, %r26], %f9
	.word 0xd3a3101a  ! 1499: STFA_R	sta	%f9, [%r26, %r12]
	.word 0xd2dcd03a  ! 1501: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
CHANGE_TLE482:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd243001a  ! 1503: LDSW_R	ldsw	[%r12 + %r26], %r9
NC_BLK_SEc483:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1505: LDDFA_R	ldda	[%r19, %r26], %f16
SHORT_FP_PRI484:
	.word 0xd3bb5a1a  ! 1507: STDFA_R	stda	%f9, [%r26, %r13]
SET_TL1_485:
	ta	T_CHANGE_TO_TL1
CHANGE_R26486:
	add	%r26,	%r27,	%r26
NC_BIS_NUC486:
	.word 0xc4bd44fa  ! 1509: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUS487:
	.word 0xc4bfc57a  ! 1511: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
	.word 0xd2ab901a  ! 1513: STBA_R	stba	%r9, [%r14 + %r26] 0x80
	.word 0xd3bc501a  ! 1515: STDFA_R	stda	%f9, [%r26, %r17]
CP_AIUS488:
	.word 0xd2df833a  ! 1517: LDXA_R	ldxa	[%r30, %r26] 0x19, %r9
	.word 0xd302801a  ! 1518: LDF_R	ld	[%r10, %r26], %f9
CP_BIS_QUAD_LD489:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 1520: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
NC_BLK_SEc490:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1522: STDFA_R	stda	%f0, [%r26, %r19]
SHORT_FP_PRI491:
	.word 0xd39a9a1a  ! 1524: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd0bcd03a  ! 1526: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd383105a  ! 1527: LDFA_R	lda	[%r12, %r26], %f9
	.word 0xd302c01a  ! 1528: LDF_R	ld	[%r11, %r26], %f9
NC_AIUP492:
	.word 0xd39e421a  ! 1530: LDDFA_R	ldda	[%r25, %r26], %f9
	.word 0xd2eb511a  ! 1531: LDSTUBA_R	ldstuba	%r9, [%r13 + %r26] 0x88
	.word 0xd27ac01a  ! 1532: SWAP_R	swap	%r9, [%r11 + %r26]
	.word 0xd3a2d11a  ! 1533: STFA_R	sta	%f9, [%r26, %r11]
SHORT_FP_PRI493:
	.word 0xd3bb5a1a  ! 1535: STDFA_R	stda	%f9, [%r26, %r13]
CP_BIS_AIUP494:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 1537: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
CP_NUC495:
	.word 0xd3f5201a  ! 1539: CASXA_R	casxa	[%r20]%asi, %r26, %r9
	.word 0xd2d4d03a  ! 1541: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r9
BLK_PRI496:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1543: STDFA_R	stda	%f0, [%r26, %r13]
CP_BIS_AIUP497:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1545: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xd2cad01a  ! 1546: LDSBA_R	ldsba	[%r11, %r26] 0x80, %r9
	.word 0xd2d4111a  ! 1548: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r9
	.word 0xd384913a  ! 1550: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd2f2d01a  ! 1551: STXA_R	stxa	%r9, [%r11 + %r26] 0x80
	.word 0xd3a3d01a  ! 1553: STFA_R	sta	%f9, [%r26, %r15]
CP_BIS_AIUP498:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1555: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xd2ea901a  ! 1556: LDSTUBA_R	ldstuba	%r9, [%r10 + %r26] 0x80
CP_BIS_AIUP499:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 1558: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
NC_BIS_AIUS500:
	.word 0xc4bfc47a  ! 1560: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xd2cb901a  ! 1562: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r9
SHORT_FP_PRI501:
	.word 0xd3bb5a1a  ! 1564: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd302c01a  ! 1565: LDF_R	ld	[%r11, %r26], %f9
NC_AIUP502:
	.word 0xd2d6421a  ! 1567: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r9
CP_AIUS503:
	.word 0xd39f833a  ! 1569: LDDFA_R	ldda	[%r30, %r26], %f9
NC_NUC504:
	.word 0xd09d409a  ! 1571: LDDA_R	ldda	[%r21, %r26] 0x04, %r8
CP_BIS_QUAD_LD505:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 1574: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xd2d4903a  ! 1576: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
NC_BLK_SEc506:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1578: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUS507:
	.word 0xd2a7833a  ! 1580: STWA_R	stwa	%r9, [%r30 + %r26] 0x19
	.word 0xd0bcd03a  ! 1582: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd3a4101a  ! 1584: STFA_R	sta	%f9, [%r26, %r16]
CHANGE_R26508:
	add	%r26,	%r27,	%r26
CP_BIS_SEC508:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 1586: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
NC_BIS_AIUS509:
	.word 0xc4b7c47a  ! 1588: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_AIUS510:
	.word 0xd3bfc23a  ! 1590: STDFA_R	stda	%f9, [%r26, %r31]
CP_BIS_QUAD_LD511:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1592: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xd2d4903a  ! 1594: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
	.word 0xd01ae028  ! 1595: LDD_I	ldd	[%r11 + 0x0028], %r8
	.word 0xd3bb501a  ! 1596: STDFA_R	stda	%f9, [%r26, %r13]
CHANGE_R26512:
	add	%r26,	%r27,	%r26
CP_BIS_SEC512:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 1599: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
NC_BLK_SEc513:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1601: STDFA_R	stda	%f16, [%r26, %r19]
NC_BIS_AIUP514:
	.word 0xc4b6445a  ! 1603: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xd2ac101a  ! 1605: STBA_R	stba	%r9, [%r16 + %r26] 0x80
SET_TL0_515:
	ta	T_CHANGE_TO_TL0
CHANGE_R26516:
	add	%r26,	%r27,	%r26
NC_BIS_SEC516:
	.word 0xc4f4dc7a  ! 1607: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV517:
	ta	T_CHANGE_PRIV
CHANGE_R26518:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD518:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 1609: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
CP_ATM_QUAD_LD519:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 1611: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xd2dc903a  ! 1613: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
NC_SHORT_FP_SEC520:
	.word 0xd39cdb3a  ! 1615: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd294903a  ! 1617: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
CP_BIS_QUAD_LD521:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1619: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xd284913a  ! 1621: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
	.word 0xd09cd03a  ! 1623: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
CHANGE_USER522:
	ta	T_CHANGE_NONPRIV
CHANGE_R26523:
	add	%r26,	%r27,	%r26
CP_BIS_PRI523:
	and	%r26,	%r28,	%r26
	.word 0xc4b2dc5a  ! 1625: STHA_R	stha	%r2, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_NUC525:
	.word 0xd2d5409a  ! 1627: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r9
BLK_PRI526:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 1629: STDFA_R	stda	%f0, [%r26, %r10]
NC_NUC527:
	.word 0xd2b5419a  ! 1631: STHA_R	stha	%r9, [%r21 + %r26] 0x0c
	.word 0xd2c3911a  ! 1633: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r9
	.word 0xd2d4101a  ! 1635: LDSHA_R	ldsha	[%r16, %r26] 0x80, %r9
	.word 0xd2d3901a  ! 1637: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r9
NC_BIS_AIUS528:
	.word 0xc4b7c47a  ! 1639: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xd09cd13a  ! 1641: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	.word 0xd2ab911a  ! 1643: STBA_R	stba	%r9, [%r14 + %r26] 0x88
	.word 0xd2ccd13a  ! 1645: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
CP_ATM_QUAD_LD529:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 1647: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xd2c4903a  ! 1649: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
NC_BIS_AIUS530:
	.word 0xccafc57a  ! 1651: STBA_R	stba	%r6, [%r31 + %r26] 0x2b
CP_BIS_AIUS531:
	and	%r26,	%r28,	%r26
	.word 0xd0bf847a  ! 1653: STDA_R	stda	%r8, [%r30 + %r26] 0x23
CP_AIUS532:
	.word 0xd2cf823a  ! 1655: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r9
NC_BIS_AIUS533:
	.word 0xc8bfc47a  ! 1657: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xd3f2e01a  ! 1658: CASXA_R	casxa	[%r11]%asi, %r26, %r9
	.word 0xd294903a  ! 1660: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
	.word 0xd3bc913a  ! 1662: STDFA_R	stda	%f9, [%r26, %r18]
CP_BIS_NUC534:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1664: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xd2d3911a  ! 1666: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r9
CP_AIUS535:
	.word 0xd3bf823a  ! 1668: STDFA_R	stda	%f9, [%r26, %r30]
NC_BIS_AIUS536:
	.word 0xc4b7c47a  ! 1670: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_AIUS537:
	.word 0xd2a7c23a  ! 1672: STWA_R	stwa	%r9, [%r31 + %r26] 0x11
NC_BLK_SEc538:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 1674: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd283911a  ! 1676: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r9
NC_SHORT_FP_SEC539:
	.word 0xd39cda3a  ! 1678: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd283505a  ! 1679: LDUWA_R	lduwa	[%r13, %r26] 0x82, %r9
	.word 0xd09c903a  ! 1681: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd233202e  ! 1682: STH_I	sth	%r9, [%r12 + 0x002e]
	.word 0xd2cc101a  ! 1684: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r9
	.word 0xd213602e  ! 1685: LDUH_I	lduh	[%r13 + 0x002e], %r9
CHANGE_USER540:
	ta	T_CHANGE_NONPRIV
CHANGE_R26541:
	add	%r26,	%r27,	%r26
NC_BIS_PRI541:
	.word 0xc4a3dd5a  ! 1687: STWA_R	stwa	%r2, [%r15 + %r26] 0xea
	.word 0xd28b911a  ! 1689: LDUBA_R	lduba	[%r14, %r26] 0x88, %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC543:
	.word 0xd2d5419a  ! 1691: LDSHA_R	ldsha	[%r21, %r26] 0x0c, %r9
CP_ATM_QUAD_LD544:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1693: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
SET_TL1_545:
	ta	T_CHANGE_TO_TL1
CHANGE_R26546:
	add	%r26,	%r27,	%r26
NC_BIS_NUC546:
	.word 0xd0b545fa  ! 1695: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
NC_BIS_NUC547:
	.word 0xc8a544fa  ! 1697: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xd2a4d03a  ! 1699: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
	.word 0xd0bbd01a  ! 1701: STDA_R	stda	%r8, [%r15 + %r26] 0x80
SHORT_FP_PRI548:
	.word 0xd3ba9a1a  ! 1703: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2dc101a  ! 1705: LDXA_R	ldxa	[%r16, %r26] 0x80, %r9
	.word 0xd28b901a  ! 1707: LDUBA_R	lduba	[%r14, %r26] 0x80, %r9
BLK_PRI549:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 1709: STDFA_R	stda	%f0, [%r26, %r12]
CP_AIUS550:
	.word 0xd2df823a  ! 1711: LDXA_R	ldxa	[%r30, %r26] 0x11, %r9
	.word 0xd3e3201a  ! 1712: CASA_R	casa	[%r12] %asi, %r26, %r9
CP_BIS_QUAD_LD551:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 1714: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xd2b4d13a  ! 1716: STHA_R	stha	%r9, [%r19 + %r26] 0x89
NC_BIS_AIUP552:
	.word 0xc4f6445a  ! 1718: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_AIUS553:
	.word 0xd2d7823a  ! 1720: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r9
	.word 0xd284913a  ! 1722: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r9
	.word 0xd272801a  ! 1723: STX_R	stx	%r9, [%r10 + %r26]
SET_TL0_554:
	ta	T_CHANGE_TO_TL0
CHANGE_R26555:
	add	%r26,	%r27,	%r26
NC_BIS_SEC555:
	.word 0xc4a4dc7a  ! 1725: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xd25a801a  ! 1726: LDX_R	ldx	[%r10 + %r26], %r9
	.word 0xd2f2d01a  ! 1727: STXA_R	stxa	%r9, [%r11 + %r26] 0x80
	.word 0xd294903a  ! 1729: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
	.word 0xd294903a  ! 1731: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_BIS_SEC556:
	.word 0xccbcdc7a  ! 1733: STDA_R	stda	%r6, [%r19 + %r26] 0xe3
	.word 0xd2cbd11a  ! 1735: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r9
	.word 0xd3bcd03a  ! 1737: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd27b401a  ! 1738: SWAP_R	swap	%r9, [%r13 + %r26]
SHORT_FP_PRI557:
	.word 0xd3ba9b5a  ! 1740: STDFA_R	stda	%f9, [%r26, %r10]
BLK_PRI558:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1f1a  ! 1742: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xd212a02e  ! 1743: LDUH_I	lduh	[%r10 + 0x002e], %r9
	.word 0xd39ad05a  ! 1744: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd323602c  ! 1745: STF_I	st	%f9, [0x002c, %r13]
NC_SHORT_FP_SEC559:
	.word 0xd3bcdb7a  ! 1747: STDFA_R	stda	%f9, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC561:
	.word 0xd2ad409a  ! 1749: STBA_R	stba	%r9, [%r21 + %r26] 0x04
	.word 0xd3bad01a  ! 1750: STDFA_R	stda	%f9, [%r26, %r11]
CP_NUC562:
	.word 0xd39d019a  ! 1752: LDDFA_R	ldda	[%r20, %r26], %f9
	.word 0xd2a3901a  ! 1754: STWA_R	stwa	%r9, [%r14 + %r26] 0x80
	.word 0xd2c2d11a  ! 1755: LDSWA_R	ldswa	[%r11, %r26] 0x88, %r9
CP_ATM_QUAD_LD563:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1757: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CHANGE_USER564:
	ta	T_CHANGE_NONPRIV
CHANGE_R26565:
	add	%r26,	%r27,	%r26
NC_BIS_PRI565:
	.word 0xc4b39d5a  ! 1759: STHA_R	stha	%r2, [%r14 + %r26] 0xea
CHANGE_PRIV566:
	ta	T_CHANGE_PRIV
CHANGE_R26567:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP567:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 1761: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
NC_BLK_SEc568:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1763: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_R26569:
	mov	%g0,	%r26
CP_BIS_SEC569:
	and	%r26,	%r28,	%r26
	.word 0xc8b49d7a  ! 1765: STHA_R	stha	%r4, [%r18 + %r26] 0xeb
	.word 0xd294d13a  ! 1767: LDUHA_R	lduha	[%r19, %r26] 0x89, %r9
SET_TL1_570:
	ta	T_CHANGE_TO_TL1
CHANGE_R26571:
	add	%r26,	%r27,	%r26
NC_BIS_NUC571:
	.word 0xc4f544fa  ! 1769: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUP572:
	.word 0xd0b6445a  ! 1771: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xd294903a  ! 1773: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
	.word 0xd2dc511a  ! 1775: LDXA_R	ldxa	[%r17, %r26] 0x88, %r9
CP_BIS_AIUP573:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1777: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xd2c4d03a  ! 1779: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
	.word 0xd2f4903a  ! 1781: STXA_R	stxa	%r9, [%r18 + %r26] 0x81
	.word 0xd2ea911a  ! 1782: LDSTUBA_R	ldstuba	%r9, [%r10 + %r26] 0x88
	.word 0xc7ebc09a  ! 1784: PREFETCHA_R	prefetcha	[%r15, %r26] 0x04, #one_write
NC_BIS_AIUP574:
	.word 0xccb6445a  ! 1786: STHA_R	stha	%r6, [%r25 + %r26] 0x22
NC_BLK_SEc575:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1788: LDDFA_R	ldda	[%r19, %r26], %f0
CP_ATM_QUAD_LD576:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1790: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xd2ccd03a  ! 1792: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
	.word 0xd2c3901a  ! 1794: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r9
	.word 0xd2dcd03a  ! 1796: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
	.word 0xd2a4d03a  ! 1798: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
CP_NUC577:
	.word 0xd3f5201a  ! 1800: CASXA_R	casxa	[%r20]%asi, %r26, %r9
	.word 0xd2b3511a  ! 1801: STHA_R	stha	%r9, [%r13 + %r26] 0x88
	.word 0xd0ba901a  ! 1802: STDA_R	stda	%r8, [%r10 + %r26] 0x80
	.word 0xd2d3d11a  ! 1804: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r9
NC_AIUP578:
	.word 0xd2c6421a  ! 1806: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r9
NC_BIS_AIUS579:
	.word 0xc4a7c47a  ! 1808: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
NC_AIUP580:
	.word 0xd386421a  ! 1810: LDFA_R	lda	[%r25, %r26], %f9
NC_PST_PRI581:
	.word 0xd3bc191a  ! 1812: STDFA_R	stda	%f9, [%r26, %r16]
SET_TL0_582:
	ta	T_CHANGE_TO_TL0
WR_LEASI_583:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_584:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BIS_PRI585:
	.word 0xc8ac1c5a  ! 1815: STBA_R	stba	%r4, [%r16 + %r26] 0xe2
	.word 0xd2b4d03a  ! 1817: STHA_R	stha	%r9, [%r19 + %r26] 0x81
	.word 0xd2ccd03a  ! 1819: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
	.word 0xd2ab911a  ! 1821: STBA_R	stba	%r9, [%r14 + %r26] 0x88
	.word 0xd31b001a  ! 1822: LDDF_R	ldd	[%r12, %r26], %f9
CHANGE_PRIV586:
	ta	T_CHANGE_PRIV
CHANGE_R26587:
	add	%r26,	%r27,	%r26
CP_BIS_NUC587:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 1824: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
NC_NUC588:
	.word 0xd2dd419a  ! 1826: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r9
NC_NUC589:
	.word 0xd09d409a  ! 1828: LDDA_R	ldda	[%r21, %r26] 0x04, %r8
	.word 0xd384913a  ! 1830: LDFA_R	lda	[%r18, %r26], %f9
NC_AIUS590:
	.word 0xd28fc23a  ! 1832: LDUBA_R	lduba	[%r31, %r26] 0x11, %r9
	.word 0xd3bad11a  ! 1833: STDFA_R	stda	%f9, [%r26, %r11]
	.word 0xd27aa02c  ! 1834: SWAP_I	swap	%r9, [%r10 + 0x002c]
NC_SHORT_FP_SEC591:
	.word 0xd3bcdb7a  ! 1836: STDFA_R	stda	%f9, [%r26, %r19]
SET_TL1_592:
	ta	T_CHANGE_TO_TL1
CHANGE_R26593:
	add	%r26,	%r27,	%r26
NC_BIS_NUC593:
	.word 0xc8b545fa  ! 1838: STHA_R	stha	%r4, [%r21 + %r26] 0x2f
SET_TL0_594:
	ta	T_CHANGE_TO_TL0
WR_LEASI_595:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_596:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS598:
	.word 0xd39f823a  ! 1841: LDDFA_R	ldda	[%r30, %r26], %f9
	.word 0xd39c903a  ! 1843: LDDFA_R	ldda	[%r18, %r26], %f9
	.word 0xd3bc903a  ! 1845: STDFA_R	stda	%f9, [%r26, %r18]
	.word 0xd2f3111a  ! 1846: STXA_R	stxa	%r9, [%r12 + %r26] 0x88
WR_LEASI_599:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_600:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd3a4d13a  ! 1849: STFA_R	sta	%f9, [%r26, %r19]
	.word 0xd0bc913a  ! 1851: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd28ad01a  ! 1852: LDUBA_R	lduba	[%r11, %r26] 0x80, %r9
	.word 0xd28b101a  ! 1853: LDUBA_R	lduba	[%r12, %r26] 0x80, %r9
BLK_PRI601:
	and	%r26,	%r29,	%r26
	.word 0xe19a9e1a  ! 1855: LDDFA_R	ldda	[%r10, %r26], %f16
NC_BIS_AIUS602:
	.word 0xc4afc47a  ! 1857: STBA_R	stba	%r2, [%r31 + %r26] 0x23
CHANGE_R26603:
	add	%r26,	%r27,	%r26
CP_BIS_SEC603:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 1859: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xd2d2905a  ! 1860: LDSHA_R	ldsha	[%r10, %r26] 0x82, %r9
	.word 0xd3a4111a  ! 1862: STFA_R	sta	%f9, [%r26, %r16]
NC_BIS_SEC604:
	.word 0xccb4dc7a  ! 1864: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
	.word 0xd2ccd03a  ! 1866: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
	.word 0xd302801a  ! 1867: LDF_R	ld	[%r10, %r26], %f9
SET_TL1_605:
	ta	T_CHANGE_TO_TL1
CHANGE_R26606:
	add	%r26,	%r27,	%r26
NC_BIS_NUC606:
	.word 0xc4bd44fa  ! 1869: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xd09c101a  ! 1871: LDDA_R	ldda	[%r16, %r26] 0x80, %r8
CP_ATM_QUAD_LD607:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 1873: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
NC_BIS_AIUP608:
	.word 0xd0b6445a  ! 1875: STHA_R	stha	%r8, [%r25 + %r26] 0x22
NC_BIS_AIUS609:
	.word 0xc4afc47a  ! 1877: STBA_R	stba	%r2, [%r31 + %r26] 0x23
CHANGE_R26610:
	add	%r26,	%r27,	%r26
CP_BIS_SEC610:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 1879: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
NC_SHORT_FP_SEC611:
	.word 0xd39cdb3a  ! 1881: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd39c101a  ! 1883: LDDFA_R	ldda	[%r16, %r26], %f9
CP_ATM_QUAD_LD612:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 1885: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
SHORT_FP_PRI613:
	.word 0xd3ba9a1a  ! 1887: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd09cd13a  ! 1889: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	.word 0xd294903a  ! 1891: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_BIS_AIUP614:
	.word 0xc8ae455a  ! 1893: STBA_R	stba	%r4, [%r25 + %r26] 0x2a
	.word 0xd2ab901a  ! 1895: STBA_R	stba	%r9, [%r14 + %r26] 0x80
	.word 0xd26ac01a  ! 1896: LDSTUB_R	ldstub	%r9, [%r11 + %r26]
	.word 0xd28b901a  ! 1898: LDUBA_R	lduba	[%r14, %r26] 0x80, %r9
CP_NUC615:
	.word 0xd2b5009a  ! 1900: STHA_R	stha	%r9, [%r20 + %r26] 0x04
CP_AIUP616:
	.word 0xd39e021a  ! 1902: LDDFA_R	ldda	[%r24, %r26], %f9
	.word 0xd01b2028  ! 1903: LDD_I	ldd	[%r12 + 0x0028], %r8
NC_BLK_SEc617:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 1905: STDFA_R	stda	%f16, [%r26, %r19]
CP_AIUP618:
	.word 0xd2ae021a  ! 1907: STBA_R	stba	%r9, [%r24 + %r26] 0x10
	.word 0xd27aa02c  ! 1908: SWAP_I	swap	%r9, [%r10 + 0x002c]
SET_TL0_619:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI620:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 1910: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
NC_BIS_PRI621:
	.word 0xcca41c5a  ! 1912: STWA_R	stwa	%r6, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUS623:
	.word 0xd2c7c33a  ! 1914: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r9
	.word 0xd242c01a  ! 1915: LDSW_R	ldsw	[%r11 + %r26], %r9
	.word 0xd294d03a  ! 1917: LDUHA_R	lduha	[%r19, %r26] 0x81, %r9
SHORT_FP_PRI624:
	.word 0xd39b1a1a  ! 1919: LDDFA_R	ldda	[%r12, %r26], %f9
	.word 0xd2cc903a  ! 1921: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
CP_ATM_QUAD_LD625:
	and	%r26,	%r29,	%r26
	.word 0xd09b459a  ! 1923: LDDA_R	ldda	[%r13, %r26] 0x2c, %r8
CP_AIUS626:
	.word 0xd2df833a  ! 1925: LDXA_R	ldxa	[%r30, %r26] 0x19, %r9
	.word 0xd3ba911a  ! 1926: STDFA_R	stda	%f9, [%r26, %r10]
NC_AIUS627:
	.word 0xd3bfc33a  ! 1928: STDFA_R	stda	%f9, [%r26, %r31]
NC_AIUP628:
	.word 0xd386421a  ! 1930: LDFA_R	lda	[%r25, %r26], %f9
NC_PST_PRI629:
	.word 0xd3bc581a  ! 1932: STDFA_R	stda	%f9, [%r26, %r17]
CHANGE_R26630:
	add	%r26,	%r27,	%r26
CP_BIS_SEC630:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 1934: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
NC_BLK_SEc631:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1936: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd223001a  ! 1937: STW_R	stw	%r9, [%r12 + %r26]
	.word 0xd2a4913a  ! 1939: STWA_R	stwa	%r9, [%r18 + %r26] 0x89
	.word 0xd2d3515a  ! 1940: LDSHA_R	ldsha	[%r13, %r26] 0x8a, %r9
CP_BIS_AIUS632:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 1942: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
	.word 0xd33aa028  ! 1943: STDF_I	std	%f9, [0x0028, %r10]
	.word 0xd3a2901a  ! 1944: STFA_R	sta	%f9, [%r26, %r10]
	.word 0xd2cc903a  ! 1946: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
	.word 0xd39b911a  ! 1948: LDDFA_R	ldda	[%r14, %r26], %f9
	.word 0xd3bb501a  ! 1949: STDFA_R	stda	%f9, [%r26, %r13]
NC_PST_PRI633:
	.word 0xd3bc191a  ! 1951: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd03b001a  ! 1952: STD_R	std	%r8, [%r12 + %r26]
NC_PST_PRI634:
	.word 0xd3bc189a  ! 1954: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd2f4d03a  ! 1956: STXA_R	stxa	%r9, [%r19 + %r26] 0x81
NC_PST_PRI635:
	.word 0xd3bb989a  ! 1958: STDFA_R	stda	%f9, [%r26, %r14]
NC_BIS_AIUS636:
	.word 0xd0a7c47a  ! 1960: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
CP_AIUS637:
	.word 0xd2a7823a  ! 1962: STWA_R	stwa	%r9, [%r30 + %r26] 0x11
	.word 0xd2b3901a  ! 1964: STHA_R	stha	%r9, [%r14 + %r26] 0x80
	.word 0xd0bc501a  ! 1966: STDA_R	stda	%r8, [%r17 + %r26] 0x80
	.word 0xd2ccd13a  ! 1968: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd09c903a  ! 1970: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd33b401a  ! 1971: STDF_R	std	%f9, [%r26, %r13]
	.word 0xd2c2d11a  ! 1972: LDSWA_R	ldswa	[%r11, %r26] 0x88, %r9
	.word 0xd39c903a  ! 1974: LDDFA_R	ldda	[%r18, %r26], %f9
NC_AIUS638:
	.word 0xd3bfc33a  ! 1976: STDFA_R	stda	%f9, [%r26, %r31]
NC_PST_PRI639:
	.word 0xd3bb981a  ! 1978: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd294903a  ! 1980: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
SHORT_FP_PRI640:
	.word 0xd39b5b5a  ! 1982: LDDFA_R	ldda	[%r13, %r26], %f9
	.word 0xd0bc101a  ! 1984: STDA_R	stda	%r8, [%r16 + %r26] 0x80
SET_TL1_641:
	ta	T_CHANGE_TO_TL1
CHANGE_R26642:
	add	%r26,	%r27,	%r26
NC_BIS_NUC642:
	.word 0xc8a545fa  ! 1986: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
	.word 0xd2cc913a  ! 1988: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
	.word 0xd384d03a  ! 1990: LDFA_R	lda	[%r19, %r26], %f9
	.word 0xd0bcd03a  ! 1992: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd3bcd13a  ! 1994: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd0bc913a  ! 1996: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd2d4d03a  ! 1998: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r9
NC_AIUS643:
	.word 0xd2b7c23a  ! 2000: STHA_R	stha	%r9, [%r31 + %r26] 0x11
SET_TL0_644:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI645:
	and	%r26,	%r28,	%r26
	.word 0xd0aadd5a  ! 2002: STBA_R	stba	%r8, [%r11 + %r26] 0xea
CP_BIS_PRI646:
	and	%r26,	%r28,	%r26
	.word 0xc4a29c5a  ! 2004: STWA_R	stwa	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC648:
	.word 0xd385409a  ! 2006: LDFA_R	lda	[%r21, %r26], %f9
	.word 0xd384501a  ! 2008: LDFA_R	lda	[%r17, %r26], %f9
NC_BIS_AIUS649:
	.word 0xcca7c47a  ! 2010: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
NC_BIS_SEC650:
	.word 0xd0acdc7a  ! 2012: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
	.word 0xd2cc903a  ! 2014: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r9
CHANGE_USER651:
	ta	T_CHANGE_NONPRIV
CHANGE_R26652:
	add	%r26,	%r27,	%r26
CP_BIS_PRI652:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 2016: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xd31b2028  ! 2017: LDDF_I	ldd	[%r12, 0x0028], %f9
SHORT_FP_PRI653:
	.word 0xd3ba9b1a  ! 2019: STDFA_R	stda	%f9, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP655:
	.word 0xd386021a  ! 2021: LDFA_R	lda	[%r24, %r26], %f9
CHANGE_R26656:
	add	%r26,	%r27,	%r26
CP_BIS_SEC656:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2023: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xd31b6028  ! 2024: LDDF_I	ldd	[%r13, 0x0028], %f9
NC_BLK_SEc657:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2026: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_R26658:
	add	%r26,	%r27,	%r26
CP_BIS_SEC658:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 2028: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
	.word 0xd2a4501a  ! 2030: STWA_R	stwa	%r9, [%r17 + %r26] 0x80
	.word 0xd09c913a  ! 2032: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd2ccd13a  ! 2034: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
NC_NUC659:
	.word 0xd385409a  ! 2036: LDFA_R	lda	[%r21, %r26], %f9
SHORT_FP_PRI660:
	.word 0xd3bada1a  ! 2038: STDFA_R	stda	%f9, [%r26, %r11]
SET_TL1_661:
	ta	T_CHANGE_TO_TL1
CHANGE_R26662:
	mov	%g0,	%r26
NC_BIS_NUC662:
	.word 0xd0f544fa  ! 2040: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
NC_BIS_AIUP663:
	.word 0xccbe445a  ! 2042: STDA_R	stda	%r6, [%r25 + %r26] 0x22
	.word 0xd3f2e01a  ! 2043: CASXA_R	casxa	[%r11]%asi, %r26, %r9
CP_PST_PRI664:
	.word 0xd3ba991a  ! 2045: STDFA_R	stda	%f9, [%r26, %r10]
CP_BIS_QUAD_LD665:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 2047: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
NC_SHORT_FP_SEC666:
	.word 0xd39cda7a  ! 2049: LDDFA_R	ldda	[%r19, %r26], %f9
CP_BIS_AIUS667:
	and	%r26,	%r28,	%r26
	.word 0xccb7857a  ! 2051: STHA_R	stha	%r6, [%r30 + %r26] 0x2b
CP_PST_PRI668:
	.word 0xd3bb181a  ! 2053: STDFA_R	stda	%f9, [%r26, %r12]
NC_BIS_NUC669:
	.word 0xc4a544fa  ! 2055: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xd3f2e01a  ! 2056: CASXA_R	casxa	[%r11]%asi, %r26, %r9
	.word 0xd3a4903a  ! 2058: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd383115a  ! 2059: LDFA_R	lda	[%r12, %r26], %f9
	.word 0xd2b4903a  ! 2061: STHA_R	stha	%r9, [%r18 + %r26] 0x81
NC_AIUP670:
	.word 0xd2ae421a  ! 2063: STBA_R	stba	%r9, [%r25 + %r26] 0x10
BLK_PRI671:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 2065: LDDFA_R	ldda	[%r10, %r26], %f0
SET_TL0_672:
	ta	T_CHANGE_TO_TL0
CHANGE_R26673:
	add	%r26,	%r27,	%r26
NC_BIS_SEC673:
	.word 0xc4b4dc7a  ! 2067: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xd31b001a  ! 2068: LDDF_R	ldd	[%r12, %r26], %f9
	.word 0xd0bcd03a  ! 2070: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd323202c  ! 2071: STF_I	st	%f9, [0x002c, %r12]
	.word 0xd26aa02f  ! 2072: LDSTUB_I	ldstub	%r9, [%r10 + 0x002f]
	.word 0xd2a3911a  ! 2074: STWA_R	stwa	%r9, [%r14 + %r26] 0x88
	.word 0xd223001a  ! 2075: STW_R	stw	%r9, [%r12 + %r26]
	.word 0xd39cd03a  ! 2077: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd3f2a01a  ! 2078: CASXA_R	casxa	[%r10]%asi, %r26, %r9
	.word 0xd382901a  ! 2079: LDFA_R	lda	[%r10, %r26], %f9
	.word 0xd284d03a  ! 2081: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r9
	.word 0xd2ccd13a  ! 2083: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP675:
	.word 0xd2c6421a  ! 2085: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r9
	.word 0xd3bc501a  ! 2087: STDFA_R	stda	%f9, [%r26, %r17]
CHANGE_R26676:
	add	%r26,	%r27,	%r26
CP_BIS_SEC676:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 2089: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
NC_AIUS677:
	.word 0xd2c7c23a  ! 2091: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r9
	.word 0xd22ac01a  ! 2092: STB_R	stb	%r9, [%r11 + %r26]
	.word 0xd0bcd03a  ! 2094: STDA_R	stda	%r8, [%r19 + %r26] 0x81
	.word 0xd294101a  ! 2096: LDUHA_R	lduha	[%r16, %r26] 0x80, %r9
CP_AIUP678:
	.word 0xd2ae021a  ! 2098: STBA_R	stba	%r9, [%r24 + %r26] 0x10
NC_BIS_SEC679:
	.word 0xc8f4dc7a  ! 2100: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
CP_ATM_QUAD_LD680:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2102: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
NC_PST_PRI681:
	.word 0xd3bc581a  ! 2104: STDFA_R	stda	%f9, [%r26, %r17]
	.word 0xd3bb901a  ! 2106: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd0bb901a  ! 2108: STDA_R	stda	%r8, [%r14 + %r26] 0x80
CP_AIUP682:
	.word 0xd39e021a  ! 2110: LDDFA_R	ldda	[%r24, %r26], %f9
	.word 0xd28c913a  ! 2112: LDUBA_R	lduba	[%r18, %r26] 0x89, %r9
NC_PST_PRI683:
	.word 0xd3bb989a  ! 2114: STDFA_R	stda	%f9, [%r26, %r14]
NC_SHORT_FP_SEC684:
	.word 0xd3bcdb7a  ! 2116: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd3a4913a  ! 2118: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd2b4d13a  ! 2120: STHA_R	stha	%r9, [%r19 + %r26] 0x89
CP_AIUS685:
	.word 0xd3a7823a  ! 2122: STFA_R	sta	%f9, [%r26, %r30]
NC_NUC686:
	.word 0xd0bd419a  ! 2124: STDA_R	stda	%r8, [%r21 + %r26] 0x0c
	.word 0xd243602c  ! 2125: LDSW_I	ldsw	[%r13 + 0x002c], %r9
CP_ATM_QUAD_LD687:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2127: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd22b001a  ! 2128: STB_R	stb	%r9, [%r12 + %r26]
	.word 0xd26b001a  ! 2129: LDSTUB_R	ldstub	%r9, [%r12 + %r26]
	.word 0xd2c4d13a  ! 2131: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r9
CP_NUC688:
	.word 0xd2fd009a  ! 2133: SWAPA_R	swapa	%r9, [%r20 + %r26] 0x04
CP_AIUP689:
	.word 0xd2a6021a  ! 2135: STWA_R	stwa	%r9, [%r24 + %r26] 0x10
	.word 0xd03b2028  ! 2136: STD_I	std	%r8, [%r12 + 0x0028]
NC_BLK_SEc690:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2138: LDDFA_R	ldda	[%r19, %r26], %f16
NC_NUC691:
	.word 0xd2a5419a  ! 2140: STWA_R	stwa	%r9, [%r21 + %r26] 0x0c
CP_NUC692:
	.word 0xd2b5009a  ! 2142: STHA_R	stha	%r9, [%r20 + %r26] 0x04
NC_SHORT_FP_SEC693:
	.word 0xd39cdb7a  ! 2144: LDDFA_R	ldda	[%r19, %r26], %f9
CP_NUC694:
	.word 0xd2cd009a  ! 2146: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r9
CP_ATM_QUAD_LD695:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2148: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
	.word 0xd2d3901a  ! 2150: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r9
	.word 0xd3a4903a  ! 2152: STFA_R	sta	%f9, [%r26, %r18]
NC_SHORT_FP_SEC696:
	.word 0xd3bcda3a  ! 2154: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd25ac01a  ! 2155: LDX_R	ldx	[%r11 + %r26], %r9
	.word 0xd3ba911a  ! 2156: STDFA_R	stda	%f9, [%r26, %r10]
NC_SHORT_FP_SEC697:
	.word 0xd39cdb7a  ! 2158: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd39cd13a  ! 2160: LDDFA_R	ldda	[%r19, %r26], %f9
NC_AIUP698:
	.word 0xd386421a  ! 2162: LDFA_R	lda	[%r25, %r26], %f9
NC_BIS_SEC699:
	.word 0xc4acdd7a  ! 2164: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
CP_NUC700:
	.word 0xd3f5201a  ! 2166: CASXA_R	casxa	[%r20]%asi, %r26, %r9
CP_NUC701:
	.word 0xd285009a  ! 2168: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r9
	.word 0xd3ba911a  ! 2169: STDFA_R	stda	%f9, [%r26, %r10]
NC_BIS_AIUS702:
	.word 0xc8afc57a  ! 2171: STBA_R	stba	%r4, [%r31 + %r26] 0x2b
	.word 0xd272a028  ! 2172: STX_I	stx	%r9, [%r10 + 0x0028]
NC_AIUS703:
	.word 0xd2d7c23a  ! 2174: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r9
	.word 0xd2b4d13a  ! 2176: STHA_R	stha	%r9, [%r19 + %r26] 0x89
	.word 0xd2f2d11a  ! 2177: STXA_R	stxa	%r9, [%r11 + %r26] 0x88
	.word 0xd3bc903a  ! 2179: STDFA_R	stda	%f9, [%r26, %r18]
SET_TL1_704:
	ta	T_CHANGE_TO_TL1
CHANGE_R26705:
	add	%r26,	%r27,	%r26
NC_BIS_NUC705:
	.word 0xccad44fa  ! 2181: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xd2a2d01a  ! 2182: STWA_R	stwa	%r9, [%r11 + %r26] 0x80
CP_NUC706:
	.word 0xd39d019a  ! 2184: LDDFA_R	ldda	[%r20, %r26], %f9
	.word 0xd3a4903a  ! 2186: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd3bbd11a  ! 2188: STDFA_R	stda	%f9, [%r26, %r15]
NC_NUC707:
	.word 0xd2f5419a  ! 2190: STXA_R	stxa	%r9, [%r21 + %r26] 0x0c
SHORT_FP_PRI708:
	.word 0xd3bb5b5a  ! 2192: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd39c903a  ! 2194: LDDFA_R	ldda	[%r18, %r26], %f9
CP_AIUS709:
	.word 0xd287823a  ! 2196: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r9
NC_PST_PRI710:
	.word 0xd3bb991a  ! 2198: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd3e2a01a  ! 2199: CASA_R	casa	[%r10] %asi, %r26, %r9
	.word 0xd322801a  ! 2200: STF_R	st	%f9, [%r26, %r10]
CP_BIS_AIUS711:
	and	%r26,	%r28,	%r26
	.word 0xc4a7857a  ! 2202: STWA_R	stwa	%r2, [%r30 + %r26] 0x2b
CP_AIUS712:
	.word 0xd297833a  ! 2204: LDUHA_R	lduha	[%r30, %r26] 0x19, %r9
	.word 0xd39ad15a  ! 2205: LDDFA_R	ldda	[%r11, %r26], %f9
	.word 0xd2d4d03a  ! 2207: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r9
CP_AIUP713:
	.word 0xd2ce021a  ! 2209: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r9
	.word 0xd323602c  ! 2210: STF_I	st	%f9, [0x002c, %r13]
NC_AIUP714:
	.word 0xd2de421a  ! 2212: LDXA_R	ldxa	[%r25, %r26] 0x10, %r9
	.word 0xd2d3505a  ! 2213: LDSHA_R	ldsha	[%r13, %r26] 0x82, %r9
CP_BIS_AIUP715:
	and	%r26,	%r28,	%r26
	.word 0xc8be055a  ! 2215: STDA_R	stda	%r4, [%r24 + %r26] 0x2a
	.word 0xd3a4d03a  ! 2217: STFA_R	sta	%f9, [%r26, %r19]
CP_ATM_QUAD_LD716:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2219: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xd2cad11a  ! 2220: LDSBA_R	ldsba	[%r11, %r26] 0x88, %r9
NC_BIS_AIUS717:
	.word 0xd0b7c47a  ! 2222: STHA_R	stha	%r8, [%r31 + %r26] 0x23
SHORT_FP_PRI718:
	.word 0xd3ba9b5a  ! 2224: STDFA_R	stda	%f9, [%r26, %r10]
NC_BIS_AIUP719:
	.word 0xc8ae445a  ! 2226: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xd2eb111a  ! 2227: LDSTUBA_R	ldstuba	%r9, [%r12 + %r26] 0x88
CP_BIS_QUAD_LD720:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2229: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xd2ac903a  ! 2231: STBA_R	stba	%r9, [%r18 + %r26] 0x81
CP_AIUP721:
	.word 0xd386031a  ! 2233: LDFA_R	lda	[%r24, %r26], %f9
	.word 0xd2c4903a  ! 2235: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
	.word 0xd2ac903a  ! 2237: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd39cd03a  ! 2240: LDDFA_R	ldda	[%r19, %r26], %f9
SET_TL0_722:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI723:
	.word 0xc4ac5c5a  ! 2242: STBA_R	stba	%r2, [%r17 + %r26] 0xe2
	.word 0xd2db911a  ! 2244: LDXA_R	ldxa	[%r14, %r26] 0x88, %r9
CP_BIS_QUAD_LD724:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2246: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS726:
	.word 0xd2a7c23a  ! 2248: STWA_R	stwa	%r9, [%r31 + %r26] 0x11
BLK_PRI727:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 2250: LDDFA_R	ldda	[%r10, %r26], %f0
NC_BIS_SEC728:
	.word 0xc4acdc7a  ! 2252: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd384501a  ! 2254: LDFA_R	lda	[%r17, %r26], %f9
	.word 0xd33b6028  ! 2255: STDF_I	std	%f9, [0x0028, %r13]
CP_BIS_AIUS729:
	and	%r26,	%r28,	%r26
	.word 0xc8f7847a  ! 2257: STXA_R	stxa	%r4, [%r30 + %r26] 0x23
NC_AIUS730:
	.word 0xd28fc23a  ! 2259: LDUBA_R	lduba	[%r31, %r26] 0x11, %r9
	.word 0xd382901a  ! 2260: LDFA_R	lda	[%r10, %r26], %f9
	.word 0xd212a02e  ! 2261: LDUH_I	lduh	[%r10 + 0x002e], %r9
	.word 0xd284d13a  ! 2263: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r9
	.word 0xd26a801a  ! 2264: LDSTUB_R	ldstub	%r9, [%r10 + %r26]
CHANGE_USER731:
	ta	T_CHANGE_NONPRIV
CHANGE_R26732:
	add	%r26,	%r27,	%r26
NC_BIS_PRI732:
	.word 0xc4bb9d5a  ! 2266: STDA_R	stda	%r2, [%r14 + %r26] 0xea
	.word 0xd3a2d01a  ! 2267: STFA_R	sta	%f9, [%r26, %r11]
	.word 0xd2ac913a  ! 2269: STBA_R	stba	%r9, [%r18 + %r26] 0x89
CHANGE_PRIV733:
	ta	T_CHANGE_PRIV
CHANGE_R26734:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS734:
	.word 0xc4b7c47a  ! 2271: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xd2d3d01a  ! 2273: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r9
NC_PST_PRI735:
	.word 0xd3bb981a  ! 2275: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd3bb901a  ! 2277: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd3a4903a  ! 2279: STFA_R	sta	%f9, [%r26, %r18]
CP_AIUS736:
	.word 0xd297823a  ! 2281: LDUHA_R	lduha	[%r30, %r26] 0x11, %r9
	.word 0xd303202c  ! 2282: LDF_I	ld	[%r12, 0x002c], %f9
NC_BIS_AIUP737:
	.word 0xc4ae445a  ! 2284: STBA_R	stba	%r2, [%r25 + %r26] 0x22
CHANGE_TLE738:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd2dcd13a  ! 2287: LDXA_R	ldxa	[%r19, %r26] 0x89, %r9
SET_TL1_739:
	ta	T_CHANGE_TO_TL1
CHANGE_R26740:
	mov	%g0,	%r26
NC_BIS_NUC740:
	.word 0xd0bd44fa  ! 2289: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xd25a801a  ! 2290: LDX_R	ldx	[%r10 + %r26], %r9
	.word 0xd28cd03a  ! 2292: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
CP_BIS_NUC741:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2294: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xd2d4d03a  ! 2296: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r9
SET_TL0_742:
	ta	T_CHANGE_TO_TL0
CHANGE_R26743:
	add	%r26,	%r27,	%r26
NC_BIS_SEC743:
	.word 0xc8a4dc7a  ! 2298: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
CHANGE_PRIV744:
	ta	T_CHANGE_PRIV
CHANGE_R26745:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS745:
	and	%r26,	%r28,	%r26
	.word 0xd0b7847a  ! 2300: STHA_R	stha	%r8, [%r30 + %r26] 0x23
SHORT_FP_PRI746:
	.word 0xd39a9a1a  ! 2302: LDDFA_R	ldda	[%r10, %r26], %f9
	.word 0xd3bb501a  ! 2303: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd09c903a  ! 2305: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd2ac903a  ! 2307: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd09cd13a  ! 2309: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
SET_TL1_747:
	ta	T_CHANGE_TO_TL1
CHANGE_R26748:
	add	%r26,	%r27,	%r26
NC_BIS_NUC748:
	.word 0xc8bd44fa  ! 2311: STDA_R	stda	%r4, [%r21 + %r26] 0x27
	.word 0xd09c903a  ! 2313: LDDA_R	ldda	[%r18, %r26] 0x81, %r8
	.word 0xd384913a  ! 2315: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd39c913a  ! 2317: LDDFA_R	ldda	[%r18, %r26], %f9
	.word 0xd2a4501a  ! 2319: STWA_R	stwa	%r9, [%r17 + %r26] 0x80
	.word 0xd382d01a  ! 2320: LDFA_R	lda	[%r11, %r26], %f9
	.word 0xd2ac903a  ! 2322: STBA_R	stba	%r9, [%r18 + %r26] 0x81
NC_BIS_AIUS749:
	.word 0xc4b7c57a  ! 2324: STHA_R	stha	%r2, [%r31 + %r26] 0x2b
CHANGE_R26750:
	add	%r26,	%r27,	%r26
CP_BIS_SEC750:
	and	%r26,	%r28,	%r26
	.word 0xd0b49d7a  ! 2326: STHA_R	stha	%r8, [%r18 + %r26] 0xeb
	.word 0xd01aa028  ! 2327: LDD_I	ldd	[%r10 + 0x0028], %r8
	.word 0xd09b501a  ! 2328: LDDA_R	ldda	[%r13, %r26] 0x80, %r8
	.word 0xd28a911a  ! 2329: LDUBA_R	lduba	[%r10, %r26] 0x88, %r9
	.word 0xd39cd13a  ! 2331: LDDFA_R	ldda	[%r19, %r26], %f9
SET_TL0_751:
	ta	T_CHANGE_TO_TL0
CHANGE_R26752:
	add	%r26,	%r27,	%r26
NC_BIS_SEC752:
	.word 0xccf4dd7a  ! 2333: STXA_R	stxa	%r6, [%r19 + %r26] 0xeb
	.word 0xd2b4511a  ! 2335: STHA_R	stha	%r9, [%r17 + %r26] 0x88
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS754:
	.word 0xd2cf823a  ! 2337: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r9
SHORT_FP_PRI755:
	.word 0xd39b1b5a  ! 2339: LDDFA_R	ldda	[%r12, %r26], %f9
NC_AIUS756:
	.word 0xd2c7c33a  ! 2341: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r9
NC_BIS_SEC757:
	.word 0xc4f4dd7a  ! 2343: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
	.word 0xd3bb901a  ! 2345: STDFA_R	stda	%f9, [%r26, %r14]
CHANGE_USER758:
	ta	T_CHANGE_NONPRIV
CHANGE_R26759:
	add	%r26,	%r27,	%r26
CP_BIS_PRI759:
	and	%r26,	%r28,	%r26
	.word 0xc4b29c5a  ! 2347: STHA_R	stha	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV760:
	ta	T_CHANGE_PRIV
CHANGE_R26761:
	mov	%g0,	%r26
NC_BIS_AIUP761:
	.word 0xccf6455a  ! 2349: STXA_R	stxa	%r6, [%r25 + %r26] 0x2a
NC_SHORT_FP_SEC762:
	.word 0xd39cda3a  ! 2351: LDDFA_R	ldda	[%r19, %r26], %f9
CP_PST_PRI763:
	.word 0xd3ba999a  ! 2353: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2a4903a  ! 2355: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
	.word 0xd2d4d13a  ! 2357: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r9
	.word 0xd0bbd11a  ! 2359: STDA_R	stda	%r8, [%r15 + %r26] 0x88
	.word 0xd0bc101a  ! 2361: STDA_R	stda	%r8, [%r16 + %r26] 0x80
NC_AIUS764:
	.word 0xd0bfc23a  ! 2363: STDA_R	stda	%r8, [%r31 + %r26] 0x11
	.word 0xd2dc913a  ! 2365: LDXA_R	ldxa	[%r18, %r26] 0x89, %r9
	.word 0xd2c2d05a  ! 2366: LDSWA_R	ldswa	[%r11, %r26] 0x82, %r9
	.word 0xd2ea901a  ! 2367: LDSTUBA_R	ldstuba	%r9, [%r10 + %r26] 0x80
CP_BIS_QUAD_LD765:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2369: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
CP_AIUS766:
	.word 0xd2c7833a  ! 2371: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r9
	.word 0xd2a2911a  ! 2372: STWA_R	stwa	%r9, [%r10 + %r26] 0x88
	.word 0xd28b901a  ! 2374: LDUBA_R	lduba	[%r14, %r26] 0x80, %r9
CP_BIS_AIUP767:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2376: STBA_R	stba	%r2, [%r24 + %r26] 0x22
CP_AIUP768:
	.word 0xd2d6031a  ! 2378: LDSHA_R	ldsha	[%r24, %r26] 0x18, %r9
	.word 0xd3bcd03a  ! 2380: STDFA_R	stda	%f9, [%r26, %r19]
CP_BIS_QUAD_LD769:
	and	%r26,	%r29,	%r26
	.word 0xc49b1d5a  ! 2382: LDDA_R	ldda	[%r12, %r26] 0xea, %r2
SHORT_FP_PRI770:
	.word 0xd39adb5a  ! 2384: LDDFA_R	ldda	[%r11, %r26], %f9
NC_BIS_AIUP771:
	.word 0xc8be445a  ! 2386: STDA_R	stda	%r4, [%r25 + %r26] 0x22
CHANGE_USER772:
	ta	T_CHANGE_NONPRIV
CHANGE_R26773:
	add	%r26,	%r27,	%r26
NC_BIS_PRI773:
	.word 0xd0bbdc5a  ! 2388: STDA_R	stda	%r8, [%r15 + %r26] 0xe2
	.word 0xd384d03a  ! 2390: LDFA_R	lda	[%r19, %r26], %f9
NC_BIS_PRI774:
	.word 0xc8b39c5a  ! 2392: STHA_R	stha	%r4, [%r14 + %r26] 0xe2
	.word 0xd2a2901a  ! 2393: STWA_R	stwa	%r9, [%r10 + %r26] 0x80
NC_PST_PRI775:
	.word 0xd3bb985a  ! 2395: STDFA_R	stda	%f9, [%r26, %r14]
SET_TL1_776:
	ta	T_CHANGE_TO_TL1
CHANGE_R26777:
	add	%r26,	%r27,	%r26
NC_BIS_NUC777:
	.word 0xc4a544fa  ! 2397: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
SET_TL0_778:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI779:
	.word 0xd0f39d5a  ! 2399: STXA_R	stxa	%r8, [%r14 + %r26] 0xea
	.word 0xd2cc511a  ! 2401: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r9
	.word 0xd3a4d13a  ! 2403: STFA_R	sta	%f9, [%r26, %r19]
CHANGE_PRIV780:
	ta	T_CHANGE_PRIV
CHANGE_R26781:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS781:
	.word 0xc8b7c57a  ! 2405: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
CHANGE_R26782:
	add	%r26,	%r27,	%r26
CP_BIS_SEC782:
	and	%r26,	%r28,	%r26
	.word 0xc89c9c7a  ! 2407: LDDA_R	ldda	[%r18, %r26] 0xe3, %r4
	.word 0xd3a4d03a  ! 2409: STFA_R	sta	%f9, [%r26, %r19]
	.word 0xd20a801a  ! 2410: LDUB_R	ldub	[%r10 + %r26], %r9
	.word 0xd27a801a  ! 2411: SWAP_R	swap	%r9, [%r10 + %r26]
	.word 0xd39b515a  ! 2412: LDDFA_R	ldda	[%r13, %r26], %f9
	.word 0xd2fa901a  ! 2413: SWAPA_R	swapa	%r9, [%r10 + %r26] 0x80
	.word 0xd2ccd03a  ! 2415: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
CP_NUC783:
	.word 0xd2a5009a  ! 2417: STWA_R	stwa	%r9, [%r20 + %r26] 0x04
	.word 0xd242a02c  ! 2418: LDSW_I	ldsw	[%r10 + 0x002c], %r9
NC_NUC784:
	.word 0xd2d5409a  ! 2420: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r9
	.word 0xd2b4903a  ! 2422: STHA_R	stha	%r9, [%r18 + %r26] 0x81
	.word 0xd2a3901a  ! 2424: STWA_R	stwa	%r9, [%r14 + %r26] 0x80
	.word 0xd2dc903a  ! 2426: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
SET_TL1_785:
	ta	T_CHANGE_TO_TL1
CHANGE_R26786:
	add	%r26,	%r27,	%r26
NC_BIS_NUC786:
	.word 0xc8a544fa  ! 2428: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xd3a4111a  ! 2430: STFA_R	sta	%f9, [%r26, %r16]
	.word 0xd2fb501a  ! 2431: SWAPA_R	swapa	%r9, [%r13 + %r26] 0x80
CP_PST_PRI787:
	.word 0xd3ba999a  ! 2433: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd22ac01a  ! 2434: STB_R	stb	%r9, [%r11 + %r26]
CP_NUC788:
	.word 0xd2ad009a  ! 2436: STBA_R	stba	%r9, [%r20 + %r26] 0x04
	.word 0xd382901a  ! 2437: LDFA_R	lda	[%r10, %r26], %f9
NC_NUC789:
	.word 0xd285409a  ! 2439: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r9
NC_AIUP790:
	.word 0xd39e431a  ! 2441: LDDFA_R	ldda	[%r25, %r26], %f9
NC_BIS_NUC791:
	.word 0xc4a545fa  ! 2443: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
NC_BLK_SEc792:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2445: LDDFA_R	ldda	[%r19, %r26], %f0
CP_NUC793:
	.word 0xd2c5019a  ! 2447: LDSWA_R	ldswa	[%r20, %r26] 0x0c, %r9
	.word 0xd2a2d01a  ! 2448: STWA_R	stwa	%r9, [%r11 + %r26] 0x80
CP_ATM_QUAD_LD794:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2450: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd302801a  ! 2451: LDF_R	ld	[%r10, %r26], %f9
	.word 0xd3bcd03a  ! 2453: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd28c913a  ! 2455: LDUBA_R	lduba	[%r18, %r26] 0x89, %r9
NC_NUC795:
	.word 0xd2dd409a  ! 2457: LDXA_R	ldxa	[%r21, %r26] 0x04, %r9
SET_TL0_796:
	ta	T_CHANGE_TO_TL0
CHANGE_R26797:
	add	%r26,	%r27,	%r26
NC_BIS_SEC797:
	.word 0xccacdc7a  ! 2459: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
	.word 0xd2d4501a  ! 2461: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r9
	.word 0xd2b4903a  ! 2463: STHA_R	stha	%r9, [%r18 + %r26] 0x81
NC_BIS_SEC798:
	.word 0xcca4dc7a  ! 2465: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
CHANGE_PRIV799:
	ta	T_CHANGE_PRIV
CHANGE_R26800:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD800:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2467: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xd27aa02c  ! 2468: SWAP_I	swap	%r9, [%r10 + 0x002c]
	.word 0xd2a4903a  ! 2470: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
NC_PST_PRI801:
	.word 0xd3bbd81a  ! 2472: STDFA_R	stda	%f9, [%r26, %r15]
CP_BIS_NUC802:
	and	%r26,	%r28,	%r26
	.word 0xc8f504fa  ! 2474: STXA_R	stxa	%r4, [%r20 + %r26] 0x27
NC_BIS_AIUP803:
	.word 0xc4b6445a  ! 2476: STHA_R	stha	%r2, [%r25 + %r26] 0x22
BLK_PRI804:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 2478: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xd284d13a  ! 2480: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r9
SET_TL1_805:
	ta	T_CHANGE_TO_TL1
CHANGE_R26806:
	mov	%g0,	%r26
NC_BIS_NUC806:
	.word 0xd0ad44fa  ! 2482: STBA_R	stba	%r8, [%r21 + %r26] 0x27
CP_BIS_AIUP807:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 2484: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
	.word 0xd384903a  ! 2486: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd302c01a  ! 2487: LDF_R	ld	[%r11, %r26], %f9
	.word 0xd2dc903a  ! 2489: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
SET_TL0_808:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI809:
	and	%r26,	%r28,	%r26
	.word 0xc4aa9d5a  ! 2491: STBA_R	stba	%r2, [%r10 + %r26] 0xea
SET_TL1_810:
	ta	T_CHANGE_TO_TL1
CHANGE_R26811:
	add	%r26,	%r27,	%r26
NC_BIS_NUC811:
	.word 0xc4ad45fa  ! 2493: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xd0bc913a  ! 2495: STDA_R	stda	%r8, [%r18 + %r26] 0x89
	.word 0xd2a2901a  ! 2496: STWA_R	stwa	%r9, [%r10 + %r26] 0x80
CP_BIS_AIUP812:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2498: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
NC_AIUP813:
	.word 0xd2de421a  ! 2500: LDXA_R	ldxa	[%r25, %r26] 0x10, %r9
CHANGE_R26814:
	add	%r26,	%r27,	%r26
CP_BIS_SEC814:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 2502: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
	.word 0xd294903a  ! 2504: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_PST_PRI815:
	.word 0xd3bb995a  ! 2506: STDFA_R	stda	%f9, [%r26, %r14]
	.word 0xd3bc101a  ! 2508: STDFA_R	stda	%f9, [%r26, %r16]
	.word 0xd284501a  ! 2510: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r9
	.word 0xd33aa028  ! 2511: STDF_I	std	%f9, [0x0028, %r10]
	.word 0xd2dcd03a  ! 2513: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
	.word 0xd2cc913a  ! 2515: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
BLK_PRI816:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 2517: LDDFA_R	ldda	[%r10, %r26], %f16
NC_NUC817:
	.word 0xd385409a  ! 2519: LDFA_R	lda	[%r21, %r26], %f9
	.word 0xd294501a  ! 2521: LDUHA_R	lduha	[%r17, %r26] 0x80, %r9
	.word 0xd39b101a  ! 2522: LDDFA_R	ldda	[%r12, %r26], %f9
NC_BIS_NUC818:
	.word 0xc4ad44fa  ! 2524: STBA_R	stba	%r2, [%r21 + %r26] 0x27
CHANGE_R26819:
	add	%r26,	%r27,	%r26
CP_BIS_SEC819:
	and	%r26,	%r28,	%r26
	.word 0xc8a49c7a  ! 2526: STWA_R	stwa	%r4, [%r18 + %r26] 0xe3
	.word 0xd3a4903a  ! 2528: STFA_R	sta	%f9, [%r26, %r18]
	.word 0xd2dbd11a  ! 2530: LDXA_R	ldxa	[%r15, %r26] 0x88, %r9
	.word 0xd2d4903a  ! 2532: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
SET_TL0_820:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI821:
	.word 0xc4bc1c5a  ! 2534: STDA_R	stda	%r2, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS823:
	.word 0xd287823a  ! 2536: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r9
CHANGE_R26824:
	add	%r26,	%r27,	%r26
CP_BIS_SEC824:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 2538: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
	.word 0xd39c903a  ! 2540: LDDFA_R	ldda	[%r18, %r26], %f9
	.word 0xd2dcd03a  ! 2542: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
	.word 0xd2c3505a  ! 2543: LDSWA_R	ldswa	[%r13, %r26] 0x82, %r9
	.word 0xd3bcd03a  ! 2545: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd28c903a  ! 2547: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
	.word 0xd2ccd13a  ! 2549: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd284903a  ! 2551: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r9
	.word 0xd2cb901a  ! 2553: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r9
SHORT_FP_PRI825:
	.word 0xd39a9b1a  ! 2555: LDDFA_R	ldda	[%r10, %r26], %f9
CP_AIUP826:
	.word 0xd286031a  ! 2557: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r9
	.word 0xd2aa911a  ! 2558: STBA_R	stba	%r9, [%r10 + %r26] 0x88
	.word 0xd2ac903a  ! 2560: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd3a4101a  ! 2562: STFA_R	sta	%f9, [%r26, %r16]
	.word 0xd322a02c  ! 2563: STF_I	st	%f9, [0x002c, %r10]
	.word 0xd2a4d03a  ! 2565: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
NC_BIS_SEC827:
	.word 0xc4acdc7a  ! 2567: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xd39c903a  ! 2569: LDDFA_R	ldda	[%r18, %r26], %f9
NC_AIUP828:
	.word 0xd2de421a  ! 2571: LDXA_R	ldxa	[%r25, %r26] 0x10, %r9
NC_NUC829:
	.word 0xd2b5419a  ! 2573: STHA_R	stha	%r9, [%r21 + %r26] 0x0c
	.word 0xd26aa02f  ! 2574: LDSTUB_I	ldstub	%r9, [%r10 + 0x002f]
	.word 0xd232c01a  ! 2575: STH_R	sth	%r9, [%r11 + %r26]
	.word 0xd2b4d03a  ! 2577: STHA_R	stha	%r9, [%r19 + %r26] 0x81
BLK_PRI830:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2579: LDDFA_R	ldda	[%r10, %r26], %f0
NC_BIS_AIUS831:
	.word 0xcca7c47a  ! 2581: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
NC_BIS_SEC832:
	.word 0xccacdc7a  ! 2583: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
	.word 0xd03b001a  ! 2584: STD_R	std	%r8, [%r12 + %r26]
BLK_PRI833:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 2586: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xd09c913a  ! 2588: LDDA_R	ldda	[%r18, %r26] 0x89, %r8
	.word 0xd2b4d13a  ! 2590: STHA_R	stha	%r9, [%r19 + %r26] 0x89
CHANGE_USER834:
	ta	T_CHANGE_NONPRIV
CHANGE_R26835:
	add	%r26,	%r27,	%r26
NC_BIS_PRI835:
	.word 0xd0bbdd5a  ! 2592: STDA_R	stda	%r8, [%r15 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC837:
	.word 0xd285409a  ! 2594: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r9
NC_BLK_SEc838:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2596: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xd25a801a  ! 2597: LDX_R	ldx	[%r10 + %r26], %r9
SET_TL1_839:
	ta	T_CHANGE_TO_TL1
CHANGE_R26840:
	mov	%g0,	%r26
NC_BIS_NUC840:
	.word 0xc8b544fa  ! 2599: STHA_R	stha	%r4, [%r21 + %r26] 0x27
CP_BIS_AIUS841:
	and	%r26,	%r28,	%r26
	.word 0xd0f7857a  ! 2601: STXA_R	stxa	%r8, [%r30 + %r26] 0x2b
NC_NUC842:
	.word 0xd2c5419a  ! 2603: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r9
	.word 0xd0bcd03a  ! 2605: STDA_R	stda	%r8, [%r19 + %r26] 0x81
SET_TL0_843:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI844:
	.word 0xd0bbdc5a  ! 2607: STDA_R	stda	%r8, [%r15 + %r26] 0xe2
	.word 0xd2fa901a  ! 2608: SWAPA_R	swapa	%r9, [%r10 + %r26] 0x80
CHANGE_PRIV845:
	ta	T_CHANGE_PRIV
CHANGE_R26846:
	add	%r26,	%r27,	%r26
CP_BIS_NUC846:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2610: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xd2b3901a  ! 2612: STHA_R	stha	%r9, [%r14 + %r26] 0x80
CP_NUC847:
	.word 0xd09d009a  ! 2614: LDDA_R	ldda	[%r20, %r26] 0x04, %r8
	.word 0xd33b001a  ! 2615: STDF_R	std	%f9, [%r26, %r12]
	.word 0xd203001a  ! 2616: LDUW_R	lduw	[%r12 + %r26], %r9
NC_NUC848:
	.word 0xd3a5409a  ! 2618: STFA_R	sta	%f9, [%r26, %r21]
CHANGE_TLE849:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV850:
	ta	T_CHANGE_PRIV
CHANGE_R26851:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD851:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2621: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xd383d11a  ! 2623: LDFA_R	lda	[%r15, %r26], %f9
CP_PST_PRI852:
	.word 0xd3ba999a  ! 2625: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd3a4d03a  ! 2627: STFA_R	sta	%f9, [%r26, %r19]
	.word 0xd0bcd03a  ! 2629: STDA_R	stda	%r8, [%r19 + %r26] 0x81
SET_TL1_853:
	ta	T_CHANGE_TO_TL1
CHANGE_R26854:
	add	%r26,	%r27,	%r26
NC_BIS_NUC854:
	.word 0xc4bd44fa  ! 2631: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xd294903a  ! 2633: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_BLK_SEc855:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2635: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd3a3101a  ! 2636: STFA_R	sta	%f9, [%r26, %r12]
NC_BIS_AIUP856:
	.word 0xd0ae445a  ! 2638: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xd284d03a  ! 2640: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r9
	.word 0xd2c4903a  ! 2642: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
CP_ATM_QUAD_LD857:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2644: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
SHORT_FP_PRI858:
	.word 0xd3bb5b1a  ! 2646: STDFA_R	stda	%f9, [%r26, %r13]
	.word 0xd382901a  ! 2647: LDFA_R	lda	[%r10, %r26], %f9
SET_TL0_859:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI860:
	.word 0xc4ab9d5a  ! 2649: STBA_R	stba	%r2, [%r14 + %r26] 0xea
	.word 0xd2c4903a  ! 2651: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r9
CP_PST_PRI861:
	.word 0xd3bb185a  ! 2653: STDFA_R	stda	%f9, [%r26, %r12]
CHANGE_PRIV862:
	ta	T_CHANGE_PRIV
CHANGE_R26863:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP863:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2655: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xd2a4101a  ! 2657: STWA_R	stwa	%r9, [%r16 + %r26] 0x80
NC_BLK_SEc864:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2659: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xd0bc111a  ! 2661: STDA_R	stda	%r8, [%r16 + %r26] 0x88
	.word 0xd2a4913a  ! 2663: STWA_R	stwa	%r9, [%r18 + %r26] 0x89
	.word 0xd233001a  ! 2664: STH_R	sth	%r9, [%r12 + %r26]
CHANGE_R26865:
	add	%r26,	%r27,	%r26
CP_BIS_SEC865:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 2666: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
WR_LEASI_866:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_867:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_PST_PRI868:
	.word 0xd3bb595a  ! 2669: STDFA_R	stda	%f9, [%r26, %r13]
CP_AIUP869:
	.word 0xd3a6021a  ! 2671: STFA_R	sta	%f9, [%r26, %r24]
NC_SHORT_FP_SEC870:
	.word 0xd3bcdb7a  ! 2673: STDFA_R	stda	%f9, [%r26, %r19]
NC_BIS_AIUP871:
	.word 0xccf6445a  ! 2675: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
CHANGE_USER872:
	ta	T_CHANGE_NONPRIV
CHANGE_R26873:
	add	%r26,	%r27,	%r26
NC_BIS_PRI873:
	.word 0xd0f3dd5a  ! 2677: STXA_R	stxa	%r8, [%r15 + %r26] 0xea
	.word 0xd242801a  ! 2678: LDSW_R	ldsw	[%r10 + %r26], %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP875:
	.word 0xd386021a  ! 2680: LDFA_R	lda	[%r24, %r26], %f9
NC_BIS_AIUS876:
	.word 0xc4f7c57a  ! 2682: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xd384d03a  ! 2684: LDFA_R	lda	[%r19, %r26], %f9
	.word 0xd2ac903a  ! 2686: STBA_R	stba	%r9, [%r18 + %r26] 0x81
WR_LEASI_877:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_878:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_AIUP879:
	.word 0xd3be021a  ! 2689: STDFA_R	stda	%f9, [%r26, %r24]
	.word 0xd253001a  ! 2690: LDSH_R	ldsh	[%r12 + %r26], %r9
	.word 0xd09cd03a  ! 2692: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd0bbd11a  ! 2694: STDA_R	stda	%r8, [%r15 + %r26] 0x88
NC_NUC880:
	.word 0xd2b5409a  ! 2696: STHA_R	stha	%r9, [%r21 + %r26] 0x04
	.word 0xd09a901a  ! 2697: LDDA_R	ldda	[%r10, %r26] 0x80, %r8
	.word 0xd2a4d13a  ! 2699: STWA_R	stwa	%r9, [%r19 + %r26] 0x89
	.word 0xd2cb911a  ! 2701: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r9
NC_BLK_SEc881:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2703: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xd2dc903a  ! 2705: LDXA_R	ldxa	[%r18, %r26] 0x81, %r9
NC_BIS_AIUP882:
	.word 0xc8be445a  ! 2707: STDA_R	stda	%r4, [%r25 + %r26] 0x22
	.word 0xd252801a  ! 2708: LDSH_R	ldsh	[%r10 + %r26], %r9
	.word 0xd0bcd13a  ! 2710: STDA_R	stda	%r8, [%r19 + %r26] 0x89
	.word 0xd39b501a  ! 2711: LDDFA_R	ldda	[%r13, %r26], %f9
NC_PST_PRI883:
	.word 0xd3bc595a  ! 2713: STDFA_R	stda	%f9, [%r26, %r17]
CP_AIUS884:
	.word 0xd2b7823a  ! 2715: STHA_R	stha	%r9, [%r30 + %r26] 0x11
CP_AIUP885:
	.word 0xd0be021a  ! 2717: STDA_R	stda	%r8, [%r24 + %r26] 0x10
	.word 0xd2aad01a  ! 2718: STBA_R	stba	%r9, [%r11 + %r26] 0x80
NC_BIS_AIUP886:
	.word 0xc4a6445a  ! 2720: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xd3a2901a  ! 2721: STFA_R	sta	%f9, [%r26, %r10]
	.word 0xd24b202f  ! 2722: LDSB_I	ldsb	[%r12 + 0x002f], %r9
NC_BIS_AIUS887:
	.word 0xccbfc47a  ! 2724: STDA_R	stda	%r6, [%r31 + %r26] 0x23
	.word 0xd2ac903a  ! 2726: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd28cd03a  ! 2728: LDUBA_R	lduba	[%r19, %r26] 0x81, %r9
CP_BIS_NUC888:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2730: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
	.word 0xd3bcd03a  ! 2732: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd284d03a  ! 2734: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r9
NC_SHORT_FP_SEC889:
	.word 0xd3bcdb3a  ! 2736: STDFA_R	stda	%f9, [%r26, %r19]
CHANGE_USER890:
	ta	T_CHANGE_NONPRIV
CHANGE_R26891:
	mov	%g0,	%r26
CP_BIS_PRI891:
	and	%r26,	%r28,	%r26
	.word 0xc49add5a  ! 2738: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	.word 0xd0bc913a  ! 2740: STDA_R	stda	%r8, [%r18 + %r26] 0x89
CP_BIS_PRI892:
	and	%r26,	%r28,	%r26
	.word 0xccf29c5a  ! 2742: STXA_R	stxa	%r6, [%r10 + %r26] 0xe2
	.word 0xd2d4913a  ! 2744: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r9
	.word 0xd39cd03a  ! 2746: LDDFA_R	ldda	[%r19, %r26], %f9
CHANGE_PRIV893:
	ta	T_CHANGE_PRIV
CHANGE_R26894:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD894:
	and	%r26,	%r29,	%r26
	.word 0xcc9b059a  ! 2748: LDDA_R	ldda	[%r12, %r26] 0x2c, %r6
CP_BIS_AIUP895:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 2750: STBA_R	stba	%r2, [%r24 + %r26] 0x22
SET_TL1_896:
	ta	T_CHANGE_TO_TL1
CHANGE_R26897:
	add	%r26,	%r27,	%r26
NC_BIS_NUC897:
	.word 0xccb545fa  ! 2752: STHA_R	stha	%r6, [%r21 + %r26] 0x2f
SET_TL0_898:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI899:
	and	%r26,	%r28,	%r26
	.word 0xc8aa9c5a  ! 2754: STBA_R	stba	%r4, [%r10 + %r26] 0xe2
NC_PST_PRI900:
	.word 0xd3bbd91a  ! 2756: STDFA_R	stda	%f9, [%r26, %r15]
	.word 0xd2a4d13a  ! 2758: STWA_R	stwa	%r9, [%r19 + %r26] 0x89
	.word 0xd303401a  ! 2759: LDF_R	ld	[%r13, %r26], %f9
	.word 0xd2a4d03a  ! 2761: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
NC_BIS_PRI901:
	.word 0xc8ab9c5a  ! 2763: STBA_R	stba	%r4, [%r14 + %r26] 0xe2
	.word 0xd09cd03a  ! 2765: LDDA_R	ldda	[%r19, %r26] 0x81, %r8
	.word 0xd2d4903a  ! 2767: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r9
	.word 0xd2fb501a  ! 2768: SWAPA_R	swapa	%r9, [%r13 + %r26] 0x80
	.word 0xd202c01a  ! 2769: LDUW_R	lduw	[%r11 + %r26], %r9
	.word 0xd2ea901a  ! 2770: LDSTUBA_R	ldstuba	%r9, [%r10 + %r26] 0x80
	.word 0xd284903a  ! 2772: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r9
	.word 0xd2f4913a  ! 2774: STXA_R	stxa	%r9, [%r18 + %r26] 0x89
CP_BIS_QUAD_LD902:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2776: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xd2dc913a  ! 2778: LDXA_R	ldxa	[%r18, %r26] 0x89, %r9
CP_PST_PRI903:
	.word 0xd3ba991a  ! 2780: STDFA_R	stda	%f9, [%r26, %r10]
CHANGE_PRIV904:
	ta	T_CHANGE_PRIV
CHANGE_R26905:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP905:
	and	%r26,	%r28,	%r26
	.word 0xd0be045a  ! 2782: STDA_R	stda	%r8, [%r24 + %r26] 0x22
	.word 0xd33ac01a  ! 2783: STDF_R	std	%f9, [%r26, %r11]
WR_LEASI_906:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_907:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xd2f4913a  ! 2786: STXA_R	stxa	%r9, [%r18 + %r26] 0x89
NC_BIS_AIUP908:
	.word 0xc4f6445a  ! 2788: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xd2f4913a  ! 2790: STXA_R	stxa	%r9, [%r18 + %r26] 0x89
CP_NUC909:
	.word 0xd09d019a  ! 2792: LDDA_R	ldda	[%r20, %r26] 0x0c, %r8
NC_AIUS910:
	.word 0xd297c33a  ! 2794: LDUHA_R	lduha	[%r31, %r26] 0x19, %r9
CHANGE_R26911:
	add	%r26,	%r27,	%r26
CP_BIS_SEC911:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 2796: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
CP_PST_PRI912:
	.word 0xd3ba981a  ! 2798: STDFA_R	stda	%f9, [%r26, %r10]
	.word 0xd2ac903a  ! 2800: STBA_R	stba	%r9, [%r18 + %r26] 0x81
	.word 0xd212e02e  ! 2801: LDUH_I	lduh	[%r11 + 0x002e], %r9
NC_NUC913:
	.word 0xd2c5409a  ! 2803: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r9
	.word 0xd384903a  ! 2805: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd294913a  ! 2807: LDUHA_R	lduha	[%r18, %r26] 0x89, %r9
CP_BIS_NUC914:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2809: STBA_R	stba	%r2, [%r20 + %r26] 0x27
NC_AIUP915:
	.word 0xd2c6421a  ! 2811: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r9
CP_ATM_QUAD_LD916:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 2813: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
NC_BIS_SEC917:
	.word 0xd0b4dc7a  ! 2815: STHA_R	stha	%r8, [%r19 + %r26] 0xe3
SHORT_FP_PRI918:
	.word 0xd39b1a5a  ! 2817: LDDFA_R	ldda	[%r12, %r26], %f9
BLK_PRI919:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 2819: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xd322a02c  ! 2820: STF_I	st	%f9, [0x002c, %r10]
	.word 0xd384903a  ! 2822: LDFA_R	lda	[%r18, %r26], %f9
	.word 0xd2d3901a  ! 2824: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r9
NC_BIS_AIUP920:
	.word 0xc8a6445a  ! 2826: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
	.word 0xd3bcd13a  ! 2828: STDFA_R	stda	%f9, [%r26, %r19]
CP_AIUS921:
	.word 0xd39f823a  ! 2830: LDDFA_R	ldda	[%r30, %r26], %f9
	.word 0xd3bcd13a  ! 2832: STDFA_R	stda	%f9, [%r26, %r19]
	.word 0xd2ccd03a  ! 2834: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r9
	.word 0xd2d3501a  ! 2835: LDSHA_R	ldsha	[%r13, %r26] 0x80, %r9
	.word 0xc76fa03b  ! 2837: PREFETCH_I	prefetch	[%r30 + 0x003b], #one_write
CP_BIS_AIUP922:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 2839: STBA_R	stba	%r8, [%r24 + %r26] 0x22
	.word 0xd3a3d01a  ! 2841: STFA_R	sta	%f9, [%r26, %r15]
	.word 0xd294903a  ! 2843: LDUHA_R	lduha	[%r18, %r26] 0x81, %r9
NC_BIS_AIUP923:
	.word 0xc4be445a  ! 2845: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xd384d13a  ! 2847: LDFA_R	lda	[%r19, %r26], %f9
	.word 0xd3bb501a  ! 2848: STDFA_R	stda	%f9, [%r26, %r13]
NC_BLK_SEc924:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2850: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xd2ccd13a  ! 2852: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r9
	.word 0xd2b4d03a  ! 2854: STHA_R	stha	%r9, [%r19 + %r26] 0x81
	.word 0xd3a4501a  ! 2856: STFA_R	sta	%f9, [%r26, %r17]
CP_NUC925:
	.word 0xd2b5009a  ! 2858: STHA_R	stha	%r9, [%r20 + %r26] 0x04
NC_BIS_AIUP926:
	.word 0xc4ae445a  ! 2860: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_NUC927:
	.word 0xd2c5409a  ! 2862: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r9
NC_NUC928:
	.word 0xd2cd409a  ! 2864: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r9
	.word 0xd2cc913a  ! 2866: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r9
	.word 0xd3bb901a  ! 2868: STDFA_R	stda	%f9, [%r26, %r14]
CP_NUC929:
	.word 0xd2d5009a  ! 2870: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r9
CP_AIUS930:
	.word 0xd2d7823a  ! 2872: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r9
CP_ATM_QUAD_LD931:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2874: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xd0bbd01a  ! 2876: STDA_R	stda	%r8, [%r15 + %r26] 0x80
CHANGE_TLE932:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xd3a3d01a  ! 2879: STFA_R	sta	%f9, [%r26, %r15]
CHANGE_PRIV933:
	ta	T_CHANGE_PRIV
CHANGE_R26934:
	add	%r26,	%r27,	%r26
CP_BIS_NUC934:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 2881: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
CHANGE_R26935:
	add	%r26,	%r27,	%r26
CP_BIS_SEC935:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9c7a  ! 2883: STDA_R	stda	%r4, [%r18 + %r26] 0xe3
CP_AIUS936:
	.word 0xd28f833a  ! 2885: LDUBA_R	lduba	[%r30, %r26] 0x19, %r9
NC_BIS_SEC937:
	.word 0xc4a4dc7a  ! 2887: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xd28b505a  ! 2888: LDUBA_R	lduba	[%r13, %r26] 0x82, %r9
NC_NUC938:
	.word 0xd2ad419a  ! 2890: STBA_R	stba	%r9, [%r21 + %r26] 0x0c
	.word 0xd2f2901a  ! 2891: STXA_R	stxa	%r9, [%r10 + %r26] 0x80
	.word 0xd2a4d03a  ! 2893: STWA_R	stwa	%r9, [%r19 + %r26] 0x81
NC_AIUS939:
	.word 0xd297c23a  ! 2895: LDUHA_R	lduha	[%r31, %r26] 0x11, %r9
SET_TL1_940:
	ta	T_CHANGE_TO_TL1
CHANGE_R26941:
	add	%r26,	%r27,	%r26
NC_BIS_NUC941:
	.word 0xc8a544fa  ! 2897: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
SET_TL0_942:
	ta	T_CHANGE_TO_TL0
WR_LEASI_943:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_944:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_PRIV945:
	ta	T_CHANGE_PRIV
CHANGE_R26946:
	mov	%g0,	%r26
CP_BIS_NUC946:
	and	%r26,	%r28,	%r26
	.word 0xd0b505fa  ! 2900: STHA_R	stha	%r8, [%r20 + %r26] 0x2f
	.word 0xd382d01a  ! 2901: LDFA_R	lda	[%r11, %r26], %f9
NC_BLK_SEc947:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2903: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_AIUP948:
	and	%r26,	%r28,	%r26
	.word 0xc8b6055a  ! 2905: STHA_R	stha	%r4, [%r24 + %r26] 0x2a
CP_BIS_QUAD_LD949:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 2907: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xd28c913a  ! 2909: LDUBA_R	lduba	[%r18, %r26] 0x89, %r9
CP_NUC950:
	.word 0xd0bd009a  ! 2911: STDA_R	stda	%r8, [%r20 + %r26] 0x04
	.word 0xd2c4d03a  ! 2913: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r9
CHANGE_USER951:
	ta	T_CHANGE_NONPRIV
CHANGE_R26952:
	add	%r26,	%r27,	%r26
NC_BIS_PRI952:
	.word 0xc4f41d5a  ! 2915: STXA_R	stxa	%r2, [%r16 + %r26] 0xea
	.word 0xd3a2911a  ! 2916: STFA_R	sta	%f9, [%r26, %r10]
CHANGE_PRIV953:
	ta	T_CHANGE_PRIV
CHANGE_R26954:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP954:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 2918: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
CP_AIUS955:
	.word 0xd297823a  ! 2920: LDUHA_R	lduha	[%r30, %r26] 0x11, %r9
	.word 0xd2a4903a  ! 2922: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
CP_PST_PRI956:
	.word 0xd3ba981a  ! 2924: STDFA_R	stda	%f9, [%r26, %r10]
WR_LEASI_957:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_958:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP959:
	.word 0xd2b6421a  ! 2927: STHA_R	stha	%r9, [%r25 + %r26] 0x10
CHANGE_USER960:
	ta	T_CHANGE_NONPRIV
CHANGE_R26961:
	add	%r26,	%r27,	%r26
CP_BIS_PRI961:
	and	%r26,	%r28,	%r26
	.word 0xccaadd5a  ! 2929: STBA_R	stba	%r6, [%r11 + %r26] 0xea
NC_BLK_SEc962:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2931: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xd384111a  ! 2933: LDFA_R	lda	[%r16, %r26], %f9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP964:
	.word 0xd3a6021a  ! 2935: STFA_R	sta	%f9, [%r26, %r24]
	.word 0xd2b4d03a  ! 2937: STHA_R	stha	%r9, [%r19 + %r26] 0x81
	.word 0xd2a4903a  ! 2939: STWA_R	stwa	%r9, [%r18 + %r26] 0x81
CP_ATM_QUAD_LD965:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 2941: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
NC_SHORT_FP_SEC966:
	.word 0xd39cdb3a  ! 2943: LDDFA_R	ldda	[%r19, %r26], %f9
	.word 0xd2dcd03a  ! 2945: LDXA_R	ldxa	[%r19, %r26] 0x81, %r9
NC_PST_PRI967:
	.word 0xd3bc581a  ! 2947: STDFA_R	stda	%f9, [%r26, %r17]
	.word 0xd2b4d03a  ! 2949: STHA_R	stha	%r9, [%r19 + %r26] 0x81
CP_ATM_QUAD_LD968:
	and	%r26,	%r29,	%r26
	.word 0xd09a859a  ! 2951: LDDA_R	ldda	[%r10, %r26] 0x2c, %r8
	.word 0xd28c903a  ! 2953: LDUBA_R	lduba	[%r18, %r26] 0x81, %r9
	.word 0xd2f2911a  ! 2954: STXA_R	stxa	%r9, [%r10 + %r26] 0x88
NC_BIS_SEC969:
	.word 0xccacdd7a  ! 2956: STBA_R	stba	%r6, [%r19 + %r26] 0xeb
	.word 0xd28c913a  ! 2958: LDUBA_R	lduba	[%r18, %r26] 0x89, %r9
CP_BIS_AIUS970:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 2960: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
	.word 0xd09cd13a  ! 2962: LDDA_R	ldda	[%r19, %r26] 0x89, %r8
	.word 0xd27b602c  ! 2963: SWAP_I	swap	%r9, [%r13 + 0x002c]
CHANGE_USER971:
	ta	T_CHANGE_NONPRIV
CHANGE_R26972:
	add	%r26,	%r27,	%r26
NC_BIS_PRI972:
	.word 0xc8ac5d5a  ! 2965: STBA_R	stba	%r4, [%r17 + %r26] 0xea
	.word 0xd2c3115a  ! 2966: LDSWA_R	ldswa	[%r12, %r26] 0x8a, %r9
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP974:
	.word 0xd2b6021a  ! 2968: STHA_R	stha	%r9, [%r24 + %r26] 0x10
BLK_PRI975:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 2970: STDFA_R	stda	%f0, [%r26, %r12]
BLK_PRI976:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2972: LDDFA_R	ldda	[%r11, %r26], %f0
NC_AIUP977:
	.word 0xd28e431a  ! 2974: LDUBA_R	lduba	[%r25, %r26] 0x18, %r9
CP_AIUP978:
	.word 0xd2b6021a  ! 2976: STHA_R	stha	%r9, [%r24 + %r26] 0x10
CP_PST_PRI979:
	.word 0xd3bad89a  ! 2978: STDFA_R	stda	%f9, [%r26, %r11]
NC_BIS_AIUP980:
	.word 0xccbe455a  ! 2980: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
	.word 0xd213202e  ! 2981: LDUH_I	lduh	[%r12 + 0x002e], %r9
WR_LEASI_981:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_982:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_NUC983:
	.word 0xd2f5409a  ! 2984: STXA_R	stxa	%r9, [%r21 + %r26] 0x04
CP_AIUP984:
	.word 0xd2c6021a  ! 2986: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r9
	.word 0xd2b4511a  ! 2988: STHA_R	stha	%r9, [%r17 + %r26] 0x88
	.word 0xd09a911a  ! 2989: LDDA_R	ldda	[%r10, %r26] 0x88, %r8
	.word 0xd0bc913a  ! 2991: STDA_R	stda	%r8, [%r18 + %r26] 0x89
WR_LEASI_985:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_986:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_USER987:
	ta	T_CHANGE_NONPRIV
CHANGE_R26988:
	add	%r26,	%r27,	%r26
CP_BIS_PRI988:
	and	%r26,	%r28,	%r26
	.word 0xc4b35d5a  ! 2994: STHA_R	stha	%r2, [%r13 + %r26] 0xea
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC990:
	.word 0xd2a5019a  ! 2996: STWA_R	stwa	%r9, [%r20 + %r26] 0x0c
CP_PST_PRI991:
	.word 0xd3bb585a  ! 2998: STDFA_R	stda	%f9, [%r26, %r13]
NC_BIS_SEC992:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x4f75d9e2fa0f458b
.xword 0x5cc1437ac6d0c867
.xword 0x1679c0963f569758
.xword 0x46a585ed2022941e
.xword 0x1ea02c3cb52a623c
.xword 0xa495a76ed11761e8
.xword 0x423f798235936177
.xword 0x4837c89fb1d1d099
.xword 0x529cf1d40bfe677e
.xword 0xc19a0ccce3a814a9
.xword 0x2649eaa645fd09d8
.xword 0x0521eda2bc3c6f9d
.xword 0x679a2741a68ac78a
.xword 0xbfcf00c7ed0fa0cd
.xword 0x4def4bce1c2c73bf
.xword 0xb69a39f01467764a
.xword 0x2cd4fb0d883fa171
.xword 0x19c0674c09caba0d
.xword 0xb75d42c4ac7f878c
.xword 0xc725d5b9469e07b0
.xword 0x23985466c2cf1056
.xword 0xac38bf8cd6187b03
.xword 0xf30f9f2ed65c2b66
.xword 0x07d98f2ec83ab325
.xword 0xd5de483207c0cab4
.xword 0xc189f442dad98250
.xword 0xc1e96574fca7a4b9
.xword 0xef98be1c1c766ac2
.xword 0x8fae4dc5435f62d8
.xword 0x53536ca852053e5f
.xword 0xfeb218deb018eef6
.xword 0xf59066146f77cacf



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
.xword 0xc4f1f1964008edbf

.xword 0xe55cae3c0436ee72

.xword 0x4910564327617f69

.xword 0xbd672acaf6ce5278

.xword 0x7a5e86b481af432f

.xword 0xec387fac2235cc36

.xword 0xf6bd7a8e27740996

.xword 0xbe48d67d888c0859

.xword 0xe0e5051f7f26a8ed

.xword 0x23273069dd6dd1f0

.xword 0xc6485ffcff77d60a

.xword 0x1b7a192ebceba2f7

.xword 0x1dcaf2804d9d11fd

.xword 0x3367820df7b5d4c5

.xword 0xa5d11c0facf9ab1b

.xword 0xc27681da13b7a8db

.xword 0x346ba7c71f654fdd

.xword 0x83ab1b1fda07f62b

.xword 0xb291a3987d7b6d74

.xword 0xaaa439bb97367b94

.xword 0x8e7727e449477afa

.xword 0x046704e420d00440

.xword 0x27eacd3691a8170e

.xword 0xba5e3a9a09d0f36d

.xword 0xdfc408f7a4f52cfd

.xword 0x34ccc3845d451fc5

.xword 0x36e4537ce330b157

.xword 0xbd269c6436d27f3f

.xword 0xc475bcb2b4ef4907

.xword 0x2a1547f4cdeb863f

.xword 0xd3ce367562192e94

.xword 0x5b6d17e5220ce60f




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
.xword 0xa0b4f8e0c964e886
.xword 0x3c898966e927d4c3
.xword 0x094ba273aaf620ef
.xword 0x19da66b10800b37d
.xword 0x1e9ac14d5f8d0d1a
.xword 0xa8ab9f53d4e97261
.xword 0x57493c61994777b5
.xword 0x50e451d2a8472c8e
.xword 0x7a34d90ddd0c71d3




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
.xword 0xb080725891265ac8
.xword 0x0f4125c55e4fe19b
.xword 0x2d3621d9a07eed82
.xword 0xe179f0e62d32a51d
.xword 0x1716ea9a31882871
.xword 0xbdca0df93c3a01ae
.xword 0x633cd004d215d783
.xword 0x5aea7ed330e3b3d2
.xword 0x7787ae44c43bf96d




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
.xword 0xbb52ef80d948ea99
.xword 0x56c983aa158a031f
.xword 0xe9520a7756b75bf6
.xword 0xbb12b03d68ece60b
.xword 0x54a9e265e3ab0fcd
.xword 0x7232e0b7d640d08a
.xword 0x82dee388e331cc16
.xword 0x0d5e5b0f07ed6784
.xword 0xd90cd521ffd37939




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
.xword 0x24b09cc599877b11
.xword 0x533e5ae90014fff3
.xword 0xd71e0c0f4e952362
.xword 0x957b10394cfd8605
.xword 0xb3d5652223147c82
.xword 0x18adb2de2c6f35bf
.xword 0x18387632b7f9c12e
.xword 0xc4ae076abe242c1c
.xword 0x6ee481259abc927f




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
.xword 0x51540b87ddb2b9fe
.xword 0x805e51df006198fc
.xword 0x7adb00fa97ed6c60
.xword 0x3183aa2a83aab493
.xword 0xcfbaae55211ce909
.xword 0x59a68c8a57b7a4b5
.xword 0xa9cfd03b5c7af05a
.xword 0x0f3a1651c513563f
.xword 0x1867d88bd91ae21a




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
.xword 0x6b67d89f7d9dc7cf
.xword 0x9922ed561f4320c4
.xword 0xe9f53a444e44aa61
.xword 0x11493a1ae3d06924
.xword 0x2d8959a0ff0f3d4c
.xword 0xabc7b5855bc732b0
.xword 0xfb5fee33b2decd1d
.xword 0x0616dd0b2e95feb0
.xword 0x127b6e0ba38c92be




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
.xword 0xb675fc0334b77dca
.xword 0xc3aa5efb28833f2c
.xword 0x8d91c07584306cc6
.xword 0x7f346a1bc8bf3ee2
.xword 0x1ce827fa3e75540a
.xword 0xdb3d0e6642855d8f
.xword 0x4c8272b4ca29b48f
.xword 0x3d4bdc0e445b0473
.xword 0x1c252d1eb8822f85




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
.xword 0xf6257b4a842173c8
.xword 0x5b4c77a9389026b8
.xword 0x0145775d83c9ab46
.xword 0xc2a7a4dcc218adbc
.xword 0xc80783bd1bb537a9
.xword 0x505f754c7ee00622
.xword 0x289cdf4c33c5a3fb
.xword 0xf42cebee19845850
.xword 0x1d0ccce262f32899




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
.xword 0x58b7261c3836e017
.xword 0xdbe53a7560aea771
.xword 0xc506ee73a83d80e8
.xword 0x9365621ab78c5597
.xword 0xa2fb24b080f52998
.xword 0x3d5d1ffab6046971
.xword 0x2d9ad7e1cd77a2e9
.xword 0x55f7ec1aac894fe4
.xword 0xde7c49241b201942




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
.xword 0x0d5e9625c8006d59
.xword 0x79957cf4eb8ea4ec
.xword 0xeaef747457462bea
.xword 0xc992b476b9cf2ce0
.xword 0xb2aa606f83039a11
.xword 0x829c63d6ffd4d1e2
.xword 0x85f2f4dc63bd2462
.xword 0x6ec7a3881da0fa21
.xword 0xd601033fa774e28f




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
.xword 0x3bfab20344574080
.xword 0x0ae6d01d2f57d721
.xword 0xcfe7f435592937b8
.xword 0x13a0ce98f6501be1
.xword 0x4fe4c58cfb0218d0
.xword 0x14a014881bab54fa
.xword 0xca6f854601a666af
.xword 0x960a1a7b007866d5
.xword 0x8b19e1166e95d54f




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
.xword 0x015d4335f7829297
.xword 0x1fdb2643deee1130
.xword 0x306b5ab78775aa12
.xword 0x31e986bafd058c16
.xword 0x1882756d4ee59de5
.xword 0x5a6c3e500a8ce0fa
.xword 0xa7b5b0a24c619959
.xword 0xd404d2cd053d1169
.xword 0x5a7e53d9c01dbd5a




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
.xword 0xeea24c58d819b043
.xword 0xe56ffc971615acb9
.xword 0x9546f516cdbc9a12
.xword 0x1f7c78f6dd9f05b0
.xword 0xca5c85b31bb1d7ab
.xword 0xeeaf3d007cf18eeb
.xword 0xd6e2751feb8057c1
.xword 0x3ab1bc84680f5f9b
.xword 0xca39781cea7043ea




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
.xword 0xf8acc7acf516db5f
.xword 0x56f4efac93ec2b34
.xword 0xbda2c82523dde923
.xword 0x0d0669434f806a91
.xword 0xc67d10ea7a73099c
.xword 0x6ec7853de054d54e
.xword 0x123621421f0f726e
.xword 0x811be246e132e2f5
.xword 0xdf71157042089702




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
.xword 0x3741e7ae5df614fc
.xword 0x53cf6ad60f00b146
.xword 0x4ba1e1037a987fa8
.xword 0x5a594543ab90bee9
.xword 0x0d48093ac2cb1220
.xword 0xc78bb7155a42dfd1
.xword 0xe9900e1c04edaac5
.xword 0x1fb93c3cff48b382
.xword 0x0d17d733e3d33836




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
.xword 0x01e7ca4795affb43
.xword 0x65a832fb79967923
.xword 0x91a88a8183a2d7bd
.xword 0x7b17c3886444c55a
.xword 0x2b3283c4260812cf
.xword 0x9b8f80360d391792
.xword 0x1a18a706a1c84ecc
.xword 0xeefc87cfac802da9
.xword 0x9bfb81f608b077a3




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
.xword 0xd2d61d5bde4abf25
.xword 0x9eeb8f55a9bcb2fa
.xword 0x1d3a609cd682f3d1
.xword 0x0fff442c0b8eeced
.xword 0x3821dfd531ce80bf
.xword 0xd0bb7e33b0a40ad3
.xword 0x6f723e64c7d08075
.xword 0x2f58076f87c5a589
.xword 0x61f8970fd1837f26




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
.xword 0x82b86cef229d6b90
.xword 0xd2e11985c7cbc7bb
.xword 0xb30079c1ba6bc42a
.xword 0x4a3c48d2d732312a
.xword 0x30b0436ba6f88123
.xword 0x4d9afda9f81b8df8
.xword 0x34996c717dcc2627
.xword 0x1f90b0c45188997d
.xword 0xb9c66d237d2bacb3




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
.xword 0x7b70013640d343e9
.xword 0x09ce26eca8964497
.xword 0xd729c63b5def6315
.xword 0x421d7db3b9da8069
.xword 0xd4b79daae4fc239d
.xword 0xcf379fac5e647a37
.xword 0x1487ad35fce92318
.xword 0x81de34c845c11368
.xword 0xb39dd9a3e45432d6




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
.xword 0xf11931be8d5de36b
.xword 0xfc3b23502fec1ff5
.xword 0x88a2e832f2e77ef6
.xword 0xfe6c6aeada629008
.xword 0x7409aa1f58d7a5f0
.xword 0x05cb6c05b49b38a7
.xword 0x8b2b0695c7364aef
.xword 0x93303aca256dd142
.xword 0xe5d8e8f1063aef3c




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
.xword 0x9725c4ccfb5302ec
.xword 0x36a3328b80963926
.xword 0xb5a6b2ffc29f42e8
.xword 0x3377a4449b5533bb
.xword 0xbb083f221ebebd82
.xword 0x5462fee96e2b0367
.xword 0xe3f5123ff4ee7bbd
.xword 0x01d3f5a4ab61d19d
.xword 0xfa068b654b4748b1




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
.xword 0x792c54fa00f94221
.xword 0x68f8f699ae7a3fd2
.xword 0x4b98fa6813832a64
.xword 0x92f103799f6008f4
.xword 0xf9f6aae915a07fd3
.xword 0x79b95deb5d9b43d5
.xword 0x3fc07ba7bd4596cf
.xword 0x22219f107b2053ab
.xword 0xbe203d5915ac09e6




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
.xword 0x5f998160a0bc32a3
.xword 0x34aee0ff674fac90
.xword 0x9a6ac9d207413068
.xword 0x074ccf8876c879d2
.xword 0xc0fffb7a6f8918da
.xword 0x2381cdf2f4836521
.xword 0xcab920f907d572c1
.xword 0x755947719d0c4aac
.xword 0x26ae77d237bd3572




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
.xword 0xf9cf2fd6c226b16a
.xword 0x92f9686a12b89558
.xword 0x8692a1408b1e658c
.xword 0xadf3813cc53523fb
.xword 0xf763751f352401c8
.xword 0x19f664039b52650e
.xword 0xd44408ffe2538410
.xword 0xf4b6e9cafa001327
.xword 0xed8aba71843ff48c




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
.xword 0xe1b8de9a692959e6
.xword 0x04a18ce812721aa2
.xword 0x380b6b1c3d84f370
.xword 0x8c5db79b00e710e1
.xword 0x528436ac7b8a9752
.xword 0xb41635a1698e02ef
.xword 0xc1a1a7d06fc459c2
.xword 0x0047cf4ee61a6cb2
.xword 0x32a035907b67a4bb




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
.xword 0xbfa053a53ff5cc6d
.xword 0x3e955b50bb32e0d4
.xword 0x23dfa0873d2035a1
.xword 0x9b132754e8c6057e
.xword 0x2165b738e417019a
.xword 0xc2974dcfaedad102
.xword 0x565f6cb843b62068
.xword 0xf986973c15f79cff
.xword 0x939d2ec78dd976f9




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
.xword 0x44a17fd574087e10
.xword 0xb5afbfd8585e293f
.xword 0x818e3d9fa9557ad1
.xword 0xf503ba6b9f9c9289
.xword 0x75e93cd7c6a47060
.xword 0x34930d164398ab61
.xword 0x67ca2574be9493b1
.xword 0xaadea8dc9af7f272
.xword 0x9c9479e739d20d91




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
.xword 0x611f22c30d87827e
.xword 0x97bb9ba89ef114a4
.xword 0xa440a03bf901a5b6
.xword 0xf2f85c2ac8f3c545
.xword 0xf48d76a00c9925ce
.xword 0xe952f14d986c7fb0
.xword 0xad3acdf26ebe1801
.xword 0xc7f07b18c64aba29
.xword 0x2e0960453d0e58c8




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
.xword 0x52fa84e6160f8485
.xword 0xd55da2b0047837e0
.xword 0x0f8765856c030d7d
.xword 0xb86a61c9a03a26b0
.xword 0xaacc3725f5f457b4
.xword 0xa70c3008e55e963b
.xword 0x0f89e80ef939b061
.xword 0x0beb22a13c5a7ffd
.xword 0x48d0ce5f99bc2753




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
.xword 0xb9444f8c6e989724
.xword 0x1f9d02a853e26764
.xword 0xadd5f6e23ce82553
.xword 0xb3395f9149a8f647
.xword 0xb2bdc113a1e9bd18
.xword 0x016535978c3e216c
.xword 0x0b2a541cd46e16c7
.xword 0xbcdd190b7a1c5b53
.xword 0xa221e6d968d4b88c




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
.xword 0x87ef7b8b28696d91
.xword 0xdb80d52b5978ce21
.xword 0xe30132f4c45a3f46
.xword 0x5ff5c139a53bacfb
.xword 0x468d3ee4ceddb36c
.xword 0x59a626c07b9bd92f
.xword 0x8c5ebcb52fa16ce8
.xword 0x5a535615e05c6c4a
.xword 0x70f7d4ab5f6c8a73






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
.xword 0xd13f1211d688dc0e
.xword 0x5ebb9ac9163c67df
.xword 0x95e318b08869c5bd
.xword 0x965cce6b18827308
.xword 0xcdd1d436d7557a39
.xword 0x7f98463e056c3d11
.xword 0x164cf2368d36c111
.xword 0xeac8e87d3095e68a



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
.xword 0x762dfc63ee8ca6f9
.xword 0xb281eb4fd791eb40
.xword 0x8eec45937514bea1
.xword 0x5cfa3e2e2f436237
.xword 0x2281396a6929cb69
.xword 0xf5154cb378b80dc7
.xword 0x35eeecfcc09a6a33
.xword 0x33c1162437d88387



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
.xword 0x8ccb543d5022273a
.xword 0x2580c8443fda198b
.xword 0x0977743816e0bb51
.xword 0x65d0e2f90f318e40
.xword 0x7ce09fe2f1cb00d4
.xword 0x6e5c7410304a92b3
.xword 0xafcff12ef2eff248
.xword 0x60582e06e40bb8f2



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
.xword 0xbce054a80dafe614
.xword 0x0122f111cfc6ebef
.xword 0x1a0e21e9ccfa2de7
.xword 0x384d343d3f227dfa
.xword 0x3b684c8817305f64
.xword 0x91c741f7702922ee
.xword 0x038adbb3ad8b4f2e
.xword 0xb995bdcfa059ad54



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
.xword 0x483b0badea9b188d
.xword 0x3aae79b2e07d184e
.xword 0x9481e7e3c9479b5b
.xword 0xa9f3660e383e8582
.xword 0x70c8f49551dc2e9e
.xword 0x20171e33cd8024c9
.xword 0xc6f5e20bebdb9cd3
.xword 0x786cd5c301da4f83



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
.xword 0xd38c2355de8ed1c4
.xword 0x2aa2c1bb2e4291ac
.xword 0xf4010c8ee2f08700
.xword 0x095076c9215c8742
.xword 0x2d80c60c95cf8cf7
.xword 0x1ee13da152dc70a1
.xword 0xb7f982fd331acf37
.xword 0x3f2b19611ef609b9



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
.xword 0x72cc8bd1414e53bb
.xword 0xbe8e215f4f9dabbf
.xword 0x71dae35c89101c18
.xword 0x5a7f2ae63ac3ed70
.xword 0x3adfda8d9c035c13
.xword 0x97814b2bb1b8fdfb
.xword 0xf91334a11baf4681
.xword 0x818734e1151b42f2



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
.xword 0x87e11700ac8a9d9b
.xword 0xb4ccdc4271c37ac8
.xword 0x06349630363a821a
.xword 0xc77458038dc2bf66
.xword 0xd952b2dd4c2a89fb
.xword 0x6e79241f1aab44ec
.xword 0x2566b25b71273d8d
.xword 0xccb1b364f5ffafb3



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
.xword 0x9c7e0f570722ffc2
.xword 0xba64817763807f74
.xword 0x76e88b8bc21a623b
.xword 0x376a7306172c1f95
.xword 0x5ec7d616e9103a7c
.xword 0x0c5ac814e9aea73c
.xword 0x102d65f0272a48a4
.xword 0xa2c0ce2db5ccb466



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
.xword 0xed79c7b7ddf0b1a7
.xword 0x1a78dc5dc3fb023f
.xword 0xe523d93b223794df
.xword 0x9524fee160635768
.xword 0x0075c1c2b49664f8
.xword 0x2f5314717f6f06d8
.xword 0x3b8fa132b2fb0e0b
.xword 0xc8e7bed69874eb5d



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
.xword 0x1871720db91f6cc0
.xword 0xc40c49608e4f2d2a
.xword 0xbfd71ac517d43f19
.xword 0x75d66bf3ad336236
.xword 0x0e73b9f924dad00e
.xword 0x4cc48bdd06f34881
.xword 0x177c1fdc06d79b61
.xword 0xffc10cc45ce31af7



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
.xword 0x053dd61f69487292
.xword 0xd22a296a56651cca
.xword 0x92d09407b60a2801
.xword 0x6cda3c40afb1e350
.xword 0x1ac690157fbb8784
.xword 0x436bcaff93f9e9ca
.xword 0x70bd074583f1880c
.xword 0xb125fe279a607e42



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
.xword 0x7c5db1a85e75d18d
.xword 0x62f0a240b2bf2ca4
.xword 0x445f2401adb15959
.xword 0xfb810392c0372532
.xword 0xc7799bf7a2f0823c
.xword 0xd8b27823fc83d8bd
.xword 0x8cb9d5c8fe4e21d6
.xword 0xf6de6b8c0f2436fc



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
.xword 0x0a9a8a6efba1513a
.xword 0x90dae865153be5c5
.xword 0xd3ad20feb8432150
.xword 0x6963a58bea29f224
.xword 0x814b73ebaad3c961
.xword 0x50119ce8a03d061b
.xword 0xb20e0f575baf446b
.xword 0xb88b9cbbd3f5ffb8



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
.xword 0x994948d59a832d43
.xword 0x276bb6bb92afc7cb
.xword 0xf4f986793f21b8f9
.xword 0xc835517cb9db630c
.xword 0x6aa816af5009a055
.xword 0x37522ac1051d58d1
.xword 0x990e417eef0c9c27
.xword 0xdc99c9ad01e5b050



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
.xword 0x2ee74ad6aad3c50d
.xword 0xf1d401bb207ae975
.xword 0xd9335e0ee5414913
.xword 0x61d348c6b5eaf803
.xword 0x33d4987df5552221
.xword 0xe3a45a410910c85d
.xword 0x9d330f934db41fc2
.xword 0x0bff821ae24ac436



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
.xword 0x240a879c36734cf5
.xword 0x53b80cb5e673b9a3
.xword 0x84ea24172fb9f030
.xword 0xba0881d4076c8d52
.xword 0xbbb87db1213170b1
.xword 0x2271afee40f37233
.xword 0xba9183c1bd7bd1f3
.xword 0x0d00c672bfb324af



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
.xword 0xbdf8291606d3427d
.xword 0xd667521bd71c8929
.xword 0x5392de2ba5b9d998
.xword 0x8ad82012ff6efc77
.xword 0x2917def67d38f20e
.xword 0xdfa65b42b6c4d418
.xword 0xe32dd025d88ccf04
.xword 0xf40e9fa9e254a45f



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
.xword 0x6cd2cdf7a8dfa051
.xword 0xa665abaeca3c98ef
.xword 0x348fcdde3e76463a
.xword 0x81c65dfcf0ccf5f7
.xword 0xb72b3deb7602e862
.xword 0x1f10ff02708674e6
.xword 0x6f928683f57d3330
.xword 0x690230f3d065646d



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
.xword 0x5d12e948b9c1aa9f
.xword 0x50d7442e31a9cc5c
.xword 0xcc927a13686eb50f
.xword 0x1bca807ad0ffcc75
.xword 0xef1351af6ad88f43
.xword 0x2a357ae0ab4f2f09
.xword 0xc82b93c87120b358
.xword 0x63feaf6616e6146a



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
.xword 0x0ecb1df08f348ad9
.xword 0x06656273fd66a9b2
.xword 0x912db3c63c382f63
.xword 0xeccc77b3b04f78f9
.xword 0x000716a3e63389e3
.xword 0x6d5f18ddfbbf544e
.xword 0xfcf9fe6a7dd6e5c6
.xword 0x136f9a5b30df9287



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
.xword 0xd1f22255ccc8948e
.xword 0x566d649b1d16c05d
.xword 0x481ccc32eee2636d
.xword 0xfc586d023178570d
.xword 0x8eaa32104faaa682
.xword 0x8f58ea7ef845141f
.xword 0xa7ceeff7d72e07ea
.xword 0xa4fa4a59bf6f2070



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
.xword 0xaaebe423729d7a8c
.xword 0xb05a2555e6bc4bb7
.xword 0xa58956e792965801
.xword 0x6b82ce229030a469
.xword 0xe714c41269648d4c
.xword 0x60b2ff84675682f4
.xword 0x51a8ddf494570190
.xword 0x1e7dadb5a19ac689



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
.xword 0x60b8da3d52dc9a03
.xword 0x19baa1e11bf3e9b6
.xword 0x7c8d977cd6555914
.xword 0xac0944d2a563e9ec
.xword 0xa64f7038876fb430
.xword 0xbfb83a9cd85b21ac
.xword 0x724d413fbc7ee635
.xword 0x693976291b3aad4a



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
.xword 0x6551a2439d7f6dd7
.xword 0xbb36c56a6437c234
.xword 0x200cbee8c658437f
.xword 0x09cf96ec465ff107
.xword 0xc90d3236c585b758
.xword 0xbaf332efd6a94298
.xword 0x15c72011228cd3e8
.xword 0xbe491e08f88a58ff



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
.xword 0x126d579aabcaa0df
.xword 0xe731f50b7f8d7073
.xword 0x2c221c1ac101c6cf
.xword 0x725290cf0b2ab5c8
.xword 0xe92dffae724b9808
.xword 0x1ffb1325741c3455
.xword 0x5522e3f119668347
.xword 0x03d2a28ce34e70df



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
.xword 0x1912ec828c87e253
.xword 0x909cfbcf7b89daaa
.xword 0x870afd89f4ba8302
.xword 0x483c6ae9850a2de5
.xword 0x55b9bd24b0b89214
.xword 0x3f82ec939c60d134
.xword 0x14fb68a1bffedd81
.xword 0xcbbb2dfcc355cd0c



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
.xword 0x556c2f8487baac49
.xword 0xb29a7541d0b5c1ac
.xword 0x806eae1adf756994
.xword 0xec22d219686ab945
.xword 0xe7e8d8aeca28b2ce
.xword 0xa0e3212540871c96
.xword 0xb523b71aaa5c66fd
.xword 0xb58dfc9df2c756d2



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
.xword 0x4981aebff2901b68
.xword 0x1ff00079eed81af1
.xword 0x02ccfb3c1e857227
.xword 0x72adb97b021a50f6
.xword 0x599902fe62443bbb
.xword 0x2c42876522b91c80
.xword 0x3e1b0ba323aa4d21
.xword 0x5ff98edeaa8aa8bc



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
.xword 0x6ab293f412375f23
.xword 0x62f7162f3ce73f1e
.xword 0x38ce5d5b4ab6189a
.xword 0x67886d85b3b6ae96
.xword 0x0d2d777bb3fd7476
.xword 0xa66610daf3719803
.xword 0xea4955e7efc83d9a
.xword 0x497a108a05c98fa6



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
.xword 0xe22865498f9bf9c5
.xword 0x99279a3fcdfdda3e
.xword 0x0f113894fb751b67
.xword 0x9b74dc97f78ae929
.xword 0x74e6f267cbc1049a
.xword 0x1e5470d225332d73
.xword 0xfefb66a164f64709
.xword 0x72d297d8b4bb9243



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
.xword 0x35f9d830e4532df8
.xword 0xd78cdf35813204ca
.xword 0x90bab0744077ef89
.xword 0xf2a9f910e1e8741f
.xword 0xe057cedb29cc6665
.xword 0xe7c4b8c1c5b3e565
.xword 0x176fe0aef7d858e6
.xword 0x01d91e2d3920afed





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
.xword 0xa5378592c459e776
.xword 0x6a346ffaeef34738
.xword 0x0aa868b8e6f87512
.xword 0x8ad44f4f3692eaa3
.xword 0x555a456f9823fefc
.xword 0xaa410a35501d9db9
.xword 0x4c4315de6c65d7e5
.xword 0xac1a37247f644fad




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
.xword 0x0c75c727cdff2928
.xword 0x1e25dd514e7580fe
.xword 0x7731084818b6ff4f
.xword 0x6eed6b625bfc4d91
.xword 0x8801f1d0e94e2464
.xword 0x78fdaf99a0ba74a9
.xword 0xff97cb7d9c634399
.xword 0xcae94af1bb6de687




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
.xword 0x8901c09c2b08c1bf
.xword 0x209cca447744af79
.xword 0x963248a7841c4e0c
.xword 0x8cf88c5a9103948e
.xword 0x59c4d8d9cf658b64
.xword 0xf77deae4c1f77997
.xword 0x4d0be636de40b33c
.xword 0xe51278c6a9f55836




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
.xword 0xead9c7af18abf099
.xword 0x5623d49b9e4a6d41
.xword 0x754e600cee9cff17
.xword 0xb547bd3da464e4b8
.xword 0x519cfa5653d69174
.xword 0x7b96478ecae69c02
.xword 0xb33b73a3773c39bd
.xword 0x56a9e69af30b13e6




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
.xword 0x8c798bb75d510b52
.xword 0xec4ecc6127601018
.xword 0x7995ff4b15af72e9
.xword 0x560e18014084a6f0
.xword 0x7d61c7c53a545b80
.xword 0xc1c684e58f969bc0
.xword 0x7501677253dd34e6
.xword 0x5d1eee642a6c6bab




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
.xword 0x36d2ffe4a1141220
.xword 0x0d010fce1b29f45b
.xword 0x0ee6d6d85a91513b
.xword 0x8d9900b86b7f0182
.xword 0x6d0d6768e4e27720
.xword 0xa7ce1008d5deb867
.xword 0x5f8db4f8bac0bfa1
.xword 0x4f4c98acd70fcf0d




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
.xword 0x465f39056cdbb4e2
.xword 0x513183037d40f6d3
.xword 0x06c6d657930aecd6
.xword 0x9f2b2348eafd7e34
.xword 0x7b1ce06d8cc491b6
.xword 0x5b372419eab4e6a8
.xword 0x83f7131ca76896e8
.xword 0x2453f75130504730




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
.xword 0xfc757bc5ebf31018
.xword 0x518f9d137552e78d
.xword 0x625b81b55e385233
.xword 0x5d5cbb6241ca2330
.xword 0xef8c92daf6b3f3ce
.xword 0xe4a731e25d7ab0c8
.xword 0xf823000784f41d79
.xword 0x74dc37ea6ada5558






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
.xword 0x5daa48f66ed018e9
.xword 0x0beebe4bcbde4535
.xword 0xfdefd6f7419bd3b3
.xword 0x1f800bec3086d7aa
.xword 0xc81c80c726f094f2
.xword 0xebf0c22fc743a2f4
.xword 0xa48a3f31bef2eadc
.xword 0xb6fd9600adb488bb




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
.xword 0x9416c085930d44c6
.xword 0xca601f9bf2534ed4
.xword 0x0d8637897b28b83c
.xword 0xb76e789758c875a0
.xword 0xcbc0fea812e2fd1c
.xword 0x3e9c088800152b5d
.xword 0xe9b98a1cd3682d55
.xword 0x8863470d79d48c0f




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
.xword 0xbacaf1eada2821fa
.xword 0x27c3588c5ddc6b94
.xword 0xb1cb91a7fca6136d
.xword 0x870289f294409555
.xword 0xf468f2a339a442be
.xword 0x07bf846e94af9832
.xword 0xb1dcfef76769b9ec
.xword 0x1a4a8d2a73faa99f




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
.xword 0x123168e2ef2ea284
.xword 0x1e64d1858ebef763
.xword 0xd0e22a10f051eddd
.xword 0x41cb3abd9c6b6822
.xword 0x2407c09c45d2131b
.xword 0xdb5b75e7ec3d2156
.xword 0x81f99d1883ff3587
.xword 0x29d80ccffb9bfc9f




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
.xword 0xa035601ec7f6359d
.xword 0x4378db3beedb8165
.xword 0x381c423509684f48
.xword 0xa9af6c01e9eefc62
.xword 0x057faa65387663ab
.xword 0x5757b6be219034b6
.xword 0x9cb33a1898733bcf
.xword 0x988931c35c3ebf22




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
.xword 0x60cba05ed509165a
.xword 0xd363d2e7215eba00
.xword 0x91c0884410d30d4c
.xword 0x80c292cf2cb8dc41
.xword 0xa4b3dd2450431223
.xword 0x683da4d1b4bf01d3
.xword 0x186ff682470f082c
.xword 0x4f417dfa490d6ce1




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
.xword 0x7d1636c8f08b6cb4
.xword 0xbdfcebd1abd4d2a0
.xword 0xfaeac52e4bb97a34
.xword 0x0a4508c74404e2ee
.xword 0x8135104b5548f8f7
.xword 0xaa5b1cc3f4a91e58
.xword 0xf3f2b578a34db01c
.xword 0x1f5ec0b3b79df6e3




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
.xword 0x6c1060d4ba1a70e6
.xword 0x3d6ad2039b4dd3da
.xword 0x47c7aa922fefc61d
.xword 0x406b964284ffff5c
.xword 0xb4b0bd555c1dbb53
.xword 0xe3a670553d39c393
.xword 0x321d60ff7e10f88f
.xword 0x0e23f381f2121ea2






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
.xword 0xdead6ea3cf3ab3bb
.xword 0xe51da3e59e66bf1d
.xword 0x7bc963b57b752389
.xword 0x2b42456e09bd9638
.xword 0x282bfc4a2026cd92
.xword 0x1c71b3c8be83ac55
.xword 0x7ffc2e4b90a966ee
.xword 0x29f3cbe1e5748b2f




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
.xword 0x41d34b0225d3fe86
.xword 0xe6ff73857ee85caf
.xword 0xcac931b9edc0d0cc
.xword 0xcdc36ef167433b10
.xword 0xebef7742c7383ef6
.xword 0x0db64dd97a5d4c96
.xword 0x45abe3ba70bf3f68
.xword 0x6f3eac2506f8b9bd




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
.xword 0x798fef354e9d3d2c
.xword 0x56505c2e20c4f4a9
.xword 0x47fa80ebd02cc4de
.xword 0x9bfb7b7bfa9ef5f1
.xword 0x04952532f7a582d0
.xword 0xf1ff801f34991a66
.xword 0xe66a9dfdd6007c8f
.xword 0x64f1deb0a44a4e78




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
.xword 0x59a1ec7c03ebce93
.xword 0x4bb3e9daf72a35d2
.xword 0xb2411abdb52f2b3f
.xword 0xf8e6c47d102564db
.xword 0x0ed77673685f2f18
.xword 0xdb06b1143293528d
.xword 0xb49fd79f516b2c67
.xword 0xa23fd1bf5b3532c2




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
.xword 0xe046ac351e0b60cf
.xword 0xd2b6edb530c8d075
.xword 0x6366823b586784f7
.xword 0x7a444d4a9feec53b
.xword 0xa4bbde8e6363f26e
.xword 0xc912f3d282825d72
.xword 0xc44bf02348e1b78f
.xword 0x755b3d30669a695b




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
.xword 0x500d365b838f6c8a
.xword 0x58bf7105d137023a
.xword 0xc7e68c449a8b287e
.xword 0x9ff8a195964a714e
.xword 0x1b88dc4049011abc
.xword 0x9a598c1f27476d01
.xword 0xc0186feb2705aa90
.xword 0xfc048517d22e946f




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
.xword 0xf7dfcc7115d916c5
.xword 0x9f9c267fef97a36f
.xword 0x8c8b09bc36a31d95
.xword 0x3825692ff2e5ebb9
.xword 0x3306e69dbf2fc9fc
.xword 0x74247f2dbe00b3c7
.xword 0x548c4224ecb6e401
.xword 0x55635c687aa4f413




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
.xword 0x4417a74994a579c2
.xword 0xc2e2c26b12d8ee1f
.xword 0x2d72656e11b9fa30
.xword 0x944d641104d02500
.xword 0x6a732226ed6f4b82
.xword 0x323684c65a855a4a
.xword 0x9b8de4655ce87dfc
.xword 0xcac905fcfbab0882






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
.xword 0xad87d720e485a543
.xword 0xb1a5504c61108f23
.xword 0x069b1cd57b5bae1a
.xword 0x90a196357100032a
.xword 0x84d4fa0f33a61d90
.xword 0xebdecd618ef07103
.xword 0xb090479b120bdfb6
.xword 0x9afc555c21b5a33b




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
.xword 0x619de9cb4bc7a1b5
.xword 0xda8807622caa947f
.xword 0x673eea0d46f38d3a
.xword 0x1fb115aa8c11458b
.xword 0x08d2a2042114bfb3
.xword 0x0c117c01e945ad34
.xword 0x1c57c7ffdef8a93c
.xword 0xbed8776a3a0dac1b




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
.xword 0x19809e2ad0bb610f
.xword 0xdadc6e529e7f76b8
.xword 0xb0314806afc43056
.xword 0xcd1cb45a2fc74f1c
.xword 0xe7be6ae19317b715
.xword 0xc5c18eec58fd5346
.xword 0xab40bd49a665aec5
.xword 0xc77351dbcb8a11e9




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
.xword 0xa5131999155c867a
.xword 0xfc9ac3c7943ce901
.xword 0x743bdd256f44baf6
.xword 0x07444e7e215cce42
.xword 0xe221aadbd90a5cc0
.xword 0x522725b7672dcce2
.xword 0x3cb22dd2a12b632e
.xword 0x0191ced935e1c3d0




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
.xword 0x1f9706da5b555b3e
.xword 0x782186da0a6aadd6
.xword 0xa583e6e6eb6db805
.xword 0x8ee6b458e2fc1211
.xword 0x297358cfa56a20c2
.xword 0xb80828d2016ad0ac
.xword 0x41ac2ffd84b88558
.xword 0x695b76a4e1a0f63f




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
.xword 0x30eeaec99c5835e2
.xword 0x088396890ddc2547
.xword 0xf38959db0287aa0e
.xword 0x07c9b73437b9cdd4
.xword 0x40aca0351a29009f
.xword 0x3a41e37d40c2383c
.xword 0xdaa7831f9ee77bcd
.xword 0x954a86848fc6ca9f




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
.xword 0x457e613ed0013bf1
.xword 0x90e8a719c55027da
.xword 0x794b4a7a7556b663
.xword 0x68158d2337a80862
.xword 0x9dea7e5e47de8f6b
.xword 0xa466e90fdf3a05a3
.xword 0xc36987b5d4b50d9e
.xword 0x8934e4daab787226




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
.xword 0xc2ff8274b03eabea
.xword 0x0ab49e50c77e482e
.xword 0x050495f0d5f70619
.xword 0x3173ced153725091
.xword 0x594dd724e0ec148d
.xword 0x58dd12330c1e4462
.xword 0x44eb6fdff882ec89
.xword 0xda68e9b9bc3ff7e9






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
.xword 0x88e9fb5f10319b26
.xword 0x27c1ba683c504382
.xword 0x3d304b766654c812
.xword 0x8ed24d62bf5fcf85
.xword 0xb77d1c2f47fa1190
.xword 0xe7b4471a32656107
.xword 0x882727fa2b169a37
.xword 0x6ee704f4fcf71e08




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
.xword 0xd89bffbbd8307a41
.xword 0xd8be3ef4d8e54b56
.xword 0xd130005868d037cf
.xword 0xbeb45b2816f5db7d
.xword 0x13eeec5d998a958d
.xword 0x5b8ec88c36af470e
.xword 0x5b85534c2e4bcc78
.xword 0x192506dd52c5b7f5




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
.xword 0x9db168ffe31108c6
.xword 0x747c32aebeeef48f
.xword 0xe6c0ac80121f8f54
.xword 0x984f6b0991fb82fa
.xword 0xa1491a3407d25975
.xword 0x2884aea2eeaf7ce0
.xword 0x443c3fb97678deef
.xword 0x71f41f1cacbba6f1




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
.xword 0xedeb0106286e1848
.xword 0x6018e94573210c0d
.xword 0xe443cb71379ed459
.xword 0x3c80853a67619c8a
.xword 0x7832f32355be2b40
.xword 0xb2e4019bd1c5738c
.xword 0x5f98686f84953559
.xword 0xff08e8a8c8e1abef




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
.xword 0x85b322b5963bf9d4
.xword 0x293b840d771f393f
.xword 0x8c04246f655313a0
.xword 0xbfcb9f33663d977e
.xword 0xae838e3f46126877
.xword 0x1751fe44f80d77ed
.xword 0xa857dc138dc59e92
.xword 0x290e1e6743e10b6e




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
.xword 0x716b03346a36d01a
.xword 0xff78180ca28f4696
.xword 0x0a096338f2674c64
.xword 0x44985113763b1353
.xword 0xd16434ff343d78a9
.xword 0x08df786272e7a8b8
.xword 0x74c14ba89c8e2062
.xword 0xcdc8e9c11757b44e




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
.xword 0x18fc49abf4310802
.xword 0xfd34a0ee0c2e3b86
.xword 0xf4807836aa75ccd5
.xword 0x0df0a27c3c18ab58
.xword 0x556e03056ad036f5
.xword 0xc50414e2a0b669c7
.xword 0x3f9ea28c1df87ce6
.xword 0x0b25fcaf1bd75e31




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
.xword 0xffdaff053219485e
.xword 0xd0815a219c3d45a1
.xword 0x66e74b13dc767c2e
.xword 0x7ad010e284d7c8f2
.xword 0x7585855a5094f419
.xword 0x4736f73780152680
.xword 0x5ad9b7e42d5773d5
.xword 0x49a9c68f0911dc28






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
.xword 0xbb2fe12349a85053
.xword 0xed88990a9614fd28
.xword 0x9bcd0866d57a2c9e
.xword 0x02c63c9b1da757ec
.xword 0x259351fe1e1e1f07
.xword 0x2d690ab5281523f0
.xword 0xc8ed8c36c77808f8
.xword 0x379fb6483e345d2a




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
.xword 0xdb0a89d4ebc34374
.xword 0xd21878bc3d31c51a
.xword 0xf073e84dcdb72b87
.xword 0x1bac0b731ffd3815
.xword 0x703ebc8e0e7544f2
.xword 0x5b161b689a8fece2
.xword 0x3436fbfb66a352dd
.xword 0xba51bbec683ada25




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
.xword 0x054b63dd94c0f309
.xword 0x9e96be84acec1837
.xword 0xcc5b1f3be08fb950
.xword 0xd402d4e7ffe3e9eb
.xword 0x7cfff89bb30b38c9
.xword 0x9ac2c81cfdd20a23
.xword 0x4fd8489920eff564
.xword 0x0182aeb242839dbe




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
.xword 0x3846b2919ed8fd45
.xword 0x2da2fa68d3c17830
.xword 0x337e1a96043db0dc
.xword 0x59b8a055dd178dd0
.xword 0x71f2712f25f5b311
.xword 0xea6a5c61b33f2c70
.xword 0xab72c5d3b388bfea
.xword 0xe731078a7fcf83bb




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
.xword 0x45e708abcc3d628b
.xword 0x91af04bfc1ae6497
.xword 0x517cf9adf725ec0a
.xword 0x165784e424b77302
.xword 0x19060d6b06e94cfb
.xword 0xcf0100e40ae6e6a1
.xword 0xc786b0e7ea60d960
.xword 0xfef783d60a0ec709




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
.xword 0x6df7d96b424d0403
.xword 0x4bd7516873a5c4e1
.xword 0x68ccaf67e6f724c2
.xword 0x22a7a3226c587866
.xword 0x121a6db7b3a335d6
.xword 0x9d1ab5e52e80af82
.xword 0x9a9f4cdeb613163a
.xword 0x46ee37336533e5cd




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
.xword 0x890f042201ea96dc
.xword 0x4dcd589900c91935
.xword 0xbceca2699f0f2602
.xword 0x45ed87a4cdf828ed
.xword 0xb59eabcf3f5bc1ae
.xword 0x8c0c9686c4d0f719
.xword 0xae3b03af1c0fb872
.xword 0xb2e6d6d30e55d2b8




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
.xword 0x80a2d2791d166d94
.xword 0xe27db4803d62ee7f
.xword 0x99ea6789ebf72f9b
.xword 0xb7f3d84c651fbcc4
.xword 0x0a26c7380a8518fe
.xword 0xdf70efb0b153d68d
.xword 0x87a038bd2fe5fe9c
.xword 0x96b6694920d0e56a






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
.xword 0xe57bdb577e7b1486
.xword 0x139d65f6cf496502
.xword 0x78ae54d606844ce2
.xword 0xec5c1492bacec9be
.xword 0x91479b059b95e628
.xword 0xd2bd6c6f47e7bab6
.xword 0xd553baf770a16d20
.xword 0xe0a0ff7761255d9f




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
.xword 0xf2d768d0c7cea9cd
.xword 0x05682f9e456313b1
.xword 0x4aeaa5cbfa884851
.xword 0x5e9f46eaf8d153b7
.xword 0x728c534b70ace927
.xword 0xb25e68a22bc4b378
.xword 0x7a7ecc2726279d8d
.xword 0xe8cd5b8612744543




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
.xword 0x251c7cd07d6fdba9
.xword 0x7a0cb0d4a597e160
.xword 0xc3a85c5a74daf264
.xword 0x0b17b212d494fb94
.xword 0x524d8ea84f280c6d
.xword 0xafd9f2ad53c95c8e
.xword 0x44882b9f539ccd58
.xword 0x78ee6312c9d4dbd3




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
.xword 0x83b8eb3be2683008
.xword 0xd07b62ea858d3fcc
.xword 0xb12beff841088f97
.xword 0x8709eaebde2f1886
.xword 0x3fffe2a85da2b34d
.xword 0xc54f743dd4d1a885
.xword 0x8779ae6c2fbbbb87
.xword 0x71cdaa12d74a07e5




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
.xword 0xcc4a5f1665ee181c
.xword 0x8bd6166937ddf8a5
.xword 0x4709ec76acdb3777
.xword 0x47b3b626d21eff0e
.xword 0xf4299c3dad5d3986
.xword 0x0ea0ea93536f6bcd
.xword 0xfb07335772dab99f
.xword 0x02c711262ca70f1e




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
.xword 0xc604f0d3fe8c74b1
.xword 0xda088f1f538195c6
.xword 0xd7615a89d9cb28a6
.xword 0xcec29d412c3dd14e
.xword 0xd56a329030471ff1
.xword 0x80e6f4f034c43967
.xword 0x64fe26ac30f1d91b
.xword 0x7ff86b7d62af09e3




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
.xword 0x35a83e70d06cc424
.xword 0x7e588233e720aebd
.xword 0xbbf3526de87aaffa
.xword 0xe6091e369bd533bb
.xword 0xef03e0c78e71167e
.xword 0xb2090f3a99c62328
.xword 0x36cff9f4178a6425
.xword 0xa5cce97420a815ef




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
.xword 0x1a50ca9264c8a368
.xword 0x515d8c86ea299bee
.xword 0xa6855b409d5370d7
.xword 0x3f3672ff3ae388f1
.xword 0xbfee8d968e0d3f53
.xword 0x8be1a8d2b856d211
.xword 0xeafa53dfc20aaa5f
.xword 0xcb519bc7ddef8e52






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
.xword 0x5b24044ac5aebeec
.xword 0xd7867231ea5a5410
.xword 0x3ded77be676df807
.xword 0x36089767b394c606
.xword 0x6f54b102cf6887bd
.xword 0x52a0023ae5b19d98
.xword 0x5a9786e4e4ad5b87
.xword 0xf2b306552345d940




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
.xword 0x97690be57ce25676
.xword 0x3b8247ea417da39a
.xword 0xbecfdd4ac541e184
.xword 0x66bc7c06b8a69544
.xword 0xdd42a778333eacd8
.xword 0x7751edf6f183ecf2
.xword 0xb916c447a3c8078a
.xword 0x59608bb4f6e83e32




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
.xword 0x7b3208f40be1eab6
.xword 0x019e2e677981bd7d
.xword 0xc8c5e88178ce8b96
.xword 0x9a196d61688c5c74
.xword 0xda3124b523ce9226
.xword 0xa4275119bb9855fe
.xword 0xe238655f53c09e6e
.xword 0x8cce52a4aa85824e




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
.xword 0x10bba33b5333b353
.xword 0x4397472f41b69a56
.xword 0xeb218144c20c31b2
.xword 0x944b504c2f46b7d9
.xword 0x124a47161fcb3038
.xword 0x58217502bc8dfd31
.xword 0x780938e1c8f1eda9
.xword 0x4df457d285ca837d




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
.xword 0xe53be86763e92a88
.xword 0x24f9ec40fbad5cff
.xword 0x6251f4fc90d08dfa
.xword 0xc0d0cca97500fb0f
.xword 0xc066b051d5cd7cf2
.xword 0xe4d97e7a332705bc
.xword 0x5e7a4ff5848e664e
.xword 0xc78cdf1c00308844




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
.xword 0xac72f9a3e6dc4ed9
.xword 0x02a089f917dfab60
.xword 0xf2caf1ec26d55b19
.xword 0x2f4fa62a0b3ca9da
.xword 0xda247779977ecf8a
.xword 0x2515deab9ad33b4b
.xword 0xe213aadf3ec518ab
.xword 0xcf027ca860ff7e36




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
.xword 0xc3bc98cb41a2fef6
.xword 0xe12cadd94ad21020
.xword 0x84228e21cb0adff6
.xword 0x619f45f7bdeb287e
.xword 0x38ec849e9e39cae3
.xword 0x9e136cc7392e384f
.xword 0xf57ad29a34b697b1
.xword 0xd1d20eb4ef1cec91




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
.xword 0xa3a0de701af76e54
.xword 0xf5494921ee1e90ad
.xword 0x0d1cebc0613a97bd
.xword 0x341e27cc9f7635dd
.xword 0xf06e5ac1a0908b5e
.xword 0x79c94bd6ed025bd1
.xword 0x15fe781e1e8369be
.xword 0x6ef29c64a3ea3559






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
.xword 0x7b320d5d518aaba0
.xword 0x4605cba42da8095d
.xword 0x7ec889ec6ed74d8a
.xword 0x5ab99579e34a714a
.xword 0x84742b887eeaf206
.xword 0x516c3eaf709798c6
.xword 0x784ec6cafbbb7b3c
.xword 0x8005131ab3f04fd0




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
.xword 0xf2e87e0d3ea78c17
.xword 0xf5c26635ffcf3e4b
.xword 0x556a94c89083b4cb
.xword 0x478d6ac0d90ead02
.xword 0x39d8ee9353fb5072
.xword 0x92201f8bb6e19616
.xword 0x5e006b4e89dd9d79
.xword 0x0fc63b27a4f3bb80




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
.xword 0x1531106fdb7c9dcf
.xword 0x8902599d08c0e1d3
.xword 0x5a5022d6adcd1538
.xword 0xabce725885fc22c0
.xword 0xa4665fe6deeabf8c
.xword 0x287230f12aec8d2d
.xword 0x60bda8bcee135baa
.xword 0x3e4f4f1e077854fd




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
.xword 0xaefc37e0bbe50bff
.xword 0x84ce4762ea35239a
.xword 0x88eeb5332cbaa680
.xword 0x673b19128500c3a4
.xword 0xa9be8bc3be3ee139
.xword 0xf1107d4769fed808
.xword 0x1b38e4479dc0b7a8
.xword 0xd60d8fe7d2531e9d




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
.xword 0xb50c3ee2c2816c61
.xword 0x6983e042882a084e
.xword 0x5eb2d4e032a52cc9
.xword 0x42c7aff57c8ae187
.xword 0x2c4ef168edcfad88
.xword 0xa2bb74c671e6edae
.xword 0x0ed4a3e827656302
.xword 0x4af6e0aae53812f2




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
.xword 0x2ef11192bbe9f2cd
.xword 0xaf54249813a5fb5a
.xword 0x3aef98e318626eef
.xword 0xa4364df8ae6813d5
.xword 0x60411e0934df75a4
.xword 0x606202b7094b9a98
.xword 0xce87c515ef31a0b4
.xword 0xf14261cb154853b9




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
.xword 0xc57b1f831cda3d2c
.xword 0xaf87bbb544642a8e
.xword 0xe2d8199c84833262
.xword 0xf23821eeafdda7f3
.xword 0xa8a11036560cc310
.xword 0x5feedce6fa2b0e7c
.xword 0x8fe9a63b6733454f
.xword 0x493c187190853d3b




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
.xword 0xb1524ccbab53c2ed
.xword 0xbf3b9b3fd7b21251
.xword 0x1111a1119075a368
.xword 0xb7c2efde02969819
.xword 0x483b834751322b3e
.xword 0x31804134c692e326
.xword 0x3d3c8fdb4fde2fa8
.xword 0x4488d65fd5f5d706






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
.xword 0xf7f946c552350499
.xword 0xfc38cba3fc29a817
.xword 0xa9810bd7cfa03c23
.xword 0xe3c87e77192ebe53
.xword 0xd51c36b79435d7c7
.xword 0xe8c631347215393d
.xword 0x9e514712eedde229
.xword 0xd7be763fc4621197




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
.xword 0xdbb9264f57ea96fb
.xword 0x27181936bb18ec1f
.xword 0xca2c2868830a9e6e
.xword 0xa7b0526ac33bfbe1
.xword 0x3514971c20609bfc
.xword 0x2af9cba7b09b5225
.xword 0x4c30a863ff8c3a35
.xword 0x50a433df40009145




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
.xword 0xdbed0183418194c7
.xword 0x9dd21f9f6d96ef0d
.xword 0xec1ea3608ee79248
.xword 0x937eabee245242be
.xword 0xafd36cff81bb0abd
.xword 0x2c279461d93636db
.xword 0x840cb082304afaa5
.xword 0xb91c35730bb364f8




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
.xword 0x17a4485c778ad15b
.xword 0x3405c54326853f26
.xword 0xbb3e297858b2838d
.xword 0x3796b6e6e778954e
.xword 0x76fe0137bd5bc434
.xword 0xee00f438d0496692
.xword 0xdedc23a4d9d2ecb6
.xword 0xbe6a99d2117feb72




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
.xword 0x9c967f95b15ed3b2
.xword 0x3dd0d014f0941797
.xword 0x286e5584c0ee1484
.xword 0x5f57dfe35a7a76a5
.xword 0x28b2620e56e4b7c3
.xword 0xd410b57944d8dce9
.xword 0x47770516cb6652a4
.xword 0xb6f2016e94b7d88f




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
.xword 0xfd43c395acf760ac
.xword 0x57171622484574c3
.xword 0xfe29a5797171d5cf
.xword 0x013c758d349b054a
.xword 0xa7a9ca7f8a28bf1d
.xword 0x7675c0734a9ef215
.xword 0x37c5f7fe14b695d2
.xword 0x8f17ffb90bc9b107




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
.xword 0x200a7a53752e4464
.xword 0x3a0745102fe64251
.xword 0x92d43f9d378e55f6
.xword 0xa3a0fa46eccfedf9
.xword 0x7fe484e8a3eaa053
.xword 0xd4a9361acf42ace7
.xword 0xf9d2b37a468b399a
.xword 0xcc23fa74f6b13abe




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
.xword 0x41c8e66948897633
.xword 0xcf361dfbd0ce2113
.xword 0x2705c30dd0194830
.xword 0xb9dfe185b0c51fed
.xword 0x41a79492544e0062
.xword 0xade12a2aeef7c95f
.xword 0xf5c948fc46581dbb
.xword 0x0d4cf5cf9218399b




#if 0
#endif
