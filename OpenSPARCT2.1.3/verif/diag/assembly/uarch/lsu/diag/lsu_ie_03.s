/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_ie_03.s
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
	setx 0x1843b988b7f03e81, %g1, %r2
	setx 0x74aee5b0233b9243, %g1, %r3
	setx 0x68c30bb5ad5472df, %g1, %r4
	setx 0xfbb3e61baf774b0b, %g1, %r5
	setx 0xe1eb697223fe469d, %g1, %r6
	setx 0x69add8dcc167ab6a, %g1, %r7
	setx 0xbe4de47aa0c53e64, %g1, %r8

     mov %r2, %r1
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP1:
	.word 0xc3eada3a  ! 3: PREFETCHA_R	prefetcha	[%r11, %r26] 0xd1, #one_read
	.word 0xc48cd03a  ! 5: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4c3901a  ! 7: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
	.word 0xc41b6030  ! 8: LDD_I	ldd	[%r13 + 0x0030], %r2
	.word 0xc584913a  ! 10: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc4b4d03a  ! 12: STHA_R	stha	%r2, [%r19 + %r26] 0x81
CP_AIUP2:
	.word 0xc486031a  ! 14: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r2
NC_AIUS3:
	.word 0xc49fc23a  ! 16: LDDA_R	ldda	[%r31, %r26] 0x11, %r2
	.word 0xc582d15a  ! 17: LDFA_R	lda	[%r11, %r26], %f2
	.word 0xc4c3901a  ! 19: LDSWA_R	ldswa	[%r14, %r26] 0x80, %r2
	.word 0xc4cc903a  ! 21: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CP_AIUS4:
	.word 0xc4af833a  ! 23: STBA_R	stba	%r2, [%r30 + %r26] 0x19
CP_BIS_QUAD_LD5:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 25: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc4f2911a  ! 26: STXA_R	stxa	%r2, [%r10 + %r26] 0x88
	.word 0xc5a4d13a  ! 28: STFA_R	sta	%f2, [%r26, %r19]
	.word 0xc583105a  ! 29: LDFA_R	lda	[%r12, %r26], %f2
NC_NUC6:
	.word 0xc5a5409a  ! 31: STFA_R	sta	%f2, [%r26, %r21]
	.word 0xc48a901a  ! 32: LDUBA_R	lduba	[%r10, %r26] 0x80, %r2
	.word 0xc472e030  ! 33: STX_I	stx	%r2, [%r11 + 0x0030]
	.word 0xc484501a  ! 35: LDUWA_R	lduwa	[%r17, %r26] 0x80, %r2
NC_BIS_AIUP7:
	.word 0xc4f6445a  ! 37: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
	.word 0xc5ba911a  ! 38: STDFA_R	stda	%f2, [%r26, %r10]
BLK_PRI8:
	and	%r26,	%r29,	%r26
	.word 0xe19b5e1a  ! 40: LDDFA_R	ldda	[%r13, %r26], %f16
NC_PST_PRI9:
	.word 0xc5bc595a  ! 42: STDFA_R	stda	%f2, [%r26, %r17]
CHANGE_USER10:
	ta	T_CHANGE_NONPRIV
CHANGE_R2611:
	add	%r26,	%r27,	%r26
CP_BIS_PRI11:
	and	%r26,	%r28,	%r26
	.word 0xc4f2dd5a  ! 44: STXA_R	stxa	%r2, [%r11 + %r26] 0xea
	.word 0xc584d13a  ! 46: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4d4903a  ! 48: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
CHANGE_PRIV12:
	ta	T_CHANGE_PRIV
CHANGE_R2613:
	add	%r26,	%r27,	%r26
CP_BIS_NUC13:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 50: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
NC_BIS_AIUP14:
	.word 0xc8ae455a  ! 52: STBA_R	stba	%r4, [%r25 + %r26] 0x2a
	.word 0xc4a3911a  ! 54: STWA_R	stwa	%r2, [%r14 + %r26] 0x88
	.word 0xc494d03a  ! 56: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc4b4111a  ! 58: STHA_R	stha	%r2, [%r16 + %r26] 0x88
	.word 0xc4f4d13a  ! 60: STXA_R	stxa	%r2, [%r19 + %r26] 0x89
CP_ATM_QUAD_LD15:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 62: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
NC_NUC16:
	.word 0xc485409a  ! 64: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r2
NC_AIUS17:
	.word 0xc4dfc33a  ! 66: LDXA_R	ldxa	[%r31, %r26] 0x19, %r2
	.word 0xc59c111a  ! 68: LDDFA_R	ldda	[%r16, %r26], %f2
CHANGE_R2618:
	add	%r26,	%r27,	%r26
CP_BIS_SEC18:
	and	%r26,	%r28,	%r26
	.word 0xc4b49d7a  ! 70: STHA_R	stha	%r2, [%r18 + %r26] 0xeb
CP_ATM_QUAD_LD19:
	and	%r26,	%r29,	%r26
	.word 0xc49ac49a  ! 72: LDDA_R	ldda	[%r11, %r26] 0x24, %r2
NC_BLK_SEc20:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 74: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc4f4d03a  ! 76: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc494903a  ! 78: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
	.word 0xc5a4d13a  ! 80: STFA_R	sta	%f2, [%r26, %r19]
CP_BIS_NUC21:
	and	%r26,	%r28,	%r26
	.word 0xccad04fa  ! 82: STBA_R	stba	%r6, [%r20 + %r26] 0x27
CP_BIS_AIUP22:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 84: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
CP_BIS_NUC23:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 86: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
NC_AIUS24:
	.word 0xc487c23a  ! 88: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r2
NC_BLK_SEc25:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 90: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc59c903a  ! 92: LDDFA_R	ldda	[%r18, %r26], %f2
BLK_PRI26:
	and	%r26,	%r29,	%r26
	.word 0xc1bade1a  ! 94: STDFA_R	stda	%f0, [%r26, %r11]
	.word 0xc51b6030  ! 95: LDDF_I	ldd	[%r13, 0x0030], %f2
	.word 0xc4dc903a  ! 97: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
CP_BIS_QUAD_LD27:
	and	%r26,	%r29,	%r26
	.word 0xc49b5d5a  ! 99: LDDA_R	ldda	[%r13, %r26] 0xea, %r2
CP_BIS_NUC28:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 101: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc53aa030  ! 102: STDF_I	std	%f2, [0x0030, %r10]
SHORT_FP_PRI29:
	.word 0xc5ba9a1a  ! 104: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc41b001a  ! 105: LDD_R	ldd	[%r12 + %r26], %r2
	.word 0xc484903a  ! 107: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
CHANGE_USER30:
	ta	T_CHANGE_NONPRIV
CHANGE_R2631:
	add	%r26,	%r27,	%r26
NC_BIS_PRI31:
	.word 0xd0bb9d5a  ! 109: STDA_R	stda	%r8, [%r14 + %r26] 0xea
CHANGE_PRIV32:
	ta	T_CHANGE_PRIV
CHANGE_R2633:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD33:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 111: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
BLK_PRI34:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9e1a  ! 113: STDFA_R	stda	%f16, [%r26, %r10]
CHANGE_USER35:
	ta	T_CHANGE_NONPRIV
CHANGE_R2636:
	add	%r26,	%r27,	%r26
CP_BIS_PRI36:
	and	%r26,	%r28,	%r26
	.word 0xd0a2dc5a  ! 115: STWA_R	stwa	%r8, [%r11 + %r26] 0xe2
CHANGE_PRIV37:
	ta	T_CHANGE_PRIV
CHANGE_R2638:
	mov	%g0,	%r26
CP_ATM_QUAD_LD38:
	and	%r26,	%r29,	%r26
	.word 0xc89a859a  ! 117: LDDA_R	ldda	[%r10, %r26] 0x2c, %r4
NC_AIUS39:
	.word 0xc5a7c33a  ! 119: STFA_R	sta	%f2, [%r26, %r31]
CHANGE_USER40:
	ta	T_CHANGE_NONPRIV
CHANGE_R2641:
	add	%r26,	%r27,	%r26
CP_BIS_PRI41:
	and	%r26,	%r28,	%r26
	.word 0xc4badc5a  ! 121: STDA_R	stda	%r2, [%r11 + %r26] 0xe2
NC_BIS_SEC42:
	.word 0xc4b4dc7a  ! 123: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xc522801a  ! 124: STF_R	st	%f2, [%r26, %r10]
CHANGE_PRIV43:
	ta	T_CHANGE_PRIV
CHANGE_R2644:
	add	%r26,	%r27,	%r26
CP_BIS_NUC44:
	and	%r26,	%r28,	%r26
	.word 0xd0f504fa  ! 126: STXA_R	stxa	%r8, [%r20 + %r26] 0x27
	.word 0xc4d3901a  ! 128: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r2
	.word 0xc4cb901a  ! 130: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
CP_AIUS45:
	.word 0xc5bf823a  ! 132: STDFA_R	stda	%f2, [%r26, %r30]
CP_BIS_AIUP46:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 134: STBA_R	stba	%r2, [%r24 + %r26] 0x22
	.word 0xc503001a  ! 135: LDF_R	ld	[%r12, %r26], %f2
	.word 0xc412a032  ! 136: LDUH_I	lduh	[%r10 + 0x0032], %r2
	.word 0xc4c4903a  ! 138: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
NC_BLK_SEc47:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 140: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_SEC48:
	.word 0xc4acdc7a  ! 142: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
	.word 0xc48cd03a  ! 144: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4c4903a  ! 146: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
CP_BIS_NUC49:
	and	%r26,	%r28,	%r26
	.word 0xc4bd05fa  ! 148: STDA_R	stda	%r2, [%r20 + %r26] 0x2f
NC_BIS_AIUP50:
	.word 0xccae455a  ! 150: STBA_R	stba	%r6, [%r25 + %r26] 0x2a
NC_PST_PRI51:
	.word 0xc5bc185a  ! 152: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc483901a  ! 154: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r2
	.word 0xc584903a  ! 156: LDFA_R	lda	[%r18, %r26], %f2
CHANGE_USER52:
	ta	T_CHANGE_NONPRIV
CHANGE_R2653:
	add	%r26,	%r27,	%r26
