/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_09.s
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
	setx 0x99b2364c5daf9f92, %g1, %r2
	setx 0xae666c12dcbe662c, %g1, %r3
	setx 0x30e04320d4ba1ee3, %g1, %r4
	setx 0xbfe34e8c13c9c4b6, %g1, %r5
	setx 0x5c6026a04feb91a7, %g1, %r6
	setx 0xf4d00beeb5ffe15d, %g1, %r7
	setx 0xc16c743f98eeb910, %g1, %r8

     mov %r2, %r1
	.word 0xc8b4903a  ! 3: STHA_R	stha	%r4, [%r18 + %r26] 0x81
NC_SHORT_FP_SEC0:
	.word 0xc9bcda3a  ! 5: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc9236018  ! 6: STF_I	st	%f4, [0x0018, %r13]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP2:
	.word 0xc8c6421a  ! 8: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r4
	.word 0xc8c4d03a  ! 10: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
	.word 0xc8d4501a  ! 12: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r4
NC_AIUS3:
	.word 0xc88fc23a  ! 14: LDUBA_R	lduba	[%r31, %r26] 0x11, %r4
CP_ATM_QUAD_LD4:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 16: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc8cc903a  ! 18: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
NC_SHORT_FP_SEC5:
	.word 0xc9bcda7a  ! 20: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc8ab101a  ! 21: STBA_R	stba	%r4, [%r12 + %r26] 0x80
	.word 0xc8bcd03a  ! 23: STDA_R	stda	%r4, [%r19 + %r26] 0x81
CP_AIUS6:
	.word 0xc8df833a  ! 25: LDXA_R	ldxa	[%r30, %r26] 0x19, %r4
	.word 0xc9a4d03a  ! 27: STFA_R	sta	%f4, [%r26, %r19]
	.word 0xc832801a  ! 28: STH_R	sth	%r4, [%r10 + %r26]
CP_ATM_QUAD_LD7:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 30: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc99cd13a  ! 32: LDDFA_R	ldda	[%r19, %r26], %f4
NC_BLK_SEc8:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 34: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc82ae01b  ! 35: STB_I	stb	%r4, [%r11 + 0x001b]
	.word 0xc9bbd01a  ! 37: STDFA_R	stda	%f4, [%r26, %r15]
CP_AIUS9:
	.word 0xc8c7833a  ! 39: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r4
CP_AIUP10:
	.word 0xc8ae031a  ! 41: STBA_R	stba	%r4, [%r24 + %r26] 0x18
	.word 0xc8f2d11a  ! 42: STXA_R	stxa	%r4, [%r11 + %r26] 0x88
NC_AIUP11:
	.word 0xc8de431a  ! 44: LDXA_R	ldxa	[%r25, %r26] 0x18, %r4
	.word 0xc91aa018  ! 45: LDDF_I	ldd	[%r10, 0x0018], %f4
	.word 0xc88bd11a  ! 47: LDUBA_R	lduba	[%r15, %r26] 0x88, %r4
CP_NUC12:
	.word 0xc8ad019a  ! 49: STBA_R	stba	%r4, [%r20 + %r26] 0x0c
CP_AIUP13:
	.word 0xc886021a  ! 51: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r4
	.word 0xc99c511a  ! 53: LDDFA_R	ldda	[%r17, %r26], %f4
NC_NUC14:
	.word 0xc89d419a  ! 55: LDDA_R	ldda	[%r21, %r26] 0x0c, %r4
NC_PST_PRI15:
	.word 0xc9bc181a  ! 57: STDFA_R	stda	%f4, [%r26, %r16]
SET_TL1_16:
	ta	T_CHANGE_TO_TL1
CHANGE_R2617:
	add	%r26,	%r27,	%r26
NC_BIS_NUC17:
	.word 0xc8b544fa  ! 59: STHA_R	stha	%r4, [%r21 + %r26] 0x27
	.word 0xc984d13a  ! 61: LDFA_R	lda	[%r19, %r26], %f4
CP_BIS_AIUP18:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 63: STHA_R	stha	%r2, [%r24 + %r26] 0x22
	.word 0xc9a4913a  ! 65: STFA_R	sta	%f4, [%r26, %r18]
NC_BIS_AIUP19:
	.word 0xccbe455a  ! 67: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
	.word 0xc893101a  ! 68: LDUHA_R	lduha	[%r12, %r26] 0x80, %r4
CP_NUC20:
	.word 0xc9f5201a  ! 70: CASXA_R	casxa	[%r20]%asi, %r26, %r4
	.word 0xc87aa018  ! 71: SWAP_I	swap	%r4, [%r10 + 0x0018]
	.word 0xc883d01a  ! 73: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r4
	.word 0xc8acd03a  ! 75: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc89c101a  ! 77: LDDA_R	ldda	[%r16, %r26] 0x80, %r4
	.word 0xc8a2901a  ! 78: STWA_R	stwa	%r4, [%r10 + %r26] 0x80
	.word 0xc8bcd03a  ! 80: STDA_R	stda	%r4, [%r19 + %r26] 0x81
SET_TL0_21:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI22:
	.word 0xc4bb9d5a  ! 82: STDA_R	stda	%r2, [%r14 + %r26] 0xea
	.word 0xc9bc511a  ! 84: STDFA_R	stda	%f4, [%r26, %r17]
NC_BLK_SEc23:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 86: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc8cc511a  ! 88: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r4
	.word 0xc923001a  ! 89: STF_R	st	%f4, [%r26, %r12]
	.word 0xc8ac913a  ! 91: STBA_R	stba	%r4, [%r18 + %r26] 0x89
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP25:
	.word 0xc896021a  ! 93: LDUHA_R	lduha	[%r24, %r26] 0x10, %r4
	.word 0xc8f4111a  ! 95: STXA_R	stxa	%r4, [%r16 + %r26] 0x88
	.word 0xc99c913a  ! 97: LDDFA_R	ldda	[%r18, %r26], %f4
CP_ATM_QUAD_LD26:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 99: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc8bc913a  ! 101: STDA_R	stda	%r4, [%r18 + %r26] 0x89
	.word 0xc88cd03a  ! 103: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
CP_BIS_AIUP27:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 105: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
CP_BIS_NUC28:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 107: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
	.word 0xc99cd03a  ! 109: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc8c4111a  ! 111: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r4
	.word 0xc99c903a  ! 113: LDDFA_R	ldda	[%r18, %r26], %f4
	.word 0xc99b911a  ! 115: LDDFA_R	ldda	[%r14, %r26], %f4
	.word 0xc8bc903a  ! 117: STDA_R	stda	%r4, [%r18 + %r26] 0x81
NC_NUC29:
	.word 0xc885419a  ! 119: LDUWA_R	lduwa	[%r21, %r26] 0x0c, %r4
	.word 0xc8b4903a  ! 121: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CHANGE_USER30:
	ta	T_CHANGE_NONPRIV
CHANGE_R2631:
	add	%r26,	%r27,	%r26
NC_BIS_PRI31:
	.word 0xc4ac1d5a  ! 123: STBA_R	stba	%r2, [%r16 + %r26] 0xea
	.word 0xc8f3d01a  ! 125: STXA_R	stxa	%r4, [%r15 + %r26] 0x80
CP_BIS_PRI32:
	and	%r26,	%r28,	%r26
	.word 0xccb35c5a  ! 127: STHA_R	stha	%r6, [%r13 + %r26] 0xe2
CHANGE_R2633:
	add	%r26,	%r27,	%r26
CP_BIS_SEC33:
	and	%r26,	%r28,	%r26
	.word 0xc8bc9d7a  ! 129: STDA_R	stda	%r4, [%r18 + %r26] 0xeb
	.word 0xc8f4d03a  ! 131: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
BLK_PRI34:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 133: STDFA_R	stda	%f0, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC36:
	.word 0xc8c5409a  ! 135: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r4
CP_NUC37:
	.word 0xc8d5009a  ! 137: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r4
BLK_PRI38:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 139: STDFA_R	stda	%f0, [%r26, %r10]
CP_PST_PRI39:
	.word 0xc9ba989a  ! 141: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc88cd03a  ! 143: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
NC_BLK_SEc40:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 145: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc88b901a  ! 147: LDUBA_R	lduba	[%r14, %r26] 0x80, %r4
	.word 0xc984903a  ! 149: LDFA_R	lda	[%r18, %r26], %f4
	.word 0xc9e2a01a  ! 150: CASA_R	casa	[%r10] %asi, %r26, %r4
CHANGE_TLE41:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
BLK_PRI42:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 153: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc8fa901a  ! 154: SWAPA_R	swapa	%r4, [%r10 + %r26] 0x80
	.word 0xc984d03a  ! 156: LDFA_R	lda	[%r19, %r26], %f4
CP_BIS_QUAD_LD43:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 158: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc922e018  ! 159: STF_I	st	%f4, [0x0018, %r11]
	.word 0xc894d03a  ! 161: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC45:
	.word 0xc8c5419a  ! 163: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r4
	.word 0xc87a801a  ! 164: SWAP_R	swap	%r4, [%r10 + %r26]
	.word 0xc812a01a  ! 165: LDUH_I	lduh	[%r10 + 0x001a], %r4
	.word 0xc884903a  ! 167: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc88c501a  ! 169: LDUBA_R	lduba	[%r17, %r26] 0x80, %r4
	.word 0xc8bc903a  ! 171: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc99cd13a  ! 173: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc89c903a  ! 175: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xc8c3d11a  ! 177: LDSWA_R	ldswa	[%r15, %r26] 0x88, %r4
NC_PST_PRI46:
	.word 0xc9bc589a  ! 179: STDFA_R	stda	%f4, [%r26, %r17]
NC_NUC47:
	.word 0xc8f5419a  ! 181: STXA_R	stxa	%r4, [%r21 + %r26] 0x0c
CP_BIS_NUC48:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 183: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xc99ad11a  ! 184: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc8d4d03a  ! 186: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
NC_BIS_AIUP49:
	.word 0xc4ae445a  ! 188: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc8b4d03a  ! 190: STHA_R	stha	%r4, [%r19 + %r26] 0x81
	.word 0xc8b4d03a  ! 192: STHA_R	stha	%r4, [%r19 + %r26] 0x81
	.word 0xc884d03a  ! 194: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r4
NC_BIS_SEC50:
	.word 0xc8acdc7a  ! 196: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
CHANGE_R2651:
	mov	%g0,	%r26
CP_BIS_SEC51:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 198: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
	.word 0xc8b3101a  ! 199: STHA_R	stha	%r4, [%r12 + %r26] 0x80
	.word 0xc86a801a  ! 200: LDSTUB_R	ldstub	%r4, [%r10 + %r26]
CP_ATM_QUAD_LD52:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 202: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xc8bb111a  ! 203: STDA_R	stda	%r4, [%r12 + %r26] 0x88
CP_AIUS53:
	.word 0xc987823a  ! 205: LDFA_R	lda	[%r30, %r26], %f4
	.word 0xc8c4913a  ! 207: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r4
	.word 0xc8fa901a  ! 208: SWAPA_R	swapa	%r4, [%r10 + %r26] 0x80
NC_BLK_SEc54:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 210: LDDFA_R	ldda	[%r19, %r26], %f16
CHANGE_USER55:
	ta	T_CHANGE_NONPRIV
CHANGE_R2656:
	add	%r26,	%r27,	%r26
CP_BIS_PRI56:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 212: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc923001a  ! 213: STF_R	st	%f4, [%r26, %r12]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC58:
	.word 0xc8d5009a  ! 215: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r4
CHANGE_R2659:
	add	%r26,	%r27,	%r26
CP_BIS_SEC59:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 217: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
	.word 0xc8ccd13a  ! 219: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r4
NC_NUC60:
	.word 0xc985419a  ! 221: LDFA_R	lda	[%r21, %r26], %f4
NC_SHORT_FP_SEC61:
	.word 0xc9bcda7a  ! 223: STDFA_R	stda	%f4, [%r26, %r19]
NC_AIUP62:
	.word 0xc8a6431a  ! 225: STWA_R	stwa	%r4, [%r25 + %r26] 0x18
	.word 0xc894d03a  ! 227: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc884501a  ! 229: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r4
	.word 0xc8dcd03a  ! 231: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
CP_PST_PRI63:
	.word 0xc9bad81a  ! 233: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc8b4111a  ! 235: STHA_R	stha	%r4, [%r16 + %r26] 0x88
	.word 0xc8ccd03a  ! 237: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r4
CP_BIS_AIUP64:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 239: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
NC_AIUP65:
	.word 0xc9be421a  ! 241: STDFA_R	stda	%f4, [%r26, %r25]
CHANGE_USER66:
	ta	T_CHANGE_NONPRIV
CHANGE_R2667:
	add	%r26,	%r27,	%r26
NC_BIS_PRI67:
	.word 0xc8ac1c5a  ! 243: STBA_R	stba	%r4, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS69:
	.word 0xc8df833a  ! 245: LDXA_R	ldxa	[%r30, %r26] 0x19, %r4
NC_AIUS70:
	.word 0xc8bfc23a  ! 247: STDA_R	stda	%r4, [%r31 + %r26] 0x11
	.word 0xc9bcd03a  ! 249: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc894501a  ! 251: LDUHA_R	lduha	[%r17, %r26] 0x80, %r4
BLK_PRI71:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 253: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc843401a  ! 254: LDSW_R	ldsw	[%r13 + %r26], %r4
BLK_PRI72:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 256: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc882d01a  ! 257: LDUWA_R	lduwa	[%r11, %r26] 0x80, %r4
CHANGE_USER73:
	ta	T_CHANGE_NONPRIV
CHANGE_R2674:
	add	%r26,	%r27,	%r26
NC_BIS_PRI74:
	.word 0xc4bbdc5a  ! 259: STDA_R	stda	%r2, [%r15 + %r26] 0xe2
	.word 0xc9a3511a  ! 260: STFA_R	sta	%f4, [%r26, %r13]
CHANGE_PRIV75:
	ta	T_CHANGE_PRIV
CHANGE_R2676:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP76:
	.word 0xc4ae445a  ! 262: STBA_R	stba	%r2, [%r25 + %r26] 0x22
NC_BIS_AIUP77:
	.word 0xcca6445a  ! 264: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xc8cb501a  ! 265: LDSBA_R	ldsba	[%r13, %r26] 0x80, %r4
CP_AIUP78:
	.word 0xc89e021a  ! 267: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
	.word 0xc9bc903a  ! 269: STDFA_R	stda	%f4, [%r26, %r18]
CHANGE_R2679:
	mov	%g0,	%r26
CP_BIS_SEC79:
	and	%r26,	%r28,	%r26
	.word 0xd09c9c7a  ! 271: LDDA_R	ldda	[%r18, %r26] 0xe3, %r8
CP_BIS_AIUP80:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 273: STHA_R	stha	%r8, [%r24 + %r26] 0x22
NC_NUC81:
	.word 0xc9bd409a  ! 275: STDFA_R	stda	%f4, [%r26, %r21]
	.word 0xc9032018  ! 276: LDF_I	ld	[%r12, 0x0018], %f4
NC_PST_PRI82:
	.word 0xc9bc189a  ! 278: STDFA_R	stda	%f4, [%r26, %r16]
CP_BIS_QUAD_LD83:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 280: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc884d13a  ! 282: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
NC_AIUS84:
	.word 0xc8afc23a  ! 284: STBA_R	stba	%r4, [%r31 + %r26] 0x11
	.word 0xc894d03a  ! 286: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc8736018  ! 287: STX_I	stx	%r4, [%r13 + 0x0018]
CP_PST_PRI85:
	.word 0xc9ba981a  ! 289: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc9bc903a  ! 291: STDFA_R	stda	%f4, [%r26, %r18]
	.word 0xc9bb101a  ! 292: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc88c101a  ! 294: LDUBA_R	lduba	[%r16, %r26] 0x80, %r4
NC_PST_PRI86:
	.word 0xc9bb999a  ! 296: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc894903a  ! 298: LDUHA_R	lduha	[%r18, %r26] 0x81, %r4
CP_AIUS87:
	.word 0xc8b7823a  ! 300: STHA_R	stha	%r4, [%r30 + %r26] 0x11
CHANGE_USER88:
	ta	T_CHANGE_NONPRIV
CHANGE_R2689:
	add	%r26,	%r27,	%r26
CP_BIS_PRI89:
	and	%r26,	%r28,	%r26
	.word 0xcca29d5a  ! 302: STWA_R	stwa	%r6, [%r10 + %r26] 0xea
	.word 0xc8d4903a  ! 304: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
NC_BIS_PRI90:
	.word 0xc8bb9c5a  ! 306: STDA_R	stda	%r4, [%r14 + %r26] 0xe2
	.word 0xc9a3911a  ! 308: STFA_R	sta	%f4, [%r26, %r14]
	.word 0xc8bcd03a  ! 310: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc9f2a01a  ! 311: CASXA_R	casxa	[%r10]%asi, %r26, %r4
	.word 0xc884d13a  ! 313: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
	.word 0xc8c3501a  ! 314: LDSWA_R	ldswa	[%r13, %r26] 0x80, %r4
	.word 0xc88cd03a  ! 316: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
	.word 0xc8fb501a  ! 317: SWAPA_R	swapa	%r4, [%r13 + %r26] 0x80
	.word 0xc8ab101a  ! 318: STBA_R	stba	%r4, [%r12 + %r26] 0x80
	.word 0xc8b3d01a  ! 320: STHA_R	stha	%r4, [%r15 + %r26] 0x80
NC_SHORT_FP_SEC91:
	.word 0xc99cda3a  ! 322: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc86b001a  ! 323: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
	.word 0xc984903a  ! 325: LDFA_R	lda	[%r18, %r26], %f4
CHANGE_PRIV92:
	ta	T_CHANGE_PRIV
CHANGE_R2693:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP93:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 327: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
	.word 0xc8c3505a  ! 328: LDSWA_R	ldswa	[%r13, %r26] 0x82, %r4
	.word 0xc8d4913a  ! 330: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r4
	.word 0xc87ae018  ! 331: SWAP_I	swap	%r4, [%r11 + 0x0018]
CP_BIS_NUC94:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 333: STHA_R	stha	%r2, [%r20 + %r26] 0x27
	.word 0xc8b4913a  ! 335: STHA_R	stha	%r4, [%r18 + %r26] 0x89
	.word 0xc8b4903a  ! 337: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CHANGE_R2695:
	add	%r26,	%r27,	%r26
CP_BIS_SEC95:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 339: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
CP_BIS_AIUP96:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 341: STHA_R	stha	%r4, [%r24 + %r26] 0x22
NC_AIUP97:
	.word 0xc8ce431a  ! 343: LDSBA_R	ldsba	[%r25, %r26] 0x18, %r4
	.word 0xc832a01a  ! 344: STH_I	sth	%r4, [%r10 + 0x001a]
NC_PST_PRI98:
	.word 0xc9bc599a  ! 346: STDFA_R	stda	%f4, [%r26, %r17]
	.word 0xc84b601b  ! 347: LDSB_I	ldsb	[%r13 + 0x001b], %r4
	.word 0xc8bc903a  ! 349: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc8d4d13a  ! 351: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r4
NC_BLK_SEc99:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 353: STDFA_R	stda	%f0, [%r26, %r19]
WR_LEASI_100:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_101:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_BIS_SEC102:
	.word 0xcca4dc7a  ! 356: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xc8da915a  ! 357: LDXA_R	ldxa	[%r10, %r26] 0x8a, %r4
CHANGE_USER103:
	ta	T_CHANGE_NONPRIV
CHANGE_R26104:
	add	%r26,	%r27,	%r26
NC_BIS_PRI104:
	.word 0xccf39c5a  ! 359: STXA_R	stxa	%r6, [%r14 + %r26] 0xe2
CP_PST_PRI105:
	.word 0xc9bad81a  ! 361: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc8f4913a  ! 363: STXA_R	stxa	%r4, [%r18 + %r26] 0x89
	.word 0xc91b001a  ! 364: LDDF_R	ldd	[%r12, %r26], %f4
	.word 0xc9bb911a  ! 366: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc884903a  ! 368: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc9f2a01a  ! 369: CASXA_R	casxa	[%r10]%asi, %r26, %r4
NC_BLK_SEc106:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 371: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BLK_SEc107:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 373: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc86b001a  ! 374: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
NC_BIS_PRI108:
	.word 0xc4b39c5a  ! 376: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
CHANGE_R26109:
	add	%r26,	%r27,	%r26
CP_BIS_SEC109:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 378: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS111:
	.word 0xc9bfc23a  ! 380: STDFA_R	stda	%f4, [%r26, %r31]
	.word 0xc8f4511a  ! 382: STXA_R	stxa	%r4, [%r17 + %r26] 0x88
NC_PST_PRI112:
	.word 0xc9bb981a  ! 384: STDFA_R	stda	%f4, [%r26, %r14]
CP_BIS_AIUS113:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 386: STBA_R	stba	%r2, [%r30 + %r26] 0x23
CHANGE_USER114:
	ta	T_CHANGE_NONPRIV
CHANGE_R26115:
	add	%r26,	%r27,	%r26
CP_BIS_PRI115:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 388: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP117:
	.word 0xc88e421a  ! 390: LDUBA_R	lduba	[%r25, %r26] 0x10, %r4
	.word 0xc8a4101a  ! 392: STWA_R	stwa	%r4, [%r16 + %r26] 0x80
CP_AIUP118:
	.word 0xc986021a  ! 394: LDFA_R	lda	[%r24, %r26], %f4
	.word 0xc99a901a  ! 395: LDDFA_R	ldda	[%r10, %r26], %f4
	.word 0xc9ba901a  ! 396: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc984d03a  ! 398: LDFA_R	lda	[%r19, %r26], %f4
CHANGE_R26119:
	add	%r26,	%r27,	%r26
CP_BIS_SEC119:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9c7a  ! 400: STDA_R	stda	%r8, [%r18 + %r26] 0xe3
	.word 0xc984903a  ! 402: LDFA_R	lda	[%r18, %r26], %f4
SHORT_FP_PRI120:
	.word 0xc99b1b5a  ! 404: LDDFA_R	ldda	[%r12, %r26], %f4
CHANGE_R26121:
	add	%r26,	%r27,	%r26
CP_BIS_SEC121:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9d7a  ! 406: STBA_R	stba	%r2, [%r18 + %r26] 0xeb
CHANGE_USER122:
	ta	T_CHANGE_NONPRIV
CHANGE_R26123:
	add	%r26,	%r27,	%r26
CP_BIS_PRI123:
	and	%r26,	%r28,	%r26
	.word 0xccb35c5a  ! 408: STHA_R	stha	%r6, [%r13 + %r26] 0xe2
	.word 0xc884913a  ! 410: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r4
	.word 0xc8c4d03a  ! 412: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CHANGE_PRIV124:
	ta	T_CHANGE_PRIV
CHANGE_R26125:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD125:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 414: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xc8c2d05a  ! 415: LDSWA_R	ldswa	[%r11, %r26] 0x82, %r4
CHANGE_CLE126:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_PST_PRI127:
	.word 0xc9bb995a  ! 418: STDFA_R	stda	%f4, [%r26, %r14]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC129:
	.word 0xc9bd019a  ! 420: STDFA_R	stda	%f4, [%r26, %r20]
	.word 0xc883511a  ! 421: LDUWA_R	lduwa	[%r13, %r26] 0x88, %r4
	.word 0xc8fb101a  ! 422: SWAPA_R	swapa	%r4, [%r12 + %r26] 0x80
	.word 0xc894d03a  ! 424: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc8f4903a  ! 426: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
	.word 0xc8b4903a  ! 428: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CP_PST_PRI130:
	.word 0xc9bb581a  ! 430: STDFA_R	stda	%f4, [%r26, %r13]
NC_BIS_SEC131:
	.word 0xccf4dc7a  ! 432: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
	.word 0xc9bb911a  ! 434: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc93a801a  ! 435: STDF_R	std	%f4, [%r26, %r10]
	.word 0xc9a3911a  ! 437: STFA_R	sta	%f4, [%r26, %r14]
	.word 0xc892901a  ! 438: LDUHA_R	lduha	[%r10, %r26] 0x80, %r4
	.word 0xc99c501a  ! 440: LDDFA_R	ldda	[%r17, %r26], %f4
SHORT_FP_PRI132:
	.word 0xc9bb5b1a  ! 442: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc802801a  ! 443: LDUW_R	lduw	[%r10 + %r26], %r4
	.word 0xc8dcd13a  ! 445: LDXA_R	ldxa	[%r19, %r26] 0x89, %r4
NC_AIUS133:
	.word 0xc8dfc33a  ! 447: LDXA_R	ldxa	[%r31, %r26] 0x19, %r4
CP_BIS_AIUP134:
	and	%r26,	%r28,	%r26
	.word 0xd0f6055a  ! 449: STXA_R	stxa	%r8, [%r24 + %r26] 0x2a
	.word 0xc8c4d03a  ! 451: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
	.word 0xc8d3911a  ! 453: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r4
	.word 0xc86a801a  ! 454: LDSTUB_R	ldstub	%r4, [%r10 + %r26]
	.word 0xc922801a  ! 455: STF_R	st	%f4, [%r26, %r10]
	.word 0xc984d03a  ! 457: LDFA_R	lda	[%r19, %r26], %f4
NC_NUC135:
	.word 0xc9a5409a  ! 459: STFA_R	sta	%f4, [%r26, %r21]
NC_PST_PRI136:
	.word 0xc9bb985a  ! 461: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc893901a  ! 463: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
CP_ATM_QUAD_LD137:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 465: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xc902a018  ! 466: LDF_I	ld	[%r10, 0x0018], %f4
	.word 0xc894d03a  ! 468: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc983511a  ! 469: LDFA_R	lda	[%r13, %r26], %f4
	.word 0xc842a018  ! 470: LDSW_I	ldsw	[%r10 + 0x0018], %r4
NC_BIS_AIUS138:
	.word 0xccf7c47a  ! 472: STXA_R	stxa	%r6, [%r31 + %r26] 0x23
CP_BIS_AIUP139:
	and	%r26,	%r28,	%r26
	.word 0xc4ae055a  ! 474: STBA_R	stba	%r2, [%r24 + %r26] 0x2a
NC_AIUS140:
	.word 0xc9a7c23a  ! 476: STFA_R	sta	%f4, [%r26, %r31]
	.word 0xc8a3901a  ! 478: STWA_R	stwa	%r4, [%r14 + %r26] 0x80
SHORT_FP_PRI141:
	.word 0xc9ba9b5a  ! 480: STDFA_R	stda	%f4, [%r26, %r10]
NC_AIUS142:
	.word 0xc887c23a  ! 482: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r4
NC_NUC143:
	.word 0xc99d409a  ! 484: LDDFA_R	ldda	[%r21, %r26], %f4
NC_BIS_SEC144:
	.word 0xc8f4dd7a  ! 486: STXA_R	stxa	%r4, [%r19 + %r26] 0xeb
SET_TL1_145:
	ta	T_CHANGE_TO_TL1
CHANGE_R26146:
	add	%r26,	%r27,	%r26
NC_BIS_NUC146:
	.word 0xc4b544fa  ! 488: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc8acd03a  ! 490: STBA_R	stba	%r4, [%r19 + %r26] 0x81
SET_TL0_147:
	ta	T_CHANGE_TO_TL0
CHANGE_R26148:
	add	%r26,	%r27,	%r26
NC_BIS_SEC148:
	.word 0xc4f4dc7a  ! 492: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CP_BIS_QUAD_LD149:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 494: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
	.word 0xc902a018  ! 495: LDF_I	ld	[%r10, 0x0018], %f4
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC151:
	.word 0xc8d5009a  ! 497: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r4
	.word 0xc8c4d03a  ! 499: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CHANGE_USER152:
	ta	T_CHANGE_NONPRIV
CHANGE_R26153:
	add	%r26,	%r27,	%r26
NC_BIS_PRI153:
	.word 0xc4b41c5a  ! 501: STHA_R	stha	%r2, [%r16 + %r26] 0xe2
	.word 0xc99c903a  ! 503: LDDFA_R	ldda	[%r18, %r26], %f4
CP_BIS_PRI154:
	and	%r26,	%r28,	%r26
	.word 0xd0aadd5a  ! 505: STBA_R	stba	%r8, [%r11 + %r26] 0xea
CHANGE_PRIV155:
	ta	T_CHANGE_PRIV
CHANGE_R26156:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP156:
	.word 0xd0a6455a  ! 507: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
	.word 0xc8bcd13a  ! 509: STDA_R	stda	%r4, [%r19 + %r26] 0x89
	.word 0xc9a4913a  ! 511: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc88cd03a  ! 513: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
NC_BIS_AIUP157:
	.word 0xc4f6445a  ! 515: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
SET_TL1_158:
	ta	T_CHANGE_TO_TL1
CHANGE_R26159:
	add	%r26,	%r27,	%r26
NC_BIS_NUC159:
	.word 0xccad44fa  ! 517: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xc8d4903a  ! 519: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc8fad01a  ! 520: SWAPA_R	swapa	%r4, [%r11 + %r26] 0x80
	.word 0xc902a018  ! 521: LDF_I	ld	[%r10, 0x0018], %f4
NC_BLK_SEc160:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 523: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUP161:
	.word 0xc896031a  ! 525: LDUHA_R	lduha	[%r24, %r26] 0x18, %r4
NC_BLK_SEc162:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 527: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUS163:
	.word 0xd0b7c57a  ! 529: STHA_R	stha	%r8, [%r31 + %r26] 0x2b
	.word 0xc983901a  ! 531: LDFA_R	lda	[%r14, %r26], %f4
	.word 0xc86ae01b  ! 532: LDSTUB_I	ldstub	%r4, [%r11 + 0x001b]
SHORT_FP_PRI164:
	.word 0xc9ba9a5a  ! 534: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8d4d03a  ! 536: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
	.word 0xc8bbd11a  ! 538: STDA_R	stda	%r4, [%r15 + %r26] 0x88
	.word 0xc99a915a  ! 539: LDDFA_R	ldda	[%r10, %r26], %f4
	.word 0xc8c4913a  ! 541: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r4
SET_TL0_165:
	ta	T_CHANGE_TO_TL0
WR_LEASI_166:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_167:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8d3115a  ! 543: LDSHA_R	ldsha	[%r12, %r26] 0x8a, %r4
	.word 0xc8f3d11a  ! 545: STXA_R	stxa	%r4, [%r15 + %r26] 0x88
	.word 0xc8acd03a  ! 547: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc8c4d03a  ! 549: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CP_PST_PRI168:
	.word 0xc9ba981a  ! 551: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc822801a  ! 552: STW_R	stw	%r4, [%r10 + %r26]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC170:
	.word 0xc8cd019a  ! 554: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r4
CP_PST_PRI171:
	.word 0xc9bb599a  ! 556: STDFA_R	stda	%f4, [%r26, %r13]
CHANGE_USER172:
	ta	T_CHANGE_NONPRIV
CHANGE_R26173:
	add	%r26,	%r27,	%r26
CP_BIS_PRI173:
	and	%r26,	%r28,	%r26
	.word 0xd0a35d5a  ! 558: STWA_R	stwa	%r8, [%r13 + %r26] 0xea
CHANGE_R26174:
	add	%r26,	%r27,	%r26
CP_BIS_SEC174:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 560: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
CHANGE_PRIV175:
	ta	T_CHANGE_PRIV
CHANGE_R26176:
	add	%r26,	%r27,	%r26
CP_BIS_NUC176:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 562: STDA_R	stda	%r6, [%r20 + %r26] 0x27
CP_NUC177:
	.word 0xc8f5009a  ! 564: STXA_R	stxa	%r4, [%r20 + %r26] 0x04
CP_AIUP178:
	.word 0xc8d6021a  ! 566: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r4
	.word 0xc9e3201a  ! 567: CASA_R	casa	[%r12] %asi, %r26, %r4
NC_SHORT_FP_SEC179:
	.word 0xc9bcda3a  ! 569: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc89ad15a  ! 570: LDDA_R	ldda	[%r11, %r26] 0x8a, %r4
CHANGE_USER180:
	ta	T_CHANGE_NONPRIV
CHANGE_R26181:
	mov	%g0,	%r26
CP_BIS_PRI181:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 572: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
CP_BIS_PRI182:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 574: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc8ac101a  ! 576: STBA_R	stba	%r4, [%r16 + %r26] 0x80
	.word 0xc8bb101a  ! 577: STDA_R	stda	%r4, [%r12 + %r26] 0x80
NC_SHORT_FP_SEC183:
	.word 0xc99cda7a  ! 579: LDDFA_R	ldda	[%r19, %r26], %f4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC185:
	.word 0xc99d409a  ! 581: LDDFA_R	ldda	[%r21, %r26], %f4
NC_BIS_SEC186:
	.word 0xc4bcdc7a  ! 583: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc8c4d03a  ! 585: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
SET_TL1_187:
	ta	T_CHANGE_TO_TL1
CHANGE_R26188:
	add	%r26,	%r27,	%r26
NC_BIS_NUC188:
	.word 0xc4a545fa  ! 587: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc8a4903a  ! 589: STWA_R	stwa	%r4, [%r18 + %r26] 0x81
NC_NUC189:
	.word 0xc8b5419a  ! 591: STHA_R	stha	%r4, [%r21 + %r26] 0x0c
SET_TL0_190:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI191:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 593: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc8b4913a  ! 595: STHA_R	stha	%r4, [%r18 + %r26] 0x89
CHANGE_PRIV192:
	ta	T_CHANGE_PRIV
CHANGE_R26193:
	add	%r26,	%r27,	%r26
CP_BIS_NUC193:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 597: STDA_R	stda	%r6, [%r20 + %r26] 0x27
	.word 0xc8b2901a  ! 598: STHA_R	stha	%r4, [%r10 + %r26] 0x80
	.word 0xc93a801a  ! 599: STDF_R	std	%f4, [%r26, %r10]
	.word 0xc8d4d03a  ! 601: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
CP_BIS_QUAD_LD194:
	and	%r26,	%r29,	%r26
	.word 0xc89add5a  ! 603: LDDA_R	ldda	[%r11, %r26] 0xea, %r4
	.word 0xc8cc903a  ! 605: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
CHANGE_USER195:
	ta	T_CHANGE_NONPRIV
CHANGE_R26196:
	add	%r26,	%r27,	%r26
NC_BIS_PRI196:
	.word 0xc4bc1d5a  ! 607: STDA_R	stda	%r2, [%r16 + %r26] 0xea
CP_PST_PRI197:
	.word 0xc9ba985a  ! 609: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc87b001a  ! 610: SWAP_R	swap	%r4, [%r12 + %r26]
CHANGE_PRIV198:
	ta	T_CHANGE_PRIV
CHANGE_R26199:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS199:
	.word 0xc8f7c47a  ! 612: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
BLK_PRI200:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 614: STDFA_R	stda	%f0, [%r26, %r13]
NC_PST_PRI201:
	.word 0xc9bbd89a  ! 616: STDFA_R	stda	%f4, [%r26, %r15]
NC_BIS_SEC202:
	.word 0xc8acdc7a  ! 618: STBA_R	stba	%r4, [%r19 + %r26] 0xe3
	.word 0xc8b4d03a  ! 620: STHA_R	stha	%r4, [%r19 + %r26] 0x81
	.word 0xc8c4d03a  ! 622: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
	.word 0xc93b2018  ! 623: STDF_I	std	%f4, [0x0018, %r12]
CP_PST_PRI203:
	.word 0xc9ba995a  ! 625: STDFA_R	stda	%f4, [%r26, %r10]
NC_SHORT_FP_SEC204:
	.word 0xc99cda3a  ! 627: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc833401a  ! 628: STH_R	sth	%r4, [%r13 + %r26]
	.word 0xc91a801a  ! 629: LDDF_R	ldd	[%r10, %r26], %f4
	.word 0xc8a4903a  ! 631: STWA_R	stwa	%r4, [%r18 + %r26] 0x81
	.word 0xc88b115a  ! 632: LDUBA_R	lduba	[%r12, %r26] 0x8a, %r4
CHANGE_USER205:
	ta	T_CHANGE_NONPRIV
CHANGE_R26206:
	add	%r26,	%r27,	%r26
NC_BIS_PRI206:
	.word 0xcca39c5a  ! 634: STWA_R	stwa	%r6, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS208:
	.word 0xc8a7823a  ! 636: STWA_R	stwa	%r4, [%r30 + %r26] 0x11
NC_PST_PRI209:
	.word 0xc9bbd81a  ! 638: STDFA_R	stda	%f4, [%r26, %r15]
NC_NUC210:
	.word 0xc8c5419a  ! 640: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r4
	.word 0xc84b201b  ! 641: LDSB_I	ldsb	[%r12 + 0x001b], %r4
CP_AIUP211:
	.word 0xc8be021a  ! 643: STDA_R	stda	%r4, [%r24 + %r26] 0x10
	.word 0xc86b001a  ! 644: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
	.word 0xc8d4903a  ! 646: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc8d4d03a  ! 648: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
CP_AIUP212:
	.word 0xc8f6021a  ! 650: STXA_R	stxa	%r4, [%r24 + %r26] 0x10
CP_AIUP213:
	.word 0xc8de031a  ! 652: LDXA_R	ldxa	[%r24, %r26] 0x18, %r4
	.word 0xc893901a  ! 654: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
	.word 0xc8a4101a  ! 656: STWA_R	stwa	%r4, [%r16 + %r26] 0x80
	.word 0xc8bcd13a  ! 658: STDA_R	stda	%r4, [%r19 + %r26] 0x89
	.word 0xc9a4d03a  ! 660: STFA_R	sta	%f4, [%r26, %r19]
	.word 0xc91a801a  ! 661: LDDF_R	ldd	[%r10, %r26], %f4
	.word 0xc86b001a  ! 662: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
CP_BIS_QUAD_LD214:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 664: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc99ad11a  ! 665: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc8ea901a  ! 666: LDSTUBA_R	ldstuba	%r4, [%r10 + %r26] 0x80
CP_AIUP215:
	.word 0xc8b6031a  ! 668: STHA_R	stha	%r4, [%r24 + %r26] 0x18
	.word 0xc8b4d03a  ! 670: STHA_R	stha	%r4, [%r19 + %r26] 0x81
NC_BIS_SEC216:
	.word 0xc4b4dc7a  ! 672: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
NC_BIS_AIUP217:
	.word 0xcca6445a  ! 674: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
	.word 0xc88c903a  ! 676: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
	.word 0xc8eb101a  ! 677: LDSTUBA_R	ldstuba	%r4, [%r12 + %r26] 0x80
	.word 0xc76f801a  ! 679: PREFETCH_R	prefetch	[%r30 + %r26], #one_write
CP_BIS_QUAD_LD218:
	and	%r26,	%r29,	%r26
	.word 0xd09b1d5a  ! 681: LDDA_R	ldda	[%r12, %r26] 0xea, %r8
	.word 0xc9bb901a  ! 683: STDFA_R	stda	%f4, [%r26, %r14]
NC_BIS_AIUP219:
	.word 0xc4a6445a  ! 685: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xc884111a  ! 687: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r4
	.word 0xc8dbd01a  ! 689: LDXA_R	ldxa	[%r15, %r26] 0x80, %r4
	.word 0xc9236018  ! 690: STF_I	st	%f4, [0x0018, %r13]
WR_LEASI_220:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_221:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8c4d03a  ! 693: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CP_BIS_QUAD_LD222:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 695: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
BLK_PRI223:
	and	%r26,	%r29,	%r26
	.word 0xc19b1f1a  ! 697: LDDFA_R	ldda	[%r12, %r26], %f0
SET_TL1_224:
	ta	T_CHANGE_TO_TL1
CHANGE_R26225:
	mov	%g0,	%r26
NC_BIS_NUC225:
	.word 0xc4b545fa  ! 699: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
	.word 0xc922801a  ! 700: STF_R	st	%f4, [%r26, %r10]
	.word 0xc8b4903a  ! 702: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CP_BIS_QUAD_LD226:
	and	%r26,	%r29,	%r26
	.word 0xc89b5d5a  ! 704: LDDA_R	ldda	[%r13, %r26] 0xea, %r4
	.word 0xc8b4903a  ! 706: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CP_NUC227:
	.word 0xc9f5201a  ! 708: CASXA_R	casxa	[%r20]%asi, %r26, %r4
CP_NUC228:
	.word 0xc8a5009a  ! 710: STWA_R	stwa	%r4, [%r20 + %r26] 0x04
	.word 0xc9a4903a  ! 713: STFA_R	sta	%f4, [%r26, %r18]
NC_NUC229:
	.word 0xc99d419a  ! 715: LDDFA_R	ldda	[%r21, %r26], %f4
CP_BIS_QUAD_LD230:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 717: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc88c903a  ! 719: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
CP_BIS_NUC231:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 721: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
	.word 0xc8db101a  ! 722: LDXA_R	ldxa	[%r12, %r26] 0x80, %r4
CP_AIUS232:
	.word 0xc9a7823a  ! 724: STFA_R	sta	%f4, [%r26, %r30]
CP_BIS_NUC233:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 726: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
	.word 0xc8abd01a  ! 728: STBA_R	stba	%r4, [%r15 + %r26] 0x80
	.word 0xc8bad01a  ! 729: STDA_R	stda	%r4, [%r11 + %r26] 0x80
CP_BIS_AIUP234:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 731: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
	.word 0xc8ac903a  ! 733: STBA_R	stba	%r4, [%r18 + %r26] 0x81
NC_AIUS235:
	.word 0xc987c23a  ! 735: LDFA_R	lda	[%r31, %r26], %f4
CP_AIUP236:
	.word 0xc8ce021a  ! 737: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r4
CP_AIUP237:
	.word 0xc89e021a  ! 739: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
	.word 0xc8dcd13a  ! 741: LDXA_R	ldxa	[%r19, %r26] 0x89, %r4
	.word 0xc922801a  ! 742: STF_R	st	%f4, [%r26, %r10]
CP_AIUP238:
	.word 0xc88e021a  ! 744: LDUBA_R	lduba	[%r24, %r26] 0x10, %r4
	.word 0xc8dc101a  ! 746: LDXA_R	ldxa	[%r16, %r26] 0x80, %r4
NC_AIUP239:
	.word 0xc8be431a  ! 748: STDA_R	stda	%r4, [%r25 + %r26] 0x18
CP_ATM_QUAD_LD240:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 750: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc8c4501a  ! 752: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r4
CP_NUC241:
	.word 0xc99d009a  ! 754: LDDFA_R	ldda	[%r20, %r26], %f4
	.word 0xc8d4903a  ! 756: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
CP_AIUS242:
	.word 0xc99f823a  ! 758: LDDFA_R	ldda	[%r30, %r26], %f4
CP_ATM_QUAD_LD243:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 760: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
SHORT_FP_PRI244:
	.word 0xc9bada5a  ! 762: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc8ac101a  ! 764: STBA_R	stba	%r4, [%r16 + %r26] 0x80
	.word 0xc8bcd03a  ! 766: STDA_R	stda	%r4, [%r19 + %r26] 0x81
NC_BIS_NUC245:
	.word 0xc8a545fa  ! 768: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
SET_TL0_246:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI247:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 770: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
	.word 0xc822a018  ! 771: STW_I	stw	%r4, [%r10 + 0x0018]
BLK_PRI248:
	and	%r26,	%r29,	%r26
	.word 0xc19b5f1a  ! 773: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xc8b3101a  ! 774: STHA_R	stha	%r4, [%r12 + %r26] 0x80
CP_BIS_PRI249:
	and	%r26,	%r28,	%r26
	.word 0xccf29c5a  ! 776: STXA_R	stxa	%r6, [%r10 + %r26] 0xe2
	.word 0xc9bcd03a  ! 778: STDFA_R	stda	%f4, [%r26, %r19]