NC_BIS_PRI53:
	.word 0xc4bc5c5a  ! 158: STDA_R	stda	%r2, [%r17 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS55:
	.word 0xc5a7c33a  ! 160: STFA_R	sta	%f2, [%r26, %r31]
	.word 0xc4b4d03a  ! 162: STHA_R	stha	%r2, [%r19 + %r26] 0x81
NC_AIUS56:
	.word 0xc5bfc23a  ! 164: STDFA_R	stda	%f2, [%r26, %r31]
CP_ATM_QUAD_LD57:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 166: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
CP_AIUS58:
	.word 0xc4c7823a  ! 168: LDSWA_R	ldswa	[%r30, %r26] 0x11, %r2
	.word 0xc4b2901a  ! 169: STHA_R	stha	%r2, [%r10 + %r26] 0x80
	.word 0xc483911a  ! 171: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r2
CP_BIS_NUC59:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 173: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
NC_AIUS60:
	.word 0xc4cfc33a  ! 175: LDSBA_R	ldsba	[%r31, %r26] 0x19, %r2
NC_PST_PRI61:
	.word 0xc5bc199a  ! 177: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc5a4d13a  ! 179: STFA_R	sta	%f2, [%r26, %r19]
	.word 0xc484111a  ! 181: LDUWA_R	lduwa	[%r16, %r26] 0x88, %r2
	.word 0xc583101a  ! 182: LDFA_R	lda	[%r12, %r26], %f2
	.word 0xc4a2901a  ! 183: STWA_R	stwa	%r2, [%r10 + %r26] 0x80
NC_BIS_SEC62:
	.word 0xc4acdc7a  ! 185: STBA_R	stba	%r2, [%r19 + %r26] 0xe3
NC_BIS_AIUP63:
	.word 0xc4a6445a  ! 187: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
NC_BLK_SEc64:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 189: LDDFA_R	ldda	[%r19, %r26], %f16
NC_SHORT_FP_SEC65:
	.word 0xc5bcda3a  ! 191: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4fb101a  ! 192: SWAPA_R	swapa	%r2, [%r12 + %r26] 0x80
	.word 0xc59b105a  ! 193: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc4cc111a  ! 195: LDSBA_R	ldsba	[%r16, %r26] 0x88, %r2
CP_AIUP66:
	.word 0xc4ae031a  ! 197: STBA_R	stba	%r2, [%r24 + %r26] 0x18
SET_TL1_67:
	ta	T_CHANGE_TO_TL1
CHANGE_R2668:
	add	%r26,	%r27,	%r26
NC_BIS_NUC68:
	.word 0xccb544fa  ! 199: STHA_R	stha	%r6, [%r21 + %r26] 0x27
CP_BIS_QUAD_LD69:
	and	%r26,	%r29,	%r26
	.word 0xd09a9d5a  ! 201: LDDA_R	ldda	[%r10, %r26] 0xea, %r8
	.word 0xc5a2d11a  ! 202: STFA_R	sta	%f2, [%r26, %r11]
NC_NUC70:
	.word 0xc4cd419a  ! 204: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r2
	.word 0xc492915a  ! 205: LDUHA_R	lduha	[%r10, %r26] 0x8a, %r2
	.word 0xc5a4903a  ! 207: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc502a030  ! 208: LDF_I	ld	[%r10, 0x0030], %f2
NC_AIUS71:
	.word 0xc4a7c23a  ! 210: STWA_R	stwa	%r2, [%r31 + %r26] 0x11
	.word 0xc4f4903a  ! 212: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc4a4511a  ! 214: STWA_R	stwa	%r2, [%r17 + %r26] 0x88
	.word 0xc4c4913a  ! 216: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc4c3505a  ! 217: LDSWA_R	ldswa	[%r13, %r26] 0x82, %r2
CP_ATM_QUAD_LD72:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 219: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
NC_AIUS73:
	.word 0xc5bfc33a  ! 221: STDFA_R	stda	%f2, [%r26, %r31]
	.word 0xc4436030  ! 222: LDSW_I	ldsw	[%r13 + 0x0030], %r2
	.word 0xc4dcd03a  ! 224: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc47b2030  ! 225: SWAP_I	swap	%r2, [%r12 + 0x0030]
SET_TL0_74:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI75:
	.word 0xccbb9d5a  ! 227: STDA_R	stda	%r6, [%r14 + %r26] 0xea
SET_TL1_76:
	ta	T_CHANGE_TO_TL1
CHANGE_R2677:
	add	%r26,	%r27,	%r26
NC_BIS_NUC77:
	.word 0xccb544fa  ! 229: STHA_R	stha	%r6, [%r21 + %r26] 0x27
NC_AIUP78:
	.word 0xc486431a  ! 231: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r2
CP_PST_PRI79:
	.word 0xc5ba991a  ! 233: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc48b901a  ! 235: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
	.word 0xc5f3601a  ! 236: CASXA_R	casxa	[%r13]%asi, %r26, %r2
	.word 0xc43b2030  ! 237: STD_I	std	%r2, [%r12 + 0x0030]
	.word 0xc4d3911a  ! 239: LDSHA_R	ldsha	[%r14, %r26] 0x88, %r2
CP_AIUS80:
	.word 0xc5bf833a  ! 241: STDFA_R	stda	%f2, [%r26, %r30]
CP_PST_PRI81:
	.word 0xc5bad99a  ! 243: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc4b4913a  ! 245: STHA_R	stha	%r2, [%r18 + %r26] 0x89
NC_AIUS82:
	.word 0xc4afc23a  ! 247: STBA_R	stba	%r2, [%r31 + %r26] 0x11
NC_NUC83:
	.word 0xc4a5419a  ! 249: STWA_R	stwa	%r2, [%r21 + %r26] 0x0c
CP_BIS_AIUP84:
	and	%r26,	%r28,	%r26
	.word 0xc8f6045a  ! 251: STXA_R	stxa	%r4, [%r24 + %r26] 0x22
CP_BIS_QUAD_LD85:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 253: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
NC_NUC86:
	.word 0xc4a5409a  ! 255: STWA_R	stwa	%r2, [%r21 + %r26] 0x04
NC_NUC87:
	.word 0xc48d409a  ! 257: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
BLK_PRI88:
	and	%r26,	%r29,	%r26
	.word 0xc19ade1a  ! 259: LDDFA_R	ldda	[%r11, %r26], %f0
NC_AIUS89:
	.word 0xc48fc23a  ! 261: LDUBA_R	lduba	[%r31, %r26] 0x11, %r2
	.word 0xc4a4913a  ! 263: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
	.word 0xc503401a  ! 264: LDF_R	ld	[%r13, %r26], %f2
	.word 0xc59a911a  ! 265: LDDFA_R	ldda	[%r10, %r26], %f2
NC_BIS_NUC90:
	.word 0xc4b544fa  ! 267: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc5a4913a  ! 269: STFA_R	sta	%f2, [%r26, %r18]
SET_TL0_91:
	ta	T_CHANGE_TO_TL0
CHANGE_R2692:
	add	%r26,	%r27,	%r26
NC_BIS_SEC92:
	.word 0xc4b4dc7a  ! 271: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV93:
	ta	T_CHANGE_PRIV
CHANGE_R2694:
	mov	%g0,	%r26
CP_ATM_QUAD_LD94:
	and	%r26,	%r29,	%r26
	.word 0xc89ac49a  ! 273: LDDA_R	ldda	[%r11, %r26] 0x24, %r4
WR_LEASI_95:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_96:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
NC_NUC97:
	.word 0xc4bd419a  ! 276: STDA_R	stda	%r2, [%r21 + %r26] 0x0c
	.word 0xc494d03a  ! 278: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc4b3d01a  ! 280: STHA_R	stha	%r2, [%r15 + %r26] 0x80
CP_BIS_AIUP98:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 282: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
CP_AIUS99:
	.word 0xc4af823a  ! 284: STBA_R	stba	%r2, [%r30 + %r26] 0x11
	.word 0xc522e030  ! 285: STF_I	st	%f2, [0x0030, %r11]
SET_TL1_100:
	ta	T_CHANGE_TO_TL1
CHANGE_R26101:
	add	%r26,	%r27,	%r26
NC_BIS_NUC101:
	.word 0xcca545fa  ! 287: STWA_R	stwa	%r6, [%r21 + %r26] 0x2f
	.word 0xc4a4d03a  ! 289: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc494501a  ! 291: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
SET_TL0_102:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI103:
	.word 0xccf45d5a  ! 293: STXA_R	stxa	%r6, [%r17 + %r26] 0xea
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC105:
	.word 0xc48d409a  ! 295: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
NC_BIS_AIUP106:
	.word 0xd0b6445a  ! 297: STHA_R	stha	%r8, [%r25 + %r26] 0x22
	.word 0xc5a4d13a  ! 299: STFA_R	sta	%f2, [%r26, %r19]
NC_NUC107:
	.word 0xc485409a  ! 301: LDUWA_R	lduwa	[%r21, %r26] 0x04, %r2
CHANGE_R26108:
	add	%r26,	%r27,	%r26
CP_BIS_SEC108:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 303: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
	.word 0xc4ac903a  ! 305: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc5232030  ! 306: STF_I	st	%f2, [0x0030, %r12]
	.word 0xc4b2901a  ! 307: STHA_R	stha	%r2, [%r10 + %r26] 0x80
	.word 0xc484903a  ! 309: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc5ba911a  ! 310: STDFA_R	stda	%f2, [%r26, %r10]
CP_AIUP109:
	.word 0xc5be031a  ! 312: STDFA_R	stda	%f2, [%r26, %r24]
NC_NUC110:
	.word 0xc5bd419a  ! 314: STDFA_R	stda	%f2, [%r26, %r21]
	.word 0xc48cd03a  ! 316: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4d3115a  ! 317: LDSHA_R	ldsha	[%r12, %r26] 0x8a, %r2
	.word 0xc502c01a  ! 318: LDF_R	ld	[%r11, %r26], %f2
	.word 0xc47aa030  ! 319: SWAP_I	swap	%r2, [%r10 + 0x0030]
NC_AIUP111:
	.word 0xc48e431a  ! 321: LDUBA_R	lduba	[%r25, %r26] 0x18, %r2
	.word 0xc43b2030  ! 322: STD_I	std	%r2, [%r12 + 0x0030]
	.word 0xc494903a  ! 324: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
CP_NUC112:
	.word 0xc4fd009a  ! 326: SWAPA_R	swapa	%r2, [%r20 + %r26] 0x04
	.word 0xc59b501a  ! 327: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc582901a  ! 328: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc4cc903a  ! 330: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
NC_NUC113:
	.word 0xc49d419a  ! 332: LDDA_R	ldda	[%r21, %r26] 0x0c, %r2
NC_BLK_SEc114:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 334: LDDFA_R	ldda	[%r19, %r26], %f0
NC_PST_PRI115:
	.word 0xc5bb991a  ! 336: STDFA_R	stda	%f2, [%r26, %r14]
BLK_PRI116:
	and	%r26,	%r29,	%r26
	.word 0xc19adf1a  ! 338: LDDFA_R	ldda	[%r11, %r26], %f0
BLK_PRI117:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 340: STDFA_R	stda	%f16, [%r26, %r11]
CP_BIS_AIUS118:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 342: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
	.word 0xc5a4101a  ! 344: STFA_R	sta	%f2, [%r26, %r16]
SET_TL1_119:
	ta	T_CHANGE_TO_TL1
CHANGE_R26120:
	add	%r26,	%r27,	%r26
NC_BIS_NUC120:
	.word 0xc8ad44fa  ! 346: STBA_R	stba	%r4, [%r21 + %r26] 0x27
CHANGE_R26121:
	add	%r26,	%r27,	%r26
CP_BIS_SEC121:
	and	%r26,	%r28,	%r26
	.word 0xccac9c7a  ! 348: STBA_R	stba	%r6, [%r18 + %r26] 0xe3
	.word 0xc4acd13a  ! 350: STBA_R	stba	%r2, [%r19 + %r26] 0x89
NC_BLK_SEc122:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 352: STDFA_R	stda	%f0, [%r26, %r19]
SHORT_FP_PRI123:
	.word 0xc5ba9a1a  ! 354: STDFA_R	stda	%f2, [%r26, %r10]
NC_BIS_NUC124:
	.word 0xc8ad45fa  ! 356: STBA_R	stba	%r4, [%r21 + %r26] 0x2f
	.word 0xc583101a  ! 357: LDFA_R	lda	[%r12, %r26], %f2
CP_AIUS125:
	.word 0xc5bf823a  ! 359: STDFA_R	stda	%f2, [%r26, %r30]
SET_TL0_126:
	ta	T_CHANGE_TO_TL0
CHANGE_R26127:
	add	%r26,	%r27,	%r26
NC_BIS_SEC127:
	.word 0xc4a4dc7a  ! 361: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC129:
	.word 0xc5bd009a  ! 363: STDFA_R	stda	%f2, [%r26, %r20]
NC_BIS_AIUS130:
	.word 0xc4bfc47a  ! 365: STDA_R	stda	%r2, [%r31 + %r26] 0x23
NC_AIUP131:
	.word 0xc4ce421a  ! 367: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r2
	.word 0xc4ccd03a  ! 369: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc4ac913a  ! 371: STBA_R	stba	%r2, [%r18 + %r26] 0x89
SET_TL1_132:
	ta	T_CHANGE_TO_TL1
CHANGE_R26133:
	mov	%g0,	%r26
NC_BIS_NUC133:
	.word 0xc8ad44fa  ! 373: STBA_R	stba	%r4, [%r21 + %r26] 0x27
	.word 0xc4db901a  ! 375: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc5a3d11a  ! 377: STFA_R	sta	%f2, [%r26, %r15]
	.word 0xc48c903a  ! 379: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CP_NUC134:
	.word 0xc5e5201a  ! 381: CASA_R	casa	[%r20] %asi, %r26, %r2
	.word 0xc4fad11a  ! 382: SWAPA_R	swapa	%r2, [%r11 + %r26] 0x88
NC_AIUP135:
	.word 0xc486431a  ! 384: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r2
NC_AIUP136:
	.word 0xc4ce421a  ! 386: LDSBA_R	ldsba	[%r25, %r26] 0x10, %r2
	.word 0xc5a2d01a  ! 387: STFA_R	sta	%f2, [%r26, %r11]
	.word 0xc53b401a  ! 388: STDF_R	std	%f2, [%r26, %r13]
	.word 0xc48c913a  ! 390: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xc48c903a  ! 392: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4b3911a  ! 394: STHA_R	stha	%r2, [%r14 + %r26] 0x88
NC_PST_PRI137:
	.word 0xc5bc181a  ! 396: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc4c4913a  ! 398: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc4d4903a  ! 400: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc494501a  ! 402: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
CP_BIS_NUC138:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 404: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
NC_AIUS139:
	.word 0xc497c23a  ! 406: LDUHA_R	lduha	[%r31, %r26] 0x11, %r2
	.word 0xc42b401a  ! 407: STB_R	stb	%r2, [%r13 + %r26]
CP_BIS_AIUS140:
	and	%r26,	%r28,	%r26
	.word 0xc8f7857a  ! 409: STXA_R	stxa	%r4, [%r30 + %r26] 0x2b
SET_TL0_141:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI142:
	and	%r26,	%r28,	%r26
	.word 0xc4f29c5a  ! 411: STXA_R	stxa	%r2, [%r10 + %r26] 0xe2
CHANGE_PRIV143:
	ta	T_CHANGE_PRIV
CHANGE_R26144:
	add	%r26,	%r27,	%r26
CP_BIS_NUC144:
	and	%r26,	%r28,	%r26
	.word 0xcca504fa  ! 413: STWA_R	stwa	%r6, [%r20 + %r26] 0x27
NC_BLK_SEc145:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 415: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc59bd01a  ! 417: LDDFA_R	ldda	[%r15, %r26], %f2
BLK_PRI146:
	and	%r26,	%r29,	%r26
	.word 0xe19ade1a  ! 419: LDDFA_R	ldda	[%r11, %r26], %f16
	.word 0xc4cb901a  ! 421: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
	.word 0xc42b001a  ! 422: STB_R	stb	%r2, [%r12 + %r26]
	.word 0xc502a030  ! 423: LDF_I	ld	[%r10, 0x0030], %f2
	.word 0xc4f4d03a  ! 425: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
CHANGE_USER147:
	ta	T_CHANGE_NONPRIV
CHANGE_R26148:
	add	%r26,	%r27,	%r26
NC_BIS_PRI148:
	.word 0xccf39c5a  ! 427: STXA_R	stxa	%r6, [%r14 + %r26] 0xe2
	.word 0xc4d4501a  ! 429: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r2
CHANGE_PRIV149:
	ta	T_CHANGE_PRIV
CHANGE_R26150:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP150:
	and	%r26,	%r28,	%r26
	.word 0xc4ae045a  ! 431: STBA_R	stba	%r2, [%r24 + %r26] 0x22
CHANGE_TLE151:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BLK_SEc152:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 434: STDFA_R	stda	%f0, [%r26, %r19]
CP_BIS_PRI153:
	and	%r26,	%r28,	%r26
	.word 0xc8a29c5a  ! 436: STWA_R	stwa	%r4, [%r10 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUP155:
	.word 0xc4a6421a  ! 438: STWA_R	stwa	%r2, [%r25 + %r26] 0x10
	.word 0xc5a3111a  ! 439: STFA_R	sta	%f2, [%r26, %r12]
	.word 0xc48bd01a  ! 441: LDUBA_R	lduba	[%r15, %r26] 0x80, %r2
CP_BIS_QUAD_LD156:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 443: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
NC_BLK_SEc157:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 445: LDDFA_R	ldda	[%r19, %r26], %f0
CP_AIUP158:
	.word 0xc59e031a  ! 447: LDDFA_R	ldda	[%r24, %r26], %f2
NC_BLK_SEc159:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 449: STDFA_R	stda	%f0, [%r26, %r19]
CHANGE_USER160:
	ta	T_CHANGE_NONPRIV
CHANGE_R26161:
	add	%r26,	%r27,	%r26
NC_BIS_PRI161:
	.word 0xc8a39c5a  ! 451: STWA_R	stwa	%r4, [%r14 + %r26] 0xe2
	.word 0xc5bcd03a  ! 453: STDFA_R	stda	%f2, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC163:
	.word 0xc59d419a  ! 455: LDDFA_R	ldda	[%r21, %r26], %f2
	.word 0xc4c4d13a  ! 457: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc49b111a  ! 458: LDDA_R	ldda	[%r12, %r26] 0x88, %r2
NC_BIS_SEC164:
	.word 0xc4b4dc7a  ! 460: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
CP_AIUP165:
	.word 0xc486031a  ! 462: LDUWA_R	lduwa	[%r24, %r26] 0x18, %r2
NC_SHORT_FP_SEC166:
	.word 0xc59cdb3a  ! 464: LDDFA_R	ldda	[%r19, %r26], %f2
CP_BIS_QUAD_LD167:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 466: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
CHANGE_R26168:
	add	%r26,	%r27,	%r26
CP_BIS_SEC168:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9d7a  ! 468: STDA_R	stda	%r2, [%r18 + %r26] 0xeb
	.word 0xc4f2d01a  ! 469: STXA_R	stxa	%r2, [%r11 + %r26] 0x80
NC_BIS_AIUS169:
	.word 0xd0afc57a  ! 471: STBA_R	stba	%r8, [%r31 + %r26] 0x2b
NC_SHORT_FP_SEC170:
	.word 0xc5bcdb7a  ! 473: STDFA_R	stda	%f2, [%r26, %r19]
CP_BIS_QUAD_LD171:
	and	%r26,	%r29,	%r26
	.word 0xc89add5a  ! 475: LDDA_R	ldda	[%r11, %r26] 0xea, %r4
	.word 0xc5bc903a  ! 477: STDFA_R	stda	%f2, [%r26, %r18]
SHORT_FP_PRI172:
	.word 0xc5ba9b1a  ! 479: STDFA_R	stda	%f2, [%r26, %r10]
CP_ATM_QUAD_LD173:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 481: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
CP_AIUP174:
	.word 0xc4ce031a  ! 483: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r2
	.word 0xc4ca905a  ! 484: LDSBA_R	ldsba	[%r10, %r26] 0x82, %r2
	.word 0xc5a2d11a  ! 485: STFA_R	sta	%f2, [%r26, %r11]
SET_TL1_175:
	ta	T_CHANGE_TO_TL1
CHANGE_R26176:
	mov	%g0,	%r26
NC_BIS_NUC176:
	.word 0xc8a544fa  ! 487: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
CP_AIUS177:
	.word 0xc497833a  ! 489: LDUHA_R	lduha	[%r30, %r26] 0x19, %r2
	.word 0xc51ac01a  ! 490: LDDF_R	ldd	[%r11, %r26], %f2
NC_BIS_AIUP178:
	.word 0xc4f6445a  ! 493: STXA_R	stxa	%r2, [%r25 + %r26] 0x22
CP_ATM_QUAD_LD179:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 495: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
NC_AIUP180:
	.word 0xc5be431a  ! 497: STDFA_R	stda	%f2, [%r26, %r25]
NC_NUC181:
	.word 0xc59d419a  ! 499: LDDFA_R	ldda	[%r21, %r26], %f2
CP_BIS_AIUP182:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 501: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
CP_ATM_QUAD_LD183:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac49a  ! 503: LDDA_R	ldda	[%r11, %r26] 0x24, %r6
	.word 0xc4cb911a  ! 505: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r2
NC_AIUS184:
	.word 0xc4b7c23a  ! 507: STHA_R	stha	%r2, [%r31 + %r26] 0x11
	.word 0xc494501a  ! 509: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
	.word 0xc4b3d01a  ! 511: STHA_R	stha	%r2, [%r15 + %r26] 0x80
NC_BLK_SEc185:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 514: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUS186:
	.word 0xc4b7c47a  ! 516: STHA_R	stha	%r2, [%r31 + %r26] 0x23
	.word 0xc4d4903a  ! 518: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
SET_TL0_187:
	ta	T_CHANGE_TO_TL0
CHANGE_R26188:
	add	%r26,	%r27,	%r26
NC_BIS_SEC188:
	.word 0xc4b4dc7a  ! 520: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC190:
	.word 0xc4cd409a  ! 522: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r2
	.word 0xc4d3101a  ! 523: LDSHA_R	ldsha	[%r12, %r26] 0x80, %r2
	.word 0xc49c501a  ! 525: LDDA_R	ldda	[%r17, %r26] 0x80, %r2
	.word 0xc5a3901a  ! 527: STFA_R	sta	%f2, [%r26, %r14]
NC_BIS_SEC191:
	.word 0xc4b4dc7a  ! 529: STHA_R	stha	%r2, [%r19 + %r26] 0xe3
	.word 0xc4d4511a  ! 531: LDSHA_R	ldsha	[%r17, %r26] 0x88, %r2
	.word 0xc51a801a  ! 532: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc4ac913a  ! 534: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CP_BIS_NUC192:
	and	%r26,	%r28,	%r26
	.word 0xc8ad04fa  ! 536: STBA_R	stba	%r4, [%r20 + %r26] 0x27
	.word 0xc48b101a  ! 537: LDUBA_R	lduba	[%r12, %r26] 0x80, %r2
SHORT_FP_PRI193:
	.word 0xc5bada1a  ! 539: STDFA_R	stda	%f2, [%r26, %r11]
CP_BIS_AIUP194:
	and	%r26,	%r28,	%r26
	.word 0xccf6055a  ! 541: STXA_R	stxa	%r6, [%r24 + %r26] 0x2a
	.word 0xc452801a  ! 542: LDSH_R	ldsh	[%r10 + %r26], %r2
	.word 0xc4cc501a  ! 544: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r2
NC_BLK_SEc195:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 546: STDFA_R	stda	%f16, [%r26, %r19]
NC_SHORT_FP_SEC196:
	.word 0xc59cda3a  ! 548: LDDFA_R	ldda	[%r19, %r26], %f2
BLK_PRI197:
	and	%r26,	%r29,	%r26
	.word 0xc1badf1a  ! 550: STDFA_R	stda	%f0, [%r26, %r11]
CP_PST_PRI198:
	.word 0xc5ba981a  ! 552: STDFA_R	stda	%f2, [%r26, %r10]
WR_LEASI_199:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_200:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc442a030  ! 554: LDSW_I	ldsw	[%r10 + 0x0030], %r2
	.word 0xc4ac913a  ! 556: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CHANGE_USER201:
	ta	T_CHANGE_NONPRIV
CHANGE_R26202:
	add	%r26,	%r27,	%r26
NC_BIS_PRI202:
	.word 0xc8b39c5a  ! 558: STHA_R	stha	%r4, [%r14 + %r26] 0xe2
CP_BIS_QUAD_LD203:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 560: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc4a3111a  ! 561: STWA_R	stwa	%r2, [%r12 + %r26] 0x88
	.word 0xc484d03a  ! 563: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc47ac01a  ! 564: SWAP_R	swap	%r2, [%r11 + %r26]
SET_TL1_204:
	ta	T_CHANGE_TO_TL1
CHANGE_R26205:
	add	%r26,	%r27,	%r26
NC_BIS_NUC205:
	.word 0xcca544fa  ! 566: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xc4bc903a  ! 568: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc4aad11a  ! 569: STBA_R	stba	%r2, [%r11 + %r26] 0x88
	.word 0xc4fa901a  ! 570: SWAPA_R	swapa	%r2, [%r10 + %r26] 0x80
	.word 0xc48cd13a  ! 572: LDUBA_R	lduba	[%r19, %r26] 0x89, %r2
BLK_PRI206:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 574: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xc48bd01a  ! 576: LDUBA_R	lduba	[%r15, %r26] 0x80, %r2
	.word 0xc484d03a  ! 578: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc4f3d01a  ! 580: STXA_R	stxa	%r2, [%r15 + %r26] 0x80
	.word 0xc584903a  ! 582: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc5a2901a  ! 583: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc49bd01a  ! 585: LDDA_R	ldda	[%r15, %r26] 0x80, %r2
SHORT_FP_PRI207:
	.word 0xc5ba9a5a  ! 587: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4ac903a  ! 589: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc412e032  ! 590: LDUH_I	lduh	[%r11 + 0x0032], %r2
SET_TL0_208:
	ta	T_CHANGE_TO_TL0
CHANGE_R26209:
	add	%r26,	%r27,	%r26
NC_BIS_SEC209:
	.word 0xc4b4dd7a  ! 592: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS211:
	.word 0xc587823a  ! 594: LDFA_R	lda	[%r30, %r26], %f2
NC_BIS_SEC212:
	.word 0xc8f4dc7a  ! 596: STXA_R	stxa	%r4, [%r19 + %r26] 0xe3
	.word 0xc4cb901a  ! 598: LDSBA_R	ldsba	[%r14, %r26] 0x80, %r2
	.word 0xc473001a  ! 599: STX_R	stx	%r2, [%r12 + %r26]
NC_SHORT_FP_SEC213:
	.word 0xc59cda7a  ! 601: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc584501a  ! 603: LDFA_R	lda	[%r17, %r26], %f2
SHORT_FP_PRI214:
	.word 0xc5ba9a1a  ! 605: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4ac913a  ! 607: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CHANGE_USER215:
	ta	T_CHANGE_NONPRIV
CHANGE_R26216:
	add	%r26,	%r27,	%r26
NC_BIS_PRI216:
	.word 0xc4b39d5a  ! 609: STHA_R	stha	%r2, [%r14 + %r26] 0xea
	.word 0xc5bc913a  ! 611: STDFA_R	stda	%f2, [%r26, %r18]
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS218:
	.word 0xc4c7833a  ! 613: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r2
	.word 0xc5a3d11a  ! 615: STFA_R	sta	%f2, [%r26, %r15]
	.word 0xc5f2a01a  ! 616: CASXA_R	casxa	[%r10]%asi, %r26, %r2
NC_AIUS219:
	.word 0xc497c23a  ! 618: LDUHA_R	lduha	[%r31, %r26] 0x11, %r2
	.word 0xc4c3d01a  ! 620: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r2
CP_AIUS220:
	.word 0xc4cf833a  ! 622: LDSBA_R	ldsba	[%r30, %r26] 0x19, %r2
	.word 0xc4f2901a  ! 623: STXA_R	stxa	%r2, [%r10 + %r26] 0x80
	.word 0xc4d4903a  ! 625: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_BIS_AIUS221:
	.word 0xc4b7c47a  ! 627: STHA_R	stha	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUP222:
	.word 0xc4be455a  ! 629: STDA_R	stda	%r2, [%r25 + %r26] 0x2a
NC_PST_PRI223:
	.word 0xc5bbd91a  ! 631: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc4ac903a  ! 633: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc4f4d13a  ! 635: STXA_R	stxa	%r2, [%r19 + %r26] 0x89
NC_BLK_SEc224:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 637: LDDFA_R	ldda	[%r19, %r26], %f16
NC_BLK_SEc225:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 639: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc59bd01a  ! 641: LDDFA_R	ldda	[%r15, %r26], %f2
	.word 0xc493901a  ! 643: LDUHA_R	lduha	[%r14, %r26] 0x80, %r2
	.word 0xc584d03a  ! 645: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc59cd03a  ! 647: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4d4903a  ! 649: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc48c913a  ! 651: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xc46b6033  ! 652: LDSTUB_I	ldstub	%r2, [%r13 + 0x0033]
	.word 0xc442801a  ! 653: LDSW_R	ldsw	[%r10 + %r26], %r2
NC_BIS_AIUP226:
	.word 0xcca6445a  ! 655: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
CP_BIS_AIUS227:
	and	%r26,	%r28,	%r26
	.word 0xc4a7857a  ! 657: STWA_R	stwa	%r2, [%r30 + %r26] 0x2b
	.word 0xc46ae033  ! 658: LDSTUB_I	ldstub	%r2, [%r11 + 0x0033]
NC_NUC228:
	.word 0xc4f5409a  ! 660: STXA_R	stxa	%r2, [%r21 + %r26] 0x04
CP_PST_PRI229:
	.word 0xc5bb199a  ! 662: STDFA_R	stda	%f2, [%r26, %r12]
CHANGE_USER230:
	ta	T_CHANGE_NONPRIV
CHANGE_R26231:
	add	%r26,	%r27,	%r26
CP_BIS_PRI231:
	and	%r26,	%r28,	%r26
	.word 0xc4a31d5a  ! 664: STWA_R	stwa	%r2, [%r12 + %r26] 0xea
	.word 0xc494d13a  ! 666: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
NC_BLK_SEc232:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 668: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc584d03a  ! 670: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc5a2901a  ! 671: STFA_R	sta	%f2, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS234:
	.word 0xc4f7c23a  ! 673: STXA_R	stxa	%r2, [%r31 + %r26] 0x11
CP_AIUP235:
	.word 0xc586031a  ! 675: LDFA_R	lda	[%r24, %r26], %f2
NC_SHORT_FP_SEC236:
	.word 0xc59cda7a  ! 677: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc44b2033  ! 678: LDSB_I	ldsb	[%r12 + 0x0033], %r2
CP_BIS_AIUS237:
	and	%r26,	%r28,	%r26
	.word 0xd0bf847a  ! 680: STDA_R	stda	%r8, [%r30 + %r26] 0x23
	.word 0xc59a901a  ! 681: LDDFA_R	ldda	[%r10, %r26], %f2
NC_AIUP238:
	.word 0xc4d6421a  ! 683: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r2
NC_AIUP239:
	.word 0xc486431a  ! 685: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r2
	.word 0xc40b6033  ! 686: LDUB_I	ldub	[%r13 + 0x0033], %r2
	.word 0xc59c111a  ! 688: LDDFA_R	ldda	[%r16, %r26], %f2
	.word 0xc502c01a  ! 689: LDF_R	ld	[%r11, %r26], %f2
	.word 0xc40ac01a  ! 690: LDUB_R	ldub	[%r11 + %r26], %r2
	.word 0xc584d03a  ! 692: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4bc501a  ! 694: STDA_R	stda	%r2, [%r17 + %r26] 0x80
	.word 0xc4cc913a  ! 696: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
SHORT_FP_PRI240:
	.word 0xc59b5a1a  ! 698: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc5bc111a  ! 700: STDFA_R	stda	%f2, [%r26, %r16]
CP_NUC241:
	.word 0xc48d009a  ! 702: LDUBA_R	lduba	[%r20, %r26] 0x04, %r2
CHANGE_USER242:
	ta	T_CHANGE_NONPRIV
CHANGE_R26243:
	add	%r26,	%r27,	%r26
NC_BIS_PRI243:
	.word 0xccbbdc5a  ! 704: STDA_R	stda	%r6, [%r15 + %r26] 0xe2
NC_SHORT_FP_SEC244:
	.word 0xc5bcda3a  ! 706: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc5f3201a  ! 707: CASXA_R	casxa	[%r12]%asi, %r26, %r2
	.word 0xc582d01a  ! 708: LDFA_R	lda	[%r11, %r26], %f2
SHORT_FP_PRI245:
	.word 0xc5bada5a  ! 710: STDFA_R	stda	%f2, [%r26, %r11]
CHANGE_PRIV246:
	ta	T_CHANGE_PRIV
CHANGE_R26247:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP247:
	and	%r26,	%r28,	%r26
	.word 0xc8ae045a  ! 712: STBA_R	stba	%r4, [%r24 + %r26] 0x22
	.word 0xc5bc903a  ! 714: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc584d03a  ! 716: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc584101a  ! 718: LDFA_R	lda	[%r16, %r26], %f2
	.word 0xc48b911a  ! 720: LDUBA_R	lduba	[%r14, %r26] 0x88, %r2
	.word 0xc5e2a01a  ! 721: CASA_R	casa	[%r10] %asi, %r26, %r2
	.word 0xc4b4d03a  ! 723: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc4ab511a  ! 724: STBA_R	stba	%r2, [%r13 + %r26] 0x88
	.word 0xc4a4d03a  ! 726: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc4c4111a  ! 728: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r2
	.word 0xc4b4903a  ! 730: STHA_R	stha	%r2, [%r18 + %r26] 0x81
NC_NUC248:
	.word 0xc5a5409a  ! 732: STFA_R	sta	%f2, [%r26, %r21]
NC_AIUP249:
	.word 0xc48e421a  ! 734: LDUBA_R	lduba	[%r25, %r26] 0x10, %r2
CHANGE_USER250:
	ta	T_CHANGE_NONPRIV
CHANGE_R26251:
	add	%r26,	%r27,	%r26
NC_BIS_PRI251:
	.word 0xc8b39c5a  ! 736: STHA_R	stha	%r4, [%r14 + %r26] 0xe2
	.word 0xc4f4903a  ! 738: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc4db111a  ! 739: LDXA_R	ldxa	[%r12, %r26] 0x88, %r2
CP_PST_PRI252:
	.word 0xc5ba991a  ! 741: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc483911a  ! 743: LDUWA_R	lduwa	[%r14, %r26] 0x88, %r2
NC_BLK_SEc253:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 745: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_SEC254:
	.word 0xc4f4dd7a  ! 747: STXA_R	stxa	%r2, [%r19 + %r26] 0xeb
	.word 0xc4abd01a  ! 749: STBA_R	stba	%r2, [%r15 + %r26] 0x80
	.word 0xc46b2033  ! 750: LDSTUB_I	ldstub	%r2, [%r12 + 0x0033]
	.word 0xc4d4111a  ! 752: LDSHA_R	ldsha	[%r16, %r26] 0x88, %r2
	.word 0xc494d03a  ! 754: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc47b6030  ! 755: SWAP_I	swap	%r2, [%r13 + 0x0030]
	.word 0xc53a801a  ! 756: STDF_R	std	%f2, [%r26, %r10]
	.word 0xc49b911a  ! 758: LDDA_R	ldda	[%r14, %r26] 0x88, %r2
CP_PST_PRI255:
	.word 0xc5bb181a  ! 760: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5a3501a  ! 761: STFA_R	sta	%f2, [%r26, %r13]
NC_BIS_SEC256:
	.word 0xc8b4dc7a  ! 763: STHA_R	stha	%r4, [%r19 + %r26] 0xe3
	.word 0xc482915a  ! 764: LDUWA_R	lduwa	[%r10, %r26] 0x8a, %r2
CP_BIS_PRI257:
	and	%r26,	%r28,	%r26
	.word 0xc4badc5a  ! 766: STDA_R	stda	%r2, [%r11 + %r26] 0xe2
	.word 0xc4b3911a  ! 768: STHA_R	stha	%r2, [%r14 + %r26] 0x88
NC_BIS_SEC258:
	.word 0xc4f4dc7a  ! 770: STXA_R	stxa	%r2, [%r19 + %r26] 0xe3
CHANGE_PRIV259:
	ta	T_CHANGE_PRIV
CHANGE_R26260:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP260:
	.word 0xc4ae445a  ! 772: STBA_R	stba	%r2, [%r25 + %r26] 0x22
CHANGE_USER261:
	ta	T_CHANGE_NONPRIV
CHANGE_R26262:
	add	%r26,	%r27,	%r26
CP_BIS_PRI262:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 774: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
	.word 0xc51aa030  ! 775: LDDF_I	ldd	[%r10, 0x0030], %f2
	.word 0xc584913a  ! 777: LDFA_R	lda	[%r18, %r26], %f2
SET_TL1_263:
	ta	T_CHANGE_TO_TL1
CHANGE_R26264:
	mov	%g0,	%r26
NC_BIS_NUC264:
	.word 0xd0b544fa  ! 779: STHA_R	stha	%r8, [%r21 + %r26] 0x27
	.word 0xc492911a  ! 780: LDUHA_R	lduha	[%r10, %r26] 0x88, %r2
	.word 0xc5a4913a  ! 782: STFA_R	sta	%f2, [%r26, %r18]
NC_PST_PRI265:
	.word 0xc5bc181a  ! 784: STDFA_R	stda	%f2, [%r26, %r16]
SHORT_FP_PRI266:
	.word 0xc59ada1a  ! 786: LDDFA_R	ldda	[%r11, %r26], %f2
CP_AIUS267:
	.word 0xc4d7823a  ! 788: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r2
BLK_PRI268:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 790: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc51aa030  ! 791: LDDF_I	ldd	[%r10, 0x0030], %f2
CP_BIS_AIUS269:
	and	%r26,	%r28,	%r26
	.word 0xd0bf857a  ! 793: STDA_R	stda	%r8, [%r30 + %r26] 0x2b
NC_NUC270:
	.word 0xc4d5409a  ! 795: LDSHA_R	ldsha	[%r21, %r26] 0x04, %r2
	.word 0xc5a4501a  ! 797: STFA_R	sta	%f2, [%r26, %r17]
NC_SHORT_FP_SEC271:
	.word 0xc5bcdb3a  ! 799: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc494d13a  ! 801: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
CP_NUC272:
	.word 0xc5e5201a  ! 803: CASA_R	casa	[%r20] %asi, %r26, %r2
CP_ATM_QUAD_LD273:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 805: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc5a4d03a  ! 807: STFA_R	sta	%f2, [%r26, %r19]
NC_AIUS274:
	.word 0xc4c7c23a  ! 809: LDSWA_R	ldswa	[%r31, %r26] 0x11, %r2
	.word 0xc5bb111a  ! 810: STDFA_R	stda	%f2, [%r26, %r12]
SET_TL0_275:
	ta	T_CHANGE_TO_TL0
WR_LEASI_276:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_277:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SHORT_FP_PRI278:
	.word 0xc59b5a1a  ! 813: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc4d4903a  ! 815: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
CHANGE_PRIV279:
	ta	T_CHANGE_PRIV
CHANGE_R26280:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS280:
	.word 0xc8afc47a  ! 817: STBA_R	stba	%r4, [%r31 + %r26] 0x23
	.word 0xc5a4913a  ! 819: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4acd13a  ! 821: STBA_R	stba	%r2, [%r19 + %r26] 0x89
	.word 0xc4dc101a  ! 823: LDXA_R	ldxa	[%r16, %r26] 0x80, %r2
	.word 0xc5a4d03a  ! 825: STFA_R	sta	%f2, [%r26, %r19]
	.word 0xc4c4101a  ! 827: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r2
	.word 0xc4b2901a  ! 828: STHA_R	stha	%r2, [%r10 + %r26] 0x80
	.word 0xc4a3d01a  ! 830: STWA_R	stwa	%r2, [%r15 + %r26] 0x80
NC_PST_PRI281:
	.word 0xc5bc591a  ! 832: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc5a4d03a  ! 834: STFA_R	sta	%f2, [%r26, %r19]
NC_BIS_SEC282:
	.word 0xccf4dc7a  ! 836: STXA_R	stxa	%r6, [%r19 + %r26] 0xe3
BLK_PRI283:
	and	%r26,	%r29,	%r26
	.word 0xe1ba9f1a  ! 838: STDFA_R	stda	%f16, [%r26, %r10]
	.word 0xc5236030  ! 839: STF_I	st	%f2, [0x0030, %r13]
	.word 0xc412c01a  ! 840: LDUH_R	lduh	[%r11 + %r26], %r2
NC_AIUS284:
	.word 0xc587c33a  ! 842: LDFA_R	lda	[%r31, %r26], %f2
	.word 0xc4d4d03a  ! 844: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
NC_BIS_AIUP285:
	.word 0xccae445a  ! 846: STBA_R	stba	%r6, [%r25 + %r26] 0x22
CHANGE_USER286:
	ta	T_CHANGE_NONPRIV
CHANGE_R26287:
	add	%r26,	%r27,	%r26
NC_BIS_PRI287:
	.word 0xc8bc1d5a  ! 848: STDA_R	stda	%r4, [%r16 + %r26] 0xea
	.word 0xc4f4913a  ! 850: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc4f4d03a  ! 852: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
CHANGE_PRIV288:
	ta	T_CHANGE_PRIV
CHANGE_R26289:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP289:
	and	%r26,	%r28,	%r26
	.word 0xd09e045a  ! 854: LDDA_R	ldda	[%r24, %r26] 0x22, %r8
CHANGE_R26290:
	add	%r26,	%r27,	%r26
CP_BIS_SEC290:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 856: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
NC_PST_PRI291:
	.word 0xc5bbd91a  ! 858: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc494903a  ! 860: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
WR_LEASI_292:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_293:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4232030  ! 862: STW_I	stw	%r2, [%r12 + 0x0030]
	.word 0xc5a4913a  ! 864: STFA_R	sta	%f2, [%r26, %r18]
CHANGE_USER294:
	ta	T_CHANGE_NONPRIV
CHANGE_R26295:
	add	%r26,	%r27,	%r26
CP_BIS_PRI295:
	and	%r26,	%r28,	%r26
	.word 0xccbb1c5a  ! 866: STDA_R	stda	%r6, [%r12 + %r26] 0xe2
NC_SHORT_FP_SEC296:
	.word 0xc5bcdb3a  ! 868: STDFA_R	stda	%f2, [%r26, %r19]
CHANGE_PRIV297:
	ta	T_CHANGE_PRIV
CHANGE_R26298:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS298:
	.word 0xccafc47a  ! 870: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xc4a4913a  ! 872: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
CP_AIUS299:
	.word 0xc487823a  ! 874: LDUWA_R	lduwa	[%r30, %r26] 0x11, %r2
	.word 0xc5a3501a  ! 875: STFA_R	sta	%f2, [%r26, %r13]
CP_AIUS300:
	.word 0xc4df833a  ! 877: LDXA_R	ldxa	[%r30, %r26] 0x19, %r2
BLK_PRI301:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5e1a  ! 879: STDFA_R	stda	%f0, [%r26, %r13]
	.word 0xc48c913a  ! 881: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
NC_BIS_SEC302:
	.word 0xccacdc7a  ! 883: STBA_R	stba	%r6, [%r19 + %r26] 0xe3
CP_BIS_AIUP303:
	and	%r26,	%r28,	%r26
	.word 0xc8ae055a  ! 885: STBA_R	stba	%r4, [%r24 + %r26] 0x2a
BLK_PRI304:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 887: STDFA_R	stda	%f0, [%r26, %r10]
CHANGE_R26305:
	add	%r26,	%r27,	%r26
CP_BIS_SEC305:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 889: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_AIUP306:
	.word 0xc586031a  ! 891: LDFA_R	lda	[%r24, %r26], %f2
NC_AIUP307:
	.word 0xc5be421a  ! 893: STDFA_R	stda	%f2, [%r26, %r25]
	.word 0xc5bc903a  ! 895: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc40aa033  ! 896: LDUB_I	ldub	[%r10 + 0x0033], %r2
CP_BIS_QUAD_LD308:
	and	%r26,	%r29,	%r26
	.word 0xc49add5a  ! 898: LDDA_R	ldda	[%r11, %r26] 0xea, %r2
	.word 0xc4a4d13a  ! 900: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
	.word 0xc5bb101a  ! 901: STDFA_R	stda	%f2, [%r26, %r12]
BLK_PRI309:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9f1a  ! 903: STDFA_R	stda	%f0, [%r26, %r10]
CP_AIUP310:
	.word 0xc4b6021a  ! 905: STHA_R	stha	%r2, [%r24 + %r26] 0x10
	.word 0xc4cb515a  ! 906: LDSBA_R	ldsba	[%r13, %r26] 0x8a, %r2
	.word 0xc484d03a  ! 908: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
CHANGE_R26311:
	mov	%g0,	%r26
CP_BIS_SEC311:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 910: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
NC_SHORT_FP_SEC312:
	.word 0xc5bcda3a  ! 912: STDFA_R	stda	%f2, [%r26, %r19]
CHANGE_R26313:
	add	%r26,	%r27,	%r26
CP_BIS_SEC313:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 914: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
	.word 0xc4dc101a  ! 916: LDXA_R	ldxa	[%r16, %r26] 0x80, %r2
	.word 0xc584d13a  ! 918: LDFA_R	lda	[%r19, %r26], %f2
SHORT_FP_PRI314:
	.word 0xc5bb5b5a  ! 920: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc4f4d13a  ! 922: STXA_R	stxa	%r2, [%r19 + %r26] 0x89
CP_AIUS315:
	.word 0xc5a7823a  ! 924: STFA_R	sta	%f2, [%r26, %r30]
	.word 0xc4f4913a  ! 926: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
CHANGE_USER316:
	ta	T_CHANGE_NONPRIV
CHANGE_R26317:
	add	%r26,	%r27,	%r26
CP_BIS_PRI317:
	and	%r26,	%r28,	%r26
	.word 0xc4aadc5a  ! 928: STBA_R	stba	%r2, [%r11 + %r26] 0xe2
	.word 0xc4fad01a  ! 929: SWAPA_R	swapa	%r2, [%r11 + %r26] 0x80
	.word 0xc5bb101a  ! 930: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc492d01a  ! 931: LDUHA_R	lduha	[%r11, %r26] 0x80, %r2
	.word 0xc4d2915a  ! 932: LDSHA_R	ldsha	[%r10, %r26] 0x8a, %r2
	.word 0xc494903a  ! 934: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
NC_PST_PRI318:
	.word 0xc5bc599a  ! 936: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc4b3511a  ! 937: STHA_R	stha	%r2, [%r13 + %r26] 0x88
	.word 0xc5a4903a  ! 939: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4d3d11a  ! 941: LDSHA_R	ldsha	[%r15, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC320:
	.word 0xc5bd409a  ! 943: STDFA_R	stda	%f2, [%r26, %r21]
	.word 0xc443001a  ! 944: LDSW_R	ldsw	[%r12 + %r26], %r2
	.word 0xc482915a  ! 945: LDUWA_R	lduwa	[%r10, %r26] 0x8a, %r2
WR_LEASI_321:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_322:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_BIS_NUC323:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 948: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CHANGE_R26324:
	add	%r26,	%r27,	%r26
CP_BIS_SEC324:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 950: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
NC_AIUS325:
	.word 0xc4c7c33a  ! 952: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r2
	.word 0xc48b901a  ! 954: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
	.word 0xc4cc903a  ! 956: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc584913a  ! 958: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc582d01a  ! 959: LDFA_R	lda	[%r11, %r26], %f2
CP_BIS_QUAD_LD326:
	and	%r26,	%r29,	%r26
	.word 0xc49b5c5a  ! 961: LDDA_R	ldda	[%r13, %r26] 0xe2, %r2
NC_NUC327:
	.word 0xc59d409a  ! 963: LDDFA_R	ldda	[%r21, %r26], %f2
BLK_PRI328:
	and	%r26,	%r29,	%r26
	.word 0xe1bb5e1a  ! 965: STDFA_R	stda	%f16, [%r26, %r13]
	.word 0xc4c4903a  ! 967: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
CP_BIS_QUAD_LD329:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 969: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc4c4d13a  ! 971: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
NC_BIS_SEC330:
	.word 0xc8a4dd7a  ! 973: STWA_R	stwa	%r4, [%r19 + %r26] 0xeb
CP_PST_PRI331:
	.word 0xc5bb181a  ! 975: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5a4501a  ! 977: STFA_R	sta	%f2, [%r26, %r17]
	.word 0xc4ac913a  ! 979: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc484d03a  ! 981: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
CP_AIUS332:
	.word 0xc4cf823a  ! 983: LDSBA_R	ldsba	[%r30, %r26] 0x11, %r2
CP_BIS_QUAD_LD333:
	and	%r26,	%r29,	%r26
	.word 0xc89a9c5a  ! 985: LDDA_R	ldda	[%r10, %r26] 0xe2, %r4
CP_BIS_AIUP334:
	and	%r26,	%r28,	%r26
	.word 0xccf6045a  ! 987: STXA_R	stxa	%r6, [%r24 + %r26] 0x22
CHANGE_USER335:
	ta	T_CHANGE_NONPRIV
CHANGE_R26336:
	add	%r26,	%r27,	%r26
CP_BIS_PRI336:
	and	%r26,	%r28,	%r26
	.word 0xc4b35d5a  ! 989: STHA_R	stha	%r2, [%r13 + %r26] 0xea
	.word 0xc4c4101a  ! 991: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r2
CHANGE_PRIV337:
	ta	T_CHANGE_PRIV
CHANGE_R26338:
	add	%r26,	%r27,	%r26
CP_BIS_NUC338:
	and	%r26,	%r28,	%r26
	.word 0xc89d05fa  ! 993: LDDA_R	ldda	[%r20, %r26] 0x2f, %r4
	.word 0xc4d4d13a  ! 995: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	.word 0xc484d03a  ! 997: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
SHORT_FP_PRI339:
	.word 0xc59b5a1a  ! 999: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc4ac913a  ! 1001: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CP_PST_PRI340:
	.word 0xc5bad85a  ! 1003: STDFA_R	stda	%f2, [%r26, %r11]
NC_BIS_AIUS341:
	.word 0xd0f7c47a  ! 1005: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
CHANGE_USER342:
	ta	T_CHANGE_NONPRIV
CHANGE_R26343:
	add	%r26,	%r27,	%r26
CP_BIS_PRI343:
	and	%r26,	%r28,	%r26
	.word 0xc4f35d5a  ! 1007: STXA_R	stxa	%r2, [%r13 + %r26] 0xea
CHANGE_PRIV344:
	ta	T_CHANGE_PRIV
CHANGE_R26345:
	mov	%g0,	%r26
CP_BIS_AIUS345:
	and	%r26,	%r28,	%r26
	.word 0xc4a7847a  ! 1009: STWA_R	stwa	%r2, [%r30 + %r26] 0x23
	.word 0xc4d4903a  ! 1011: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_BIS_SEC346:
	.word 0xc4acdd7a  ! 1013: STBA_R	stba	%r2, [%r19 + %r26] 0xeb
	.word 0xc5a3101a  ! 1014: STFA_R	sta	%f2, [%r26, %r12]
	.word 0xc5ba901a  ! 1015: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc5a4903a  ! 1017: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4f4501a  ! 1019: STXA_R	stxa	%r2, [%r17 + %r26] 0x80
	.word 0xc46b6033  ! 1020: LDSTUB_I	ldstub	%r2, [%r13 + 0x0033]
	.word 0xc4d4d03a  ! 1022: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc53b401a  ! 1023: STDF_R	std	%f2, [%r26, %r13]
	.word 0xc4acd13a  ! 1025: STBA_R	stba	%r2, [%r19 + %r26] 0x89
	.word 0xc49c903a  ! 1027: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
CP_BIS_AIUS347:
	and	%r26,	%r28,	%r26
	.word 0xc8b7857a  ! 1029: STHA_R	stha	%r4, [%r30 + %r26] 0x2b
NC_BIS_AIUP348:
	.word 0xd0f6445a  ! 1031: STXA_R	stxa	%r8, [%r25 + %r26] 0x22
	.word 0xc5a2901a  ! 1032: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc5e3201a  ! 1033: CASA_R	casa	[%r12] %asi, %r26, %r2
	.word 0xc4b4903a  ! 1035: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc4c4913a  ! 1037: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc4a4d03a  ! 1039: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc5ba901a  ! 1040: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc48c903a  ! 1042: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
NC_BLK_SEc349:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 1044: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc5a2911a  ! 1045: STFA_R	sta	%f2, [%r26, %r10]
NC_PST_PRI350:
	.word 0xc5bbd81a  ! 1047: STDFA_R	stda	%f2, [%r26, %r15]
CHANGE_TLE351:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_PRI352:
	and	%r26,	%r28,	%r26
	.word 0xd0a29c5a  ! 1050: STWA_R	stwa	%r8, [%r10 + %r26] 0xe2
	.word 0xc4a4d13a  ! 1052: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
CP_BIS_QUAD_LD353:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 1054: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
	.word 0xc4bad01a  ! 1055: STDA_R	stda	%r2, [%r11 + %r26] 0x80
	.word 0xc4cc501a  ! 1057: LDSBA_R	ldsba	[%r17, %r26] 0x80, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS355:
	.word 0xc5bf823a  ! 1059: STDFA_R	stda	%f2, [%r26, %r30]
NC_AIUP356:
	.word 0xc486421a  ! 1061: LDUWA_R	lduwa	[%r25, %r26] 0x10, %r2
	.word 0xc4f4903a  ! 1063: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
NC_BIS_SEC357:
	.word 0xc4b4dd7a  ! 1065: STHA_R	stha	%r2, [%r19 + %r26] 0xeb
	.word 0xc5bc501a  ! 1067: STDFA_R	stda	%f2, [%r26, %r17]
SHORT_FP_PRI358:
	.word 0xc59b1a5a  ! 1069: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc4d4903a  ! 1071: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
SHORT_FP_PRI359:
	.word 0xc5ba9a1a  ! 1073: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc5bad11a  ! 1074: STDFA_R	stda	%f2, [%r26, %r11]
CP_BIS_NUC360:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 1076: STDA_R	stda	%r8, [%r20 + %r26] 0x27
NC_BIS_SEC361:
	.word 0xc4bcdc7a  ! 1078: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
	.word 0xc5f3201a  ! 1079: CASXA_R	casxa	[%r12]%asi, %r26, %r2
WR_LEASI_362:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_363:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc484d03a  ! 1082: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc413401a  ! 1083: LDUH_R	lduh	[%r13 + %r26], %r2
	.word 0xc59b911a  ! 1085: LDDFA_R	ldda	[%r14, %r26], %f2
	.word 0xc16fa019  ! 1087: PREFETCH_I	prefetch	[%r30 + 0x0019], #n_reads
NC_BIS_AIUS364:
	.word 0xc4bfc57a  ! 1089: STDA_R	stda	%r2, [%r31 + %r26] 0x2b
NC_AIUS365:
	.word 0xc49fc23a  ! 1091: LDDA_R	ldda	[%r31, %r26] 0x11, %r2
	.word 0xc53ae030  ! 1092: STDF_I	std	%f2, [0x0030, %r11]
CP_BIS_QUAD_LD366:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 1094: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
CP_ATM_QUAD_LD367:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1096: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_NUC368:
	.word 0xc4c5009a  ! 1098: LDSWA_R	ldswa	[%r20, %r26] 0x04, %r2
	.word 0xc484903a  ! 1100: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
NC_PST_PRI369:
	.word 0xc5bb989a  ! 1102: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_TLE370:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4b4913a  ! 1105: STHA_R	stha	%r2, [%r18 + %r26] 0x89
	.word 0xc472801a  ! 1106: STX_R	stx	%r2, [%r10 + %r26]
	.word 0xc49bd01a  ! 1108: LDDA_R	ldda	[%r15, %r26] 0x80, %r2
CHANGE_TLE371:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CP_BIS_QUAD_LD372:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 1111: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
CHANGE_CLE373:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4a4d03a  ! 1114: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
CHANGE_PRIV374:
	ta	T_CHANGE_PRIV
CHANGE_R26375:
	add	%r26,	%r27,	%r26
CP_BIS_NUC375:
	and	%r26,	%r28,	%r26
	.word 0xcca505fa  ! 1116: STWA_R	stwa	%r6, [%r20 + %r26] 0x2f
CP_AIUS376:
	.word 0xc587823a  ! 1118: LDFA_R	lda	[%r30, %r26], %f2
NC_SHORT_FP_SEC377:
	.word 0xc5bcdb7a  ! 1120: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc5e3201a  ! 1121: CASA_R	casa	[%r12] %asi, %r26, %r2
	.word 0xc4f4913a  ! 1123: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
	.word 0xc494501a  ! 1125: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
	.word 0xc51a801a  ! 1126: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc49cd03a  ! 1128: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
	.word 0xc47b6030  ! 1129: SWAP_I	swap	%r2, [%r13 + 0x0030]
	.word 0xc43b001a  ! 1130: STD_R	std	%r2, [%r12 + %r26]
	.word 0xc4fb511a  ! 1131: SWAPA_R	swapa	%r2, [%r13 + %r26] 0x88
CP_PST_PRI378:
	.word 0xc5ba985a  ! 1133: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc48c903a  ! 1135: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
CP_AIUP379:
	.word 0xc4a6021a  ! 1137: STWA_R	stwa	%r2, [%r24 + %r26] 0x10
	.word 0xc59c903a  ! 1139: LDDFA_R	ldda	[%r18, %r26], %f2
CHANGE_USER380:
	ta	T_CHANGE_NONPRIV
CHANGE_R26381:
	add	%r26,	%r27,	%r26
NC_BIS_PRI381:
	.word 0xccf45c5a  ! 1141: STXA_R	stxa	%r6, [%r17 + %r26] 0xe2
	.word 0xc42b401a  ! 1142: STB_R	stb	%r2, [%r13 + %r26]
CHANGE_PRIV382:
	ta	T_CHANGE_PRIV
CHANGE_R26383:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP383:
	.word 0xc4f6455a  ! 1144: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
	.word 0xc5232030  ! 1145: STF_I	st	%f2, [0x0030, %r12]
NC_AIUS384:
	.word 0xc587c23a  ! 1147: LDFA_R	lda	[%r31, %r26], %f2
	.word 0xc4ac913a  ! 1149: STBA_R	stba	%r2, [%r18 + %r26] 0x89
NC_NUC385:
	.word 0xc4dd419a  ! 1151: LDXA_R	ldxa	[%r21, %r26] 0x0c, %r2
	.word 0xc584d13a  ! 1153: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4bb901a  ! 1155: STDA_R	stda	%r2, [%r14 + %r26] 0x80
	.word 0xc502a030  ! 1156: LDF_I	ld	[%r10, 0x0030], %f2
NC_BIS_AIUP386:
	.word 0xc8be445a  ! 1158: STDA_R	stda	%r4, [%r25 + %r26] 0x22
	.word 0xc4ccd03a  ! 1160: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
SET_TL1_387:
	ta	T_CHANGE_TO_TL1
CHANGE_R26388:
	add	%r26,	%r27,	%r26
NC_BIS_NUC388:
	.word 0xc8ad44fa  ! 1162: STBA_R	stba	%r4, [%r21 + %r26] 0x27
	.word 0xc4a3111a  ! 1163: STWA_R	stwa	%r2, [%r12 + %r26] 0x88
	.word 0xc49c903a  ! 1165: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
CP_BIS_NUC389:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 1167: STDA_R	stda	%r2, [%r20 + %r26] 0x27
NC_SHORT_FP_SEC390:
	.word 0xc5bcdb7a  ! 1169: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc493901a  ! 1171: LDUHA_R	lduha	[%r14, %r26] 0x80, %r2
	.word 0xc53b2030  ! 1172: STDF_I	std	%f2, [0x0030, %r12]
CP_AIUS391:
	.word 0xc4c7833a  ! 1174: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r2
	.word 0xc51b2030  ! 1175: LDDF_I	ldd	[%r12, 0x0030], %f2
	.word 0xc494d03a  ! 1177: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc45aa030  ! 1178: LDX_I	ldx	[%r10 + 0x0030], %r2
NC_AIUP392:
	.word 0xc4c6421a  ! 1180: LDSWA_R	ldswa	[%r25, %r26] 0x10, %r2
	.word 0xc4b3101a  ! 1181: STHA_R	stha	%r2, [%r12 + %r26] 0x80
	.word 0xc4d4d03a  ! 1183: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
CHANGE_R26393:
	add	%r26,	%r27,	%r26
CP_BIS_SEC393:
	and	%r26,	%r28,	%r26
	.word 0xd0b49c7a  ! 1185: STHA_R	stha	%r8, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD394:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1187: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
NC_AIUP395:
	.word 0xc49e431a  ! 1189: LDDA_R	ldda	[%r25, %r26] 0x18, %r2
	.word 0xc523001a  ! 1190: STF_R	st	%f2, [%r26, %r12]
CP_ATM_QUAD_LD396:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1192: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc5236030  ! 1193: STF_I	st	%f2, [0x0030, %r13]
CP_BIS_AIUS397:
	and	%r26,	%r28,	%r26
	.word 0xd09f847a  ! 1195: LDDA_R	ldda	[%r30, %r26] 0x23, %r8
	.word 0xc4ead01a  ! 1196: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x80
CP_AIUP398:
	.word 0xc4de021a  ! 1198: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
CP_PST_PRI399:
	.word 0xc5bb181a  ! 1200: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc502a030  ! 1201: LDF_I	ld	[%r10, 0x0030], %f2
SHORT_FP_PRI400:
	.word 0xc5ba9b1a  ! 1203: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc502a030  ! 1204: LDF_I	ld	[%r10, 0x0030], %f2
NC_AIUS401:
	.word 0xc48fc23a  ! 1206: LDUBA_R	lduba	[%r31, %r26] 0x11, %r2
	.word 0xc584d03a  ! 1208: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc4bc913a  ! 1210: STDA_R	stda	%r2, [%r18 + %r26] 0x89
	.word 0xc584d13a  ! 1212: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc59c913a  ! 1214: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc5bc511a  ! 1216: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc472801a  ! 1217: STX_R	stx	%r2, [%r10 + %r26]
CP_AIUP402:
	.word 0xc5a6031a  ! 1219: STFA_R	sta	%f2, [%r26, %r24]
SHORT_FP_PRI403:
	.word 0xc59b5b1a  ! 1221: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc47b2030  ! 1222: SWAP_I	swap	%r2, [%r12 + 0x0030]
	.word 0xc4acd03a  ! 1224: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4f4903a  ! 1226: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
	.word 0xc4dcd03a  ! 1228: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc46b401a  ! 1229: LDSTUB_R	ldstub	%r2, [%r13 + %r26]
	.word 0xc4bc903a  ! 1231: STDA_R	stda	%r2, [%r18 + %r26] 0x81
CP_BIS_NUC404:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 1233: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
CP_PST_PRI405:
	.word 0xc5ba981a  ! 1235: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4fb101a  ! 1236: SWAPA_R	swapa	%r2, [%r12 + %r26] 0x80
NC_BIS_AIUS406:
	.word 0xccbfc47a  ! 1238: STDA_R	stda	%r6, [%r31 + %r26] 0x23
NC_PST_PRI407:
	.word 0xc5bb991a  ! 1240: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_R26408:
	add	%r26,	%r27,	%r26
CP_BIS_SEC408:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 1242: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
CHANGE_R26409:
	mov	%g0,	%r26
CP_BIS_SEC409:
	and	%r26,	%r28,	%r26
	.word 0xccf49c7a  ! 1244: STXA_R	stxa	%r6, [%r18 + %r26] 0xe3
	.word 0xc4a4903a  ! 1246: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc53ae030  ! 1247: STDF_I	std	%f2, [0x0030, %r11]
	.word 0xc4d3505a  ! 1248: LDSHA_R	ldsha	[%r13, %r26] 0x82, %r2
NC_BIS_AIUS410:
	.word 0xc4a7c57a  ! 1250: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
	.word 0xc49c913a  ! 1252: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
NC_NUC411:
	.word 0xc59d409a  ! 1254: LDDFA_R	ldda	[%r21, %r26], %f2
NC_BIS_AIUP412:
	.word 0xd0b6455a  ! 1256: STHA_R	stha	%r8, [%r25 + %r26] 0x2a
SET_TL0_413:
	ta	T_CHANGE_TO_TL0
WR_LEASI_414:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_415:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc5bcd03a  ! 1259: STDFA_R	stda	%f2, [%r26, %r19]
CP_PST_PRI416:
	.word 0xc5ba981a  ! 1261: STDFA_R	stda	%f2, [%r26, %r10]
CHANGE_PRIV417:
	ta	T_CHANGE_PRIV
CHANGE_R26418:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP418:
	and	%r26,	%r28,	%r26
	.word 0xc8be045a  ! 1263: STDA_R	stda	%r4, [%r24 + %r26] 0x22
	.word 0xc4d3501a  ! 1264: LDSHA_R	ldsha	[%r13, %r26] 0x80, %r2
NC_PST_PRI419:
	.word 0xc5bc589a  ! 1266: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc46aa033  ! 1267: LDSTUB_I	ldstub	%r2, [%r10 + 0x0033]
NC_AIUS420:
	.word 0xc59fc23a  ! 1269: LDDFA_R	ldda	[%r31, %r26], %f2
CP_AIUP421:
	.word 0xc49e021a  ! 1271: LDDA_R	ldda	[%r24, %r26] 0x10, %r2
	.word 0xc494101a  ! 1273: LDUHA_R	lduha	[%r16, %r26] 0x80, %r2
CHANGE_R26422:
	add	%r26,	%r27,	%r26
CP_BIS_SEC422:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 1275: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
	.word 0xc5bc501a  ! 1277: STDFA_R	stda	%f2, [%r26, %r17]
CP_NUC423:
	.word 0xc4ed019a  ! 1279: LDSTUBA_R	ldstuba	%r2, [%r20 + %r26] 0x0c
	.word 0xc59a905a  ! 1280: LDDFA_R	ldda	[%r10, %r26], %f2
CP_ATM_QUAD_LD424:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 1282: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
	.word 0xc5a2d01a  ! 1283: STFA_R	sta	%f2, [%r26, %r11]
	.word 0xc4ccd03a  ! 1285: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
CP_BIS_QUAD_LD425:
	and	%r26,	%r29,	%r26
	.word 0xc89a9d5a  ! 1287: LDDA_R	ldda	[%r10, %r26] 0xea, %r4
WR_LEASI_426:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_427:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc412c01a  ! 1289: LDUH_R	lduh	[%r11 + %r26], %r2
	.word 0xc48cd03a  ! 1291: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
	.word 0xc4dc903a  ! 1293: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc4ccd03a  ! 1295: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
CP_AIUP428:
	.word 0xc496021a  ! 1297: LDUHA_R	lduha	[%r24, %r26] 0x10, %r2
CP_BIS_AIUP429:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1299: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
NC_PST_PRI430:
	.word 0xc5bc181a  ! 1301: STDFA_R	stda	%f2, [%r26, %r16]
BLK_PRI431:
	and	%r26,	%r29,	%r26
	.word 0xe19a9f1a  ! 1303: LDDFA_R	ldda	[%r10, %r26], %f16
	.word 0xc4b4d03a  ! 1305: STHA_R	stha	%r2, [%r19 + %r26] 0x81
SHORT_FP_PRI432:
	.word 0xc5bb5a1a  ! 1307: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc4ccd03a  ! 1309: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc56c401a  ! 1311: PREFETCH_R	prefetch	[%r17 + %r26], #n_writes
CHANGE_USER433:
	ta	T_CHANGE_NONPRIV
CHANGE_R26434:
	add	%r26,	%r27,	%r26
CP_BIS_PRI434:
	and	%r26,	%r28,	%r26
	.word 0xc4a2dd5a  ! 1313: STWA_R	stwa	%r2, [%r11 + %r26] 0xea
	.word 0xc4a4d03a  ! 1315: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc484d13a  ! 1317: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
NC_BIS_SEC435:
	.word 0xd0a4dc7a  ! 1319: STWA_R	stwa	%r8, [%r19 + %r26] 0xe3
BLK_PRI436:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 1321: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc47aa030  ! 1322: SWAP_I	swap	%r2, [%r10 + 0x0030]
	.word 0xc4db911a  ! 1324: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
	.word 0xc48b911a  ! 1326: LDUBA_R	lduba	[%r14, %r26] 0x88, %r2
	.word 0xc47b401a  ! 1327: SWAP_R	swap	%r2, [%r13 + %r26]
SHORT_FP_PRI437:
	.word 0xc5ba9b1a  ! 1329: STDFA_R	stda	%f2, [%r26, %r10]
BLK_PRI438:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1331: LDDFA_R	ldda	[%r10, %r26], %f0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC440:
	.word 0xc4dd009a  ! 1333: LDXA_R	ldxa	[%r20, %r26] 0x04, %r2
	.word 0xc59b111a  ! 1334: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc4bc903a  ! 1336: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc49c903a  ! 1338: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
CP_AIUS441:
	.word 0xc4a7823a  ! 1340: STWA_R	stwa	%r2, [%r30 + %r26] 0x11
	.word 0xc4f4501a  ! 1342: STXA_R	stxa	%r2, [%r17 + %r26] 0x80
	.word 0xc523401a  ! 1343: STF_R	st	%f2, [%r26, %r13]
	.word 0xc53b6030  ! 1344: STDF_I	std	%f2, [0x0030, %r13]
NC_PST_PRI442:
	.word 0xc5bc195a  ! 1346: STDFA_R	stda	%f2, [%r26, %r16]
CP_BIS_QUAD_LD443:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 1348: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc4aad01a  ! 1349: STBA_R	stba	%r2, [%r11 + %r26] 0x80
	.word 0xc4b4913a  ! 1351: STHA_R	stha	%r2, [%r18 + %r26] 0x89
	.word 0xc4b4903a  ! 1353: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc4b4d13a  ! 1355: STHA_R	stha	%r2, [%r19 + %r26] 0x89
CP_PST_PRI444:
	.word 0xc5bb581a  ! 1357: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc4a4903a  ! 1359: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc53b401a  ! 1360: STDF_R	std	%f2, [%r26, %r13]
	.word 0xc584913a  ! 1362: LDFA_R	lda	[%r18, %r26], %f2
	.word 0xc46b401a  ! 1363: LDSTUB_R	ldstub	%r2, [%r13 + %r26]
NC_AIUS445:
	.word 0xc4dfc23a  ! 1365: LDXA_R	ldxa	[%r31, %r26] 0x11, %r2
	.word 0xc4dc903a  ! 1367: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
NC_AIUS446:
	.word 0xc4dfc23a  ! 1369: LDXA_R	ldxa	[%r31, %r26] 0x11, %r2
	.word 0xc4c4111a  ! 1371: LDSWA_R	ldswa	[%r16, %r26] 0x88, %r2
	.word 0xc4a4d13a  ! 1373: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
CP_BIS_QUAD_LD447:
	and	%r26,	%r29,	%r26
	.word 0xc89b1c5a  ! 1375: LDDA_R	ldda	[%r12, %r26] 0xe2, %r4
WR_LEASI_448:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_449:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc483501a  ! 1377: LDUWA_R	lduwa	[%r13, %r26] 0x80, %r2
	.word 0xc4c4501a  ! 1379: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r2
	.word 0xc4b4913a  ! 1381: STHA_R	stha	%r2, [%r18 + %r26] 0x89
CHANGE_R26450:
	add	%r26,	%r27,	%r26
CP_BIS_SEC450:
	and	%r26,	%r28,	%r26
	.word 0xd0ac9c7a  ! 1383: STBA_R	stba	%r8, [%r18 + %r26] 0xe3
	.word 0xc59c903a  ! 1385: LDDFA_R	ldda	[%r18, %r26], %f2
CP_BIS_NUC451:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 1387: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xc4c4903a  ! 1389: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
CHANGE_R26452:
	add	%r26,	%r27,	%r26
CP_BIS_SEC452:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 1391: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
NC_AIUP453:
	.word 0xc5be421a  ! 1393: STDFA_R	stda	%f2, [%r26, %r25]
	.word 0xc4ea901a  ! 1394: LDSTUBA_R	ldstuba	%r2, [%r10 + %r26] 0x80
NC_BIS_AIUP454:
	.word 0xccb6455a  ! 1396: STHA_R	stha	%r6, [%r25 + %r26] 0x2a
CP_AIUP455:
	.word 0xc496021a  ! 1398: LDUHA_R	lduha	[%r24, %r26] 0x10, %r2
SET_TL1_456:
	ta	T_CHANGE_TO_TL1
CHANGE_R26457:
	add	%r26,	%r27,	%r26
NC_BIS_NUC457:
	.word 0xc8ad44fa  ! 1400: STBA_R	stba	%r4, [%r21 + %r26] 0x27
NC_BIS_AIUS458:
	.word 0xccafc47a  ! 1402: STBA_R	stba	%r6, [%r31 + %r26] 0x23
CP_BIS_AIUP459:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 1404: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xc4cc913a  ! 1406: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
	.word 0xc492901a  ! 1407: LDUHA_R	lduha	[%r10, %r26] 0x80, %r2
	.word 0xc47b6030  ! 1408: SWAP_I	swap	%r2, [%r13 + 0x0030]
	.word 0xc4cb911a  ! 1410: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r2
	.word 0xc42b2033  ! 1411: STB_I	stb	%r2, [%r12 + 0x0033]
CP_BIS_AIUP460:
	and	%r26,	%r28,	%r26
	.word 0xc89e055a  ! 1413: LDDA_R	ldda	[%r24, %r26] 0x2a, %r4
	.word 0xc4b3901a  ! 1415: STHA_R	stha	%r2, [%r14 + %r26] 0x80
	.word 0xc46aa033  ! 1416: LDSTUB_I	ldstub	%r2, [%r10 + 0x0033]
CP_PST_PRI461:
	.word 0xc5bb195a  ! 1418: STDFA_R	stda	%f2, [%r26, %r12]
CP_AIUS462:
	.word 0xc4a7823a  ! 1420: STWA_R	stwa	%r2, [%r30 + %r26] 0x11
NC_BLK_SEc463:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 1422: STDFA_R	stda	%f16, [%r26, %r19]
BLK_PRI464:
	and	%r26,	%r29,	%r26
	.word 0xc19b5e1a  ! 1424: LDDFA_R	ldda	[%r13, %r26], %f0
	.word 0xebefa028  ! 1426: PREFETCHA_I	prefetcha	[%r30, + 0x0028] %asi, #21
	.word 0xc48c903a  ! 1428: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4d4913a  ! 1430: LDSHA_R	ldsha	[%r18, %r26] 0x89, %r2
SHORT_FP_PRI465:
	.word 0xc5ba9b5a  ! 1432: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc43b6030  ! 1433: STD_I	std	%r2, [%r13 + 0x0030]
	.word 0xc59b501a  ! 1434: LDDFA_R	ldda	[%r13, %r26], %f2
	.word 0xc51b6030  ! 1435: LDDF_I	ldd	[%r13, 0x0030], %f2
	.word 0xc53a801a  ! 1436: STDF_R	std	%f2, [%r26, %r10]
SET_TL0_466:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI467:
	and	%r26,	%r28,	%r26
	.word 0xc49a9c5a  ! 1438: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc59b505a  ! 1439: LDDFA_R	ldda	[%r13, %r26], %f2
CHANGE_PRIV468:
	ta	T_CHANGE_PRIV
CHANGE_R26469:
	mov	%g0,	%r26
CP_ATM_QUAD_LD469:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1441: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
SET_TL1_470:
	ta	T_CHANGE_TO_TL1
CHANGE_R26471:
	add	%r26,	%r27,	%r26
NC_BIS_NUC471:
	.word 0xc4ad44fa  ! 1443: STBA_R	stba	%r2, [%r21 + %r26] 0x27
	.word 0xc4bcd13a  ! 1445: STDA_R	stda	%r2, [%r19 + %r26] 0x89
	.word 0xc4dbd01a  ! 1447: LDXA_R	ldxa	[%r15, %r26] 0x80, %r2
	.word 0xc4a4d03a  ! 1449: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc48c913a  ! 1451: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
	.word 0xc583911a  ! 1453: LDFA_R	lda	[%r14, %r26], %f2
	.word 0xc47a801a  ! 1454: SWAP_R	swap	%r2, [%r10 + %r26]
	.word 0xc44aa033  ! 1455: LDSB_I	ldsb	[%r10 + 0x0033], %r2
NC_AIUP472:
	.word 0xc496421a  ! 1457: LDUHA_R	lduha	[%r25, %r26] 0x10, %r2
SHORT_FP_PRI473:
	.word 0xc5ba9a1a  ! 1459: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4da901a  ! 1460: LDXA_R	ldxa	[%r10, %r26] 0x80, %r2
	.word 0xc4f4d03a  ! 1462: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc4ba901a  ! 1463: STDA_R	stda	%r2, [%r10 + %r26] 0x80
	.word 0xc4036030  ! 1464: LDUW_I	lduw	[%r13 + 0x0030], %r2
	.word 0xc4a4d03a  ! 1466: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
SET_TL0_474:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI475:
	.word 0xccbc1c5a  ! 1468: STDA_R	stda	%r6, [%r16 + %r26] 0xe2
	.word 0xc4ba901a  ! 1469: STDA_R	stda	%r2, [%r10 + %r26] 0x80
	.word 0xc494d13a  ! 1471: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
	.word 0xc49c903a  ! 1473: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC477:
	.word 0xc4f5419a  ! 1475: STXA_R	stxa	%r2, [%r21 + %r26] 0x0c
CP_ATM_QUAD_LD478:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 1477: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
	.word 0xc5bb911a  ! 1479: STDFA_R	stda	%f2, [%r26, %r14]
SHORT_FP_PRI479:
	.word 0xc5badb5a  ! 1481: STDFA_R	stda	%f2, [%r26, %r11]
BLK_PRI480:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 1483: LDDFA_R	ldda	[%r12, %r26], %f16
CHANGE_USER481:
	ta	T_CHANGE_NONPRIV
CHANGE_R26482:
	add	%r26,	%r27,	%r26
CP_BIS_PRI482:
	and	%r26,	%r28,	%r26
	.word 0xc8a35c5a  ! 1485: STWA_R	stwa	%r4, [%r13 + %r26] 0xe2
CHANGE_TLE483:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
CHANGE_PRIV484:
	ta	T_CHANGE_PRIV
CHANGE_R26485:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD485:
	and	%r26,	%r29,	%r26
	.word 0xcc9b449a  ! 1488: LDDA_R	ldda	[%r13, %r26] 0x24, %r6
NC_BIS_SEC486:
	.word 0xccf4dd7a  ! 1490: STXA_R	stxa	%r6, [%r19 + %r26] 0xeb
BLK_PRI487:
	and	%r26,	%r29,	%r26
	.word 0xe1bb1e1a  ! 1492: STDFA_R	stda	%f16, [%r26, %r12]
CP_PST_PRI488:
	.word 0xc5bad81a  ! 1494: STDFA_R	stda	%f2, [%r26, %r11]
CP_BIS_QUAD_LD489:
	and	%r26,	%r29,	%r26
	.word 0xc49a9d5a  ! 1496: LDDA_R	ldda	[%r10, %r26] 0xea, %r2
	.word 0xc4d4903a  ! 1498: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc4acd03a  ! 1500: STBA_R	stba	%r2, [%r19 + %r26] 0x81
NC_AIUS490:
	.word 0xc4c7c33a  ! 1502: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r2
NC_BIS_SEC491:
	.word 0xcca4dc7a  ! 1504: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
CP_BIS_QUAD_LD492:
	and	%r26,	%r29,	%r26
	.word 0xd09adc5a  ! 1506: LDDA_R	ldda	[%r11, %r26] 0xe2, %r8
NC_BIS_AIUP493:
	.word 0xc8f6445a  ! 1508: STXA_R	stxa	%r4, [%r25 + %r26] 0x22
SHORT_FP_PRI494:
	.word 0xc59ada1a  ! 1510: LDDFA_R	ldda	[%r11, %r26], %f2
NC_AIUP495:
	.word 0xc4a6421a  ! 1512: STWA_R	stwa	%r2, [%r25 + %r26] 0x10
	.word 0xc422e030  ! 1513: STW_I	stw	%r2, [%r11 + 0x0030]
	.word 0xc53b2030  ! 1514: STDF_I	std	%f2, [0x0030, %r12]
CP_ATM_QUAD_LD496:
	and	%r26,	%r29,	%r26
	.word 0xcc9ac59a  ! 1516: LDDA_R	ldda	[%r11, %r26] 0x2c, %r6
CP_AIUP497:
	.word 0xc496031a  ! 1518: LDUHA_R	lduha	[%r24, %r26] 0x18, %r2
NC_PST_PRI498:
	.word 0xc5bb981a  ! 1520: STDFA_R	stda	%f2, [%r26, %r14]
CP_NUC499:
	.word 0xc4ed009a  ! 1522: LDSTUBA_R	ldstuba	%r2, [%r20 + %r26] 0x04
	.word 0xc5a4d03a  ! 1524: STFA_R	sta	%f2, [%r26, %r19]
CP_PST_PRI500:
	.word 0xc5bb195a  ! 1526: STDFA_R	stda	%f2, [%r26, %r12]
NC_BIS_SEC501:
	.word 0xc4bcdc7a  ! 1528: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_PST_PRI502:
	.word 0xc5bad91a  ! 1530: STDFA_R	stda	%f2, [%r26, %r11]
CHANGE_R26503:
	add	%r26,	%r27,	%r26
CP_BIS_SEC503:
	and	%r26,	%r28,	%r26
	.word 0xccb49d7a  ! 1532: STHA_R	stha	%r6, [%r18 + %r26] 0xeb
CP_PST_PRI504:
	.word 0xc5bb181a  ! 1534: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc4cc913a  ! 1536: LDSBA_R	ldsba	[%r18, %r26] 0x89, %r2
NC_AIUS505:
	.word 0xc48fc23a  ! 1538: LDUBA_R	lduba	[%r31, %r26] 0x11, %r2
CHANGE_USER506:
	ta	T_CHANGE_NONPRIV
CHANGE_R26507:
	add	%r26,	%r27,	%r26
NC_BIS_PRI507:
	.word 0xccac1c5a  ! 1540: STBA_R	stba	%r6, [%r16 + %r26] 0xe2
CHANGE_PRIV508:
	ta	T_CHANGE_PRIV
CHANGE_R26509:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD509:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 1542: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
SET_TL1_510:
	ta	T_CHANGE_TO_TL1
CHANGE_R26511:
	mov	%g0,	%r26
NC_BIS_NUC511:
	.word 0xcca544fa  ! 1544: STWA_R	stwa	%r6, [%r21 + %r26] 0x27
	.word 0xc59a911a  ! 1545: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc412801a  ! 1546: LDUH_R	lduh	[%r10 + %r26], %r2
	.word 0xc4b4d03a  ! 1548: STHA_R	stha	%r2, [%r19 + %r26] 0x81
NC_SHORT_FP_SEC512:
	.word 0xc5bcdb3a  ! 1550: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc53b6030  ! 1551: STDF_I	std	%f2, [0x0030, %r13]
	.word 0xc4b4903a  ! 1553: STHA_R	stha	%r2, [%r18 + %r26] 0x81
NC_BIS_NUC513:
	.word 0xccad44fa  ! 1555: STBA_R	stba	%r6, [%r21 + %r26] 0x27
	.word 0xc5bc501a  ! 1557: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc59b911a  ! 1559: LDDFA_R	ldda	[%r14, %r26], %f2
	.word 0xc4a4913a  ! 1561: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
SET_TL0_514:
	ta	T_CHANGE_TO_TL0
CHANGE_R26515:
	add	%r26,	%r27,	%r26
NC_BIS_SEC515:
	.word 0xd0f4dd7a  ! 1563: STXA_R	stxa	%r8, [%r19 + %r26] 0xeb
CHANGE_PRIV516:
	ta	T_CHANGE_PRIV
CHANGE_R26517:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD517:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1565: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CHANGE_R26518:
	add	%r26,	%r27,	%r26
CP_BIS_SEC518:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9d7a  ! 1567: STBA_R	stba	%r2, [%r18 + %r26] 0xeb
	.word 0xc4b4101a  ! 1569: STHA_R	stha	%r2, [%r16 + %r26] 0x80
CP_AIUP519:
	.word 0xc4ce021a  ! 1571: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r2
	.word 0xc48c903a  ! 1573: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc5ba901a  ! 1574: STDFA_R	stda	%f2, [%r26, %r10]
NC_AIUP520:
	.word 0xc49e431a  ! 1576: LDDA_R	ldda	[%r25, %r26] 0x18, %r2
	.word 0xc48b901a  ! 1578: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
CP_AIUP521:
	.word 0xc59e021a  ! 1580: LDDFA_R	ldda	[%r24, %r26], %f2
NC_BIS_AIUP522:
	.word 0xc4f6455a  ! 1582: STXA_R	stxa	%r2, [%r25 + %r26] 0x2a
NC_PST_PRI523:
	.word 0xc5bc581a  ! 1584: STDFA_R	stda	%f2, [%r26, %r17]
CP_BIS_AIUP524:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 1586: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
	.word 0xc4ab111a  ! 1587: STBA_R	stba	%r2, [%r12 + %r26] 0x88
	.word 0xc46aa033  ! 1588: LDSTUB_I	ldstub	%r2, [%r10 + 0x0033]
	.word 0xc483d01a  ! 1590: LDUWA_R	lduwa	[%r15, %r26] 0x80, %r2
	.word 0xc4fa911a  ! 1591: SWAPA_R	swapa	%r2, [%r10 + %r26] 0x88
	.word 0xc4f4913a  ! 1593: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
NC_PST_PRI525:
	.word 0xc5bbd89a  ! 1595: STDFA_R	stda	%f2, [%r26, %r15]
NC_NUC526:
	.word 0xc4c5409a  ! 1597: LDSWA_R	ldswa	[%r21, %r26] 0x04, %r2
	.word 0xc4b4d13a  ! 1599: STHA_R	stha	%r2, [%r19 + %r26] 0x89
	.word 0xc49c101a  ! 1601: LDDA_R	ldda	[%r16, %r26] 0x80, %r2
	.word 0xc49c913a  ! 1603: LDDA_R	ldda	[%r18, %r26] 0x89, %r2
	.word 0xc42a801a  ! 1604: STB_R	stb	%r2, [%r10 + %r26]
	.word 0xc5a2901a  ! 1605: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc4cbd11a  ! 1607: LDSBA_R	ldsba	[%r15, %r26] 0x88, %r2
NC_BIS_AIUS527:
	.word 0xd0a7c47a  ! 1609: STWA_R	stwa	%r8, [%r31 + %r26] 0x23
	.word 0xc484903a  ! 1611: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc42a801a  ! 1612: STB_R	stb	%r2, [%r10 + %r26]
CP_AIUS528:
	.word 0xc487833a  ! 1614: LDUWA_R	lduwa	[%r30, %r26] 0x19, %r2
	.word 0xc4ab501a  ! 1615: STBA_R	stba	%r2, [%r13 + %r26] 0x80
CP_ATM_QUAD_LD529:
	and	%r26,	%r29,	%r26
	.word 0xd09b449a  ! 1617: LDDA_R	ldda	[%r13, %r26] 0x24, %r8
	.word 0xc4d4d03a  ! 1619: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc4f4d03a  ! 1621: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc51aa030  ! 1622: LDDF_I	ldd	[%r10, 0x0030], %f2
NC_BIS_SEC530:
	.word 0xd0bcdc7a  ! 1624: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
SHORT_FP_PRI531:
	.word 0xc5ba9a1a  ! 1626: STDFA_R	stda	%f2, [%r26, %r10]
CP_NUC532:
	.word 0xc5bd009a  ! 1628: STDFA_R	stda	%f2, [%r26, %r20]
	.word 0xc583901a  ! 1630: LDFA_R	lda	[%r14, %r26], %f2
CP_AIUS533:
	.word 0xc59f833a  ! 1632: LDDFA_R	ldda	[%r30, %r26], %f2
CHANGE_USER534:
	ta	T_CHANGE_NONPRIV
CHANGE_R26535:
	add	%r26,	%r27,	%r26
CP_BIS_PRI535:
	and	%r26,	%r28,	%r26
	.word 0xd09a9c5a  ! 1634: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc4acd03a  ! 1636: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc49b901a  ! 1638: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
CP_BIS_QUAD_LD536:
	and	%r26,	%r29,	%r26
	.word 0xc89adc5a  ! 1640: LDDA_R	ldda	[%r11, %r26] 0xe2, %r4
CHANGE_PRIV537:
	ta	T_CHANGE_PRIV
CHANGE_R26538:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP538:
	and	%r26,	%r28,	%r26
	.word 0xc4be055a  ! 1642: STDA_R	stda	%r2, [%r24 + %r26] 0x2a
	.word 0xc4b4903a  ! 1644: STHA_R	stha	%r2, [%r18 + %r26] 0x81
	.word 0xc4f2911a  ! 1645: STXA_R	stxa	%r2, [%r10 + %r26] 0x88
	.word 0xc4bc903a  ! 1647: STDA_R	stda	%r2, [%r18 + %r26] 0x81
NC_BIS_AIUS539:
	.word 0xcca7c47a  ! 1649: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
NC_NUC540:
	.word 0xc585419a  ! 1651: LDFA_R	lda	[%r21, %r26], %f2
NC_BIS_AIUS541:
	.word 0xc4a7c47a  ! 1653: STWA_R	stwa	%r2, [%r31 + %r26] 0x23
	.word 0xc47b6030  ! 1654: SWAP_I	swap	%r2, [%r13 + 0x0030]
BLK_PRI542:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1656: LDDFA_R	ldda	[%r10, %r26], %f0
NC_BIS_AIUP543:
	.word 0xc8a6455a  ! 1658: STWA_R	stwa	%r4, [%r25 + %r26] 0x2a
	.word 0xc4aa911a  ! 1659: STBA_R	stba	%r2, [%r10 + %r26] 0x88
	.word 0xc4ac913a  ! 1661: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc49cd13a  ! 1663: LDDA_R	ldda	[%r19, %r26] 0x89, %r2
SHORT_FP_PRI544:
	.word 0xc59b1b5a  ! 1665: LDDFA_R	ldda	[%r12, %r26], %f2
NC_BIS_AIUP545:
	.word 0xc4b6445a  ! 1667: STHA_R	stha	%r2, [%r25 + %r26] 0x22
CP_AIUS546:
	.word 0xc4f7823a  ! 1669: STXA_R	stxa	%r2, [%r30 + %r26] 0x11
CP_BIS_NUC547:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 1671: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CP_AIUP548:
	.word 0xc4de021a  ! 1673: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
CHANGE_USER549:
	ta	T_CHANGE_NONPRIV
CHANGE_R26550:
	add	%r26,	%r27,	%r26
NC_BIS_PRI550:
	.word 0xccf45d5a  ! 1675: STXA_R	stxa	%r6, [%r17 + %r26] 0xea
CHANGE_PRIV551:
	ta	T_CHANGE_PRIV
CHANGE_R26552:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS552:
	.word 0xccafc47a  ! 1677: STBA_R	stba	%r6, [%r31 + %r26] 0x23
	.word 0xc59cd03a  ! 1679: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4acd13a  ! 1681: STBA_R	stba	%r2, [%r19 + %r26] 0x89
	.word 0xc46b6033  ! 1682: LDSTUB_I	ldstub	%r2, [%r13 + 0x0033]
	.word 0xc4db911a  ! 1684: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
	.word 0xc51a801a  ! 1685: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc4f3911a  ! 1687: STXA_R	stxa	%r2, [%r14 + %r26] 0x88
	.word 0xc4b4913a  ! 1689: STHA_R	stha	%r2, [%r18 + %r26] 0x89
	.word 0xc5a3501a  ! 1690: STFA_R	sta	%f2, [%r26, %r13]
CP_PST_PRI553:
	.word 0xc5bb581a  ! 1692: STDFA_R	stda	%f2, [%r26, %r13]
WR_LEASI_554:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_555:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc5efd15a  ! 1695: PREFETCHA_R	prefetcha	[%r31, %r26] 0x8a, #n_writes
	.word 0xc4b4511a  ! 1697: STHA_R	stha	%r2, [%r17 + %r26] 0x88
NC_BLK_SEc556:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 1699: STDFA_R	stda	%f0, [%r26, %r19]
NC_BIS_AIUS557:
	.word 0xc8b7c47a  ! 1701: STHA_R	stha	%r4, [%r31 + %r26] 0x23
CHANGE_USER558:
	ta	T_CHANGE_NONPRIV
CHANGE_R26559:
	mov	%g0,	%r26
CP_BIS_PRI559:
	and	%r26,	%r28,	%r26
	.word 0xd0b29c5a  ! 1703: STHA_R	stha	%r8, [%r10 + %r26] 0xe2
	.word 0xc4dbd11a  ! 1705: LDXA_R	ldxa	[%r15, %r26] 0x88, %r2
	.word 0xc4b2d01a  ! 1706: STHA_R	stha	%r2, [%r11 + %r26] 0x80
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC561:
	.word 0xc4a5419a  ! 1708: STWA_R	stwa	%r2, [%r21 + %r26] 0x0c
SET_TL1_562:
	ta	T_CHANGE_TO_TL1
CHANGE_R26563:
	add	%r26,	%r27,	%r26
NC_BIS_NUC563:
	.word 0xc4f544fa  ! 1710: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
CP_BIS_AIUS564:
	and	%r26,	%r28,	%r26
	.word 0xc4bf847a  ! 1712: STDA_R	stda	%r2, [%r30 + %r26] 0x23
CP_AIUS565:
	.word 0xc4bf823a  ! 1714: STDA_R	stda	%r2, [%r30 + %r26] 0x11
NC_BIS_NUC566:
	.word 0xc4b544fa  ! 1716: STHA_R	stha	%r2, [%r21 + %r26] 0x27
	.word 0xc53aa030  ! 1717: STDF_I	std	%f2, [0x0030, %r10]
NC_BIS_NUC567:
	.word 0xc8a544fa  ! 1719: STWA_R	stwa	%r4, [%r21 + %r26] 0x27
	.word 0xc584d03a  ! 1721: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc502c01a  ! 1722: LDF_R	ld	[%r11, %r26], %f2
	.word 0xc59a905a  ! 1723: LDDFA_R	ldda	[%r10, %r26], %f2
NC_BIS_NUC568:
	.word 0xc4bd44fa  ! 1725: STDA_R	stda	%r2, [%r21 + %r26] 0x27
NC_BIS_AIUS569:
	.word 0xccbfc57a  ! 1727: STDA_R	stda	%r6, [%r31 + %r26] 0x2b
	.word 0xc49c903a  ! 1729: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc53b6030  ! 1730: STDF_I	std	%f2, [0x0030, %r13]
SET_TL0_570:
	ta	T_CHANGE_TO_TL0
CHANGE_R26571:
	add	%r26,	%r27,	%r26
NC_BIS_SEC571:
	.word 0xcca4dc7a  ! 1732: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	.word 0xc4acd03a  ! 1734: STBA_R	stba	%r2, [%r19 + %r26] 0x81
	.word 0xc4f4d13a  ! 1736: STXA_R	stxa	%r2, [%r19 + %r26] 0x89
	.word 0xc5a4d13a  ! 1738: STFA_R	sta	%f2, [%r26, %r19]
SHORT_FP_PRI572:
	.word 0xc59adb1a  ! 1740: LDDFA_R	ldda	[%r11, %r26], %f2
	.word 0xc5bcd13a  ! 1742: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc48c903a  ! 1744: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
BLK_PRI573:
	and	%r26,	%r29,	%r26
	.word 0xc1bb5f1a  ! 1746: STDFA_R	stda	%f0, [%r26, %r13]
BLK_PRI574:
	and	%r26,	%r29,	%r26
	.word 0xc1bb1e1a  ! 1748: STDFA_R	stda	%f0, [%r26, %r12]
CP_BIS_PRI575:
	and	%r26,	%r28,	%r26
	.word 0xc8ba9d5a  ! 1750: STDA_R	stda	%r4, [%r10 + %r26] 0xea
WR_LEASI_576:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_577:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc49cd03a  ! 1753: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
CHANGE_PRIV578:
	ta	T_CHANGE_PRIV
CHANGE_R26579:
	add	%r26,	%r27,	%r26
CP_BIS_NUC579:
	and	%r26,	%r28,	%r26
	.word 0xd09d04fa  ! 1755: LDDA_R	ldda	[%r20, %r26] 0x27, %r8
CP_AIUP580:
	.word 0xc4be031a  ! 1757: STDA_R	stda	%r2, [%r24 + %r26] 0x18
	.word 0xc4a4101a  ! 1759: STWA_R	stwa	%r2, [%r16 + %r26] 0x80
	.word 0xc59b911a  ! 1761: LDDFA_R	ldda	[%r14, %r26], %f2
CP_ATM_QUAD_LD581:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 1763: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
CP_PST_PRI582:
	.word 0xc5ba981a  ! 1765: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc483901a  ! 1767: LDUWA_R	lduwa	[%r14, %r26] 0x80, %r2
	.word 0xc5bb911a  ! 1769: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_USER583:
	ta	T_CHANGE_NONPRIV
CHANGE_R26584:
	add	%r26,	%r27,	%r26
NC_BIS_PRI584:
	.word 0xc8ac1d5a  ! 1771: STBA_R	stba	%r4, [%r16 + %r26] 0xea
NC_PST_PRI585:
	.word 0xc5bb991a  ! 1773: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_PRIV586:
	ta	T_CHANGE_PRIV
CHANGE_R26587:
	add	%r26,	%r27,	%r26
CP_BIS_NUC587:
	and	%r26,	%r28,	%r26
	.word 0xcc9d05fa  ! 1775: LDDA_R	ldda	[%r20, %r26] 0x2f, %r6
CP_BIS_AIUP588:
	and	%r26,	%r28,	%r26
	.word 0xccbe055a  ! 1777: STDA_R	stda	%r6, [%r24 + %r26] 0x2a
CP_BIS_AIUS589:
	and	%r26,	%r28,	%r26
	.word 0xc89f847a  ! 1779: LDDA_R	ldda	[%r30, %r26] 0x23, %r4
NC_AIUP590:
	.word 0xc586421a  ! 1781: LDFA_R	lda	[%r25, %r26], %f2
WR_LEASI_591:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_592:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4a4d03a  ! 1784: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc42b2033  ! 1785: STB_I	stb	%r2, [%r12 + 0x0033]
	.word 0xc51b001a  ! 1786: LDDF_R	ldd	[%r12, %r26], %f2
	.word 0xc4eb111a  ! 1787: LDSTUBA_R	ldstuba	%r2, [%r12 + %r26] 0x88
	.word 0xc502801a  ! 1788: LDF_R	ld	[%r10, %r26], %f2
	.word 0xc4f4903a  ! 1790: STXA_R	stxa	%r2, [%r18 + %r26] 0x81
CHANGE_R26593:
	add	%r26,	%r27,	%r26
CP_BIS_SEC593:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 1792: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
CP_PST_PRI594:
	.word 0xc5bad85a  ! 1794: STDFA_R	stda	%f2, [%r26, %r11]
CHANGE_TLE595:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc5bc101a  ! 1797: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc4ab911a  ! 1799: STBA_R	stba	%r2, [%r14 + %r26] 0x88
CHANGE_PRIV596:
	ta	T_CHANGE_PRIV
CHANGE_R26597:
	mov	%g0,	%r26
CP_ATM_QUAD_LD597:
	and	%r26,	%r29,	%r26
	.word 0xc89a849a  ! 1801: LDDA_R	ldda	[%r10, %r26] 0x24, %r4
NC_AIUP598:
	.word 0xc4a6421a  ! 1803: STWA_R	stwa	%r2, [%r25 + %r26] 0x10
CP_AIUS599:
	.word 0xc4a7823a  ! 1805: STWA_R	stwa	%r2, [%r30 + %r26] 0x11
NC_AIUP600:
	.word 0xc4c6431a  ! 1807: LDSWA_R	ldswa	[%r25, %r26] 0x18, %r2
	.word 0xc4dc903a  ! 1809: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc4cc903a  ! 1811: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc503401a  ! 1812: LDF_R	ld	[%r13, %r26], %f2
	.word 0xc493105a  ! 1813: LDUHA_R	lduha	[%r12, %r26] 0x82, %r2
	.word 0xc59c903a  ! 1815: LDDFA_R	ldda	[%r18, %r26], %f2
	.word 0xc484d03a  ! 1817: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc4dc111a  ! 1819: LDXA_R	ldxa	[%r16, %r26] 0x88, %r2
	.word 0xc46b2033  ! 1820: LDSTUB_I	ldstub	%r2, [%r12 + 0x0033]
	.word 0xc4bc903a  ! 1822: STDA_R	stda	%r2, [%r18 + %r26] 0x81
	.word 0xc4c3d01a  ! 1824: LDSWA_R	ldswa	[%r15, %r26] 0x80, %r2
CHANGE_USER601:
	ta	T_CHANGE_NONPRIV
CHANGE_R26602:
	add	%r26,	%r27,	%r26
NC_BIS_PRI602:
	.word 0xd0f45c5a  ! 1826: STXA_R	stxa	%r8, [%r17 + %r26] 0xe2
	.word 0xc4dbd11a  ! 1828: LDXA_R	ldxa	[%r15, %r26] 0x88, %r2
SET_TL1_603:
	ta	T_CHANGE_TO_TL1
CHANGE_R26604:
	add	%r26,	%r27,	%r26
NC_BIS_NUC604:
	.word 0xc8bd44fa  ! 1830: STDA_R	stda	%r4, [%r21 + %r26] 0x27
	.word 0xc5032030  ! 1831: LDF_I	ld	[%r12, 0x0030], %f2
	.word 0xc4c3101a  ! 1832: LDSWA_R	ldswa	[%r12, %r26] 0x80, %r2
SET_TL0_605:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI606:
	and	%r26,	%r28,	%r26
	.word 0xc4f29d5a  ! 1834: STXA_R	stxa	%r2, [%r10 + %r26] 0xea
	.word 0xc5032030  ! 1835: LDF_I	ld	[%r12, 0x0030], %f2
	.word 0xc4cc903a  ! 1837: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
	.word 0xc48c903a  ! 1839: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc4bcd03a  ! 1841: STDA_R	stda	%r2, [%r19 + %r26] 0x81
NC_BIS_PRI607:
	.word 0xc4b39c5a  ! 1843: STHA_R	stha	%r2, [%r14 + %r26] 0xe2
	.word 0xc53a801a  ! 1844: STDF_R	std	%f2, [%r26, %r10]
CHANGE_PRIV608:
	ta	T_CHANGE_PRIV
CHANGE_R26609:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD609:
	and	%r26,	%r29,	%r26
	.word 0xc49b459a  ! 1846: LDDA_R	ldda	[%r13, %r26] 0x2c, %r2
	.word 0xc5bc903a  ! 1848: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc442a030  ! 1849: LDSW_I	ldsw	[%r10 + 0x0030], %r2
	.word 0xc494d13a  ! 1851: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
CHANGE_USER610:
	ta	T_CHANGE_NONPRIV
CHANGE_R26611:
	add	%r26,	%r27,	%r26
NC_BIS_PRI611:
	.word 0xd0f41c5a  ! 1853: STXA_R	stxa	%r8, [%r16 + %r26] 0xe2
CHANGE_PRIV612:
	ta	T_CHANGE_PRIV
CHANGE_R26613:
	add	%r26,	%r27,	%r26
CP_BIS_NUC613:
	and	%r26,	%r28,	%r26
	.word 0xccf504fa  ! 1855: STXA_R	stxa	%r6, [%r20 + %r26] 0x27
	.word 0xc4dc903a  ! 1857: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc49b901a  ! 1859: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc5a4903a  ! 1861: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc522a030  ! 1862: STF_I	st	%f2, [0x0030, %r10]
NC_BIS_AIUS614:
	.word 0xc8b7c57a  ! 1864: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
	.word 0xc4ea901a  ! 1865: LDSTUBA_R	ldstuba	%r2, [%r10 + %r26] 0x80
	.word 0xc484903a  ! 1867: LDUWA_R	lduwa	[%r18, %r26] 0x81, %r2
	.word 0xc4bad11a  ! 1868: STDA_R	stda	%r2, [%r11 + %r26] 0x88
	.word 0xc4d3901a  ! 1870: LDSHA_R	ldsha	[%r14, %r26] 0x80, %r2
CHANGE_USER615:
	ta	T_CHANGE_NONPRIV
CHANGE_R26616:
	add	%r26,	%r27,	%r26
CP_BIS_PRI616:
	and	%r26,	%r28,	%r26
	.word 0xc4ab1d5a  ! 1872: STBA_R	stba	%r2, [%r12 + %r26] 0xea
	.word 0xc4db901a  ! 1874: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc5a2901a  ! 1875: STFA_R	sta	%f2, [%r26, %r10]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP618:
	.word 0xc4de021a  ! 1877: LDXA_R	ldxa	[%r24, %r26] 0x10, %r2
	.word 0xc48c101a  ! 1879: LDUBA_R	lduba	[%r16, %r26] 0x80, %r2
	.word 0xc4db911a  ! 1881: LDXA_R	ldxa	[%r14, %r26] 0x88, %r2
CP_AIUP619:
	.word 0xc4a6021a  ! 1883: STWA_R	stwa	%r2, [%r24 + %r26] 0x10
	.word 0xc523401a  ! 1884: STF_R	st	%f2, [%r26, %r13]
CP_BIS_AIUS620:
	and	%r26,	%r28,	%r26
	.word 0xc8bf857a  ! 1886: STDA_R	stda	%r4, [%r30 + %r26] 0x2b
	.word 0xc4f2d11a  ! 1887: STXA_R	stxa	%r2, [%r11 + %r26] 0x88
	.word 0xc4b4d03a  ! 1889: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc59b505a  ! 1890: LDDFA_R	ldda	[%r13, %r26], %f2
CP_ATM_QUAD_LD621:
	and	%r26,	%r29,	%r26
	.word 0xcc9a859a  ! 1892: LDDA_R	ldda	[%r10, %r26] 0x2c, %r6
NC_AIUS622:
	.word 0xc487c23a  ! 1894: LDUWA_R	lduwa	[%r31, %r26] 0x11, %r2
CP_BIS_QUAD_LD623:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 1896: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
	.word 0xc4abd11a  ! 1898: STBA_R	stba	%r2, [%r15 + %r26] 0x88
	.word 0xc48cd03a  ! 1900: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
NC_BIS_AIUP624:
	.word 0xd0a6455a  ! 1902: STWA_R	stwa	%r8, [%r25 + %r26] 0x2a
	.word 0xc5a3501a  ! 1903: STFA_R	sta	%f2, [%r26, %r13]
	.word 0xc59cd03a  ! 1905: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc4cc903a  ! 1907: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CHANGE_USER625:
	ta	T_CHANGE_NONPRIV
CHANGE_R26626:
	mov	%g0,	%r26
CP_BIS_PRI626:
	and	%r26,	%r28,	%r26
	.word 0xc8aadc5a  ! 1909: STBA_R	stba	%r4, [%r11 + %r26] 0xe2
BLK_PRI627:
	and	%r26,	%r29,	%r26
	.word 0xc19a9e1a  ! 1911: LDDFA_R	ldda	[%r10, %r26], %f0
BLK_PRI628:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 1913: LDDFA_R	ldda	[%r12, %r26], %f0
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC630:
	.word 0xc495009a  ! 1915: LDUHA_R	lduha	[%r20, %r26] 0x04, %r2
	.word 0xc4d4501a  ! 1917: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r2
	.word 0xc51aa030  ! 1918: LDDF_I	ldd	[%r10, 0x0030], %f2
CP_BIS_QUAD_LD631:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 1920: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc5236030  ! 1921: STF_I	st	%f2, [0x0030, %r13]
	.word 0xc4a4d03a  ! 1923: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
NC_AIUP632:
	.word 0xc586421a  ! 1925: LDFA_R	lda	[%r25, %r26], %f2
NC_BIS_SEC633:
	.word 0xc8a4dc7a  ! 1927: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
NC_NUC634:
	.word 0xc585409a  ! 1929: LDFA_R	lda	[%r21, %r26], %f2
	.word 0xc5bcd13a  ! 1931: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4a4903a  ! 1933: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
SHORT_FP_PRI635:
	.word 0xc59b5b5a  ! 1935: LDDFA_R	ldda	[%r13, %r26], %f2
CHANGE_USER636:
	ta	T_CHANGE_NONPRIV
CHANGE_R26637:
	add	%r26,	%r27,	%r26
NC_BIS_PRI637:
	.word 0xc4f3dc5a  ! 1937: STXA_R	stxa	%r2, [%r15 + %r26] 0xe2
CHANGE_PRIV638:
	ta	T_CHANGE_PRIV
CHANGE_R26639:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS639:
	.word 0xc8b7c57a  ! 1939: STHA_R	stha	%r4, [%r31 + %r26] 0x2b
NC_BIS_AIUP640:
	.word 0xc8f6455a  ! 1941: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
NC_AIUP641:
	.word 0xc586421a  ! 1943: LDFA_R	lda	[%r25, %r26], %f2
NC_BIS_SEC642:
	.word 0xc8bcdd7a  ! 1945: STDA_R	stda	%r4, [%r19 + %r26] 0xeb
	.word 0xc4cc903a  ! 1947: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
CP_AIUP643:
	.word 0xc4be021a  ! 1949: STDA_R	stda	%r2, [%r24 + %r26] 0x10
	.word 0xc413001a  ! 1950: LDUH_R	lduh	[%r12 + %r26], %r2
	.word 0xc4532032  ! 1951: LDSH_I	ldsh	[%r12 + 0x0032], %r2
	.word 0xc47aa030  ! 1952: SWAP_I	swap	%r2, [%r10 + 0x0030]
NC_BIS_SEC644:
	.word 0xd0bcdc7a  ! 1954: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
	.word 0xc5a2911a  ! 1955: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc49b901a  ! 1957: LDDA_R	ldda	[%r14, %r26] 0x80, %r2
	.word 0xc5bcd13a  ! 1959: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc5a2d11a  ! 1960: STFA_R	sta	%f2, [%r26, %r11]
CP_NUC645:
	.word 0xc4d5019a  ! 1962: LDSHA_R	ldsha	[%r20, %r26] 0x0c, %r2
NC_BLK_SEc646:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 1964: LDDFA_R	ldda	[%r19, %r26], %f16
NC_AIUP647:
	.word 0xc4de431a  ! 1966: LDXA_R	ldxa	[%r25, %r26] 0x18, %r2
	.word 0xc59ad15a  ! 1967: LDDFA_R	ldda	[%r11, %r26], %f2
NC_AIUP648:
	.word 0xc486431a  ! 1969: LDUWA_R	lduwa	[%r25, %r26] 0x18, %r2
CHANGE_USER649:
	ta	T_CHANGE_NONPRIV
CHANGE_R26650:
	add	%r26,	%r27,	%r26
NC_BIS_PRI650:
	.word 0xc8bc1c5a  ! 1971: STDA_R	stda	%r4, [%r16 + %r26] 0xe2
CHANGE_PRIV651:
	ta	T_CHANGE_PRIV
CHANGE_R26652:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS652:
	.word 0xc4f7c57a  ! 1973: STXA_R	stxa	%r2, [%r31 + %r26] 0x2b
	.word 0xc582905a  ! 1974: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc432c01a  ! 1975: STH_R	sth	%r2, [%r11 + %r26]
WR_LEASI_653:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_654:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc494903a  ! 1978: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
	.word 0xc48cd13a  ! 1980: LDUBA_R	lduba	[%r19, %r26] 0x89, %r2
NC_BIS_AIUP655:
	.word 0xc4ae445a  ! 1982: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc4f4d03a  ! 1984: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc4b4d03a  ! 1986: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc4a3101a  ! 1987: STWA_R	stwa	%r2, [%r12 + %r26] 0x80
	.word 0xc483d11a  ! 1989: LDUWA_R	lduwa	[%r15, %r26] 0x88, %r2
SET_TL1_656:
	ta	T_CHANGE_TO_TL1
CHANGE_R26657:
	add	%r26,	%r27,	%r26
NC_BIS_NUC657:
	.word 0xd0ad45fa  ! 1991: STBA_R	stba	%r8, [%r21 + %r26] 0x2f
	.word 0xc4ab901a  ! 1993: STBA_R	stba	%r2, [%r14 + %r26] 0x80
	.word 0xc53b001a  ! 1994: STDF_R	std	%f2, [%r26, %r12]
CP_BIS_NUC658:
	and	%r26,	%r28,	%r26
	.word 0xc4bd04fa  ! 1996: STDA_R	stda	%r2, [%r20 + %r26] 0x27
CHANGE_R26659:
	add	%r26,	%r27,	%r26
CP_BIS_SEC659:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 1998: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
CP_BIS_NUC660:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2000: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc5bc501a  ! 2002: STDFA_R	stda	%f2, [%r26, %r17]
CHANGE_R26661:
	mov	%g0,	%r26
CP_BIS_SEC661:
	and	%r26,	%r28,	%r26
	.word 0xc8a49c7a  ! 2004: STWA_R	stwa	%r4, [%r18 + %r26] 0xe3
	.word 0xc51aa030  ! 2005: LDDF_I	ldd	[%r10, 0x0030], %f2
CP_BIS_NUC662:
	and	%r26,	%r28,	%r26
	.word 0xc49d05fa  ! 2007: LDDA_R	ldda	[%r20, %r26] 0x2f, %r2
NC_BIS_AIUS663:
	.word 0xd0bfc47a  ! 2009: STDA_R	stda	%r8, [%r31 + %r26] 0x23
NC_BIS_NUC664:
	.word 0xd0ad45fa  ! 2011: STBA_R	stba	%r8, [%r21 + %r26] 0x2f
CP_BIS_QUAD_LD665:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2013: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
CP_NUC666:
	.word 0xc48d009a  ! 2015: LDUBA_R	lduba	[%r20, %r26] 0x04, %r2
	.word 0xc4bcd13a  ! 2017: STDA_R	stda	%r2, [%r19 + %r26] 0x89
	.word 0xc584511a  ! 2019: LDFA_R	lda	[%r17, %r26], %f2
CP_AIUP667:
	.word 0xc586031a  ! 2021: LDFA_R	lda	[%r24, %r26], %f2
CHANGE_R26668:
	add	%r26,	%r27,	%r26
CP_BIS_SEC668:
	and	%r26,	%r28,	%r26
	.word 0xc4a49c7a  ! 2023: STWA_R	stwa	%r2, [%r18 + %r26] 0xe3
	.word 0xc45a801a  ! 2024: LDX_R	ldx	[%r10 + %r26], %r2
CP_BIS_QUAD_LD669:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2026: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
	.word 0xc4ea911a  ! 2027: LDSTUBA_R	ldstuba	%r2, [%r10 + %r26] 0x88
CP_AIUS670:
	.word 0xc59f823a  ! 2029: LDDFA_R	ldda	[%r30, %r26], %f2
	.word 0xc4a4d03a  ! 2031: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
CP_AIUP671:
	.word 0xc486021a  ! 2033: LDUWA_R	lduwa	[%r24, %r26] 0x10, %r2
NC_BIS_AIUP672:
	.word 0xc8a6445a  ! 2035: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
NC_AIUP673:
	.word 0xc4ae431a  ! 2037: STBA_R	stba	%r2, [%r25 + %r26] 0x18
CP_BIS_AIUP674:
	and	%r26,	%r28,	%r26
	.word 0xccb6045a  ! 2039: STHA_R	stha	%r6, [%r24 + %r26] 0x22
NC_AIUP675:
	.word 0xc4d6431a  ! 2041: LDSHA_R	ldsha	[%r25, %r26] 0x18, %r2
CP_ATM_QUAD_LD676:
	and	%r26,	%r29,	%r26
	.word 0xc49b049a  ! 2043: LDDA_R	ldda	[%r12, %r26] 0x24, %r2
CP_BIS_NUC677:
	and	%r26,	%r28,	%r26
	.word 0xc8b505fa  ! 2045: STHA_R	stha	%r4, [%r20 + %r26] 0x2f
NC_AIUS678:
	.word 0xc4f7c23a  ! 2047: STXA_R	stxa	%r2, [%r31 + %r26] 0x11
NC_AIUP679:
	.word 0xc49e421a  ! 2049: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
NC_BIS_AIUP680:
	.word 0xc8a6445a  ! 2051: STWA_R	stwa	%r4, [%r25 + %r26] 0x22
CP_BIS_AIUP681:
	and	%r26,	%r28,	%r26
	.word 0xc49e045a  ! 2053: LDDA_R	ldda	[%r24, %r26] 0x22, %r2
NC_PST_PRI682:
	.word 0xc5bb999a  ! 2055: STDFA_R	stda	%f2, [%r26, %r14]
CP_BIS_QUAD_LD683:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2057: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
	.word 0xc5bad01a  ! 2058: STDFA_R	stda	%f2, [%r26, %r11]
NC_BIS_AIUP684:
	.word 0xccb6445a  ! 2060: STHA_R	stha	%r6, [%r25 + %r26] 0x22
	.word 0xc4c4d03a  ! 2062: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
	.word 0xc59b911a  ! 2064: LDDFA_R	ldda	[%r14, %r26], %f2
CP_BIS_AIUS685:
	and	%r26,	%r28,	%r26
	.word 0xd09f857a  ! 2066: LDDA_R	ldda	[%r30, %r26] 0x2b, %r8
CP_BIS_AIUS686:
	and	%r26,	%r28,	%r26
	.word 0xc8af857a  ! 2068: STBA_R	stba	%r4, [%r30 + %r26] 0x2b
	.word 0xc483505a  ! 2069: LDUWA_R	lduwa	[%r13, %r26] 0x82, %r2
NC_BIS_NUC687:
	.word 0xccf545fa  ! 2071: STXA_R	stxa	%r6, [%r21 + %r26] 0x2f
CP_BIS_NUC688:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2073: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
CP_PST_PRI689:
	.word 0xc5ba981a  ! 2075: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc494903a  ! 2077: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
CP_ATM_QUAD_LD690:
	and	%r26,	%r29,	%r26
	.word 0xcc9b049a  ! 2079: LDDA_R	ldda	[%r12, %r26] 0x24, %r6
	.word 0xc4eb101a  ! 2080: LDSTUBA_R	ldstuba	%r2, [%r12 + %r26] 0x80
	.word 0xc4bcd03a  ! 2082: STDA_R	stda	%r2, [%r19 + %r26] 0x81
	.word 0xc4a4903a  ! 2084: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_BIS_AIUP691:
	.word 0xc4ae445a  ! 2086: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc4ab911a  ! 2088: STBA_R	stba	%r2, [%r14 + %r26] 0x88
	.word 0xc5a2d11a  ! 2089: STFA_R	sta	%f2, [%r26, %r11]
	.word 0xc48c913a  ! 2091: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
CP_BIS_QUAD_LD692:
	and	%r26,	%r29,	%r26
	.word 0xcc9a9c5a  ! 2093: LDDA_R	ldda	[%r10, %r26] 0xe2, %r6
CP_BIS_AIUS693:
	and	%r26,	%r28,	%r26
	.word 0xc4b7847a  ! 2095: STHA_R	stha	%r2, [%r30 + %r26] 0x23
	.word 0xc4dc913a  ! 2097: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
SET_TL0_694:
	ta	T_CHANGE_TO_TL0
WR_LEASI_695:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_696:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4d4d13a  ! 2100: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS698:
	.word 0xc487c33a  ! 2102: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r2
	.word 0xc43b2030  ! 2103: STD_I	std	%r2, [%r12 + 0x0030]
NC_PST_PRI699:
	.word 0xc5bbd89a  ! 2105: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc44b401a  ! 2106: LDSB_R	ldsb	[%r13 + %r26], %r2
CHANGE_USER700:
	ta	T_CHANGE_NONPRIV
CHANGE_R26701:
	add	%r26,	%r27,	%r26
NC_BIS_PRI701:
	.word 0xccb41c5a  ! 2108: STHA_R	stha	%r6, [%r16 + %r26] 0xe2
SHORT_FP_PRI702:
	.word 0xc5ba9b5a  ! 2110: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc59b111a  ! 2111: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc5a4903a  ! 2113: STFA_R	sta	%f2, [%r26, %r18]
CHANGE_R26703:
	add	%r26,	%r27,	%r26
CP_BIS_SEC703:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2115: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
CP_BIS_QUAD_LD704:
	and	%r26,	%r29,	%r26
	.word 0xc49b1c5a  ! 2117: LDDA_R	ldda	[%r12, %r26] 0xe2, %r2
	.word 0xc502c01a  ! 2118: LDF_R	ld	[%r11, %r26], %f2
	.word 0xc4c2911a  ! 2119: LDSWA_R	ldswa	[%r10, %r26] 0x88, %r2
	.word 0xc493d11a  ! 2121: LDUHA_R	lduha	[%r15, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC706:
	.word 0xc48d409a  ! 2123: LDUBA_R	lduba	[%r21, %r26] 0x04, %r2
NC_NUC707:
	.word 0xc4bd409a  ! 2125: STDA_R	stda	%r2, [%r21 + %r26] 0x04
	.word 0xc4d4903a  ! 2127: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
	.word 0xc5bcd03a  ! 2129: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc48c903a  ! 2131: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
SET_TL1_708:
	ta	T_CHANGE_TO_TL1
CHANGE_R26709:
	add	%r26,	%r27,	%r26
NC_BIS_NUC709:
	.word 0xc8ad44fa  ! 2133: STBA_R	stba	%r4, [%r21 + %r26] 0x27
	.word 0xc4a4913a  ! 2135: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
CP_AIUS710:
	.word 0xc4df823a  ! 2137: LDXA_R	ldxa	[%r30, %r26] 0x11, %r2
	.word 0xc494d03a  ! 2139: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
NC_AIUS711:
	.word 0xc587c33a  ! 2141: LDFA_R	lda	[%r31, %r26], %f2
NC_BIS_NUC712:
	.word 0xc4f544fa  ! 2143: STXA_R	stxa	%r2, [%r21 + %r26] 0x27
	.word 0xc4c3101a  ! 2144: LDSWA_R	ldswa	[%r12, %r26] 0x80, %r2
	.word 0xc5a2911a  ! 2145: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc47ae030  ! 2146: SWAP_I	swap	%r2, [%r11 + 0x0030]
	.word 0xc4c4903a  ! 2148: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
	.word 0xc4d4d03a  ! 2150: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
CP_PST_PRI713:
	.word 0xc5ba981a  ! 2152: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc442e030  ! 2153: LDSW_I	ldsw	[%r11 + 0x0030], %r2
CHANGE_R26714:
	add	%r26,	%r27,	%r26
CP_BIS_SEC714:
	and	%r26,	%r28,	%r26
	.word 0xcca49d7a  ! 2155: STWA_R	stwa	%r6, [%r18 + %r26] 0xeb
CP_BIS_AIUP715:
	and	%r26,	%r28,	%r26
	.word 0xcc9e045a  ! 2157: LDDA_R	ldda	[%r24, %r26] 0x22, %r6
	.word 0xc582915a  ! 2158: LDFA_R	lda	[%r10, %r26], %f2
NC_SHORT_FP_SEC716:
	.word 0xc59cda3a  ! 2160: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc47b001a  ! 2161: SWAP_R	swap	%r2, [%r12 + %r26]
NC_AIUS717:
	.word 0xc487c33a  ! 2163: LDUWA_R	lduwa	[%r31, %r26] 0x19, %r2
NC_BIS_AIUS718:
	.word 0xd0f7c47a  ! 2165: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xc4b4d03a  ! 2167: STHA_R	stha	%r2, [%r19 + %r26] 0x81
CP_BIS_NUC719:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2169: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc4c4101a  ! 2171: LDSWA_R	ldswa	[%r16, %r26] 0x80, %r2
	.word 0xc4536032  ! 2172: LDSH_I	ldsh	[%r13 + 0x0032], %r2
CHANGE_R26720:
	mov	%g0,	%r26
CP_BIS_SEC720:
	and	%r26,	%r28,	%r26
	.word 0xccbc9d7a  ! 2174: STDA_R	stda	%r6, [%r18 + %r26] 0xeb
NC_BIS_NUC721:
	.word 0xccbd44fa  ! 2176: STDA_R	stda	%r6, [%r21 + %r26] 0x27
NC_AIUP722:
	.word 0xc4de421a  ! 2178: LDXA_R	ldxa	[%r25, %r26] 0x10, %r2
CP_NUC723:
	.word 0xc49d019a  ! 2180: LDDA_R	ldda	[%r20, %r26] 0x0c, %r2
SET_TL0_724:
	ta	T_CHANGE_TO_TL0
CHANGE_R26725:
	add	%r26,	%r27,	%r26
NC_BIS_SEC725:
	.word 0xcca4dc7a  ! 2182: STWA_R	stwa	%r6, [%r19 + %r26] 0xe3
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC727:
	.word 0xc4ed009a  ! 2184: LDSTUBA_R	ldstuba	%r2, [%r20 + %r26] 0x04
	.word 0xc59cd03a  ! 2186: LDDFA_R	ldda	[%r19, %r26], %f2
CP_BIS_NUC728:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 2188: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
	.word 0xc5a2911a  ! 2189: STFA_R	sta	%f2, [%r26, %r10]
SET_TL1_729:
	ta	T_CHANGE_TO_TL1
CHANGE_R26730:
	add	%r26,	%r27,	%r26
NC_BIS_NUC730:
	.word 0xc4ad44fa  ! 2191: STBA_R	stba	%r2, [%r21 + %r26] 0x27
SET_TL0_731:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI732:
	and	%r26,	%r28,	%r26
	.word 0xc8badc5a  ! 2193: STDA_R	stda	%r4, [%r11 + %r26] 0xe2
	.word 0xc4dcd03a  ! 2195: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
	.word 0xc412a032  ! 2196: LDUH_I	lduh	[%r10 + 0x0032], %r2
CP_BIS_PRI733:
	and	%r26,	%r28,	%r26
	.word 0xd0b31c5a  ! 2198: STHA_R	stha	%r8, [%r12 + %r26] 0xe2
CHANGE_PRIV734:
	ta	T_CHANGE_PRIV
CHANGE_R26735:
	add	%r26,	%r27,	%r26
CP_BIS_NUC735:
	and	%r26,	%r28,	%r26
	.word 0xc4b504fa  ! 2200: STHA_R	stha	%r2, [%r20 + %r26] 0x27
CHANGE_USER736:
	ta	T_CHANGE_NONPRIV
CHANGE_R26737:
	add	%r26,	%r27,	%r26
CP_BIS_PRI737:
	and	%r26,	%r28,	%r26
	.word 0xccb29c5a  ! 2202: STHA_R	stha	%r6, [%r10 + %r26] 0xe2
	.word 0xc4a4903a  ! 2204: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
NC_PST_PRI738:
	.word 0xc5bbd81a  ! 2206: STDFA_R	stda	%f2, [%r26, %r15]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_NUC740:
	.word 0xc4b5409a  ! 2208: STHA_R	stha	%r2, [%r21 + %r26] 0x04
	.word 0xc4d4d03a  ! 2210: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc4cc903a  ! 2212: LDSBA_R	ldsba	[%r18, %r26] 0x81, %r2
NC_AIUS741:
	.word 0xc4c7c33a  ! 2214: LDSWA_R	ldswa	[%r31, %r26] 0x19, %r2
NC_AIUS742:
	.word 0xc4dfc33a  ! 2216: LDXA_R	ldxa	[%r31, %r26] 0x19, %r2
CP_BIS_NUC743:
	and	%r26,	%r28,	%r26
	.word 0xd0bd04fa  ! 2218: STDA_R	stda	%r8, [%r20 + %r26] 0x27
	.word 0xc5a3901a  ! 2220: STFA_R	sta	%f2, [%r26, %r14]
	.word 0xc582901a  ! 2221: LDFA_R	lda	[%r10, %r26], %f2
	.word 0xc4c4d03a  ! 2223: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
CP_AIUS744:
	.word 0xc4df823a  ! 2225: LDXA_R	ldxa	[%r30, %r26] 0x11, %r2
NC_BIS_AIUP745:
	.word 0xc8f6455a  ! 2227: STXA_R	stxa	%r4, [%r25 + %r26] 0x2a
NC_NUC746:
	.word 0xc59d419a  ! 2229: LDDFA_R	ldda	[%r21, %r26], %f2
CP_AIUS747:
	.word 0xc48f823a  ! 2231: LDUBA_R	lduba	[%r30, %r26] 0x11, %r2
NC_BIS_SEC748:
	.word 0xc4a4dc7a  ! 2233: STWA_R	stwa	%r2, [%r19 + %r26] 0xe3
	.word 0xc53b2030  ! 2234: STDF_I	std	%f2, [0x0030, %r12]
CHANGE_USER749:
	ta	T_CHANGE_NONPRIV
CHANGE_R26750:
	add	%r26,	%r27,	%r26
CP_BIS_PRI750:
	and	%r26,	%r28,	%r26
	.word 0xc8b2dc5a  ! 2236: STHA_R	stha	%r4, [%r11 + %r26] 0xe2
	.word 0xc40b2033  ! 2237: LDUB_I	ldub	[%r12 + 0x0033], %r2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_AIUS752:
	.word 0xc4f7823a  ! 2239: STXA_R	stxa	%r2, [%r30 + %r26] 0x11
	.word 0xc582905a  ! 2240: LDFA_R	lda	[%r10, %r26], %f2
NC_AIUP753:
	.word 0xc49e421a  ! 2242: LDDA_R	ldda	[%r25, %r26] 0x10, %r2
CHANGE_USER754:
	ta	T_CHANGE_NONPRIV
CHANGE_R26755:
	add	%r26,	%r27,	%r26
NC_BIS_PRI755:
	.word 0xc4bb9c5a  ! 2244: STDA_R	stda	%r2, [%r14 + %r26] 0xe2
CP_PST_PRI756:
	.word 0xc5bb191a  ! 2246: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc47ac01a  ! 2247: SWAP_R	swap	%r2, [%r11 + %r26]
	.word 0xc48a905a  ! 2248: LDUBA_R	lduba	[%r10, %r26] 0x82, %r2
NC_BIS_SEC757:
	.word 0xccb4dc7a  ! 2250: STHA_R	stha	%r6, [%r19 + %r26] 0xe3
NC_SHORT_FP_SEC758:
	.word 0xc5bcdb7a  ! 2252: STDFA_R	stda	%f2, [%r26, %r19]
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUS760:
	.word 0xc587823a  ! 2254: LDFA_R	lda	[%r30, %r26], %f2
	.word 0xc4f2901a  ! 2255: STXA_R	stxa	%r2, [%r10 + %r26] 0x80
NC_BIS_AIUS761:
	.word 0xccafc47a  ! 2257: STBA_R	stba	%r6, [%r31 + %r26] 0x23
NC_BIS_AIUP762:
	.word 0xc4be445a  ! 2259: STDA_R	stda	%r2, [%r25 + %r26] 0x22
CP_PST_PRI763:
	.word 0xc5ba989a  ! 2261: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc48cd13a  ! 2263: LDUBA_R	lduba	[%r19, %r26] 0x89, %r2
NC_BIS_AIUP764:
	.word 0xc8ae445a  ! 2265: STBA_R	stba	%r4, [%r25 + %r26] 0x22
	.word 0xc49c903a  ! 2267: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc433001a  ! 2268: STH_R	sth	%r2, [%r12 + %r26]
	.word 0xc4bc913a  ! 2270: STDA_R	stda	%r2, [%r18 + %r26] 0x89
	.word 0xc53a801a  ! 2271: STDF_R	std	%f2, [%r26, %r10]
	.word 0xc4cc101a  ! 2273: LDSBA_R	ldsba	[%r16, %r26] 0x80, %r2
WR_LEASI_765:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_766:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_AIUP767:
	.word 0xc4f6021a  ! 2276: STXA_R	stxa	%r2, [%r24 + %r26] 0x10
	.word 0xc5a4903a  ! 2278: STFA_R	sta	%f2, [%r26, %r18]
CP_BIS_NUC768:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2280: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc59cd13a  ! 2282: LDDFA_R	ldda	[%r19, %r26], %f2
CHANGE_TLE769:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc59c903a  ! 2285: LDDFA_R	ldda	[%r18, %r26], %f2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP771:
	.word 0xc496031a  ! 2287: LDUHA_R	lduha	[%r24, %r26] 0x18, %r2
NC_BLK_SEc772:
	and	%r26,	%r29,	%r26
	.word 0xc19cdf3a  ! 2289: LDDFA_R	ldda	[%r19, %r26], %f0
	.word 0xc5bcd13a  ! 2291: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4232030  ! 2292: STW_I	stw	%r2, [%r12 + 0x0030]
CP_PST_PRI773:
	.word 0xc5bb181a  ! 2294: STDFA_R	stda	%f2, [%r26, %r12]
CP_AIUP774:
	.word 0xc4a6021a  ! 2296: STWA_R	stwa	%r2, [%r24 + %r26] 0x10
	.word 0xc4bcd13a  ! 2298: STDA_R	stda	%r2, [%r19 + %r26] 0x89
CP_AIUP775:
	.word 0xc586031a  ! 2300: LDFA_R	lda	[%r24, %r26], %f2
	.word 0xc4c4d13a  ! 2302: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
NC_NUC776:
	.word 0xc49d409a  ! 2304: LDDA_R	ldda	[%r21, %r26] 0x04, %r2
CP_PST_PRI777:
	.word 0xc5ba991a  ! 2306: STDFA_R	stda	%f2, [%r26, %r10]
SHORT_FP_PRI778:
	.word 0xc59a9a5a  ! 2308: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc494d03a  ! 2310: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	.word 0xc4d4903a  ! 2312: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
CHANGE_R26779:
	add	%r26,	%r27,	%r26
CP_BIS_SEC779:
	and	%r26,	%r28,	%r26
	.word 0xc4f49d7a  ! 2314: STXA_R	stxa	%r2, [%r18 + %r26] 0xeb
	.word 0xc4c4d03a  ! 2316: LDSWA_R	ldswa	[%r19, %r26] 0x81, %r2
CHANGE_R26780:
	add	%r26,	%r27,	%r26
CP_BIS_SEC780:
	and	%r26,	%r28,	%r26
	.word 0xc4ac9c7a  ! 2318: STBA_R	stba	%r2, [%r18 + %r26] 0xe3
NC_AIUP781:
	.word 0xc4f6421a  ! 2320: STXA_R	stxa	%r2, [%r25 + %r26] 0x10
NC_NUC782:
	.word 0xc5a5409a  ! 2322: STFA_R	sta	%f2, [%r26, %r21]
	.word 0xc4d4d03a  ! 2324: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc503001a  ! 2325: LDF_R	ld	[%r12, %r26], %f2
	.word 0xc47ac01a  ! 2326: SWAP_R	swap	%r2, [%r11 + %r26]
	.word 0xc4bcd03a  ! 2328: STDA_R	stda	%r2, [%r19 + %r26] 0x81
CHANGE_USER783:
	ta	T_CHANGE_NONPRIV
CHANGE_R26784:
	add	%r26,	%r27,	%r26
NC_BIS_PRI784:
	.word 0xd0bb9c5a  ! 2330: STDA_R	stda	%r8, [%r14 + %r26] 0xe2
NC_SHORT_FP_SEC785:
	.word 0xc59cdb3a  ! 2332: LDDFA_R	ldda	[%r19, %r26], %f2
CP_BIS_PRI786:
	and	%r26,	%r28,	%r26
	.word 0xc8a35d5a  ! 2334: STWA_R	stwa	%r4, [%r13 + %r26] 0xea
BLK_PRI787:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2336: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc4a4d03a  ! 2338: STWA_R	stwa	%r2, [%r19 + %r26] 0x81
	.word 0xc5a4903a  ! 2340: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc4c4903a  ! 2342: LDSWA_R	ldswa	[%r18, %r26] 0x81, %r2
	.word 0xc4ccd03a  ! 2344: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc584501a  ! 2346: LDFA_R	lda	[%r17, %r26], %f2
	.word 0xc584903a  ! 2348: LDFA_R	lda	[%r18, %r26], %f2
CHANGE_PRIV788:
	ta	T_CHANGE_PRIV
CHANGE_R26789:
	add	%r26,	%r27,	%r26
CP_ATM_QUAD_LD789:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2350: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
	.word 0xc4ac913a  ! 2352: STBA_R	stba	%r2, [%r18 + %r26] 0x89
	.word 0xc4fb501a  ! 2353: SWAPA_R	swapa	%r2, [%r13 + %r26] 0x80
NC_PST_PRI790:
	.word 0xc5bc199a  ! 2355: STDFA_R	stda	%f2, [%r26, %r16]
BLK_PRI791:
	and	%r26,	%r29,	%r26
	.word 0xe1bade1a  ! 2357: STDFA_R	stda	%f16, [%r26, %r11]
NC_BIS_AIUS792:
	.word 0xc4bfc47a  ! 2359: STDA_R	stda	%r2, [%r31 + %r26] 0x23
	.word 0xc43a801a  ! 2360: STD_R	std	%r2, [%r10 + %r26]
	.word 0xc484913a  ! 2362: LDUWA_R	lduwa	[%r18, %r26] 0x89, %r2
CP_AIUS793:
	.word 0xc4c7833a  ! 2364: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r2
NC_BIS_AIUS794:
	.word 0xc4bfc47a  ! 2366: STDA_R	stda	%r2, [%r31 + %r26] 0x23
NC_BIS_AIUP795:
	.word 0xc4be445a  ! 2368: STDA_R	stda	%r2, [%r25 + %r26] 0x22
NC_AIUS796:
	.word 0xc497c33a  ! 2370: LDUHA_R	lduha	[%r31, %r26] 0x19, %r2
NC_BIS_SEC797:
	.word 0xc4bcdc7a  ! 2372: STDA_R	stda	%r2, [%r19 + %r26] 0xe3
CP_AIUS798:
	.word 0xc4c7833a  ! 2374: LDSWA_R	ldswa	[%r30, %r26] 0x19, %r2
	.word 0xc4432030  ! 2375: LDSW_I	ldsw	[%r12 + 0x0030], %r2
CP_BIS_NUC799:
	and	%r26,	%r28,	%r26
	.word 0xccf505fa  ! 2377: STXA_R	stxa	%r6, [%r20 + %r26] 0x2f
	.word 0xc46b6033  ! 2378: LDSTUB_I	ldstub	%r2, [%r13 + 0x0033]
CP_NUC800:
	.word 0xc4b5009a  ! 2380: STHA_R	stha	%r2, [%r20 + %r26] 0x04
	.word 0xc48a911a  ! 2381: LDUBA_R	lduba	[%r10, %r26] 0x88, %r2
	.word 0xc584d03a  ! 2383: LDFA_R	lda	[%r19, %r26], %f2
	.word 0xc59ad05a  ! 2384: LDDFA_R	ldda	[%r11, %r26], %f2
	.word 0xc49b505a  ! 2385: LDDA_R	ldda	[%r13, %r26] 0x82, %r2
CP_AIUS801:
	.word 0xc4d7823a  ! 2387: LDSHA_R	ldsha	[%r30, %r26] 0x11, %r2
CP_ATM_QUAD_LD802:
	and	%r26,	%r29,	%r26
	.word 0xd09a849a  ! 2389: LDDA_R	ldda	[%r10, %r26] 0x24, %r8
CP_BIS_NUC803:
	and	%r26,	%r28,	%r26
	.word 0xccbd04fa  ! 2391: STDA_R	stda	%r6, [%r20 + %r26] 0x27
NC_BIS_AIUS804:
	.word 0xccbfc47a  ! 2393: STDA_R	stda	%r6, [%r31 + %r26] 0x23
	.word 0xc494d03a  ! 2395: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
NC_NUC805:
	.word 0xc4cd409a  ! 2397: LDSBA_R	ldsba	[%r21, %r26] 0x04, %r2
	.word 0xc4db901a  ! 2399: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc484101a  ! 2401: LDUWA_R	lduwa	[%r16, %r26] 0x80, %r2
SHORT_FP_PRI806:
	.word 0xc5bb5a5a  ! 2403: STDFA_R	stda	%f2, [%r26, %r13]
CP_PST_PRI807:
	.word 0xc5bb585a  ! 2405: STDFA_R	stda	%f2, [%r26, %r13]
CP_BIS_QUAD_LD808:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2407: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CP_BIS_QUAD_LD809:
	and	%r26,	%r29,	%r26
	.word 0xcc9adc5a  ! 2409: LDDA_R	ldda	[%r11, %r26] 0xe2, %r6
	.word 0xc46b2033  ! 2410: LDSTUB_I	ldstub	%r2, [%r12 + 0x0033]
CP_AIUS810:
	.word 0xc587833a  ! 2412: LDFA_R	lda	[%r30, %r26], %f2
CP_AIUP811:
	.word 0xc4be031a  ! 2414: STDA_R	stda	%r2, [%r24 + %r26] 0x18
	.word 0xc4a4d13a  ! 2416: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
CP_AIUS812:
	.word 0xc49f833a  ! 2418: LDDA_R	ldda	[%r30, %r26] 0x19, %r2
CP_BIS_AIUP813:
	and	%r26,	%r28,	%r26
	.word 0xd0be055a  ! 2420: STDA_R	stda	%r8, [%r24 + %r26] 0x2a
NC_PST_PRI814:
	.word 0xc5bb995a  ! 2422: STDFA_R	stda	%f2, [%r26, %r14]
CHANGE_USER815:
	ta	T_CHANGE_NONPRIV
CHANGE_R26816:
	mov	%g0,	%r26
NC_BIS_PRI816:
	.word 0xc4ab9d5a  ! 2424: STBA_R	stba	%r2, [%r14 + %r26] 0xea
CHANGE_PRIV817:
	ta	T_CHANGE_PRIV
CHANGE_R26818:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP818:
	.word 0xc4b6445a  ! 2426: STHA_R	stha	%r2, [%r25 + %r26] 0x22
BLK_PRI819:
	and	%r26,	%r29,	%r26
	.word 0xe19b1e1a  ! 2428: LDDFA_R	ldda	[%r12, %r26], %f16
	.word 0xc4c4d13a  ! 2430: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc5bc913a  ! 2432: STDFA_R	stda	%f2, [%r26, %r18]
CHANGE_TLE820:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_AIUP822:
	.word 0xc48e021a  ! 2435: LDUBA_R	lduba	[%r24, %r26] 0x10, %r2
NC_PST_PRI823:
	.word 0xc5bbd81a  ! 2437: STDFA_R	stda	%f2, [%r26, %r15]
NC_PST_PRI824:
	.word 0xc5bc585a  ! 2439: STDFA_R	stda	%f2, [%r26, %r17]
NC_BIS_AIUP825:
	.word 0xccbe455a  ! 2441: STDA_R	stda	%r6, [%r25 + %r26] 0x2a
SHORT_FP_PRI826:
	.word 0xc59a9a1a  ! 2443: LDDFA_R	ldda	[%r10, %r26], %f2
	.word 0xc494501a  ! 2445: LDUHA_R	lduha	[%r17, %r26] 0x80, %r2
NC_BLK_SEc827:
	and	%r26,	%r29,	%r26
	.word 0xe19cdf3a  ! 2447: LDDFA_R	ldda	[%r19, %r26], %f16
NC_NUC828:
	.word 0xc4ad409a  ! 2449: STBA_R	stba	%r2, [%r21 + %r26] 0x04
	.word 0xc502e030  ! 2450: LDF_I	ld	[%r11, 0x0030], %f2
	.word 0xc4d4d13a  ! 2452: LDSHA_R	ldsha	[%r19, %r26] 0x89, %r2
CP_BIS_AIUS829:
	and	%r26,	%r28,	%r26
	.word 0xc4f7857a  ! 2454: STXA_R	stxa	%r2, [%r30 + %r26] 0x2b
CP_NUC830:
	.word 0xc585009a  ! 2456: LDFA_R	lda	[%r20, %r26], %f2
	.word 0xc4c4913a  ! 2458: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
NC_BIS_AIUS831:
	.word 0xd0bfc47a  ! 2460: STDA_R	stda	%r8, [%r31 + %r26] 0x23
	.word 0xc584903a  ! 2462: LDFA_R	lda	[%r18, %r26], %f2
NC_BIS_AIUS832:
	.word 0xcca7c47a  ! 2464: STWA_R	stwa	%r6, [%r31 + %r26] 0x23
	.word 0xc4ac101a  ! 2466: STBA_R	stba	%r2, [%r16 + %r26] 0x80
CP_BIS_AIUS833:
	and	%r26,	%r28,	%r26
	.word 0xc8a7847a  ! 2468: STWA_R	stwa	%r4, [%r30 + %r26] 0x23
WR_LEASI_834:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_835:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc46b401a  ! 2470: LDSTUB_R	ldstub	%r2, [%r13 + %r26]
	.word 0xc4db901a  ! 2472: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc46aa033  ! 2473: LDSTUB_I	ldstub	%r2, [%r10 + 0x0033]
CP_BIS_NUC836:
	and	%r26,	%r28,	%r26
	.word 0xcc9d04fa  ! 2475: LDDA_R	ldda	[%r20, %r26] 0x27, %r6
	.word 0xc4b3501a  ! 2476: STHA_R	stha	%r2, [%r13 + %r26] 0x80
	.word 0xc46b6033  ! 2477: LDSTUB_I	ldstub	%r2, [%r13 + 0x0033]
NC_BLK_SEc837:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2479: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc59c101a  ! 2481: LDDFA_R	ldda	[%r16, %r26], %f2
CP_NUC838:
	.word 0xc5e5201a  ! 2483: CASA_R	casa	[%r20] %asi, %r26, %r2
	.word 0xc4a4913a  ! 2485: STWA_R	stwa	%r2, [%r18 + %r26] 0x89
	.word 0xc49c101a  ! 2487: LDDA_R	ldda	[%r16, %r26] 0x80, %r2
CP_NUC839:
	.word 0xc4ad019a  ! 2489: STBA_R	stba	%r2, [%r20 + %r26] 0x0c
CP_PST_PRI840:
	.word 0xc5bb589a  ! 2491: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc4dc913a  ! 2493: LDXA_R	ldxa	[%r18, %r26] 0x89, %r2
NC_AIUS841:
	.word 0xc4b7c23a  ! 2495: STHA_R	stha	%r2, [%r31 + %r26] 0x11
	.word 0xc5e3201a  ! 2496: CASA_R	casa	[%r12] %asi, %r26, %r2
CP_BIS_AIUS842:
	and	%r26,	%r28,	%r26
	.word 0xd0b7847a  ! 2498: STHA_R	stha	%r8, [%r30 + %r26] 0x23
CP_ATM_QUAD_LD843:
	and	%r26,	%r29,	%r26
	.word 0xc49a849a  ! 2500: LDDA_R	ldda	[%r10, %r26] 0x24, %r2
CP_AIUS844:
	.word 0xc587833a  ! 2502: LDFA_R	lda	[%r30, %r26], %f2
NC_BIS_AIUS845:
	.word 0xc8bfc57a  ! 2504: STDA_R	stda	%r4, [%r31 + %r26] 0x2b
	.word 0xc584d03a  ! 2506: LDFA_R	lda	[%r19, %r26], %f2
CP_AIUP846:
	.word 0xc4f6021a  ! 2508: STXA_R	stxa	%r2, [%r24 + %r26] 0x10
SHORT_FP_PRI847:
	.word 0xc59b5b5a  ! 2510: LDDFA_R	ldda	[%r13, %r26], %f2
CHANGE_CLE848:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc502e030  ! 2512: LDF_I	ld	[%r11, 0x0030], %f2
	.word 0xc484d03a  ! 2514: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc4c2901a  ! 2515: LDSWA_R	ldswa	[%r10, %r26] 0x80, %r2
	.word 0xc582d01a  ! 2516: LDFA_R	lda	[%r11, %r26], %f2
	.word 0xc4a4903a  ! 2518: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
CP_NUC850:
	.word 0xc585009a  ! 2520: LDFA_R	lda	[%r20, %r26], %f2
	.word 0xc47b401a  ! 2521: SWAP_R	swap	%r2, [%r13 + %r26]
BLK_PRI851:
	and	%r26,	%r29,	%r26
	.word 0xe1badf1a  ! 2523: STDFA_R	stda	%f16, [%r26, %r11]
	.word 0xc4b3901a  ! 2525: STHA_R	stha	%r2, [%r14 + %r26] 0x80
	.word 0xc4c4501a  ! 2527: LDSWA_R	ldswa	[%r17, %r26] 0x80, %r2
NC_AIUS852:
	.word 0xc49fc23a  ! 2529: LDDA_R	ldda	[%r31, %r26] 0x11, %r2
	.word 0xc51a801a  ! 2530: LDDF_R	ldd	[%r10, %r26], %f2
	.word 0xc48c903a  ! 2532: LDUBA_R	lduba	[%r18, %r26] 0x81, %r2
	.word 0xc5bcd03a  ! 2534: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc5e2a01a  ! 2535: CASA_R	casa	[%r10] %asi, %r26, %r2
NC_AIUP853:
	.word 0xc4d6421a  ! 2537: LDSHA_R	ldsha	[%r25, %r26] 0x10, %r2
	.word 0xc4dc903a  ! 2539: LDXA_R	ldxa	[%r18, %r26] 0x81, %r2
	.word 0xc5036030  ! 2540: LDF_I	ld	[%r13, 0x0030], %f2
NC_AIUS854:
	.word 0xc4d7c23a  ! 2542: LDSHA_R	ldsha	[%r31, %r26] 0x11, %r2
CHANGE_R26855:
	add	%r26,	%r27,	%r26
CP_BIS_SEC855:
	and	%r26,	%r28,	%r26
	.word 0xc8f49c7a  ! 2544: STXA_R	stxa	%r4, [%r18 + %r26] 0xe3
	.word 0xc523001a  ! 2545: STF_R	st	%f2, [%r26, %r12]
	.word 0xc4d4903a  ! 2547: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
CP_BIS_NUC856:
	and	%r26,	%r28,	%r26
	.word 0xc4a504fa  ! 2549: STWA_R	stwa	%r2, [%r20 + %r26] 0x27
	.word 0xc484d03a  ! 2551: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc582911a  ! 2552: LDFA_R	lda	[%r10, %r26], %f2
NC_BIS_SEC857:
	.word 0xd0bcdc7a  ! 2554: STDA_R	stda	%r8, [%r19 + %r26] 0xe3
CP_BIS_QUAD_LD858:
	and	%r26,	%r29,	%r26
	.word 0xd09a9c5a  ! 2556: LDDA_R	ldda	[%r10, %r26] 0xe2, %r8
	.word 0xc432a032  ! 2557: STH_I	sth	%r2, [%r10 + 0x0032]
CP_AIUP859:
	.word 0xc4ce021a  ! 2559: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r2
	.word 0xc493901a  ! 2561: LDUHA_R	lduha	[%r14, %r26] 0x80, %r2
CP_AIUP860:
	.word 0xc4ce031a  ! 2563: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r2
	.word 0xc4c4d13a  ! 2565: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc48cd13a  ! 2567: LDUBA_R	lduba	[%r19, %r26] 0x89, %r2
	.word 0xc4eb501a  ! 2568: LDSTUBA_R	ldstuba	%r2, [%r13 + %r26] 0x80
	.word 0xc4bc913a  ! 2570: STDA_R	stda	%r2, [%r18 + %r26] 0x89
	.word 0xc4da901a  ! 2571: LDXA_R	ldxa	[%r10, %r26] 0x80, %r2
NC_BIS_AIUP861:
	.word 0xc4ae445a  ! 2573: STBA_R	stba	%r2, [%r25 + %r26] 0x22
	.word 0xc48cd03a  ! 2575: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
BLK_PRI862:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2577: LDDFA_R	ldda	[%r12, %r26], %f0
	.word 0xc4b4d03a  ! 2579: STHA_R	stha	%r2, [%r19 + %r26] 0x81
NC_BIS_SEC863:
	.word 0xc4bcdd7a  ! 2581: STDA_R	stda	%r2, [%r19 + %r26] 0xeb
SET_TL1_864:
	ta	T_CHANGE_TO_TL1
CHANGE_R26865:
	add	%r26,	%r27,	%r26
NC_BIS_NUC865:
	.word 0xc8b544fa  ! 2583: STHA_R	stha	%r4, [%r21 + %r26] 0x27
NC_NUC866:
	.word 0xc49d419a  ! 2585: LDDA_R	ldda	[%r21, %r26] 0x0c, %r2
NC_PST_PRI867:
	.word 0xc5bbd95a  ! 2587: STDFA_R	stda	%f2, [%r26, %r15]
	.word 0xc46a801a  ! 2588: LDSTUB_R	ldstub	%r2, [%r10 + %r26]
	.word 0xc494d13a  ! 2590: LDUHA_R	lduha	[%r19, %r26] 0x89, %r2
	.word 0xc4d4d03a  ! 2592: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
	.word 0xc5bc111a  ! 2594: STDFA_R	stda	%f2, [%r26, %r16]
SET_TL0_868:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI869:
	.word 0xc8bc5c5a  ! 2596: STDA_R	stda	%r4, [%r17 + %r26] 0xe2
CHANGE_PRIV870:
	ta	T_CHANGE_PRIV
CHANGE_R26871:
	add	%r26,	%r27,	%r26
NC_BIS_AIUS871:
	.word 0xd0f7c47a  ! 2598: STXA_R	stxa	%r8, [%r31 + %r26] 0x23
	.word 0xc5bcd03a  ! 2600: STDFA_R	stda	%f2, [%r26, %r19]
SET_TL1_872:
	ta	T_CHANGE_TO_TL1
CHANGE_R26873:
	add	%r26,	%r27,	%r26
NC_BIS_NUC873:
	.word 0xc4b545fa  ! 2602: STHA_R	stha	%r2, [%r21 + %r26] 0x2f
SET_TL0_874:
	ta	T_CHANGE_TO_TL0
NC_BIS_PRI875:
	.word 0xd0f39d5a  ! 2604: STXA_R	stxa	%r8, [%r14 + %r26] 0xea
	.word 0xc4fad11a  ! 2605: SWAPA_R	swapa	%r2, [%r11 + %r26] 0x88
	.word 0xc44aa033  ! 2606: LDSB_I	ldsb	[%r10 + 0x0033], %r2
	.word 0xc4ccd13a  ! 2608: LDSBA_R	ldsba	[%r19, %r26] 0x89, %r2
CHANGE_PRIV876:
	ta	T_CHANGE_PRIV
CHANGE_R26877:
	mov	%g0,	%r26
CP_BIS_NUC877:
	and	%r26,	%r28,	%r26
	.word 0xc4ad05fa  ! 2610: STBA_R	stba	%r2, [%r20 + %r26] 0x2f
	.word 0xc4dcd03a  ! 2612: LDXA_R	ldxa	[%r19, %r26] 0x81, %r2
CP_AIUP878:
	.word 0xc48e031a  ! 2614: LDUBA_R	lduba	[%r24, %r26] 0x18, %r2
SET_TL1_879:
	ta	T_CHANGE_TO_TL1
CHANGE_R26880:
	add	%r26,	%r27,	%r26
NC_BIS_NUC880:
	.word 0xc4f545fa  ! 2616: STXA_R	stxa	%r2, [%r21 + %r26] 0x2f
	.word 0xc4a3d11a  ! 2618: STWA_R	stwa	%r2, [%r15 + %r26] 0x88
CP_BIS_AIUP881:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 2620: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xc402a030  ! 2621: LDUW_I	lduw	[%r10 + 0x0030], %r2
CP_BIS_AIUP882:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 2623: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xc4b4903a  ! 2625: STHA_R	stha	%r2, [%r18 + %r26] 0x81
CP_PST_PRI883:
	.word 0xc5ba989a  ! 2627: STDFA_R	stda	%f2, [%r26, %r10]
NC_AIUP884:
	.word 0xc4b6421a  ! 2629: STHA_R	stha	%r2, [%r25 + %r26] 0x10
CP_BIS_NUC885:
	and	%r26,	%r28,	%r26
	.word 0xc49d04fa  ! 2631: LDDA_R	ldda	[%r20, %r26] 0x27, %r2
NC_PST_PRI886:
	.word 0xc5bc581a  ! 2633: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc4ccd03a  ! 2635: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
	.word 0xc4b4d03a  ! 2637: STHA_R	stha	%r2, [%r19 + %r26] 0x81
	.word 0xc47a801a  ! 2638: SWAP_R	swap	%r2, [%r10 + %r26]
NC_BIS_AIUS887:
	.word 0xc4a7c57a  ! 2640: STWA_R	stwa	%r2, [%r31 + %r26] 0x2b
SET_TL0_888:
	ta	T_CHANGE_TO_TL0
WR_LEASI_889:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_890:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SHORT_FP_PRI891:
	.word 0xc59b1b5a  ! 2643: LDDFA_R	ldda	[%r12, %r26], %f2
	.word 0xc582901a  ! 2644: LDFA_R	lda	[%r10, %r26], %f2
NC_PST_PRI892:
	.word 0xc5bb995a  ! 2646: STDFA_R	stda	%f2, [%r26, %r14]
	.word 0xc4c3911a  ! 2648: LDSWA_R	ldswa	[%r14, %r26] 0x88, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS894:
	.word 0xc4bfc23a  ! 2650: STDA_R	stda	%r2, [%r31 + %r26] 0x11
	.word 0xc4c4d13a  ! 2652: LDSWA_R	ldswa	[%r19, %r26] 0x89, %r2
	.word 0xc4ab101a  ! 2653: STBA_R	stba	%r2, [%r12 + %r26] 0x80
NC_AIUP895:
	.word 0xc5be431a  ! 2655: STDFA_R	stda	%f2, [%r26, %r25]
	.word 0xc502801a  ! 2656: LDF_R	ld	[%r10, %r26], %f2
NC_NUC896:
	.word 0xc4cd419a  ! 2658: LDSBA_R	ldsba	[%r21, %r26] 0x0c, %r2
CP_PST_PRI897:
	.word 0xc5ba991a  ! 2660: STDFA_R	stda	%f2, [%r26, %r10]
SHORT_FP_PRI898:
	.word 0xc59a9a5a  ! 2662: LDDFA_R	ldda	[%r10, %r26], %f2
CP_BIS_QUAD_LD899:
	and	%r26,	%r29,	%r26
	.word 0xc89b5c5a  ! 2664: LDDA_R	ldda	[%r13, %r26] 0xe2, %r4
	.word 0xc522801a  ! 2665: STF_R	st	%f2, [%r26, %r10]
	.word 0xc45ac01a  ! 2666: LDX_R	ldx	[%r11 + %r26], %r2
CHANGE_R26900:
	add	%r26,	%r27,	%r26
CP_BIS_SEC900:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2668: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
	.word 0xc5a4d03a  ! 2670: STFA_R	sta	%f2, [%r26, %r19]
CP_BIS_AIUP901:
	and	%r26,	%r28,	%r26
	.word 0xd0ae045a  ! 2672: STBA_R	stba	%r8, [%r24 + %r26] 0x22
NC_BLK_SEc902:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2674: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc48cd03a  ! 2676: LDUBA_R	lduba	[%r19, %r26] 0x81, %r2
BLK_PRI903:
	and	%r26,	%r29,	%r26
	.word 0xc19b1e1a  ! 2678: LDDFA_R	ldda	[%r12, %r26], %f0
NC_BIS_AIUP904:
	.word 0xccae445a  ! 2680: STBA_R	stba	%r6, [%r25 + %r26] 0x22
	.word 0xc473401a  ! 2681: STX_R	stx	%r2, [%r13 + %r26]
	.word 0xc4d4903a  ! 2683: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_BLK_SEc905:
	and	%r26,	%r29,	%r26
	.word 0xc1bcde3a  ! 2685: STDFA_R	stda	%f0, [%r26, %r19]
NC_BLK_SEc906:
	and	%r26,	%r29,	%r26
	.word 0xc1bcdf3a  ! 2687: STDFA_R	stda	%f0, [%r26, %r19]
	.word 0xc4ac913a  ! 2689: STBA_R	stba	%r2, [%r18 + %r26] 0x89
CP_AIUP907:
	.word 0xc4ce031a  ! 2691: LDSBA_R	ldsba	[%r24, %r26] 0x18, %r2
CHANGE_R26908:
	add	%r26,	%r27,	%r26
CP_BIS_SEC908:
	and	%r26,	%r28,	%r26
	.word 0xc89c9d7a  ! 2693: LDDA_R	ldda	[%r18, %r26] 0xeb, %r4
	.word 0xc4f4d03a  ! 2695: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
CP_AIUS909:
	.word 0xc4f7823a  ! 2697: STXA_R	stxa	%r2, [%r30 + %r26] 0x11
	.word 0xc4ab901a  ! 2699: STBA_R	stba	%r2, [%r14 + %r26] 0x80
	.word 0xc4a4903a  ! 2701: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc4f4d03a  ! 2703: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc59cd13a  ! 2705: LDDFA_R	ldda	[%r19, %r26], %f2
	.word 0xc49cd03a  ! 2707: LDDA_R	ldda	[%r19, %r26] 0x81, %r2
	.word 0xc4f4d03a  ! 2709: STXA_R	stxa	%r2, [%r19 + %r26] 0x81
	.word 0xc49c903a  ! 2711: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc4f3511a  ! 2712: STXA_R	stxa	%r2, [%r13 + %r26] 0x88
	.word 0xc452c01a  ! 2713: LDSH_R	ldsh	[%r11 + %r26], %r2
	.word 0xc494903a  ! 2715: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
CP_ATM_QUAD_LD910:
	and	%r26,	%r29,	%r26
	.word 0xc49b449a  ! 2717: LDDA_R	ldda	[%r13, %r26] 0x24, %r2
CP_ATM_QUAD_LD911:
	and	%r26,	%r29,	%r26
	.word 0xc49b059a  ! 2719: LDDA_R	ldda	[%r12, %r26] 0x2c, %r2
NC_BIS_AIUP912:
	.word 0xc4a6445a  ! 2721: STWA_R	stwa	%r2, [%r25 + %r26] 0x22
NC_BLK_SEc913:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2723: LDDFA_R	ldda	[%r19, %r26], %f0
CP_AIUS914:
	.word 0xc4a7833a  ! 2725: STWA_R	stwa	%r2, [%r30 + %r26] 0x19
CHANGE_TLE915:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4d3d01a  ! 2728: LDSHA_R	ldsha	[%r15, %r26] 0x80, %r2
CHANGE_PRIV916:
	ta	T_CHANGE_PRIV
CHANGE_R26917:
	add	%r26,	%r27,	%r26
NC_BIS_AIUP917:
	.word 0xc4be445a  ! 2730: STDA_R	stda	%r2, [%r25 + %r26] 0x22
	.word 0xc4bcd13a  ! 2732: STDA_R	stda	%r2, [%r19 + %r26] 0x89
CHANGE_USER918:
	ta	T_CHANGE_NONPRIV
CHANGE_R26919:
	add	%r26,	%r27,	%r26
CP_BIS_PRI919:
	and	%r26,	%r28,	%r26
	.word 0xc4b29c5a  ! 2734: STHA_R	stha	%r2, [%r10 + %r26] 0xe2
	.word 0xc4db901a  ! 2736: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc583d01a  ! 2738: LDFA_R	lda	[%r15, %r26], %f2
	.word 0xc5a2901a  ! 2739: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc5bc913a  ! 2741: STDFA_R	stda	%f2, [%r26, %r18]
	.word 0xc522a030  ! 2742: STF_I	st	%f2, [0x0030, %r10]
	.word 0xc5a3511a  ! 2743: STFA_R	sta	%f2, [%r26, %r13]
	.word 0xc5a4913a  ! 2745: STFA_R	sta	%f2, [%r26, %r18]
	.word 0xc43ae030  ! 2746: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc4c4913a  ! 2748: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
	.word 0xc4ead11a  ! 2749: LDSTUBA_R	ldstuba	%r2, [%r11 + %r26] 0x88
	.word 0xc472a030  ! 2750: STX_I	stx	%r2, [%r10 + 0x0030]
	.word 0xc4a4903a  ! 2752: STWA_R	stwa	%r2, [%r18 + %r26] 0x81
	.word 0xc5ba901a  ! 2753: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4bc903a  ! 2755: STDA_R	stda	%r2, [%r18 + %r26] 0x81
SET_TL1_920:
	ta	T_CHANGE_TO_TL1
CHANGE_R26921:
	add	%r26,	%r27,	%r26
NC_BIS_NUC921:
	.word 0xc8ad44fa  ! 2757: STBA_R	stba	%r4, [%r21 + %r26] 0x27
	.word 0xc4cc511a  ! 2759: LDSBA_R	ldsba	[%r17, %r26] 0x88, %r2
	.word 0xc432801a  ! 2760: STH_R	sth	%r2, [%r10 + %r26]
	.word 0xc5a2901a  ! 2761: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc4eb511a  ! 2762: LDSTUBA_R	ldstuba	%r2, [%r13 + %r26] 0x88
NC_BIS_AIUP922:
	.word 0xcca6445a  ! 2764: STWA_R	stwa	%r6, [%r25 + %r26] 0x22
NC_NUC923:
	.word 0xc4a5419a  ! 2766: STWA_R	stwa	%r2, [%r21 + %r26] 0x0c
	.word 0xc584913a  ! 2768: LDFA_R	lda	[%r18, %r26], %f2
SET_TL0_924:
	ta	T_CHANGE_TO_TL0
CP_BIS_PRI925:
	and	%r26,	%r28,	%r26
	.word 0xc8aadc5a  ! 2770: STBA_R	stba	%r4, [%r11 + %r26] 0xe2
	ta	T_CHANGE_PRIV
	mov	%g0,	%r26
CP_NUC927:
	.word 0xc495009a  ! 2772: LDUHA_R	lduha	[%r20, %r26] 0x04, %r2
	.word 0xc53a801a  ! 2773: STDF_R	std	%f2, [%r26, %r10]
	.word 0xc493d01a  ! 2775: LDUHA_R	lduha	[%r15, %r26] 0x80, %r2
SHORT_FP_PRI928:
	.word 0xc59b1a1a  ! 2777: LDDFA_R	ldda	[%r12, %r26], %f2
CHANGE_TLE929:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_TLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
NC_BLK_SEc930:
	and	%r26,	%r29,	%r26
	.word 0xc19cde3a  ! 2780: LDDFA_R	ldda	[%r19, %r26], %f0
CHANGE_PRIV931:
	ta	T_CHANGE_PRIV
CHANGE_R26932:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP932:
	and	%r26,	%r28,	%r26
	.word 0xc8b6045a  ! 2782: STHA_R	stha	%r4, [%r24 + %r26] 0x22
	.word 0xc47ac01a  ! 2783: SWAP_R	swap	%r2, [%r11 + %r26]
	.word 0xc4c4913a  ! 2785: LDSWA_R	ldswa	[%r18, %r26] 0x89, %r2
WR_LEASI_933:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_934:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc4232030  ! 2787: STW_I	stw	%r2, [%r12 + 0x0030]
	.word 0xc43a801a  ! 2788: STD_R	std	%r2, [%r10 + %r26]
CP_AIUP935:
	.word 0xc4c6021a  ! 2790: LDSWA_R	ldswa	[%r24, %r26] 0x10, %r2
	.word 0xc4ac903a  ! 2792: STBA_R	stba	%r2, [%r18 + %r26] 0x81
	.word 0xc5a4d03a  ! 2794: STFA_R	sta	%f2, [%r26, %r19]
CP_BIS_AIUP936:
	and	%r26,	%r28,	%r26
	.word 0xd09e055a  ! 2796: LDDA_R	ldda	[%r24, %r26] 0x2a, %r8
CP_AIUP937:
	.word 0xc4d6021a  ! 2798: LDSHA_R	ldsha	[%r24, %r26] 0x10, %r2
CHANGE_R26938:
	add	%r26,	%r27,	%r26
CP_BIS_SEC938:
	and	%r26,	%r28,	%r26
	.word 0xc8a49d7a  ! 2800: STWA_R	stwa	%r4, [%r18 + %r26] 0xeb
	.word 0xc492d01a  ! 2801: LDUHA_R	lduha	[%r11, %r26] 0x80, %r2
CP_BIS_NUC939:
	and	%r26,	%r28,	%r26
	.word 0xc4b505fa  ! 2803: STHA_R	stha	%r2, [%r20 + %r26] 0x2f
CP_AIUS940:
	.word 0xc4bf823a  ! 2805: STDA_R	stda	%r2, [%r30 + %r26] 0x11
	.word 0xc43b401a  ! 2806: STD_R	std	%r2, [%r13 + %r26]
	.word 0xc48b901a  ! 2808: LDUBA_R	lduba	[%r14, %r26] 0x80, %r2
	.word 0xc48c511a  ! 2810: LDUBA_R	lduba	[%r17, %r26] 0x88, %r2
CP_AIUS941:
	.word 0xc49f833a  ! 2812: LDDA_R	ldda	[%r30, %r26] 0x19, %r2
	.word 0xc4d2d01a  ! 2813: LDSHA_R	ldsha	[%r11, %r26] 0x80, %r2
CP_BIS_NUC942:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 2815: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
WR_LEASI_943:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_944:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
	.word 0xc484d13a  ! 2818: LDUWA_R	lduwa	[%r19, %r26] 0x89, %r2
	.word 0xc59ad15a  ! 2819: LDDFA_R	ldda	[%r11, %r26], %f2
	.word 0xc5bb501a  ! 2820: STDFA_R	stda	%f2, [%r26, %r13]
	.word 0xc422801a  ! 2821: STW_R	stw	%r2, [%r10 + %r26]
CP_BIS_QUAD_LD945:
	and	%r26,	%r29,	%r26
	.word 0xcc9b1c5a  ! 2823: LDDA_R	ldda	[%r12, %r26] 0xe2, %r6
CHANGE_R26946:
	add	%r26,	%r27,	%r26
CP_BIS_SEC946:
	and	%r26,	%r28,	%r26
	.word 0xcc9c9c7a  ! 2825: LDDA_R	ldda	[%r18, %r26] 0xe3, %r6
NC_BIS_AIUS947:
	.word 0xc4bfc47a  ! 2827: STDA_R	stda	%r2, [%r31 + %r26] 0x23
NC_BLK_SEc948:
	and	%r26,	%r29,	%r26
	.word 0xe1bcdf3a  ! 2829: STDFA_R	stda	%f16, [%r26, %r19]
	.word 0xc494903a  ! 2831: LDUHA_R	lduha	[%r18, %r26] 0x81, %r2
NC_SHORT_FP_SEC949:
	.word 0xc59cdb3a  ! 2833: LDDFA_R	ldda	[%r19, %r26], %f2
NC_AIUS950:
	.word 0xc59fc23a  ! 2835: LDDFA_R	ldda	[%r31, %r26], %f2
CP_AIUS951:
	.word 0xc4bf823a  ! 2837: STDA_R	stda	%r2, [%r30 + %r26] 0x11
	.word 0xc42b2033  ! 2838: STB_I	stb	%r2, [%r12 + 0x0033]
NC_BLK_SEc952:
	and	%r26,	%r29,	%r26
	.word 0xe19cde3a  ! 2840: LDDFA_R	ldda	[%r19, %r26], %f16
	.word 0xc484d03a  ! 2842: LDUWA_R	lduwa	[%r19, %r26] 0x81, %r2
	.word 0xc4f2911a  ! 2843: STXA_R	stxa	%r2, [%r10 + %r26] 0x88
NC_AIUP953:
	.word 0xc5a6421a  ! 2845: STFA_R	sta	%f2, [%r26, %r25]
CHANGE_USER954:
	ta	T_CHANGE_NONPRIV
CHANGE_R26955:
	add	%r26,	%r27,	%r26
CP_BIS_PRI955:
	and	%r26,	%r28,	%r26
	.word 0xc8b35c5a  ! 2847: STHA_R	stha	%r4, [%r13 + %r26] 0xe2
	.word 0xc5bc903a  ! 2849: STDFA_R	stda	%f2, [%r26, %r18]
CHANGE_PRIV956:
	ta	T_CHANGE_PRIV
CHANGE_R26957:
	add	%r26,	%r27,	%r26
CP_BIS_NUC957:
	and	%r26,	%r28,	%r26
	.word 0xc8a504fa  ! 2851: STWA_R	stwa	%r4, [%r20 + %r26] 0x27
CP_BIS_NUC958:
	and	%r26,	%r28,	%r26
	.word 0xc4a505fa  ! 2853: STWA_R	stwa	%r2, [%r20 + %r26] 0x2f
CHANGE_CLE959:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4dcd13a  ! 2856: LDXA_R	ldxa	[%r19, %r26] 0x89, %r2
CHANGE_PRIV960:
	ta	T_CHANGE_PRIV
CHANGE_R26961:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP961:
	and	%r26,	%r28,	%r26
	.word 0xd0a6045a  ! 2858: STWA_R	stwa	%r8, [%r24 + %r26] 0x22
	.word 0xc4cb911a  ! 2860: LDSBA_R	ldsba	[%r14, %r26] 0x88, %r2
CP_AIUP962:
	.word 0xc4ae021a  ! 2862: STBA_R	stba	%r2, [%r24 + %r26] 0x10
CP_PST_PRI963:
	.word 0xc5bad81a  ! 2864: STDFA_R	stda	%f2, [%r26, %r11]
	.word 0xc47ae030  ! 2865: SWAP_I	swap	%r2, [%r11 + 0x0030]
	.word 0xc49c903a  ! 2867: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc442a030  ! 2868: LDSW_I	ldsw	[%r10 + 0x0030], %r2
NC_NUC964:
	.word 0xc4f5419a  ! 2870: STXA_R	stxa	%r2, [%r21 + %r26] 0x0c
	.word 0xc42a801a  ! 2871: STB_R	stb	%r2, [%r10 + %r26]
SHORT_FP_PRI965:
	.word 0xc5bb1b5a  ! 2873: STDFA_R	stda	%f2, [%r26, %r12]
	.word 0xc5e3601a  ! 2874: CASA_R	casa	[%r13] %asi, %r26, %r2
	.word 0xc5bcd03a  ! 2876: STDFA_R	stda	%f2, [%r26, %r19]
NC_BIS_AIUP966:
	.word 0xcca6455a  ! 2878: STWA_R	stwa	%r6, [%r25 + %r26] 0x2a
SET_TL1_967:
	ta	T_CHANGE_TO_TL1
CHANGE_R26968:
	add	%r26,	%r27,	%r26
NC_BIS_NUC968:
	.word 0xc4ad45fa  ! 2880: STBA_R	stba	%r2, [%r21 + %r26] 0x2f
	.word 0xc4fb501a  ! 2881: SWAPA_R	swapa	%r2, [%r13 + %r26] 0x80
CP_BIS_QUAD_LD969:
	and	%r26,	%r29,	%r26
	.word 0xc49adc5a  ! 2883: LDDA_R	ldda	[%r11, %r26] 0xe2, %r2
	.word 0xc4d4903a  ! 2885: LDSHA_R	ldsha	[%r18, %r26] 0x81, %r2
NC_AIUS970:
	.word 0xc4f7c23a  ! 2887: STXA_R	stxa	%r2, [%r31 + %r26] 0x11
SET_TL0_971:
	ta	T_CHANGE_TO_TL0
CHANGE_R26972:
	mov	%g0,	%r26
NC_BIS_SEC972:
	.word 0xc8a4dc7a  ! 2889: STWA_R	stwa	%r4, [%r19 + %r26] 0xe3
	.word 0xc49c903a  ! 2891: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc46ae033  ! 2892: LDSTUB_I	ldstub	%r2, [%r11 + 0x0033]
	.word 0xc4ccd03a  ! 2894: LDSBA_R	ldsba	[%r19, %r26] 0x81, %r2
CHANGE_PRIV973:
	ta	T_CHANGE_PRIV
CHANGE_R26974:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP974:
	and	%r26,	%r28,	%r26
	.word 0xc4be045a  ! 2896: STDA_R	stda	%r2, [%r24 + %r26] 0x22
	.word 0xc4bad01a  ! 2897: STDA_R	stda	%r2, [%r11 + %r26] 0x80
CP_BIS_AIUP975:
	and	%r26,	%r28,	%r26
	.word 0xccae045a  ! 2899: STBA_R	stba	%r6, [%r24 + %r26] 0x22
CP_BIS_NUC976:
	and	%r26,	%r28,	%r26
	.word 0xc4f504fa  ! 2901: STXA_R	stxa	%r2, [%r20 + %r26] 0x27
	.word 0xc53b2030  ! 2902: STDF_I	std	%f2, [0x0030, %r12]
	.word 0xc5bc501a  ! 2904: STDFA_R	stda	%f2, [%r26, %r17]
	.word 0xc4d4d03a  ! 2906: LDSHA_R	ldsha	[%r19, %r26] 0x81, %r2
CP_BIS_AIUP977:
	and	%r26,	%r28,	%r26
	.word 0xccbe045a  ! 2908: STDA_R	stda	%r6, [%r24 + %r26] 0x22
	.word 0xc5bc511a  ! 2910: STDFA_R	stda	%f2, [%r26, %r17]
CP_PST_PRI978:
	.word 0xc5bb581a  ! 2912: STDFA_R	stda	%f2, [%r26, %r13]
NC_BIS_AIUP979:
	.word 0xc4a6455a  ! 2914: STWA_R	stwa	%r2, [%r25 + %r26] 0x2a
CHANGE_R26980:
	add	%r26,	%r27,	%r26
CP_BIS_SEC980:
	and	%r26,	%r28,	%r26
	.word 0xc4bc9c7a  ! 2916: STDA_R	stda	%r2, [%r18 + %r26] 0xe3
NC_BIS_AIUS981:
	.word 0xc8f7c47a  ! 2918: STXA_R	stxa	%r4, [%r31 + %r26] 0x23
	.word 0xc49c903a  ! 2920: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
	.word 0xc494d03a  ! 2922: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
CP_ATM_QUAD_LD982:
	and	%r26,	%r29,	%r26
	.word 0xc49a859a  ! 2924: LDDA_R	ldda	[%r10, %r26] 0x2c, %r2
	.word 0xc452a032  ! 2925: LDSH_I	ldsh	[%r10 + 0x0032], %r2
NC_SHORT_FP_SEC983:
	.word 0xc5bcdb7a  ! 2927: STDFA_R	stda	%f2, [%r26, %r19]
	.word 0xc4aad01a  ! 2928: STBA_R	stba	%r2, [%r11 + %r26] 0x80
NC_BLK_SEc984:
	and	%r26,	%r29,	%r26
	.word 0xe1bcde3a  ! 2930: STDFA_R	stda	%f16, [%r26, %r19]
CP_AIUP985:
	.word 0xc4ce021a  ! 2932: LDSBA_R	ldsba	[%r24, %r26] 0x10, %r2
	.word 0xc47ac01a  ! 2933: SWAP_R	swap	%r2, [%r11 + %r26]
	.word 0xc5a2911a  ! 2934: STFA_R	sta	%f2, [%r26, %r10]
	.word 0xc46b2033  ! 2935: LDSTUB_I	ldstub	%r2, [%r12 + 0x0033]
CP_BIS_NUC986:
	and	%r26,	%r28,	%r26
	.word 0xc4ad04fa  ! 2937: STBA_R	stba	%r2, [%r20 + %r26] 0x27
	.word 0xc5bc101a  ! 2939: STDFA_R	stda	%f2, [%r26, %r16]
	.word 0xc4d4501a  ! 2941: LDSHA_R	ldsha	[%r17, %r26] 0x80, %r2
	.word 0xc4f4913a  ! 2943: STXA_R	stxa	%r2, [%r18 + %r26] 0x89
CHANGE_USER987:
	ta	T_CHANGE_NONPRIV
CHANGE_R26988:
	add	%r26,	%r27,	%r26
CP_BIS_PRI988:
	and	%r26,	%r28,	%r26
	.word 0xcca35c5a  ! 2945: STWA_R	stwa	%r6, [%r13 + %r26] 0xe2
	.word 0xc53b401a  ! 2946: STDF_R	std	%f2, [%r26, %r13]
	.word 0xc48c913a  ! 2948: LDUBA_R	lduba	[%r18, %r26] 0x89, %r2
CP_PST_PRI989:
	.word 0xc5ba991a  ! 2950: STDFA_R	stda	%f2, [%r26, %r10]
	.word 0xc4db901a  ! 2952: LDXA_R	ldxa	[%r14, %r26] 0x80, %r2
	.word 0xc49bd01a  ! 2954: LDDA_R	ldda	[%r15, %r26] 0x80, %r2
	.word 0xc494d03a  ! 2956: LDUHA_R	lduha	[%r19, %r26] 0x81, %r2
	ta	T_CHANGE_PRIV
	add	%r26,	%r27,	%r26
NC_AIUS991:
	.word 0xc4f7c33a  ! 2958: STXA_R	stxa	%r2, [%r31 + %r26] 0x19
	.word 0xc49c903a  ! 2960: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
NC_PST_PRI992:
	.word 0xc5bc199a  ! 2962: STDFA_R	stda	%f2, [%r26, %r16]
CP_AIUS993:
	.word 0xc4af823a  ! 2964: STBA_R	stba	%r2, [%r30 + %r26] 0x11
	.word 0xc4bc903a  ! 2966: STDA_R	stda	%r2, [%r18 + %r26] 0x81
CP_NUC994:
	.word 0xc5bd019a  ! 2968: STDFA_R	stda	%f2, [%r26, %r20]
	.word 0xc49c903a  ! 2970: LDDA_R	ldda	[%r18, %r26] 0x81, %r2
NC_SHORT_FP_SEC995:
	.word 0xc5bcdb3a  ! 2972: STDFA_R	stda	%f2, [%r26, %r19]
WR_LEASI_996:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_997:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
SHORT_FP_PRI998:
	.word 0xc59ada1a  ! 2975: LDDFA_R	ldda	[%r11, %r26], %f2
CHANGE_CLE999:
	ta	T_CHANGE_PRIV
	rdpr	%pstate,	%g1
	wrpr	%g1, PSTATE_CLE_MASK,	%pstate
	ta	T_CHANGE_NONPRIV
	.word 0xc4ab511a  ! 2977: STBA_R	stba	%r2, [%r13 + %r26] 0x88
CHANGE_PRIV1000:
	ta	T_CHANGE_PRIV
CHANGE_R261001:
	add	%r26,	%r27,	%r26
CP_BIS_AIUP1001:
	and	%r26,	%r28,	%r26
	.word 0xc8a6055a  ! 2979: STWA_R	stwa	%r4, [%r24 + %r26] 0x2a
	.word 0xc46b401a  ! 2980: LDSTUB_R	ldstub	%r2, [%r13 + %r26]
SHORT_FP_PRI1002:
	.word 0xc59adb1a  ! 2982: LDDFA_R	ldda	[%r11, %r26], %f2
NC_SHORT_FP_SEC1003:
	.word 0xc5bcda3a  ! 2984: STDFA_R	stda	%f2, [%r26, %r19]
BLK_PRI1004:
	and	%r26,	%r29,	%r26
	.word 0xc1ba9e1a  ! 2986: STDFA_R	stda	%f0, [%r26, %r10]
	.word 0xc4a4d13a  ! 2988: STWA_R	stwa	%r2, [%r19 + %r26] 0x89
NC_NUC1005:
	.word 0xc4dd409a  ! 2990: LDXA_R	ldxa	[%r21, %r26] 0x04, %r2
WR_LEASI_1006:
	mov	0x88,	%g1
	wr	%g1,	%g0, %asi
WR_BEASI_1007:
	mov	0x80,	%g1
	wr	%g1,	%g0, %asi
CP_NUC1008:
	.word 0xc585019a  ! 2993: LDFA_R	lda	[%r20, %r26], %f2
CP_BIS_QUAD_LD1009:
	and	%r26,	%r29,	%r26
	.word 0xc49a9c5a  ! 2995: LDDA_R	ldda	[%r10, %r26] 0xe2, %r2
CP_NUC1010:
	.word 0xc495009a  ! 2997: LDUHA_R	lduha	[%r20, %r26] 0x04, %r2
CP_BIS_QUAD_LD1011:
	and	%r26,	%r29,	%r26
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x585fdcadb70dfded
.xword 0x3d76de2d7664a297
.xword 0x66a79d7282493cf4
.xword 0x543e21af82605e08
.xword 0xe921bc57a0af31c3
.xword 0xeb72625102554d84
.xword 0xe54550ccb69d8d7b
.xword 0x0db8b5fa853a3251
.xword 0xe8df6dabc422e734
.xword 0x05a466c3b213a007
.xword 0xc74003dbd064e7be
.xword 0x9d68dce4e7915fa2
.xword 0xedcb5626971da062
.xword 0x93cbdf16d7cc8661
.xword 0x156335e703bebb8b
.xword 0x09e0827df5d12d45
.xword 0x8f3ef436d7744b87
.xword 0xa27120e9032d6126
.xword 0x77f46d25955224e7
.xword 0x3b6bc389be2713bd
.xword 0x6749b2bc7b2f089d
.xword 0x4ea82ee1396fa54e
.xword 0x0995fb597ec16ff9
.xword 0xab79d1a8af385b31
.xword 0x7f3fa1a8500cd0bb
.xword 0x6f5042ac22d3aaf5
.xword 0xe91892ad3ce7b77b
.xword 0x378e5ac4407a79b2
.xword 0x4a8b1f5f2c5a0abe
.xword 0xcbcbca5b133d6976
.xword 0x6c52f68f59f71f3c
.xword 0x2d33d4c272bec7f1



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
.xword 0x4a061ed0b0901eb1

.xword 0xc5ec720f760337d1

.xword 0xab0da7644f5618b1

.xword 0xb4ec7bf626dcc5f0

.xword 0xba98b7d11c00d28c

.xword 0x3474ce4f4b15abc1

.xword 0xcc7756151b81ca15

.xword 0x5c8002048de30844

.xword 0x31598fa052f51309

.xword 0xbf2d3ecffaede7bb

.xword 0xb5afdf61b221d9cb

.xword 0xee3763fe29dcf8be

.xword 0x52d9abb25db191b1

.xword 0x13ebf8752c40f303

.xword 0xff2e6c674e61fc41

.xword 0x4bea592da9d00ea4

.xword 0x04a2b175a71122eb

.xword 0x536bb5f29c56eb18

.xword 0x323500e3a1f1e474

.xword 0x884b05b0e18d0570

.xword 0x12560fcd8bdbf854

.xword 0xfed248afbc3c4bbc

.xword 0xf0c35efbe7b86a6a

.xword 0x97f38e3a74f80d3b

.xword 0x50236e21fedfa8e5

.xword 0xf2c435baf6c1a2aa

.xword 0x52cb932f65f4d9b2

.xword 0x6abe2ed58f71428a

.xword 0x52c673ef3073a91e

.xword 0x8f67592fd9679cc3

.xword 0x53cbbe3d45e91e29

.xword 0x6b31855b3a97e351




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
.xword 0x3fac67930cad21f9
.xword 0xb9bd35e00f857ffd
.xword 0x0f92800f5ad52939
.xword 0xa6d067fa664b84d2
.xword 0x355fda61654e54a3
.xword 0xbf5d91f1bdcb637f
.xword 0x002943d054698820
.xword 0x7179c0507d0772b4
.xword 0xb7e16aa92b8c31fd




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
.xword 0x3c89012f6bc3985e
.xword 0xd50d74800ed9c648
.xword 0x115c6f508d905f11
.xword 0xac95cb0a742cf4b7
.xword 0xe6dc42a079de0b2c
.xword 0x3d1a2a3e5f329663
.xword 0xebbe977795376001
.xword 0xeb927f2457fea825
.xword 0x4b882bf1943ff205




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
.xword 0x72439dde409d8f41
.xword 0x37f39372ac0005ed
.xword 0x119c09c7cfbf72dc
.xword 0x36700af37710a8cc
.xword 0x1208b386386bed37
.xword 0x67d352e204699299
.xword 0xb51c1d5a523c2c67
.xword 0xd232386c130838d4
.xword 0x6d65fedd440fe1bb




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
.xword 0x020d8f5e0a24d491
.xword 0x7963c4bd12ae9f79
.xword 0x9c46070fdfd4f226
.xword 0x8cfb54886286e5b7
.xword 0xba1a3ec25b073e82
.xword 0xb858f2d2bd938e47
.xword 0x6104125a9b6127ab
.xword 0x059bf6cbca0a74e2
.xword 0x778b186d4293a58e




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
.xword 0x462cc75032272674
.xword 0x1bbe57249983e968
.xword 0x34acb114910ac0b1
.xword 0x43da4191fa244473
.xword 0x966cfd8d1a89cd5b
.xword 0x202e06e6f2634796
.xword 0xaaf8d8a121b0999f
.xword 0x290777d778ea873e
.xword 0xfba00bf23bfc4e9a




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
.xword 0x404c67e9b83fbca1
.xword 0x8817cce37041d93e
.xword 0x1116a3c3e8c88934
.xword 0xb59d59cc68692e9c
.xword 0x8a6afa60826efa89
.xword 0xa6f03389d57db0bd
.xword 0xab7a6342ffc5eacb
.xword 0x5d72b137e37cf1b4
.xword 0xff97dfe9e4825e77




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
.xword 0x2a01c35f750faf33
.xword 0x453ecc3503c43d07
.xword 0xb8be12dbf6b10e80
.xword 0xa3bac1dda0a0a3d2
.xword 0x71740a6b653529e8
.xword 0xc4afee1e1add343e
.xword 0x8cdbbea3d4599e64
.xword 0xdd6e4dcc57fdd23a
.xword 0x3a78e244900070a9




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
.xword 0x47957c65e5dcdc8f
.xword 0x70329f98a313304a
.xword 0x2f860573567a1ebb
.xword 0x7deabf0d72dac4d3
.xword 0x5e9f2205cf880700
.xword 0x96ec032dcd3cbd1a
.xword 0xb0335fa2d409d2a2
.xword 0x49e0ce94d777e480
.xword 0xed0928b1272c4393




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
.xword 0x4049272fe09ee20f
.xword 0xb66ed8377d6cc810
.xword 0x0ae327e061c24078
.xword 0x5f6dd04a5e900418
.xword 0x4792bf8edbcaae56
.xword 0x8755d850ef8f1d44
.xword 0x2b488c84c5167a20
.xword 0x618433ecd130f0e6
.xword 0x4da6c93332950eaa




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
.xword 0xc9e7a0b33257cca2
.xword 0x7b6ffc84cd299452
.xword 0x2945a2237297b0e7
.xword 0x33c1dbd6239001b5
.xword 0x1a5d10f36207f3e3
.xword 0x78a85dfc355ddcdf
.xword 0x138aeb09960504fe
.xword 0xcd7420c595c23ef0
.xword 0x79f338a3e3065c0d




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
.xword 0x960928b033705ca2
.xword 0xa44db6adaf005b13
.xword 0x7c6481b3bd302b3f
.xword 0x8854533697532c83
.xword 0xc41a11573903fd78
.xword 0xd2fe7e62b9600952
.xword 0x4d1bd7b59ad10197
.xword 0x26d9fb58c7bea87e
.xword 0x255460bfed437aad




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
.xword 0x7d6d4494d3798dae
.xword 0x45dc66282e23bc05
.xword 0xe8c9a501f58b94df
.xword 0x1353bb5e4df39552
.xword 0x2986adbf92064740
.xword 0x7c457100b50a9588
.xword 0x937d76e164d40b81
.xword 0x09cdb1528cf94479
.xword 0xaa845bf154ce17af




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
.xword 0xf451312aebd7f4bb
.xword 0x2fc67a7c8e178f7f
.xword 0xcbe1f598e3895ba9
.xword 0x7e573c8dd9e174e2
.xword 0x80a851ff8c7795ba
.xword 0xb53f32fc5eca8839
.xword 0xaccc5483296c58c0
.xword 0x1f2b3222f395a737
.xword 0xbd1fb28986c008ff




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
.xword 0x48ac341ba978a23e
.xword 0x62314c378b387b02
.xword 0xbde13c3d8abea292
.xword 0x99c55f61a2dc37ff
.xword 0xc15848eaa8f2cb86
.xword 0x823fac9705e28e96
.xword 0x35835ec9bab98c9f
.xword 0x724220e797e56f47
.xword 0x02de55e53356c0e8




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
.xword 0xd35a8861b4073b6b
.xword 0xbd13d26febaafbe9
.xword 0xe9550cfa6de22df4
.xword 0x49fb793a7f0c83b5
.xword 0x43ecda20fc217d1f
.xword 0xc75fcbe5e2d1bad6
.xword 0x9aaa3f544aeb6c81
.xword 0xa34dc85014547419
.xword 0x3d704aabc4a7f277




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
.xword 0xa2fd0b2362390c74
.xword 0x925cfbc81bffbfc1
.xword 0x4515778e965a4e0f
.xword 0x048f4bd87fe4cfc1
.xword 0xfa6a47971e9b037a
.xword 0x272c14011e256740
.xword 0x9684e00f226d082b
.xword 0xd05db6c2818ad25f
.xword 0x82e7be65ee0439c4




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
.xword 0xe241e40f2670985e
.xword 0xbd544166749ce3f9
.xword 0xc48850e16ea3c004
.xword 0xcfb18d07dfcf2e11
.xword 0x775f5ae86eab7ee4
.xword 0x22379df7f2af2c9a
.xword 0xdc7d5c183b69cc35
.xword 0xa2367be595f430cd
.xword 0x7f44c53d70a73f18




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
.xword 0xa3c945fd1f79facd
.xword 0xce4b511df7ac7ac3
.xword 0x320a683e874ec410
.xword 0xbfb6ca2d06a9cca0
.xword 0xc9993b2b549bec20
.xword 0x004238434308a10c
.xword 0x1fb903915c28708f
.xword 0x37fae72281bd4caf
.xword 0xd2f85d7a8bb79480




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
.xword 0xb35ea15e35cbf526
.xword 0xa12d2e606c621ee6
.xword 0x56b4b61ed133e103
.xword 0xa5145d511c58f3e9
.xword 0x157f1bed68d7e141
.xword 0x815cc7e9bd95c6a5
.xword 0xcf83e52fe4bf6de0
.xword 0xebded4a382325590
.xword 0x6697b07594fc4a8b




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
.xword 0xbb5f1a75af7f0e68
.xword 0x36ffbaab78f424f2
.xword 0x79c8851aefdb7d87
.xword 0xe02b67012d633535
.xword 0xa126f32e49c3c54e
.xword 0x525c8366546759a5
.xword 0xbd0fd7ed7529346c
.xword 0xd08a0d435e2231fd
.xword 0xbc7e4892ede906cb




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
.xword 0xaaaed258590d1720
.xword 0xc3a7405132149f6c
.xword 0xb991f882472f2f14
.xword 0x6efb703ba5fe0aa4
.xword 0x59c6897bb6267564
.xword 0xbe5725517d368676
.xword 0x7246c4b51c88290f
.xword 0x0143decb9686b03a
.xword 0xafc0440f1d4df104




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
.xword 0x7496772719940e49
.xword 0x5de669b19a743d76
.xword 0xdb96558767544078
.xword 0xa28cf12517429079
.xword 0xb11f1835194a1744
.xword 0x03c88e36d1999887
.xword 0x733c2a0b423fdaa4
.xword 0x945ed947620e5d4a
.xword 0xd8bb44dfc190b722




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
.xword 0xdd4c85697c519b06
.xword 0x0f460c1e4aaa35c8
.xword 0x0562708a96b92cbb
.xword 0xaa3af2a35d5ee935
.xword 0xfcb02aed4a1517a8
.xword 0x86bf51e412cdf544
.xword 0x5fa418162f964afd
.xword 0x8f6d7e2f3ff275a7
.xword 0xc9881387c26b0166




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
.xword 0xf3c935b04235128a
.xword 0x15062a539b3ad0d6
.xword 0x92a8b70d3e53dfe4
.xword 0x225523fff7ad1b95
.xword 0x838e40621a19fe51
.xword 0x7f4ea828d777a028
.xword 0x65bc16ae086979e0
.xword 0x17d3478285009e68
.xword 0xa77c0165e315b6b3




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
.xword 0x465761359f9c2fd9
.xword 0x58a085bce57eed9e
.xword 0xed9780eecc99beb6
.xword 0xae87cc30ac8d94ce
.xword 0x8b5ef76718435ad8
.xword 0xfb636a1c8e284ca1
.xword 0xd214364196a0cd14
.xword 0x979951c74ff74f83
.xword 0xb7f45c0a6793219a




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
.xword 0x8c27c47459536445
.xword 0x3d9bb65703419950
.xword 0x96efd6d72b03a399
.xword 0xdc25f5489db5af17
.xword 0xb23e358ad9630681
.xword 0x53ea1cc1e2e1e205
.xword 0xea521acec7196321
.xword 0x936da5ed4479ae45
.xword 0x4bc63c0f3cfbde0f




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
.xword 0xef5acbeaf3e9e197
.xword 0xa7bcd8f47490889e
.xword 0xf688d266f52b7329
.xword 0x7148e7a256fd8643
.xword 0xc3b11675bbb76383
.xword 0xed0f74e36314472e
.xword 0x0f45dfa4b4bdcd1e
.xword 0x9912dee226e9cf1a
.xword 0x01724296dc5c694f




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
.xword 0x6fc37c7066fc268e
.xword 0x3de1d86f7fc7b203
.xword 0xd99df863d017a7af
.xword 0xf13dc22e1f0e3b79
.xword 0x7a8d342f1b65218a
.xword 0x764d445e12b50100
.xword 0x1a83187fc80832aa
.xword 0x135c7082acc23541
.xword 0x6b9f4dfbee20b353




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
.xword 0x882dba44ea906c15
.xword 0x14911049c4214f5f
.xword 0x8b06b665a5c64f50
.xword 0x10ad1df2c4cff03f
.xword 0xa77a923490589a94
.xword 0x8a6aa2b9705502b8
.xword 0xfa700e5152525c08
.xword 0x46124421e4fd00de
.xword 0xdbff967f1336023b




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
.xword 0x97f7f6a155177e3a
.xword 0x59608703a388fdd1
.xword 0x21d7bb2d68194582
.xword 0xbd0f1b91139091e4
.xword 0x59a3abb3e030f41b
.xword 0x6003b1b44f3dd911
.xword 0xdc8b59225ec2d4a4
.xword 0x749438b0aece1131
.xword 0x558f5e12a16ac202




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
.xword 0x17f047ad9260c0d5
.xword 0x85cab13c67044a15
.xword 0x44862a230a4dedb3
.xword 0xee9733ba11b7e42b
.xword 0x37da0f6cb5e4cd7d
.xword 0x3e88dd42405cedd3
.xword 0x95341eab79c0eaed
.xword 0x016b091ba9af7bba
.xword 0x6fc68b47cd9c782f






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
.xword 0x984ece251c1b286b
.xword 0xdf0ec9ca87fe9453
.xword 0x1deef36c974b4225
.xword 0x108ffed433d1d453
.xword 0xa7e7867c841f435e
.xword 0xec95f76fe853b765
.xword 0xf6865303aa131156
.xword 0x1bd6ea7c7de13cc2



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
.xword 0x3b243a34bb7b1366
.xword 0xd7bfafe270775fd9
.xword 0x88cf315c5629a48d
.xword 0xef9bf55d84319836
.xword 0x7eb4c84ac9d35aa0
.xword 0x8e8eb6ab76002d9d
.xword 0x9da4550e2575ec49
.xword 0x6bf92bc0af83b518



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
.xword 0x3b6e57f2232e6aae
.xword 0x3dee7c6df528cfef
.xword 0x99e0e831b408d433
.xword 0x8c9a77146467ac2b
.xword 0x419d63d78b2a0a53
.xword 0xdc63667016798217
.xword 0x6d73cc3fbde98979
.xword 0xd7b6a7dd66269a99



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
.xword 0xaa8c966e04812068
.xword 0x0de788b36f3cfaf5
.xword 0xbce58e95577140e0
.xword 0x5b61a4cf05e9575a
.xword 0xab78b2a34fea99bd
.xword 0x4cf375f66c068803
.xword 0x078f021d625a3d11
.xword 0x9b3a4bac5b7d0fd5



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
.xword 0x81f2788c5df85535
.xword 0x191a0c297be2c09d
.xword 0x68a8140c45f063e0
.xword 0x12c10f1fff4c7d17
.xword 0x5f5bb0e382dc2373
.xword 0x6a815d4e328aab7b
.xword 0x3c3ce82560d4f915
.xword 0x8d33a6da1e0e4504



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
.xword 0x109463ec25403653
.xword 0xa0e961d5d68a5ee0
.xword 0x526ecfe88fd75180
.xword 0xa0722e312b72f9a3
.xword 0x94413660e5cda328
.xword 0x9bf2217101bc0589
.xword 0x77a7aa40ed9d743e
.xword 0x5e1a4fd3b3eb5f75



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
.xword 0x18a08b481bc2d165
.xword 0xbb4ddcc36892962a
.xword 0xbe2dcfc5ebbe8359
.xword 0x386bc178a08b8b60
.xword 0xf33c4bf1a53e48c5
.xword 0xf5b27358be163709
.xword 0x3bf493e9d8f3685e
.xword 0x577be467f3318ffd



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
.xword 0x7fbf1d03934b28f7
.xword 0x779400f981ba4815
.xword 0x36c2cf9576f3b516
.xword 0xa23b53c2c6d9b4b9
.xword 0xdc10744d920f1e2b
.xword 0x365e027d674a1f87
.xword 0x23e719111006742a
.xword 0x087c6518ebee5803



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
.xword 0x3d2eaf1429b14ea9
.xword 0xac8363b5aa0679e6
.xword 0xc923c6edc4fc8cc0
.xword 0xa289634de2e3923d
.xword 0x3cd7ab4a4e045965
.xword 0x89e4211efb6278c1
.xword 0x3b4ee57bead6d5ec
.xword 0x5bb8e93c78181ea6



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
.xword 0x3ac90c2664655db7
.xword 0x007e5c0286c53ff1
.xword 0xa69e94a1a8befb34
.xword 0x4142766a303fe27c
.xword 0x3161ede0a27783b6
.xword 0x29c604bcd28cf2e3
.xword 0x4baaebe491175c96
.xword 0xd43c65e55889ba7c



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
.xword 0xc7703dd0268757aa
.xword 0x173aeacfb6f4ef24
.xword 0x900c7a347ee92cba
.xword 0x532d03c860cd062f
.xword 0x0d92f1681e5a5055
.xword 0x1b43a73a04deba2a
.xword 0x79afba86f3030f05
.xword 0xee1b0aeefed51d6b



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
.xword 0x47eb532c222b8dc9
.xword 0x5c7b67dce6cf564a
.xword 0x103f5abc74523575
.xword 0xa69d56650246c1c9
.xword 0x0b0d25dd2a95e49c
.xword 0x59308470336c5b7c
.xword 0x766f4d685d8049aa
.xword 0xb529a352c339b6c3



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
.xword 0xe4dbe2ff58ae7a25
.xword 0x3ad2b499d0f61180
.xword 0x4de60436a3031087
.xword 0x8b7955194501ceed
.xword 0x45142c453b51119e
.xword 0xe1795bd1936d886c
.xword 0x49954731bd5b8673
.xword 0x665d438049d8dd47



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
.xword 0x835ffd8301823da5
.xword 0x4241939092490053
.xword 0x5764f620306ffac2
.xword 0x5c0b3c9e3a82391b
.xword 0x0526577f6e922fae
.xword 0xad5cf0611ac79986
.xword 0xf13a16ca50db0713
.xword 0x735b28885df4e466



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
.xword 0xd94e75ad4177ef17
.xword 0x8e674c72f009e4ee
.xword 0x68697de6966a8548
.xword 0x3c414c563abd4426
.xword 0x2be3936d6be5a690
.xword 0x6a8aea11216c0644
.xword 0x13995c9cca0adfd9
.xword 0xc107ed3c80ed105e



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
.xword 0xa2c2c523e402a6dc
.xword 0xb1063ba492c71546
.xword 0x85e19227bdb42cfa
.xword 0x705ca4d25d5f4e2e
.xword 0xb4dd71af13fc030e
.xword 0x6e295dbd299f1df3
.xword 0xed0dccdec28e0830
.xword 0x27670d95fb0f8d62



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
.xword 0x4ebe013acfb39e14
.xword 0xacc5178cb2d85163
.xword 0xccef2aeff5999499
.xword 0x901a229e1bb91228
.xword 0x03a187067bc9863c
.xword 0x4631151e73967320
.xword 0x33c446c1fdf9b48e
.xword 0x448d13216ceadea2



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
.xword 0xf24dcfdaf4f8a523
.xword 0xc9a316e9c6b60290
.xword 0xc0eb44f25a8251fb
.xword 0x5cf0aab23f12319f
.xword 0x55545b2bde226623
.xword 0x217dbf61567d82ca
.xword 0x30daa3dc5c487811
.xword 0xa066c734d3b92a50



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
.xword 0x9009c0e7bc17dec4
.xword 0xb407d8f8c0da2eb3
.xword 0xc7a75563d998ae04
.xword 0xe59add07090e4d6d
.xword 0xa95c8afa03e97f9b
.xword 0xa1dc214c46f78f43
.xword 0xd875920bceb0b23a
.xword 0xd4622b45c2c842b8



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
.xword 0x2934ec6e5c9bf93e
.xword 0x34597037b9219e5d
.xword 0x394dc181cd27d937
.xword 0x07b05b2d45ee49d0
.xword 0xbacab40f124b422b
.xword 0xb1559c752dde866a
.xword 0xc90181efc6a1942e
.xword 0xc440a52b0820ac8d



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
.xword 0x4da8c59a5cb49a63
.xword 0xa4db2f3e40d25cb6
.xword 0x5ba96da8c0b26742
.xword 0x8e205031e021153b
.xword 0x7a2dec27f5b09453
.xword 0x3c14c99604746571
.xword 0xa94c239bfc001a1a
.xword 0xbfd42b57592a5f17



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
.xword 0xdb479bf488699d52
.xword 0x2c3271ee5963c780
.xword 0x79bd138e93a57398
.xword 0xff42259d698e9ebc
.xword 0x9d12cef5767d7868
.xword 0xffc37b323f63e2f2
.xword 0x76f786af95570124
.xword 0x066469f6d218e6ec



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
.xword 0x84d5817154dae748
.xword 0xf4d31beb2aa257fb
.xword 0xa17c171831269b1b
.xword 0xc735553a0ab86d1d
.xword 0x76586a9c2daa9e4f
.xword 0x8d98d0bc58e2b64b
.xword 0xf6d607135bb6002a
.xword 0x5db6bf800904df9a



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
.xword 0xd06953d18bbbf163
.xword 0x859ccbd56e1bed62
.xword 0xbd94451aa7e78345
.xword 0x95f2c45e019f0a31
.xword 0xb86473311d3afdb7
.xword 0x7881190a79a008c4
.xword 0x4f7654856bfc1b46
.xword 0x6deabfa27e3b5b81



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
.xword 0x7946d58535482a45
.xword 0xda90f27e44b952dc
.xword 0x66ab1245a44bfbdc
.xword 0x1891fa41ac8d1fae
.xword 0x655d1c259b5acd87
.xword 0x10bad2c028ff7045
.xword 0x7f289bc6ac000e22
.xword 0x968dd835e0eea010



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
.xword 0x24612f5464b2aaf8
.xword 0xfc03fcefb36c26c5
.xword 0xb6a8a1feecb4f708
.xword 0xcbdb359f91ca69aa
.xword 0xb5e21fb6bec7b29a
.xword 0x04dab441dfe01dc4
.xword 0xcbf55c6740b595c6
.xword 0xe78ec6010102df6a



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
.xword 0x30311daccea993ef
.xword 0xd56b627e677b5fe3
.xword 0x75a0f6ef1b00c864
.xword 0xfcdbfffee95febdd
.xword 0xbc7ca5dcbaa79b71
.xword 0x87b052c7a264603c
.xword 0x1e813885805edb50
.xword 0xf936b5f27bf9584a



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
.xword 0x52389e588f984110
.xword 0x6b2570257e4b7cf8
.xword 0xf13afddd80b4b4e3
.xword 0x85b0666c07ba60a6
.xword 0xa1d51bf26fed7bb8
.xword 0x8d2ff356d5c25f6e
.xword 0xcdfe10c9d37cd9a6
.xword 0xab59cc19f816219e



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
.xword 0x058e7c92be8f55cf
.xword 0x1ea7e29822ac86b8
.xword 0xabf54675fdaf5b8a
.xword 0x19cd8f002f5429a3
.xword 0x5e72de2d49b42a5c
.xword 0xc41a4197e433e331
.xword 0xa7e13301b74ed5af
.xword 0x8661e3b76c591dbe



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
.xword 0x9436d85e563f48c9
.xword 0x2f113b32c9d4528a
.xword 0x5c3c6fcf623c84c0
.xword 0xae7c7d903d2a8a02
.xword 0xecef58bbfab748c3
.xword 0x2d81aa018ca88953
.xword 0x00b33ea71837710e
.xword 0x04925a866266dd86



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
.xword 0xa55bee8b05cf6153
.xword 0x72d64dcd9e84df7b
.xword 0x62c5997c35d55c6b
.xword 0x9f310e81ce75816e
.xword 0x07f33a86e30865e0
.xword 0x29c33e68eac60192
.xword 0xf147534e184fbc2f
.xword 0xadc5d75da1f912cc



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
.xword 0xc6736eec67720d65
.xword 0xbb733b822b90a36e
.xword 0xb7b4189cdea95c95
.xword 0xc770b67a3f78d4b1
.xword 0x5b6d40967c0221e8
.xword 0x3269d4377fb1456a
.xword 0x6e1f08b27d1b44c2
.xword 0x1a15bfcc7cae7310





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
.xword 0x6c8ca22e7488e3aa
.xword 0xf1dd41c69008e964
.xword 0xbe521226a5f8de38
.xword 0x62f2ef6ba989855f
.xword 0xd6888ea228c8d2ec
.xword 0xf649cbf805a7c7bd
.xword 0x4711cefb7587f210
.xword 0x4e5392779ee1c6d4




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
.xword 0x682b7982092bde09
.xword 0xbdb7ad31f3560e1f
.xword 0xf3aee5641ed3a5f3
.xword 0x46dde3bdc82bc35b
.xword 0x988581e3d63d976c
.xword 0xf4c63635e8158e0f
.xword 0x40d21e9496c33e6c
.xword 0x84f0795d68fb9f08




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
.xword 0x82a5d21da683141f
.xword 0x9b604161b307abe7
.xword 0xc62077ed89c4f448
.xword 0xe5a7bb8963184dcf
.xword 0x279577631d11ac26
.xword 0x2d76362245ee54b1
.xword 0x010ac168697242c6
.xword 0xc4e27867c1af8063




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
.xword 0x4cd32adbb6045057
.xword 0xd2520cfb476a1673
.xword 0x2a5cc05ea9ef8bfd
.xword 0x559313e1da56e567
.xword 0x3b97103a290095ac
.xword 0xc7c7038074d50fb1
.xword 0x73cc8b566c8bd4bf
.xword 0x6db94403dbdca9aa




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
.xword 0x1f4336590f1b96c1
.xword 0x4c9a8f94c411e598
.xword 0x53e206f237d804f0
.xword 0xbd65466a9a1e2d63
.xword 0x933ab07c8bedc3e1
.xword 0xf2ed3148c5d9173c
.xword 0xdd5e49cbc4552f11
.xword 0x57dca442c2ee8cdc




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
.xword 0xe73bcb3f0f2c20fc
.xword 0x8586b1ce5106cf08
.xword 0xabbef1f63830cf70
.xword 0xd333345dc916f8d8
.xword 0x04bc6c65b488a096
.xword 0xfa73056aef98b507
.xword 0xe9cc186ee65f5ce1
.xword 0xfcdb39ce983d069c




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
.xword 0xbc84eae9ca2b905d
.xword 0x74607c387a973e12
.xword 0xcd3a67e8a8135fd0
.xword 0x1e5332cebdbff7c1
.xword 0x082a3309b3f2fc58
.xword 0xd7fdda6ce5454758
.xword 0x08f39cf05c1289c7
.xword 0xd2b650b4c8408197




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
.xword 0x0b3b3d7580e9bcbb
.xword 0xac7eb3d87b146649
.xword 0x0a5dc86240ed185b
.xword 0x9f74aa07a451cf01
.xword 0xd196bc604795b715
.xword 0xd6ae6a893182b97f
.xword 0x1317b460cb80450e
.xword 0x51bfd99fd00f271f






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
.xword 0x1ffb1cb80841186c
.xword 0xf53d7f5fd6eb7a2c
.xword 0xd0e3b4740e97dfc1
.xword 0xcd82b985e6b4a14e
.xword 0xc2e414ed167d1052
.xword 0xe04bdbbe81d6d152
.xword 0xe3169afec3e92f62
.xword 0xc6805b3aee5f243a




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
.xword 0xd6e017ea776484b2
.xword 0x982aac8d65d18cae
.xword 0xce02c412fe27e1ad
.xword 0x9a496c73f7951024
.xword 0x251f8cbf2392f3c7
.xword 0x59b363de28b46298
.xword 0xac5e4d3e39383385
.xword 0xd7b62a467ac22d3c




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
.xword 0x555683f5c3e4e624
.xword 0xfac0494d1438184b
.xword 0xa2d2ad11e1399e8e
.xword 0xdf82a359ce5879d8
.xword 0x08e943e83cf111e2
.xword 0xa452f3dda15c81ca
.xword 0x6b8c103ce98d417f
.xword 0xb3f3431e244ed923




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
.xword 0xec9bbac9abbec313
.xword 0x59e87e95932c13a1
.xword 0xba4492fc9365f021
.xword 0xc652f94b456b98d6
.xword 0xe68d1d6cb26fd531
.xword 0x16341a73a2675dea
.xword 0xde6cdaf6bacae7f1
.xword 0x089e6a7ec116fc85




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
.xword 0xb780d6e59ba913e5
.xword 0x7500f91773d82c4d
.xword 0xf321acfa8ab98876
.xword 0x95e83815dc767841
.xword 0x4173267b7ec513dc
.xword 0xc2472d773803c35a
.xword 0x8d1d39762fd8cc93
.xword 0xed41f1b1682bfc39




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
.xword 0x6cfcae7807a93c55
.xword 0x02d1d0924fe06354
.xword 0xd9c1ba33a6067638
.xword 0x1c66cd468412cc70
.xword 0x1c784b653fbd2f5c
.xword 0x614f7cea885b2ee0
.xword 0x1e69c0c5b87b35d1
.xword 0xd058c21ddb4bacf4




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
.xword 0x61e3a1fd0c79d83c
.xword 0xded2236f9e67fb12
.xword 0x1d30c64775fb68d0
.xword 0xc215b6b2e39d5f1c
.xword 0xfcd82aea2e816a1a
.xword 0xa833bdab6c01114c
.xword 0x83477556cbfddf4b
.xword 0x5f3119a5633edce8




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
.xword 0xb1788793b095c353
.xword 0x2d67a3c9efe6a333
.xword 0x4897f0abe0c89297
.xword 0x1f8c151078c81725
.xword 0xcf0bf4d8b818a551
.xword 0x36ee02538e290b87
.xword 0x3dd8d132b7868dd0
.xword 0x090ef614cc86b21d






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
.xword 0x817020eba6cdb64b
.xword 0x5d991ff27476dbe2
.xword 0x765c1791c3756915
.xword 0x8d6a5836709d1ebc
.xword 0xfa3072d77cf7793b
.xword 0xdfb91fed7ae18f8d
.xword 0x4daf3042dc300c08
.xword 0x19e9630cb45c6a3b




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
.xword 0x9578c6396cd1817f
.xword 0x8f54e2a7087bf3b7
.xword 0x72aada702868533f
.xword 0xacc9bee327f337a2
.xword 0xfb8e0fe6565b3801
.xword 0xd51f77a7982acbe8
.xword 0x7ec5a3e30d5d3ff2
.xword 0x1f4753c80da39cda




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
.xword 0x5203922f2e393e72
.xword 0xb7b1e73b0e51bf61
.xword 0x4a99955697a6f0d8
.xword 0x466ebe00056ce029
.xword 0x7ac7beea95eb3cb6
.xword 0xd58c71ba67643630
.xword 0x22446be054775a69
.xword 0x36d18e61a55b2342




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
.xword 0xed0d658ef4bc6452
.xword 0x7dbc45b7047a8133
.xword 0x78a78d3666f1856b
.xword 0xb24f10489fa08da1
.xword 0xa53aa313b9528864
.xword 0xc4f974ede70d26fa
.xword 0x93cfbe5732465d9f
.xword 0xb3d232423c9f7ed4




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
.xword 0x5253319d6b30d9fd
.xword 0x4599c50e0b47097c
.xword 0xbb3465a92035568d
.xword 0xcd1a4f7355df4923
.xword 0x06be24372af04cb1
.xword 0xa6bb1e2bad255e2a
.xword 0xedd465053ccf35b0
.xword 0xdcc25f1625470b10




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
.xword 0x89db16f142b315c5
.xword 0x0ef876ebe4403378
.xword 0x8b5552be8304d125
.xword 0xdb33afdb5e7941eb
.xword 0x2373cfcd6c5f8bcf
.xword 0x1a708cbdf0aab376
.xword 0xa1ce2d887a2d313c
.xword 0xa0c129f901bd08aa




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
.xword 0x2fdd61dfcc7fa3fb
.xword 0x49811513e89eee0a
.xword 0x955f897b81b97eb8
.xword 0x70650b4628ad04ab
.xword 0x411c95d035c263d1
.xword 0x1f68e01b7232d341
.xword 0x855faabea3c29f10
.xword 0xaabd8228b0d78364




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
.xword 0x44c77c8419ff22a2
.xword 0x8b752dcfa16da984
.xword 0x0cbe404cc6547c8a
.xword 0x43cbb2cfefc44e47
.xword 0x77a6ce8b42041af6
.xword 0x3e9b196ed10c9099
.xword 0x2fb25a678391a0b7
.xword 0x635bf58c9f51ade5






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
.xword 0x787e0c9ff4a88fe1
.xword 0xd4d8e630828520b7
.xword 0x33b0514226e27c51
.xword 0x45b6d2c4c6bbd930
.xword 0x83c503c2aae689ba
.xword 0xbfeeeac1fe14871e
.xword 0xbff67038945de924
.xword 0x932d4fb646f8f4ac




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
.xword 0xa988cc8f491c58d3
.xword 0x300b1c794a120401
.xword 0x213e45b4b6b24141
.xword 0xcb40497456b943fd
.xword 0x2f3b96bc1846a0de
.xword 0x75e59d880e3662e6
.xword 0x948ee6c45f384def
.xword 0x7217711604c73802




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
.xword 0xf734437f1425f633
.xword 0xa17aad91a1381181
.xword 0x26ffb7ff6c16b055
.xword 0x9ba1cc47d05c6d51
.xword 0xd5aa3fbff80842e1
.xword 0x3f954b80e0f1ef4d
.xword 0xea1484eabc9ae6aa
.xword 0xd7989f7fabef62eb




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
.xword 0xac7a7efb887d093f
.xword 0xb07d0a1b9b852de7
.xword 0x0179e6a13e82e186
.xword 0x040acc0cdef9d4ef
.xword 0xf0681df41aac4dd9
.xword 0x40d7e8d25c293e44
.xword 0x0eeaf41175209892
.xword 0x7bf467805915a882




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
.xword 0x063b6748f2f9b7d2
.xword 0x34092be4519ef9c2
.xword 0x7b4456e804d79328
.xword 0x93d95b8fb57eb61d
.xword 0xd2296ea3c857b419
.xword 0xed3c27fa8641bb7f
.xword 0x9976d147b09a2571
.xword 0x3d171da90e12034a




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
.xword 0xf4f4a54ed371c9c9
.xword 0xd8a63756595c45bc
.xword 0x22f6bae534ee7703
.xword 0xf4d061e2c6eb0615
.xword 0x150bbe08bdc56e5d
.xword 0x5ece5863644b8e05
.xword 0x4b16119797b09ac2
.xword 0xfe76174864ac8bc9




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
.xword 0x7f78acb6bfe6f12a
.xword 0xe9a8be198c3f277e
.xword 0xd294ad90d813535b
.xword 0x96063d57bc8fd943
.xword 0x45a29702fe5e7c54
.xword 0xfe041ba15ad256f4
.xword 0x9be6c0d261e81b15
.xword 0x8d2eb4560cd935f5




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
.xword 0x553543ddf54a76e8
.xword 0xcc56fcf9d94ef2b3
.xword 0x51c2a2004fb579a3
.xword 0xe47d164c00a005e9
.xword 0x90793365ac2861a5
.xword 0xda1e37fd0e7cc862
.xword 0xc5b4af1760c55fab
.xword 0xd503b7fb8d09b72d






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
.xword 0x70b68a9bcc2896cc
.xword 0x5362e31513e6c8a6
.xword 0xf1a141045e299f11
.xword 0x3978b78c9b7be4f8
.xword 0x74fc81fab2e54cba
.xword 0x83b0bef39a566b19
.xword 0x161bf04df36005aa
.xword 0xceaff8ee6260c11e




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
.xword 0x980f9153536d82d3
.xword 0xf2c3ee3e0e032803
.xword 0x61bc5d182ea48d1f
.xword 0xcdf9a9d3c7fb97a4
.xword 0x6c0e20b370589eaa
.xword 0xde1c4ce125e26fbf
.xword 0x7939c007357b2235
.xword 0x752a8a4e5f5087ad




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
.xword 0xe4b57cbc12411815
.xword 0x40e026e561e94ff1
.xword 0xe2b1fd3641e15d8e
.xword 0xef02d57386bbade4
.xword 0x936be4b04f092802
.xword 0x9e517ec07b43b6be
.xword 0x2f536292adae601b
.xword 0x5aae28f9da25fe1f




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
.xword 0x660401591667d415
.xword 0xc8cd450dbb38d446
.xword 0xe9d44fc7a19f433b
.xword 0xbd254209f262f041
.xword 0xd13c752943d1eca2
.xword 0xeda90236e56807b8
.xword 0x70c59b43f70df2c5
.xword 0x41455cdc00e79b6d




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
.xword 0x2495880c81116be2
.xword 0xabefa5acbe13a6d9
.xword 0x2eaf63c9000966d3
.xword 0x4b4f206035d07a8f
.xword 0xc4a2835ecfdbb0d0
.xword 0x056cb952f0587e7c
.xword 0x19d25715adf6a063
.xword 0xd33cc898ed43f59a




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
.xword 0x9210aea5569c4132
.xword 0x1e3f23797f18cf9c
.xword 0x49b45c9cc87f9c5f
.xword 0x2e1eb0441b108be5
.xword 0x2b73743b81576a5d
.xword 0xba1b85618e0dc962
.xword 0xc42d2fd454b99782
.xword 0xef65e961a88c1af9




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
.xword 0x39096a1d97aec0cf
.xword 0xb308850ff099569f
.xword 0x868640fb118bf782
.xword 0x363c9a59cbca6e9f
.xword 0xf64021df69c20db5
.xword 0x734a0b5a72f48fbc
.xword 0x42e6b6f46e1c7881
.xword 0xba5ffb7114fec04c




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
.xword 0x05135d0f7ee51bc5
.xword 0x4930be7a888dceb5
.xword 0xf501d856b593be44
.xword 0x4fab553bd3b6ad84
.xword 0xfe6cfe8a466efd66
.xword 0x4ce916858f58db89
.xword 0x7a36d05615ed491b
.xword 0x4878fef9954150f7






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
.xword 0x80464685fa6af253
.xword 0x37aecb5a51542a5a
.xword 0x48d4b9f19de15141
.xword 0xee11e538d8b768ab
.xword 0xe374d68eea3b8999
.xword 0xdab2594494f65da4
.xword 0xa0ece541416e0427
.xword 0x6a6ff3ded09d8ae4




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
.xword 0xa00aef80c8148e79
.xword 0x8c9638bf98375c7d
.xword 0x3105ce4d0a77043e
.xword 0xd1d3e8c7fbf00932
.xword 0xcf4c55eceb0b4931
.xword 0xbe7e909e735ae8f8
.xword 0x9f566119acb3be6b
.xword 0x64407db13af74c65




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
.xword 0x35a3e61aad623222
.xword 0x3c67377d8c7bef05
.xword 0xf55cb63eb9438b85
.xword 0x45230ce11d8b432c
.xword 0x7c1ad7ea2e6f8a50
.xword 0xafcee272b23e9d6b
.xword 0x27ecabc0139c4116
.xword 0xe5764c42598c852d




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
.xword 0x3ab380e11e54352a
.xword 0x52734386a8368a7d
.xword 0x38972771fab49cb9
.xword 0x9ddaf207ac8df184
.xword 0x46dd46307c08ab16
.xword 0xec493f5c60618495
.xword 0x5d1bda21110a59c7
.xword 0xb150b5ece1d20cc3




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
.xword 0x7d81a1759e64b23a
.xword 0x6f16b54fc9ace07e
.xword 0x88e38b03c5dd8d77
.xword 0xfead04e20bfe01f3
.xword 0x6c3dc91e99b6f2b3
.xword 0x9f41ece8612c7784
.xword 0xc04dcee55dcf108a
.xword 0xfd1ce076ca725ce7




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
.xword 0x9e731337914b9dc0
.xword 0xdfa02a3cdc2c7573
.xword 0x71e7e23f0df7fae4
.xword 0xb8780f3b33bf764c
.xword 0x45951bdfa4660104
.xword 0x80e116c2990723d3
.xword 0x492e67555d907238
.xword 0x6ea48d62285956d7




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
.xword 0xbc8ccaae81af2fba
.xword 0x59ca3e61f8822cf0
.xword 0x937c19c041f748bd
.xword 0x2b78e30ac25de311
.xword 0x5da67d1dc9acc6e1
.xword 0x41204b6b56b3c223
.xword 0xd055064707c66259
.xword 0x08bfb072b166ac1f




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
.xword 0x30582058bb75f6d1
.xword 0xd2cc82337564a0ec
.xword 0x1c0842903e898413
.xword 0x179738b2d3f67f81
.xword 0xc1fcc8f768b28dfb
.xword 0xb857bcdcce36b666
.xword 0xc6613ef22ada1fec
.xword 0x61d4b9073928ca45






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
.xword 0x31ec4a28192fd490
.xword 0xd96fea4824e24841
.xword 0x731ab965b63bc087
.xword 0x5916359f35b3066f
.xword 0x19d40ff7fea4b9d2
.xword 0x5ac202ff8d04b283
.xword 0xda0c63302a65e2b6
.xword 0x6d13cd1084c3e492




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
.xword 0xf29efd627741783f
.xword 0x115d693cb6a45293
.xword 0x9f354c82a1dd5bbc
.xword 0x3423c03615e07afb
.xword 0x63779b2a4e002058
.xword 0x91e05d93adcc8936
.xword 0x5a1db0a58bce359b
.xword 0x37a3f8fc1539380e




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
.xword 0xbb58370878dc08c0
.xword 0x155baa62aa5d2875
.xword 0x234984b297c965ee
.xword 0x39fc902eb2abc6b8
.xword 0x9a7e6af731013720
.xword 0xcbdcfa15d999002c
.xword 0xc1f2f6f75e8e7e60
.xword 0x083eba6d24cd73dc




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
.xword 0xbd8f1628d8c98976
.xword 0x5c2d6074425d0753
.xword 0x81f4a2871c2b8846
.xword 0xa4d1deb46a755a19
.xword 0x1efb10d130ca8ca6
.xword 0xd9d9589cf67b4d35
.xword 0xece4a3b97561f28f
.xword 0x981eed055b357201




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
.xword 0xf8d17763b0697da9
.xword 0xc87d182379ce7921
.xword 0x57ff3dc7e3809c05
.xword 0x122bb4a315e03928
.xword 0x86cde270d7162b0e
.xword 0xd8bdeeca9893be65
.xword 0x580e4c5a85c67aeb
.xword 0xff63a5123831241a




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
.xword 0x566132cdaa2e4934
.xword 0x75658f453a980986
.xword 0x0b243154cdac6518
.xword 0x36ba230936dc4979
.xword 0x9cc275c80e77b646
.xword 0x827a3a1675bbc549
.xword 0x84a6299d514e2fd4
.xword 0xe84ccde84df16d2b




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
.xword 0x6b15ae7728124d70
.xword 0xa2810b8447a23998
.xword 0xf20f4db193ec9650
.xword 0xccf65738b95105a6
.xword 0x1342cf6780f8381d
.xword 0xcbbfcd3335089cd4
.xword 0x37e4ca9e090422c4
.xword 0x85029be40075abc9




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
.xword 0x8fc8213dd67a8146
.xword 0x00c142cbc2ca85ef
.xword 0x9beeb3c4b546f648
.xword 0x20582698908914df
.xword 0xee6d8d6805b01091
.xword 0x9f70f763c47f9ff0
.xword 0x1150f6c8d8b62968
.xword 0x61435ef7b0364c1f






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
.xword 0xa59b4c7f6d35d21a
.xword 0x7ae97eae5278a194
.xword 0x07bad8c45acde596
.xword 0x8ecfc3f2c3c942b1
.xword 0xa75246989aa14c59
.xword 0x9dca077eb8dec4a7
.xword 0xb12882f4d8d4cc23
.xword 0x3326e2b5b91f2ae0




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
.xword 0x71b5344a2aaabf8d
.xword 0x00e7d60a4e74b4d3
.xword 0x91cb912912a5b4a1
.xword 0x96544b3305193252
.xword 0xee06ffad7ae86c16
.xword 0x2c5e3b36c6019a66
.xword 0x2813fa98f888c4b7
.xword 0x11d61085c00fef99




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
.xword 0x50135c62820169be
.xword 0x19d48f5e8765e5fe
.xword 0xeab98fe96f8b6b85
.xword 0x076fa503edd9a196
.xword 0x27d0b2dcb96e3c01
.xword 0xc2a7eb6f7cfd3bcc
.xword 0x1bff68291ff725d4
.xword 0x3dd84bb42faa13d9




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
.xword 0x9e97b741e7075603
.xword 0xdb44db1e8cbeb240
.xword 0x3b3ea4edfdac49a3
.xword 0x26931c3a93f2de40
.xword 0x244f9b027423322d
.xword 0x724877cd9fbb1107
.xword 0x874f386f8b716425
.xword 0x7e75ac280351360a




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
.xword 0xd6a9117e65878893
.xword 0xb5031d80411b39c9
.xword 0x343e7f47f75ac917
.xword 0x51363cef2e3113b3
.xword 0xd80398e40388316b
.xword 0xb45d8c6097b5897d
.xword 0xf3581e80660143c8
.xword 0x95412ac9621edbc8




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
.xword 0x6f0d50661080e834
.xword 0xea2ff76bcb74a8f6
.xword 0x03a9d6859260a1f8
.xword 0x5615492cabd9c395
.xword 0x6140f095da25d8e6
.xword 0x3b3f33cce9ef3e9a
.xword 0xaf81062948b6e71b
.xword 0xbfad37efde50d9ad




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
.xword 0xeb820dd60d9ef9d9
.xword 0xb9ce9aa6d81582c2
.xword 0xdf3b9badbca0adfd
.xword 0xea1dae700288bb5d
.xword 0x76021b175abfb9ea
.xword 0x999403683406f6ee
.xword 0x0e64cc2ae0b5522c
.xword 0x2416959924c61976




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
.xword 0x86ffcabd811aeaa5
.xword 0x72325a03edba2d9b
.xword 0x0f251dbc0e3c5a76
.xword 0x0b5f5f8d8291c5a4
.xword 0x13fd161c5d0b543f
.xword 0x2ee1716b066fe387
.xword 0xf5d3ed616f8f33df
.xword 0x2db49eaaf57e3000






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
.xword 0x4af6dbae1245f3b1
.xword 0x324122d667d24535
.xword 0xcc9e4d7aff5d98ac
.xword 0x655eb05b207f52ff
.xword 0x54256f3d36472c92
.xword 0xe4f7d3f2aa646a01
.xword 0x96bbe063fbc871f4
.xword 0x2ace94caeaf0690d




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
.xword 0x65da2a0eb5b695b5
.xword 0x7490073360483405
.xword 0x98d84779b28914c0
.xword 0x49b757d28c9a09af
.xword 0xac50870752a73588
.xword 0x6d28049f2485b77b
.xword 0x83ad3b7e2da6d8da
.xword 0x28827f073bda868e




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
.xword 0x6f70226bfbc8ec2e
.xword 0x92494b7943ec6b6c
.xword 0xc6333f55f3c79e2e
.xword 0x399be114cffb396c
.xword 0xaae12c694602d051
.xword 0x9a1893ac9a388496
.xword 0xa35d14fa3f95a0e3
.xword 0xb7115cb4f33bee1f




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
.xword 0x6c483c9d228351e2
.xword 0xef6b0dcb35328741
.xword 0x13316be7382652a1
.xword 0xcdcef2d6eb50402a
.xword 0x204450bb0e1eae43
.xword 0x7514cb8c05106475
.xword 0x76ad836597dec3c1
.xword 0xc54e2bbac2edfc92




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
.xword 0xcb99fd94ff8989bd
.xword 0xc0cc377a5f6e9af2
.xword 0x8b904df74342cd0d
.xword 0x4309601b11944db3
.xword 0x592301c8e6512415
.xword 0xf414340e39954e30
.xword 0x29df5db952694daf
.xword 0xbb0fc2f51dbf20aa




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
.xword 0x75c4a21cff276096
.xword 0xb46d75594231b0cf
.xword 0xd944fd6edbb73a9f
.xword 0x16459cd8b332cb8a
.xword 0x0cef4a256bc5a773
.xword 0x515105358c0fae17
.xword 0x5f307ed9219cd3e7
.xword 0x5c80e9e52d6d0554




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
.xword 0x4f00dc44502db850
.xword 0xb38e8361c2b4ca22
.xword 0x56dd65d4c42ca859
.xword 0x9dedccc68ac23ee6
.xword 0xfed4728c3c561a47
.xword 0x01c56c26dd4b650a
.xword 0x552e141d881bf019
.xword 0xa14b3eeee17a1912




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
.xword 0x809c84bb109cbd51
.xword 0x725770daca703090
.xword 0x31262e7625244891
.xword 0xb7f33348b7f3f134
.xword 0xa661349cf38f8956
.xword 0xa1b032f4dfc69438
.xword 0xad5b47db84a177f8
.xword 0x2a94e98ad7dde69c






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
.xword 0xd58473ec7b6cbadc
.xword 0xa26a97902d051c66
.xword 0x91d8ce2f4c0b8615
.xword 0x2b9c4eedf2d45236
.xword 0x1044c2d380687114
.xword 0x54127e16479f2b5d
.xword 0x32a79950487e5c4a
.xword 0xdc21fb669f52b162




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
.xword 0x7dfceaccca072821
.xword 0xcf3dd56a8363ce82
.xword 0x8951b82e526ad9d8
.xword 0x5169789fe0ef7aee
.xword 0xef3605a2911be01f
.xword 0x23a5fe4ce07e4cae
.xword 0x32d1ea55513f4fa1
.xword 0x36cef8e675c6fed2




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
.xword 0x93b22a718f67f9de
.xword 0xc3e40146f74044e0
.xword 0x594fb955ee363f4c
.xword 0x58e3e169bb3fa9a6
.xword 0x12b1257993377666
.xword 0x3ed28133d9e7766a
.xword 0x8739395d0c31e5f2
.xword 0xb98f044d16fda5b0




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
.xword 0x45fb1fa6c3fbfc0a
.xword 0xa7b70bebaf4c3b1d
.xword 0x74df5189e560ff63
.xword 0x1e904728d57c26ef
.xword 0x5367a04d27ba8e23
.xword 0xd34a09383af5b74c
.xword 0x599fc7d26d690c8d
.xword 0xdef516a7d412a070




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
.xword 0x43f9b348a81ca7b7
.xword 0xf742827e67f4a783
.xword 0x80e2f824c0d7f467
.xword 0xc3a944917275dc14
.xword 0xdb1b48243bac33f8
.xword 0x87a339317ff5f974
.xword 0xff1936579f52656c
.xword 0x2e587d6d7fd6a114




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
.xword 0x7ae22c9dc0c2770a
.xword 0xc155c8c382c4f769
.xword 0x9410641dd36e2c2b
.xword 0xb04bf103bddcc0b2
.xword 0x82566343e8aab24d
.xword 0x6ae8a64d7b8a0dee
.xword 0x189965962e487331
.xword 0x61afac1e56b15443




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
.xword 0x078372b9eb02edae
.xword 0x084c06d26a883cb2
.xword 0xce6f5465656400e9
.xword 0xe204df19fa2c0cb3
.xword 0x9692195cf6ff9163
.xword 0xca368e8cc727e2c6
.xword 0x9151d4846d03545d
.xword 0x6a6fb005bfd73022




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
.xword 0x35df3c828bd960b9
.xword 0xa490ed02b387a043
.xword 0x7076e780acf333d7
.xword 0x01580a26511a318f
.xword 0x7175cda43bc74fad
.xword 0xed7bc6c05d1a69a1
.xword 0x80521cd014fbc2c0
.xword 0x3e1e8d8cd77e0c58




#if 0
#endif