SHORT_FP_PRI250:
	.word 0xc99a9a1a  ! 780: LDDFA_R	ldda	[%r10, %r26], %f4
	.word 0xc8f3501a  ! 781: STXA_R	stxa	%r4, [%r13 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS252:
	.word 0xc88fc23a  ! 783: LDUBA_R	lduba	[%r31, %r26] 0x11, %r4
CP_AIUS253:
	.word 0xc8bf823a  ! 785: STDA_R	stda	%r4, [%r30 + %r26] 0x11
NC_AIUS254:
	.word 0xc8cfc23a  ! 787: LDSBA_R	ldsba	[%r31, %r26] 0x11, %r4
CP_BIS_QUAD_LD255:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 789: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
NC_BLK_SEc256:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 791: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc88cd13a  ! 793: LDUBA_R	lduba	[%r19, %r26] 0x89, %r4
	.word 0xc88c903a  ! 795: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
CHANGE_USER257:
	ta	T_CHANGE_NONPRIV
CHANGE_R26258:
	add	%r26,	%r27,	%r26
NC_BIS_PRI258:
	.word 0xccf39c5a  ! 797: STXA_R	stxa	%r6, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD259:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5d5a  ! 799: LDDA_R	ldda	[%r13, %r26] 0xea, %r6
CHANGE_PRIV260:
	ta	T_CHANGE_PRIV
CHANGE_R26261:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD261:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 801: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc894913a  ! 803: LDUHA_R	lduha	[%r18, %r26] 0x89, %r4
	.word 0xc8c2d01a  ! 804: LDSWA_R	ldswa	[%r11, %r26] 0x80, %r4
	.word 0xc8fa911a  ! 805: SWAPA_R	swapa	%r4, [%r10 + %r26] 0x88
	.word 0xc88c903a  ! 807: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
	.word 0xc8dcd03a  ! 809: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
NC_BIS_AIUP262:
	.word 0xd0a6445a  ! 811: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
NC_NUC263:
	.word 0xc8c5409a  ! 813: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r4
NC_PST_PRI264:
	.word 0xc9bb981a  ! 815: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc89cd03a  ! 817: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xc822801a  ! 818: STW_R	stw	%r4, [%r10 + %r26]
	.word 0xc8c4511a  ! 820: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r4
	.word 0xc8c4d03a  ! 822: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
	.word 0xc8bcd03a  ! 824: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc86ae01b  ! 825: LDSTUB_I	ldstub	%r4, [%r11 + 0x001b]
	.word 0xc8bc903a  ! 827: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CHANGE_R26265:
	add	%r26,	%r27,	%r26
CP_BIS_SEC265:
	and	%r26,	%r28,	%r26
	.word 0xc4a49d7a  ! 829: STWA_R	stwa	%r2, [%r18 + %r26] 0xeb
	.word 0xc8dc903a  ! 831: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
CHANGE_USER266:
	ta	T_CHANGE_NONPRIV
CHANGE_R26267:
	add	%r26,	%r27,	%r26
CP_BIS_PRI267:
	and	%r26,	%r28,	%r26
	.word 0xc49adc5a  ! 833: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
CHANGE_PRIV268:
	ta	T_CHANGE_PRIV
CHANGE_R26269:
	add	%r26,	%r27,	%r26
CP_BIS_NUC269:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 835: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
NC_BLK_SEc270:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 837: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc8f4101a  ! 839: STXA_R	stxa	%r4, [%r16 + %r26] 0x80
CP_BIS_AIUP271:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 841: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xc8ab501a  ! 842: STBA_R	stba	%r4, [%r13 + %r26] 0x80
CP_ATM_QUAD_LD272:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 844: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xc9a2901a  ! 845: STFA_R	sta	%f4, [%r26, %r10]
CP_BIS_NUC273:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 847: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CP_ATM_QUAD_LD274:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 849: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
	.word 0xc983901a  ! 851: LDFA_R	lda	[%r14, %r26], %f4
CP_NUC275:
	.word 0xc8ad009a  ! 853: STBA_R	stba	%r4, [%r20 + %r26] 0x04
	.word 0xc894d13a  ! 855: LDUHA_R	lduha	[%r19, %r26] 0x89, %r4
CP_ATM_QUAD_LD276:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 857: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
CP_NUC277:
	.word 0xc8cd009a  ! 859: LDSBA_R	ldsba	[%r20, %r26] 0x04, %r4
	.word 0xc8d4d13a  ! 861: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r4
NC_AIUP278:
	.word 0xc8ce421a  ! 863: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r4
	.word 0xc86ac01a  ! 864: LDSTUB_R	ldstub	%r4, [%r11 + %r26]
CP_BIS_NUC279:
	and	%r26,	%r28,	%r26
	.word 0xc8ad05fa  ! 866: STBA_R	stba	%r4, [%r20 + %r26] 0x2f
CHANGE_USER280:
	ta	T_CHANGE_NONPRIV
CHANGE_R26281:
	add	%r26,	%r27,	%r26
NC_BIS_PRI281:
	.word 0xd0f45c5a  ! 868: STXA_R	stxa	%r8, [%r17 + %r26] 0xe2
	.word 0xc8a4903a  ! 870: STWA_R	stwa	%r4, [%r18 + %r26] 0x81
	.word 0xc8a3101a  ! 871: STWA_R	stwa	%r4, [%r12 + %r26] 0x80
	.word 0xc9bb111a  ! 872: STDFA_R	stda	%f4, [%r26, %r12]
CHANGE_PRIV282:
	ta	T_CHANGE_PRIV
CHANGE_R26283:
	mov	%g0,	%r26
NC_BIS_AIUP283:
	.word 0xc8ae455a  ! 874: STBA_R	stba	%r4, [%r25 + %r26] 0x2a
	.word 0xc9a4903a  ! 876: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc89bd01a  ! 878: LDDA_R	ldda	[%r15, %r26] 0x80, %r4
CP_AIUP284:
	.word 0xc8b6031a  ! 880: STHA_R	stha	%r4, [%r24 + %r26] 0x18
	.word 0xc983111a  ! 881: LDFA_R	lda	[%r12, %r26], %f4
SET_TL1_285:
	ta	T_CHANGE_TO_TL1
CHANGE_R26286:
	add	%r26,	%r27,	%r26
NC_BIS_NUC286:
	.word 0xc4bd44fa  ! 883: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xc8acd03a  ! 885: STBA_R	stba	%r4, [%r19 + %r26] 0x81
NC_BLK_SEc287:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 887: LDDFA_R	ldda	[%r19, %r26], %f16
CHANGE_R26288:
	add	%r26,	%r27,	%r26
CP_BIS_SEC288:
	and	%r26,	%r28,	%r26
	.word 0xd0f49d7a  ! 889: STXA_R	stxa	%r8, [%r18 + %r26] 0xeb
SET_TL0_289:
	ta	T_CHANGE_TO_TL0
WR_LEASI_290:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_291:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8cbd01a  ! 892: LDSBA_R	ldsba	[%r15, %r26] 0x80, %r4
CHANGE_PRIV292:
	ta	T_CHANGE_PRIV
CHANGE_R26293:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS293:
	.word 0xd0bfc47a  ! 894: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc823401a  ! 895: STW_R	stw	%r4, [%r13 + %r26]
	.word 0xc8dc903a  ! 897: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
	.word 0xc812a01a  ! 898: LDUH_I	lduh	[%r10 + 0x001a], %r4
	.word 0xc86b601b  ! 899: LDSTUB_I	ldstub	%r4, [%r13 + 0x001b]
	.word 0xc8a4501a  ! 901: STWA_R	stwa	%r4, [%r17 + %r26] 0x80
CP_BIS_NUC294:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 903: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xc9e2a01a  ! 904: CASA_R	casa	[%r10] %asi, %r26, %r4
	.word 0xc91a801a  ! 905: LDDF_R	ldd	[%r10, %r26], %f4
	.word 0xc9a3101a  ! 906: STFA_R	sta	%f4, [%r26, %r12]
	.word 0xc9a4903a  ! 908: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc873001a  ! 909: STX_R	stx	%r4, [%r12 + %r26]
CHANGE_USER295:
	ta	T_CHANGE_NONPRIV
CHANGE_R26296:
	add	%r26,	%r27,	%r26
NC_BIS_PRI296:
	.word 0xc8bbdd5a  ! 911: STDA_R	stda	%r4, [%r15 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS298:
	.word 0xc8a7823a  ! 913: STWA_R	stwa	%r4, [%r30 + %r26] 0x11
CP_BIS_NUC299:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 915: STHA_R	stha	%r6, [%r20 + %r26] 0x27
	.word 0xc984d13a  ! 917: LDFA_R	lda	[%r19, %r26], %f4
	.word 0xc9236018  ! 918: STF_I	st	%f4, [0x0018, %r13]
BLK_PRI300:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 920: LDDFA_R	ldda	[%r13, %r26], %f0
NC_SHORT_FP_SEC301:
	.word 0xc9bcda3a  ! 922: STDFA_R	stda	%f4, [%r26, %r19]
NC_BIS_AIUP302:
	.word 0xccf6445a  ! 924: STXA_R	stxa	%r6, [%r25 + %r26] 0x22
	.word 0xc8c4511a  ! 926: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r4
CHANGE_R26303:
	add	%r26,	%r27,	%r26
CP_BIS_SEC303:
	and	%r26,	%r28,	%r26
	.word 0xc8b49d7a  ! 928: STHA_R	stha	%r4, [%r18 + %r26] 0xeb
	.word 0xc89cd13a  ! 930: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
WR_LEASI_304:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_305:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_USER306:
	ta	T_CHANGE_NONPRIV
CHANGE_R26307:
	add	%r26,	%r27,	%r26
CP_BIS_PRI307:
	and	%r26,	%r28,	%r26
	.word 0xcca29d5a  ! 933: STWA_R	stwa	%r6, [%r10 + %r26] 0xea
CP_BIS_QUAD_LD308:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 935: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
	.word 0xc8d4903a  ! 937: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
NC_PST_PRI309:
	.word 0xc9bb981a  ! 939: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc9a2d01a  ! 940: STFA_R	sta	%f4, [%r26, %r11]
	.word 0xc82b601b  ! 941: STB_I	stb	%r4, [%r13 + 0x001b]
	.word 0xc8a3d11a  ! 943: STWA_R	stwa	%r4, [%r15 + %r26] 0x88
	.word 0xc8cc903a  ! 945: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
CHANGE_PRIV310:
	ta	T_CHANGE_PRIV
CHANGE_R26311:
	mov	%g0,	%r26
CP_ATM_QUAD_LD311:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 947: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
CP_BIS_QUAD_LD312:
	and	%r26,	%r29,	%r26
	.word 0xd09add5a  ! 949: LDDA_R	ldda	[%r11, %r26] 0xea, %r8
CP_NUC313:
	.word 0xc88d009a  ! 951: LDUBA_R	lduba	[%r20, %r26] 0x04, %r4
	.word 0xc8d4903a  ! 953: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc983901a  ! 955: LDFA_R	lda	[%r14, %r26], %f4
	.word 0xc8cc903a  ! 957: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
NC_NUC314:
	.word 0xc8a5409a  ! 959: STWA_R	stwa	%r4, [%r21 + %r26] 0x04
	.word 0xc8cc903a  ! 961: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
	.word 0xc8ab101a  ! 962: STBA_R	stba	%r4, [%r12 + %r26] 0x80
	.word 0xc8b3901a  ! 964: STHA_R	stha	%r4, [%r14 + %r26] 0x80
	.word 0xc86aa01b  ! 965: LDSTUB_I	ldstub	%r4, [%r10 + 0x001b]
NC_BIS_SEC315:
	.word 0xd0bcdd7a  ! 967: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
NC_BIS_AIUS316:
	.word 0xc4a7c57a  ! 969: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
WR_LEASI_317:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_318:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CHANGE_R26319:
	add	%r26,	%r27,	%r26
CP_BIS_SEC319:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 972: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD320:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 974: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
CP_AIUS321:
	.word 0xc8f7823a  ! 976: STXA_R	stxa	%r4, [%r30 + %r26] 0x11
CP_NUC322:
	.word 0xc8dd019a  ! 978: LDXA_R	ldxa	[%r20, %r26] 0x0c, %r4
	.word 0xc894913a  ! 980: LDUHA_R	lduha	[%r18, %r26] 0x89, %r4
BLK_PRI323:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 982: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc91aa018  ! 983: LDDF_I	ldd	[%r10, 0x0018], %f4
CHANGE_USER324:
	ta	T_CHANGE_NONPRIV
CHANGE_R26325:
	add	%r26,	%r27,	%r26
CP_BIS_PRI325:
	and	%r26,	%r28,	%r26
	.word 0xc4a31c5a  ! 985: STWA_R	stwa	%r2, [%r12 + %r26] 0xe2
CHANGE_PRIV326:
	ta	T_CHANGE_PRIV
CHANGE_R26327:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS327:
	and	%r26,	%r28,	%r26
	.word 0xc8b7857a  ! 987: STHA_R	stha	%r4, [%r30 + %r26] 0x2b
SHORT_FP_PRI328:
	.word 0xc99a9b1a  ! 989: LDDFA_R	ldda	[%r10, %r26], %f4
CHANGE_R26329:
	add	%r26,	%r27,	%r26
CP_BIS_SEC329:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 991: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
NC_AIUS330:
	.word 0xc8cfc33a  ! 993: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r4
	.word 0xc99cd03a  ! 995: LDDFA_R	ldda	[%r19, %r26], %f4
CHANGE_CLE331:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS333:
	.word 0xc8c7c33a  ! 998: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r4
	.word 0xc8acd13a  ! 1000: STBA_R	stba	%r4, [%r19 + %r26] 0x89
	.word 0xc884903a  ! 1002: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
CHANGE_R26334:
	add	%r26,	%r27,	%r26
CP_BIS_SEC334:
	and	%r26,	%r28,	%r26
	.word 0xc49c9d7a  ! 1004: LDDA_R	ldda	[%r18, %r26] 0xeb, %r2
	.word 0xc8d2d05a  ! 1005: LDSHA_R	ldsha	[%r11, %r26] 0x82, %r4
SHORT_FP_PRI335:
	.word 0xc9bada1a  ! 1007: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc894d03a  ! 1009: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
CP_NUC336:
	.word 0xc8d5009a  ! 1011: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r4
	.word 0xc89cd03a  ! 1013: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
NC_BIS_AIUP337:
	.word 0xc4a6445a  ! 1015: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
	.word 0xc8da901a  ! 1016: LDXA_R	ldxa	[%r10, %r26] 0x80, %r4
CP_BIS_AIUS338:
	and	%r26,	%r28,	%r26
	.word 0xc49f847a  ! 1018: LDDA_R	ldda	[%r30, %r26] 0x23, %r2
	.word 0xc99c903a  ! 1020: LDDFA_R	ldda	[%r18, %r26], %f4
CP_BIS_QUAD_LD339:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 1022: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xc8ac903a  ! 1024: STBA_R	stba	%r4, [%r18 + %r26] 0x81
CHANGE_USER340:
	ta	T_CHANGE_NONPRIV
CHANGE_R26341:
	add	%r26,	%r27,	%r26
NC_BIS_PRI341:
	.word 0xd0bb9c5a  ! 1026: STDA_R	stda	%r8, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
NC_AIUP343:
	.word 0xc99e421a  ! 1028: LDDFA_R	ldda	[%r25, %r26], %f4
	.word 0xc8c4903a  ! 1030: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r4
CP_PST_PRI344:
	.word 0xc9ba989a  ! 1032: STDFA_R	stda	%f4, [%r26, %r10]
SET_TL1_345:
	ta	T_CHANGE_TO_TL1
CHANGE_R26346:
	add	%r26,	%r27,	%r26
NC_BIS_NUC346:
	.word 0xccf544fa  ! 1034: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
NC_BIS_NUC347:
	.word 0xccf545fa  ! 1036: STXA_R	stxa	%r6, [%r21 + %r26] 0x2f
	.word 0xc91a801a  ! 1037: LDDF_R	ldd	[%r10, %r26], %f4
SET_TL0_348:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI349:
	.word 0xc4a41d5a  ! 1039: STWA_R	stwa	%r2, [%r16 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP351:
	.word 0xc8be021a  ! 1041: STDA_R	stda	%r4, [%r24 + %r26] 0x10
CP_BIS_AIUP352:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1043: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc893901a  ! 1045: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
	.word 0xc9bc501a  ! 1047: STDFA_R	stda	%f4, [%r26, %r17]
NC_BIS_AIUP353:
	.word 0xc4be455a  ! 1049: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
SET_TL1_354:
	ta	T_CHANGE_TO_TL1
CHANGE_R26355:
	add	%r26,	%r27,	%r26
NC_BIS_NUC355:
	.word 0xcca544fa  ! 1051: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
CP_ATM_QUAD_LD356:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 1053: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
	.word 0xc89c501a  ! 1055: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
BLK_PRI357:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1057: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc903001a  ! 1058: LDF_R	ld	[%r12, %r26], %f4
CHANGE_R26358:
	add	%r26,	%r27,	%r26
CP_BIS_SEC358:
	and	%r26,	%r28,	%r26
	.word 0xc8ac9c7a  ! 1060: STBA_R	stba	%r4, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD359:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1062: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc8f2901a  ! 1063: STXA_R	stxa	%r4, [%r10 + %r26] 0x80
	.word 0xc81b6018  ! 1064: LDD_I	ldd	[%r13 + 0x0018], %r4
CP_NUC360:
	.word 0xc8c5009a  ! 1066: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r4
NC_PST_PRI361:
	.word 0xc9bc191a  ! 1068: STDFA_R	stda	%f4, [%r26, %r16]
NC_BLK_SEc362:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1070: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc8d2d11a  ! 1071: LDSHA_R	ldsha	[%r11, %r26] 0x88, %r4
	.word 0xc9a3111a  ! 1072: STFA_R	sta	%f4, [%r26, %r12]
	.word 0xc88cd03a  ! 1074: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
	.word 0xc88cd03a  ! 1076: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
NC_BLK_SEc363:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1078: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc93a801a  ! 1079: STDF_R	std	%f4, [%r26, %r10]
CP_AIUP364:
	.word 0xc8c6031a  ! 1081: LDSWA_R	ldswa	[%r24, %r26] 0x18, %r4
	.word 0xc9a4d13a  ! 1083: STFA_R	sta	%f4, [%r26, %r19]
CP_BIS_QUAD_LD365:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 1085: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
SHORT_FP_PRI366:
	.word 0xc9bada5a  ! 1087: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc8eb501a  ! 1088: LDSTUBA_R	ldstuba	%r4, [%r13 + %r26] 0x80
	.word 0xc983911a  ! 1090: LDFA_R	lda	[%r14, %r26], %f4
CP_AIUP367:
	.word 0xc896021a  ! 1092: LDUHA_R	lduha	[%r24, %r26] 0x10, %r4
	.word 0xc8ccd03a  ! 1094: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r4
	.word 0xc984d13a  ! 1096: LDFA_R	lda	[%r19, %r26], %f4
	.word 0xc923401a  ! 1097: STF_R	st	%f4, [%r26, %r13]
	.word 0xc982901a  ! 1098: LDFA_R	lda	[%r10, %r26], %f4
NC_AIUP368:
	.word 0xc8ae431a  ! 1100: STBA_R	stba	%r4, [%r25 + %r26] 0x18
SET_TL0_369:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI370:
	.word 0xc4b41c5a  ! 1102: STHA_R	stha	%r2, [%r16 + %r26] 0xe2
NC_BIS_SEC371:
	.word 0xc4f4dc7a  ! 1104: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC373:
	.word 0xc8dd419a  ! 1106: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r4
NC_NUC374:
	.word 0xc8f5409a  ! 1108: STXA_R	stxa	%r4, [%r21 + %r26] 0x04
	.word 0xc88cd13a  ! 1110: LDUBA_R	lduba	[%r19, %r26] 0x89, %r4
CP_BIS_NUC375:
	and	%r26,	%r28,	%r26
	.word 0xccf504fa  ! 1112: STXA_R	stxa	%r6, [%r20 + %r26] 0x27
	.word 0xc8ac501a  ! 1114: STBA_R	stba	%r4, [%r17 + %r26] 0x80
	.word 0xc8ca915a  ! 1115: LDSBA_R	ldsba	[%r10, %r26] 0x8a, %r4
	.word 0xc99cd13a  ! 1117: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc86aa01b  ! 1118: LDSTUB_I	ldstub	%r4, [%r10 + 0x001b]
	.word 0xc9bb511a  ! 1119: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc8f4511a  ! 1121: STXA_R	stxa	%r4, [%r17 + %r26] 0x88
	.word 0xc89cd03a  ! 1123: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xc8a4d13a  ! 1125: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
	.word 0xc853201a  ! 1126: LDSH_I	ldsh	[%r12 + 0x001a], %r4
	.word 0xc8f4d03a  ! 1128: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
NC_AIUP376:
	.word 0xc8b6421a  ! 1130: STHA_R	stha	%r4, [%r25 + %r26] 0x10
	.word 0xc902e018  ! 1131: LDF_I	ld	[%r11, 0x0018], %f4
	.word 0xc8c4501a  ! 1133: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r4
CHANGE_USER377:
	ta	T_CHANGE_NONPRIV
CHANGE_R26378:
	add	%r26,	%r27,	%r26
CP_BIS_PRI378:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 1135: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc91b401a  ! 1136: LDDF_R	ldd	[%r13, %r26], %f4
BLK_PRI379:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 1138: STDFA_R	stda	%f16, [%r26, %r11]
CHANGE_PRIV380:
	ta	T_CHANGE_PRIV
CHANGE_R26381:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP381:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 1140: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc82a801a  ! 1141: STB_R	stb	%r4, [%r10 + %r26]
	.word 0xc86ae01b  ! 1142: LDSTUB_I	ldstub	%r4, [%r11 + 0x001b]
	.word 0xc84a801a  ! 1143: LDSB_R	ldsb	[%r10 + %r26], %r4
	.word 0xc8aad01a  ! 1144: STBA_R	stba	%r4, [%r11 + %r26] 0x80
	.word 0xc89c913a  ! 1146: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xc8cc913a  ! 1148: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r4
	.word 0xc8ca911a  ! 1149: LDSBA_R	ldsba	[%r10, %r26] 0x88, %r4
	.word 0xc884d03a  ! 1151: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r4
	.word 0xc89c511a  ! 1153: LDDA_R	ldda	[%r17, %r26] 0x88, %r4
NC_NUC382:
	.word 0xc985409a  ! 1155: LDFA_R	lda	[%r21, %r26], %f4
	.word 0xc99c903a  ! 1157: LDDFA_R	ldda	[%r18, %r26], %f4
	.word 0xc91b001a  ! 1158: LDDF_R	ldd	[%r12, %r26], %f4
BLK_PRI383:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 1160: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc984913a  ! 1162: LDFA_R	lda	[%r18, %r26], %f4
CP_ATM_QUAD_LD384:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1164: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc883911a  ! 1166: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r4
	.word 0xc8f3101a  ! 1167: STXA_R	stxa	%r4, [%r12 + %r26] 0x80
	.word 0xc84b201b  ! 1168: LDSB_I	ldsb	[%r12 + 0x001b], %r4
	.word 0xc894511a  ! 1170: LDUHA_R	lduha	[%r17, %r26] 0x88, %r4
	.word 0xc884d13a  ! 1172: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
NC_PST_PRI385:
	.word 0xc9bc581a  ! 1174: STDFA_R	stda	%f4, [%r26, %r17]
	.word 0xc8dcd03a  ! 1176: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
	.word 0xc8ccd13a  ! 1178: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r4
	.word 0xc884d03a  ! 1180: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r4
NC_BLK_SEc386:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1182: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc8d2901a  ! 1183: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r4
WR_LEASI_387:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_388:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_PST_PRI389:
	.word 0xc9bb189a  ! 1186: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc903401a  ! 1187: LDF_R	ld	[%r13, %r26], %f4
NC_BIS_AIUS390:
	.word 0xc8b7c47a  ! 1189: STHA_R	stha	%r4, [%r31 + %r26] 0x23
BLK_PRI391:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 1191: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc93b401a  ! 1192: STDF_R	std	%f4, [%r26, %r13]
	.word 0xc8b4903a  ! 1194: STHA_R	stha	%r4, [%r18 + %r26] 0x81
CP_AIUP392:
	.word 0xc8ce021a  ! 1196: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r4
CP_BIS_NUC393:
	and	%r26,	%r28,	%r26
	.word 0xccbd05fa  ! 1198: STDA_R	stda	%r6, [%r20 + %r26] 0x2f
	.word 0xc8cc903a  ! 1200: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
CHANGE_R26394:
	mov	%g0,	%r26
CP_BIS_SEC394:
	and	%r26,	%r28,	%r26
	.word 0xcca49c7a  ! 1202: STWA_R	stwa	%r6, [%r18 + %r26] 0xe3
	.word 0xc9bcd13a  ! 1204: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc8ba901a  ! 1205: STDA_R	stda	%r4, [%r10 + %r26] 0x80
	.word 0xc8f4d03a  ! 1207: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
NC_BIS_AIUS395:
	.word 0xd0bfc47a  ! 1209: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc8bcd13a  ! 1211: STDA_R	stda	%r4, [%r19 + %r26] 0x89
NC_BIS_SEC396:
	.word 0xccbcdd7a  ! 1213: STDA_R	stda	%r6, [%r19 + %r26] 0xeb
	.word 0xc9a3101a  ! 1214: STFA_R	sta	%f4, [%r26, %r12]
	.word 0xc9bb501a  ! 1215: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc802c01a  ! 1216: LDUW_R	lduw	[%r11 + %r26], %r4
	.word 0xc982901a  ! 1217: LDFA_R	lda	[%r10, %r26], %f4
CHANGE_R26397:
	add	%r26,	%r27,	%r26
CP_BIS_SEC397:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1219: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
NC_BLK_SEc398:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1221: LDDFA_R	ldda	[%r19, %r26], %f16
CP_PST_PRI399:
	.word 0xc9ba981a  ! 1223: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8a3d01a  ! 1225: STWA_R	stwa	%r4, [%r15 + %r26] 0x80
CHANGE_USER400:
	ta	T_CHANGE_NONPRIV
CHANGE_R26401:
	add	%r26,	%r27,	%r26
NC_BIS_PRI401:
	.word 0xc8f41c5a  ! 1227: STXA_R	stxa	%r4, [%r16 + %r26] 0xe2
	.word 0xc84ae01b  ! 1228: LDSB_I	ldsb	[%r11 + 0x001b], %r4
WR_LEASI_402:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_403:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_PRI404:
	and	%r26,	%r28,	%r26
	.word 0xc4ba9c5a  ! 1231: STDA_R	stda	%r2, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS406:
	.word 0xc8af823a  ! 1233: STBA_R	stba	%r4, [%r30 + %r26] 0x11
SHORT_FP_PRI407:
	.word 0xc99b5b1a  ! 1235: LDDFA_R	ldda	[%r13, %r26], %f4
CHANGE_CLE408:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc8dcd13a  ! 1238: LDXA_R	ldxa	[%r19, %r26] 0x89, %r4
	.word 0xc8b4903a  ! 1240: STHA_R	stha	%r4, [%r18 + %r26] 0x81
	.word 0xc8dc903a  ! 1242: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
	.word 0xc902801a  ! 1243: LDF_R	ld	[%r10, %r26], %f4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS410:
	.word 0xc897823a  ! 1245: LDUHA_R	lduha	[%r30, %r26] 0x11, %r4
NC_BIS_AIUS411:
	.word 0xd0afc57a  ! 1247: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
	.word 0xc8f3d11a  ! 1249: STXA_R	stxa	%r4, [%r15 + %r26] 0x88
	.word 0xc99ad15a  ! 1250: LDDFA_R	ldda	[%r11, %r26], %f4
NC_AIUS412:
	.word 0xc987c23a  ! 1252: LDFA_R	lda	[%r31, %r26], %f4
	.word 0xc822801a  ! 1253: STW_R	stw	%r4, [%r10 + %r26]
NC_BIS_AIUP413:
	.word 0xc4f6455a  ! 1255: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
CP_AIUP414:
	.word 0xc886021a  ! 1257: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r4
NC_AIUP415:
	.word 0xc986431a  ! 1259: LDFA_R	lda	[%r25, %r26], %f4
CP_BIS_QUAD_LD416:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1261: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
WR_LEASI_417:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_418:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8c4d13a  ! 1264: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r4
	.word 0xc894d03a  ! 1266: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc893901a  ! 1268: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
CP_BIS_NUC419:
	and	%r26,	%r28,	%r26
	.word 0xc8ad05fa  ! 1270: STBA_R	stba	%r4, [%r20 + %r26] 0x2f
	.word 0xc8ab901a  ! 1272: STBA_R	stba	%r4, [%r14 + %r26] 0x80
	.word 0xc894903a  ! 1274: LDUHA_R	lduha	[%r18, %r26] 0x81, %r4
	.word 0xc9ba911a  ! 1275: STDFA_R	stda	%f4, [%r26, %r10]
NC_NUC420:
	.word 0xc9a5419a  ! 1277: STFA_R	sta	%f4, [%r26, %r21]
	.word 0xc83b001a  ! 1278: STD_R	std	%r4, [%r12 + %r26]
	.word 0xc8cc913a  ! 1280: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r4
NC_PST_PRI421:
	.word 0xc9bb981a  ! 1282: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc884903a  ! 1284: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
CP_BIS_QUAD_LD422:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1d5a  ! 1286: LDDA_R	ldda	[%r12, %r26] 0xea, %r6
CP_AIUS423:
	.word 0xc887833a  ! 1288: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r4
NC_BIS_AIUP424:
	.word 0xc4b6445a  ! 1290: STHA_R	stha	%r2, [%r25 + %r26] 0x22
CP_BIS_NUC425:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 1292: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
	.word 0xc883911a  ! 1294: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r4
NC_SHORT_FP_SEC426:
	.word 0xc99cda7a  ! 1296: LDDFA_R	ldda	[%r19, %r26], %f4
NC_AIUS427:
	.word 0xc9bfc23a  ! 1298: STDFA_R	stda	%f4, [%r26, %r31]
	.word 0xc8a3901a  ! 1300: STWA_R	stwa	%r4, [%r14 + %r26] 0x80
CP_NUC428:
	.word 0xc8cd019a  ! 1302: LDSBA_R	ldsba	[%r20, %r26] 0x0c, %r4
	.word 0xc8cc511a  ! 1304: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r4
CHANGE_USER429:
	ta	T_CHANGE_NONPRIV
CHANGE_R26430:
	add	%r26,	%r27,	%r26
NC_BIS_PRI430:
	.word 0xd0ac1c5a  ! 1306: STBA_R	stba	%r8, [%r16 + %r26] 0xe2
CHANGE_PRIV431:
	ta	T_CHANGE_PRIV
CHANGE_R26432:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP432:
	and	%r26,	%r28,	%r26
	.word 0xccae055a  ! 1308: STBA_R	stba	%r6, [%r24 + %r26] 0x2a
	.word 0xc9bc903a  ! 1310: STDFA_R	stda	%f4, [%r26, %r18]
	.word 0xc983911a  ! 1312: LDFA_R	lda	[%r14, %r26], %f4
NC_BIS_AIUS433:
	.word 0xc4f7c47a  ! 1314: STXA_R	stxa	%r2, [%r31 + %r26] 0x23
CP_BIS_AIUP434:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 1316: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
CHANGE_R26435:
	add	%r26,	%r27,	%r26
CP_BIS_SEC435:
	and	%r26,	%r28,	%r26
	.word 0xc8a49d7a  ! 1318: STWA_R	stwa	%r4, [%r18 + %r26] 0xeb
	.word 0xc8ab901a  ! 1320: STBA_R	stba	%r4, [%r14 + %r26] 0x80
	.word 0xc9bb501a  ! 1321: STDFA_R	stda	%f4, [%r26, %r13]
NC_BLK_SEc436:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1323: STDFA_R	stda	%f0, [%r26, %r19]
CP_NUC437:
	.word 0xc8ad009a  ! 1325: STBA_R	stba	%r4, [%r20 + %r26] 0x04
	.word 0xc893d11a  ! 1327: LDUHA_R	lduha	[%r15, %r26] 0x88, %r4
NC_BIS_AIUP438:
	.word 0xc8b6455a  ! 1329: STHA_R	stha	%r4, [%r25 + %r26] 0x2a
	.word 0xc8f4903a  ! 1331: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
	.word 0xc82b601b  ! 1332: STB_I	stb	%r4, [%r13 + 0x001b]
NC_BIS_AIUS439:
	.word 0xccbfc47a  ! 1334: STDA_R	stda	%r6, [%r31 + %r26] 0x23
CP_PST_PRI440:
	.word 0xc9ba985a  ! 1336: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc884d13a  ! 1338: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
	.word 0xc984d03a  ! 1340: LDFA_R	lda	[%r19, %r26], %f4
	.word 0xc8acd03a  ! 1342: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc883515a  ! 1343: LDUWA_R	lduwa	[%r13, %r26] 0x8a, %r4
	.word 0xc9f3201a  ! 1344: CASXA_R	casxa	[%r12]%asi, %r26, %r4
	.word 0xc8232018  ! 1345: STW_I	stw	%r4, [%r12 + 0x0018]
	.word 0xc8cc903a  ! 1347: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
CHANGE_USER441:
	ta	T_CHANGE_NONPRIV
CHANGE_R26442:
	mov	%g0,	%r26
NC_BIS_PRI442:
	.word 0xc4f3dc5a  ! 1349: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
CHANGE_PRIV443:
	ta	T_CHANGE_PRIV
CHANGE_R26444:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD444:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 1351: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
CHANGE_USER445:
	ta	T_CHANGE_NONPRIV
CHANGE_R26446:
	add	%r26,	%r27,	%r26
NC_BIS_PRI446:
	.word 0xc4ab9c5a  ! 1353: STBA_R	stba	%r2, [%r14 + %r26] 0xe2
CHANGE_R26447:
	add	%r26,	%r27,	%r26
CP_BIS_SEC447:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 1355: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
	.word 0xc8d3901a  ! 1357: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r4
CHANGE_PRIV448:
	ta	T_CHANGE_PRIV
CHANGE_R26449:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP449:
	.word 0xccb6445a  ! 1359: STHA_R	stha	%r6, [%r25 + %r26] 0x22
NC_NUC450:
	.word 0xc89d419a  ! 1361: LDDA_R	ldda	[%r21, %r26] 0x0c, %r4
	.word 0xc88cd03a  ! 1363: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
CP_BIS_QUAD_LD451:
	and	%r26,	%r29,	%r26
	.word 0xcc9b5c5a  ! 1365: LDDA_R	ldda	[%r13, %r26] 0xe2, %r6
SHORT_FP_PRI452:
	.word 0xc99b1b1a  ! 1367: LDDFA_R	ldda	[%r12, %r26], %f4
	.word 0xc88cd03a  ! 1369: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
	.word 0xc91b6018  ! 1370: LDDF_I	ldd	[%r13, 0x0018], %f4
	.word 0xc903001a  ! 1371: LDF_R	ld	[%r12, %r26], %f4
NC_NUC453:
	.word 0xc8f5409a  ! 1373: STXA_R	stxa	%r4, [%r21 + %r26] 0x04
CP_NUC454:
	.word 0xc9a5019a  ! 1375: STFA_R	sta	%f4, [%r26, %r20]
CP_AIUS455:
	.word 0xc8af823a  ! 1377: STBA_R	stba	%r4, [%r30 + %r26] 0x11
	.word 0xc8acd13a  ! 1379: STBA_R	stba	%r4, [%r19 + %r26] 0x89
SHORT_FP_PRI456:
	.word 0xc9bb1b1a  ! 1381: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc8ba911a  ! 1382: STDA_R	stda	%r4, [%r10 + %r26] 0x88
	.word 0xc873001a  ! 1383: STX_R	stx	%r4, [%r12 + %r26]
	.word 0xc884d13a  ! 1385: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
NC_BIS_SEC457:
	.word 0xc8b4dc7a  ! 1387: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
NC_BIS_AIUP458:
	.word 0xd0b6455a  ! 1389: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
	.word 0xc984d03a  ! 1391: LDFA_R	lda	[%r19, %r26], %f4
	.word 0xc85ac01a  ! 1392: LDX_R	ldx	[%r11 + %r26], %r4
NC_NUC459:
	.word 0xc8a5419a  ! 1394: STWA_R	stwa	%r4, [%r21 + %r26] 0x0c
CP_AIUP460:
	.word 0xc886021a  ! 1396: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r4
	.word 0xc88cd03a  ! 1398: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
CHANGE_R26461:
	add	%r26,	%r27,	%r26
CP_BIS_SEC461:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 1400: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CHANGE_R26462:
	add	%r26,	%r27,	%r26
CP_BIS_SEC462:
	and	%r26,	%r28,	%r26
	.word 0xc8f49d7a  ! 1402: STXA_R	stxa	%r4, [%r18 + %r26] 0xeb
	.word 0xc91a801a  ! 1403: LDDF_R	ldd	[%r10, %r26], %f4
	.word 0xc89c903a  ! 1405: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CP_ATM_QUAD_LD463:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1407: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
SET_TL1_464:
	ta	T_CHANGE_TO_TL1
CHANGE_R26465:
	add	%r26,	%r27,	%r26
NC_BIS_NUC465:
	.word 0xccf544fa  ! 1409: STXA_R	stxa	%r6, [%r21 + %r26] 0x27
	.word 0xc8aa901a  ! 1410: STBA_R	stba	%r4, [%r10 + %r26] 0x80
	.word 0xc8bc903a  ! 1412: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc9a4903a  ! 1414: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc8db511a  ! 1415: LDXA_R	ldxa	[%r13, %r26] 0x88, %r4
BLK_PRI466:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 1417: LDDFA_R	ldda	[%r13, %r26], %f16
BLK_PRI467:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 1419: LDDFA_R	ldda	[%r11, %r26], %f0
NC_NUC468:
	.word 0xc8ad409a  ! 1421: STBA_R	stba	%r4, [%r21 + %r26] 0x04
NC_PST_PRI469:
	.word 0xc9bb981a  ! 1423: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc99cd13a  ! 1425: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc87aa018  ! 1426: SWAP_I	swap	%r4, [%r10 + 0x0018]
NC_AIUP470:
	.word 0xc88e421a  ! 1428: LDUBA_R	lduba	[%r25, %r26] 0x10, %r4
	.word 0xc93aa018  ! 1429: STDF_I	std	%f4, [0x0018, %r10]
NC_BIS_NUC471:
	.word 0xc4ad45fa  ! 1431: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
BLK_PRI472:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 1433: STDFA_R	stda	%f16, [%r26, %r10]
CP_BIS_AIUP473:
	and	%r26,	%r28,	%r26
	.word 0xcca6055a  ! 1435: STWA_R	stwa	%r6, [%r24 + %r26] 0x2a
	.word 0xc88cd03a  ! 1437: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
NC_AIUS474:
	.word 0xc9bfc23a  ! 1439: STDFA_R	stda	%f4, [%r26, %r31]
	.word 0xc9a4d13a  ! 1441: STFA_R	sta	%f4, [%r26, %r19]
	.word 0xc8eb501a  ! 1442: LDSTUBA_R	ldstuba	%r4, [%r13 + %r26] 0x80
CP_AIUP475:
	.word 0xc8d6021a  ! 1444: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r4
CHANGE_R26476:
	mov	%g0,	%r26
CP_BIS_SEC476:
	and	%r26,	%r28,	%r26
	.word 0xd0f49c7a  ! 1447: STXA_R	stxa	%r8, [%r18 + %r26] 0xe3
	.word 0xc8d4903a  ! 1449: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc8b4511a  ! 1451: STHA_R	stha	%r4, [%r17 + %r26] 0x88
CHANGE_R26477:
	add	%r26,	%r27,	%r26
CP_BIS_SEC477:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 1453: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
	.word 0xc91b2018  ! 1454: LDDF_I	ldd	[%r12, 0x0018], %f4
NC_BIS_AIUS478:
	.word 0xccf7c57a  ! 1456: STXA_R	stxa	%r6, [%r31 + %r26] 0x2b
	.word 0xc8c4903a  ! 1458: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r4
	.word 0xc8acd03a  ! 1460: STBA_R	stba	%r4, [%r19 + %r26] 0x81
NC_BIS_NUC479:
	.word 0xd0b545fa  ! 1462: STHA_R	stha	%r8, [%r21 + %r26] 0x2f
	.word 0xc9a4903a  ! 1464: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc91ae018  ! 1465: LDDF_I	ldd	[%r11, 0x0018], %f4
SET_TL0_480:
	ta	T_CHANGE_TO_TL0
CHANGE_R26481:
	add	%r26,	%r27,	%r26
NC_BIS_SEC481:
	.word 0xc4acdc7a  ! 1467: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS483:
	.word 0xc897c23a  ! 1469: LDUHA_R	lduha	[%r31, %r26] 0x11, %r4
CHANGE_R26484:
	add	%r26,	%r27,	%r26
CP_BIS_SEC484:
	and	%r26,	%r28,	%r26
	.word 0xc49c9c7a  ! 1471: LDDA_R	ldda	[%r18, %r26] 0xe3, %r2
	.word 0xc923401a  ! 1472: STF_R	st	%f4, [%r26, %r13]
	.word 0xc8a4d13a  ! 1474: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
	.word 0xc8a4d13a  ! 1476: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
BLK_PRI485:
	and	%r26,	%r29,	%r26
	.word 0xc19a9f1a  ! 1478: LDDFA_R	ldda	[%r10, %r26], %f0
WR_LEASI_486:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_487:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUS488:
	.word 0xc897c23a  ! 1481: LDUHA_R	lduha	[%r31, %r26] 0x11, %r4
SET_TL1_489:
	ta	T_CHANGE_TO_TL1
CHANGE_R26490:
	add	%r26,	%r27,	%r26
NC_BIS_NUC490:
	.word 0xd0bd45fa  ! 1483: STDA_R	stda	%r8, [%r21 + %r26] 0x2f
CP_AIUP491:
	.word 0xc8ae031a  ! 1485: STBA_R	stba	%r4, [%r24 + %r26] 0x18
CP_BIS_QUAD_LD492:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1487: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc8ac913a  ! 1489: STBA_R	stba	%r4, [%r18 + %r26] 0x89
	.word 0xc8cc903a  ! 1491: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
NC_BLK_SEc493:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 1493: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc91b2018  ! 1494: LDDF_I	ldd	[%r12, 0x0018], %f4
	.word 0xc884101a  ! 1496: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r4
	.word 0xc3eac29a  ! 1498: PREFETCHA_R	prefetcha	[%r11, %r26] 0x14, #one_read
CP_AIUS494:
	.word 0xc8d7833a  ! 1500: LDSHA_R	ldsha	[%r30, %r26] 0x19, %r4
	.word 0xc894903a  ! 1502: LDUHA_R	lduha	[%r18, %r26] 0x81, %r4
	.word 0xc8acd13a  ! 1504: STBA_R	stba	%r4, [%r19 + %r26] 0x89
SET_TL0_495:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI496:
	.word 0xccabdc5a  ! 1506: STBA_R	stba	%r6, [%r15 + %r26] 0xe2
	.word 0xc8cc903a  ! 1508: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
	.word 0xc9a3d11a  ! 1510: STFA_R	sta	%f4, [%r26, %r15]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP498:
	.word 0xc8c6021a  ! 1512: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r4
CP_BIS_AIUP499:
	and	%r26,	%r28,	%r26
	.word 0xc4ae055a  ! 1514: STBA_R	stba	%r2, [%r24 + %r26] 0x2a
NC_BIS_AIUP500:
	.word 0xc8f6445a  ! 1516: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
	.word 0xc8fad01a  ! 1517: SWAPA_R	swapa	%r4, [%r11 + %r26] 0x80
	.word 0xc99a901a  ! 1518: LDDFA_R	ldda	[%r10, %r26], %f4
NC_PST_PRI501:
	.word 0xc9bc189a  ! 1520: STDFA_R	stda	%f4, [%r26, %r16]
	.word 0xc8a4d03a  ! 1522: STWA_R	stwa	%r4, [%r19 + %r26] 0x81
	.word 0xc86b201b  ! 1523: LDSTUB_I	ldstub	%r4, [%r12 + 0x001b]
NC_NUC502:
	.word 0xc8bd409a  ! 1525: STDA_R	stda	%r4, [%r21 + %r26] 0x04
CHANGE_USER503:
	ta	T_CHANGE_NONPRIV
CHANGE_R26504:
	add	%r26,	%r27,	%r26
NC_BIS_PRI504:
	.word 0xc8f39c5a  ! 1527: STXA_R	stxa	%r4, [%r14 + %r26] 0xe2
	.word 0xc884111a  ! 1529: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r4
	.word 0xc9bb111a  ! 1530: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc842801a  ! 1531: LDSW_R	ldsw	[%r10 + %r26], %r4
	.word 0xc8b4d03a  ! 1533: STHA_R	stha	%r4, [%r19 + %r26] 0x81
CP_PST_PRI505:
	.word 0xc9ba999a  ! 1535: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8bcd03a  ! 1537: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc99c903a  ! 1539: LDDFA_R	ldda	[%r18, %r26], %f4
	.word 0xc8f4903a  ! 1541: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
CHANGE_R26506:
	mov	%g0,	%r26
CP_BIS_SEC506:
	and	%r26,	%r28,	%r26
	.word 0xd0bc9d7a  ! 1543: STDA_R	stda	%r8, [%r18 + %r26] 0xeb
CHANGE_PRIV507:
	ta	T_CHANGE_PRIV
CHANGE_R26508:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP508:
	and	%r26,	%r28,	%r26
	.word 0xd0be055a  ! 1545: STDA_R	stda	%r8, [%r24 + %r26] 0x2a
CHANGE_USER509:
	ta	T_CHANGE_NONPRIV
CHANGE_R26510:
	add	%r26,	%r27,	%r26
NC_BIS_PRI510:
	.word 0xcca3dc5a  ! 1547: STWA_R	stwa	%r6, [%r15 + %r26] 0xe2
	.word 0xc8ac903a  ! 1549: STBA_R	stba	%r4, [%r18 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC512:
	.word 0xc99d009a  ! 1551: LDDFA_R	ldda	[%r20, %r26], %f4
	.word 0xc9f3201a  ! 1552: CASXA_R	casxa	[%r12]%asi, %r26, %r4
CP_PST_PRI513:
	.word 0xc9bad81a  ! 1554: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc982901a  ! 1555: LDFA_R	lda	[%r10, %r26], %f4
	.word 0xc8a4d13a  ! 1557: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
	.word 0xc9a4913a  ! 1559: STFA_R	sta	%f4, [%r26, %r18]
CP_BIS_NUC514:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 1561: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
	.word 0xc8c4d03a  ! 1563: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CP_BIS_AIUP515:
	and	%r26,	%r28,	%r26
	.word 0xc49e055a  ! 1565: LDDA_R	ldda	[%r24, %r26] 0x2a, %r2
	.word 0xc88cd03a  ! 1567: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
CHANGE_USER516:
	ta	T_CHANGE_NONPRIV
CHANGE_R26517:
	add	%r26,	%r27,	%r26
CP_BIS_PRI517:
	and	%r26,	%r28,	%r26
	.word 0xccaa9c5a  ! 1569: STBA_R	stba	%r6, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP519:
	.word 0xc9a6031a  ! 1571: STFA_R	sta	%f4, [%r26, %r24]
NC_BIS_SEC520:
	.word 0xd0a4dd7a  ! 1573: STWA_R	stwa	%r8, [%r19 + %r26] 0xeb
	.word 0xc8acd03a  ! 1575: STBA_R	stba	%r4, [%r19 + %r26] 0x81
CHANGE_TLE521:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS523:
	.word 0xc88fc23a  ! 1578: LDUBA_R	lduba	[%r31, %r26] 0x11, %r4
NC_BIS_AIUS524:
	.word 0xd0a7c47a  ! 1580: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
	.word 0xc813201a  ! 1581: LDUH_I	lduh	[%r12 + 0x001a], %r4
NC_BIS_AIUP525:
	.word 0xccae445a  ! 1583: STBA_R	stba	%r6, [%r25 + %r26] 0x22
SET_TL1_526:
	ta	T_CHANGE_TO_TL1
CHANGE_R26527:
	add	%r26,	%r27,	%r26
NC_BIS_NUC527:
	.word 0xc8ad45fa  ! 1585: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
	.word 0xc8ac903a  ! 1587: STBA_R	stba	%r4, [%r18 + %r26] 0x81
	.word 0xc89b501a  ! 1588: LDDA_R	ldda	[%r13, %r26] 0x80, %r4
	.word 0xc8a4d03a  ! 1590: STWA_R	stwa	%r4, [%r19 + %r26] 0x81
NC_PST_PRI528:
	.word 0xc9bb985a  ! 1592: STDFA_R	stda	%f4, [%r26, %r14]
BLK_PRI529:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 1594: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc9ba911a  ! 1595: STDFA_R	stda	%f4, [%r26, %r10]
NC_BIS_AIUS530:
	.word 0xd0f7c57a  ! 1597: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
CP_ATM_QUAD_LD531:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 1599: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
NC_BIS_AIUS532:
	.word 0xc4afc47a  ! 1601: STBA_R	stba	%r2, [%r31 + %r26] 0x23
SHORT_FP_PRI533:
	.word 0xc9bada1a  ! 1603: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc9e2a01a  ! 1604: CASA_R	casa	[%r10] %asi, %r26, %r4
NC_SHORT_FP_SEC534:
	.word 0xc99cdb7a  ! 1606: LDDFA_R	ldda	[%r19, %r26], %f4
CP_BIS_QUAD_LD535:
	and	%r26,	%r29,	%r26
	.word 0xd09b5c5a  ! 1608: LDDA_R	ldda	[%r13, %r26] 0xe2, %r8
NC_BIS_AIUP536:
	.word 0xc4be445a  ! 1610: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_PST_PRI537:
	.word 0xc9bb999a  ! 1612: STDFA_R	stda	%f4, [%r26, %r14]
CP_BIS_AIUP538:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 1614: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
	.word 0xc8ccd13a  ! 1616: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r4
CP_ATM_QUAD_LD539:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1618: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc99c903a  ! 1620: LDDFA_R	ldda	[%r18, %r26], %f4
CP_NUC540:
	.word 0xc8fd019a  ! 1622: SWAPA_R	swapa	%r4, [%r20 + %r26] 0x0c
CHANGE_R26541:
	mov	%g0,	%r26
CP_BIS_SEC541:
	and	%r26,	%r28,	%r26
	.word 0xccac9d7a  ! 1624: STBA_R	stba	%r6, [%r18 + %r26] 0xeb
	.word 0xc813201a  ! 1625: LDUH_I	lduh	[%r12 + 0x001a], %r4
SET_TL0_542:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI543:
	.word 0xccac1d5a  ! 1627: STBA_R	stba	%r6, [%r16 + %r26] 0xea
	.word 0xc8b4511a  ! 1629: STHA_R	stha	%r4, [%r17 + %r26] 0x88
SHORT_FP_PRI544:
	.word 0xc99adb5a  ! 1631: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc823401a  ! 1632: STW_R	stw	%r4, [%r13 + %r26]
	.word 0xc89c913a  ! 1634: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
CHANGE_R26545:
	add	%r26,	%r27,	%r26
CP_BIS_SEC545:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 1636: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
NC_BIS_SEC546:
	.word 0xd0bcdd7a  ! 1638: STDA_R	stda	%r8, [%r19 + %r26] 0xeb
CHANGE_PRIV547:
	ta	T_CHANGE_PRIV
CHANGE_R26548:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD548:
	and	%r26,	%r29,	%r26
	.word 0xc89b449a  ! 1640: LDDA_R	ldda	[%r13, %r26] 0x24, %r4
	.word 0xc984511a  ! 1642: LDFA_R	lda	[%r17, %r26], %f4
	.word 0xc8a3901a  ! 1644: STWA_R	stwa	%r4, [%r14 + %r26] 0x80
CP_BIS_QUAD_LD549:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 1646: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
CP_NUC550:
	.word 0xc8a5019a  ! 1648: STWA_R	stwa	%r4, [%r20 + %r26] 0x0c
CP_ATM_QUAD_LD551:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1650: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc984903a  ! 1652: LDFA_R	lda	[%r18, %r26], %f4
CP_ATM_QUAD_LD552:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1654: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc8a3d01a  ! 1656: STWA_R	stwa	%r4, [%r15 + %r26] 0x80
CHANGE_TLE553:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc8d3511a  ! 1658: LDSHA_R	ldsha	[%r13, %r26] 0x88, %r4
	.word 0xc8c4903a  ! 1660: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r4
	.word 0xc8032018  ! 1661: LDUW_I	lduw	[%r12 + 0x0018], %r4
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP555:
	.word 0xc89e021a  ! 1663: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
NC_BIS_AIUS556:
	.word 0xc8b7c57a  ! 1665: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
SET_TL1_557:
	ta	T_CHANGE_TO_TL1
CHANGE_R26558:
	add	%r26,	%r27,	%r26
NC_BIS_NUC558:
	.word 0xc8b544fa  ! 1667: STHA_R	stha	%r4, [%r21 + %r26] 0x27
	.word 0xc893515a  ! 1668: LDUHA_R	lduha	[%r13, %r26] 0x8a, %r4
CP_BIS_AIUS559:
	and	%r26,	%r28,	%r26
	.word 0xccaf857a  ! 1670: STBA_R	stba	%r6, [%r30 + %r26] 0x2b
NC_BLK_SEc560:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 1672: LDDFA_R	ldda	[%r19, %r26], %f16
CP_AIUS561:
	.word 0xc897833a  ! 1674: LDUHA_R	lduha	[%r30, %r26] 0x19, %r4
CP_AIUS562:
	.word 0xc897833a  ! 1676: LDUHA_R	lduha	[%r30, %r26] 0x19, %r4
NC_AIUS563:
	.word 0xc8c7c23a  ! 1678: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r4
NC_BIS_AIUS564:
	.word 0xc4a7c57a  ! 1680: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
NC_NUC565:
	.word 0xc885419a  ! 1682: LDUWA_R	lduwa	[%r21, %r26] 0x0c, %r4
	.word 0xc892d01a  ! 1683: LDUHA_R	lduha	[%r11, %r26] 0x80, %r4
	.word 0xc8eb501a  ! 1684: LDSTUBA_R	ldstuba	%r4, [%r13 + %r26] 0x80
	.word 0xc884d03a  ! 1686: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r4
	.word 0xc8236018  ! 1687: STW_I	stw	%r4, [%r13 + 0x0018]
	.word 0xc88cd13a  ! 1689: LDUBA_R	lduba	[%r19, %r26] 0x89, %r4
	.word 0xc8c3911a  ! 1691: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r4
	.word 0xc9ba901a  ! 1692: STDFA_R	stda	%f4, [%r26, %r10]
NC_PST_PRI566:
	.word 0xc9bc585a  ! 1694: STDFA_R	stda	%f4, [%r26, %r17]
	.word 0xc8b4d03a  ! 1696: STHA_R	stha	%r4, [%r19 + %r26] 0x81
NC_BIS_AIUP567:
	.word 0xd0a6445a  ! 1698: STWA_R	stwa	%r8, [%r25 + %r26] 0x22
SHORT_FP_PRI568:
	.word 0xc9bb5a1a  ! 1700: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc88c101a  ! 1702: LDUBA_R	lduba	[%r16, %r26] 0x80, %r4
NC_BIS_NUC569:
	.word 0xc4a545fa  ! 1704: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc8ac913a  ! 1706: STBA_R	stba	%r4, [%r18 + %r26] 0x89
	.word 0xc884903a  ! 1708: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc984903a  ! 1710: LDFA_R	lda	[%r18, %r26], %f4
CP_AIUS570:
	.word 0xc88f823a  ! 1712: LDUBA_R	lduba	[%r30, %r26] 0x11, %r4
CP_NUC571:
	.word 0xc8ed009a  ! 1714: LDSTUBA_R	ldstuba	%r4, [%r20 + %r26] 0x04
	.word 0xc8acd13a  ! 1716: STBA_R	stba	%r4, [%r19 + %r26] 0x89
NC_PST_PRI572:
	.word 0xc9bb985a  ! 1718: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc984d13a  ! 1720: LDFA_R	lda	[%r19, %r26], %f4
NC_BLK_SEc573:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1722: STDFA_R	stda	%f0, [%r26, %r19]
CP_AIUP574:
	.word 0xc8ae021a  ! 1724: STBA_R	stba	%r4, [%r24 + %r26] 0x10
	.word 0xc86b001a  ! 1725: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
NC_BIS_NUC575:
	.word 0xd0bd45fa  ! 1727: STDA_R	stda	%r8, [%r21 + %r26] 0x2f
	.word 0xc8bc101a  ! 1729: STDA_R	stda	%r4, [%r16 + %r26] 0x80
CP_AIUP576:
	.word 0xc9a6021a  ! 1731: STFA_R	sta	%f4, [%r26, %r24]
SHORT_FP_PRI577:
	.word 0xc9bb1a1a  ! 1733: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc93a801a  ! 1734: STDF_R	std	%f4, [%r26, %r10]
	.word 0xc99ad11a  ! 1735: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc902801a  ! 1736: LDF_R	ld	[%r10, %r26], %f4
CP_AIUS578:
	.word 0xc89f823a  ! 1738: LDDA_R	ldda	[%r30, %r26] 0x11, %r4
	.word 0xc9a3501a  ! 1739: STFA_R	sta	%f4, [%r26, %r13]
CP_NUC579:
	.word 0xc8c5009a  ! 1741: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r4
NC_BIS_AIUS580:
	.word 0xc4a7c57a  ! 1743: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
	.word 0xc88c903a  ! 1745: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
	.word 0xc8f3d01a  ! 1747: STXA_R	stxa	%r4, [%r15 + %r26] 0x80
SHORT_FP_PRI581:
	.word 0xc9ba9b1a  ! 1749: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8abd01a  ! 1751: STBA_R	stba	%r4, [%r15 + %r26] 0x80
	.word 0xc982915a  ! 1752: LDFA_R	lda	[%r10, %r26], %f4
NC_NUC582:
	.word 0xc8f5409a  ! 1754: STXA_R	stxa	%r4, [%r21 + %r26] 0x04
SET_TL0_583:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI584:
	.word 0xccb41c5a  ! 1756: STHA_R	stha	%r6, [%r16 + %r26] 0xe2
NC_BIS_SEC585:
	.word 0xd0acdd7a  ! 1758: STBA_R	stba	%r8, [%r19 + %r26] 0xeb
	.word 0xc8ea911a  ! 1759: LDSTUBA_R	ldstuba	%r4, [%r10 + %r26] 0x88
NC_BIS_SEC586:
	.word 0xc4f4dc7a  ! 1761: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xc93ae018  ! 1762: STDF_I	std	%f4, [0x0018, %r11]
	.word 0xc8cbd11a  ! 1764: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r4
	.word 0xc8a4d13a  ! 1766: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
	.word 0xc8f4d03a  ! 1768: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
	.word 0xc892d01a  ! 1769: LDUHA_R	lduha	[%r11, %r26] 0x80, %r4
CHANGE_PRIV587:
	ta	T_CHANGE_PRIV
CHANGE_R26588:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP588:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 1771: STDA_R	stda	%r6, [%r24 + %r26] 0x22
	.word 0xc894d03a  ! 1773: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc89cd03a  ! 1775: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
CHANGE_R26589:
	add	%r26,	%r27,	%r26
CP_BIS_SEC589:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9d7a  ! 1777: STBA_R	stba	%r2, [%r18 + %r26] 0xeb
	.word 0xc872e018  ! 1778: STX_I	stx	%r4, [%r11 + 0x0018]
NC_AIUP590:
	.word 0xc88e421a  ! 1780: LDUBA_R	lduba	[%r25, %r26] 0x10, %r4
SHORT_FP_PRI591:
	.word 0xc99a9a1a  ! 1782: LDDFA_R	ldda	[%r10, %r26], %f4
SET_TL1_592:
	ta	T_CHANGE_TO_TL1
CHANGE_R26593:
	add	%r26,	%r27,	%r26
NC_BIS_NUC593:
	.word 0xc4ad44fa  ! 1784: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xc8ac913a  ! 1786: STBA_R	stba	%r4, [%r18 + %r26] 0x89
	.word 0xc8fa911a  ! 1787: SWAPA_R	swapa	%r4, [%r10 + %r26] 0x88
	.word 0xc91b6018  ! 1788: LDDF_I	ldd	[%r13, 0x0018], %f4
CP_BIS_AIUP594:
	and	%r26,	%r28,	%r26
	.word 0xc4f6045a  ! 1790: STXA_R	stxa	%r2, [%r24 + %r26] 0x22
	.word 0xc8ab901a  ! 1792: STBA_R	stba	%r4, [%r14 + %r26] 0x80
NC_BIS_NUC595:
	.word 0xc4b544fa  ! 1794: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc86a801a  ! 1795: LDSTUB_R	ldstub	%r4, [%r10 + %r26]
	.word 0xc9a4913a  ! 1797: STFA_R	sta	%f4, [%r26, %r18]
CP_NUC596:
	.word 0xc8d5009a  ! 1799: LDSHA_R	ldsha	[%r20, %r26] 0x04, %r4
NC_AIUP597:
	.word 0xc9a6421a  ! 1801: STFA_R	sta	%f4, [%r26, %r25]
	.word 0xc922a018  ! 1802: STF_I	st	%f4, [0x0018, %r10]
CP_NUC598:
	.word 0xc9a5009a  ! 1804: STFA_R	sta	%f4, [%r26, %r20]
CP_BIS_AIUS599:
	and	%r26,	%r28,	%r26
	.word 0xd0f7847a  ! 1806: STXA_R	stxa	%r8, [%r30 + %r26] 0x23
	.word 0xc9bad01a  ! 1807: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc87b2018  ! 1808: SWAP_I	swap	%r4, [%r12 + 0x0018]
SET_TL0_600:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI601:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 1810: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC603:
	.word 0xc88d019a  ! 1812: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r4
NC_BIS_SEC604:
	.word 0xc4acdd7a  ! 1814: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xc894913a  ! 1816: LDUHA_R	lduha	[%r18, %r26] 0x89, %r4
NC_AIUP605:
	.word 0xc896421a  ! 1818: LDUHA_R	lduha	[%r25, %r26] 0x10, %r4
	.word 0xc88c903a  ! 1820: LDUBA_R	lduba	[%r18, %r26] 0x81, %r4
CHANGE_USER606:
	ta	T_CHANGE_NONPRIV
CHANGE_R26607:
	add	%r26,	%r27,	%r26
CP_BIS_PRI607:
	and	%r26,	%r28,	%r26
	.word 0xc8a29d5a  ! 1822: STWA_R	stwa	%r4, [%r10 + %r26] 0xea
	.word 0xc84a801a  ! 1823: LDSB_R	ldsb	[%r10 + %r26], %r4
	.word 0xc89c903a  ! 1825: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
CHANGE_PRIV608:
	ta	T_CHANGE_PRIV
CHANGE_R26609:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP609:
	and	%r26,	%r28,	%r26
	.word 0xc4a6045a  ! 1827: STWA_R	stwa	%r2, [%r24 + %r26] 0x22
	.word 0xc982d01a  ! 1828: LDFA_R	lda	[%r11, %r26], %f4
	.word 0xc893901a  ! 1830: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
SET_TL1_610:
	ta	T_CHANGE_TO_TL1
CHANGE_R26611:
	add	%r26,	%r27,	%r26
NC_BIS_NUC611:
	.word 0xccbd44fa  ! 1832: STDA_R	stda	%r6, [%r21 + %r26] 0x27
CP_BIS_AIUP612:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 1834: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
NC_PST_PRI613:
	.word 0xc9bc589a  ! 1836: STDFA_R	stda	%f4, [%r26, %r17]
	.word 0xc89cd03a  ! 1838: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
SET_TL0_614:
	ta	T_CHANGE_TO_TL0
CHANGE_R26615:
	add	%r26,	%r27,	%r26
NC_BIS_SEC615:
	.word 0xcca4dc7a  ! 1840: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS617:
	.word 0xc897c33a  ! 1842: LDUHA_R	lduha	[%r31, %r26] 0x19, %r4
	.word 0xc8d4511a  ! 1844: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r4
	.word 0xc8bad01a  ! 1845: STDA_R	stda	%r4, [%r11 + %r26] 0x80
CP_BIS_NUC618:
	and	%r26,	%r28,	%r26
	.word 0xc8b504fa  ! 1847: STHA_R	stha	%r4, [%r20 + %r26] 0x27
	.word 0xc8a3d01a  ! 1849: STWA_R	stwa	%r4, [%r15 + %r26] 0x80
	.word 0xc884d03a  ! 1851: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r4
CP_BIS_NUC619:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 1853: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
CHANGE_USER620:
	ta	T_CHANGE_NONPRIV
CHANGE_R26621:
	add	%r26,	%r27,	%r26
NC_BIS_PRI621:
	.word 0xc4b45c5a  ! 1855: STHA_R	stha	%r2, [%r17 + %r26] 0xe2
NC_BIS_SEC622:
	.word 0xd0a4dc7a  ! 1857: STWA_R	stwa	%r8, [%r19 + %r26] 0xe3
CHANGE_PRIV623:
	ta	T_CHANGE_PRIV
CHANGE_R26624:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS624:
	.word 0xd0a7c47a  ! 1859: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
	.word 0xc9236018  ! 1860: STF_I	st	%f4, [0x0018, %r13]
NC_SHORT_FP_SEC625:
	.word 0xc99cdb7a  ! 1862: LDDFA_R	ldda	[%r19, %r26], %f4
CP_ATM_QUAD_LD626:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 1864: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc84b401a  ! 1865: LDSB_R	ldsb	[%r13 + %r26], %r4
SET_TL1_627:
	ta	T_CHANGE_TO_TL1
CHANGE_R26628:
	mov	%g0,	%r26
NC_BIS_NUC628:
	.word 0xc4a544fa  ! 1867: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xc89c501a  ! 1869: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
NC_AIUP629:
	.word 0xc8be421a  ! 1871: STDA_R	stda	%r4, [%r25 + %r26] 0x10
	.word 0xc8acd03a  ! 1873: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc56e6022  ! 1875: PREFETCH_I	prefetch	[%r25 + 0x0022], #n_writes
	.word 0xc8a2d01a  ! 1876: STWA_R	stwa	%r4, [%r11 + %r26] 0x80
SET_TL0_630:
	ta	T_CHANGE_TO_TL0
CHANGE_R26631:
	add	%r26,	%r27,	%r26
NC_BIS_SEC631:
	.word 0xd0acdc7a  ! 1878: STBA_R	stba	%r8, [%r19 + %r26] 0xe3
	.word 0xc8f4903a  ! 1880: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
NC_PST_PRI632:
	.word 0xc9bb981a  ! 1882: STDFA_R	stda	%f4, [%r26, %r14]
CP_PST_PRI633:
	.word 0xc9ba981a  ! 1884: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc93b401a  ! 1885: STDF_R	std	%f4, [%r26, %r13]
CHANGE_PRIV634:
	ta	T_CHANGE_PRIV
CHANGE_R26635:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD635:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1887: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
	.word 0xc9a3501a  ! 1888: STFA_R	sta	%f4, [%r26, %r13]
	.word 0xc88cd03a  ! 1890: LDUBA_R	lduba	[%r19, %r26] 0x81, %r4
	.word 0xc8dcd03a  ! 1892: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
	.word 0xc8bc903a  ! 1894: STDA_R	stda	%r4, [%r18 + %r26] 0x81
CP_AIUP636:
	.word 0xc886021a  ! 1896: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r4
NC_PST_PRI637:
	.word 0xc9bb981a  ! 1898: STDFA_R	stda	%f4, [%r26, %r14]
SET_TL1_638:
	ta	T_CHANGE_TO_TL1
CHANGE_R26639:
	add	%r26,	%r27,	%r26
NC_BIS_NUC639:
	.word 0xc4ad44fa  ! 1900: STBA_R	stba	%r2, [%r21 + %r26] 0x27
NC_BIS_NUC640:
	.word 0xc8a545fa  ! 1902: STWA_R	stwa	%r4, [%r21 + %r26] 0x2f
	.word 0xc9f2a01a  ! 1903: CASXA_R	casxa	[%r10]%asi, %r26, %r4
NC_BIS_NUC641:
	.word 0xd0f544fa  ! 1905: STXA_R	stxa	%r8, [%r21 + %r26] 0x27
CHANGE_R26642:
	add	%r26,	%r27,	%r26
CP_BIS_SEC642:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 1907: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
CP_AIUS643:
	.word 0xc8c7823a  ! 1909: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r4
	.word 0xc883111a  ! 1910: LDUWA_R	lduwa	[%r12, %r26] 0x88, %r4
NC_PST_PRI644:
	.word 0xc9bb981a  ! 1912: STDFA_R	stda	%f4, [%r26, %r14]
CHANGE_R26645:
	add	%r26,	%r27,	%r26
CP_BIS_SEC645:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9d7a  ! 1914: STBA_R	stba	%r8, [%r18 + %r26] 0xeb
CP_BIS_NUC646:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 1916: STBA_R	stba	%r8, [%r20 + %r26] 0x27
CP_BIS_NUC647:
	and	%r26,	%r28,	%r26
	.word 0xd0ad05fa  ! 1918: STBA_R	stba	%r8, [%r20 + %r26] 0x2f
CP_NUC648:
	.word 0xc88d019a  ! 1920: LDUBA_R	lduba	[%r20, %r26] 0x0c, %r4
	.word 0xc83aa018  ! 1921: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc8f4913a  ! 1923: STXA_R	stxa	%r4, [%r18 + %r26] 0x89
CP_PST_PRI649:
	.word 0xc9ba981a  ! 1925: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8c4d03a  ! 1928: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
	.word 0xc89c511a  ! 1930: LDDA_R	ldda	[%r17, %r26] 0x88, %r4
	.word 0xc8da901a  ! 1931: LDXA_R	ldxa	[%r10, %r26] 0x80, %r4
	.word 0xc9a2911a  ! 1932: STFA_R	sta	%f4, [%r26, %r10]
CP_BIS_NUC650:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 1934: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
CP_BIS_NUC651:
	and	%r26,	%r28,	%r26
	.word 0xd0ad04fa  ! 1936: STBA_R	stba	%r8, [%r20 + %r26] 0x27
BLK_PRI652:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1f1a  ! 1938: STDFA_R	stda	%f16, [%r26, %r12]
BLK_PRI653:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 1940: LDDFA_R	ldda	[%r11, %r26], %f0
CP_BIS_NUC654:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 1942: STBA_R	stba	%r2, [%r20 + %r26] 0x27
CP_BIS_AIUP655:
	and	%r26,	%r28,	%r26
	.word 0xc8a6045a  ! 1944: STWA_R	stwa	%r4, [%r24 + %r26] 0x22
	.word 0xc85b001a  ! 1945: LDX_R	ldx	[%r12 + %r26], %r4
NC_AIUP656:
	.word 0xc8d6431a  ! 1947: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r4
CP_PST_PRI657:
	.word 0xc9bad81a  ! 1949: STDFA_R	stda	%f4, [%r26, %r11]
CP_AIUP658:
	.word 0xc8de021a  ! 1951: LDXA_R	ldxa	[%r24, %r26] 0x10, %r4
	.word 0xc89c903a  ! 1953: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xc8cc913a  ! 1955: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r4
	.word 0xc8a4d03a  ! 1957: STWA_R	stwa	%r4, [%r19 + %r26] 0x81
	.word 0xc8ac913a  ! 1959: STBA_R	stba	%r4, [%r18 + %r26] 0x89
	.word 0xc99b105a  ! 1960: LDDFA_R	ldda	[%r12, %r26], %f4
	.word 0xc8a2901a  ! 1961: STWA_R	stwa	%r4, [%r10 + %r26] 0x80
	.word 0xc89cd03a  ! 1963: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
SET_TL0_659:
	ta	T_CHANGE_TO_TL0
CHANGE_R26660:
	add	%r26,	%r27,	%r26
NC_BIS_SEC660:
	.word 0xc4bcdc7a  ! 1965: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc8f4903a  ! 1967: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
NC_BIS_SEC661:
	.word 0xc4b4dc7a  ! 1969: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
NC_BIS_SEC662:
	.word 0xc4a4dc7a  ! 1971: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
CP_BIS_PRI663:
	and	%r26,	%r28,	%r26
	.word 0xd0f29c5a  ! 1973: STXA_R	stxa	%r8, [%r10 + %r26] 0xe2
	.word 0xe7ec2029  ! 1975: PREFETCHA_I	prefetcha	[%r16, + 0x0029] %asi, #19
	.word 0xc89cd13a  ! 1977: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
CHANGE_PRIV664:
	ta	T_CHANGE_PRIV
CHANGE_R26665:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP665:
	.word 0xd0f6445a  ! 1979: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
	.word 0xc8a4d03a  ! 1981: STWA_R	stwa	%r4, [%r19 + %r26] 0x81
	.word 0xc984d03a  ! 1983: LDFA_R	lda	[%r19, %r26], %f4
CP_AIUP666:
	.word 0xc89e021a  ! 1985: LDDA_R	ldda	[%r24, %r26] 0x10, %r4
	.word 0xc922e018  ! 1986: STF_I	st	%f4, [0x0018, %r11]
	.word 0xc872801a  ! 1987: STX_R	stx	%r4, [%r10 + %r26]
	.word 0xc8acd13a  ! 1989: STBA_R	stba	%r4, [%r19 + %r26] 0x89
	.word 0xc82b001a  ! 1990: STB_R	stb	%r4, [%r12 + %r26]
	.word 0xc8d4d03a  ! 1992: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
CP_BIS_AIUS667:
	and	%r26,	%r28,	%r26
	.word 0xccaf847a  ! 1994: STBA_R	stba	%r6, [%r30 + %r26] 0x23
	.word 0xc9f3201a  ! 1995: CASXA_R	casxa	[%r12]%asi, %r26, %r4
	.word 0xc8f4913a  ! 1997: STXA_R	stxa	%r4, [%r18 + %r26] 0x89
	.word 0xc8dc913a  ! 1999: LDXA_R	ldxa	[%r18, %r26] 0x89, %r4
	.word 0xc88ad01a  ! 2000: LDUBA_R	lduba	[%r11, %r26] 0x80, %r4
	.word 0xc8f3111a  ! 2001: STXA_R	stxa	%r4, [%r12 + %r26] 0x88
	.word 0xc8ac903a  ! 2003: STBA_R	stba	%r4, [%r18 + %r26] 0x81
	.word 0xc983105a  ! 2004: LDFA_R	lda	[%r12, %r26], %f4
CP_ATM_QUAD_LD668:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 2006: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
	.word 0xc93aa018  ! 2007: STDF_I	std	%f4, [0x0018, %r10]
	.word 0xc86ae01b  ! 2008: LDSTUB_I	ldstub	%r4, [%r11 + 0x001b]
NC_NUC669:
	.word 0xc895409a  ! 2010: LDUHA_R	lduha	[%r21, %r26] 0x04, %r4
NC_AIUS670:
	.word 0xc8d7c33a  ! 2012: LDSHA_R	ldsha	[%r31, %r26] 0x19, %r4
CP_AIUP671:
	.word 0xc88e021a  ! 2014: LDUBA_R	lduba	[%r24, %r26] 0x10, %r4
	.word 0xc8a4d03a  ! 2016: STWA_R	stwa	%r4, [%r19 + %r26] 0x81
	.word 0xc884903a  ! 2018: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc8b4903a  ! 2020: STHA_R	stha	%r4, [%r18 + %r26] 0x81
	.word 0xc91ac01a  ! 2021: LDDF_R	ldd	[%r11, %r26], %f4
CP_ATM_QUAD_LD672:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2023: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
NC_PST_PRI673:
	.word 0xc9bc195a  ! 2025: STDFA_R	stda	%f4, [%r26, %r16]
CP_BIS_QUAD_LD674:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2027: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc8d3d11a  ! 2029: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r4
NC_AIUP675:
	.word 0xc896421a  ! 2031: LDUHA_R	lduha	[%r25, %r26] 0x10, %r4
CP_BIS_NUC676:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 2033: STHA_R	stha	%r2, [%r20 + %r26] 0x27
NC_AIUS677:
	.word 0xc987c23a  ! 2035: LDFA_R	lda	[%r31, %r26], %f4
	.word 0xc8dbd11a  ! 2037: LDXA_R	ldxa	[%r15, %r26] 0x88, %r4
	.word 0xc8ca915a  ! 2038: LDSBA_R	ldsba	[%r10, %r26] 0x8a, %r4
	.word 0xc8c2d15a  ! 2039: LDSWA_R	ldswa	[%r11, %r26] 0x8a, %r4
CHANGE_USER678:
	ta	T_CHANGE_NONPRIV
CHANGE_R26679:
	mov	%g0,	%r26
NC_BIS_PRI679:
	.word 0xd0f3dd5a  ! 2041: STXA_R	stxa	%r8, [%r15 + %r26] 0xea
	.word 0xc86b001a  ! 2042: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
NC_BIS_PRI680:
	.word 0xc4f39c5a  ! 2044: STXA_R	stxa	%r2, [%r14 + %r26] 0xe2
CP_BIS_PRI681:
	and	%r26,	%r28,	%r26
	.word 0xc49b5d5a  ! 2046: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
	.word 0xc822c01a  ! 2047: STW_R	stw	%r4, [%r11 + %r26]
	.word 0xc88c501a  ! 2049: LDUBA_R	lduba	[%r17, %r26] 0x80, %r4
	.word 0xc872801a  ! 2050: STX_R	stx	%r4, [%r10 + %r26]
	.word 0xc93b6018  ! 2051: STDF_I	std	%f4, [0x0018, %r13]
	.word 0xc884d13a  ! 2053: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r4
	.word 0xc8a3d01a  ! 2055: STWA_R	stwa	%r4, [%r15 + %r26] 0x80
	.word 0xc8dc903a  ! 2057: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
	.word 0xc8bc903a  ! 2059: STDA_R	stda	%r4, [%r18 + %r26] 0x81
	.word 0xc8dc913a  ! 2061: LDXA_R	ldxa	[%r18, %r26] 0x89, %r4
	.word 0xc8f4903a  ! 2063: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
CHANGE_PRIV682:
	ta	T_CHANGE_PRIV
CHANGE_R26683:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS683:
	.word 0xccb7c47a  ! 2065: STHA_R	stha	%r6, [%r31 + %r26] 0x23
CHANGE_USER684:
	ta	T_CHANGE_NONPRIV
CHANGE_R26685:
	add	%r26,	%r27,	%r26
CP_BIS_PRI685:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dc5a  ! 2067: STXA_R	stxa	%r2, [%r11 + %r26] 0xe2
CP_BIS_QUAD_LD686:
	and	%r26,	%r29,	%r26
	.word 0xc89b1d5a  ! 2069: LDDA_R	ldda	[%r12, %r26] 0xea, %r4
	.word 0xc9a3d11a  ! 2071: STFA_R	sta	%f4, [%r26, %r15]
	.word 0xc8bcd03a  ! 2073: STDA_R	stda	%r4, [%r19 + %r26] 0x81
BLK_PRI687:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2075: LDDFA_R	ldda	[%r10, %r26], %f0
CHANGE_R26688:
	add	%r26,	%r27,	%r26
CP_BIS_SEC688:
	and	%r26,	%r28,	%r26
	.word 0xd0a49c7a  ! 2077: STWA_R	stwa	%r8, [%r18 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS690:
	.word 0xc8b7c23a  ! 2079: STHA_R	stha	%r4, [%r31 + %r26] 0x11
	.word 0xc91b401a  ! 2080: LDDF_R	ldd	[%r13, %r26], %f4
CP_BIS_AIUP691:
	and	%r26,	%r28,	%r26
	.word 0xc89e045a  ! 2082: LDDA_R	ldda	[%r24, %r26] 0x22, %r4
	.word 0xc8c4501a  ! 2084: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r4
CP_AIUP692:
	.word 0xc9be021a  ! 2086: STDFA_R	stda	%f4, [%r26, %r24]
	.word 0xc99c111a  ! 2088: LDDFA_R	ldda	[%r16, %r26], %f4
CP_BIS_NUC693:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 2090: STHA_R	stha	%r6, [%r20 + %r26] 0x27
CHANGE_USER694:
	ta	T_CHANGE_NONPRIV
CHANGE_R26695:
	add	%r26,	%r27,	%r26
NC_BIS_PRI695:
	.word 0xccbc1c5a  ! 2092: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
CHANGE_PRIV696:
	ta	T_CHANGE_PRIV
CHANGE_R26697:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS697:
	and	%r26,	%r28,	%r26
	.word 0xccaf857a  ! 2094: STBA_R	stba	%r6, [%r30 + %r26] 0x2b
CP_ATM_QUAD_LD698:
	and	%r26,	%r29,	%r26
	.word 0xd09ac49a  ! 2096: LDDA_R	ldda	[%r11, %r26] 0x24, %r8
	.word 0xc8232018  ! 2097: STW_I	stw	%r4, [%r12 + 0x0018]
	.word 0xc8acd03a  ! 2099: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc87ac01a  ! 2100: SWAP_R	swap	%r4, [%r11 + %r26]
	.word 0xc8bb111a  ! 2101: STDA_R	stda	%r4, [%r12 + %r26] 0x88
	.word 0xc8ccd03a  ! 2103: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r4
CP_NUC699:
	.word 0xc8ad009a  ! 2105: STBA_R	stba	%r4, [%r20 + %r26] 0x04
NC_NUC700:
	.word 0xc8f5409a  ! 2107: STXA_R	stxa	%r4, [%r21 + %r26] 0x04
	.word 0xc8b3501a  ! 2108: STHA_R	stha	%r4, [%r13 + %r26] 0x80
CP_BIS_AIUP701:
	and	%r26,	%r28,	%r26
	.word 0xcca6045a  ! 2110: STWA_R	stwa	%r6, [%r24 + %r26] 0x22
NC_BIS_AIUS702:
	.word 0xd0bfc47a  ! 2112: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc99ad15a  ! 2113: LDDFA_R	ldda	[%r11, %r26], %f4
CHANGE_USER703:
	ta	T_CHANGE_NONPRIV
CHANGE_R26704:
	add	%r26,	%r27,	%r26
CP_BIS_PRI704:
	and	%r26,	%r28,	%r26
	.word 0xc8f2dd5a  ! 2115: STXA_R	stxa	%r4, [%r11 + %r26] 0xea
	.word 0xc8c3901a  ! 2117: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r4
	.word 0xc9bc913a  ! 2119: STDFA_R	stda	%f4, [%r26, %r18]
	.word 0xc8ea901a  ! 2120: LDSTUBA_R	ldstuba	%r4, [%r10 + %r26] 0x80
SET_TL1_705:
	ta	T_CHANGE_TO_TL1
CHANGE_R26706:
	mov	%g0,	%r26
NC_BIS_NUC706:
	.word 0xc4ad44fa  ! 2122: STBA_R	stba	%r2, [%r21 + %r26] 0x27
SHORT_FP_PRI707:
	.word 0xc9bb1a1a  ! 2124: STDFA_R	stda	%f4, [%r26, %r12]
NC_AIUS708:
	.word 0xc8a7c23a  ! 2126: STWA_R	stwa	%r4, [%r31 + %r26] 0x11
NC_AIUS709:
	.word 0xc8d7c23a  ! 2128: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r4
CP_BIS_NUC710:
	and	%r26,	%r28,	%r26
	.word 0xccb504fa  ! 2130: STHA_R	stha	%r6, [%r20 + %r26] 0x27
NC_BIS_AIUP711:
	.word 0xc4a6445a  ! 2132: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CP_NUC712:
	.word 0xc8bd019a  ! 2134: STDA_R	stda	%r4, [%r20 + %r26] 0x0c
CHANGE_R26713:
	add	%r26,	%r27,	%r26
CP_BIS_SEC713:
	and	%r26,	%r28,	%r26
	.word 0xccbc9c7a  ! 2136: STDA_R	stda	%r6, [%r18 + %r26] 0xe3
	.word 0xc99c101a  ! 2138: LDDFA_R	ldda	[%r16, %r26], %f4
	.word 0xc894913a  ! 2140: LDUHA_R	lduha	[%r18, %r26] 0x89, %r4
CP_PST_PRI714:
	.word 0xc9bb595a  ! 2142: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc903001a  ! 2143: LDF_R	ld	[%r12, %r26], %f4
CP_ATM_QUAD_LD715:
	and	%r26,	%r29,	%r26
	.word 0xd09a859a  ! 2145: LDDA_R	ldda	[%r10, %r26] 0x2c, %r8
SET_TL0_716:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI717:
	.word 0xd0b45c5a  ! 2147: STHA_R	stha	%r8, [%r17 + %r26] 0xe2
	.word 0xc9bb901a  ! 2149: STDFA_R	stda	%f4, [%r26, %r14]
BLK_PRI718:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 2151: STDFA_R	stda	%f0, [%r26, %r11]
CHANGE_PRIV719:
	ta	T_CHANGE_PRIV
CHANGE_R26720:
	add	%r26,	%r27,	%r26
CP_BIS_NUC720:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 2153: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
CP_BIS_AIUP721:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 2155: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xc903001a  ! 2156: LDF_R	ld	[%r12, %r26], %f4
WR_LEASI_722:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_723:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_NUC724:
	and	%r26,	%r28,	%r26
	.word 0xc89d04fa  ! 2159: LDDA_R	ldda	[%r20, %r26] 0x27, %r4
CP_BIS_QUAD_LD725:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 2161: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	.word 0xc922a018  ! 2162: STF_I	st	%f4, [0x0018, %r10]
	.word 0xc9a4913a  ! 2164: STFA_R	sta	%f4, [%r26, %r18]
CP_NUC726:
	.word 0xc895009a  ! 2166: LDUHA_R	lduha	[%r20, %r26] 0x04, %r4
	.word 0xc8d4d03a  ! 2168: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
	.word 0xc9bb501a  ! 2169: STDFA_R	stda	%f4, [%r26, %r13]
NC_BIS_AIUS727:
	.word 0xd0f7c47a  ! 2171: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
BLK_PRI728:
	and	%r26,	%r29,	%r26
	.word 0xe19b1f1a  ! 2173: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc83aa018  ! 2174: STD_I	std	%r4, [%r10 + 0x0018]
	.word 0xc9bcd03a  ! 2176: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc983515a  ! 2177: LDFA_R	lda	[%r13, %r26], %f4
NC_NUC729:
	.word 0xc8bd409a  ! 2179: STDA_R	stda	%r4, [%r21 + %r26] 0x04
NC_PST_PRI730:
	.word 0xc9bc185a  ! 2181: STDFA_R	stda	%f4, [%r26, %r16]
	.word 0xc803001a  ! 2182: LDUW_R	lduw	[%r12 + %r26], %r4
	.word 0xc99a915a  ! 2183: LDDFA_R	ldda	[%r10, %r26], %f4
SHORT_FP_PRI731:
	.word 0xc99ada1a  ! 2185: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc812801a  ! 2186: LDUH_R	lduh	[%r10 + %r26], %r4
SET_TL1_732:
	ta	T_CHANGE_TO_TL1
CHANGE_R26733:
	add	%r26,	%r27,	%r26
NC_BIS_NUC733:
	.word 0xc4b544fa  ! 2188: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc833601a  ! 2189: STH_I	sth	%r4, [%r13 + 0x001a]
NC_BIS_AIUS734:
	.word 0xccb7c57a  ! 2191: STHA_R	stha	%r6, [%r31 + %r26] 0x2b
CP_BIS_AIUP735:
	and	%r26,	%r28,	%r26
	.word 0xc4b6045a  ! 2193: STHA_R	stha	%r2, [%r24 + %r26] 0x22
NC_BIS_NUC736:
	.word 0xc4a544fa  ! 2195: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
SET_TL0_737:
	ta	T_CHANGE_TO_TL0
WR_LEASI_738:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_739:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8eb101a  ! 2197: LDSTUBA_R	ldstuba	%r4, [%r12 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS741:
	.word 0xc8b7c23a  ! 2199: STHA_R	stha	%r4, [%r31 + %r26] 0x11
CP_BIS_QUAD_LD742:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 2201: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xc9bcd03a  ! 2203: STDFA_R	stda	%f4, [%r26, %r19]
CP_BIS_AIUS743:
	and	%r26,	%r28,	%r26
	.word 0xc8bf847a  ! 2205: STDA_R	stda	%r4, [%r30 + %r26] 0x23
BLK_PRI744:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2207: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xc9a4d13a  ! 2209: STFA_R	sta	%f4, [%r26, %r19]
	.word 0xc9036018  ! 2210: LDF_I	ld	[%r13, 0x0018], %f4
	.word 0xc9a2901a  ! 2211: STFA_R	sta	%f4, [%r26, %r10]
	.word 0xc8b4d03a  ! 2213: STHA_R	stha	%r4, [%r19 + %r26] 0x81
	.word 0xc84ae01b  ! 2214: LDSB_I	ldsb	[%r11 + 0x001b], %r4
	.word 0xc8c4101a  ! 2216: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r4
	.word 0xc884501a  ! 2218: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r4
CP_AIUP745:
	.word 0xc896031a  ! 2220: LDUHA_R	lduha	[%r24, %r26] 0x18, %r4
	.word 0xc99a905a  ! 2221: LDDFA_R	ldda	[%r10, %r26], %f4
CP_PST_PRI746:
	.word 0xc9bad99a  ! 2223: STDFA_R	stda	%f4, [%r26, %r11]
CP_BIS_AIUS747:
	and	%r26,	%r28,	%r26
	.word 0xc8a7857a  ! 2225: STWA_R	stwa	%r4, [%r30 + %r26] 0x2b
CP_BIS_NUC748:
	and	%r26,	%r28,	%r26
	.word 0xc8bd04fa  ! 2227: STDA_R	stda	%r4, [%r20 + %r26] 0x27
	.word 0xc884903a  ! 2229: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc8732018  ! 2230: STX_I	stx	%r4, [%r12 + 0x0018]
NC_BIS_AIUP749:
	.word 0xd0ae445a  ! 2232: STBA_R	stba	%r8, [%r25 + %r26] 0x22
	.word 0xc91ae018  ! 2233: LDDF_I	ldd	[%r11, 0x0018], %f4
	.word 0xc87b401a  ! 2234: SWAP_R	swap	%r4, [%r13 + %r26]
CP_BIS_AIUP750:
	and	%r26,	%r28,	%r26
	.word 0xd0f6055a  ! 2236: STXA_R	stxa	%r8, [%r24 + %r26] 0x2a
NC_NUC751:
	.word 0xc985409a  ! 2238: LDFA_R	lda	[%r21, %r26], %f4
NC_AIUS752:
	.word 0xc987c23a  ! 2240: LDFA_R	lda	[%r31, %r26], %f4
	.word 0xc884903a  ! 2242: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
	.word 0xc894d03a  ! 2244: LDUHA_R	lduha	[%r19, %r26] 0x81, %r4
	.word 0xc99bd01a  ! 2246: LDDFA_R	ldda	[%r15, %r26], %f4
CHANGE_USER753:
	ta	T_CHANGE_NONPRIV
CHANGE_R26754:
	add	%r26,	%r27,	%r26
NC_BIS_PRI754:
	.word 0xc4abdd5a  ! 2248: STBA_R	stba	%r2, [%r15 + %r26] 0xea
	.word 0xc9bcd03a  ! 2250: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc8f4d03a  ! 2252: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC756:
	.word 0xc8a5409a  ! 2254: STWA_R	stwa	%r4, [%r21 + %r26] 0x04
NC_NUC757:
	.word 0xc985419a  ! 2256: LDFA_R	lda	[%r21, %r26], %f4
	.word 0xc99a901a  ! 2257: LDDFA_R	ldda	[%r10, %r26], %f4
NC_PST_PRI758:
	.word 0xc9bbd85a  ! 2259: STDFA_R	stda	%f4, [%r26, %r15]
	.word 0xc8acd03a  ! 2261: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc9bcd13a  ! 2263: STDFA_R	stda	%f4, [%r26, %r19]
CHANGE_USER759:
	ta	T_CHANGE_NONPRIV
CHANGE_R26760:
	add	%r26,	%r27,	%r26
NC_BIS_PRI760:
	.word 0xc8a3dd5a  ! 2265: STWA_R	stwa	%r4, [%r15 + %r26] 0xea
CHANGE_PRIV761:
	ta	T_CHANGE_PRIV
CHANGE_R26762:
	mov	%g0,	%r26
NC_BIS_AIUP762:
	.word 0xd0ae445a  ! 2267: STBA_R	stba	%r8, [%r25 + %r26] 0x22
NC_AIUP763:
	.word 0xc99e421a  ! 2269: LDDFA_R	ldda	[%r25, %r26], %f4
CP_NUC764:
	.word 0xc8c5009a  ! 2271: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r4
	.word 0xc89c913a  ! 2273: LDDA_R	ldda	[%r18, %r26] 0x89, %r4
	.word 0xc822a018  ! 2274: STW_I	stw	%r4, [%r10 + 0x0018]
CHANGE_R26765:
	add	%r26,	%r27,	%r26
CP_BIS_SEC765:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2276: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD766:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 2278: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
	.word 0xc8d4d03a  ! 2280: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
NC_BIS_SEC767:
	.word 0xc4a4dd7a  ! 2282: STWA_R	stwa	%r2, [%r19 + %r26] 0xeb
CP_BIS_AIUP768:
	and	%r26,	%r28,	%r26
	.word 0xccb6055a  ! 2284: STHA_R	stha	%r6, [%r24 + %r26] 0x2a
	.word 0xc99b105a  ! 2285: LDDFA_R	ldda	[%r12, %r26], %f4
CHANGE_USER769:
	ta	T_CHANGE_NONPRIV
CHANGE_R26770:
	add	%r26,	%r27,	%r26
NC_BIS_PRI770:
	.word 0xc4f41c5a  ! 2287: STXA_R	stxa	%r2, [%r16 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP772:
	.word 0xc89e421a  ! 2289: LDDA_R	ldda	[%r25, %r26] 0x10, %r4
	.word 0xc9a4903a  ! 2291: STFA_R	sta	%f4, [%r26, %r18]
WR_LEASI_773:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_774:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_AIUP775:
	.word 0xc8ae421a  ! 2294: STBA_R	stba	%r4, [%r25 + %r26] 0x10
CP_AIUP776:
	.word 0xc886021a  ! 2296: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r4
	.word 0xc8ca915a  ! 2297: LDSBA_R	ldsba	[%r10, %r26] 0x8a, %r4
NC_BIS_AIUS777:
	.word 0xccb7c47a  ! 2299: STHA_R	stha	%r6, [%r31 + %r26] 0x23
	.word 0xc8ab501a  ! 2300: STBA_R	stba	%r4, [%r13 + %r26] 0x80
CP_AIUP778:
	.word 0xc8ce021a  ! 2302: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r4
SET_TL1_779:
	ta	T_CHANGE_TO_TL1
CHANGE_R26780:
	add	%r26,	%r27,	%r26
NC_BIS_NUC780:
	.word 0xc8bd44fa  ! 2304: STDA_R	stda	%r4, [%r21 + %r26] 0x27
NC_NUC781:
	.word 0xc8c5419a  ! 2306: LDSWA_R	ldswa	[%r21, %r26] 0x0c, %r4
	.word 0xc8bcd03a  ! 2308: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc8d3911a  ! 2310: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r4
CP_NUC782:
	.word 0xc8ed009a  ! 2312: LDSTUBA_R	ldstuba	%r4, [%r20 + %r26] 0x04
SET_TL0_783:
	ta	T_CHANGE_TO_TL0
CHANGE_R26784:
	add	%r26,	%r27,	%r26
NC_BIS_SEC784:
	.word 0xc4f4dc7a  ! 2314: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
	.word 0xc8b4d13a  ! 2316: STHA_R	stha	%r4, [%r19 + %r26] 0x89
	.word 0xc8f4101a  ! 2318: STXA_R	stxa	%r4, [%r16 + %r26] 0x80
NC_BLK_SEc785:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2320: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc7efa02a  ! 2322: PREFETCHA_I	prefetcha	[%r30, + 0x002a] %asi, #one_write
SET_TL1_786:
	ta	T_CHANGE_TO_TL1
CHANGE_R26787:
	add	%r26,	%r27,	%r26
NC_BIS_NUC787:
	.word 0xc4ad44fa  ! 2324: STBA_R	stba	%r2, [%r21 + %r26] 0x27
BLK_PRI788:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2326: LDDFA_R	ldda	[%r10, %r26], %f0
	.word 0xc87ae018  ! 2327: SWAP_I	swap	%r4, [%r11 + 0x0018]
	.word 0xc93ae018  ! 2328: STDF_I	std	%f4, [0x0018, %r11]
SHORT_FP_PRI789:
	.word 0xc9bada5a  ! 2330: STDFA_R	stda	%f4, [%r26, %r11]
NC_SHORT_FP_SEC790:
	.word 0xc9bcda3a  ! 2332: STDFA_R	stda	%f4, [%r26, %r19]
BLK_PRI791:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 2334: STDFA_R	stda	%f0, [%r26, %r11]
CP_AIUS792:
	.word 0xc8a7823a  ! 2336: STWA_R	stwa	%r4, [%r30 + %r26] 0x11
NC_BIS_NUC793:
	.word 0xd0bd44fa  ! 2338: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xc8cb111a  ! 2339: LDSBA_R	ldsba	[%r12, %r26] 0x88, %r4
	.word 0xc8f3901a  ! 2341: STXA_R	stxa	%r4, [%r14 + %r26] 0x80
	.word 0xc852c01a  ! 2342: LDSH_R	ldsh	[%r11 + %r26], %r4
	.word 0xc873401a  ! 2343: STX_R	stx	%r4, [%r13 + %r26]
	.word 0xc89cd13a  ! 2345: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
CP_BIS_QUAD_LD794:
	and	%r26,	%r29,	%r26
	.word 0xc89add5a  ! 2347: LDDA_R	ldda	[%r11, %r26] 0xea, %r4
NC_AIUP795:
	.word 0xc886421a  ! 2349: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r4
NC_PST_PRI796:
	.word 0xc9bbd81a  ! 2351: STDFA_R	stda	%f4, [%r26, %r15]
	.word 0xc813401a  ! 2352: LDUH_R	lduh	[%r13 + %r26], %r4
CP_ATM_QUAD_LD797:
	and	%r26,	%r29,	%r26
	.word 0xcc9a849a  ! 2354: LDDA_R	ldda	[%r10, %r26] 0x24, %r6
CP_BIS_NUC798:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2356: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc82ac01a  ! 2357: STB_R	stb	%r4, [%r11 + %r26]
CP_BIS_AIUP799:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2359: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
NC_AIUS800:
	.word 0xc8f7c33a  ! 2361: STXA_R	stxa	%r4, [%r31 + %r26] 0x19
NC_NUC801:
	.word 0xc8c5409a  ! 2363: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r4
NC_AIUS802:
	.word 0xc9a7c23a  ! 2365: STFA_R	sta	%f4, [%r26, %r31]
	.word 0xc88c511a  ! 2367: LDUBA_R	lduba	[%r17, %r26] 0x88, %r4
	.word 0xc984903a  ! 2369: LDFA_R	lda	[%r18, %r26], %f4
CHANGE_R26803:
	add	%r26,	%r27,	%r26
CP_BIS_SEC803:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 2371: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
	.word 0xc8c3901a  ! 2373: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r4
CP_BIS_NUC804:
	and	%r26,	%r28,	%r26
	.word 0xccb505fa  ! 2375: STHA_R	stha	%r6, [%r20 + %r26] 0x2f
NC_NUC805:
	.word 0xc8f5419a  ! 2377: STXA_R	stxa	%r4, [%r21 + %r26] 0x0c
NC_AIUP806:
	.word 0xc8a6421a  ! 2379: STWA_R	stwa	%r4, [%r25 + %r26] 0x10
	.word 0xc883901a  ! 2381: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r4
SHORT_FP_PRI807:
	.word 0xc9ba9a1a  ! 2383: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc8d4903a  ! 2385: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc892905a  ! 2386: LDUHA_R	lduha	[%r10, %r26] 0x82, %r4
CP_NUC808:
	.word 0xc9f5201a  ! 2388: CASXA_R	casxa	[%r20]%asi, %r26, %r4
NC_BIS_AIUS809:
	.word 0xc8bfc47a  ! 2390: STDA_R	stda	%r4, [%r31 + %r26] 0x23
CP_BIS_QUAD_LD810:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 2392: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CP_ATM_QUAD_LD811:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2394: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xc8c4511a  ! 2396: LDSWA_R	ldswa	[%r17, %r26] 0x88, %r4
	.word 0xc89cd03a  ! 2398: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
CP_PST_PRI812:
	.word 0xc9bb585a  ! 2400: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc8cc101a  ! 2402: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r4
	.word 0xc882d01a  ! 2403: LDUWA_R	lduwa	[%r11, %r26] 0x80, %r4
	.word 0xc8c3d01a  ! 2405: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r4
	.word 0xc884913a  ! 2407: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r4
	.word 0xc8cc913a  ! 2409: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r4
	.word 0xc8abd01a  ! 2411: STBA_R	stba	%r4, [%r15 + %r26] 0x80
CP_ATM_QUAD_LD813:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 2413: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xc982d01a  ! 2414: LDFA_R	lda	[%r11, %r26], %f4
	.word 0xc8dc903a  ! 2416: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
SET_TL0_814:
	ta	T_CHANGE_TO_TL0
CHANGE_R26815:
	mov	%g0,	%r26
NC_BIS_SEC815:
	.word 0xc4b4dc7a  ! 2418: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xc883901a  ! 2420: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r4
	.word 0xc902c01a  ! 2421: LDF_R	ld	[%r11, %r26], %f4
SET_TL1_816:
	ta	T_CHANGE_TO_TL1
CHANGE_R26817:
	add	%r26,	%r27,	%r26
NC_BIS_NUC817:
	.word 0xc4a544fa  ! 2423: STWA_R	stwa	%r2, [%r21 + %r26] 0x27
	.word 0xc922a018  ! 2424: STF_I	st	%f4, [0x0018, %r10]
NC_NUC818:
	.word 0xc8a5409a  ! 2426: STWA_R	stwa	%r4, [%r21 + %r26] 0x04
SHORT_FP_PRI819:
	.word 0xc9bb5b1a  ! 2428: STDFA_R	stda	%f4, [%r26, %r13]
NC_BIS_AIUP820:
	.word 0xc4a6445a  ! 2430: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CHANGE_R26821:
	add	%r26,	%r27,	%r26
CP_BIS_SEC821:
	and	%r26,	%r28,	%r26
	.word 0xccb49c7a  ! 2432: STHA_R	stha	%r6, [%r18 + %r26] 0xe3
	.word 0xc8bbd11a  ! 2434: STDA_R	stda	%r4, [%r15 + %r26] 0x88
	.word 0xc822a018  ! 2435: STW_I	stw	%r4, [%r10 + 0x0018]
NC_BLK_SEc822:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2437: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc8dc903a  ! 2439: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
NC_BLK_SEc823:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2441: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUS824:
	.word 0xc4b7c47a  ! 2443: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_PST_PRI825:
	.word 0xc9bc189a  ! 2445: STDFA_R	stda	%f4, [%r26, %r16]
	.word 0xc802e018  ! 2446: LDUW_I	lduw	[%r11 + 0x0018], %r4
SET_TL0_826:
	ta	T_CHANGE_TO_TL0
CHANGE_R26827:
	add	%r26,	%r27,	%r26
NC_BIS_SEC827:
	.word 0xd0f4dd7a  ! 2448: STXA_R	stxa	%r8, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC829:
	.word 0xc8dd009a  ! 2450: LDXA_R	ldxa	[%r20, %r26] 0x04, %r4
	.word 0xc8acd03a  ! 2452: STBA_R	stba	%r4, [%r19 + %r26] 0x81
CP_BIS_AIUS830:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 2454: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
	.word 0xc8c4101a  ! 2456: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r4
	.word 0xc8ab911a  ! 2458: STBA_R	stba	%r4, [%r14 + %r26] 0x88
CP_PST_PRI831:
	.word 0xc9bad95a  ! 2460: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc982d15a  ! 2461: LDFA_R	lda	[%r11, %r26], %f4
NC_AIUS832:
	.word 0xc8b7c23a  ! 2463: STHA_R	stha	%r4, [%r31 + %r26] 0x11
	.word 0xc8f3501a  ! 2464: STXA_R	stxa	%r4, [%r13 + %r26] 0x80
	.word 0xc86ae01b  ! 2465: LDSTUB_I	ldstub	%r4, [%r11 + 0x001b]
	.word 0xc884913a  ! 2467: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r4
	.word 0xc8dcd03a  ! 2469: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
CHANGE_R26833:
	add	%r26,	%r27,	%r26
CP_BIS_SEC833:
	and	%r26,	%r28,	%r26
	.word 0xd0a49d7a  ! 2471: STWA_R	stwa	%r8, [%r18 + %r26] 0xeb
CP_BIS_QUAD_LD834:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2473: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
CP_BIS_QUAD_LD835:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2475: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
CP_BIS_AIUP836:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 2477: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
NC_NUC837:
	.word 0xc895409a  ! 2479: LDUHA_R	lduha	[%r21, %r26] 0x04, %r4
NC_SHORT_FP_SEC838:
	.word 0xc9bcdb3a  ! 2481: STDFA_R	stda	%f4, [%r26, %r19]
CHANGE_CLE839:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc8dc903a  ! 2484: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
BLK_PRI840:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 2486: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc9f3601a  ! 2487: CASXA_R	casxa	[%r13]%asi, %r26, %r4
	.word 0xc883d11a  ! 2489: LDUWA_R	lduwa	[%r15, %r26] 0x88, %r4
	.word 0xc89c501a  ! 2491: LDDA_R	ldda	[%r17, %r26] 0x80, %r4
	.word 0xc984903a  ! 2493: LDFA_R	lda	[%r18, %r26], %f4
	.word 0xc884501a  ! 2495: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r4
CHANGE_PRIV841:
	ta	T_CHANGE_PRIV
CHANGE_R26842:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP842:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 2497: STHA_R	stha	%r4, [%r24 + %r26] 0x22
CP_AIUS843:
	.word 0xc9a7823a  ! 2499: STFA_R	sta	%f4, [%r26, %r30]
CP_NUC844:
	.word 0xc8dd009a  ! 2501: LDXA_R	ldxa	[%r20, %r26] 0x04, %r4
	.word 0xc9a4d03a  ! 2503: STFA_R	sta	%f4, [%r26, %r19]
CHANGE_R26845:
	add	%r26,	%r27,	%r26
CP_BIS_SEC845:
	and	%r26,	%r28,	%r26
	.word 0xccf49d7a  ! 2505: STXA_R	stxa	%r6, [%r18 + %r26] 0xeb
	.word 0xc984d13a  ! 2507: LDFA_R	lda	[%r19, %r26], %f4
CP_BIS_NUC846:
	and	%r26,	%r28,	%r26
	.word 0xd0b504fa  ! 2509: STHA_R	stha	%r8, [%r20 + %r26] 0x27
BLK_PRI847:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2511: LDDFA_R	ldda	[%r12, %r26], %f0
CP_BIS_NUC848:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2513: STBA_R	stba	%r4, [%r20 + %r26] 0x27
	.word 0xc8f4913a  ! 2515: STXA_R	stxa	%r4, [%r18 + %r26] 0x89
	.word 0xc8dbd11a  ! 2517: LDXA_R	ldxa	[%r15, %r26] 0x88, %r4
CP_AIUP849:
	.word 0xc88e031a  ! 2519: LDUBA_R	lduba	[%r24, %r26] 0x18, %r4
	.word 0xc8bbd01a  ! 2521: STDA_R	stda	%r4, [%r15 + %r26] 0x80
	.word 0xc9a2901a  ! 2522: STFA_R	sta	%f4, [%r26, %r10]
CP_AIUS850:
	.word 0xc89f823a  ! 2524: LDDA_R	ldda	[%r30, %r26] 0x11, %r4
	.word 0xc8a4903a  ! 2526: STWA_R	stwa	%r4, [%r18 + %r26] 0x81
CP_ATM_QUAD_LD851:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2528: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
	.word 0xc8db901a  ! 2530: LDXA_R	ldxa	[%r14, %r26] 0x80, %r4
CP_NUC852:
	.word 0xc8ed009a  ! 2532: LDSTUBA_R	ldstuba	%r4, [%r20 + %r26] 0x04
	.word 0xc8bcd03a  ! 2534: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc884903a  ! 2536: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r4
BLK_PRI853:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 2538: STDFA_R	stda	%f0, [%r26, %r12]
	.word 0xc8bcd03a  ! 2540: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc8dcd03a  ! 2542: LDXA_R	ldxa	[%r19, %r26] 0x81, %r4
CP_BIS_NUC854:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 2544: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
	.word 0xc984511a  ! 2546: LDFA_R	lda	[%r17, %r26], %f4
BLK_PRI855:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2548: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc8b4d03a  ! 2550: STHA_R	stha	%r4, [%r19 + %r26] 0x81
	.word 0xc9bc903a  ! 2552: STDFA_R	stda	%f4, [%r26, %r18]
NC_BIS_SEC856:
	.word 0xc8b4dd7a  ! 2554: STHA_R	stha	%r4, [%r19 + %r26] 0xeb
CP_ATM_QUAD_LD857:
	and	%r26,	%r29,	%r26
	.word 0xc49ac59a  ! 2556: LDDA_R	ldda	[%r11, %r26] 0x2c, %r2
	.word 0xc8b4913a  ! 2558: STHA_R	stha	%r4, [%r18 + %r26] 0x89
CP_AIUS858:
	.word 0xc897833a  ! 2560: LDUHA_R	lduha	[%r30, %r26] 0x19, %r4
	.word 0xc8cc101a  ! 2562: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r4
NC_AIUP859:
	.word 0xc99e421a  ! 2564: LDDFA_R	ldda	[%r25, %r26], %f4
	.word 0xc8dc903a  ! 2566: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
CP_AIUS860:
	.word 0xc9bf833a  ! 2568: STDFA_R	stda	%f4, [%r26, %r30]
	.word 0xc93b6018  ! 2569: STDF_I	std	%f4, [0x0018, %r13]
	.word 0xc8bb501a  ! 2570: STDA_R	stda	%r4, [%r13 + %r26] 0x80
	.word 0xc86b201b  ! 2571: LDSTUB_I	ldstub	%r4, [%r12 + 0x001b]
CP_BIS_AIUP861:
	and	%r26,	%r28,	%r26
	.word 0xd0b6045a  ! 2573: STHA_R	stha	%r8, [%r24 + %r26] 0x22
	.word 0xc99cd03a  ! 2575: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc8d4d03a  ! 2577: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r4
	.word 0xc99cd03a  ! 2579: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc8d2901a  ! 2580: LDSHA_R	ldsha	[%r10, %r26] 0x80, %r4
NC_AIUS862:
	.word 0xc9bfc33a  ! 2582: STDFA_R	stda	%f4, [%r26, %r31]
	.word 0xc982911a  ! 2583: LDFA_R	lda	[%r10, %r26], %f4
	.word 0xc91b001a  ! 2584: LDDF_R	ldd	[%r12, %r26], %f4
SHORT_FP_PRI863:
	.word 0xc99ada1a  ! 2586: LDDFA_R	ldda	[%r11, %r26], %f4
	.word 0xc8cc903a  ! 2588: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r4
CP_BIS_AIUS864:
	and	%r26,	%r28,	%r26
	.word 0xc8a7857a  ! 2590: STWA_R	stwa	%r4, [%r30 + %r26] 0x2b
NC_BLK_SEc865:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2592: STDFA_R	stda	%f16, [%r26, %r19]
NC_BIS_AIUS866:
	.word 0xc8b7c47a  ! 2594: STHA_R	stha	%r4, [%r31 + %r26] 0x23
	.word 0xc9bad11a  ! 2595: STDFA_R	stda	%f4, [%r26, %r11]
NC_BLK_SEc867:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2597: LDDFA_R	ldda	[%r19, %r26], %f0
NC_PST_PRI868:
	.word 0xc9bbd91a  ! 2599: STDFA_R	stda	%f4, [%r26, %r15]
CHANGE_R26869:
	mov	%g0,	%r26
CP_BIS_SEC869:
	and	%r26,	%r28,	%r26
	.word 0xd09c9d7a  ! 2601: LDDA_R	ldda	[%r18, %r26] 0xeb, %r8
	.word 0xc8ac501a  ! 2603: STBA_R	stba	%r4, [%r17 + %r26] 0x80
CP_BIS_AIUP870:
	and	%r26,	%r28,	%r26
	.word 0xc4b6055a  ! 2605: STHA_R	stha	%r2, [%r24 + %r26] 0x2a
NC_SHORT_FP_SEC871:
	.word 0xc9bcda3a  ! 2607: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc86b001a  ! 2608: LDSTUB_R	ldstub	%r4, [%r12 + %r26]
	.word 0xc8ccd13a  ! 2610: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r4
NC_BIS_AIUS872:
	.word 0xc8afc47a  ! 2612: STBA_R	stba	%r4, [%r31 + %r26] 0x23
CHANGE_USER873:
	ta	T_CHANGE_NONPRIV
CHANGE_R26874:
	add	%r26,	%r27,	%r26
NC_BIS_PRI874:
	.word 0xc8f39c5a  ! 2614: STXA_R	stxa	%r4, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD875:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 2616: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
NC_BIS_PRI876:
	.word 0xc8a3dc5a  ! 2618: STWA_R	stwa	%r4, [%r15 + %r26] 0xe2
	.word 0xc99a911a  ! 2619: LDDFA_R	ldda	[%r10, %r26], %f4
	.word 0xc9a4903a  ! 2621: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc8c2911a  ! 2622: LDSWA_R	ldswa	[%r10, %r26] 0x88, %r4
SHORT_FP_PRI877:
	.word 0xc9bb1a1a  ! 2624: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc9a4903a  ! 2626: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc85b001a  ! 2627: LDX_R	ldx	[%r12 + %r26], %r4
WR_LEASI_878:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_879:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8f4903a  ! 2630: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
SET_TL1_880:
	ta	T_CHANGE_TO_TL1
CHANGE_R26881:
	add	%r26,	%r27,	%r26
NC_BIS_NUC881:
	.word 0xc4bd44fa  ! 2632: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUP882:
	.word 0xc8ae445a  ! 2634: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xc8d4903a  ! 2636: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r4
	.word 0xc923001a  ! 2637: STF_R	st	%f4, [%r26, %r12]
	.word 0xc9bcd03a  ! 2639: STDFA_R	stda	%f4, [%r26, %r19]
SET_TL0_883:
	ta	T_CHANGE_TO_TL0
WR_LEASI_884:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_885:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc8dc903a  ! 2642: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
CHANGE_PRIV886:
	ta	T_CHANGE_PRIV
CHANGE_R26887:
	add	%r26,	%r27,	%r26
CP_BIS_NUC887:
	and	%r26,	%r28,	%r26
	.word 0xccb505fa  ! 2644: STHA_R	stha	%r6, [%r20 + %r26] 0x2f
NC_SHORT_FP_SEC888:
	.word 0xc9bcdb7a  ! 2646: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc984501a  ! 2648: LDFA_R	lda	[%r17, %r26], %f4
NC_BIS_SEC889:
	.word 0xc4bcdc7a  ! 2650: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_AIUP890:
	.word 0xc99e021a  ! 2652: LDDFA_R	ldda	[%r24, %r26], %f4
CP_PST_PRI891:
	.word 0xc9bad81a  ! 2654: STDFA_R	stda	%f4, [%r26, %r11]
NC_BLK_SEc892:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2656: LDDFA_R	ldda	[%r19, %r26], %f0
CP_ATM_QUAD_LD893:
	and	%r26,	%r29,	%r26
	.word 0xd09b049a  ! 2658: LDDA_R	ldda	[%r12, %r26] 0x24, %r8
CP_BIS_NUC894:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 2660: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
CHANGE_USER895:
	ta	T_CHANGE_NONPRIV
CHANGE_R26896:
	add	%r26,	%r27,	%r26
CP_BIS_PRI896:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9c5a  ! 2662: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc922a018  ! 2663: STF_I	st	%f4, [0x0018, %r10]
	.word 0xc9bb101a  ! 2664: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc893d11a  ! 2666: LDUHA_R	lduha	[%r15, %r26] 0x88, %r4
	.word 0xc853401a  ! 2667: LDSH_R	ldsh	[%r13 + %r26], %r4
CHANGE_PRIV897:
	ta	T_CHANGE_PRIV
CHANGE_R26898:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS898:
	.word 0xd0f7c57a  ! 2669: STXA_R	stxa	%r8, [%r31 + %r26] 0x2b
	.word 0xc8db901a  ! 2671: LDXA_R	ldxa	[%r14, %r26] 0x80, %r4
CP_ATM_QUAD_LD899:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2673: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
	.word 0xc8aa911a  ! 2674: STBA_R	stba	%r4, [%r10 + %r26] 0x88
CHANGE_USER900:
	ta	T_CHANGE_NONPRIV
CHANGE_R26901:
	add	%r26,	%r27,	%r26
CP_BIS_PRI901:
	and	%r26,	%r28,	%r26
	.word 0xcc9a9d5a  ! 2676: LDDA_R	ldda	[%r10, %r26] 0xea, %r6
NC_BLK_SEc902:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2678: STDFA_R	stda	%f16, [%r26, %r19]
NC_BLK_SEc903:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2680: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_PRIV904:
	ta	T_CHANGE_PRIV
CHANGE_R26905:
	add	%r26,	%r27,	%r26
CP_BIS_AIUS905:
	and	%r26,	%r28,	%r26
	.word 0xc8b7847a  ! 2682: STHA_R	stha	%r4, [%r30 + %r26] 0x23
	.word 0xc8bb901a  ! 2684: STDA_R	stda	%r4, [%r14 + %r26] 0x80
	.word 0xc8f4d03a  ! 2686: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
NC_BLK_SEc906:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2688: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_NUC907:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2690: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc922801a  ! 2691: STF_R	st	%f4, [%r26, %r10]
	.word 0xc8acd03a  ! 2693: STBA_R	stba	%r4, [%r19 + %r26] 0x81
	.word 0xc8dc903a  ! 2695: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
	.word 0xc87aa018  ! 2696: SWAP_I	swap	%r4, [%r10 + 0x0018]
	.word 0xc8dc101a  ! 2698: LDXA_R	ldxa	[%r16, %r26] 0x80, %r4
NC_AIUS908:
	.word 0xc9a7c23a  ! 2700: STFA_R	sta	%f4, [%r26, %r31]
	.word 0xc9bad01a  ! 2701: STDFA_R	stda	%f4, [%r26, %r11]
	.word 0xc9bcd03a  ! 2703: STDFA_R	stda	%f4, [%r26, %r19]
	.word 0xc88b901a  ! 2705: LDUBA_R	lduba	[%r14, %r26] 0x80, %r4
	.word 0xc8c4d03a  ! 2707: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r4
CHANGE_USER909:
	ta	T_CHANGE_NONPRIV
CHANGE_R26910:
	mov	%g0,	%r26
NC_BIS_PRI910:
	.word 0xc4a45c5a  ! 2709: STWA_R	stwa	%r2, [%r17 + %r26] 0xe2
CHANGE_TLE911:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_R26912:
	add	%r26,	%r27,	%r26
CP_BIS_SEC912:
	and	%r26,	%r28,	%r26
	.word 0xc4b49c7a  ! 2712: STHA_R	stha	%r2, [%r18 + %r26] 0xe3
NC_BIS_PRI913:
	.word 0xc8b39c5a  ! 2714: STHA_R	stha	%r4, [%r14 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP915:
	.word 0xc89e421a  ! 2716: LDDA_R	ldda	[%r25, %r26] 0x10, %r4
CHANGE_R26916:
	add	%r26,	%r27,	%r26
CP_BIS_SEC916:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 2718: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
CP_ATM_QUAD_LD917:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2720: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xc86a801a  ! 2721: LDSTUB_R	ldstub	%r4, [%r10 + %r26]
CP_NUC918:
	.word 0xc885009a  ! 2723: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r4
CHANGE_USER919:
	ta	T_CHANGE_NONPRIV
CHANGE_R26920:
	add	%r26,	%r27,	%r26
CP_BIS_PRI920:
	and	%r26,	%r28,	%r26
	.word 0xccf35c5a  ! 2725: STXA_R	stxa	%r6, [%r13 + %r26] 0xe2
CHANGE_PRIV921:
	ta	T_CHANGE_PRIV
CHANGE_R26922:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP922:
	.word 0xd0ae445a  ! 2727: STBA_R	stba	%r8, [%r25 + %r26] 0x22
BLK_PRI923:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 2729: STDFA_R	stda	%f16, [%r26, %r11]
NC_BIS_AIUS924:
	.word 0xd0b7c47a  ! 2731: STHA_R	stha	%r8, [%r31 + %r26] 0x23
	.word 0xc9a4903a  ! 2733: STFA_R	sta	%f4, [%r26, %r18]
	.word 0xc93a801a  ! 2734: STDF_R	std	%f4, [%r26, %r10]
	.word 0xc8dcd13a  ! 2736: LDXA_R	ldxa	[%r19, %r26] 0x89, %r4
NC_AIUP925:
	.word 0xc99e431a  ! 2738: LDDFA_R	ldda	[%r25, %r26], %f4
	.word 0xc9a3901a  ! 2740: STFA_R	sta	%f4, [%r26, %r14]
NC_BIS_SEC926:
	.word 0xd0a4dc7a  ! 2742: STWA_R	stwa	%r8, [%r19 + %r26] 0xe3
CHANGE_USER927:
	ta	T_CHANGE_NONPRIV
CHANGE_R26928:
	add	%r26,	%r27,	%r26
NC_BIS_PRI928:
	.word 0xc4f39d5a  ! 2744: STXA_R	stxa	%r2, [%r14 + %r26] 0xea
CP_BIS_PRI929:
	and	%r26,	%r28,	%r26
	.word 0xc89a9c5a  ! 2746: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
	.word 0xc8fa901a  ! 2747: SWAPA_R	swapa	%r4, [%r10 + %r26] 0x80
	.word 0xc8ac903a  ! 2749: STBA_R	stba	%r4, [%r18 + %r26] 0x81
	.word 0xc93aa018  ! 2750: STDF_I	std	%f4, [0x0018, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP931:
	.word 0xc8ce021a  ! 2752: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r4
SET_TL1_932:
	ta	T_CHANGE_TO_TL1
CHANGE_R26933:
	mov	%g0,	%r26
NC_BIS_NUC933:
	.word 0xc4a545fa  ! 2754: STWA_R	stwa	%r2, [%r21 + %r26] 0x2f
	.word 0xc902801a  ! 2755: LDF_R	ld	[%r10, %r26], %f4
	.word 0xc9bc101a  ! 2757: STDFA_R	stda	%f4, [%r26, %r16]
SET_TL0_934:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI935:
	.word 0xc8ac1c5a  ! 2759: STBA_R	stba	%r4, [%r16 + %r26] 0xe2
	.word 0xc8c4903a  ! 2761: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r4
CHANGE_CLE936:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_PRI937:
	and	%r26,	%r28,	%r26
	.word 0xc4bb1c5a  ! 2764: STDA_R	stda	%r2, [%r12 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP939:
	.word 0xc88e421a  ! 2766: LDUBA_R	lduba	[%r25, %r26] 0x10, %r4
NC_BLK_SEc940:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2768: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc9a4101a  ! 2770: STFA_R	sta	%f4, [%r26, %r16]
CHANGE_USER941:
	ta	T_CHANGE_NONPRIV
CHANGE_R26942:
	add	%r26,	%r27,	%r26
NC_BIS_PRI942:
	.word 0xc4a41c5a  ! 2772: STWA_R	stwa	%r2, [%r16 + %r26] 0xe2
	.word 0xc89c903a  ! 2774: LDDA_R	ldda	[%r18, %r26] 0x81, %r4
	.word 0xc8f3901a  ! 2776: STXA_R	stxa	%r4, [%r14 + %r26] 0x80
CP_PST_PRI943:
	.word 0xc9bb191a  ! 2778: STDFA_R	stda	%f4, [%r26, %r12]
	.word 0xc9a2901a  ! 2779: STFA_R	sta	%f4, [%r26, %r10]
CP_PST_PRI944:
	.word 0xc9bb591a  ! 2781: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc982d11a  ! 2782: LDFA_R	lda	[%r11, %r26], %f4
CP_BIS_PRI945:
	and	%r26,	%r28,	%r26
	.word 0xccb31c5a  ! 2784: STHA_R	stha	%r6, [%r12 + %r26] 0xe2
	.word 0xc822801a  ! 2785: STW_R	stw	%r4, [%r10 + %r26]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP947:
	.word 0xc8be031a  ! 2787: STDA_R	stda	%r4, [%r24 + %r26] 0x18
NC_BIS_AIUP948:
	.word 0xc4b6445a  ! 2789: STHA_R	stha	%r2, [%r25 + %r26] 0x22
	.word 0xc923001a  ! 2790: STF_R	st	%f4, [%r26, %r12]
BLK_PRI949:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 2792: LDDFA_R	ldda	[%r10, %r26], %f0
CP_BIS_AIUS950:
	and	%r26,	%r28,	%r26
	.word 0xc4f7847a  ! 2794: STXA_R	stxa	%r2, [%r30 + %r26] 0x23
NC_BIS_SEC951:
	.word 0xc8a4dc7a  ! 2796: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
NC_BIS_AIUP952:
	.word 0xc8b6445a  ! 2798: STHA_R	stha	%r4, [%r25 + %r26] 0x22
CP_AIUS953:
	.word 0xc89f833a  ! 2800: LDDA_R	ldda	[%r30, %r26] 0x19, %r4
CP_PST_PRI954:
	.word 0xc9bb595a  ! 2802: STDFA_R	stda	%f4, [%r26, %r13]
	.word 0xc9bc903a  ! 2804: STDFA_R	stda	%f4, [%r26, %r18]
SET_TL1_955:
	ta	T_CHANGE_TO_TL1
CHANGE_R26956:
	add	%r26,	%r27,	%r26
NC_BIS_NUC956:
	.word 0xc4bd44fa  ! 2806: STDA_R	stda	%r2, [%r21 + %r26] 0x27
	.word 0xc882d15a  ! 2807: LDUWA_R	lduwa	[%r11, %r26] 0x8a, %r4
	.word 0xc8dc101a  ! 2809: LDXA_R	ldxa	[%r16, %r26] 0x80, %r4
NC_AIUS957:
	.word 0xc99fc23a  ! 2811: LDDFA_R	ldda	[%r31, %r26], %f4
	.word 0xc8f4903a  ! 2813: STXA_R	stxa	%r4, [%r18 + %r26] 0x81
SET_TL0_958:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI959:
	and	%r26,	%r28,	%r26
	.word 0xc4ab5c5a  ! 2815: STBA_R	stba	%r2, [%r13 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS961:
	.word 0xc987823a  ! 2817: LDFA_R	lda	[%r30, %r26], %f4
CP_ATM_QUAD_LD962:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 2819: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
	.word 0xc883901a  ! 2821: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r4
CP_AIUS963:
	.word 0xc8df823a  ! 2823: LDXA_R	ldxa	[%r30, %r26] 0x11, %r4
	.word 0xc8eb501a  ! 2824: LDSTUBA_R	ldstuba	%r4, [%r13 + %r26] 0x80
	.word 0xc8ac903a  ! 2826: STBA_R	stba	%r4, [%r18 + %r26] 0x81
	.word 0xc9a2d11a  ! 2827: STFA_R	sta	%f4, [%r26, %r11]
CP_AIUS964:
	.word 0xc99f833a  ! 2829: LDDFA_R	ldda	[%r30, %r26], %f4
	.word 0xc99cd03a  ! 2831: LDDFA_R	ldda	[%r19, %r26], %f4
NC_AIUP965:
	.word 0xc986421a  ! 2833: LDFA_R	lda	[%r25, %r26], %f4
	.word 0xc8bcd03a  ! 2835: STDA_R	stda	%r4, [%r19 + %r26] 0x81
	.word 0xc8f4d03a  ! 2837: STXA_R	stxa	%r4, [%r19 + %r26] 0x81
CHANGE_USER966:
	ta	T_CHANGE_NONPRIV
CHANGE_R26967:
	add	%r26,	%r27,	%r26
NC_BIS_PRI967:
	.word 0xccf3dc5a  ! 2839: STXA_R	stxa	%r6, [%r15 + %r26] 0xe2
SET_TL1_968:
	ta	T_CHANGE_TO_TL1
CHANGE_R26969:
	add	%r26,	%r27,	%r26
NC_BIS_NUC969:
	.word 0xccbd44fa  ! 2841: STDA_R	stda	%r6, [%r21 + %r26] 0x27
CP_BIS_NUC970:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 2843: STBA_R	stba	%r4, [%r20 + %r26] 0x27
NC_AIUP971:
	.word 0xc886431a  ! 2845: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r4
	.word 0xc8bcd13a  ! 2847: STDA_R	stda	%r4, [%r19 + %r26] 0x89
	.word 0xc8f3911a  ! 2849: STXA_R	stxa	%r4, [%r14 + %r26] 0x88
BLK_PRI972:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 2851: LDDFA_R	ldda	[%r11, %r26], %f0
	.word 0xc89cd13a  ! 2853: LDDA_R	ldda	[%r19, %r26] 0x89, %r4
	.word 0xc8ab911a  ! 2855: STBA_R	stba	%r4, [%r14 + %r26] 0x88
	.word 0xc984913a  ! 2857: LDFA_R	lda	[%r18, %r26], %f4
CP_BIS_AIUS973:
	and	%r26,	%r28,	%r26
	.word 0xc4af847a  ! 2859: STBA_R	stba	%r2, [%r30 + %r26] 0x23
NC_SHORT_FP_SEC974:
	.word 0xc99cdb3a  ! 2861: LDDFA_R	ldda	[%r19, %r26], %f4
NC_BIS_AIUS975:
	.word 0xc4a7c57a  ! 2863: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
CP_NUC976:
	.word 0xc8b5009a  ! 2865: STHA_R	stha	%r4, [%r20 + %r26] 0x04
NC_BIS_AIUP977:
	.word 0xc4a6445a  ! 2867: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
CP_PST_PRI978:
	.word 0xc9bb189a  ! 2869: STDFA_R	stda	%f4, [%r26, %r12]
CP_BIS_NUC979:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 2871: STBA_R	stba	%r6, [%r20 + %r26] 0x27
	.word 0xc99b115a  ! 2872: LDDFA_R	ldda	[%r12, %r26], %f4
NC_BIS_NUC980:
	.word 0xccbd45fa  ! 2874: STDA_R	stda	%r6, [%r21 + %r26] 0x2f
	.word 0xc8a4d13a  ! 2876: STWA_R	stwa	%r4, [%r19 + %r26] 0x89
	.word 0xc9a4913a  ! 2878: STFA_R	sta	%f4, [%r26, %r18]
CP_BIS_AIUP981:
	and	%r26,	%r28,	%r26
	.word 0xc4f6055a  ! 2880: STXA_R	stxa	%r2, [%r24 + %r26] 0x2a
	.word 0xc9032018  ! 2881: LDF_I	ld	[%r12, 0x0018], %f4
	.word 0xc89cd03a  ! 2883: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
SET_TL0_982:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI983:
	and	%r26,	%r28,	%r26
	.word 0xcca29c5a  ! 2885: STWA_R	stwa	%r6, [%r10 + %r26] 0xe2
	.word 0xc87aa018  ! 2886: SWAP_I	swap	%r4, [%r10 + 0x0018]
CHANGE_PRIV984:
	ta	T_CHANGE_PRIV
CHANGE_R26985:
	mov	%g0,	%r26
NC_BIS_AIUS985:
	.word 0xcca7c57a  ! 2888: STWA_R	stwa	%r6, [%r31 + %r26] 0x2b
	.word 0xc89cd03a  ! 2890: LDDA_R	ldda	[%r19, %r26] 0x81, %r4
	.word 0xc893101a  ! 2891: LDUHA_R	lduha	[%r12, %r26] 0x80, %r4
NC_BIS_AIUS986:
	.word 0xc8bfc47a  ! 2893: STDA_R	stda	%r4, [%r31 + %r26] 0x23
	.word 0xc93b6018  ! 2894: STDF_I	std	%f4, [0x0018, %r13]
NC_PST_PRI987:
	.word 0xc9bb985a  ! 2896: STDFA_R	stda	%f4, [%r26, %r14]
CHANGE_R26988:
	add	%r26,	%r27,	%r26
CP_BIS_SEC988:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2898: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
NC_AIUP989:
	.word 0xc9be421a  ! 2900: STDFA_R	stda	%f4, [%r26, %r25]
NC_BLK_SEc990:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2902: LDDFA_R	ldda	[%r19, %r26], %f16
CP_PST_PRI991:
	.word 0xc9ba999a  ! 2904: STDFA_R	stda	%f4, [%r26, %r10]
NC_BLK_SEc992:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2906: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc93b401a  ! 2907: STDF_R	std	%f4, [%r26, %r13]
CHANGE_USER993:
	ta	T_CHANGE_NONPRIV
CHANGE_R26994:
	add	%r26,	%r27,	%r26
NC_BIS_PRI994:
	.word 0xd0a45c5a  ! 2909: STWA_R	stwa	%r8, [%r17 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS996:
	.word 0xc8f7823a  ! 2911: STXA_R	stxa	%r4, [%r30 + %r26] 0x11
	.word 0xc983505a  ! 2912: LDFA_R	lda	[%r13, %r26], %f4
	.word 0xc8bcd03a  ! 2914: STDA_R	stda	%r4, [%r19 + %r26] 0x81
WR_LEASI_997:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_998:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc882901a  ! 2916: LDUWA_R	lduwa	[%r10, %r26] 0x80, %r4
	.word 0xc8bbd11a  ! 2918: STDA_R	stda	%r4, [%r15 + %r26] 0x88
	.word 0xc99cd03a  ! 2920: LDDFA_R	ldda	[%r19, %r26], %f4
	.word 0xc8d4913a  ! 2922: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r4
	.word 0xc9f2a01a  ! 2923: CASXA_R	casxa	[%r10]%asi, %r26, %r4
NC_AIUS999:
	.word 0xc8d7c23a  ! 2925: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r4
	.word 0xc893901a  ! 2927: LDUHA_R	lduha	[%r14, %r26] 0x80, %r4
	.word 0xc8dc903a  ! 2929: LDXA_R	ldxa	[%r18, %r26] 0x81, %r4
	.word 0xc9a4d03a  ! 2931: STFA_R	sta	%f4, [%r26, %r19]
	.word 0xc9a2911a  ! 2932: STFA_R	sta	%f4, [%r26, %r10]
	.word 0xc9f2a01a  ! 2933: CASXA_R	casxa	[%r10]%asi, %r26, %r4
CP_AIUS1000:
	.word 0xc8cf823a  ! 2935: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r4
NC_AIUP1001:
	.word 0xc8c6421a  ! 2937: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r4
	.word 0xc9bc903a  ! 2939: STDFA_R	stda	%f4, [%r26, %r18]
SET_TL1_1002:
	ta	T_CHANGE_TO_TL1
CHANGE_R261003:
	add	%r26,	%r27,	%r26
NC_BIS_NUC1003:
	.word 0xd0a544fa  ! 2941: STWA_R	stwa	%r8, [%r21 + %r26] 0x27
CP_AIUS1004:
	.word 0xc8af823a  ! 2943: STBA_R	stba	%r4, [%r30 + %r26] 0x11
NC_AIUP1005:
	.word 0xc8d6421a  ! 2945: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r4
NC_NUC1006:
	.word 0xc895409a  ! 2947: LDUHA_R	lduha	[%r21, %r26] 0x04, %r4
SET_TL0_1007:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI1008:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 2949: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV1009:
	ta	T_CHANGE_PRIV
CHANGE_R261010:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP1010:
	and	%r26,	%r28,	%r26
	.word 0xcca6055a  ! 2951: STWA_R	stwa	%r6, [%r24 + %r26] 0x2a
CP_NUC1011:
	.word 0xc8fd009a  ! 2953: SWAPA_R	swapa	%r4, [%r20 + %r26] 0x04
BLK_PRI1012:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 2955: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xc9236018  ! 2956: STF_I	st	%f4, [0x0018, %r13]
	.word 0xc91aa018  ! 2957: LDDF_I	ldd	[%r10, 0x0018], %f4
SET_TL1_1013:
	ta	T_CHANGE_TO_TL1
CHANGE_R261014:
	add	%r26,	%r27,	%r26
NC_BIS_NUC1014:
	.word 0xc4b545fa  ! 2959: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
NC_AIUP1015:
	.word 0xc8f6421a  ! 2961: STXA_R	stxa	%r4, [%r25 + %r26] 0x10
CP_BIS_AIUS1016:
	and	%r26,	%r28,	%r26
	.word 0xc4f7857a  ! 2963: STXA_R	stxa	%r2, [%r30 + %r26] 0x2b
	.word 0xc8f4511a  ! 2965: STXA_R	stxa	%r4, [%r17 + %r26] 0x88
CP_PST_PRI1017:
	.word 0xc9ba999a  ! 2967: STDFA_R	stda	%f4, [%r26, %r10]
	.word 0xc89c101a  ! 2969: LDDA_R	ldda	[%r16, %r26] 0x80, %r4
	.word 0xc8b4913a  ! 2971: STHA_R	stha	%r4, [%r18 + %r26] 0x89
CP_NUC1018:
	.word 0xc885009a  ! 2973: LDUWA_R	lduwa	[%r20, %r26] 0x04, %r4
NC_BIS_NUC1019:
	.word 0xd0bd44fa  ! 2975: STDA_R	stda	%r8, [%r21 + %r26] 0x27
	.word 0xc85a801a  ! 2976: LDX_R	ldx	[%r10 + %r26], %r4
	.word 0xc902c01a  ! 2977: LDF_R	ld	[%r11, %r26], %f4
	.word 0xc8bc913a  ! 2979: STDA_R	stda	%r4, [%r18 + %r26] 0x89
NC_BLK_SEc1020:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2981: LDDFA_R	ldda	[%r19, %r26], %f0
CP_BIS_QUAD_LD1021:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2983: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc832a01a  ! 2984: STH_I	sth	%r4, [%r10 + 0x001a]
SHORT_FP_PRI1022:
	.word 0xc99a9a1a  ! 2986: LDDFA_R	ldda	[%r10, %r26], %f4
	.word 0xc8f3d01a  ! 2988: STXA_R	stxa	%r4, [%r15 + %r26] 0x80
NC_PST_PRI1023:
	.word 0xc9bb981a  ! 2990: STDFA_R	stda	%f4, [%r26, %r14]
	.word 0xc83ae018  ! 2991: STD_I	std	%r4, [%r11 + 0x0018]
CP_PST_PRI1024:
	.word 0xc9ba991a  ! 2993: STDFA_R	stda	%f4, [%r26, %r10]
CP_BIS_QUAD_LD1025:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2995: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xc8cc501a  ! 2997: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r4
CP_PST_PRI1026:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x0a90e686d233ef81
.xword 0xd1cfa3b0698ff5a5
.xword 0x98955cd4d02081ef
.xword 0x7a495c62f6c6c8d5
.xword 0x51ca900d6597be9c
.xword 0xea6234591cae93cb
.xword 0xa9f7820bdcbb9c4b
.xword 0x0957cd861fc9d47b
.xword 0x28ff1dbda54234b7
.xword 0x7af30e71f88b18e4
.xword 0xa4c3b12436f56450
.xword 0xa6f7df15c105bf07
.xword 0x2cfa9a13862d2301
.xword 0x8672bb4f87a0c32a
.xword 0x83e862134fa6cfb2
.xword 0xef69fef60f29b9f8
.xword 0x49cf9302eeff3289
.xword 0xbb8ac6f3f24f8e1d
.xword 0xcc5e9c215358e9cf
.xword 0xecbc31b2aef7c317
.xword 0x24d7a9be324b0abf
.xword 0x8f5ce0392e1af54f
.xword 0x2a125ac2af0549e8
.xword 0x6ffedeffd6177940
.xword 0xea82b441f8c50c26
.xword 0x0c3ef8917698de77
.xword 0x6ff29ae49f72fa9e
.xword 0xb61f3cfd7db4714f
.xword 0xbbc816fa01fa23dd
.xword 0x09e2458b88677624
.xword 0x6d548c1520a5efc6
.xword 0x11586b8eab465b2d



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
.xword 0x0146d391f1867764

.xword 0x0026ec8e5591db8c

.xword 0x51b634a24c379731

.xword 0x578bfc0ded28dac8

.xword 0x9d549c7143f09275

.xword 0x2060df6df9f916ea

.xword 0xdadac10bb174f1b2

.xword 0x151aa556e60a6634

.xword 0xa74e93843b93b7ea

.xword 0xd6658ed1135df20d

.xword 0xe700d8ff974cbac9

.xword 0xf2d42e0b3aafd165

.xword 0xae0923bbb49a5127

.xword 0x28f1830b03027d78

.xword 0x96817f8b2f39e55f

.xword 0x7a907c8b2d726520

.xword 0x169ada9472e7010e

.xword 0xe04286ee633cd65c

.xword 0x751dcaa696995b33

.xword 0x808058f1cf0e6218

.xword 0xe41c28090ae6caf9

.xword 0x634f5ed4090aa9d7

.xword 0x8256e1cdf1c98c76

.xword 0x186d428f17a7a08a

.xword 0x3e5c615033445000

.xword 0x554e2022e86363dd

.xword 0x1e4b541f9a52ffd1

.xword 0xc2078ac09cab4949

.xword 0x45536d2987f3ee80

.xword 0xb0b839ea6ff0e04d

.xword 0x05ff2dcb6479da85

.xword 0xf5fb1635e254f9af




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
.xword 0x86b8cc042bf296bf
.xword 0x2760cdd7a15874ef
.xword 0x3266d76dc199e2e4
.xword 0x9d0e6f1f1657713f
.xword 0xf4ce6a7531a30dd3
.xword 0xf546e845970390f3
.xword 0x908f61dc8a7b8349
.xword 0x7a1afc354796d058
.xword 0xd4a72ec2d8aafb23




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
.xword 0x5a2beab24b78478f
.xword 0x4f0a63f0a4d32363
.xword 0x7634d0558eba20ed
.xword 0x13f7f0111365aaaa
.xword 0xaab3bb52cc3becb9
.xword 0xb372d1cbd94537a5
.xword 0xafffbb6a9da30785
.xword 0x2ce087718d1473e0
.xword 0x5f73722b57a7c304




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
.xword 0x501bb3385d3c89f2
.xword 0x8420f3f71d788907
.xword 0x36eb08b79ec79699
.xword 0x441008b0736505f8
.xword 0xa8c204f9f195620a
.xword 0xf17452d8b8634df3
.xword 0x83e1699677431db3
.xword 0x5e32fab57950bd0f
.xword 0xa3bc28ad99504e41




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
.xword 0x1fa6bca6cfaf4fdc
.xword 0x69b44d5dfcbf4d38
.xword 0xccbd236eebb34e97
.xword 0x41f189a6d7e6763d
.xword 0x26cf077d09a2a852
.xword 0x30cc438742776363
.xword 0xf5226cd95cd29580
.xword 0x67bd2fdd9cad10a0
.xword 0xbc2a65a3a36afa35




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
.xword 0xceda28578e455259
.xword 0x8b53d868d5e3fabb
.xword 0x6f6036e29ee39031
.xword 0xfe0749a850f57a13
.xword 0xbfc466710624ad8c
.xword 0x7fbe92b7c0dfedd3
.xword 0xbc9c221829167f6a
.xword 0x60afb2b37f75d548
.xword 0xbc9224b78d02ae41




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
.xword 0x35d1ccffd2c888b3
.xword 0x62774ce4ea9bf6df
.xword 0x9df2363231ff44e0
.xword 0x81a484988fa0cf53
.xword 0x23e2ebb7d2e9e9e5
.xword 0x5af354c8ae768e91
.xword 0x19024ab19fde3f32
.xword 0xb47e7cb48e40c526
.xword 0x67c382ac4a4b40ed




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
.xword 0xba4b38afefd78fc9
.xword 0x8c5f2417fa9d3ea0
.xword 0x099906ce50920cd0
.xword 0x282455500949a494
.xword 0xf6b5a6468298777a
.xword 0xdd6f74a35e4fb222
.xword 0x554997990e2e64ca
.xword 0x9d7016076a25ea02
.xword 0xae78bbc0fc47a190




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
.xword 0x136158cfb2d124e6
.xword 0x3d183c85d45a33e8
.xword 0xc1df4ee920afb8c9
.xword 0xc88a02a11801dcbf
.xword 0x5549938a056adc74
.xword 0x481651472065da8e
.xword 0x16859a3d6b968be9
.xword 0xb918c3faeac6318b
.xword 0xf8eb0948d2d8ebd0




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
.xword 0xd65cb6c050d7eaad
.xword 0x88090adb44946422
.xword 0xe4264e2316829250
.xword 0x884834d29c2a31cc
.xword 0xb5b8eb8791186f79
.xword 0xd683f90684a942c7
.xword 0x4888f3931e3e896a
.xword 0xa5285b448c9be02c
.xword 0xe698f02e9c15cf9f




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
.xword 0x940873ec0170218a
.xword 0x8674d7083a04698b
.xword 0x7ec154844bf9d692
.xword 0xfe973dbbfb7b3c79
.xword 0xf6addc879f3b465e
.xword 0x74a2f2374b9af8a6
.xword 0x8fda07cb54edf0ea
.xword 0x32e92928d4fddc4d
.xword 0x0f31ab87e8142783




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
.xword 0x8a4556a4cf611a95
.xword 0x100a5399db116dd8
.xword 0x01ea094d9a9182ba
.xword 0x7d340b32ff3d9a99
.xword 0x4787b5b69cf759a4
.xword 0xa6fb4a3e0a62bcff
.xword 0xf8cf9134a95882f6
.xword 0xb61200d12090a3f2
.xword 0x946de54bf10674bf




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
.xword 0x47139e15cad3c693
.xword 0xc8f9dd176ded77f4
.xword 0x86e056aeac6fa6d7
.xword 0xf061438b36fcfc22
.xword 0x5309d501bd3e8d8c
.xword 0x11312cd68e8789af
.xword 0xdaa6199b0eb91af8
.xword 0xa9a90a28f7a56dda
.xword 0x1e4cf225279510c9




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
.xword 0x0463132d1c58acab
.xword 0xf772175df10a1a45
.xword 0x776a9701739c7d3d
.xword 0xebc9a329320a0ca7
.xword 0xb68b1b25d6e9cb43
.xword 0xae03901c1b9c41a6
.xword 0x9b63f565031027f2
.xword 0x9d189f7128313ab3
.xword 0x17d8f84a3de8df65




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
.xword 0xb01b6b99dfa333d4
.xword 0x3fcd5859d201d294
.xword 0xf865c4b02f3769e3
.xword 0x88137e30b6ee06ba
.xword 0x0a2ee8dccdf571ff
.xword 0x2f90d173f702f19c
.xword 0x44706e55c0b4e128
.xword 0x8757d55fa6786d44
.xword 0x88586e603e85d00d




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
.xword 0x8cf25f1a1f07b21e
.xword 0x413751ddf4059696
.xword 0x43d1101d0bfa982a
.xword 0xb1e7b1184b5bc155
.xword 0xcc0783ad46ee1e25
.xword 0x82c88fa48ac60f28
.xword 0x12d4e088b0496f0d
.xword 0xcfd55d217ef0bfaa
.xword 0x3d2330ab57dbf39e




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
.xword 0x5003bf8d53e5ee67
.xword 0xcddead52a553537f
.xword 0xc915389b49999fe3
.xword 0xf60b3f4aed11d453
.xword 0x4ed519f2cae0ef03
.xword 0xa1b08a23dcc572b2
.xword 0xe7b7c18030f2a0a9
.xword 0xb315a3a2e009bb41
.xword 0xc9259d33e3ad34ff




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
.xword 0xce063f55f1953650
.xword 0x93c82aecb7ab27e9
.xword 0x11a5590b2459f1b5
.xword 0x4d41f7de06b59155
.xword 0x27e70cd769f68b1c
.xword 0x0bbda8d87fbb42ba
.xword 0xa0bf69b6fc64feee
.xword 0x1019bfa549b7bb49
.xword 0xe0e8759af0fc80a6




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
.xword 0x38ede5c2e8cd0a74
.xword 0x78471de950328b87
.xword 0x2225bf9fb7bbd04e
.xword 0x4306c8599fd998ca
.xword 0xbee28299d7676a78
.xword 0x8254044baa5ed67a
.xword 0xfe7e4ac2963388e7
.xword 0x3efafe8e3d833682
.xword 0x82931d32c114b4c6




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
.xword 0xd05d941e269b1fae
.xword 0x02d83fc403a0bc50
.xword 0x114c6dba4b89ca1d
.xword 0xd7925a8b0e0c562a
.xword 0xa75f73a64792f6ea
.xword 0x0dfcf31957352444
.xword 0xd19107354b9aeb41
.xword 0x3004827862c8a109
.xword 0x147ba4c166ea0334




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
.xword 0xa212ea6070374f57
.xword 0x4b6046add8fc1f05
.xword 0x520f17f6d3315842
.xword 0x4483ec93d56e5769
.xword 0x6c433b5c7d56bcd9
.xword 0x5817ab8458ecbc35
.xword 0xd45c8e238fb5ba39
.xword 0x12ace02149bbd83c
.xword 0x8b62769cbaf462f8




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
.xword 0x21b70381e5c205f7
.xword 0x47e4b05f14ff274d
.xword 0x7c1c06a694b09438
.xword 0xaae6abb8d4758489
.xword 0x9d5d839ac3b9ef94
.xword 0x4d4c66f1a2d2fa57
.xword 0xabebfce2bbe0690a
.xword 0xdaf01f0b69f33d5d
.xword 0x34df93a9737ae0e5




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
.xword 0x4a09ebe746981e31
.xword 0x7ee0dcbb706b73a5
.xword 0xdf70fdf0eb8bc2d0
.xword 0x2486148d7bc504f9
.xword 0x6e0f7d9b30fb5dd0
.xword 0xb825899dda1d1371
.xword 0x4613f3991c0f65c1
.xword 0xe7c432da645cab74
.xword 0x941dd47471ff0b63




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
.xword 0xe699f7d5d4f9e13e
.xword 0x9b5be5411eb4ba2f
.xword 0x82d0b48a21e76e99
.xword 0x257fe29dd4dd5242
.xword 0xde4fc1e76a695550
.xword 0x045a90bf81d25d3c
.xword 0x39f7bd78c421a8e3
.xword 0xa45488c65628115d
.xword 0xba95adc42fa55087




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
.xword 0x20cabdf1304b5c84
.xword 0x5230a7a2cb904084
.xword 0x9e227f3772b5fdd6
.xword 0xb2c04386f00105b8
.xword 0x7ea76dc0b7654758
.xword 0xfab9b1a2e430a94e
.xword 0xb712ea5076786b7f
.xword 0x1e1ffc892f1f0192
.xword 0x784f7e6a015f5993




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
.xword 0xe8cc3803976a904d
.xword 0x142d726b50982c3a
.xword 0x012b54f0168a7d7e
.xword 0x4692b643ce284299
.xword 0xac940dcee610f2b6
.xword 0x51e2266f561257cf
.xword 0x1a222f8f578e0e78
.xword 0x431d3aadc91158f1
.xword 0xd98b7f24b8e0e7bd




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
.xword 0x3d567bb1bc820d4c
.xword 0x1d6ac0224e1a39dc
.xword 0x6eca529b7c0d2a72
.xword 0x73e39351050a4285
.xword 0x4ceb579db1febcca
.xword 0x4cbebba92040e41c
.xword 0x7949da00678fb98e
.xword 0xa0695066788e89b9
.xword 0x19bdcf1dc7d33524




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
.xword 0x6b4ec6788a826c09
.xword 0x2c18de767448653e
.xword 0x3d50a7c816a515d5
.xword 0xca6ff99aefea104b
.xword 0x115ffc9b2e7e0946
.xword 0x3305189df1ae5124
.xword 0x9198596968194d1d
.xword 0x93f76f38f01e369a
.xword 0x157ed4b71e2cbd86




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
.xword 0x3a19a81387d24528
.xword 0x4fa45ef942a30095
.xword 0x6ac403e136d5be65
.xword 0x9ea099aac16dbfd9
.xword 0xef471419f759a2bd
.xword 0xc98bd2b02847a7ed
.xword 0x5199d71b4e3fb576
.xword 0xcebf1faa2ec8fc23
.xword 0x9d5f7c133a66c210




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
.xword 0x653eef73e49fa666
.xword 0xc225ff0730d8a81e
.xword 0x5bdb79b813e4f626
.xword 0x974e9f2fcd9552b3
.xword 0x65ab0abfa5aae469
.xword 0x93dd12ffce4fc89a
.xword 0x5207a0d66a7a0194
.xword 0x7acfa929712c177b
.xword 0xc9565f232dbe59da




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
.xword 0x5c7d6b68c9d9c656
.xword 0xea6c79075f8dd133
.xword 0xfc3c9681479d75fb
.xword 0xa64aaaf79a86216c
.xword 0x8bff04e85d914da3
.xword 0xcaf997f08d3bd67d
.xword 0x2f11d2c2b47b4844
.xword 0x6808472161a2753b
.xword 0x25cd8fbcf6fffe19




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
.xword 0xfce40a31bfa18f54
.xword 0xebf247f535d672a8
.xword 0x2d15df5bb00b1661
.xword 0xfa2814933660e656
.xword 0xdb6288c49ebfbc6d
.xword 0x7e355dca611bbb38
.xword 0x75c448f0ae6d7dcf
.xword 0x882005bad2f68078
.xword 0xdace18bef030b1e0






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
.xword 0x5838d852601a977f
.xword 0x7d7610adf94f527c
.xword 0x200b6559be2439e8
.xword 0x30ff548b52a98fd8
.xword 0xfb0e0a265ff64295
.xword 0x54c678b15b023626
.xword 0x9fb638eebd5eb450
.xword 0x64533eba57ba3bb3



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
.xword 0xa2fef99644c12f22
.xword 0x4b5679ebf1bce6df
.xword 0x5c71235c645323b4
.xword 0xd0cbe4f0ca474b46
.xword 0x7357d492e3fe35da
.xword 0x1af4e212a30d3d53
.xword 0x5ecbf6f6c2a561d4
.xword 0x7d4666058254de5a



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
.xword 0x5ec8ae400609da50
.xword 0x9cad10a2c8547d43
.xword 0xe4b5257e2cfa326d
.xword 0x5953452a40756d76
.xword 0xb1352db5119b15a7
.xword 0x3f5b2e1d164547c8
.xword 0x29e245d98e6039dc
.xword 0xf0d091fa3fc63bee



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
.xword 0x35ff8dd4a8c901a2
.xword 0x74dc42fa1995c0bc
.xword 0x3f7f16f102eab63e
.xword 0x615075aa674435ff
.xword 0xe0af2a72790f900c
.xword 0x031eb18615e578a5
.xword 0x2cf8bd5d0ae0358b
.xword 0x14bd31e6db02f0a1



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
.xword 0x10261cb99db6e7f8
.xword 0x7c8bd84fcb9a259c
.xword 0xc0e6be6fa53a8eff
.xword 0xfb66066aa12fb055
.xword 0xc64289b6dd0db749
.xword 0xb9aff347e7900bba
.xword 0x8004795cfafd1203
.xword 0x9213020d682908c5



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
.xword 0xc94a3ad1ab8816ab
.xword 0x4ef3436d1ff79d36
.xword 0xa9c671fa2dae15b8
.xword 0xf29049faddca1696
.xword 0x5e1c022e6aa6bd19
.xword 0xfb51c1c4a0bd812e
.xword 0x2ad183ed591075f0
.xword 0x682c778537a771ff



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
.xword 0x12fb2365be28d550
.xword 0xec70081b48d33f4d
.xword 0xa3fd5d0b5ad13eb2
.xword 0x7d23f8b661295de2
.xword 0x1152e4c29dcd1c65
.xword 0xd738e3e3d8f99196
.xword 0xf1636a9c8b90bb79
.xword 0x6536ed68f99bcb25



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
.xword 0x820df9b64e4cdb71
.xword 0xbd3515d611f7b975
.xword 0x62e2e2ed24455611
.xword 0x9ade5dec915d60d4
.xword 0x7f7e4c232cdc6887
.xword 0x348ff1944aca529e
.xword 0x5ad7a3fe2ffdcc3b
.xword 0x1b447144aba722a0



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
.xword 0xd67a0ad22430fa9b
.xword 0x4a5d1ee762dd11fd
.xword 0x1f72f7f6b72507c3
.xword 0x40ecc4c079b37026
.xword 0x32dc24272c4a6514
.xword 0xc0ce68df12bc1682
.xword 0x6bf63c9241edd6bc
.xword 0x8d19842dad549ffe



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
.xword 0x3afce3e28d0adafd
.xword 0x15af6c1e405c8145
.xword 0xf5ddcda7e5f7bc4d
.xword 0xe2a9f6a0b966b40b
.xword 0x7d1504878c3a9ec3
.xword 0x49c2148c96ddfd6d
.xword 0xb0cf7c60d41774f5
.xword 0x6fd2538d0c43fd93



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
.xword 0x6a9435c2e36864e6
.xword 0x273629c97a895d47
.xword 0x3445641def1ac5b8
.xword 0xe504991f917d912a
.xword 0x39eb2b4292253d06
.xword 0xe287bf89b40640ae
.xword 0xbe10f2c8e5a55197
.xword 0xee72c5f77f2073ce



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
.xword 0x2dc9e741cf43ce43
.xword 0x671e93c0e6973c4f
.xword 0xaf06d2c915d7e7ce
.xword 0x724a244eb26f93d5
.xword 0x494115521ad41cac
.xword 0x7753cbb8aef0cca3
.xword 0x12f2326e1de23326
.xword 0x089dbde24cda3250



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
.xword 0x4189b8f65d433a3b
.xword 0x1dcfa8ed3e9da626
.xword 0xd3f1fe09729efe89
.xword 0xa644add820e382e4
.xword 0x896431155b991295
.xword 0xd73fb96fdf09dfdc
.xword 0x7d3a1068a33c52cf
.xword 0xc74628dd14fc322d



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
.xword 0x6be90a85588cfd18
.xword 0x2f4faa596af640bd
.xword 0x8682268f32b3ec9d
.xword 0x550152a97a23b806
.xword 0x8eb625da8df9cd37
.xword 0x947362ab948efef3
.xword 0xc27678fc02b8243a
.xword 0x04864b0ce0d3a3f1



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
.xword 0x8bc43c0dcaef92f4
.xword 0x40f5e7963107298a
.xword 0x62e686e76fa5d4bf
.xword 0xb21451064b5df864
.xword 0x8d9aa04ff6c24b3d
.xword 0x64f53fdf90441617
.xword 0xe36a30ec8f815276
.xword 0x22f9f7188f8a6c99



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
.xword 0xb3bb96bc761a66c9
.xword 0x29a61711f7918aa7
.xword 0x9c6c219522e41af2
.xword 0x7839be8efabb8dea
.xword 0xe68997a6c96c26db
.xword 0x89f4cad299265e6d
.xword 0x105859f5dce054d5
.xword 0x8a31a3baef5eef7c



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
.xword 0x8d4ef8583d826d68
.xword 0x338f2f09380b2355
.xword 0x2af21b6d1cf7b867
.xword 0xc1d8de6bc7431c97
.xword 0x8b6d97192034abcc
.xword 0x86e2201aad0c898d
.xword 0xbb75a634926de68a
.xword 0xbd2cc8da687510fd



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
.xword 0xde44acff0101cb3f
.xword 0x26bbd8b6fb934ea9
.xword 0x5483a11924847390
.xword 0x680a7ecf946276fc
.xword 0xfcbfc405ef888d26
.xword 0x31c45d0ea35d336d
.xword 0xdcda44ec284a0b89
.xword 0xf2e718968a491905



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
.xword 0x2ca63d69e7ef5a24
.xword 0x7d7615c07c1b9995
.xword 0x2585b5935d69bc01
.xword 0x7e28537e9921d6b2
.xword 0x67044d7254e38aa8
.xword 0xfb0c982af8e16663
.xword 0x878d601e5a41ae57
.xword 0x23f4e18eea8951d3



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
.xword 0xc21655be78cd5ae3
.xword 0xcdf761194949c6d1
.xword 0x065aaaff598aacdc
.xword 0x90736b6524573f3b
.xword 0x153d0b8b0c9d977c
.xword 0x7cd28ae466a088bf
.xword 0x023db79f8342cd82
.xword 0xe6b530323d8211e3



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
.xword 0xdd99a259927114d9
.xword 0x39dec7874b2745e1
.xword 0xa6b6090aef1302c7
.xword 0x6eec75791ca9cb45
.xword 0x8c0bd969708297bd
.xword 0xc2f33ee33280f04e
.xword 0xa655187a9a1424fb
.xword 0x78823e0090e5cd25



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
.xword 0x66eb1f41393ca363
.xword 0x047212d73f98fde2
.xword 0xf274cd9fabd59aa9
.xword 0x7260e32db47b11ba
.xword 0x7f9ac09e50ec7f36
.xword 0x946fb110afcbe2c8
.xword 0x54373a3e334a5f13
.xword 0x68aae70902243b22



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
.xword 0x89deb99035cb5736
.xword 0xb1b40b668152c15b
.xword 0xe94114564233a7c1
.xword 0x543e7f5f6c8e3a3c
.xword 0x80d46d936b31a3e6
.xword 0xe3edd4147f7af539
.xword 0x402ce55309c9b977
.xword 0x31659f145033c0ab



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
.xword 0x77b9b2c90db3d305
.xword 0x07f8b81e923dd407
.xword 0xedd5d64627e4de29
.xword 0x25dc8c498f52d927
.xword 0xd7b4c3eaf34d0c09
.xword 0x3d0f1756553f7f6f
.xword 0xfea44b442f8172ec
.xword 0xda9dde849395a30d



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
.xword 0x5999667266e88d1a
.xword 0x2996dd0eda7981cb
.xword 0xbcf2991437f146a6
.xword 0x6cb96d7744eaecc3
.xword 0xa306151e39c40f5e
.xword 0x4b2334850d52ab4a
.xword 0x582e59c7933541ab
.xword 0x66c32f378ae9e066



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
.xword 0x3570d96be1c97981
.xword 0x80ca0a3c3c2b7bfd
.xword 0x096dfaeac050e5a9
.xword 0x7568ecf943b00b27
.xword 0xc8a0bf5a59b544c6
.xword 0x92f7a961e8e2b606
.xword 0xc1466df07d760122
.xword 0xd520ac180ec32cc7



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
.xword 0x41a82d03ca5429f7
.xword 0x44ddf3907d60a60b
.xword 0x157b98119af5badf
.xword 0x1b0e677dafe00487
.xword 0x6eb76afab84422fa
.xword 0xfa798b1561459948
.xword 0x13586bda997ec8d3
.xword 0x4a89c8fd82ae51aa



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
.xword 0xe35bf30153600f18
.xword 0x74d9448b8a80afbc
.xword 0x4ab3ec9ace46f3cf
.xword 0x21c14b43b3fbe0cc
.xword 0xde03f3fde8822c28
.xword 0x0100d858540d1022
.xword 0xf46125eea673dbb5
.xword 0x4f3106061ddfd45b



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
.xword 0x1f1e60a478027c1a
.xword 0xeb4c49525679e5ab
.xword 0xf19871d0971741d2
.xword 0xbde729214b327886
.xword 0x8de22364b27f99ea
.xword 0x8bb57e25aa0ccda0
.xword 0xe7795294901e0e95
.xword 0x8f00429eb443f54d



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
.xword 0x40b11cefc42bce3d
.xword 0x89ee31685e9d32f6
.xword 0x878de0d6a75a26f6
.xword 0x85dfaddb7c1d029d
.xword 0x58d38b8ef4082c4b
.xword 0xffd112b9d79b41e0
.xword 0xd65bd5bd41246db8
.xword 0x8f960ea03ba84e09



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
.xword 0x08893117e46ced83
.xword 0xe0c32609d85d85e1
.xword 0x136f425906a71dbe
.xword 0x36aca44cab1e197f
.xword 0x8f6846a2377ac853
.xword 0x81b9312f76558215
.xword 0x758cba164bad00b1
.xword 0xe61f3bf7ee473a0b



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
.xword 0x55119aa81a36e899
.xword 0x91f1e8a5375f450b
.xword 0xa66520c6eaebb702
.xword 0x2b872577a17af173
.xword 0x085a5a4a67d9e56e
.xword 0x9ad558e13e5511e1
.xword 0x02d30c75aa0a70ab
.xword 0x037fd7f4b85d6adf





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
.xword 0xaf7e64bcd2fedd0e
.xword 0x8a995163bee4ee08
.xword 0xe499a0e28e0ef33c
.xword 0xe5e4ee7816fe4fdb
.xword 0xb694e01177ea0c95
.xword 0xd02c43d4ef95d065
.xword 0xbc62ed71665d68c7
.xword 0x32e6cf1f2163992f




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
.xword 0x2b2599d4c2456325
.xword 0x66dc60a40e57bdd6
.xword 0x50e0124bb13f47a3
.xword 0x76414b519286668d
.xword 0x98e4823ba0b9682e
.xword 0x95c77c229aca1552
.xword 0xcfb0fbaa9e2f4d47
.xword 0x94d95ebf81bbd723




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
.xword 0xef2d044837c42de9
.xword 0xf1e9338ad8609072
.xword 0x4d242e04efc1e4d7
.xword 0x6f7bd1321ac0b613
.xword 0x59f118cdd232c814
.xword 0xf13ab6b6b95a2632
.xword 0x7520884552ce4aee
.xword 0x541e1eb21395102c




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
.xword 0x6afac55ccadc7385
.xword 0x006fc6eebcfd6498
.xword 0x1cc89cfc29bf99a6
.xword 0xe57dde72be6d7db2
.xword 0x98e71495ad67a3ae
.xword 0xcbf3684d9b8ddbbd
.xword 0x4f4990b15983ea71
.xword 0x9781223cbf3e979a




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
.xword 0x7f2499b2c490aa8f
.xword 0x6c40ac028849061b
.xword 0x06b787051aea089a
.xword 0x5cc725c3d3a9d183
.xword 0x83dbd3e60320907a
.xword 0xbc640d937fca33ee
.xword 0x7b691cb6382f0d4a
.xword 0xad09bebe36bf67bb




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
.xword 0xb45a171fe37c44de
.xword 0xc5c5f1e3fc69e5c0
.xword 0xf914d6d124b7d165
.xword 0x099284a959eb8088
.xword 0x63769c0024004c03
.xword 0x70b397e8699571cb
.xword 0x86c900a084e2c944
.xword 0xff72ed9b4823c829




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
.xword 0x5c93e5f692e8796b
.xword 0x63243a794399eb34
.xword 0xeb88d319f419623b
.xword 0x010e520199fdf039
.xword 0x155972f3514c8066
.xword 0xb3299874ee950d2c
.xword 0x2412bad027b2aaa5
.xword 0x4e87e235913a305e




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
.xword 0x67f344283f51382f
.xword 0x42081d38cdd1d7ed
.xword 0xaa0bfe630f29414d
.xword 0xc9e3fc7894cf9f48
.xword 0xbfcc7f3aeb9b48dd
.xword 0xebe247ff148688d6
.xword 0xd5f4e4b77c34317e
.xword 0x0602bc96d20a2c96






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
.xword 0x886d85dac700fac7
.xword 0x0354f9141a2460fc
.xword 0xa0c0a56a0ffe2b58
.xword 0x62ec129bd93ed753
.xword 0xabd22a4c96d6e607
.xword 0x006775f30234f748
.xword 0x46e039191b5a0854
.xword 0x88b6d5ae31df10ad




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
.xword 0x7444772a0db0a43b
.xword 0x132283b24addba05
.xword 0x826ce7ddbb97730c
.xword 0xdbc7daf0725702d1
.xword 0x06c14a851f7dfcd3
.xword 0x312f6edf7a228a51
.xword 0x0f6eb2867081f926
.xword 0x80609ce79bcdbeb1




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
.xword 0xb509b3e817d9045d
.xword 0x34dcb5de73f80b8b
.xword 0x32cccf3d061dd9d1
.xword 0xe93aeaec61691c8e
.xword 0xd890e82dcf9f6d6d
.xword 0x23acad018a53fe36
.xword 0xb87f9d6b87b7d85e
.xword 0xc5792e47827272ae




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
.xword 0x54bc9267bb908bba
.xword 0xaceadc3c2516cffa
.xword 0xad4fb963bbff4660
.xword 0x2c9cfcd0a4fcf75e
.xword 0xed26b945034c43c9
.xword 0xb0a2d334e589757b
.xword 0x84ed0e1d0ea7995b
.xword 0x9a1bfcd0ed772606




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
.xword 0x63135a80ffdf6af9
.xword 0x6b8561eb832fac4c
.xword 0x84e72289eda815ce
.xword 0xec5c18b9e556f71d
.xword 0x26382a65de15cb6e
.xword 0xb30ad8e6fa617c64
.xword 0xccdf364f2514c44d
.xword 0x9a5ad76c612a59f7




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
.xword 0x1bf6bafac578605f
.xword 0x3b48d61b1e46abf2
.xword 0x5955c71ab408df05
.xword 0xbf9861c5d6e8fc6f
.xword 0xa5ac8d8a96703916
.xword 0x36d80f362cd567a8
.xword 0x645f56b568db2924
.xword 0xc3cea4fb073d2683




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
.xword 0x7ce3a384a2fe3d88
.xword 0xe30dab010814eb3f
.xword 0xc4552a2af9038881
.xword 0x181e95e679cac846
.xword 0x3220c46ab798acf2
.xword 0xebff89b400d74f7a
.xword 0x11bb8842883952c6
.xword 0x6080ef74aa60db06




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
.xword 0x358b1feb6780b66c
.xword 0x5282e540684b2ef1
.xword 0x81f32a0648116665
.xword 0xe89b95b363505f17
.xword 0xb6a3e6b5d649bfc3
.xword 0x2826f4320f9fea24
.xword 0x8165b8678c750729
.xword 0x973cdbe14ce5df0a






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
.xword 0x3b6e1bdd06755bfc
.xword 0x23c7536eae50536d
.xword 0xf5195219962c79de
.xword 0x49d2442a87d8620d
.xword 0x08a6fe3c7ad164dd
.xword 0x1b7bea975b8ebd43
.xword 0xa1b563a7c49aea76
.xword 0xe6aac563ad68951e




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
.xword 0xcd491316e205ae94
.xword 0xbba05680a4c58d84
.xword 0xd8e4057dc9d3d29f
.xword 0x0d82d59059bbd979
.xword 0x0853f8c32abbbe04
.xword 0x585092c93fe1c7f2
.xword 0x36c6e2e773a6b713
.xword 0xca647b0639e4c8af




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
.xword 0xb8014b2a7874e510
.xword 0x724d61a655e6b924
.xword 0x324f0c48cbe8a8d5
.xword 0xb2600347ad2d5e54
.xword 0xaf25a9d08e74f69b
.xword 0xf0b0f00c7382d730
.xword 0xa6421dd5a84503c5
.xword 0x6ce1650b3cba15b8




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
.xword 0xa58f1e1def9162d6
.xword 0xcfb684fb151b5697
.xword 0xdfa55e842dcdea32
.xword 0x891a431d6df8b034
.xword 0xdc6d9714d4f88e59
.xword 0xc4310a48bb6f2213
.xword 0x2a2c89790d9c110a
.xword 0x3d3258688f5cd72d




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
.xword 0xf78730dad27f13ad
.xword 0x46863790a1712220
.xword 0x8d3e8565c465d63c
.xword 0x97817fdf66135036
.xword 0x8ae81f56866c7e1d
.xword 0xb86bbc8e964eb980
.xword 0xd164f0840c012229
.xword 0x34627cdcb67a6e98




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
.xword 0x6972601c3a0c8635
.xword 0xae107ea1a04821b4
.xword 0xee0c035feef2bf19
.xword 0xb1d3bba127b084f4
.xword 0xe4648e580e07bf69
.xword 0xc7706a4240da3de3
.xword 0x13077b1055fd57a5
.xword 0x98e24f3d8d0921a3




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
.xword 0xec1979bd2ad319ec
.xword 0x74c4973e3351e09e
.xword 0x333789f664804649
.xword 0x6cf50e1b9c557e85
.xword 0x7d4a99dd242e3740
.xword 0x9dc7f5a61c70cfda
.xword 0xa98fbc296d003d53
.xword 0x2a4914547f6e40a7




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
.xword 0xe835e374c9ef8d6d
.xword 0xd19dbe3d14cd0409
.xword 0x716c418a2d7bd02c
.xword 0xa626a646b4c70fcd
.xword 0xe995dbad1f74e271
.xword 0xd4380957a29957fb
.xword 0x61747aa1df7775cd
.xword 0xb7a9cdb625ede0d3






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
.xword 0x1a1c81002cba233e
.xword 0x36055891d17c9594
.xword 0x9bfb4d31db57d250
.xword 0xff4ffb8e4b40a83b
.xword 0x7992b2f9ca490a4d
.xword 0x34b2029c3fbb5ebf
.xword 0xfc553fc01c091ae6
.xword 0x4c1b5c6f39f9997f




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
.xword 0x9566688a9b909654
.xword 0xd6ba70be18e14ec1
.xword 0x317fe2e23cd3d7a1
.xword 0xf2060d11de8f3901
.xword 0xf8d7449a805ea4ba
.xword 0x54ef89d9dfbe606d
.xword 0x553d1d92f79683dd
.xword 0xbd17bd443c061161




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
.xword 0xe0b8cc2ef3e13d26
.xword 0x2f295aa40490b6b3
.xword 0x9a66edd3d633c828
.xword 0x27d96a6879f4fba2
.xword 0x865d27a7ef36f8b3
.xword 0xda5e70d44f872f2a
.xword 0x03743b7f27d53aad
.xword 0xa7571cb326303a57




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
.xword 0xb7db97f2e4ead867
.xword 0xf172080eda007043
.xword 0x7c336b8f4cc67c0c
.xword 0x60f903d8ba25b3b5
.xword 0xc00b8e2bc5479dc2
.xword 0xcd0e2158c2cdbada
.xword 0xa42e802af3edca7f
.xword 0x1dd2705eb364d3b1




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
.xword 0x13808f20732a49fd
.xword 0x622b90a743aa8570
.xword 0x85b5672beb4bed0f
.xword 0x6ad6705ff4372fb7
.xword 0x5098400c55fadd6e
.xword 0x731463adf17962df
.xword 0x13c59487e901d8b1
.xword 0xc371dda5d1d1502b




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
.xword 0x1298a618c5e05558
.xword 0x3f47283a589086e8
.xword 0x71bcb5f37464c9ea
.xword 0xf82a03ad911e8880
.xword 0x2c42b408bfbe523b
.xword 0x83c2d290867b617d
.xword 0xc913c449588ed326
.xword 0xacd8e78a37308373




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
.xword 0x27cd53163d09c678
.xword 0x6dd1d67ec8a8a948
.xword 0x8f1158fe54b5545e
.xword 0xf2fe43b06a073da7
.xword 0xeca2056d147d65ae
.xword 0x17b0d56beef0070a
.xword 0xf4ca3ec11f4ece67
.xword 0x1ae8ac00bcd51013




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
.xword 0xf013a39483215bf8
.xword 0x922184dc9e3d55f2
.xword 0xbc40f3b76c203d25
.xword 0xfe3df2a64412a7c8
.xword 0xc0329cfa6678885a
.xword 0xf17c357e689ce0c3
.xword 0x3925ee8620609a86
.xword 0x7432b530f76d9512






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
.xword 0xcceae26acec92c87
.xword 0xee106ca1e5fd1fe3
.xword 0x73003a39ce414c3b
.xword 0x741ccbf030a7d2e0
.xword 0xbde94107946a7378
.xword 0x0f9e2125076f7c3d
.xword 0x3305d85e21317e2f
.xword 0x5581c55845ad52c6




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
.xword 0xb7c3df6e8d92748f
.xword 0x82f3877a87cbb32f
.xword 0x4621f6279e189899
.xword 0x4935b07cf4e20f3b
.xword 0xf047f62190dfdfb9
.xword 0x73d928ee63b9c382
.xword 0x90b0e73ae986fea4
.xword 0xc4267a394454f39d




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
.xword 0x0bcafd0c9dc208c1
.xword 0xa8a9d874e7b7f070
.xword 0x2de755c3b9e73c3c
.xword 0xadbc7635fbd902cd
.xword 0x2e08841fed10aad5
.xword 0x44e7862c738cf4db
.xword 0x97312072bfdf7596
.xword 0xe9622b4231525b60




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
.xword 0x1b0c5d46e8d70d4e
.xword 0xaa79fb69abd98b32
.xword 0xf534ccb98bc57d80
.xword 0xe876faec219c036d
.xword 0xb801f0fecb4b6ded
.xword 0x1aace3c1da029801
.xword 0x375fee04881dc25b
.xword 0x8c68817acc3010c8




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
.xword 0xf572fcffb97a79cf
.xword 0x5d923fcf5d5189f0
.xword 0x03f4376a03d6a1f9
.xword 0x57c399caa65bf3a8
.xword 0xeb03b08a29601b46
.xword 0x2d8a350dcd812062
.xword 0x8c95b94234ee2caf
.xword 0x48d4216c640eeff9




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
.xword 0xff635d419273b4d9
.xword 0xd24a68cc0abff954
.xword 0x8906979003a4445d
.xword 0x3a4f8cac9a36956d
.xword 0xfc681c5edea2e500
.xword 0x9054a1e7ec69595e
.xword 0x06383c8bd291629d
.xword 0x8dc96a599560b408




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
.xword 0x4e11a7941bf2bebb
.xword 0x7d6b5f1afd4eb822
.xword 0x3732470cd0a1dc73
.xword 0xe110fa1c100fb694
.xword 0xa8f670d64319d505
.xword 0x06e1dcdfdbb8c107
.xword 0x2fef8be27a89a709
.xword 0xe810c4277cd395d2




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
.xword 0x6eae3d97b888bc7f
.xword 0x8d3d0e686eb4e44f
.xword 0xa2bcf84d2d4de169
.xword 0x2289775dd121edb3
.xword 0xea6222c8048b41ca
.xword 0x5bed82fd79199d5f
.xword 0x54261627dc5e5599
.xword 0x4d4dfab0976f9505






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
.xword 0x6ce8544d8320eba0
.xword 0x3606d66d204cf20d
.xword 0xe151f330c8b9137c
.xword 0x0826c0f764786c6c
.xword 0xda58c86ca28414ed
.xword 0x564ace0454df72e4
.xword 0x6510a3c1ad3707b1
.xword 0xf3da29b537bab4f6




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
.xword 0x9aa3c173c40a5bc6
.xword 0xfa4c30528feda3d9
.xword 0x7e52e1fbf2aedc0c
.xword 0x3b63acbf35d882e1
.xword 0xf7acf55fbb14b82f
.xword 0x01f3afdab3b95dab
.xword 0x2e1f709e4a04e42b
.xword 0x56c943a44fe7888b




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
.xword 0xa6bbe8f1d3daba68
.xword 0xecb78d8a8d70e058
.xword 0x7efab35b5ced9d62
.xword 0xf58f90cbe8ab01c0
.xword 0x72ccdc4fb76af559
.xword 0x5383067bcb5735bb
.xword 0x155c3340a8eb95fc
.xword 0xda97b3bc9751f6b2




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
.xword 0xe06c104eadeeaac1
.xword 0x2985c57dbe183bc1
.xword 0x19e8cf6836832c17
.xword 0xe01f45d77cdda0ee
.xword 0xbd2c908e81d990bd
.xword 0x80afaa4c97ec0e7e
.xword 0xd91e61fd9e5bbd45
.xword 0xf20ee6820b554dca




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
.xword 0x8c1f5d5795c7c6e0
.xword 0xfdc26a7da6aa6bc4
.xword 0x09d5b87257fdba1e
.xword 0x6cb988aa27516faf
.xword 0xf99a725922bb6272
.xword 0x614608c025ab46db
.xword 0xbfc603ad70660273
.xword 0xd2c3d15c2d90f947




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
.xword 0x47925adb4b3c193f
.xword 0x0508b4ff39d85b13
.xword 0x34d0a734d5a3a036
.xword 0x047129e80e1665e8
.xword 0xef3a5dca474a4bf0
.xword 0xd6132fdd3f5571e5
.xword 0xf6dc714c556e664e
.xword 0x942bc1310423b397




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
.xword 0x783277e7395bed41
.xword 0x79b7d79bef43ded8
.xword 0xecbfffc01590b53e
.xword 0x5597304b1d146b64
.xword 0xce1b0933dc6f1172
.xword 0xf8b0cbf01608de0c
.xword 0xf8d4e7c0516bfebe
.xword 0xbae05056afc339f9




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
.xword 0xc75d8fbd63c694d8
.xword 0xe36c63b3d7a35544
.xword 0xf6015ba854c97186
.xword 0xa1fdd2d4a429c26b
.xword 0x2bfb87bf5fb31732
.xword 0x4dc2d4fb9721bbd0
.xword 0x36c32c40c38c342e
.xword 0x6cb6a8f67a15d847






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
.xword 0x85e5834f57e07411
.xword 0x23c418ac00db23ac
.xword 0x289a533bc24f3bbb
.xword 0x94805a36d1bd734b
.xword 0x02780feff53c7b83
.xword 0x84dfe08de5e98a7e
.xword 0x735b12a220d0295e
.xword 0x7ca9a4c3ec4ef2e0




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
.xword 0xba8dae329d9801c0
.xword 0x200d0088061666d1
.xword 0x7d3e23e9d4a897e8
.xword 0x24577d203adba847
.xword 0xe90821d9bb07ff85
.xword 0xaece9f24bddefade
.xword 0xca51329d9612b5d8
.xword 0xe9f66c74ce25a276




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
.xword 0x3d0b04853d906d40
.xword 0xc6ee7ac61248e7be
.xword 0x9dc38d0231f3d0be
.xword 0xad50a8f47771ded2
.xword 0xa502d9b5fcfed41f
.xword 0xd31ee4ad96c46244
.xword 0xab95055bef370e42
.xword 0x011242d714468800




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
.xword 0x3147778213c3c5cb
.xword 0x362f4449538b4905
.xword 0xd05eed59e8e2e740
.xword 0x22ea19b4e665aef1
.xword 0xe184045d206b8462
.xword 0x842414bdb66bbcbb
.xword 0x85631f2ec478ff57
.xword 0xbce3b2c35ec1101b




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
.xword 0x0c3732e13f866833
.xword 0x2a95bde37b7dac81
.xword 0x84eec3ca0bea9dc6
.xword 0x600a770441268500
.xword 0xcc929c97ec4c8d6c
.xword 0x826fae0c476c3f73
.xword 0x61e86355d2d8fbd8
.xword 0x73f0de49e5a280f4




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
.xword 0x830a4dde700cf2eb
.xword 0x70ecbc57eeca46c9
.xword 0x207acd817ef30953
.xword 0x66eb55d356204627
.xword 0xf143bbbc5f7609e4
.xword 0xd4613e511b6482fb
.xword 0x1d1e88c6b33e2205
.xword 0x2e06704d75d2fa87




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
.xword 0xe123b35b64461458
.xword 0x4490f63cb7a10a87
.xword 0xec0fb426b0b76acc
.xword 0x9d87aa2d4174c492
.xword 0xd32f7fd249357aba
.xword 0xd5f2d5961a1a915f
.xword 0x2eb5114a2861d54c
.xword 0x42d236731c7d9628




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
.xword 0x60a9fab313217fb5
.xword 0x6ca483abcf3dd3c4
.xword 0x2b783aa87984e93b
.xword 0xe3600d8fe27e1700
.xword 0xc1cfeabdf6700b38
.xword 0xff304ea14bc4ede6
.xword 0xbac4ffe4e5fb6328
.xword 0xbb11b4e203e56527






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
.xword 0x0eb36e1218329143
.xword 0x1515064bdf77741b
.xword 0x136861d1e552db8f
.xword 0x27846bc01c57748b
.xword 0x26e39462a21f904c
.xword 0x610fa8b4d62d3fee
.xword 0xb8d5943411e3ae08
.xword 0xcb937df63b62673f




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
.xword 0x7fad342fb3d4fc01
.xword 0x753702773539f40d
.xword 0x56086602a00213a4
.xword 0xa2706baf864ecd3e
.xword 0x3469a85ce66bc989
.xword 0xcbd5e0faaea28f0a
.xword 0x06d2b2992fdd85ef
.xword 0xbd14ff4e525505de




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
.xword 0x7c7b31a6eb5175a4
.xword 0xf9b5a6af72c94da4
.xword 0x9ea74692b3b91ed6
.xword 0x4ad59e078d257473
.xword 0xc642816cc51dc090
.xword 0xf1f0da098e96a740
.xword 0xcc0e9b8674fcd7bb
.xword 0x96bab88195bbac22




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
.xword 0x9eddf479092bd1b3
.xword 0xbe667425deae8c9b
.xword 0x511d1e3eb8d5f74c
.xword 0xab02c4eeae740ada
.xword 0x30333f1ae6c778ca
.xword 0xaf68cecacee3b20b
.xword 0x6c7c7a7ed033cd1e
.xword 0x840900c1e617b92c




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
.xword 0xf69427e1b0418a24
.xword 0x269528449cc3699a
.xword 0x0ffdf69517eeac09
.xword 0x85fbc1572ea27be0
.xword 0x3b56b3f6eaf70c36
.xword 0x709f16879bc92356
.xword 0x4aca912b7e67f0c1
.xword 0xf80f76634f6df329




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
.xword 0xa878aa1e0939ade6
.xword 0x8a7744027c0a8f35
.xword 0x9cbb45b041a972a1
.xword 0xc50a51c51183fa38
.xword 0x90c3fb06be322d54
.xword 0x7a0c11f10a0ec77d
.xword 0x8fc6b54ca5cb1ae1
.xword 0xa0d83f7474dd7087




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
.xword 0x78e00c9f5c0ee5a8
.xword 0xfc006a3b3b35fd12
.xword 0x9695c5940c8582a7
.xword 0x7ee3c69dbea4d289
.xword 0x3b2d2167792ebe81
.xword 0xf85eab114cfda11c
.xword 0x0cbc68cd5c60b1b1
.xword 0x3671c45d1200721d




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
.xword 0xe71ef563729dc465
.xword 0x90d7811aedd22771
.xword 0x79949da757492e8b
.xword 0x648df8674e2337fe
.xword 0x466dc18659d3ff2e
.xword 0x174afe86649e2f22
.xword 0x9a9e7bf59ac98f68
.xword 0x1746665591bc8bc3






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
.xword 0x179c87b539cc7da9
.xword 0x018ae7e40879a14b
.xword 0x4050128e05e05227
.xword 0x5bc898906f3eb5d0
.xword 0xd81fe1d58bececd2
.xword 0x487adeb99ed844c0
.xword 0xf081418db4c1dc8c
.xword 0xf0cb27e655708fd1




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
.xword 0xe623b9db635223de
.xword 0xcbce2901d474f564
.xword 0x64d11ca0fbd8596f
.xword 0x0af484db0b3db93b
.xword 0x592f0edb254c2d6d
.xword 0x2039f39c7b743c50
.xword 0x7ffc7640687ec27c
.xword 0xaec5a03328cd9e02




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
.xword 0x7e41b975f41251c2
.xword 0x0bf3c12dd0ba6b06
.xword 0x9bde5fa118a22075
.xword 0xf5987775eed1db4a
.xword 0x98697eeb1fb13cb7
.xword 0x6eaf7639420083c0
.xword 0xcb9ba9ec387257ad
.xword 0xe5eadfface4f720a




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
.xword 0xae8aff3ee112f408
.xword 0x77b07231caaa60a2
.xword 0xf7cc3d0e5398c4cb
.xword 0xb350436fd54a3597
.xword 0xe1a6d3a1438e7427
.xword 0x04352674613c61e0
.xword 0x5cb29c18085e057c
.xword 0xe9f9331620b15c27




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
.xword 0xf0e1224c6947cfed
.xword 0xa6a41d42db37ea8d
.xword 0xc300f70b5ca20664
.xword 0xd471c6fc33d92b1c
.xword 0x0785d17dea29cb63
.xword 0x825b1ac860ade213
.xword 0x2d98837dd7e626fc
.xword 0x283980dcc6085421




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
.xword 0x52eb30c04f3a28fc
.xword 0x37deb93e8cde653b
.xword 0xfbd420b547a8345f
.xword 0x36dc6ca8a9d97a18
.xword 0xc6119b88b9ae5194
.xword 0xae78e7855e01864f
.xword 0xe04e073a3217d0c6
.xword 0x083439b4b0263ebb




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
.xword 0x40f6d0b5a1e27b32
.xword 0x712133e6e3875947
.xword 0x0835f516f0ae07e9
.xword 0x8ccd0d712fb6af14
.xword 0x1140925c144d9126
.xword 0x7b75901fb6d9ea77
.xword 0xcd1cdbb842edb2d0
.xword 0xb66280b738afd36b




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
.xword 0xfd76e80835ef5978
.xword 0x5b3ab24fade8fd5d
.xword 0x9c284e5800b08af2
.xword 0xbf83d28ed5c685ae
.xword 0x2941c42aec1716bc
.xword 0x09c26cb3552ccacd
.xword 0xfcbebef4aba22f6a
.xword 0xdb4ac0370b00f1f1






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
.xword 0x5271fa8ccd81f1d2
.xword 0xa89147430883c58a
.xword 0xc5e14d676239cd28
.xword 0x2edfc02f4b728c10
.xword 0x35a7f872023fc546
.xword 0x7b7fe791c2ffbb11
.xword 0x38e3adab7a7e322e
.xword 0x3be8d60932701be4




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
.xword 0x77cf9e0c8acabb9c
.xword 0x6ce3977ba5738ac3
.xword 0xb7e2688a19041991
.xword 0x2c3d8c41687f5ec9
.xword 0x1a051b864b2f8e56
.xword 0xa542b0c53cab5ae4
.xword 0xdb04ab70c9c8df36
.xword 0xe737b7b8ba7508b5




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
.xword 0x4a80962d576943fa
.xword 0x2d5a5b62e4926baf
.xword 0x19f9db6ee7ade0cb
.xword 0x1c4e3ebe6bd16217
.xword 0x09a00a79b86c0c3b
.xword 0x3b2354c8aa161eb4
.xword 0x51be7682d7e2f2d4
.xword 0x81a395c0ec67f707




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
.xword 0x8d35a37f42975003
.xword 0x5cbd4c521897212e
.xword 0xc914a3a44e821ee1
.xword 0xfbb50cb94610030f
.xword 0x9193e00176ec44de
.xword 0xfbb95c056054288d
.xword 0x652d6e64c2d50d7b
.xword 0x2e97be4b367de1f7




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
.xword 0x49716e0b69a30e84
.xword 0x9486ffb267648e26
.xword 0x74e49946e7c18f7f
.xword 0x28f43a3b97bce8b5
.xword 0x46659d03724fa58d
.xword 0x1af70abffb208f13
.xword 0x485481d8355f4540
.xword 0x0368e362f7689763




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
.xword 0xd4ce51739b8b0d00
.xword 0x2bca8f9f74b36d31
.xword 0x762fa72863f870c3
.xword 0xfbdae3d5446e0837
.xword 0x2e4cdf2529de5e43
.xword 0x7f92bca8eda311a8
.xword 0x5e47c44b4719a677
.xword 0x178ddc599e4ea74d




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
.xword 0x26f94b70c67703d0
.xword 0x8219daf11ff6783a
.xword 0xe65cc57552a9076c
.xword 0xcbd529a4367d8772
.xword 0x6d7a367ea0cb6378
.xword 0x0b384cd7983a98d2
.xword 0x66244edc2c279751
.xword 0x30aa0988a3a1f73e




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
.xword 0xe9a298e49090e35e
.xword 0x201da6076c56bf2b
.xword 0x4029761a549bbae9
.xword 0xdb562acbf19e7126
.xword 0xc9bc6fa74c13f6b2
.xword 0xea89a63e8bb2d912
.xword 0xfc8d7d4cfa09d62b
.xword 0x26fe577959299632




#if 0
#endif
